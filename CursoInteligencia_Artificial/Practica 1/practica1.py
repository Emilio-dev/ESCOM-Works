from tkinter import *
from PIL import Image, ImageTk
import numpy as np

class Map:
    def __init__(self, filename):
        # Load the map from the file
        with open(filename, 'r') as f:
            lines = f.readlines()
            if lines[0].startswith('L'):
                self.map_type = 'labyrinth'
                self.map = [[cell for cell in line.strip()] for line in lines[1:]]
            else:
                self.map_type = 'terrain'
                self.map = [[int(cell) for cell in line.strip().split()] for line in lines[1:]]

        self.height = len(self.map)
        self.width = len(self.map[0])
        self.marks = np.zeros((self.height, self.width), dtype='object')

    def show_map(self):
        # Create a GUI window
        root = Tk()
        root.title("Map")

        # Create a canvas for displaying the map
        canvas = Canvas(root, width=self.width * 20, height=self.height * 20)
        canvas.pack()

        # Create an image from the map data
        image_data = np.zeros((self.height, self.width, 3), dtype='uint8')
        for y in range(self.height):
            for x in range(self.width):
                if self.map_type == 'labyrinth':
                    if self.map[y][x] == '#':
                        image_data[y][x] = (0, 0, 0)  # Black for walls
                    else:
                        image_data[y][x] = (255, 255, 255)  # White for roads
                else:
                    if self.map[y][x] == 0:
                        image_data[y][x] = (0, 255, 0)  # Green for grass
                    elif self.map[y][x] == 1:
                        image_data[y][x] = (255, 255, 255)  # White for sand
                    elif self.map[y][x] == 2:
                        image_data[y][x] = (128, 128, 128)  # Gray for rocks
                    elif self.map[y][x] == 3:
                        image_data[y][x] = (0, 0, 255)  # Blue for water

                # Add marks to the image
                if self.marks[y][x] == 'V':
                    image_data[y][x] = (255, 0, 0)  # Red for visited cells
                elif self.marks[y][x] == 'O':
                    image_data[y][x] = (255, 255, 0)  # Yellow for decision cells
                elif self.marks[y][x] == 'I':
                    image_data[y][x] = (0, 0, 0)  # Black for initial cell

        # Create a PhotoImage from the image data
        image = Image.fromarray(image_data, mode='RGB')
        photo_image = ImageTk.PhotoImage(image)

        # Display the PhotoImage on the canvas
        canvas.create_image(0, 0, anchor=NW, image=photo_image)

        # Start the GUI event loop
        root.mainloop()

    def get_terrain_type(self, x, y):
        if x < 0 or x >= self.width or y < 0 or y >= self.height:
            return None
        else:
            return self.map[y][x]

    def set_terrain_type(self, row, col, terrain_type):
        if self.map_type == 'labyrinth':
            self.map[row][col] = terrain_type
        elif self.map_type == 'terrain':
            self.map[row][col] = terrain_type
        self.show_map()

    def mark_position(self, row, col, mark_type):
        self.marks[row][col] = mark_type
        self.show_map()    