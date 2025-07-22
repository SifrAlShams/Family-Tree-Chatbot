# Family Tree Chatbot

This project implements a **family relationship chatbot** using Python's `tkinter` GUI and Prolog (via `pyswip`) for logic-based inference. The chatbot answers questions about family relations based on a knowledge base.

## Overview

* GUI-based chatbot that accepts user queries about family relationships
* Converts natural language input into Prolog queries
* Uses a Prolog knowledge base to infer answers
* Handles both relationship retrieval and count-based queries

## Features

* Recognizes natural language terms (e.g., "father", "sister", "how many children")
* Maps them to Prolog rules and facts
* Query formulation based on:

  * Named entities (from a fixed name list)
  * Recognized relationship terms
  * Count keywords
* Visual interface built with `tkinter`

## Dependencies

* Python 3
* `pyswip`: Python interface to SWI-Prolog
* `tkinter`: Standard Python GUI library

Install `pyswip` via pip:

```bash
pip install pyswip
```

## File Structure

* `family_tree_chatbot.py`: Main GUI and chatbot logic
* `knowledge_base.pl`: Prolog file containing family facts and rules

## How it Works

1. User enters a question (e.g., "Who is the father of salim?")
2. Text is parsed and matched against predefined keywords and names
3. Matching results are mapped to a Prolog predicate
4. A Prolog query is formed and executed using `pyswip`
5. Result is displayed in the GUI

## Key Prolog Rules

* **parent(X, Y)**: X is a parent of Y
* **baap(X, Y)**: X is father of Y
* **maan(X, Y)**: X is mother of Y
* **beta(X, Y)**: X is son of Y
* **beti(X, Y)**: X is daughter of Y
* **siblings(X, Y)**: X and Y share a mother
* **countX(Y, Z)**: Number of X (e.g., children, brothers) of Z

## Sample Queries

| Query                               | Prolog Formed          | Result Type |
| ----------------------------------- | ---------------------- | ----------- |
| Who is the father of salim?         | baap(X, salim)         | Name        |
| How many children does kausar have? | countaulaad(X, kausar) | Number      |
| Is nadir the son of chote?          | beta(nadir, choteKhan) | Yes/No      |

## Usage

Run the chatbot using:

```bash
python family_tree_chatbot.py
```

Ensure `knowledge_base.pl` is in the same directory.
