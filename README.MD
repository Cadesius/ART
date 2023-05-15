# ART
## The Archivist's Renaming Tool

ART is a small Batch script designed to make iteratively (re)naming large numbers of digital objects as simple as possible.

## Features

- (Re)names folders and files.
- Iteratively names each object, with an integer appended to an user defined reference code.
- Allows users to either overwrite or preserve the original filename.
- Puts a focus on simplicity and ease of use.
- Highly portable and ultra-lightweight, clocking in at under 200KB.

## Configuration

- ART's configuration options are virtually non-existent, mostly to maintain ease of use. All parameters are set as part of the program's execution.
- If you do want to change anything, download the source code and have a play with 'ART.BAT'. There's definitely room for a few tweaks and adjustments, if you can get past the odd codebase anyway...
- If you want considerably more control, I'd recommend learning the basics of Powershell and more specifically the 'Rename-Item' command, which will allow you to do everything that ART can, but with many more manual options.

## Usage

Here, we'll go over each step of the program, covering usage and limitations, as well as anything else you might want to bear in mind.

### Main Menu

- The 'Main Menu' is what you'll see when you launch ART, and acts as a portal to each of the program's functions.
- A brief explanation of each option:
    - 'A. Iterative file renaming'
        - Use this for renaming files.
    - 'B. Iterative folder renaming'