import tkinter as tk
from pyswip import Prolog

window = tk.Tk()
window.title('Chatbot')
window.geometry("500x400+10+20")
window.configure(bg='#8B8B83')

names = ['chote', 'barre', 'salim', 'nadir', 'asad', 'rizwan', 'burhan', 'rashid', 'akram', 'choti', 'barri', 'kausar', 'nahid', 'sumra', 'salima', 'sanam', 'rabia']
rules = {'mianbiwi': ['shohar', 'shoher', 'husband', 'begum', 'begam', 'wife', 'mian'], 'parent': ['waliden', 'walden', 'waldain', 'waleden'], 'gins': ['gender', 'sex'], 'baap': ['abu', 'abbu', 'baba', 'walid', 'father', 'dad', 'daddy', 'papa'], 'maan': ['mother', 'ami', 'amman', 'maa', 'mom', 'mommy', 'mama'], 'beti': ['daughter', 'bachi', 'betiyan', 'betiyaan'], 'beta': ['son', 'sons', 'bacha', 'bety', 'betay'], 'dada': ['grandfather'], 'nana': ['grandpa'], 'dadi': ['grandmother'], 'nani': ['grandma'], 'pota': ['grandson'], 'bahu': ['daughter-in-law'], 'nawasa': [], 'bhai': ['brother'], 'behn': ['sister', 'api', 'baji'], 'chachataya': ['uncle', 'chacha', 'taya'], 'khala': ['aunt', 'auntie'], 'sussar': ['father-in-law'], 'sala': ['brother-in-law', 'salay', 'saly', 'saaly', 'saalay'], 'baapDada': ['ancestors'], 'aulaad': ['children'], 'siblings': [], 'kitnyBachy': [], 'kitnySiblings': [], 'kitniBehn': [], 'kitnyBhai': [], 'family': []}
count = ["kitny", "kitni", "count", "many"]


def goal(inp):
    result = ['rule', 'X', 'Y']
    inp = inp.lower()
    inp = inp.replace("?", "").replace(".", "").replace("'s", "")
    splitted_string = inp.split(" ")
    flag_count = False
    flag_name = 0
    for word in splitted_string:
        if word in count:
            flag_count = True
        for key in rules.keys():
            if word == key or word in rules[key]:
                result[0] = key
                result[1] = key.capitalize()
            else:
                pass
        if word in names:
            if word in ['chote', 'barre']:
                word = word + 'Khan'
            elif word in ['choti', 'barri']:
                word = word + 'Rani'
            if flag_name == 0:
                flag_name += 1
                result[2] = word
            elif flag_name == 1:
                result[1] = word
                flag_name += 1

    if flag_count:
        result[0] = "count" + result[0]
    if flag_name == 2:
        print("Swap")
        result[1], result[2] = result[2], result[1]

    return (result[0] + '(' + result[1] + ',' + result[2] + ')', flag_name)


def get_text():
    inp = input_txt.get(1.0, "end-1c")
    goal_statement = goal(inp)
    print(goal_statement[0])
    prolog = Prolog()
    prolog.consult("knowledge_base.pl")
    if goal_statement[1] == 0:
        print("Invlaid name")
        return
    else:
        result = prolog.query(goal_statement[0])
        result = list(result)
        if goal_statement[1] == 2:
            r = bool(result)
            if r:
                r = "Yes"
            else:
                r = "No"
        elif len(result) == 0:
            r = 0
        else:
            r = []
            for dict in result:
                for key in dict.keys():
                    r.append(dict[key])
        output.config(text=r)


# add a label
label = tk.Label(window, text="BigoOneChat", fg='black', bg='#8B8B83', font=("Raleway", 20))
label.place(x=150, y=10)

label = tk.Label(window, text="Write your query below.", fg='black', bg='#8B8B83', font=("Raleway", 10))
label.place(x=80, y=150)

# TextBox Creation
input_txt = tk.Text(window, bg='#EEEEDF', font=("Raleway", 10), fg='black', height=3, width=50)
input_txt.place(x=80, y=180)
btn = tk.Button(window, text='Submit Query', fg='black', bg='#CDCDC0', command=get_text)
btn.place(x=80, y=250)

output = tk.Label(window, text="", fg='black', bg='#EEEEDF', font=("Raleway", 10), height=3, width=44)
output.place(x=80, y=300)
window.mainloop()
