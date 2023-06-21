import numpy as np
import math

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
    quant_matrix = []  # Matrix for quantitative columns
    qual_matrix = []  # Matrix for qualitative columns

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
            column_info = {
                'Type': column_type,
                'Entries': len(column_data),
                'Distinct Values': len(column_counts),
                'Min': min(value for value in column_data if isinstance(value, (int, float))),
                'Max': max(value for value in column_data if isinstance(value, (int, float))),
                'Mean': sum(value for value in column_data if isinstance(value, (int, float))) / numeric_count if numeric_count > 0 else 'N/A'
            }
            quant_matrix.append(column_info)
        else:
            column_type = "Qualitative"
            column_info = {
                'Type': column_type,
                'Entries': len(column_data),
                'Distinct Values': len(column_counts),
                'Value Counts': [f"{value}: {count} entries" for value, count in column_counts.items()]
            }
            qual_matrix.append(column_info)

    return quant_matrix, qual_matrix

def analyze_data(data):
    num_columns = len(data[0])
    quant_matrix = []  # Matrix for quantitative columns
    qual_matrix = []  # Matrix for qualitative columns

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
            column_info = {
                'Entries': len(column_data),
                'Distinct Values': len(column_counts),
                'Min': min(value for value in column_data if isinstance(value, (int, float))),
                'Max': max(value for value in column_data if isinstance(value, (int, float))),
                'Mean': sum(value for value in column_data if isinstance(value, (int, float))) / numeric_count if numeric_count > 0 else 'N/A'
            }
            quant_matrix.append([i+1, column_type] + list(column_info.values())[1:])
        else:
            column_type = "Qualitative"
            value_counts = [(value, count) for value, count in column_counts.items()]
            column_info = {
                'Entries': len(column_data),
                'Distinct Values': len(column_counts),
                'Value Counts': value_counts
            }
            qual_matrix.append([i+1, column_type] + list(column_info.values())[1:])

    return quant_matrix, qual_matrix

def calculate_class_means(data):
    class_means = {}

    for entry in data:
        # Extract the numerical values and class from each entry
        values = entry[:-1]
        class_name = entry[-1]

        # Initialize the mean list for the class if it doesn't exist
        if class_name not in class_means:
            class_means[class_name] = [0.0] * len(values)

        # Accumulate the sum of values for each column
        class_means[class_name] = [mean + value for mean, value in zip(class_means[class_name], values)]

    # Calculate the means by dividing the sums by the count of entries in each class
    for class_name in class_means:
        count = len([entry for entry in data if entry[-1] == class_name])
        class_means[class_name] = [mean / count for mean in class_means[class_name]]

    return class_means

def classify_data(class_means, heuristic_fn, unclassified_data):
    classified_data = []

    for entry in unclassified_data:
        # Calculate the distance between the entry and each class mean using the heuristic function
        distances = [(class_name, heuristic_fn(class_mean, entry)) for class_name, class_mean in class_means.items()]

        # Sort the distances in ascending order
        distances.sort(key=lambda x: x[1])

        # Assign the class with the minimum distance to the entry
        classified_entry = (entry, distances[0][0])
        classified_data.append(classified_entry)

    return classified_data

def classify_data_knn(class_means, heuristic_fn, unclassified_data, k):
    classified_data = []

    for entry in unclassified_data:
        # Calculate the distance between the entry and each class mean using the heuristic function
        distances = [(class_name, heuristic_fn(class_mean, entry)) for class_name, class_mean in class_means.items()]

        # Sort the distances in ascending order
        distances.sort(key=lambda x: x[1])

        # Select the k nearest neighbors
        nearest_neighbors = distances[:k]

        # Count the occurrences of each class in the nearest neighbors
        class_counts = {}
        for neighbor in nearest_neighbors:
            class_name = neighbor[0]
            class_counts[class_name] = class_counts.get(class_name, 0) + 1

        # Determine the class with the maximum count
        max_count = max(class_counts.values())
        best_classes = [class_name for class_name, count in class_counts.items() if count == max_count]

        # Assign the majority class to the entry
        classified_entry = (entry, best_classes)
        classified_data.append(classified_entry)

    return classified_data

def euclidean_distance(point1, point2):
    squared_distance = sum((p1 - p2) ** 2 for p1, p2 in zip(point1, point2))
    return math.sqrt(squared_distance)

unclassified_data = [
    [5.4, 3.9, 1.7, 0.4],
    [5.7, 2.8, 4.5, 1.3],
    [7.6, 3.0, 6.6, 2.1]
]


file="iris.txt"
separator=","
data,num_rows,num_columns=separate_data(file,separator)
#present_data(data,num_rows,num_columns)
#vector=getVector(data,1,[1,3,4])
#print(vector)
#aqui vamos
quant_matrix,qual_matrix=analyze_data(data)
mean_matrix=calculate_class_means(data)
#print_qualitative_matrix(qual)
#print_quantitative_matrix(quant)
print(mean_matrix)
classified_data=classify_data(mean_matrix,euclidean_distance,unclassified_data)
classified_data_knn=classify_data_knn(mean_matrix,euclidean_distance,unclassified_data,1)

for entry, class_name in classified_data:
    print(f"{entry} -> {class_name}")

for entry, class_name in classified_data_knn:
    print(f"{entry} -> {class_name}")

classified_data_knn=classify_data_knn(mean_matrix,euclidean_distance,unclassified_data,5)

for entry, class_name in classified_data:
    print(f"{entry} -> {class_name}")