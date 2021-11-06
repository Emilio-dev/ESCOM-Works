
arg=("$@");

for arg; do

  if [ "$arg" = "pdf" ]
    then
    find ./Archivos_ordenar -iname '*.pdf' | pdfgrep -ril "azul" | xargs pdfgrep -il "verde" | xargs pdfgrep -il "amarillo" | xargs pdfgrep -il "rojo" | xargs cp -t ./Loscolores/
  else
    find ./Archivos_ordenar -iname "*.$arg*"| xargs cp -t ./ordenados/
    fi
done

echo Termine