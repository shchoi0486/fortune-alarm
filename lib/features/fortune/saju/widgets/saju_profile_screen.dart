import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/saju_profile.dart';
import '../../../../providers/saju_provider.dart';

class SajuProfileScreen extends ConsumerStatefulWidget {
  const SajuProfileScreen({super.key});

  @override
  ConsumerState<SajuProfileScreen> createState() => _SajuProfileScreenState();
}

class _SajuProfileScreenState extends ConsumerState<SajuProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  
  String _gender = 'male';
  DateTime _birthDate = DateTime(1990, 1, 1);
  TimeOfDay? _birthTime;
  bool _isUnknownTime = true;
  bool _isLunar = false;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final mainProfile = ref.watch(sajuProvider).mainProfile;
      if (mainProfile != null) {
        _nameController.text = mainProfile.name;
        _gender = mainProfile.gender;
        _birthDate = mainProfile.birthDate;
        _isLunar = mainProfile.isLunar;
        if (mainProfile.birthTime != null && mainProfile.birthTime != 'unknown') {
          final parts = mainProfile.birthTime!.split(':');
          _birthTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
          _isUnknownTime = false;
        } else {
          _isUnknownTime = true;
        }
      }
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "대표 사주정보 수정",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("이름", textColor),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: textColor, fontSize: 18),
                decoration: InputDecoration(
                  hintText: "이름을 입력해주세요",
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: textColor)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.grey, size: 20),
                    onPressed: () => _nameController.clear(),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty ? "이름을 입력해주세요" : null,
              ),
              const SizedBox(height: 8),
              Text("한글 최대 6자", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              
              const SizedBox(height: 40),
              _buildLabel("성별", textColor),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildGenderButton("남자", 'male', isDarkMode)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenderButton("여자", 'female', isDarkMode)),
                ],
              ),
              
              const SizedBox(height: 40),
              _buildLabel("생년월일", textColor),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${_birthDate.year}.${_birthDate.month.toString().padLeft(2, '0')}.${_birthDate.day.toString().padLeft(2, '0')}",
                        style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.grey, size: 20),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      _buildLunarToggle(isDarkMode),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              _buildLabel("태어난 시간", textColor),
              const SizedBox(height: 16),
              InkWell(
                onTap: _isUnknownTime ? null : () => _selectTime(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _isUnknownTime 
                              ? "시간 모름" 
                              : "${_birthTime?.hour.toString().padLeft(2, '0') ?? '00'}:${_birthTime?.minute.toString().padLeft(2, '0') ?? '00'}",
                          style: TextStyle(
                            color: _isUnknownTime ? Colors.grey[400] : textColor, 
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isUnknownTime,
                            onChanged: (val) {
                              setState(() {
                                _isUnknownTime = val ?? true;
                                if (_isUnknownTime) _birthTime = null;
                              });
                            },
                            activeColor: const Color(0xFFFFF176),
                            checkColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          Text("시간 모름", style: TextStyle(color: textColor, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF176),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text("수정 완료", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Text(text, style: TextStyle(color: color.withOpacity(0.6), fontSize: 14));
  }

  Widget _buildGenderButton(String label, String value, bool isDarkMode) {
    final isSelected = _gender == value;
    return GestureDetector(
      onTap: () => setState(() => _gender = value),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected 
              ? (isDarkMode ? Colors.white.withOpacity(0.1) : const Color(0xFF2C2C2C)) 
              : (isDarkMode ? Colors.white.withOpacity(0.05) : const Color(0xFFF8F8F8)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? (isDarkMode ? Colors.white : Colors.white) : Colors.grey[500],
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildLunarToggle(bool isDarkMode) {
    return Row(
      children: [
        _buildToggleItem("양력", !_isLunar, isDarkMode, () => setState(() => _isLunar = false)),
        _buildToggleItem("음력", _isLunar, isDarkMode, () => setState(() => _isLunar = true)),
      ],
    );
  }

  Widget _buildToggleItem(String label, bool isSelected, bool isDarkMode, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? (isDarkMode ? Colors.white.withOpacity(0.2) : const Color(0xFF2C2C2C)) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    
    await showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext builder) {
        return Container(
          height: 240, // 300에서 240으로 축소하여 약 5개 항목만 보이도록 조정
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text('취소', style: TextStyle(color: Colors.red, fontSize: 16)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text("생년월일 선택", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
                    CupertinoButton(
                      child: const Text('확인', style: TextStyle(color: Colors.blue, fontSize: 16)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: textColor, fontSize: 18), // 폰트 크기 살짝 조정
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _birthDate,
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    itemExtent: 40, // 항목 간격을 넓혀서 더 명확하게 5개 위주로 보이게 함
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => _birthDate = newDate);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    
    // Convert TimeOfDay to DateTime for initial value
    final now = DateTime.now();
    final initialDateTime = DateTime(now.year, now.month, now.day, _birthTime?.hour ?? 0, _birthTime?.minute ?? 0);

    await showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext builder) {
        return Container(
          height: 240,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text('취소', style: TextStyle(color: Colors.red, fontSize: 16)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text("태어난 시간 선택", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
                    CupertinoButton(
                      child: const Text('확인', style: TextStyle(color: Colors.blue, fontSize: 16)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: textColor, fontSize: 18),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: initialDateTime,
                    itemExtent: 40,
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => _birthTime = TimeOfDay.fromDateTime(newDate));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final profile = SajuProfile(
        name: _nameController.text,
        gender: _gender,
        birthDate: _birthDate,
        birthTime: _isUnknownTime ? null : "${_birthTime?.hour ?? 0}:${_birthTime?.minute ?? 0}",
        isLunar: _isLunar,
      );
      ref.read(sajuProvider.notifier).saveProfile(profile);
      Navigator.pop(context);
    }
  }
}
