---
title: "ScriptFinder"
author: "Juan Carlos Rubio Polania"
date: "2026-05-04"
output: html_document
---

# ScriptFinder 🔍💻

## Overview

`ScriptFinder` is a simple R routine designed to automatically search for keywords inside multiple `.R` scripts stored in a directory and its subfolders.

The script is useful for quickly locating:
- Functions
- Variables
- Package names
- Specific code fragments
- Keywords inside large projects

This approach is especially practical when working with large collections of scripts where manual searching becomes inefficient.

---

# Main Features

- 🔎 Automatic keyword search
- 📂 Recursive directory exploration
- ⚡ Fast identification of matching lines
- 🛡️ Error handling using `tryCatch()`
- 🧠 Case-insensitive search support
- 💻 Works with Base R only

---

# Example Code

```r
# Keyword to search inside R scripts
keyword = "benthicR"

# Get all .R files from the home directory and subfolders
script = list.files(path = "~",
                    
                    # Search only for files with .R extension
                    pattern = "\\.R$",
                    
                    # Return full file paths
                    full.names = TRUE,
                    
                    # Include subdirectories in the search
                    recursive = TRUE,
                    
                    # Ignore upper/lower case differences
                    ignore.case = TRUE)

# Loop through each script found
for(s in script){
  
  # Read the file line by line
  # If an error occurs, return NULL instead of stopping execution
  lines = tryCatch(  
    readLines(s), error = function(e) NULL)

  # Continue only if the file was successfully read
  if(!is.null(lines)){
    
    # Find line numbers containing the keyword
    WHERE = which(grepl(keyword,
                        lines,
                        ignore.case = TRUE))

    # Print results only if matches are found
    if(length(WHERE) > 0) {
      
      cat(file.path(dirname(s),
                    basename(s)),
          " - Line(s):",
          paste(WHERE, collapse = ", "), "\n")

    }

  }

}
```

---

# Code Explanation

## Keyword Definition

```r
keyword = "benthicR"
```

Defines the word or text pattern to search for inside the scripts.

---

## File Detection

```r
list.files()
```

This function searches for `.R` files in the selected directory.

### Important Arguments

| Argument | Description |
|---|---|
| `path = "~"` | Uses the home directory |
| `pattern = "\\.R$"` | Searches only `.R` files |
| `full.names = TRUE` | Returns complete file paths |
| `recursive = TRUE` | Includes subfolders |
| `ignore.case = TRUE` | Ignores uppercase/lowercase differences |

---

## Reading Files

```r
readLines()
```

Reads each script line by line.

---

## Error Handling

```r
tryCatch()
```

Prevents the program from stopping if a file cannot be read.

Instead of crashing, the function returns `NULL`.

---

## Keyword Search

```r
grepl()
```

Searches for the keyword inside the text.

```r
which()
```

Returns the line numbers where matches occur.

---

## Output

```r
cat()
```

Prints:
- File location
- Script name
- Matching line numbers

Example output:

```r
/home/user/project/script1.R - Line(s): 12, 25
/home/user/project/script2.R - Line(s): 8
```

---

# Applications

This script can be used for:

- 📂 Code auditing
- 🧠 Reviewing large R projects
- 🔍 Searching package usage
- ⚡ Locating functions quickly
- 💻 Organizing scripts
- 📊 Supporting reproducible workflows

---

# Requirements

- R
- Base R only
- No external packages required

---

# Author

Juan Carlos Rubio Polania 
