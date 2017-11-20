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
1. If continuing a previous localization: load the existing coordinates
   from a JSON coordinate file using the "Load Coordinates" button.
2. Press "Define leads" to set the names, shapes, types, and microcontacts
   for each implanted lead.
3. Select the lead you wish to localize in the dropdown menu labeled "Label"
   in the upper left corner
4. Click on the CT to highlight the next contact on that lead, then press
   "Submit" to mark its location
   - Alternatively, press the "Seeding" button to turn on seeding. VoxTool
     will attempt to extrapolate the locations of the remaing contacts
     after the first two have been marked. Be sure to double-check that
     the results make sense, as occasionally two contacts
     will be given the same location
   - Alternatively for grids, submit the corners of the grid, then press
     the "Interpolate" button. VoxTool will attempt to fill in the grid.
     It may not be completely successful. Pressing "Interpolate" again
     may interpolate additional contacts.
5. Press "Add Micro-Contacts" to add micro-contacts to any macro/micro leads.
6. Press the "Save as" button to save the list of localized contacts.
   If the checkbox labelled "Include Bipolar Pairs" is checked, locations
   will also be saved for the midpoint of each pair of neighboring contacts.



## Keyboard Shortcuts:

Button | Key Sequence
------ |  ------------
Submit (contact panel) | S
Load Scan | Ctrl-O
Define Leads | Ctrl-D
Save As | Ctrl-S
