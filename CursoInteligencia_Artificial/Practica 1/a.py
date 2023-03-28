import numpy as np
import pygame
import os
os.environ['SDL_VIDEODRIVER'] = 'directx'


def load_matrix(matrix, colors):
    block_size = 30
    height, width = matrix.shape
    pygame.init()
    screen = pygame.display.set_mode((width * block_size, height * block_size))
    screen.fill((255, 255, 255))
    for y in range(height):
        for x in range(width):
            code = matrix[y][x]
            color = colors[code]
            rect = pygame.Rect(x * block_size, y * block_size, block_size, block_size)
            pygame.draw.rect(screen, color, rect)
    pygame.display.flip()
    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
    pygame.quit()

# Example usage:
terrain_colors = {
    0: (0.5, 0.5, 0.5),  # Mountain - gray
    1: (0.9, 0.8, 0.5),  # Land - tan
    2: (0, 0, 1),  # Water - blue
    3: (1, 1, 0.5),  # Sand - light yellow
    4: (0, 0.6, 0),  # Forest - green
}
matrix = np.array([
    [1, 1, 2, 2],
    [1, 1, 2, 2],
    [0, 0, 4, 4],
    [0, 0, 4, 4],
])
load_matrix(matrix, terrain_colors)