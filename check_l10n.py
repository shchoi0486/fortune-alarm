import json
import os
import re

def check_arb_files(directory, base_file='app_ko.arb'):
    base_path = os.path.join(directory, base_file)
    with open(base_path, 'r', encoding='utf-8') as f:
        base_data = json.load(f)
    
    base_keys = set(base_data.keys())
    
    arb_files = [f for f in os.listdir(directory) if f.endswith('.arb') and f != base_file]
    
    report = {}

    for arb_file in arb_files:
        path = os.path.join(directory, arb_file)
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        current_keys = set(data.keys())
        
        missing_keys = base_keys - current_keys
        extra_keys = current_keys - base_keys
        
        placeholder_errors = []
        for key in base_keys & current_keys:
            if key.startswith('@'): continue
            
            base_val = base_data[key]
            curr_val = data[key]
            
            if not isinstance(base_val, str) or not isinstance(curr_val, str): continue
            
            base_placeholders = set(re.findall(r'\{([^}]+)\}', base_val))
            curr_placeholders = set(re.findall(r'\{([^}]+)\}', curr_val))
            
            if base_placeholders != curr_placeholders:
                placeholder_errors.append({
                    'key': key,
                    'base': list(base_placeholders),
                    'target': list(curr_placeholders)
                })
        
        report[arb_file] = {
            'missing': list(missing_keys),
            'extra': list(extra_keys),
            'placeholder_errors': placeholder_errors
        }
    
    return report

if __name__ == "__main__":
    l10n_dir = r'c:\Snap Alarm\lib\l10n'
    results = check_arb_files(l10n_dir)
    
    for file, res in results.items():
        print(f"--- {file} ---")
        if res['missing']:
            print(f"Missing keys ({len(res['missing'])}): {res['missing'][:10]}...")
        if res['extra']:
            print(f"Extra keys ({len(res['extra'])}): {res['extra'][:10]}...")
        if res['placeholder_errors']:
            print(f"Placeholder errors: {res['placeholder_errors']}")
        if not res['missing'] and not res['extra'] and not res['placeholder_errors']:
            print("Perfectly matched!")
        print("\n")
