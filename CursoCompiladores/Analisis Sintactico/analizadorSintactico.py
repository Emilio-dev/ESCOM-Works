import argparse

class Token:
    def __init__(self, typ, val):
        self.type = typ
        self.value = val

class Lexer:
    def __init__(self, text):
        self.text = text
        self.pos = 0
        self.current_char = self.text[self.pos] if len(self.text) > 0 else None
        self.line = 1
        self.column = 1

    def advance(self):
        
        if self.current_char is not None and self.current_char == '\n':
            self.line += 1
            self.column = 1
        else:
            self.column += 1
        self.pos += 1
        self.current_char = self.text[self.pos] if self.pos < len(self.text) else None

    def get_next_token(self):
        while self.current_char is not None:
            
            if self.current_char.isspace():
                self.advance()
                continue
            if self.current_char == '*':
                self.advance()
                return Token("starToken", '*')

            if self.current_char == ',':
                self.advance()
                return Token("comaToken", ',')
            
            if self.current_char == '.':
                self.advance()
                return Token("puntoToken", '.')

            if self.current_char.isalpha() or self.current_char.isdigit():
                identifier = self.get_identifier()

                if identifier == "select":
                    self.advance()
                    return Token("selectToken", 'select')

                elif identifier == "from":
                    self.advance()
                    return Token("fromToken", 'from')

                elif identifier == "distinct":
                    self.advance()
                    return Token("distinctToken", 'distinct')
                
                else:
                    return Token("idToken", identifier)

            self.error()

        return Token("EOF", None)
    
    def get_identifier(self):
        identifier = ''
        while self.current_char is not None and self.current_char.isalnum():
            identifier += self.current_char
            self.advance()
        return identifier

    def error(self):
        raise Exception("Carácter no válido en la línea {} y columna {}".format(self.line, self.column))

def tokenizar(texto):
    lexer = Lexer(texto)
    tokens = []
    while True:
        token = lexer.get_next_token()
        if token.type == "EOF":
            tokens.append(token)
            break
        tokens.append(token)
    return tokens  
     
def Q(tokens):
    idx = 0
    if tokens[idx].type == "selectToken":
        idx += 1
        idx = D(tokens, idx)
        if tokens[idx].type == "fromToken" and idx != -1:
            idx += 1
            idx = T(tokens, idx) 
            if idx==(len(tokens)-1):
                return idx
            else:
                print("Error en la posición "+ str(idx) +". Se esperaba un identificador o una coma.");
                return -1
    print("Error en la posición "+ str(idx) +". Se esperaba la palabra reservada SELECT.");       
    return -1

def D(tokens, idx):
    if idx == -1:
        return -1
    
    if tokens[idx].type == "distinctToken":
        idx += 1
        idx = P(tokens, idx)
    elif tokens[idx].type == "idToken" or tokens[idx].type == "starToken":
        idx = P(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba DISTINCT, * o un identificador.");       
        return -1
    return idx

def P(tokens, idx):
    if idx == -1:
        return -1

    if tokens[idx].type == "starToken":
        idx += 1
    elif tokens[idx].type == "idToken":
        idx = A(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba * o un identificador.");       
        return -1    
    return idx

def A(tokens, idx):
    if idx == -1:
        return -1
    if tokens[idx].type == "idToken":
        idx = A2(tokens, idx)
        idx = A1(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba un identificador."); 
        return -1     
    return idx

def A1(tokens, idx):
    if idx == -1:
        return -1
    
    if tokens[idx].type == "comaToken":
        idx += 1
        idx = A(tokens, idx)
    return idx

def A2(tokens, idx):
    if idx == -1:
        return -1
    
    if tokens[idx].type == "idToken":
        idx += 1
        idx = A3(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba un identificador.");
        return -1   
    return idx

def A3(tokens, idx):
    if idx == -1:
        return -1
    if tokens[idx].type == "puntoToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1

    return idx

def T(tokens, idx):
    if idx == -1:
        return -1
    idx = T2(tokens, idx)
    if idx != -1:
        idx = T1(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba un identificador.");
        return -1    
    return idx

def T1(tokens, idx):
    if idx == -1:
        return -1
    
    if tokens[idx].type == "comaToken":
        idx += 1
        idx = T(tokens, idx)    
    return idx

def T2(tokens, idx):
    if idx == -1:
        return -1
    if tokens[idx].type == "idToken":
        idx += 1
        idx = T3(tokens, idx)
    else:
        print("Error en la posición "+ str(idx) +". Se esperaba un identificador.");
        return -1    
    return idx

def T3(tokens, idx):
    if idx == -1:
        return -1
    if tokens[idx].type == "idToken":
        idx += 1
    return idx

    
def read_file(filename):
    if filename == "none" or filename == None:
        print("Por favor, ingrese los argumentos a tokenizar: ")
        try:
            while True:
                text=input()
                tokens=tokenizar(text)  
                result = Q(tokens)
                if result != -1:
                    print("La entrada es válida")
                else:
                    print("Error de sintaxis")
        except KeyboardInterrupt:
            # code to execute when the user presses Ctrl+C
            print("Ctrl+C pressed. Exiting.")
            return 0        
    else:
        file = open(filename, 'r')
        contents = file.read()
        tokenizar(contents)
        return 0
 

parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, help='The filename to read')
args = parser.parse_args()
read_file(args.filename)