# Source Memory Experiment (MATLAB / Psychtoolbox)

This repository contains the code and materials for a source memory experiment developed in MATLAB using Psychtoolbox. The experiment investigates participants’ memory for the *source* of studied information—specifically, whether a sentence was said by a lawyer or a doctor.

## Overview

Participants study sentences that are:
- Presented by either a **lawyer** or **doctor**
- Thematically related to **law**, **medicine**, or are **neutral**

Later, participants are tested on their memory for both the content and the source of the sentence.

## Contents

- `runexp.m`: Main script to run the experiment. To begin the experiment, enter this line to MATLAB command window and run:
  ```matlab
  runexp(99) % Replace 99 with any subject number.

- Multiple MATLAB scripts are included to support the experiment (e.g., setup, stimulus presentation, distraction task, mouse position).
- `instructions/`: Subfolder containing the instruction files shown to participants before they began the task.
- `sentences/`: Subfolder with several text files containing categorized sentences used in the experiment.
- `images/`: Contains two images (`doc` and `law`) representing the doctor and lawyer sources.
  
## Requirements
- MATLAB 
- Psychtoolbox 

## Usage
Make sure all files are in the same directory or properly pathed in MATLAB. Run the experiment by entering the following in the MATLAB Command Window:
```matlab
runexp(subject_number)
```

## Notes
Ensure that Psychtoolbox is installed and properly configured before running the experiment.
This experiment was created for academic research and should be modified accordingly if used for other purposes.
