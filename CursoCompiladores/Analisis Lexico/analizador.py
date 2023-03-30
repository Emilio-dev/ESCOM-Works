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

            if self.current_char == '+':
                self.advance()
                return Token("PLUS", '+')

            if self.current_char == '-':
                self.advance()
                return Token("MINUS", '-')

            if self.current_char == '*':
                self.advance()
                return Token("MULT", '*')

            if self.current_char == '/':
                self.advance()
                if self.current_char == '/':
                    self.skip_single_line_comment()
                    continue
                elif self.current_char== '*':
                    self.skip_multi_line_comment()
                    continue
                return Token("DIV", '/')

            if self.current_char == '(':
                self.advance()
                return Token("LPAREN", '(')

            if self.current_char == ')':
                self.advance()
                return Token("RPAREN", ')')
            
            if self.current_char == '{':
                self.advance()
                return Token("LCORCH", '{')

            if self.current_char == '}':
                self.advance()
                return Token("RCORCH", '}')
            
            if self.current_char == '=':
                self.advance()
                if self.current_char == '=':
                    self.advance()    
                    return Token("IGUAL A", '==')
                return Token("IGUAL ", '=')
            
            if self.current_char == ';':
                self.advance()
                return Token("Pcoma", ';')
            
            if self.current_char == 'ademas':
                self.advance()
                return Token("Tokenademas","ademas")
            
            if self.current_char == 'falso':
                self.advance()
                return Token("Tokenfalso","falso")
            
            if self.current_char == 'para':
                self.advance()
                return Token("Tokenpara","para")
            
            if self.current_char == 'fun':
                self.advance()
                return Token("Tokenfun","fun")
            
            if self.current_char == 'si':
                self.advance()
                return Token("Tokensi","si")
            
            if self.current_char == 'nulo':
                self.advance()
                return Token("Tokennulo","nulo")
            
            if self.current_char == 'o':
                self.advance()
                return Token("Tokeno","o")
            
            if self.current_char == 'imprimir':
                self.advance()
                return Token("Tokenimprimir","imprimir")
            
            if self.current_char == 'retornar':
                self.advance()
                return Token("Tokenretornar","retornar")
            
            if self.current_char == 'super':
                self.advance()
                return Token("Tokensuper","super")
            
            if self.current_char == 'este':
                self.advance()
                return Token("Tokeneste","este")
            
            if self.current_char == 'verdadero':
                self.advance()
                return Token("Tokenverdadero","verdadero")
            
            if self.current_char == 'var':
                self.advance()
                return Token("Tokenvar","var")
            
            if self.current_char == 'mientras':
                self.advance()
                return Token("Tokenmientras","mientras")

            if self.current_char.isdigit() or self.current_char == ".":
                number_token = self.get_number()
                return Token(number_token.type,number_token.value)

            if self.current_char.isalpha():
                return Token("TokenPR", self.get_id())

            self.error()

        return Token("EOF", None)
    
    def skip_single_line_comment(self):
        while self.current_char is not None and self.current_char != '\n':
            self.advance()
        self.advance()  # Consume the newline character

    def skip_multi_line_comment(self):
        self.advance()  # Consume the opening '/'
        self.advance()  # Consume the asterisk '*'
        while self.current_char is not None:
            if self.current_char == '*':  # End of the comment
                self.advance()  # Consume the asterisk '*'
                if self.current_char == '/':
                    self.advance()  # Consume the closing '/'
                    return
            self.advance()
        raise Exception('Unterminated multi-line comment')    

    def get_number(self):
        result = ""
        while self.current_char is not None and (self.current_char.isdigit() or self.current_char == "."):
            result += self.current_char
            self.advance()
        if result.count(".") == 1:
            return Token("FLOAT", float(result))
        else:
            return Token("INTEGER", int(result))

    def get_id(self):
        result = ''
        while self.current_char is not None and self.current_char.isalnum():
            result += self.current_char
            self.advance()
        return result

    def error(self):
        raise Exception("Carácter no válido en la línea {} y columna {}".format(self.line, self.column))
    
def read_file(filename):
    try:
            file = open(filename, 'r')
            contents = file.read()
            tokenizar(contents)
            return 0
    except FileNotFoundError:
            print("Por favor, ingrese los argumentos a tokenizar: ")
            try:
                while True:
                    text=input()
                    tokenizar(text)    
            except KeyboardInterrupt:
                # code to execute when the user presses Ctrl+C
                print("Ctrl+C pressed. Exiting.")
                return 0

def tokenizar(texto):
    lexer = Lexer(texto)

    while True:
        token = lexer.get_next_token()
        if token.type == "EOF":
            break
        print(token.type, token.value)


parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, help='The filename to read')
args = parser.parse_args()
print(args.filename)
read_file(args.filename)