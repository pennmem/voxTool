# VoxTool 2.0


## Setup

- Clone the repository from GitHub
- Create a Conda environment from the definition file
  ```
  conda env install -f conda_env.yml
  ```
  This creates an environment named `vt` in which to run voxTool.

## Running

- Activate the conda environment:
  ```
  source activate vt
  ```
- Launch the program:
  ```
  python launch_pyloc.py
  ```

## Usage
0. Load a CT file, adjusting the threshold as necessary. To adjust the
   threshold, change the number in the bar at the top of the window
   marked "CT Threshold", then press the "Update" button next to it.
2. If continuing a previous localization: load the existing coordinates
4. Press "Define leads" to set the names, shapes, types, and microcontacts
   for each implanted lead.
8.