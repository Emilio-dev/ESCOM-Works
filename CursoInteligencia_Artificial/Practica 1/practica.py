import time
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors
from matplotlib import patches
from matplotlib import collections as coll
from collections import defaultdict, deque
import heapq
import random

terrain_colors = {
    0: (0.5, 0.5, 0.5),  # Mountain - gray
    1: (0.9, 0.8, 0.5),  # Land - tan
    2: (0, 0, 1),  # Water - blue
    3: (1, 1, 0.5),  # Sand - light yellow
    4: (0, 0.6, 0),  # Forest - green
    5: (0.5, 0.5, 0.5),  # Swamp - purple
    6: (0, 0, 0)  # snow - white
}

mark_symbols = {
    0: ' ', #empty
    1: 'V', #visited
    2: 'I', #initial
    3: 'D', #decision
    4: 'C', #current
    5: 'X'  #goal
}

agents_movement_cost = {
    ('human', 0): 0, # Human agent cost to traverse mountain terrain
    ('human', 1): 1, # Human agent cost to traverse land terrain
    ('human', 2): 2, # Human agent cost to traverse water terrain
    ('human', 3): 3, # Human agent cost to traverse sand terrain
    ('human', 4): 4, # Human agent cost to traverse forest terrain
    ('human', 5): 5, # Human agent cost to traverse swamp terrain
    ('human', 6): 5, # Human agent cost to traverse snow terrain

    ('monkey', 0): 0, # Monkey agent cost to traverse mountain terrain
    ('monkey', 1): 2, # Monkey agent cost to traverse land terrain
    ('monkey', 2): 4, # Monkey agent cost to traverse water terrain
    ('monkey', 3): 3, # Monkey agent cost to traverse sand terrain
    ('monkey', 4): 1, # Monkey agent cost to traverse forest terrain
    ('monkey', 5): 0, # Monkey agent cost to traverse swamp terrain
    ('monkey', 6): 0, # Monkey agent cost to traverse snow terrain 

    ('octopus', 0): 0, # Octopus agent cost to traverse mountain terrain
    ('octopus', 1): 2, # Octopus agent cost to traverse land terrain
    ('octopus', 2): 1, # Octopus agent cost to traverse water terrain
    ('octopus', 3): 0, # Octopus agent cost to traverse sand terrain
    ('octopus', 4): 3, # Octopus agent cost to traverse forest terrain
    ('octopus', 5): 2, # Octopus agent cost to traverse swamp terrain
    ('octopus', 6): 0, # Octopus agent cost to traverse snow terrain

    ('sasquatch', 0): 15, # sasquatch agent cost to traverse mountain terrain
    ('sasquatch', 1): 4, # sasquatch agent cost to traverse land terrain
    ('sasquatch', 2): 0, # sasquatch agent cost to traverse water terrain
    ('sasquatch', 3): 0, # sasquatch agent cost to traverse sand terrain
    ('sasquatch', 4): 4, # sasquatch agent cost to traverse forest terrain
    ('sasquatch', 5): 0, # sasquatch agent cost to traverse swamp terrain
    ('sasquatch', 6): 0, # sasquatch agent cost to traverse snow terrain
} 

def generar_mapa(n):
    # Crear una matriz vacía de tamaño n x n
    mapa = [[None] * n for _ in range(n)]
    
    # Llenar la matriz con valores aleatorios que cumplan las características
    for i in range(n):
        for j in range(n):
            # El valor y es 0, excepto en dos celdas que deben tener 2 y 5
            if (i == 0 and j == 1) or (i == n-1 and j == n-2):
                y = random.choice([2, 5])
            else:
                y = 0
                
            # El valor x es un entero entre 0 y 6, donde 0 representa una barrera
            x = random.randint(0, 6)
            
            # El valor z es 0 o 1
            z = random.randint(0, 1)
            
            # Guardar los valores en la celda correspondiente
            mapa[i][j] = (x, y, z)
            
    # Convertir la matriz a un array de numpy
    mapa_array = np.array(mapa)
    
    return mapa_array

def load_map(filename):
    with open(filename, 'r') as f:
        map_string = f.read()
    map_data = [[tuple(map(int, cell.split(':'))) for cell in row.split(',')] for row in map_string.split('\n') if row]
    return np.array(map_data)

def display_map(map_array):
    # create a colormap from the terrain colors
    cmap = colors.ListedColormap([terrain_colors[i] for i in terrain_colors.keys()])

    # create a new figure and axis for the map plot
    fig, ax = plt.subplots(figsize=(10, 10))

    # create a new array for the map with the same shape as the input array, but with dtype=object
    display_array = np.empty(map_array.shape, dtype=object)

    # iterate over the input array and create a colored patch for each terrain agent_type
    for i in range(map_array.shape[0]):
        for j in range(map_array.shape[1]):
            terrain_type, mark_value, visible = map_array[i, j]

            if visible == 0:
                # if the cell is not visible, color it black
                display_array[i, j] = patches.Rectangle((j, i), 1, 1, linewidth=1, edgecolor='black', facecolor='black')
            else:
                # otherwise, color it according to the terrain agent_type
                display_array[i, j] = patches.Rectangle((j, i), 1, 1, linewidth=1, edgecolor='black', facecolor=terrain_colors[terrain_type])

                if mark_value != 0:
                    # add a mark symbol if there is a mark value
                    mark_symbol = mark_symbols[mark_value]
                    ax.text(j + 0.5, i + 0.5, mark_symbol, fontsize=12, ha='center', va='center', color='black')

    # create a PatchCollection from the patch objects and add it to the plot axis
    pc = coll.PatchCollection(display_array.reshape(-1), match_original=True)
    ax.add_collection(pc)

    # set axis limits and labels
    ax.set_xlim(0, map_array.shape[1])
    ax.set_ylim(map_array.shape[0], 0)

    ax.set_xlabel('Column')
    ax.set_ylabel('Row')
    ax.set_title('Map')

    plt.show()

def changeterrain_type(map_data, row, col, new_type):

    if not isinstance(map_data, np.ndarray):
        raise TypeError("map_data should be a numpy array")

    if row < 0 or row >= map_data.shape[0] or col < 0 or col >= map_data.shape[1]:
        raise ValueError("Invalid row or column index")

    if new_type not in terrain_colors:
        raise ValueError("Invalid terrain agent_type")
    
    terrain_type, mark_value, visible = map_data[row, col] 
    terrain_type = new_type
    map_data[row, col] = (terrain_type, mark_value, visible)

    return map_data

def get_terrain_type(map_data, row, col):
    if not isinstance(map_data, np.ndarray):
        raise TypeError("map_data should be a numpy array")

    if row < 0 or row >= map_data.shape[0] or col < 0 or col >= map_data.shape[1]:
        raise ValueError("Invalid row or column index")
    
    return map_data[row, col]

def mark_positions(map_data, positions):
    tag_dict = {
        'unnmarked': 0,
        'visited': 1,
        'initial': 2,
        'decision': 3,
        'current': 4,
        'objective': 5
    }
   
    for pos, tag in positions:
        # Get the tag character based on the tag name
        tag_char = tag_dict.get(tag, '')

        # If a valid tag character was found, mark the position
        if tag_char:
            terrain_type, mark_value, visible = map_data[pos[0], pos[1]]
            mark_value = tag_char
            map_data[pos[0], pos[1]] = (terrain_type, mark_value, visible)

    return map_data

def load_agent(filename):
    with open(filename, 'r') as file:
        # read the first line into a variable
        agent_type = file.readline().strip()
        # read the remaining lines into a NumPy array
        agents_movement = np.array(file.readline().strip().split(','))
        
    return agent_type, agents_movement

def scan_map(map_data) :
    for row in range(map_data.shape[0]):
        for col in range(map_data.shape[1]):
            terrain_type, mark_value, visible = map_data[row, col]
            visible = 1
            if mark_value == 2:
                initial = (row, col)
            elif mark_value == 5:
                objective = (row, col)
            map_data[row, col] = (terrain_type, mark_value, visible)

    return map_data,initial,objective

def movement_controled(agente, map_data,movimientos,initial, objective):
    auxX,auxY= initial
    posX,posY = initial
    movement_cost = 0
    for movimiento in movimientos:
        print(movimiento)
        if movimiento == "left":
            auxX -= 1
        elif movimiento == "right":
            auxX += 1
        elif movimiento == "up":
            auxY += 1
        elif movimiento == "down":
            auxY -= 1
        else:
            raise ValueError("Invalid movement character")
        terrain_type, _, _ = get_terrain_type(map_data, auxX, auxY)
        # Get the movement cost for the current terrain agent_type   
        movement_cost += agents_movement_cost[(agente, terrain_type)]
        # Mark the current position as visited
        map_data = mark_positions(map_data, [((auxX, auxY), 'current'),((posX, posY), 'visited')])
        # Display the map
        display_map(map_data)
        posY = auxY
        posX = auxX
        # Wait for 0.5 seconds
        time.sleep(0.5)
        if (auxX, auxY) == objective:
            print("Objective found!")
            print("Total movement cost: {}".format(movement_cost))
            break
    return  

def create_graph(agent_type,map_data):
    graph = defaultdict(list)
    rows, cols, _ = map_data.shape

    for row in range(rows):
        for col in range(cols):
            cell = map_data[row, col]
            terrain, _, _ = cell

            # check neighboring cells
            for d_row, d_col in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                n_row, n_col = row + d_row, col + d_col
                if 0 <= n_row < rows and 0 <= n_col < cols:

                    # calculate cost to move from cell to neighbor
                    cost = agents_movement_cost[(agent_type, terrain)]
                    if cost == 0:
                        continue
                    # add edge to graph
                    graph[(row, col)].append(((n_row, n_col), cost))
    return graph

def bfs(graph, start, end):
    # initialize the queue with the starting node
    queue = deque([(start, [start], 0)])
    # initialize a set to keep track of visited nodes
    visited = set()
    # initialize lists to store the paths and their respective costs
    paths = []
    costs = []

    # continue searching while there are still nodes to explore
    while queue:
        # get the next node to explore and its path to the current point
        node, path, cost = queue.popleft()
        # if this node is the ending node, we've found a path
        if node == end:
            # store the path and its cost
            paths.append(path)
            costs.append(cost)

        # mark this node as visited
        visited.add(node)

        # add all unvisited neighbors with non-zero cost to the queue
        for neighbor, neighbor_cost in graph[node]:
            if neighbor not in visited and neighbor_cost > 0:
                # append the neighbor to the path, add to the cost and add to the queue
                queue.append((neighbor, path + [neighbor], cost + neighbor_cost))

    # if we reach this point, there is no path from start to end
    return paths,costs

def dfs(graph, start, end, path=[], cost=0, paths=[], costs=[]):
    # add the current node to the path
    path = path + [start]
    
    # if the current node is the end node, add the path and cost to the lists
    if start == end:
        paths.append(path)
        costs.append(cost)
    
    # for each neighbor of the current node, if it hasn't been visited, explore it
    for neighbor, neighbor_cost in graph[start]:
        if neighbor not in path and neighbor_cost > 0:
            dfs(graph, neighbor, end, path, cost + neighbor_cost, paths, costs)
    
    # return the lists of paths and costs
    return paths, costs

def astar(graph, start, end, heuristic):
    # initialize the priority queue with the starting node
    queue = [(heuristic(start, end), 0, start, [start])]
    # initialize a set to keep track of visited nodes
    visited = set()
    # initialize lists to store the paths and their respective costs
    paths = []
    costs = []

    # continue searching while there are still nodes to explore
    while queue:
        # get the next node with the minimum f-score to explore and its path to the current point
        _, cost, node, path = heapq.heappop(queue)
        # if this node is the ending node, we've found a path
        if node == end:
            # store the path and its cost
            paths.append(path)
            costs.append(cost)

        # mark this node as visited
        visited.add(node)

        # add all unvisited neighbors with non-zero cost to the queue
        for neighbor, neighbor_cost in graph[node]:
            if neighbor not in visited and neighbor_cost > 0:
                # append the neighbor to the path, add to the cost and add to the queue with updated f-score
                g_score = cost + neighbor_cost
                h_score = heuristic(neighbor, end)
                f_score = g_score + h_score
                heapq.heappush(queue, (f_score, g_score, neighbor, path + [neighbor]))

    # if we reach this point, there is no path from start to end
    return paths, costs

def manhattan_distance(current, goal):

    x1, y1 = current
    x2, y2 = goal
    return abs(x1 - x2) + abs(y1 - y2)

def decide(paths,costs):
    return paths[costs.index(min(costs))],min(costs)

def move_agent(map_data,path,objective,cost):
    prev_move = None
    for i in range(len(path)):
        current_move = path[i]
        if i == 0:
            prev_move = current_move
        else:    
            prev_move = path[i-1]
        map_data = mark_positions(map_data, [((current_move), 'current'),((prev_move), 'visited')])
        display_map(map_data)  # display the map
        time.sleep(0.5)  # wait for 0.5 seconds
    if objective == current_move:
        print("Objective found!")
        print("Total movement cost: {}".format(cost))
    else:
        print("Objective not found!")

def bfs_tree(graph, start):
    visited = set()
    queue = [start]
    bfs_tree = defaultdict(list)

    while queue:
        node = queue.pop(0)
        visited.add(node)
        for neighbor, cost in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
                bfs_tree[node].append((neighbor, cost))

    return bfs_tree

def dfs_tree(graph, start):
    visited = set()
    stack = [start]
    dfs_tree = defaultdict(list)

    while stack:
        node = stack.pop()
        visited.add(node)
        for neighbor, cost in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                stack.append(neighbor)
                dfs_tree[node].append((neighbor, cost))

    return dfs_tree

def print_tree(tree):
    for node, edges in tree.items():
        print(f"{node}:")
        for edge in edges:
            print(f"├── {edge}")
        if not edges:
            print("└──")


#para usar un mapa ya diseñado
map_data=load_map('map.txt')
#para crear un mapa aleatorio
#map_data=generar_mapa(15)
display_map(map_data)
map_data,initial,objective=scan_map(map_data)
while True:
    print("1. Solve by BFS")
    print("2. Solve by DFS")
    print("3. Solve by A*")
    print("4. Solve Manually")
    print("5. Exit")
    choice = input("Enter your choice: ")
    if(choice == "1" or choice == "2" or choice == "3"):
        agent_type = input("Enter the agent type: ")
        graph = create_graph(agent_type,map_data)
    if choice == "1":
        tree= bfs_tree(graph, initial)
        paths,costs = bfs(graph, initial, objective, manhattan_distance)
        path,cost = decide(paths,costs)
        move_agent(map_data,path,objective,cost) 
        print_tree(tree)
    elif choice == "2":
        paths,costs = dfs(graph, initial, objective, manhattan_distance)
        path,cost = decide(paths,costs)
        move_agent(map_data,path,objective,cost) 
        tree= dfs_tree(graph, initial)
        print_tree(tree)
    elif choice == "3":
        paths,costs = astar(graph, initial, objective, manhattan_distance)
        path,cost = decide(paths,costs)
        move_agent(map_data,path,objective,cost) 
    elif choice == "4":
        agent_type,agent_movements=load_agent('agent.txt')
        movement_controled(agent_type,map_data,agent_movements,initial,objective)
    elif choice == "5":
        print("Exiting the program...")
        break
    else:
        print("Invalid choice. Please try again.")




