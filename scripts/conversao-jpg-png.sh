#!/bin/bash

cd ~/arquivos/shell-begin/imagens-livros/

#verify if the folder png already exists
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

