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
          
          # Display matching line numbers
          " - Line(s):",
          
          paste(WHERE, collapse = ", "), "\n")
      
    }
    
  }
  
}
