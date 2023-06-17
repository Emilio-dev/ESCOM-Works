import numpy as np

def separate_data(filename, separator):
    data = []
    max_columns = 0  # Track the maximum number of columns
    
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()  # Remove leading/trailing whitespace
            if line:
                row = line.split(separator)
                converted_row = []
                for value in row:
                    try:
                        converted_value = int(value) if '.' not in value else float(value)
                        converted_row.append(converted_value)
                    except ValueError:
                        converted_row.append(value)
                data.append(converted_row)
                max_columns = max(max_columns, len(converted_row))
    
    # Fill missing columns with "NULL"
    for row in data:
        if len(row) < max_columns:
            row.extend(["NULL"] * (max_columns - len(row)))
    
    num_rows = len(data)
    num_columns = max_columns
    
    return data, num_rows, num_columns

def getVector(data,row,positions):
  if row<0 or row >= len(data):
    print("invalun row index")
    return None
  row_data = data[row]  
  result = [row_data[position] for position in positions]
  return result

def present_data(data,num_rows,num_columns):
  print("Data:")
  for row in data:
    print(row)
  print("Number of rows: ",num_rows)
  print("Number of columns: ",num_columns)

def analyze_data(data):
    num_columns = len(data[0])

    for i in range(num_columns):
        column_data = [row[i] for row in data]
        column_type = None
        numeric_count = 0
        column_counts = {}

        for value in column_data:
            if isinstance(value, (int, float)):
                numeric_count += 1
                column_counts.setdefault(value, 0)
                column_counts[value] += 1
            else:
                column_counts.setdefault(value, 0)
                column_counts[value] += 1

        if numeric_count >= len(column_data) / 2:  # Majority are numeric
            column_type = "Quantitative"
        else:
            column_type = "Qualitative"

        print(f"Column {i+1}: {column_type}")
        print(f"Entries: {len(column_data)}")

        if column_type == "Quantitative":
            print(f"Distinct Values: {len(column_counts)}")
            if numeric_count > 0:
                print(f"Min Value: {min(value for value in column_data if isinstance(value, (int, float)))}")
                print(f"Max Value: {max(value for value in column_data if isinstance(value, (int, float)))}")
                print(f"Mean Value: {sum(value for value in column_data if isinstance(value, (int, float))) / numeric_count}")
            else:
                print("Min Value: N/A")
                print("Max Value: N/A")
                print("Mean Value: N/A")
        else:
            print(f"Distinct Values: {len(column_counts)}")
            print("Value Counts:")
            for value, count in column_counts.items():
                print(f"{value}: {count} entries")

        print()

file="iris.txt"
separator=","
data,num_rows,num_columns=separate_data(file,separator)
present_data(data,num_rows,num_columns)
analyze_data(data)
vector=getVector(data,1,[1,3,4])
print(vector)
