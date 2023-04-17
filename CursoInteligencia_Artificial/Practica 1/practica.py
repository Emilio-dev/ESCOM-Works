import time
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors
from matplotlib import patches
from matplotlib import collections as coll

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
    0: ' ',
    1: 'V',
    2: 'I',
    3: 'D',
    4: 'C',
    5: 'X'
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

    # iterate over the input array and create a colored patch for each terrain type
    for i in range(map_array.shape[0]):
        for j in range(map_array.shape[1]):
            terrain_type, mark_value, visible = map_array[i, j]

            if visible == 0:
                # if the cell is not visible, color it black
                display_array[i, j] = patches.Rectangle((j, i), 1, 1, linewidth=1, edgecolor='black', facecolor='black')
            else:
                # otherwise, color it according to the terrain type
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
        raise ValueError("Invalid terrain type")
    
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
        type = file.readline().strip()
        # read the remaining lines into a NumPy array
        agents_movement = np.array(file.readline().strip().split(','))
        
    return type, agents_movement

def scan_map(map_data) :
    for row in range(map_data.shape[0]):
        for col in range(map_data.shape[1]):
            terrain_type, mark_value, visible = map_data[row, col]
            visible = 1
            if mark_value == 'X':
                initial = (row, col)
            elif mark_value == 'O':
                objective = (row, col)
            map_data[row, col] = (terrain_type, mark_value, visible)

    return map_data,initial,objective

def movement(agente, map_data,movimientos,initial, objective):
    aux = initial
    pos = initial
    movement_cost = 0
    for movimiento in movimientos:
        if movimiento == 'Left':
            aux[0] -= 1
        elif movimiento == 'Right':
            aux[0] += 1
        elif movimiento == 'Up':
            aux[1] -= 1
        elif movimiento == 'Down':
            aux[1] += 1
        else:
            raise ValueError("Invalid movement character")
        terrain_type, mark_value, visible = get_terrain_type(map_data, aux[0], aux[1])
        # Get the movement cost for the current terrain type   
        movement_cost += agents_movement_cost[(agente, terrain_type)]
        # Mark the current position as visited
        map_data = mark_positions(map_data, [((aux[0], aux[1]), 'current'),((pos[0], pos[1]), 'visited')])
        # Display the map
        display_map(map_data)
        pos=aux
        # Wait for 0.5 seconds
        time.sleep(0.5)

    return  

map_data=load_map('map.txt')
display_map(map_data)
tipo, agents_movement = load_agent('agent.txt')
map_data,initial,objective = scan_map(map_data)
movement(tipo, map_data, agents_movement,initial, objective)