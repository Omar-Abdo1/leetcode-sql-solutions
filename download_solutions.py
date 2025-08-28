import requests
import json
import os
import re

# === CONFIGURATION ===
LEETCODE_SESSION = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfYXV0aF91c2VyX2lkIjoiNTYyMTM4MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0NDM1NjdhZDkxNjAyZmQyZjNmMGMwMjg3NzQ5MTYxNmIyNjlmY2IwOTA5YTQ5NDBhNWZiYjY3YzE1NmJkODUiLCJzZXNzaW9uX3V1aWQiOiI0YmI0YTMyMyIsImlkIjo1NjIxMzgzLCJlbWFpbCI6Im9tYXJnYW1lcjEwYUBnbWFpbC5jb20iLCJ1c2VybmFtZSI6Im9tYXJnYW1lcjEwYSIsInVzZXJfc2x1ZyI6Im9tYXJnYW1lcjEwYSIsImF2YXRhciI6Imh0dHBzOi8vYXNzZXRzLmxlZXRjb2RlLmNvbS91c2Vycy9hdmF0YXJzL2F2YXRhcl8xNjc0NjEzNzE3LnBuZyIsInJlZnJlc2hlZF9hdCI6MTc1NjMwOTc0MiwiaXAiOiI0MS4zMy45My4xNjIiLCJpZGVudGl0eSI6IjhmNjk0NjA5YmRkYzQ5MDNiOGU4ZmVlNTBkNzgzY2MxIiwiZGV2aWNlX3dpdGhfaXAiOlsiMjkxNmFhNTgxZmYyYjI3MjQxZTg3MzBhZjQyZTg3OWYiLCI0MS4zMy45My4xNjIiXX0.CcwPE2JFtDKarhc3nMFMmCnZc3HxtqchH1n46lp8Cb8"
OUTPUT_FOLDER = "leetcode-sql-solutions"

# === DO NOT EDIT BELOW THIS LINE ===
headers = {
    'Cookie': f'LEETCODE_SESSION={LEETCODE_SESSION}',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
}

def get_submissions():
    print("Fetching your submissions...")
    url = "https://leetcode.com/api/submissions/"
    submissions = []
    offset = 0
    limit = 20
    
    while True:
        response = requests.get(f"{url}?offset={offset}&limit={limit}", headers=headers)
        if response.status_code != 200:
            print(f"Error: Failed to fetch submissions (status code: {response.status_code})")
            break
            
        data = response.json()
        if not data.get('submissions_dump'):
            break
            
        for submission in data['submissions_dump']:
            if (submission['status_display'] == 'Accepted' and 
                submission['lang'] in ['mssql', 'mysql']):
                submissions.append(submission)
        
        if not data.get('has_next'):
            break
            
        offset += limit
        print(f"Fetched {len(submissions)} submissions so far...")
    
    return submissions

def extract_problem_number(title):
    """Extract problem number from title"""
    match = re.search(r'^(\d+)\.', title)
    if match:
        return match.group(1).zfill(4)  # Pad with zeros to 4 digits
    return "0000"

def get_problem_difficulty_map():
    """Create a mapping of problem titles to difficulties"""
    print("Fetching problem difficulties...")
    url = "https://leetcode.com/api/problems/all/"
    response = requests.get(url, headers=headers)
    problem_map = {}
    
    if response.status_code == 200:
        data = response.json()
        for problem in data['stat_status_pairs']:
            title = problem['stat']['question__title']
            difficulty_level = problem['difficulty']['level']
            
            # Convert level to text
            if difficulty_level == 1:
                difficulty = 'easy'
            elif difficulty_level == 2:
                difficulty = 'medium'
            elif difficulty_level == 3:
                difficulty = 'hard'
            else:
                difficulty = 'unknown'
                
            problem_map[title] = difficulty
    
    return problem_map

def save_submissions(submissions):
    if not os.path.exists(OUTPUT_FOLDER):
        os.makedirs(OUTPUT_FOLDER)
    
    # Create difficulty folders
    for difficulty in ['easy', 'medium', 'hard', 'unknown']:
        os.makedirs(os.path.join(OUTPUT_FOLDER, difficulty), exist_ok=True)
    
    # Get problem difficulty mapping
    problem_difficulty_map = get_problem_difficulty_map()
    
    # Track unique problems
    unique_problems = set()
    saved_count = 0
    
    for sub in submissions:
        try:
            # Extract problem number and title
            title = sub.get('title', 'Unknown')
            title_slug = sub.get('title_slug', 'unknown')
            db_type = sub.get('lang', 'sql')
            
            # Extract problem number
            problem_number = extract_problem_number(title)
            
            # Get difficulty
            difficulty = problem_difficulty_map.get(title, 'unknown')
            
            # Create filename with proper numbering
            filename = f"{problem_number}-{title_slug}-{db_type}.sql"
            filepath = os.path.join(OUTPUT_FOLDER, difficulty, filename)
            
            # Skip if we've already saved this problem
            problem_key = f"{problem_number}-{title_slug}"
            if problem_key in unique_problems:
                continue
                
            unique_problems.add(problem_key)
            
            # Create file content
            content = f"""-- {sub.get('title', 'Unknown')}
-- {sub.get('url', '')}
-- Difficulty: {difficulty.capitalize()}
-- Database: {db_type.upper()}
-- Runtime: {sub.get('runtime', 'N/A')}, Memory: {sub.get('memory', 'N/A')}

{sub.get('code', '-- No code available')}

"""
            # Save file
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            
            saved_count += 1
            print(f"Saved: {filename}")
            
        except Exception as e:
            print(f"Error processing submission: {str(e)}")
            continue
    
    return saved_count

if __name__ == "__main__":
    if LEETCODE_SESSION == "PASTE_YOUR_LEETCODE_SESSION_COOKIE_HERE":
        print("ERROR: Please paste your LEETCODE_SESSION cookie in the script!")
        exit(1)
    
    submissions = get_submissions()
    print(f"Found {len(submissions)} accepted SQL solutions")
    
    if submissions:
        saved_count = save_submissions(submissions)
        print(f"Successfully saved {saved_count} unique solutions to the '{OUTPUT_FOLDER}' folder!")
        
        # Count by database type
        mssql_count = sum(1 for sub in submissions if sub.get('lang') == 'mssql')
        mysql_count = sum(1 for sub in submissions if sub.get('lang') == 'mysql')
        print(f"MSSQL solutions: {mssql_count}")
        print(f"MySQL solutions: {mysql_count}")
        
    else:
        print("No SQL solutions found!")