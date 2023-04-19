import time
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors
from matplotlib import patches
from matplotlib import collections as coll
from collections import defaultdict, deque

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
    ax.set_xticks(np.arange(0.5, map_array.shape[1], 1))
    ax.set_yticks(np.arange(0.5, map_array.shape[0], 1))
    ax.set_xticklabels(np.arange(0, map_array.shape[1], 1))
    ax.set_yticklabels(np.arange(0, map_array.shape[0], 1))
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

def movement(agente, map_data,movimientos,initial, objective):
    auxX,auxY= initial
    posX,posY = initial
    movement_cost = 0
    for movimiento in movimientos:
        if movimiento == 'left':
            auxX -= 1
        elif movimiento == 'right':
            auxX += 1
        elif movimiento == 'up':
            auxY += 1
        elif movimiento == 'down':
            auxY -= 1
        else:
            raise ValueError("Invalid movement character")
        terrain_type, mark_value, visible = get_terrain_type(map_data, auxX, auxY)
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

                    # add edge to graph
                    graph[(row, col)].append(((n_row, n_col), cost))
    return graph

def bfs(graph, start, end):
    # initialize the queue with the starting node
    queue = deque([(start, [])])
    # initialize a set to keep track of visited nodes
    visited = set()
    
    # continue searching while there are still nodes to explore
    while queue:
        # get the next node to explore and its path to the current point
        node, path = queue.popleft()
        # if this node is the ending node, we've found the shortest path
        if node == end:
            return path
        
        # mark this node as visited
        visited.add(node)
        
        # add all unvisited neighbors with non-zero cost to the queue
        for neighbor, cost in graph[node]:
            if neighbor not in visited and cost > 0:
                # append the neighbor to the path and add to the queue
                queue.append((neighbor, path + [neighbor]))
    
    # if we reach this point, there is no path from start to end
    return None



map_data=load_map('map.txt')
map_data,initial,objective=scan_map(map_data)
display_map(map_data)
agent_type,agent_movements=load_agent('agent.txt')
graph=create_graph(agent_type,map_data)

print(bfs(graph, initial, objective))


