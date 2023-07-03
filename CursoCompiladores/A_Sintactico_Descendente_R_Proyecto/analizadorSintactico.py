import argparse

class Token:
    def __init__(self, typ, val):
        self.type = typ
        self.value = val

    def __str__(self):
         return str(self.value)

    def __repr__(self):
        return str(self)

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
                return Token("masToken", '+')

            if self.current_char == '-':
                self.advance()
                return Token("menosToken", '-')

            if self.current_char == '*':
                self.advance()
                return Token("multiToken", '*')

            if self.current_char == '/':
                self.advance()
                if self.current_char == '/':
                    self.skip_single_line_comment()
                    continue
                elif self.current_char== '*':
                    self.skip_multi_line_comment()
                    continue
                return Token("divToken", '/')

            if self.current_char == '.':
                self.advance()
                return Token("puntoToken", '.')

            if self.current_char == ',':
                self.advance()
                return Token("comaToken", ',')

            if self.current_char == '(':
                self.advance()
                return Token("lparenToken", '(')

            if self.current_char == ')':
                self.advance()
                return Token("rparenToken", ')')
            
            if self.current_char == '{':
                self.advance()
                return Token("lcorchToken", '{')

            if self.current_char == '}':
                self.advance()
                return Token("rcorchToken", '}')
            
            if self.current_char == '=':
                self.advance()
                if self.current_char == '=':
                    self.advance()    
                    return Token("igualAToken", '==')
                return Token("igualToken", '=')
            
            if self.current_char == '!':
                self.advance()
                if self.current_char == '=':
                    self.advance()    
                    return Token("difereteToken", '!=')
                return Token("notToken", '!')   

            if self.current_char == '>':
                self.advance()
                if self.current_char == '=':
                    self.advance()    
                    return Token("mayorIgualToken", '>=')
                return Token("mayorToken", '>')
                                 
            if self.current_char == '<':
                self.advance()
                if self.current_char == '=':
                    self.advance()    
                    return Token("menorIgualToken", '<=')
                return Token("menorToken", '<')

            if self.current_char == ';':
                self.advance()
                return Token("pcomaToken", ';')
                      
            if self.current_char == 'o':
                self.advance()
                return Token("orToken","o")
            
            if self.current_char == 'y':
                self.advance()
                return Token("yToken","y")
                       
            if self.current_char == '"':
                return Token("stringToken", self.get_string())
            
            if self.current_char.isdigit() or self.current_char == ".":
                number_token = self.get_number()
                return Token(number_token.type,number_token.value)

            if self.current_char.isalpha():
                identifier = self.get_identifier()
                if identifier == "ademas":
                    return Token("ademasToken","ademas")
                
                elif identifier == "falso":
                    return Token("falsoToken","falso")
                
                elif identifier == "para":
                    return Token("paraToken","para")
                
                elif identifier == "fun":
                    return Token("funToken","fun")
                
                elif identifier == "si":
                    return Token("siToken","si")
                
                elif identifier == "nulo":
                    return Token("nuloToken","nulo")
                
                elif identifier == "imprimir":
                    return Token("imprimirToken","imprimir")
                
                elif identifier == "retornar":
                    return Token("retornarToken","retornar")
                
                elif identifier == "super":
                    return Token("superToken","super")
                
                elif identifier == "entonces":
                    return Token("entoncesToken","entonces")

                elif identifier == "este":
                    return Token("entoncesToken","este")
                
                elif identifier == "verdadero":
                    return Token("verdaderoToken","verdadero")
                
                elif identifier == "var":
                    return Token("varToken","var")
                               
                elif identifier == "mientras":
                    return Token("mientrasToken","mientras")
                
                elif identifier == "clase":
                    return Token("claseToken","clase")
                
                elif identifier == "para":
                    return Token("paraToken","para")
                
                else:
                    return Token("idToken", identifier)

            self.error()

        return Token("EOF", None)
    
    def skip_single_line_comment(self):
        while self.current_char is not None and self.current_char != '\n':
            self.advance()
        self.advance()  # Consume the newline character

    def skip_multi_line_comment(self):
        self.advance()  
        self.advance()  
        while self.current_char is not None:
            if self.current_char == '*':  
                self.advance()  
                if self.current_char == '/':
                    self.advance()  
                    return
            self.advance()
        raise Exception('Unterminated multi-line comment')   
     
    def get_identifier(self):
        identifier = ''
        while self.current_char is not None and self.current_char.isalnum():
            identifier += self.current_char
            self.advance()
        return identifier

    def get_number(self):
        result = ""
        while self.current_char is not None and (self.current_char.isdigit() or self.current_char == "."):
            result += self.current_char
            self.advance()
        if result.count(".") == 1:
            return Token("floatToken", float(result))
        else:
            return Token("integerToken", int(result))
 
    def get_string(self):
        self.advance()
        result = ''
        while self.current_char is not None and self.current_char != '"':
            result += self.current_char
            self.advance()
        if self.current_char is None:
            self.error()
        self.advance()
        return result

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

def PROGRAM(tokens):
    if len(tokens) == 0:
        print("Error: Invalid program")
        return -1
    else:
        idx = 0

        while idx < len(tokens)-1:
            if idx!=-1 or tokens[idx].type != "EOF":
                idx = DECLARATION(tokens, idx)
            else:
                return -1

def DECLARATION(tokens, idx):#no se como poner expr_stmt
    if idx >= len(tokens):
        return idx

    tokens[idx].type = tokens[idx].type
    if tokens[idx].type == "claseToken":
        idx = CLASS_DECL(tokens, idx)
    elif tokens[idx].type == "funToken":
        idx = FUN_DECL(tokens, idx)
    elif tokens[idx].type == "varToken":
        idx = VAR_DECL(tokens, idx)
    elif tokens[idx].type in ["idToken","paraToken","siToken", "imprimirToken", "retornarToken", "mientrasToken", "lcorchToken"]:
        idx = STATEMENT(tokens, idx)
    else:
        print("Error: Invalid declaration at position " + str(idx))
        return -1
    return idx

def CLASS_DECL(tokens, idx):
    if tokens[idx].type == "claseToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1
            idx = CLASS_INHER(tokens, idx)
            if tokens[idx].type == "lcorchToken":
                idx += 1
                idx = FUNCTIONS(tokens, idx)
                if tokens[idx].type == "rcorchToken":
                    idx += 1
                else:
                    print("Error: Missing '}' at position " + str(idx))
                    return -1
            else:
                print("Error: Missing '{' at position " + str(idx))
                return -1
        else:
            print("Error: Missing identifier at position " + str(idx))
            return -1
    else:
        print("Error: 'class' keyword expected at position " + str(idx))
        return -1
    return idx

def CLASS_INHER(tokens, idx):
    if tokens[idx].type == "menorToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1
    return idx

def FUN_DECL(tokens, idx):
    if tokens[idx].type == "funToken":
        idx += 1
        idx = FUNCTION(tokens, idx)
    else:
        print("Error: 'fun' keyword expected at position " + str(idx))
        return -1
    return idx

def VAR_DECL(tokens, idx):
    if tokens[idx].type == "varToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1
            idx = VAR_INIT(tokens, idx)
            if tokens[idx].type == "pcomaToken":
                idx += 1
            else:
                print("Error: Missing ';' at position " + str(idx))
                return -1
        else:
            print("Error: Missing identifier at position " + str(idx))
            return -1
    else:
        print("Error: 'var' keyword expected at position " + str(idx))
        return -1
    return idx

def VAR_INIT(tokens, idx):
    if tokens[idx].type == "igualToken":
        idx += 1
        idx = EXPRESSION(tokens, idx)
    return idx

def STATEMENT(tokens, idx):
    if tokens[idx].type == "paraToken":
        idx = FOR_STMT(tokens, idx)
    elif tokens[idx].type == "siToken":
        idx = IF_STMT(tokens, idx)    
    elif tokens[idx].type == "imprimirToken":
        idx = PRINT_STMT(tokens, idx)
    elif tokens[idx].type == "retornarToken":
        idx = RETURN_STMT(tokens, idx)
    elif tokens[idx].type == "mientrasToken":
        idx = WHILE_STMT(tokens, idx)
    elif tokens[idx].type == "lcorchToken":
        idx = BLOCK(tokens, idx)
    else:
        idx = EXPR_STMT(tokens, idx)
    return idx

def EXPR_STMT(tokens, idx):
    idx = EXPRESSION(tokens, idx)
    if tokens[idx].type == "pcomaToken":
        idx += 1
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT(tokens, idx):
    if tokens[idx].type == "paraToken":
        idx += 1
        if tokens[idx].type == "lparenToken":
            idx += 1
            idx = FOR_STMT_1(tokens, idx)
            idx = FOR_STMT_2(tokens, idx)
            idx = FOR_STMT_3(tokens, idx)
            if tokens[idx].type == "rparenToken":
                idx += 1
                idx = STATEMENT(tokens, idx)
            else:
                print("Error: Missing ')' at position " + str(idx))
                return -1
        else:
            print("Error: Missing '(' at position " + str(idx))
            return -1
    else:
        print("Error: 'para' keyword expected at position " + str(idx))
        return -1
    return idx

def FOR_STMT_1(tokens, idx): #duda
    if tokens[idx].type == "varToken":
        idx=VAR_DECL(tokens, idx)
        return idx
    idx=EXPR_STMT(tokens, idx)
    if tokens[idx].type == "pcomaToken":
            idx += 1
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT_2(tokens, idx): #no se bien si hay que declarar expression y luego checar ;
    if tokens[idx].type == "pcomaToken":
        idx += 1
        return idx
    idx = EXPRESSION(tokens, idx)
    if tokens[idx].type == "pcomaToken":
        idx += 1    
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT_3(tokens, idx):
    if tokens[idx].type == "rparenToken":
        return idx
    idx = EXPRESSION(tokens, idx)
    return idx

def IF_STMT(tokens, idx):
    if tokens[idx].type == "siToken":
        idx += 1
        if tokens[idx].type == "lparenToken":
            idx += 1
            idx = EXPRESSION(tokens, idx)
            if tokens[idx].type == "rparenToken":
                idx += 1
                idx = STATEMENT(tokens, idx)
                idx = ELSE_STATEMENT(tokens, idx)
            else:
                print("Error: Missing ')' at position " + str(idx))
                return -1
        else:
            print("Error: Missing '(' at position " + str(idx))
            return -1
    else:
        print("Error: 'si' keyword expected at position " + str(idx))
        return -1
    return idx

def ELSE_STATEMENT(tokens, idx):
    if tokens[idx].type == "entoncesToken":
        idx += 1
        idx = STATEMENT(tokens, idx)
    return idx

def PRINT_STMT(tokens, idx):
    if tokens[idx].type == "imprimirToken":
        idx += 1
        idx = EXPRESSION(tokens, idx)
        if tokens[idx].type == "pcomaToken":
            idx += 1
        else:
            print("Error: Missing ';' at position " + str(idx))
            return -1
    else:
        print("Error: 'print' keyword expected at position " + str(idx))
        return -1
    return idx

def RETURN_STMT(tokens, idx):
    if tokens[idx].type == "retornarToken":
        idx += 1
        idx = RETURN_EXP_OPC(tokens, idx)
        if tokens[idx].type == "pcomaToken":
            idx += 1
        else:
            print("Error: Missing ';' at position " + str(idx))
            return -1
    else:
        print("Error: 'return' keyword expected at position " + str(idx))
        return -1
    return idx

def RETURN_EXP_OPC(tokens, idx):
    if tokens[idx].type != "pcomaToken":
        idx = EXPRESSION(tokens, idx)
    return idx

def WHILE_STMT(tokens, idx):
    if tokens[idx].type == "mientrasToken":
        idx += 1
        if tokens[idx].type == "lparenToken":
            idx += 1
            idx = EXPRESSION(tokens, idx)
            if tokens[idx].type == "rparenToken":
                idx += 1
                idx = STATEMENT(tokens, idx)
            else:
                print("Error: Missing ')' at position " + str(idx))
                return -1
        else:
            print("Error: Missing '(' at position " + str(idx))
            return -1
    else:
        print("Error: 'while' keyword expected at position " + str(idx))
        return -1
    return idx

def BLOCK(tokens, idx):
    if tokens[idx].type == "lcorchToken":
        idx += 1
        idx = BLOCK_DECL(tokens, idx)
        if tokens[idx].type == "rcorchToken":
            idx += 1
        else:
            print("Error: Missing '}' at position " + str(idx))
            return -1
    else:
        print("Error: Missing '{' at position " + str(idx))
        return -1
    return idx

def BLOCK_DECL(tokens, idx):
    if tokens[idx].type != "rcorchToken":
        idx = DECLARATION(tokens, idx)
        idx = BLOCK_DECL(tokens, idx)
    return idx

def EXPRESSION(tokens, idx):
    idx = ASSIGNMENT(tokens, idx)
    return idx

def ASSIGNMENT(tokens, idx):
    idx = LOGIC_OR(tokens, idx)
    idx = ASSIGNMENT_OPC(tokens, idx)
    return idx

def ASSIGNMENT_OPC(tokens, idx):
    if tokens[idx].type == "igualToken":
        idx += 1
        idx = EXPRESSION(tokens, idx)
    return idx

def LOGIC_OR(tokens, idx):
    idx = LOGIC_AND(tokens, idx)
    idx = LOGIC_OR_2(tokens, idx)
    return idx

def LOGIC_OR_2(tokens, idx):
    if tokens[idx].type == "orToken":
        idx += 1
        idx = LOGIC_AND(tokens, idx)
        idx = LOGIC_OR_2(tokens, idx)
    return idx

def LOGIC_AND(tokens, idx):
    idx = EQUALITY(tokens, idx)
    idx = LOGIC_AND_2(tokens, idx)
    return idx

def LOGIC_AND_2(tokens, idx):
    if tokens[idx].type == "andToken":
        idx += 1
        idx = EQUALITY(tokens, idx)
        idx = LOGIC_AND_2(tokens, idx)
    return idx

def EQUALITY(tokens, idx):
    idx = COMPARISON(tokens, idx)
    idx = EQUALITY_2(tokens, idx)
    return idx

def EQUALITY_2(tokens, idx):
    if tokens[idx].type in ["diferenteToken", "igualAToken"]:
        idx += 1
        idx = COMPARISON(tokens, idx)
        idx = EQUALITY_2(tokens, idx)
    return idx

def COMPARISON(tokens, idx):
    idx = TERM(tokens, idx)
    idx = COMPARISON_2(tokens, idx)
    return idx

def COMPARISON_2(tokens, idx):
    if tokens[idx].type in ["mayorToken", "mayorIgualToken", "menorToken", "menorIgualToken"]:
        idx += 1
        idx = TERM(tokens, idx)
        idx = COMPARISON_2(tokens, idx)
    return idx

def TERM(tokens, idx):
    idx = FACTOR(tokens, idx)
    idx = TERM_2(tokens, idx)
    return idx

def TERM_2(tokens, idx):
    if tokens[idx].type in ["menosToken", "masToken"]:
        idx += 1
        idx = FACTOR(tokens, idx)
        idx = TERM_2(tokens, idx)
    return idx

def FACTOR(tokens, idx):
    idx = UNARY(tokens, idx)
    idx = FACTOR_2(tokens, idx)
    return idx

def FACTOR_2(tokens, idx):
    if tokens[idx].type in ["divToken", "multiToken"]:
        idx += 1
        idx = UNARY(tokens, idx)
        idx = FACTOR_2(tokens, idx)
    return idx

def UNARY(tokens, idx):
    if tokens[idx].type in ["notToken", "menosToken"]:
        idx += 1
        idx = UNARY(tokens, idx)
    else:
        idx = CALL(tokens, idx)
    return idx

def CALL(tokens, idx):
    idx = PRIMARY(tokens, idx)
    idx = CALL_2(tokens, idx)
    return idx

def CALL_2(tokens, idx): #creo faltan errores
    if tokens[idx].type == "lparenToken":
        idx += 1
        idx = ARGUMENTS_OPC(tokens, idx)
        if tokens[idx].type == "rparenToken":
            idx += 1
            idx = CALL_2(tokens, idx)
        else:
            print("Error: Missing ')' at position " + str(idx))
            return -1
    elif tokens[idx].type == "puntoToken" and tokens[idx + 1].type == "idToken":
        idx += 2
        idx = CALL_2(tokens, idx)
    return idx

def CALL_OPC(tokens, idx):
    if tokens[idx].type == "puntoToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1
            idx = CALL_2(tokens, idx)
        else:
            print("Error: Missing identifier at position " + str(idx))
            return -1
    return idx

def PRIMARY(tokens, idx):
    if tokens[idx].type in ["verdaderoToken", "falsoToken", "nuloToken", "esteToken", "floatToken", "integerToken", "stringToken", "idToken", "superToken"]:
        idx += 1
    elif tokens[idx].type == "superToken":
        idx += 1
        if tokens[idx].type == "puntoToken" and tokens[idx + 1].type == "idToken":
            idx += 2
        else:
            print("Error: Missing '.' and identifier at position " + str(idx))
            return -1
    elif tokens[idx].type == "lparenToken":
        idx += 1
        idx = EXPRESSION(tokens, idx)
        if tokens[idx].type == "rparenToken":
            idx += 1
        else:
            print("Error: Missing ')' at position " + str(idx))
            return -1
    else:
        print("Error: Invalid primary expression at position " + str(idx))
        return -1
    return idx

def FUNCTION(tokens, idx):
    if tokens[idx].type == "idToken":
        idx += 1
        if tokens[idx].type == "lparenToken":
            idx += 1
            idx = PARAMETERS_OPC(tokens, idx)
            if tokens[idx].type == "rparenToken":
                idx += 1
                idx = BLOCK(tokens, idx)
            else:
                print("Error: Missing ')' at position " + str(idx))
                return -1
        else:
            print("Error: Missing '(' at position " + str(idx))
            return -1
    else:
        print("Error: Missing function name at position " + str(idx))
        return -1
    return idx

def FUNCTIONS(tokens, idx):
    if tokens[idx].type == "rcorchToken":
        return idx
    idx = FUNCTION(tokens, idx)
    idx = FUNCTIONS(tokens, idx)
    return idx

def PARAMETERS_OPC(tokens, idx):
    if tokens[idx].type != "rparenToken":
        idx = PARAMETERS(tokens, idx)
    return idx

def PARAMETERS(tokens, idx):
    if tokens[idx].type == "idToken":
        idx += 1
        idx = PARAMETERS_2(tokens, idx)
    else:
        print("Error: Missing parameter name at position " + str(idx))
        return -1
    return idx

def PARAMETERS_2(tokens, idx):
    if tokens[idx].type == "comaToken":
        idx += 1
        if tokens[idx].type == "idToken":
            idx += 1
            idx = PARAMETERS_2(tokens, idx)
        else:
            print("Error: Missing parameter name at position " + str(idx))
            return -1
    return idx

def ARGUMENTS_OPC(tokens, idx):
    if tokens[idx].type != "rparenToken":
        idx = ARGUMENTS(tokens, idx)
    return idx

def ARGUMENTS(tokens, idx):
    idx = EXPRESSION(tokens, idx)
    idx = ARGUMENTS_2(tokens, idx)
    return idx

def ARGUMENTS_2(tokens, idx):
    if tokens[idx].type == "comaToken":
        idx += 1
        idx = EXPRESSION(tokens, idx)
        idx = ARGUMENTS_2(tokens, idx)
    return idx

def read_file(filename):
    if filename == "none" or filename == None:
        print("Por favor, ingrese los argumentos a tokenizar: ")
        try:
            while True:
                text=input()
                tokens=tokenizar(text)  
                result = PROGRAM(tokens)
                print(tokens)
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
        tokens=tokenizar(contents)  
        print(tokens)
        result = PROGRAM(tokens)
        if result != -1:
            print("La entrada es válida")
        else:
            print("Error de sintaxis")

parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, help='The filename to read')
args = parser.parse_args()
read_file(args.filename)