# First, we want to know the contents of the storage file
function clearfolder() {
    rm -ri download
}

menu() {
    read -p "Do you want to clear the downloads folder? (1 for yes, 2 for no) " answer
    answer=${answer:-2}
    echo " "
    if [[ "$answer" == "1" ]] ; then
        clearfolder;
    else
        echo "You can proceed to downl"
    fi
}


function list() {
    echo "Here are the files in your s3 bucket"
    aws s3 ls --human-readable s3://clouduploadertds
    echo " "
    # Collecting user input on choice of file to download
    local file
    read -p "What would you like to download " file
    # Downloading the selected file
    mkdir -p download && if aws s3 cp s3://clouduploadertds/$file download/$file; then
        echo "File downloaded successfully!"
    else
        echo "Download failed. Check your internet connectivity and try again."
    fi
}

# error handling for the download

menu