import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                const Text(
                  '새로운 미션 추가',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: canSubmit ? _handleSubmit : null,
                  child: Text(
                    '완료', 
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
                const Text(
                  '추천 미션 목록',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '건강한 하루를 위한 추천 미션들입니다.',
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
                        '✨ 전체',
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
                          '${_categoryIcons[category]} ${_getCategoryName(category)}',
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
                                  ? '✨ 전체 미션'
                                  : '${_categoryIcons[_selectedCategoryFilter!]} ${_getCategoryName(_selectedCategoryFilter!)} 미션',
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
                                      ? '전체 해제'
                                      : '전체 선택',
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
                        }),
                      ],
                    ),
                  ),
                
                const SizedBox(height: 24),
                Divider(color: isDark ? Colors.grey[800] : Colors.grey[200], thickness: 1),
                const SizedBox(height: 24),

                // 2. 내가 만든 미션 목록
                if (customMissions.isNotEmpty) ...[
                  const Text(
                    '내가 만든 목록',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '직접 만들었던 미션들을 다시 추가해보세요.',
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
                const Text(
                  '나만의 미션 만들기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '원하는 미션이 없다면 직접 만들어보세요.',
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
                    hintText: '미션 이름을 입력하세요 (예: 헬스장 가기)',
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
                const Text(
                  '카테고리 선택',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                            '${_categoryIcons[category]} ${_getCategoryName(category)}',
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
                          const Row(
                            children: [
                              Icon(Icons.notifications_outlined, size: 20),
                              SizedBox(width: 8),
                              Text('알림 받기', style: TextStyle(fontWeight: FontWeight.bold)),
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
                          onTap: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _alarmTime,
                              builder: (context, child) {
                                return Theme(
                                  data: isDark ? ThemeData.dark() : ThemeData.light().copyWith(
                                    colorScheme: const ColorScheme.light(primary: Colors.blueAccent),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (picked != null && picked != _alarmTime) {
                              setState(() {
                                _alarmTime = picked;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('알림 시간', style: TextStyle(fontSize: 14)),
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

  String _getCategoryName(MissionCategory category) {
    switch (category) {
      case MissionCategory.health: return '건강';
      case MissionCategory.study: return '학습';
      case MissionCategory.routine: return '루틴';
      case MissionCategory.hobby: return '취미';
      case MissionCategory.other: return '기타';
    }
  }
}
