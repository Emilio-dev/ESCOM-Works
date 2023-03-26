import re

# Expresiones regulares para cada tipo de token
regex_patterns = {
    "COMENTARIO": r"//.*|/\*[\s\S]*?\*/",  # Comentarios
    "STRING": r"\".*?\"",  # Cadenas de caracteres
    "IDENTIFICADOR": r"[A-Za-z_][\w_]*",  # Identificadores
    "NUMERO": r"\d+(\.\d+)?",  # Números enteros y decimales
    "OPERADOR": r"\+|\-|\*|\/|\%|\=\=|\!\=|\<\=|\>\=|\<|\>",  # Operadores
    "DELIMITADOR": r"\(|\)|\{|\}|\[|\]|\,|\;|\.",  # Delimitadores
    "PALABRA_RESERVADA": r"\b(abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|if|implements|import|instanceof|int|interface|long|native|new|package|private|protected|public|return|short|static|strictfp|super|switch|synchronized|this|throw|throws|transient|try|void|volatile|while)\b"  # Palabras reservadas
}

# Función para leer un archivo Java y devolver una lista de tokens
def analizar_archivo_java(nombre_archivo):
    # Leer el archivo Java
    with open(nombre_archivo, "r") as archivo:
        codigo_fuente = archivo.read()

    # Encontrar todos los tokens en el código fuente utilizando expresiones regulares
    tokens = []
    for nombre, patron in regex_patterns.items():
        for token in re.findall(patron, codigo_fuente):
            tokens.append((nombre, token))

    # Devolver la lista de tokens
    return tokens

# Ejemplo de uso
tokens = analizar_archivo_java("ejemplo.java")
for token in tokens:
    print(token)