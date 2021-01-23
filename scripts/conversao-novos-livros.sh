#!/bin/bash

images_directory="/home/jefferson/arquivos/shell-begin/imagens-novos-livros"

image_converter(){
    local images_directory=$1
    local image_without_extension=$(ls $images_directory | awk -F. '{ print $1 }')
    convert $image_without_extension.jpg $image_without_extension.png
}

sweep_directory(){
    cd $1
    for file in *
    do
        local file_directory=$(find $images_directory -name $file)
        if [ -d $file_directory ]
        then
            sweep_directory $file_directory
        else
            image_converter $file_directory
        fi
    done
}

sweep_directory $images_directory
if [ $? -eq 0 ]
then
    echo "Conversion performed successfully"
else
    echo "Conversion failed"
fi