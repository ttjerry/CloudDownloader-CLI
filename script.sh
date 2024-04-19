# First we want to know the contents of the storage file
function clearfolder() {
    > download

}

menu() {
echo "Before executing the script would you like to empty the downloads file"
echo " "
}

case ${answer} in
    
    clearfolder
    ;;
esac



 
function list() {
    aws s3 ls s3://clouduploadertds
}

# Calling the function to get the list of items in the cloud storage

echo "Here are the files in your s3 bucket"
echo " "
list
# Collecting user input on choice of file to download
read -p "What would you like to download " file


# function to download file from the cloud onto our local device

function download() {
    aws s3 cp s3://clouduploadertds/${file} downloads
}

# validation to check if the file already exists in the downloads folder

 download

 # function to clear the download folder on demand



 