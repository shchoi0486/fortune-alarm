allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

subprojects {
    afterEvaluate {
        tasks.withType<JavaCompile>().configureEach {
            options.compilerArgs.addAll(listOf("-nowarn", "-Xlint:none", "-XDsuppressNotes", "-XDsuppressWarnings"))
        }
    }
}

// 일부 플러그인(tflite_flutter, audioplayers_android 등)이 Java 8/11로
// 고정해서 release 빌드가 깨지므로, 전 프로젝트 평가 완료 후 JVM 타깃을
// 17로 강제 통일한다. (afterEvaluate는 플러그인 자체 설정에 덮어씌워지므로
// projectsEvaluated 시점에 적용해야 마지막으로 유효하다.)
// tflite_flutter 0.12.1은 Java 11 고정이면서 Kotlin 타깃이 기본값(JDK 17)을
// 따라가서 "Inconsistent JVM Target"으로 깨진다. 해당 모듈만 Kotlin 11로
// 맞춰준다. (전역 강제 금지: JavaCompile을 건드리면 구형 모듈의
// android.jar bootclasspath가 떨어져 나감 — 실측 확인됨)
subprojects {
    afterEvaluate {
        if (project.name == "tflite_flutter") {
            tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
                compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
            }
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
