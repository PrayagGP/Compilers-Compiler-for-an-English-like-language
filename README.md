# Compiler for an English-like Language

## Overview

This project involves building a compiler for an English-like language using **Lex** and **Yacc**. The compiler translates high-level, human-readable language input into a format suitable for processing. It performs **lexical analysis** and **syntax analysis** to ensure the input conforms to defined language specifications.

## Tags
- **Compilers**
- **Lex**
- **Yacc**

## Project Description

Compilers are sophisticated software tools that translate high-level programming languages into machine code, allowing programs to be executed by a computer's hardware. They perform a series of complex tasks including:
- Lexical Analysis
- Syntax Analysis
- Semantic Analysis
- Optimization
- Code Generation

This project focuses on building the **lexical** and **syntactic** analysis components of a compiler for an English-like language.

## Language Specifications

### Lexical Specifications:
- **Word**: A string of at least 3 characters and up to 26 characters, excluding any digits and whitespace.
- **Startword**: A word that begins with an uppercase letter.
- **Stop**: A full stop (`.`).
- **Comma**: A comma (`,`) to separate words.
- **Hyphen**: A hyphen (`-`) to connect words.
- **Whitespace**: Any space between words (spaces, tabs).

### Syntactic Specifications:
- The input string should **start with a Startword** and **end with a Stop** (`.`).
- **Comma** and **hyphens** should be placed between words (two commas cannot be placed next to each other).
- If the input contains both **comma** and **hyphen**, the grammar should **parse the comma first**.
- If there are multiple commas or hyphens, the grammar should process **the leftmost occurrence first**.

## Task Breakdown

### 1. Lexer:
The **lexer** tokenizes input into tokens as per the Lexical Specifications, while ignoring whitespace. It identifies tokens such as `WORD`, `STARTWORD`, `STOP`, `COMMA`, `HYPHEN`, and `QUOTATIONS`.

- **Handling Long Words**: If a word exceeds 26 characters, it will be split into two words.
  - Example: The input `Anhueg)*nkhsgvcl;’,bhdyrgcgyu` will be split into `Anhueg)*nkhsgvcl;’,bhdyrgc` and `gyu`.
- **Error Handling**: Any lexical errors (e.g., unexpected characters) are reported separately.
- Display a symbol table generated during lexical analysis.

### 2. Parser:
The **parser** verifies if the input string follows the rules specified in the Syntactic Specifications using a context-free grammar defined in Yacc.

- **Input Validation**: Determines if the given input is **valid** based on the syntactic rules.
- **Handling Punctuation**: Ensures commas and hyphens are correctly placed between words, and that commas are prioritized if both are present.
- Print the accepted input (considering tokens, not the original string) with one space between tokens (skip the quotations).

###  Running the code:
- lex lexer.l
- yacc -d parser.y
- gcc lex.yy.c y.tab.c -o parser -lfl
- ./parser

![image](https://github.com/user-attachments/assets/dc85049f-bd91-4970-94e4-e6c91eea06e2)
![image](https://github.com/user-attachments/assets/1124f9c1-b443-45ef-bf91-2addccca9395)
![image](https://github.com/user-attachments/assets/11a95208-08a9-492c-a37d-aab649643f29)

### Tasks done:
- Implemented a lexical analyzer based on the required specifications.
- Lexical error reporting.
- Syntactic analyser based on the language specifications.
- Symbol table.
- Check for validity of string and reports invalid string.
- Prints the stream of tokens of valid string.

### Grammar
The grammer used for parsing the string accorsing to the specifications is: 
- Acc: St {printf("Valid string\n\n"); return 0; }
- St: START STOP
  | START word STOP
  ;

- word: COM type word
    | HYP type word
    | type word
    | type
    | COM type
    | HYP type
    ;

- type: START
    | WORD
    ;

#### Non Terminals used:
- Acc: If this rule is satisfied then the string gets accepted.
- St: This covers the rule that the string must begin with a word beginning with an uppercase letter (denoted by START token) and end with a full stop (STOP).
- word: This takes into account different scenarios of commas (COM) and hyphens (HYP).
- type: This for two different types of words, beginning with an uppercase letter (START) or a lowercase letter (WORD).




