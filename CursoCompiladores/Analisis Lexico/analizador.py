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
                return Token("IGUAL", '=')
            
            if self.current_char == ';':
                self.advance()
                return Token("Pcoma", ';')

            if self.current_char.isdigit():
                return Token("NUM", self.get_number())

            if self.current_char.isalpha():
                return Token("ID", self.get_id())

            self.error()

        return Token("EOF", None)

    def get_number(self):
        result = ''
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        return int(result)

    def get_id(self):
        result = ''
        while self.current_char is not None and self.current_char.isalnum():
            result += self.current_char
            self.advance()
        return result

    def error(self):
        raise Exception("Carácter no válido en la línea {} y columna {}".format(self.line, self.column))

def read_file(filename):
    with open(filename, 'r') as f:
        return f.read()
    
text = read_file("prueba.c")

lexer = Lexer(text)

while True:
    token = lexer.get_next_token()
    if token.type == "EOF":
        break
    print(token.type, token.value)    