import json
import os
import re

def has_korean(text):
    if not isinstance(text, str): return False
    return bool(re.search('[가-힣]', text))

def check_korean_in_others(directory, base_file='app_ko.arb'):
    arb_files = [f for f in os.listdir(directory) if f.endswith('.arb') and f != base_file]
    
    results = {}
    for arb_file in arb_files:
        path = os.path.join(directory, arb_file)
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        korean_keys = []
        for key, value in data.items():
            if key.startswith('@'): continue
            if has_korean(value):
                korean_keys.append((key, value))
        
        if korean_keys:
            results[arb_file] = korean_keys
            
    return results

if __name__ == "__main__":
    l10n_dir = r'c:\Snap Alarm\lib\l10n'
    results = check_korean_in_others(l10n_dir)
    
    if not results:
        print("No Korean characters found in non-Korean ARB files.")
    for file, keys in results.items():
        print(f"--- {file} ---")
        for key, val in keys:
            print(f"  {key}: {val}")
