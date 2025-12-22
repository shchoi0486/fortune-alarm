import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino for Wheel Pickers
import 'package:snap_alarm/features/fortune/saju/models/saju_profile.dart';
import 'tojeong_result_screen.dart';
import 'services/tojeong_service.dart';

class TojeongInputScreen extends StatefulWidget {
  const TojeongInputScreen({super.key});

  @override
  State<TojeongInputScreen> createState() => _TojeongInputScreenState();
}

class _TojeongInputScreenState extends State<TojeongInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  
  String _gender = 'male';
  DateTime _birthDate = DateTime(1990, 1, 1);
  TimeOfDay? _birthTime;
  bool _isUnknownTime = false;
  bool _isLunar = false;
  bool _isLoading = true;
  bool _isEditing = true; 
  int _targetYear = DateTime.now().year; 
  
  List<SajuProfile> _profiles = [];
  int _selectedProfileIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    final profiles = await SajuProfile.loadProfiles();
    if (profiles.isNotEmpty) {
      setState(() {
        _profiles = profiles;
        _selectedProfileIndex = 0; 
        _setFormData(profiles[0]);
        _isEditing = false;
      });
    } else {
      setState(() {
        _isEditing = true; 
      });
    }
    setState(() {
      _isLoading = false;
    });
  }
  
  void _setFormData(SajuProfile profile) {
    _nameController.text = profile.name;
    _gender = profile.gender;
    _birthDate = profile.birthDate;
    _isLunar = profile.isLunar; // Restore isLunar
    if (profile.birthTime != null && profile.birthTime != 'unknown') {
      final parts = profile.birthTime!.split(':');
      _birthTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      _isUnknownTime = false;
    } else {
      _isUnknownTime = true;
      _birthTime = null;
    }
  }

  void _clearForm() {
    setState(() {
      _nameController.clear();
      _gender = 'male';
      _birthDate = DateTime(1990, 1, 1);
      _birthTime = null;
      _isUnknownTime = false;
      _isLunar = false; // Reset isLunar
    });
  }

  Future<void> _saveAndAnalyze() async {
    if (_formKey.currentState!.validate()) {
      final newProfile = SajuProfile(
        name: _nameController.text,
        gender: _gender,
        birthDate: _birthDate,
        birthTime: _isUnknownTime ? null : "${_birthTime?.hour ?? 0}:${_birthTime?.minute ?? 0}",
        isLunar: _isLunar, // Save isLunar
      );

      await SajuProfile.saveProfile(newProfile);
      await _loadProfiles();
      
      final index = _profiles.indexWhere((p) => p.name == newProfile.name);
      if (index >= 0) {
        setState(() {
          _selectedProfileIndex = index;
        });
      }

      setState(() {
        _isEditing = false;
      });

      if (mounted) {
        _analyzeProfile(newProfile);
      }
    }
  }
  
  void _analyzeSelected() {
    if (_profiles.isEmpty) return;
    _analyzeProfile(_profiles[_selectedProfileIndex]);
  }

  void _analyzeProfile(SajuProfile profile) {
    final result = TojeongService.calculate(profile, _targetYear);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TojeongResultScreen(
          profile: profile, 
          targetYear: _targetYear,
          result: result,
        ),
      ),
    );
  }

  Future<void> _confirmDelete(SajuProfile profile) async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
          title: Text(
            "사주 정보 삭제",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "${profile.name}님의 정보를 삭제하시겠습니까?",
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("취소", style: TextStyle(color: Colors.grey[500])),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("삭제", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (result == true) {
      await SajuProfile.deleteProfile(profile);
      await _loadProfiles();
    }
  }

  void _showTargetYearPicker() {
    final currentYear = DateTime.now().year;
    final years = List.generate(3, (index) => currentYear + index);
    int selectedIndex = years.indexOf(_targetYear);
    if (selectedIndex == -1) {
      selectedIndex = 0;
      _targetYear = years[0];
    }
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      builder: (BuildContext context) {
        return Container(
          height: 280, 
          color: backgroundColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CupertinoButton(
                    child: const Text('취소', style: TextStyle(fontSize: 18, color: Colors.red)), 
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text("운세 년도 선택", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: textColor)), 
                  CupertinoButton(
                    child: const Text('확인', style: TextStyle(fontSize: 18, color: Colors.blue)), 
                    onPressed: () {
                      setState(() {
                        _targetYear = years[selectedIndex];
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 50, 
                  scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: years.map((year) => Center(child: Text("$year년", style: TextStyle(fontSize: 24, color: textColor)))).toList(), 
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime tempPickedDate = _birthDate;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    
    await showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      builder: (BuildContext builder) {
        return Container(
          height: 300,
          color: backgroundColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('취소', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text("생년월일 선택", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
                  CupertinoButton(
                    child: const Text('확인', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      setState(() {
                        _birthDate = tempPickedDate;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _birthDate,
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      tempPickedDate = newDate;
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
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _birthTime ?? TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null && picked != _birthTime) {
      setState(() {
        _birthTime = picked;
        _isUnknownTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFF2F4F6);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('토정비결 정보 입력', style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: textColor,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "$_targetYear년\n토정비결을 확인해보세요",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "정확한 분석을 위해\n생년월일시를 입력해주세요.",
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),

              if (!_isEditing) _buildViewMode(isDarkMode) else _buildEditForm(isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewMode(bool isDarkMode) {
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final borderColor = isDarkMode ? Colors.grey[800]! : Colors.grey[300]!;
    final primaryColor = const Color(0xFF11998e); // Tojeong Theme Color
    final buttonTextColor = isDarkMode ? const Color(0xFF38ef7d) : primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: _showTargetYearPicker,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[800] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_month, color: primaryColor),
                const SizedBox(width: 8),
                Text(
                  "$_targetYear년 토정비결 보기",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const Spacer(),
                Icon(Icons.arrow_drop_down, color: textColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "사주 정보 선택",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _clearForm();
                setState(() {
                  _isEditing = true;
                });
              },
              icon: Icon(Icons.add, size: 16, color: buttonTextColor),
              label: Text("추가", style: TextStyle(color: buttonTextColor)),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
            boxShadow: [
              if (!isDarkMode)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Column(
            children: _profiles.asMap().entries.map((entry) {
              final index = entry.key;
              final profile = entry.value;
              final isSelected = _selectedProfileIndex == index;
              
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedProfileIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                            color: isSelected ? primaryColor : Colors.grey,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      profile.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      profile.gender == 'male' ? "남성" : "여성",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${profile.birthDate.year}.${profile.birthDate.month}.${profile.birthDate.day} ${profile.birthTime ?? '(시간 모름)'}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _setFormData(profile);
                                  setState(() {
                                    _isEditing = true;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "수정",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 12,
                                color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                              ),
                              TextButton(
                                onPressed: () => _confirmDelete(profile),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "삭제",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red[300],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (index < _profiles.length - 1)
                    Divider(height: 1, color: isDarkMode ? Colors.grey[800] : Colors.grey[200]),
                ],
              );
            }).toList(),
          ),
        ),
        
        const SizedBox(height: 32),
        
        ElevatedButton(
          onPressed: _analyzeSelected,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text(
            "토정비결 확인하기",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditForm(bool isDarkMode) {
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final borderColor = isDarkMode ? Colors.grey[800]! : Colors.grey[400]!;
    final inputFillColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final primaryColor = const Color(0xFF11998e);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Target Year Selection (Also in Edit Mode)
          InkWell(
            onTap: _showTargetYearPicker,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month, color: primaryColor),
                  const SizedBox(width: 8),
                  Text(
                    "$_targetYear년 토정비결 보기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_drop_down, color: textColor),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          
          // Name Input
          TextFormField(
            controller: _nameController,
            style: TextStyle(color: textColor), 
            decoration: InputDecoration(
              labelText: '이름',
              labelStyle: TextStyle(color: Colors.grey[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 2),
              ),
              filled: true,
              fillColor: inputFillColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이름을 입력해주세요';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Gender Selection
          Row(
            children: [
              Expanded(
                child: _buildGenderButton('남성', 'male', isDarkMode),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildGenderButton('여성', 'female', isDarkMode),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Lunar/Solar Toggle
          Row(
            children: [
              Text("양력/음력", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
              const Spacer(),
              CupertinoSlidingSegmentedControl<bool>(
                groupValue: _isLunar,
                children: const {
                  false: Text("양력"),
                  true: Text("음력"),
                },
                onValueChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      _isLunar = value;
                    });
                  }
                },
                thumbColor: primaryColor,
                backgroundColor: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Date Selection
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: inputFillColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_birthDate.year}년 ${_birthDate.month}월 ${_birthDate.day}일",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Icon(Icons.calendar_today, color: primaryColor),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Time Selection
          Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: _isUnknownTime ? null : () => _selectTime(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: _isUnknownTime ? (isDarkMode ? Colors.grey[800] : Colors.grey[200]) : inputFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _isUnknownTime
                              ? "시간 모름"
                              : (_birthTime != null
                                  ? "${_birthTime!.hour.toString().padLeft(2, '0')}:${_birthTime!.minute.toString().padLeft(2, '0')}"
                                  : "태어난 시간 선택"),
                          style: TextStyle(
                            fontSize: 16,
                            color: _isUnknownTime ? Colors.grey : textColor,
                          ),
                        ),
                        Icon(Icons.access_time, 
                          color: _isUnknownTime ? Colors.grey : primaryColor
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isUnknownTime = !_isUnknownTime;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: _isUnknownTime ? primaryColor : inputFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isUnknownTime ? primaryColor : borderColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "시간 모름",
                        style: TextStyle(
                          color: _isUnknownTime ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          
          // Submit Button
          ElevatedButton(
            onPressed: _saveAndAnalyze,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "저장하고 토정비결 보기",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          if (_isEditing && _profiles.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isEditing = false;
                    _setFormData(_profiles[_selectedProfileIndex]);
                  });
                },
                child: Text("취소", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGenderButton(String label, String value, bool isDarkMode) {
    final isSelected = _gender == value;
    final primaryColor = const Color(0xFF11998e);
    final selectedColor = primaryColor;
    final unselectedColor = isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    final borderColor = isDarkMode ? Colors.grey[800]! : Colors.grey[400]!;

    return InkWell(
      onTap: () {
        setState(() {
          _gender = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? selectedColor : borderColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
