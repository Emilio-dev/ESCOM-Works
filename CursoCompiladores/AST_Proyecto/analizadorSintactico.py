import argparse
from collections import deque

symbol_table = {
}

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
                return Token("andToken","y")
                       
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

class TreeNode:
    def __init__(self, value,token_type):
        self.value = value
        self.token_type = token_type
        self.children = []

    def add_child(self, node):
        self.children.append(node)

    def get_children(self):
        return self.children

def get_children_values(node):
    values = []
    stack = [node]

    while stack:
        current_node = stack.pop()
        values.append(current_node.value)

        stack.extend(current_node.children)

    return values

def determine_operation_type(arr):
    first_element = arr[0]

    if isinstance(first_element, (int, float)):
        operation_type = "arithmetic_numbers"
    elif isinstance(first_element, str) or isinstance(first_element, list):
        operation_type = "arithmetic_strings"
    elif isinstance(first_element, bool):
        operation_type = "logical"
    else:
        operation_type = "unknown"

    ignored_tokens = ["+", "-", "*", "/","y","o","<","<=",">",">=","==","!=","!"]
    rest_of_array = arr[1:]

    for element in rest_of_array:
        
        if element in ignored_tokens:
            continue
        if operation_type == "arithmetic_numbers":
            if not isinstance(element, (int, float)):
                return False,operation_type
        elif operation_type == "arithmetic_strings":
            if not (isinstance(element, str) or isinstance(element, list)):
                return False,operation_type
        elif operation_type == "logical":
            if not isinstance(element, bool):
                return False,operation_type

    return True,operation_type

def formatear_operacion(operacion):
    operacion_str = "".join(
    str(elem) if elem not in ["y", "o","!"]
    else " and " if elem == "y"
    else " or "  if elem == "o"
    else "not" for elem in operacion
    )
    return operacion_str

def formatear_operacion_str(lista):
    resultado = []
    for cadena in lista:
        cadena_sin_token = cadena.replace("+", "")
        resultado.append(cadena_sin_token)
    return resultado

def realizar_operaciones(operacion):
    resultado = []
    aux=[]
    for a,b in operacion:
            if b == "idToken":
                a=a.strip()
                if a in symbol_table:
                    aux.append(symbol_table[a])
                else:
                    print("No esta definida:",a)
                    return resultado    
            else:
                aux.append(a)         
    validez,tipoOperacion = determine_operation_type(aux)
    if validez== False:
        print("Error de tipos")
        return resultado  
    
    if tipoOperacion=="arithmetic_strings":
        operacion_str = formatear_operacion_str(aux)
        resultado = ''.join(operacion_str)
    elif tipoOperacion=="arithmetic_numbers":
        operacion_str = formatear_operacion(aux)
        resultado = eval(operacion_str)
    elif tipoOperacion=="logical":
        print("aaaaaaaaaaa")
    return resultado

def traverse_ast(root):
    queue = deque(root.children)
    while queue:
        node = queue.popleft()
        
        if node is not None:
            
            if node.token_type == 'varToken':
                variable_name = node.children[0].value
                variable_name=variable_name.strip()
                if variable_name in symbol_table:
                    print("Error: La variable '{}' ya ha sido definida".format(variable_name))
                else:
                    if len(node.children[0].children) > 0:
                        value_node = node.children[0].children[0]
                        children_data = [(child.value, child.token_type) for child in value_node.children]
                        variable_value = realizar_operaciones(children_data)
                        variable_name=variable_name.strip()
                    else:
                        variable_value = None    
                    symbol_table[variable_name] = variable_value

            elif node.token_type == 'idToken':
                variable_name = node.value
                node = queue.popleft()
                if variable_name in symbol_table:
                    if len(node.children) > 0:
                        children_data = [(child.value, child.token_type) for child in node.children]
                        variable_value = realizar_operaciones(children_data)
                        symbol_table[variable_name] = variable_value
                else:
                    print("Error: La variable '{}' no ha sido definida previamente".format(variable_name))

            elif node.token_type == 'imprimirToken':
                variable_name = node.children[0].value
                children_data = [(child.value, child.token_type) for child in node.children]
                variable_value = realizar_operaciones(children_data)
                print(variable_value)

            elif node.token_type == 'siToken':
                lparen = node.children[0]
                children_data = [(child.value, child.token_type) for child in lparen.children]
                variable_value = realizar_operaciones(children_data)
                if variable_value==True:
                    queue.extend(node.children[1].children[0].children)
                else:
                    if len(node.children[1].children)>1:
                        queue.extend(node.children[1].children[1].children[0].children)

                #si es verdadero
            elif node.token_type == 'mientrasToken':
                lparen = node.children[0]
                children_data = [(child.value, child.token_type) for child in lparen.children]                
                variable_value = realizar_operaciones(children_data)
                queue.extend(node.children[1].children[0].children)
                if variable_value==True:
                    queue.extend([node])

            elif node.token_type == 'paraToken':
                lparen = node.children[0]
                #queue.extend(node.children[1].children)
                print("no terminado")
                
def print_tree(node, level=0):
    if node is not None:
        print("  " * level + str(node.value)+ " " + str(node.token_type))
        for child in node.children:
            print_tree(child, level + 1)    

def PROGRAM(tokens):
    if len(tokens) == 0:
        print("Error: Invalid program")
        return -1
    else:
        idx = 0
        tree_root = TreeNode("PROGRAM_BEGGIN","NT")
        while idx < len(tokens)-1:
            if idx!=-1 or tokens[idx].type != "EOF":
                idx = DECLARATION(tokens, idx,tree_root)
            else:
                return -1    
        #print_tree(tree_root)  
        traverse_ast(tree_root)  

def DECLARATION(tokens, idx,parent_node):#no se como poner expr_stmt ,le movi y le agrege desde verdadero
    if idx >= len(tokens):
        return idx
    tokens[idx].type = tokens[idx].type
    if tokens[idx].type == "claseToken":
        idx = CLASS_DECL(tokens, idx,parent_node)
    elif tokens[idx].type == "funToken":
        idx = FUN_DECL(tokens, idx,parent_node)
    elif tokens[idx].type == "varToken":
        idx = VAR_DECL(tokens, idx,parent_node)
    elif tokens[idx].type in ["idToken","paraToken","siToken", "imprimirToken", "retornarToken", "mientrasToken", "lcorchToken","verdaderoToken","falsoToken","nuloToken","stringToken","integerToken","floatToken","superToken"]:
        idx = STATEMENT(tokens, idx,parent_node)
    else:
        print("Error: Invalid decla ration at position " + str(idx))
        return -1
    return idx

def CLASS_DECL(tokens, idx,parent_node):#falta
    if tokens[idx].type == "claseToken":
        class_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(class_node)
        idx += 1
        if tokens[idx].type == "idToken":
            id_node=TreeNode(tokens[idx].value,tokens[idx].type)
            class_node.add_child(id_node)
            idx += 1
            idx = CLASS_INHER(tokens, idx,id_node)
            if tokens[idx].type == "lcorchToken":
                lcorch_node=TreeNode(tokens[idx].value,tokens[idx].type)
                id_node.add_child(lcorch_node)
                idx += 1
                idx = FUNCTIONS(tokens, idx,lcorch_node)
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

def CLASS_INHER(tokens, idx,parent_node):
    if tokens[idx].type == "menorToken":
        menor_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(menor_node)
        idx += 1
        if tokens[idx].type == "idToken":
            id_node=TreeNode(tokens[idx].value,tokens[idx].type)
            menor_node.add_child(id_node)    
            idx += 1
    return idx

def FUN_DECL(tokens, idx,parent_node):
    if tokens[idx].type == "funToken":
        fun_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(fun_node)
        idx += 1
        idx = FUNCTION(tokens, idx,fun_node)
    else:
        print("Error: 'fun' keyword expected at position " + str(idx))
        return -1
    return idx

def VAR_DECL(tokens, idx,parent_node): #falta pcoma
    if tokens[idx].type == "varToken":
        var_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(var_node)
        idx += 1
        if tokens[idx].type == "idToken":

            identifier_node = TreeNode(tokens[idx].value,tokens[idx].type)
            var_node.add_child(identifier_node)
            idx += 1
            idx = VAR_INIT(tokens, idx,identifier_node)
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

def VAR_INIT(tokens, idx,parent_node):
    if tokens[idx].type == "igualToken":

        equal_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(equal_node)
        idx += 1


        idx = EXPRESSION(tokens, idx,equal_node)
    return idx

def STATEMENT(tokens, idx,parent_node):
    if tokens[idx].type == "paraToken":
        idx = FOR_STMT(tokens, idx,parent_node)
    elif tokens[idx].type == "siToken":
        idx = IF_STMT(tokens, idx,parent_node)    
    elif tokens[idx].type == "imprimirToken":
        idx = PRINT_STMT(tokens, idx,parent_node)
    elif tokens[idx].type == "retornarToken":
        idx = RETURN_STMT(tokens, idx,parent_node)
    elif tokens[idx].type == "mientrasToken":
        idx = WHILE_STMT(tokens, idx,parent_node)
    elif tokens[idx].type == "lcorchToken":
        idx = BLOCK(tokens, idx,parent_node)
    else:
        idx = EXPR_STMT(tokens, idx,parent_node)
    return idx

def EXPR_STMT(tokens, idx,parent_node):
    idx = EXPRESSION(tokens, idx,parent_node)
    if tokens[idx].type == "pcomaToken":
        idx += 1
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT(tokens, idx,parent_node):
    if tokens[idx].type == "paraToken":
        for_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(for_node)
        idx += 1
        if tokens[idx].type == "lparenToken":
            lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
            for_node.add_child(lparen_node)
            idx += 1
            idx = FOR_STMT_1(tokens, idx,lparen_node)
            idx = FOR_STMT_2(tokens, idx,lparen_node)
            idx = FOR_STMT_3(tokens, idx,lparen_node)
            if tokens[idx].type == "rparenToken":
                idx += 1
                idx = STATEMENT(tokens, idx,for_node)
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

def FOR_STMT_1(tokens, idx,parent_node): #duda
    if tokens[idx].type == "varToken":
        idx=VAR_DECL(tokens, idx,parent_node)
        return idx
    idx=EXPR_STMT(tokens, idx,parent_node)
    if tokens[idx].type == "pcomaToken":
            idx += 1
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT_2(tokens, idx,parent_node): #no se bien si hay que declarar expression y luego checar ;
    if tokens[idx].type == "pcomaToken":
        idx += 1
        return idx
    idx = EXPRESSION(tokens, idx,parent_node)
    if tokens[idx].type == "pcomaToken":
        idx += 1    
    else:
        print("Error: Missing ';' at position " + str(idx))
        return -1
    return idx

def FOR_STMT_3(tokens, idx,parent_node):
    if tokens[idx].type == "rparenToken":
        return idx
    idx = EXPRESSION(tokens, idx,parent_node)
    return idx

def IF_STMT(tokens, idx,parent_node):
    if tokens[idx].type == "siToken":
        if_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(if_node)
        idx += 1
        if tokens[idx].type == "lparenToken":
            lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
            if_node.add_child(lparen_node)
            idx += 1
            idx = EXPRESSION(tokens, idx,lparen_node)
            if tokens[idx].type == "rparenToken":
                rparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
                if_node.add_child(rparen_node)
                idx += 1
                idx = STATEMENT(tokens, idx,rparen_node)
                idx = ELSE_STATEMENT(tokens, idx,rparen_node)
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

def ELSE_STATEMENT(tokens, idx,parent_node):
    if tokens[idx].type == "entoncesToken":
        entonces_nodo = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(entonces_nodo)
        idx += 1
        idx = STATEMENT(tokens, idx,entonces_nodo)
    return idx

def PRINT_STMT(tokens, idx,parent_node):
    if tokens[idx].type == "imprimirToken":
        print_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(print_node)
        idx += 1
        idx = EXPRESSION(tokens, idx,print_node)
        if tokens[idx].type == "pcomaToken":
            idx += 1
        else:
            print("Error: Missing ';' at position " + str(idx))
            return -1
    else:
        print("Error: 'print' keyword expected at position " + str(idx))
        return -1
    return idx

def RETURN_STMT(tokens, idx,parent_node):
    if tokens[idx].type == "retornarToken":
        return_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(return_node)
        idx += 1
        idx = RETURN_EXP_OPC(tokens, idx,return_node)
        if tokens[idx].type == "pcomaToken":
            idx += 1
        else:
            print("Error: Missing ';' at position " + str(idx))
            return -1
    else:
        print("Error: 'return' keyword expected at position " + str(idx))
        return -1
    return idx

def RETURN_EXP_OPC(tokens, idx,parent_node):
    if tokens[idx].type != "pcomaToken":
        idx = EXPRESSION(tokens, idx,parent_node)
    return idx

def WHILE_STMT(tokens, idx,parent_node):
    if tokens[idx].type == "mientrasToken":
        while_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(while_node)
        idx += 1
        if tokens[idx].type == "lparenToken":
            lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
            while_node.add_child(lparen_node)
            idx += 1
            idx = EXPRESSION(tokens, idx,lparen_node)
            if tokens[idx].type == "rparenToken":
                rparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
                while_node.add_child(rparen_node)
                idx += 1
                idx = STATEMENT(tokens, idx,rparen_node)
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

def BLOCK(tokens, idx,parent_node):
    if tokens[idx].type == "lcorchToken":
        lcorch_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(lcorch_node)
        idx += 1
        idx = BLOCK_DECL(tokens, idx,lcorch_node)
        if tokens[idx].type == "rcorchToken":
            idx += 1
        else:
            print("Error: Missing '}' at position " + str(idx))
            return -1
    else:
        print("Error: Missing '{' at position " + str(idx))
        return -1
    return idx

def BLOCK_DECL(tokens, idx,parent_node):
    if tokens[idx].type != "rcorchToken":
        idx = DECLARATION(tokens, idx,parent_node)
        idx = BLOCK_DECL(tokens, idx,parent_node)
    return idx

def EXPRESSION(tokens, idx,parent_node):
    idx = ASSIGNMENT(tokens, idx,parent_node)
    return idx

def ASSIGNMENT(tokens, idx,parent_node):
    idx = LOGIC_OR(tokens, idx,parent_node)
    idx = ASSIGNMENT_OPC(tokens, idx,parent_node)
    return idx

def ASSIGNMENT_OPC(tokens, idx,parent_node):
    if tokens[idx].type == "igualToken":
        igual_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(igual_node)
        idx += 1
        idx = EXPRESSION(tokens, idx,igual_node)
    return idx

def LOGIC_OR(tokens, idx,parent_node):
    idx = LOGIC_AND(tokens, idx,parent_node)
    idx = LOGIC_OR_2(tokens, idx,parent_node)
    return idx

def LOGIC_OR_2(tokens, idx,parent_node):
    if tokens[idx].type == "orToken":
        or_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(or_node)
        idx += 1
        idx = LOGIC_AND(tokens, idx,or_node)
        idx = LOGIC_OR_2(tokens, idx,or_node)
    return idx

def LOGIC_AND(tokens, idx,parent_node):
    idx = EQUALITY(tokens, idx,parent_node)
    idx = LOGIC_AND_2(tokens, idx,parent_node)
    return idx

def LOGIC_AND_2(tokens, idx,parent_node):
    if tokens[idx].type == "andToken":
        and_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(and_node)
        idx += 1
        idx = EQUALITY(tokens, idx,parent_node)
        idx = LOGIC_AND_2(tokens, idx,parent_node)
    return idx

def EQUALITY(tokens, idx,parent_node):
    idx = COMPARISON(tokens, idx,parent_node)
    idx = EQUALITY_2(tokens, idx,parent_node)
    return idx

def EQUALITY_2(tokens, idx,parent_node):
    if tokens[idx].type in ["diferenteToken", "igualAToken"]:
        operator_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(operator_node)
        idx += 1
        idx = COMPARISON(tokens, idx,parent_node)
        idx = EQUALITY_2(tokens, idx,parent_node)
    return idx

def COMPARISON(tokens, idx,parent_node):
    idx = TERM(tokens, idx,parent_node)
    idx = COMPARISON_2(tokens, idx,parent_node)
    return idx

def COMPARISON_2(tokens, idx,parent_node):
    if tokens[idx].type in ["mayorToken", "mayorIgualToken", "menorToken", "menorIgualToken"]:
        operator_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(operator_node)
        idx += 1
        idx = TERM(tokens, idx,parent_node)
        idx = COMPARISON_2(tokens, idx,parent_node)
    return idx

def TERM(tokens, idx,parent_node):
    idx = FACTOR(tokens, idx,parent_node)
    idx = TERM_2(tokens, idx,parent_node)
    return idx

def TERM_2(tokens, idx,parent_node):
    if tokens[idx].type in ["menosToken", "masToken"]:
        operator_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(operator_node)
        idx += 1
        idx = FACTOR(tokens, idx,parent_node)
        idx = TERM_2(tokens, idx,parent_node)
    return idx

def FACTOR(tokens, idx,parent_node):
    idx = UNARY(tokens, idx,parent_node)
    idx = FACTOR_2(tokens, idx,parent_node)
    return idx

def FACTOR_2(tokens, idx,parent_node):
    if tokens[idx].type in ["divToken", "multiToken"]:
        operator_node=TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(operator_node)
        idx += 1
        idx = UNARY(tokens, idx,parent_node)
        idx = FACTOR_2(tokens, idx,parent_node)
    return idx

def UNARY(tokens, idx,parent_node):
    if tokens[idx].type in ["notToken", "menosToken"]:
        operator_node=TreeNode(tokens[idx].type,tokens[idx].value)
        parent_node.add_child(operator_node)
        idx += 1
        idx = UNARY(tokens, idx,parent_node)
    else:
        idx = CALL(tokens, idx,parent_node)
    return idx

def CALL(tokens, idx,parent_node):
    idx = PRIMARY(tokens, idx,parent_node)
    idx = CALL_2(tokens, idx,parent_node)
    return idx

def CALL_2(tokens, idx,parent_node): #creo faltan errores
    if tokens[idx].type == "lparenToken":
        lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(lparen_node)
        idx += 1
        idx = ARGUMENTS_OPC(tokens, idx,lparen_node)
        if tokens[idx].type == "rparenToken":
            rparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
            parent_node.add_child(rparen_node)
            idx += 1
            idx = CALL_2(tokens, idx,rparen_node)
        else:
            print("Error: Missing ')' at position " + str(idx))
            return -1
    elif tokens[idx].type == "puntoToken" and tokens[idx + 1].type == "idToken":
        punto_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(punto_node)
        idx += 1
        id_node = TreeNode(tokens[idx].value,tokens[idx].type)
        punto_node.add_child(id_node)
        idx += 1
        idx = CALL_2(tokens, idx,id_node)
    return idx

def CALL_OPC(tokens, idx,parent_node):
    if tokens[idx].type == "puntoToken":
        punto_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(punto_node)
        idx += 1
        if tokens[idx].type == "idToken":
            id_node = TreeNode(tokens[idx].value,tokens[idx].type)
            punto_node.add_child(id_node)
            idx += 1
            idx = CALL_2(tokens, idx,id_node)
        else:
            print("Error: Missing identifier at position " + str(idx))
            return -1
    return idx

def PRIMARY(tokens, idx,parent_node):
    if tokens[idx].type in ["verdaderoToken", "falsoToken", "nuloToken", "esteToken", "floatToken", "integerToken", "stringToken", "idToken", "superToken"]:
        terminal_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(terminal_node)
        idx += 1

    elif tokens[idx].type == "superToken":
        terminal_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(terminal_node)
        idx += 1
        if tokens[idx].type == "puntoToken" and tokens[idx + 1].type == "idToken":
            punto_node = TreeNode(tokens[idx].value,tokens[idx].type)
            terminal_node.add_child(punto_node)
            idx += 1
            id_node = TreeNode(tokens[idx].value,tokens[idx].type)
            punto_node.add_child(id_node)
            idx += 1
        else:
            print("Error: Missing '.' and identifier at position " + str(idx))
            return -1
    elif tokens[idx].type == "lparenToken":
        lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(lparen_node) 
        idx += 1
        idx = EXPRESSION(tokens, idx,lparen_node)
        if tokens[idx].type == "rparenToken":
            idx += 1
        else:
            print("Error: Missing ')' at position " + str(idx))
            return -1
    else:
        print("Error: Invalid primary expression at position " + str(idx))
        return -1
    return idx

def FUNCTION(tokens, idx,parent_node):
    if tokens[idx].type == "idToken":
        id_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(id_node)
        idx += 1
        if tokens[idx].type == "lparenToken":
            lparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
            id_node.add_child(lparen_node)
            idx += 1
            idx = PARAMETERS_OPC(tokens, idx,lparen_node)
            if tokens[idx].type == "rparenToken":
                rparen_node = TreeNode(tokens[idx].value,tokens[idx].type)
                id_node.add_child(rparen_node)
                idx += 1
                idx = BLOCK(tokens, idx,parent_node)
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

def FUNCTIONS(tokens, idx,parent_node):
    if tokens[idx].type == "rcorchToken":
        return idx
    idx = FUNCTION(tokens, idx,parent_node)
    idx = FUNCTIONS(tokens, idx,parent_node)
    return idx

def PARAMETERS_OPC(tokens, idx,parent_node):
    if tokens[idx].type != "rparenToken":
        idx = PARAMETERS(tokens, idx,parent_node)
    return idx

def PARAMETERS(tokens, idx,parent_node):
    if tokens[idx].type == "idToken":
        id_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(id_node)
        idx += 1
        idx = PARAMETERS_2(tokens, idx,id_node)
    else:
        print("Error: Missing parameter name at position " + str(idx))
        return -1
    return idx

def PARAMETERS_2(tokens, idx,parent_node):
    if tokens[idx].type == "comaToken":
        coma_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(coma_node)
        idx += 1
        if tokens[idx].type == "idToken":
            id_node = TreeNode(tokens[idx].value,tokens[idx].type)
            coma_node.add_child(id_node)
            idx += 1
            idx = PARAMETERS_2(tokens, idx,id_node)
        else:
            print("Error: Missing parameter name at position " + str(idx))
            return -1
    return idx

def ARGUMENTS_OPC(tokens, idx,parent_node):
    if tokens[idx].type != "rparenToken":
        idx = ARGUMENTS(tokens, idx,parent_node)
    return idx

def ARGUMENTS(tokens, idx,parent_node):
    idx = EXPRESSION(tokens, idx,parent_node)
    idx = ARGUMENTS_2(tokens, idx,parent_node)
    return idx

def ARGUMENTS_2(tokens, idx,parent_node):
    if tokens[idx].type == "comaToken":
        coma_node = TreeNode(tokens[idx].value,tokens[idx].type)
        parent_node.add_child(coma_node)
        idx += 1
        idx = EXPRESSION(tokens, idx,coma_node)
        idx = ARGUMENTS_2(tokens, idx,coma_node)
    return idx

def read_file(filename):
    if filename == "none" or filename == None:
        print("Por favor, ingrese los argumentos a tokenizar: ")
        try:
            while True:
                text=input()
                tokens=tokenizar(text)  
                result,treeroot = PROGRAM(tokens)
                #print(tokens)
                if result != -1:
                    continue
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
        #print(tokens)
        result = PROGRAM(tokens)
        if result == -1:
            print("Error de sintaxis")

parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, help='The filename to read')
args = parser.parse_args()
read_file(args.filename)