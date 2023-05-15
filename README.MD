# ART
### The Archivist's Renaming Tool

ART is a small Batch script designed to make iteratively (re)naming large numbers of digital objects as simple as possible.

## Features

- (Re)names folders and files.
- Iteratively names each object, with an integer appended to an user defined reference code.
- Allows users to either overwrite or preserve the original filename.
- Puts a focus on simplicity and ease of use.
- Highly portable and ultra-lightweight, clocking in at under 100KB.

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

- The `'Main Menu'` is what you'll see when you launch ART, and acts as a portal to each of the program's functions.
- Simply press the alphabetic key that corresponds with each option to select it.
- A brief explanation of each option:
    - `'A. Iterative file renaming'`
        - Use this for (re)naming files.
    - `'B. Iterative folder renaming'`
        - Use this for (re)naming folders.
    - `'C. Print help documentation'`
        - Use this to print this documentation in an interactive format.
    - `'D. Quit the program'`
        - Exits the program. Of note; ART does not save any data between each instance of the program. Once it's closed, any data stored will be lost.
- Below is a more detailed look at the workflow for the iterative naming process.

### Files and Folders

- The first option given to the user is between renaming files and folders.
- It's useful to make the distinction, since the process is slightly different for each one.
- There is currently no way to rename both files and folders at the same time.
- Objects are only renamed in the directory chosen, and this does not extend to sub-directories.
    - *For those interested, recursive renaming is not possible, as renaming a folder obviously changes the path of all subfolders and files within it. While I'm sure there's a way to reverse scan the hierarchy, this is broadly outside the scope of this project.*

### Choosing a Directory

<details>

***<summary>Click here to preview directory selection screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

FILE RENAMING

Input the directory containing the objects that are to be renamed (Copy and paste out of Windows Explorer):
```

</details>

- As mentioned directly within the program, the easiest way to reference a specific directory is to simply navigate to it within Windows Explorer, and then copy and paste it from the address bar into ART.
- ART will check to see if the directory exists before proceeding. If this is not the case, you will be prompted to re-enter a valid directory.
- The program will work with both local directories and those on shared network drives (ie. Samba shares), although network administration policy may override this functionality.

### Choosing a Reference

<details>

***<summary>Click here to preview reference selection screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

FILE RENAMING

Input the root catalogue reference for the objects, without the numbering for each file (i.e. B1018.1, where objects will be B1018.1.1, B1018.1.2 etc. - Slashes will be replaced with dots by default):
```

</details>

- this is a very archives specific feature, allowing you to prefix the file numbering with a catalogue reference code.
- Standard practice in archives is to use forward slashes (`'/'`) in catalogue references, but nearly all computing file systems disallow the use of slashes in file names, as they are generally used to denote directory structure.
- Because of this, ART will automatically convert all slashes entered into periods (`'.'`) for the purposes of file naming. However, you can override this by simply delineating with a different character, such as hyphens (`'-'`) when you enter the reference code.

### Choosing the First Object Number

<details>

***<summary>Click here to preview first iteration screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

FILE RENAMING

Input the number from which you want to start iterative file naming (i.e. the first number in the series):
```

</details>

- This is fairly self-explanatory, just input the first number in the numbering sequence.
- This can be useful if you're working on a series of objects, and need to number them in two seperate groups.
- Obviously, only integer numbers can be entered at this stage, and the program will reject any other data types entered.\

### Preserving Original Object Names

<details>

***<summary>Click here to preview name preservation screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

FILE RENAMING

Would you like to preserve the original object names? If yes, the original names will be placed in brackets after the catalogue reference. (Y/N)
```

</details>

- As stated within the program, this stage gives you the option of either discarding or preserving the original object's name.
- If you choose to preserve the original name, it will be placed in brackets after the reference code in the new name.
- For instance, if you're renaming a file titled `'DSC1023.JPG'`, and you set the catalogue reference to be `'A/AZY/1/2'`, choosing to preserve to the original name will result in the following: `'A.AZY.1.2 (DSC1023).JPG'`.
- However, if you were to discard the original name, the new name would simply be `'A.AZY.1.2.JPG'`

### Confirmation

<details>

***<summary>Click here to preview confirmation screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

FILE RENAMING

Press any key to execute the renaming process...
```

</details>

- This is the final screen before the renaming is executed.
- Once you confirm, the renaming will take effect, and you should see that the filenames have changed in Windows Explorer.
- **CAUTION:** Once you have confirmed, the process cannot be reversed or undone. Only continue if you are sure that you want the renaming to be executed.

### Completion

<details>

***<summary>Click here to preview completion screen</summary>***

```
   __         ___    _____
  / /\       | |_)    | |
 /_/--\      |_| \    |_|
 ARCHIVIST'S RENAMING TOOL

Renaming process completed!

EXIT MENU
Please select an option:

A. Return to main menu
B. Quit the program

```

</details>

- Once the renaming process is completed (should be virtually instant, except when renaming large numbers of files over the network), you should see a confirmation message.
- It is always worth double checking the objects to make sure that the naming is completed according to your expectations.
- From here, you will be presented with the `'Exit Menu'`, which will allow you to either return to the main menu, or exit the program.