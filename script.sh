# First we want to know the contents of the storage file

# Making reference to our previous project the s3 bukcet lister

function list() {
    aws s3 ls s3://clouduploadertds
}

function download() {
    aws s3 cp $1 /downloads
}

echo "Here are the files in your s3 bucket"
echo " "
list

if [[ -e $1 ]]; then
    download
fi