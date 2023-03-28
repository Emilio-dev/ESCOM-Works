import numpy as np
import pygame

terrain_colors = {
    0: (0.5, 0.5, 0.5),  # Mountain - gray
    1: (0.9, 0.8, 0.5),  # Land - tan
    2: (0, 0, 1),  # Water - blue
    3: (1, 1, 0.5),  # Sand - light yellow
    4: (0, 0.6, 0),  # Forest - green
}


def load_map(map_file):
    # read the map file and convert it into a 2D array of terrain codes
    with open(map_file, 'r') as f:
        map_data = [[int(x) for x in line.strip().split(',')] for line in f]

    # convert the 2D array into a numpy array for easier manipulation
    return np.array(map_data)


def display_map(matrix, terrain_colors):
    # Initialize Pygame
    square_size=30
    pygame.init()

    # Calculate the dimensions of the window based on the matrix size and square size
    window_width = len(matrix[0]) * square_size
    window_height = len(matrix) * square_size

    # Create the Pygame window
    screen = pygame.display.set_mode((window_width, window_height))

    # Loop through the matrix and draw each square on the window
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            terrain_code = matrix[i][j]
            color = pygame.Color(terrain_colors[terrain_code])
            rect = pygame.Rect(j * square_size, i * square_size, square_size, square_size)
            pygame.draw.rect(screen, color, rect)

    # Update the display and wait for the user to close the window
    pygame.display.flip()
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                return


def get_cell_info(map_file, x, y):
    # read the map file and convert it into a 2D array of terrain codes
    with open(map_file, 'r') as f:
        map_data = [[int(x) for x in line.strip().split(',')] for line in f]

    # convert the 2D array into a numpy array for easier manipulation
    map_array = np.array(map_data)

    # get the terrain code and corresponding terrain type for the given cell
    terrain_code = map_array[y, x]
    terrain_type = ''
    if terrain_code == 0:
        terrain_type = 'Mountain'
    elif terrain_code == 1:
        terrain_type = 'Land'
    elif terrain_code == 2:
        terrain_type = 'Water'
    elif terrain_code == 3:
        terrain_type = 'Sand'
    elif terrain_code == 4:
        terrain_type = 'Forest'

    # check if the cell is visible
    visible = False
    if x >= 0 and x < map_array.shape[1] and y >= 0 and y < map_array.shape[0]:
        visible = True

    # construct and return a dictionary with the cell information
    cell_info = {
        'x': x,
        'y': y,
        'terrain_type': terrain_type,
        'visible': visible
    }
    return cell_info

def edit_map(map_data,terrain_colors):

    def display_map():
        for y in range(len(map_data)):
            for x in range(len(map_data[y])):
                color = terrain_colors[map_data[y][x]]
                pygame.draw.rect(screen, color, (x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE))

    def get_terrain_type(coord):
        x, y = coord
        return map_data[y][x]

    def set_terrain_type(coord, terrain_type):
        x, y = coord
        map_data[y][x] = terrain_type

    TILE_SIZE = 30
    MAP_WIDTH = len(map_data[0]) * TILE_SIZE
    MAP_HEIGHT = len(map_data) * TILE_SIZE
    screen = pygame.display.set_mode((MAP_WIDTH, MAP_HEIGHT))

    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.MOUSEBUTTONUP:
                pos = pygame.mouse.get_pos()
                coord = (pos[0] // TILE_SIZE, pos[1] // TILE_SIZE)

                # Display terrain type information for clicked coordinate
                terrain_type = get_terrain_type(coord)
                print(f"Terrain type at {coord}: {terrain_type}")

                # Change terrain type for clicked coordinate
                if event.button == 1:  # Left click
                    set_terrain_type(coord, (terrain_type + 1) % len(terrain_colors))
                elif event.button == 3:  # Right click
                    set_terrain_type(coord, (terrain_type - 1) % len(terrain_colors))

        screen.fill((255, 255, 255))
        display_map()
        pygame.display.update()

pygame.init()
map_file = 'map.txt'
data=load_map(map_file)
display_map(data, terrain_colors)
pygame.quit()