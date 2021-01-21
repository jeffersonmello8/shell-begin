#!/bin/bash

converts_images(){
cd ~/arquivos/shell-begin/imagens-livros/
#verify if the png folder already exists
if [ ! -d png ]
then
	mkdir png
fi

#converts all images the folder imagens-livros
for imagem in *.jpg
do
	imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1}')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png 
done
}

converts_images 2>log.txt
if [ $? -eq 0 ]
then 
	echo "Conversion performed successfully"
else
	echo "Conversion failed"
fi

