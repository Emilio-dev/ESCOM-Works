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
    86: (0.5, 0, 0),  # visited - dark red
    79: (0, 0.5, 0.5),  # decision - teal
    73: (1, 0, 0),  # initial - red
    88: (0, 1, 0),  # current - bright green
}

terrain_labels = {
    0: 'Mountain',
    1: 'Land',
    2: 'Water',
    3: 'Sand',
    4: 'Forest'
}

def load_map(map_file):
    # read the map file and convert it into a 2D array of terrain codes
    with open(map_file, 'r') as f:
        map_data = [[int(x) for x in line.strip().split(',')] for line in f]

    # convert the 2D array into a numpy array for easier manipulation
    return np.array(map_data)

def display_map(map_array, marked_positions=None):
    # create a colormap from the terrain colors
    cmap = colors.ListedColormap([terrain_colors[i] for i in terrain_colors.keys()])

    # create a new figure and axis for the map plot
    fig, ax = plt.subplots(figsize=(10, 10))

    # create a new array for the map with the same shape as the input array, but with dtype=object
    display_array = np.empty(map_array.shape, dtype=object)

    # iterate over the input array and create a colored patch for each terrain type
    for i in range(map_array.shape[0]):
        for j in range(map_array.shape[1]):
            terrain_type = map_array[i, j]
            display_array[i, j] = patches.Rectangle((j, i), 1, 1, linewidth=1, edgecolor='black', facecolor=terrain_colors[terrain_type])

            if marked_positions is not None and (i, j) in marked_positions:
                # add a mark symbol if there is a marked position
                mark_symbol = mark_symbols[marked_positions[(i, j)]]
                mark_color = mark_colors[marked_positions[(i, j)]]
                ax.plot(j + 0.5, i + 0.5, marker=mark_symbol, markersize=10, markerfacecolor=mark_color, markeredgecolor=mark_color)

    # create a PatchCollection from the patch objects and add it to the plot axis
    pc = coll.PatchCollection(display_array.reshape(-1), match_original=True)
    ax.add_collection(pc)

    # set axis limits and labels
    ax.set_xlim(0, map_array.shape[1])
    ax.set_ylim(map_array.shape[0], 0)
    ax.set_xticks(np.arange(0.5, map_array.shape[1], 1))
    ax.set_yticks(np.arange(0.5, map_array.shape[0], 1))
    ax.set_xticklabels(np.arange(1, map_array.shape[1]+1, 1))
    ax.set_yticklabels(np.arange(1, map_array.shape[0]+1, 1))
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

    map_data[row, col] = new_type

    return map_data

def get_terrain_type(map_data, row, col):
    if not isinstance(map_data, np.ndarray):
        raise TypeError("map_data should be a numpy array")

    if row < 0 or row >= map_data.shape[0] or col < 0 or col >= map_data.shape[1]:
        raise ValueError("Invalid row or column index")

    if map_data[row, col] not in terrain_colors:
        raise ValueError("Invalid terrain type")
    
    return map_data[row, col]

def mark_positions(map_array, positions):
    tag_dict = {
        'visited': 'V',
        'decision': 'O',
        'initial': 'I',
        'current': 'X'
    }

    # Convert map_array to integer data type
    map_array = map_array.astype(int)

    # Create a copy of the map array to avoid modifying the original
    marked_map = np.copy(map_array)

    for pos, tag in positions:
        # Get the tag character based on the tag name
        tag_char = tag_dict.get(tag, '')

        # If a valid tag character was found, mark the position
        if tag_char:
            marked_map[pos[0], pos[1]] = ord(tag_char)

    return marked_map

map_data = load_map('map.txt')
display_map(map_data)
map_data=changeterrain_type(map_data, 0, 0, 1)
display_map(map_data)
get_terrain_type(map_data, 0, 0)
positions = [((1, 1), 'visited'), ((3, 3), 'decision'), ((5, 5), 'initial'), ((7, 7), 'current')]
map_data = mark_positions(map_data, positions)
display_map(map_data)
print(get_terrain_type(map_data, 1, 1))