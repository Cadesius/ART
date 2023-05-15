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
- If you come up with useful alterations, please do fork the project! While I'm keeping this as simple as possible, an expanded version with more options would surely be welcomed by the community.

## Usage

Here, we'll go over each step of the program, covering usage and limitations, as well as anything else you might want to bear in mind.

You can run the program by either downloading the latest release executable, or by downloading the repository and running 'ART.BAT'.

### Main Menu

<details>

***<summary>Click here to preview menu screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

MAIN MENU
Please select an option:

A. Iterative file renaming
B. Iterative folder renaming
C. Print help documentation (Recommended for first time users!)
D. Quit the program

Enter option:
```

</details>

- The 'Main Menu' is what you'll see when you launch ART, and acts as a portal to each of the program's functions.
- Simply press the alphabetic key that corresponds with each option to select it.
- A brief explanation of each option:
    - 'A. Iterative file renaming'
        - Use this for (re)naming files.
    - 'B. Iterative folder renaming'
        - Use this for (re)naming folders.
    - 'C. Print help documentation'
        - Use this to print this documentation in an interactive format.
    - 'D. Quit the program'
        - Exits the program. Of note; ART does not save any data between each instance of the program. Once it's closed, any data stored will be lost.
- Below is a more detailed look at the workflow for the iterative naming process.

### Files and Folders

- The first option given to the user is between renaming files and folders.
- It's useful to make the distinction, since the process is slightly different for each one.
- There is currently no way to rename both files and folders at the same time.
- Objects are only renamed in the directory chosen, and this does not extend to sub-directories.
    - *For those interested, recursive renaming is not possible, as renaming a folder obviously changes the path of all subfolders and files within it. While I'm sure there's a way to reverse scan the hierarchy, this is broadly outside the scope of this project.*