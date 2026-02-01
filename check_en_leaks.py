import json
import os

def check_english_leaks(directory, en_file='app_en.arb', ko_file='app_ko.arb'):
    en_path = os.path.join(directory, en_file)
    with open(en_path, 'r', encoding='utf-8') as f:
        en_data = json.load(f)
    
    arb_files = [f for f in os.listdir(directory) if f.endswith('.arb') and f not in [en_file, ko_file]]
    
    results = {}
    for arb_file in arb_files:
        path = os.path.join(directory, arb_file)
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        leaked_keys = []
        for key, value in data.items():
            if key.startswith('@'): continue
            
            # Skip short technical terms or uppercase terms
            if len(value) <= 3 or value.isupper(): continue
            
            if value == en_data.get(key) and value != "":
                leaked_keys.append((key, value))
        
        if leaked_keys:
            results[arb_file] = leaked_keys
            
    return results

if __name__ == "__main__":
    l10n_dir = r'c:\Snap Alarm\lib\l10n'
    results = check_english_leaks(l10n_dir)
    
    if not results:
        print("No suspicious English leaks found.")
    for file, keys in results.items():
        print(f"--- {file} ---")
        for key, val in keys:
            print(f"  {key}: {val}")
