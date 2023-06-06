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

class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.index = 0
        self.current_token = self.tokens[self.index]
        self.parsing_table = {
            "Q": [("selectToken", "D", "fromToken", "T")],
            "D": [("distinctToken", "P"), ("P",)],
            "P": [("starToken",), ("A",)],
            "A": [("A2", "A1")],
            "A1": [("comaToken", "A"), ()],
            "A2": [("idToken", "A3")],
            "A3": [("puntoToken", "idToken"), ()],
            "T": [("T2", "T1")],
            "T1": [("comaToken", "T"), ()],
            "T2": [("idToken", "T3")],
            "T3": [("idToken",), ()]
        }
    
    def match(self, expected_token_type):
        if self.current_token.type == expected_token_type:
            self.index += 1
            if self.index < len(self.tokens):
                self.current_token = self.tokens[self.index]
        else:
            raise Exception(f"Error: Expected {expected_token_type}, but found {self.current_token.type}")
    
    def parse(self, non_terminal):
        if non_terminal in self.parsing_table:
            production_rules = self.parsing_table[non_terminal]
            for rule in production_rules:
                rule_index = 0
                try:
                    for symbol in rule:
                        if symbol in self.parsing_table:
                            self.parse(symbol)
                        else:
                            self.match(symbol)
                        rule_index += 1
                    return  # Successful parsing
                except Exception:
                    # Rule failed, backtrack and try the next one
                    self.index -= rule_index
            raise Exception(f"Error: Failed to parse {non_terminal}")
        else:
            raise Exception(f"Error: No production rule found for {non_terminal}")
    
    def start(self):
        self.parse("Q")
        if self.index == len(self.tokens)-1:
            print("Parsing successful.")
        else:
            print("Error: Extra tokens found.")

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

def read_file(filename):
    if filename == "none" or filename == None:
        print("Por favor, ingrese los argumentos a tokenizar: ")
        try:
            while True:
                text=input()
                tokens=tokenizar(text)  
                parser = Parser(tokens)
                parser.start()
        except KeyboardInterrupt:
            # code to execute when the user presses Ctrl+C
            print("Ctrl+C pressed. Exiting.")
            return 0        
    else:
        file = open(filename, 'r')
        contents = file.read()
        tokenizar(contents)
        parser = Parser(tokens)
        parser.start()
        return 0


parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, help='The filename to read')
args = parser.parse_args()
read_file(args.filename)