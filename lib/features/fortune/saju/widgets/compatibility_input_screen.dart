import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import for CupertinoDatePicker
import 'package:intl/intl.dart';
import '../models/saju_profile.dart';
import 'compatibility_result_screen.dart';
import '../../mixins/fortune_access_mixin.dart';

class CompatibilityInputScreen extends StatefulWidget {
  const CompatibilityInputScreen({super.key});

  @override
  State<CompatibilityInputScreen> createState() => _CompatibilityInputScreenState();
}

class _CompatibilityInputScreenState extends State<CompatibilityInputScreen> with FortuneAccessMixin {
  // My Profile
  final TextEditingController _myNameController = TextEditingController();
  DateTime _myBirthDate = DateTime(1990, 1, 1);
  TimeOfDay? _myBirthTime;
  String _myGender = 'male'; // male, female
  bool _myIsLunar = false;

  // Partner Profile
  final TextEditingController _partnerNameController = TextEditingController();
  DateTime _partnerBirthDate = DateTime(1990, 1, 1);
  TimeOfDay? _partnerBirthTime;
  String _partnerGender = 'female'; // male, female
  bool _partnerIsLunar = false;

  List<SajuProfile> _savedProfiles = [];

  @override
  void initState() {
    super.initState();
    _loadMyProfile();
    _loadSavedProfiles();
  }

  Future<void> _loadSavedProfiles() async {
    final profiles = await SajuProfile.loadProfiles();
    setState(() {
      _savedProfiles = profiles;
    });
  }

  Future<void> _loadMyProfile() async {
    final profile = await SajuProfile.loadProfile();
    if (profile != null) {
      setState(() {
        _myNameController.text = profile.name;
        _myBirthDate = profile.birthDate;
        _myGender = profile.gender;
        _myIsLunar = profile.isLunar;
        if (profile.birthTime != null && profile.birthTime != 'unknown') {
          final parts = profile.birthTime!.split(':');
          _myBirthTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
        }
        
        // Auto-set partner gender to opposite
        _partnerGender = _myGender == 'male' ? 'female' : 'male';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFF0F5); // Lavender Blush
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("궁합 보기", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "두 분의 정보를 입력해주세요",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "사주 정보를 바탕으로 정확한 궁합을 분석해드립니다.",
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // My Info Card
            _buildProfileCard(
              context,
              title: "나의 정보",
              nameController: _myNameController,
              birthDate: _myBirthDate,
              birthTime: _myBirthTime,
              gender: _myGender,
              isLunar: _myIsLunar,
              onDateChanged: (date) => setState(() => _myBirthDate = date),
              onTimeChanged: (time) => setState(() => _myBirthTime = time),
              onGenderChanged: (gender) => setState(() => _myGender = gender),
              onLunarChanged: (lunar) => setState(() => _myIsLunar = lunar),
              onProfileSelected: (profile) {
                setState(() {
                  _myNameController.text = profile.name;
                  _myBirthDate = profile.birthDate;
                  _myGender = profile.gender;
                  _myIsLunar = profile.isLunar;
                  if (profile.birthTime != null && profile.birthTime != 'unknown') {
                    final parts = profile.birthTime!.split(':');
                    _myBirthTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
                  } else {
                    _myBirthTime = null;
                  }
                });
              },
              onProfileDeleted: (profile) async {
                await SajuProfile.deleteProfile(profile);
                _loadSavedProfiles();
              },
              icon: Icons.person,
              color: const Color(0xFF64B5F6),
            ),

            const SizedBox(height: 20),
            
            const Icon(Icons.favorite, color: Colors.pinkAccent, size: 32),
            
            const SizedBox(height: 20),

            // Partner Info Card
            _buildProfileCard(
              context,
              title: "상대방 정보",
              nameController: _partnerNameController,
              birthDate: _partnerBirthDate,
              birthTime: _partnerBirthTime,
              gender: _partnerGender,
              isLunar: _partnerIsLunar,
              onDateChanged: (date) => setState(() => _partnerBirthDate = date),
              onTimeChanged: (time) => setState(() => _partnerBirthTime = time),
              onGenderChanged: (gender) => setState(() => _partnerGender = gender),
              onLunarChanged: (lunar) => setState(() => _partnerIsLunar = lunar),
              onProfileSelected: (profile) {
                setState(() {
                  _partnerNameController.text = profile.name;
                  _partnerBirthDate = profile.birthDate;
                  _partnerGender = profile.gender;
                  _partnerIsLunar = profile.isLunar;
                  if (profile.birthTime != null && profile.birthTime != 'unknown') {
                    final parts = profile.birthTime!.split(':');
                    _partnerBirthTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
                  } else {
                    _partnerBirthTime = null;
                  }
                });
              },
              onProfileDeleted: (profile) async {
                await SajuProfile.deleteProfile(profile);
                _loadSavedProfiles();
              },
              icon: Icons.person_outline,
              color: const Color(0xFFFF80AB),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: _validateAndAnalyze,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
                shadowColor: Colors.pinkAccent.withOpacity(0.4),
              ),
              child: const Text(
                "궁합 결과 보기",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context, {
    required String title,
    required TextEditingController nameController,
    required DateTime birthDate,
    required TimeOfDay? birthTime,
    required String gender,
    required bool isLunar,
    required Function(DateTime) onDateChanged,
    required Function(TimeOfDay?) onTimeChanged,
    required Function(String) onGenderChanged,
    required Function(bool) onLunarChanged,
    required Function(SajuProfile) onProfileSelected,
    required Function(SajuProfile) onProfileDeleted,
    required IconData icon,
    required Color color,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final hintColor = isDarkMode ? Colors.grey[600] : Colors.grey[400];
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Icon + Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          if (_savedProfiles.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              "저장된 정보 불러오기",
              style: TextStyle(fontSize: 12, color: color.withOpacity(0.8), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _savedProfiles.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final profile = _savedProfiles[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InputChip(
                      label: Text(profile.name),
                      labelStyle: TextStyle(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.grey[100],
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: color.withOpacity(0.3)),
                      ),
                      onPressed: () => onProfileSelected(profile),
                      onDeleted: () => onProfileDeleted(profile),
                      deleteIcon: Icon(Icons.close, size: 14, color: isDarkMode ? Colors.grey[500] : Colors.grey[600]),
                      deleteButtonTooltipMessage: "삭제",
                    ),
                  );
                },
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Name Field
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black26 : Colors.grey[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 10),
                  child: Text("이름", style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "이름을 입력하세요",
                    hintStyle: TextStyle(color: hintColor, fontSize: 15),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Gender Toggle
          _buildGenderSegment(
            context, 
            gender, 
            onGenderChanged, 
            isDarkMode
          ),
          const SizedBox(height: 24),

          // Date Picker Row
          Text(
            "생년월일",
            style: TextStyle(fontSize: 13, color: isDarkMode ? Colors.grey[400] : Colors.grey[600], fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _showCupertinoDatePicker(context, birthDate, onDateChanged),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat('yyyy.MM.dd').format(birthDate),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              // Lunar/Solar Toggle Pill
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black54 : Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleItem("양력", !isLunar, () => onLunarChanged(false), isDarkMode),
                    _buildToggleItem("음력", isLunar, () => onLunarChanged(true), isDarkMode),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32, thickness: 1),

          // Time Picker Row
          Text(
            "태어난 시간",
            style: TextStyle(fontSize: 13, color: isDarkMode ? Colors.grey[400] : Colors.grey[600], fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: birthTime != null 
                    ? () => _showCupertinoTimePicker(context, birthTime, onTimeChanged)
                    : null,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      birthTime != null 
                        ? birthTime.format(context) 
                        : "시간 모름",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: birthTime != null ? textColor : Colors.grey[400],
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              // Unknown Time Checkbox
              InkWell(
                onTap: () {
                  if (birthTime == null) {
                    onTimeChanged(const TimeOfDay(hour: 0, minute: 0));
                  } else {
                    onTimeChanged(null);
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: birthTime == null ? const Color(0xFFFFD700) : Colors.transparent,
                          border: Border.all(
                            color: birthTime == null ? const Color(0xFFFFD700) : Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: birthTime == null 
                            ? const Icon(Icons.check, size: 16, color: Colors.black) 
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "시간 모름",
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSegment(
    BuildContext context, 
    String currentGender, 
    Function(String) onChanged,
    bool isDarkMode,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black54 : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildGenderButton("남성", 'male', currentGender, onChanged, isDarkMode),
          ),
          Container(width: 1, height: 24, color: Colors.grey.withOpacity(0.3)),
          Expanded(
            child: _buildGenderButton("여성", 'female', currentGender, onChanged, isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderButton(
    String label, 
    String value, 
    String groupValue, 
    Function(String) onChanged,
    bool isDarkMode,
  ) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? (isDarkMode ? Colors.grey[700] : const Color(0xFFE8EAF6))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected) ...[
              const Icon(Icons.check, size: 16, color: Colors.indigo),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected 
                    ? (isDarkMode ? Colors.white : Colors.indigo)
                    : (isDarkMode ? Colors.grey[400] : Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(String label, bool isSelected, VoidCallback onTap, bool isDarkMode) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? (isDarkMode ? Colors.grey[800] : Colors.black87)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected 
                ? Colors.white 
                : (isDarkMode ? Colors.grey[400] : Colors.grey[600]),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _showCupertinoDatePicker(BuildContext context, DateTime initialDate, Function(DateTime) onConfirm) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 240,
        color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
        child: Column(
          children: [
            // Toolbar
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text("취소", style: TextStyle(color: Colors.redAccent)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text("생년월일 선택", 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    )
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text("확인", style: TextStyle(color: Colors.blueAccent)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            // Picker
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate,
                minimumDate: DateTime(1900),
                maximumDate: DateTime.now(),
                itemExtent: 40,
                onDateTimeChanged: (val) {
                  onConfirm(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCupertinoTimePicker(BuildContext context, TimeOfDay initialTime, Function(TimeOfDay) onConfirm) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Convert TimeOfDay to DateTime for initial value
    final now = DateTime.now();
    final initialDateTime = DateTime(now.year, now.month, now.day, initialTime.hour, initialTime.minute);

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 240,
        color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
        child: Column(
          children: [
            // Toolbar
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text("취소", style: TextStyle(color: Colors.redAccent)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text("태어난 시간 선택", 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    )
                  ),
                  CupertinoButton( 
                    padding: EdgeInsets.zero,
                    child: const Text("확인", style: TextStyle(color: Colors.blueAccent)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            // Picker
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: initialDateTime,
                use24hFormat: false,
                itemExtent: 40,
                onDateTimeChanged: (val) {
                  onConfirm(TimeOfDay.fromDateTime(val));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndAnalyze() {
    if (_myNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("나의 이름을 입력해주세요")),
      );
      return;
    }
    if (_partnerNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("상대방의 이름을 입력해주세요")),
      );
      return;
    }

    final myProfile = SajuProfile(
      name: _myNameController.text,
      gender: _myGender,
      birthDate: _myBirthDate,
      birthTime: _myBirthTime != null 
          ? "${_myBirthTime!.hour.toString().padLeft(2, '0')}:${_myBirthTime!.minute.toString().padLeft(2, '0')}" 
          : "unknown",
      isLunar: _myIsLunar,
    );

    final partnerProfile = SajuProfile(
      name: _partnerNameController.text,
      gender: _partnerGender,
      birthDate: _partnerBirthDate,
      birthTime: _partnerBirthTime != null 
          ? "${_partnerBirthTime!.hour.toString().padLeft(2, '0')}:${_partnerBirthTime!.minute.toString().padLeft(2, '0')}" 
          : "unknown",
      isLunar: _partnerIsLunar,
    );

    // 광고/쿠키 접근 다이얼로그 표시
    showFortuneAccessDialog(
      () {
        // 광고 시청 완료 또는 쿠키 사용 시 결과 화면으로 이동
        _navigateToResult(myProfile, partnerProfile);
      },
      onDirectAccess: () {
        // 이미 권한이 있는 경우 (패스권 등)
        _navigateToResult(myProfile, partnerProfile);
      },
    );
  }

  void _navigateToResult(SajuProfile myProfile, SajuProfile partnerProfile) {
    // 프로필 저장 (나중에 재사용 가능하도록)
    SajuProfile.saveProfile(myProfile);
    SajuProfile.saveProfile(partnerProfile);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompatibilityResultScreen(
          myProfile: myProfile,
          partnerProfile: partnerProfile,
        ),
      ),
    );
  }
}
