import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'tojeong_service.dart';

class TojeongScreen extends StatefulWidget {
  const TojeongScreen({super.key});

  @override
  State<TojeongScreen> createState() => _TojeongScreenState();
}

class _TojeongScreenState extends State<TojeongScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime _birthDate = DateTime(1990, 1, 1);
  bool _isLunar = true; // Default to Lunar for Tojeong
  
  // Result State
  Map<String, int>? _resultGua;
  String? _resultText;
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFF2F4F6);
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(l10n.tojeongResultTitle(2026)),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_showResult) _buildInputForm(cardColor, textColor, l10n),
            if (_showResult) _buildResultView(cardColor, textColor, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildInputForm(Color cardColor, Color textColor, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                l10n.sajuSelectBirthDate,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.tojeongInputGuide,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            
            // Name Input
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "${l10n.sajuNameLabel} (${l10n.optional})",
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20),

            // Date Selection
            InkWell(
              onTap: () => _selectDate(context, l10n),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(_birthDate),
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                    const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Lunar Checkbox
            Row(
              children: [
                Checkbox(
                  value: _isLunar,
                  onChanged: (val) {
                    setState(() {
                      _isLunar = val ?? true;
                    });
                  },
                  activeColor: const Color(0xFF11998e),
                ),
                Text(l10n.sajuLunar, style: TextStyle(color: textColor)),
              ],
            ),
            if (!_isLunar)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  "* ${l10n.sajuSolarHint}",
                  style: TextStyle(fontSize: 12, color: Colors.red[400]),
                ),
              ),

            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _calculateFortune,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF11998e),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    l10n.tojeongCheckButton,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView(Color cardColor, Color textColor, AppLocalizations l10n) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
              child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  l10n.tojeongResultTitle(2026),
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _nameController.text.isEmpty ? l10n.yourFortune : l10n.tojeongUserFortune(_nameController.text, 2026),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              const SizedBox(height: 24),
              
              // Gua Code Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGuaCircle(l10n.guaUpper, _resultGua!['upper']!),
                  const SizedBox(width: 16),
                  _buildGuaCircle(l10n.guaMiddle, _resultGua!['middle']!),
                  const SizedBox(width: 16),
                  _buildGuaCircle(l10n.guaLower, _resultGua!['lower']!),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "${l10n.guaCode}: ${_resultGua!['code']}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF11998e)),
              ),
              
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 20),
              
              Text(
                _resultText ?? "",
                style: TextStyle(fontSize: 16, height: 1.6, color: textColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            setState(() {
              _showResult = false;
            });
          },
          child: Text(l10n.viewAgain, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ),
      ],
    );
  }

  Widget _buildGuaCircle(String label, int value) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF11998e).withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF11998e), width: 2),
          ),
          child: Text(
            "$value",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF11998e)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  void _calculateFortune() {
    if (_formKey.currentState!.validate()) {
      // Use service to calculate
      final result = TojeongService.calculateGua(
        _birthDate.year,
        _birthDate.month,
        _birthDate.day,
      );
      
      final text = TojeongService.getFortuneText(result['code']!);

      setState(() {
        _resultGua = result;
        _resultText = text;
        _showResult = true;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, AppLocalizations l10n) async {
    DateTime tempPickedDate = _birthDate;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    await showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext builder) {
        return SafeArea(
          child: SizedBox(
            height: 240,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text(l10n.cancel, style: const TextStyle(color: Colors.red)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(l10n.sajuSelectBirthDate, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black)),
                    CupertinoButton(
                      child: Text(l10n.confirm, style: const TextStyle(color: Colors.blue)),
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
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _birthDate,
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    itemExtent: 40,
                    onDateTimeChanged: (DateTime newDate) {
                      tempPickedDate = newDate;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
