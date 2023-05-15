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
- For instance, if you're renaming a file titled `'DSC1023.JPG'`, you set the catalogue reference to be `'A/AZY/2'` and the starting iteration to be `'1'`, choosing to preserve to the original name will result in the following: `'A.AZY.2.1 (DSC1023).JPG'`.
- However, if you were to discard the original name, the new name would simply be `'A.AZY.2.1.JPG'`

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

## Usage Conditions

Basically, when and when not to use ART for object (re)naming, and some cautionary measures and caveats to its usage.

### When to Use

- When you have a large number of digital objects that you want to be sequentially named and numbered in accordance with a pre-existing catalogue reference code.
- This does depend on the objects already being sorted into the correct order, or being in such a situation that the order of numbering does not matter.

### When Not to Use

- When you have a small number of objects to rename (approximately, less than five).
    - User trials and testing have revealed that for most users, manually renaming small groups of objects is quicker than navigating the ART user interface.
    - For this sort of scenario, it is often quicker to simply copy and paste the reference code stem between objects, manually appending an index number.
    - However, your mileage may vary, depending on your preferred workflow and biases to certain methods.
- When you have a large number of objects that should be ordered, but aren't.
    - ART isn't psychic. He can't magically intuit an order that doesn't already exist.

### Cautions

- As mentioned in the `'Confirmation'` section, once you decide to execute the renaming process, you cannot revert to the original names.
    - **As such, it is highly recommended that you create backups of any objects you intend to rename with ART.**
- Additionally, if you leave the `'Directory'` field blank, ART will attempt to rename whatever objects are contained within the same folder as the executable. For this reason, it is recommended that you place the ART executable into a folder on its own.
    - e.g. `'C:\Users\User\Documents\Software\ART'`
    - However, this can also be used to skip the directory stage, however, it is possible that ART will try to rename its own executable - more testing required.

### Caveats

- There is one major caveat: ART reads files in machine numbering.
    - For example, if you have objects numbered 1 - 15, without leading zeros for the first 9, a computer will ascertain the following order:
    - `[1,10,11,12,13,14,15,2,3,4,5,6,7,8,9]`
    - This is because, to a computer, everything beginning with a one must come before everything beginning with any other positive integer (e.g. two, three, four etc.)
    - <details>

        ***<summary>Click here to read a little more about why this is...</summary>***

        - You may find it easier to think about the way computer see numbers if you think about the way we order alphabetised lists.
        - As an example, it seems logical to us that you should sort the given list as follows:
        - `[A,B,AB,BA] -> [A,AB,B,BA]`
        - Well, if you substitute `'A'` for `'1'` and `'B'` for `'2'`, you would get the following:
        - `[1,2,12,21] -> [1,12,2,21]`
        - This is basically how a computer thinks about numerical ordering, treating each digit as an individual number to be sorted by, rather than as part of a compound number.
        - In you're interested in further exploring this, have a look at the following Stack Exhange post: <href>https://softwareengineering.stackexchange.com/questions/127639/why-do-some-sorting-methods-sort-by-1-10-2-3</href>

    </details>

    - The 'simple' fix to this is to preface the first nine numbers with leading zeros, such that they become `[01,02,03]` etc. This can be done manually with minial effort, and if you have a folder containing eighty objects, it's still much quicker to manually add nine zeros than it is to go through and rename every object one-by-one.
    - However, if you are working with a number of objects greater than 99, it is advisable to split them into two folders, one with every object with number less than and equal to 99, and one with every number greater than 99. Then, use the first iteration field to start the numbering for the latter folder at index 100. Once renaming is complete, simply move the objects back into the same folder, and they should all be in the correct order.
    - Logically, the same applies for groups of over 999 objects, and each power of ten thereafter. Simply split the objects into folders for each power of ten, so you might have the following file structure:
    - <details>

        ***<summary>Click here to view sample hierarchy</summary>***

        ```
        A.AZY.1
        |
        L A.AZY.1.1-9
        |   |
        |   L A.AZY.1.1
        |   L A.AZY.1.2
        |   L A.AZY.1.3
        |   L ...
        |
        L A.AZY.1.10-99
        |   |
        |   L A.AZY.1.10
        |   L A.AZY.1.11
        |   L A.AZY.1.12
        |   L ...
        |
        L A.AZY.1.100-999
            |
            L A.AZY.1.100
            L A.AZY.1.101
            L A.AZY.1.102
            L ...
        ```

    </details>

## Summary

- To conclude:
    - ART is powerful, when used correctly, and has probably saved me hundreds of hours over the past few months.
    - However, when used incorrectly, you can end up making rather a lot of work for yourself, untangling incorrectly named objects, especially if you don't have backups of the original objects.
    - This documentation sheet is about four times as long as it needs to be.
    - Please do feel free to submit bug reports if you find anything strange, suggest alterations to the repository and otherwise mutilate the code however you like!
    - If you end up using this, and ever meet me in the real world, you can buy me a coffee :)

`- Cade, May 2023`