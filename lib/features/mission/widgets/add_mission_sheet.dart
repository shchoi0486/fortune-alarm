import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../../core/constants/mission_category.dart';
import '../../../data/models/mission_model.dart';
import '../../../providers/mission_provider.dart';

class AddMissionSheet extends ConsumerStatefulWidget {
  final Function(String title, String icon, MissionCategory category, {bool? isCustom, String? id, String? alarmTime, bool? isAlarmEnabled}) onAdd;

  const AddMissionSheet({super.key, required this.onAdd});

  @override
  ConsumerState<AddMissionSheet> createState() => _AddMissionSheetState();
}

class _AddMissionSheetState extends ConsumerState<AddMissionSheet> {
  final _titleController = TextEditingController();
  MissionCategory _selectedCategory = MissionCategory.health;
  MissionCategory? _selectedCategoryFilter; // 추천 미션 필터용
  
  // 선택된 추천 미션들 (ID 기준이 아닌 타이틀 기준 or 모델 자체)
  final Set<MissionModel> _selectedRecommendedMissions = {};
  
  // 선택된 내가 만든 미션들
  final Set<MissionModel> _selectedCustomMissions = {};

  bool _isAlarmEnabled = false;
  TimeOfDay _alarmTime = const TimeOfDay(hour: 9, minute: 0);

  // 카테고리별 기본 아이콘 매핑
  final Map<MissionCategory, String> _categoryIcons = {
    MissionCategory.health: '💪',
    MissionCategory.study: '📚',
    MissionCategory.routine: '📅',
    MissionCategory.hobby: '🎨',
    MissionCategory.other: '✨',
  };

  @override
  void initState() {
    super.initState();
    _selectedCategoryFilter = null; // 초기 필터는 전체
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    int count = 0;

    // 1. 직접 입력한 미션 추가
    if (_titleController.text.trim().isNotEmpty) {
      widget.onAdd(
        _titleController.text.trim(),
        _categoryIcons[_selectedCategory]!,
        _selectedCategory,
        isCustom: true, // 직접 입력은 커스텀 미션
        alarmTime: _isAlarmEnabled ? '${_alarmTime.hour}:${_alarmTime.minute}' : null,
        isAlarmEnabled: _isAlarmEnabled,
      );
      count++;
    }

    // 2. 선택한 추천 미션들 추가
    for (var mission in _selectedRecommendedMissions) {
      widget.onAdd(
        mission.title,
        mission.icon,
        mission.category,
        isCustom: false,
        id: mission.id,
      );
      count++;
    }

    // 3. 선택한 내가 만든 미션들 추가
    for (var mission in _selectedCustomMissions) {
      widget.onAdd(
        mission.title,
        mission.icon,
        mission.category,
        isCustom: true, // 이미 커스텀이지만 다시 추가할 때도 커스텀 플래그 유지
      );
      count++;
    }

    if (count > 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final recommendedMissions = MissionNotifier.defaultMissions;
    final customMissions = ref.watch(missionProvider).customMissions;
    final allMissions = ref.watch(missionProvider).missions;
    final existingIds = allMissions.map((m) => m.id).toSet();
    
    // 기상 알람 미션 제외하고 추천 목록에 표시
    // (물 마시기, 영양제 등은 추천 목록에 나와야 함, 이미 추가된 미션은 제외)
    final displayRecommendedMissions = recommendedMissions
        .where((m) => m.id != 'wakeup' && !existingIds.contains(m.id))
        .toList();

    // 현재 선택된 필터에 따른 추천 미션 목록
    final filteredRecommendedMissions = _selectedCategoryFilter == null 
        ? displayRecommendedMissions 
        : displayRecommendedMissions.where((m) => m.category == _selectedCategoryFilter).toList();

    final bool canSubmit = _titleController.text.trim().isNotEmpty || 
                          _selectedRecommendedMissions.isNotEmpty ||
                          _selectedCustomMissions.isNotEmpty;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // 시스템 뒤로가기 버튼 등으로 인해 팝이 시도될 때의 처리가 필요하다면 여기서 수행
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.08),
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 핸들바
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // 헤더
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.addMissionTitle,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: canSubmit ? _handleSubmit : null,
                  child: Text(
                    l10n.complete, 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: canSubmit ? Colors.blueAccent : Colors.grey,
                    )
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 12),
                
                // 1. 추천 미션 섹션
                Text(
                  l10n.recommendedMissionList,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.recommendedMissionDesc,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                
                // 카테고리 필터 칩
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // '전체' 필터
                    ChoiceChip(
                      label: Text(
                        '✨ ${l10n.all}',
                        style: TextStyle(
                          color: _selectedCategoryFilter == null ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                          fontSize: 13,
                          fontWeight: _selectedCategoryFilter == null ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: _selectedCategoryFilter == null,
                      selectedColor: Colors.blueAccent,
                      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: _selectedCategoryFilter == null ? Colors.blueAccent : Colors.transparent,
                        ),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategoryFilter = null;
                          });
                        }
                      },
                    ),
                    ...MissionCategory.values.map((category) {
                      final isSelected = _selectedCategoryFilter == category;
                      return ChoiceChip(
                        label: Text(
                          '${_categoryIcons[category]} ${_getCategoryName(category, context)}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: Colors.blueAccent,
                        backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              _selectedCategoryFilter = category;
                            });
                          }
                        },
                      );
                    }),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // 필터링된 미션 리스트
                if (filteredRecommendedMissions.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[900]!.withOpacity(0.5) : Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 전체 선택 토글
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedCategoryFilter == null 
                                  ? '✨ ${l10n.allMissions}'
                                  : '${_categoryIcons[_selectedCategoryFilter!]} ${l10n.categoryMissions(_getCategoryName(_selectedCategoryFilter!, context))}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    final allSelected = filteredRecommendedMissions.every(
                                      (m) => _selectedRecommendedMissions.contains(m)
                                    );
                                    if (allSelected) {
                                      for (var m in filteredRecommendedMissions) {
                                        _selectedRecommendedMissions.remove(m);
                                      }
                                    } else {
                                      _selectedRecommendedMissions.addAll(filteredRecommendedMissions);
                                    }
                                  });
                                },
                                child: Text(
                                  filteredRecommendedMissions.every((m) => _selectedRecommendedMissions.contains(m))
                                      ? l10n.deselectAll
                                      : l10n.selectAll,
                                  style: const TextStyle(fontSize: 12, color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[200]),
                        ...filteredRecommendedMissions.map((mission) {
                          final isSelected = _selectedRecommendedMissions.contains(mission);
                          final isLast = mission == filteredRecommendedMissions.last;
                          return Column(
                            children: [
                              CheckboxListTile(
                                value: isSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedRecommendedMissions.add(mission);
                                    } else {
                                      _selectedRecommendedMissions.remove(mission);
                                    }
                                  });
                                },
                                title: Text(
                                  _getMissionTitle(mission, context),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                                secondary: Text(
                                  mission.icon,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                activeColor: Colors.blueAccent,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              if (!isLast)
                                Divider(
                                  height: 1, 
                                  indent: 56, 
                                  endIndent: 16,
                                  color: isDark ? Colors.grey[700] : Colors.grey[200],
                                ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                
                const SizedBox(height: 24),
                Divider(color: isDark ? Colors.grey[800] : Colors.grey[200], thickness: 1),
                const SizedBox(height: 24),

                // 2. 내가 만든 미션 목록
                if (customMissions.isNotEmpty) ...[
                  Text(
                    l10n.myCustomMissions,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.myCustomMissionsDesc,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[900]!.withOpacity(0.5) : Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                      ),
                    ),
                    child: Column(
                      children: customMissions.map((mission) {
                        final isSelected = _selectedCustomMissions.contains(mission);
                        final isLast = mission == customMissions.last;
                        return Column(
                          children: [
                            CheckboxListTile(
                              value: isSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedCustomMissions.add(mission);
                                  } else {
                                    _selectedCustomMissions.remove(mission);
                                  }
                                });
                              },
                              title: Text(
                                mission.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                              secondary: Text(
                                mission.icon,
                                style: const TextStyle(fontSize: 20),
                              ),
                              activeColor: Colors.blueAccent,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            if (!isLast)
                              Divider(
                                height: 1, 
                                indent: 56, 
                                endIndent: 16,
                                color: isDark ? Colors.grey[700] : Colors.grey[200],
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: isDark ? Colors.grey[800] : Colors.grey[200], thickness: 1),
                  const SizedBox(height: 24),
                ],

                // 3. 직접 입력 섹션
                Text(
                  l10n.createYourOwnMission,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.createYourOwnMissionDesc,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _titleController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: l10n.missionNameHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: isDark ? Colors.grey[800] : Colors.grey[100],
                    prefixIcon: const Icon(Icons.edit_outlined),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.selectCategory,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: MissionCategory.values.map((category) {
                      final isSelected = _selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            '${_categoryIcons[category]} ${_getCategoryName(category, context)}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                              fontSize: 13,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: Colors.blueAccent,
                          backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSelected ? Colors.transparent : (isDark ? Colors.grey[700]! : Colors.grey[300]!),
                            ),
                          ),
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 16),
                // 알림 설정
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.notifications_outlined, size: 20),
                              const SizedBox(width: 8),
                              Text(l10n.getNotification, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.85,
                            child: Switch(
                              value: _isAlarmEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _isAlarmEnabled = value;
                                });
                              },
                              activeColor: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      if (_isAlarmEnabled) ...[
                        const Divider(height: 1, thickness: 0.5),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                height: 300,
                                padding: const EdgeInsets.only(top: 6.0),
                                color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
                                child: SafeArea(
                                  top: false,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CupertinoButton(
                                            child: Text(l10n.cancel),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                          CupertinoButton(
                                            child: Text(l10n.confirm),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          initialDateTime: DateTime(2024, 1, 1, _alarmTime.hour, _alarmTime.minute),
                                          use24hFormat: false,
                                          onDateTimeChanged: (DateTime newDateTime) {
                                            setState(() {
                                              _alarmTime = TimeOfDay(hour: newDateTime.hour, minute: newDateTime.minute);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(l10n.notificationTime, style: const TextStyle(fontSize: 14)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: isDark ? Colors.grey[700] : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isDark ? Colors.white10 : Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Text(
                                    _alarmTime.format(context),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ),

                // 하단 여백 확보
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom + 100),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }

  String _getCategoryName(MissionCategory category, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case MissionCategory.health: return l10n.missionCategoryHealth;
      case MissionCategory.study: return l10n.missionCategoryStudy;
      case MissionCategory.routine: return l10n.missionCategoryRoutine;
      case MissionCategory.hobby: return l10n.missionCategoryHobby;
      case MissionCategory.other: return l10n.missionCategoryOther;
    }
  }

  String _getMissionTitle(MissionModel mission, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // 시스템 미션인 경우 번역된 타이틀 반환
    switch (mission.id) {
      case 'water_2l': return l10n.missionWater;
      case 'supplement': return l10n.missionSupplement;
      case 'wakeup': return l10n.missionWakeUp;
      case 'gym': return l10n.missionGym;
      case 'workout': return l10n.missionWorkout;
      case 'diary': return l10n.missionDiary;
      case 'bed_making': return l10n.missionBedMaking;
      case 'stretching': return l10n.missionStretching;
      case 'reading': return l10n.missionReading;
      case 'planning': return l10n.missionPlanning;
      case 'breakfast': return l10n.missionBreakfast;
      case 'meditation': return l10n.missionMeditation;
      case 'english_words': return l10n.missionLearnWords;
      case 'ventilation': return l10n.missionVentilation;
      case 'cleaning': return l10n.missionCleaning;
      case 'gratitude_diary': return l10n.missionGratitudeDiary;
      default: return mission.title;
    }
  }
}
