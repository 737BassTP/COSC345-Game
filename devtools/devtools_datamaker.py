# devtools_quizmaker.py for COSC345-Game (Duneatin')
# Thomas Pedersen, 2023
# -------------------------------------
# Version history.
# 29 aug: Quiz
# 30 aug: Improved main
# 31 aug: Chat
# 01 sep: Bugfix in "chat inspect".
# 03 sep: Added templates for Quest (unimplemented).
# 05 sep: Added templates for Event (unimplemented).
# 06 sep: Bugfix in merge script.
# -------------------------------------
# Command-Line Args:
# quiz      : Type=Quiz
# chat      : Type=Chat
# quest     : Type=Quest
# event     : Type=Event
# make      : Make a Quiz/Chat/Quest/Event
# merge     : Merge several smaller subfiles into a single huge main file.
# inspect   : Find errors in the main file.
# EXAMPLE:  : devtools.py quiz make
# -------------------------------------
# Notes:
# - If an error occurs during "make" (quiz/chat), the "lost" data can be recovered from the tmp.dat-file.
#   Any successful make operation deletes the tmp.dat-file.
# -------------------------------------
# Quiz : Give answers to questions.
# Chat : A monologue spoken to the player.
# Quest: Do tasks to unlock certain things.
# Event: Something that happens in a span between two dates and times.
# -------------------------------------

import colorama # https://www.geeksforgeeks.org/print-colors-python-terminal/
from termcolor import colored
from statistics import median
import sys
import os
import shutil

FOLDER="datamaker/"
FILEEXT=".dat"
QUIZFILE  = FOLDER+"quiz" +FILEEXT
CHATFILE  = FOLDER+"chat" +FILEEXT
QUESTFILE = FOLDER+"quest"+FILEEXT
EVENTFILE = FOLDER+"event"+FILEEXT
TMPFILE   = FOLDER+"tmp"  +FILEEXT

def print_nonempty(msg):
    if msg != "":
        print(msg)
def get_input(msg):
    if msg == "-1":
        sys.exit("Received '-1'.")
def get_string(msg):
    get_input(msg)
    msg=colored("Text:","black","on_yellow")+" "+msg
    print_nonempty(msg+" "+colored("(abc...)","yellow"))
    return input()
def get_int(msg):
    get_input(msg)
    msg=colored("Number:","white","on_blue")+" "+msg
    print_nonempty(msg)
    return int(input())
def get_bool(msg):
    get_input(msg)
    msg=colored("Bool:","white","on_red")+" "+msg+colored("(0-1)","yellow")
    print_nonempty(msg)
    return int(input())%2
def byte(val):
    return val%256
def get_byte(msg):
    return byte(get_int(msg+" "+colored("(0-255)","yellow")))
def print_error(msg):
    print(colored(msg,"white","on_red"))
def text_rgb(msg):
    ml=len(msg)
    ret=""
    for i in range(ml):
        im=i%5
        ret+=colored(msg[i:i+1],["","light_"][im!=1]+["red","yellow","green","blue","magenta"][im])
    return ret
def fw(file,data):
    dt=type(data)
    if dt is int:
        data=byte(data)
        file.write(data.to_bytes())
    elif dt is str:
        file.write(bytearray(data,"utf-8"))
        file.write(int(0).to_bytes())
    else:
        print_error("'fw' did not get 'int' or 'str'")
def write(file,data):
    fw(file,data)
    return data
def file_exists(file):
    return os.path.isfile(file)
def buffer_read(file,bytez):
    return int.from_bytes(file.read(bytez),byteorder="little")
def buffer_read_string(file):
    ret=""
    while 1:
        val=file.read(1)
        if val == b'': # eof
            break
        if val == b'\x00':
            break
        ret += str(val)[2:3]
    if ret[0] == chr(92): # remove "\" (will bug out if actual string starts with "\")
        ret=ret[1:]
    #print('readstr="'+ret+'"')
    return ret
def list_has_duplicates(ls): # O(n^2)
    ql=len(ls)
    for i in range(ql):
        for j in range(ql):
            if i == j:
                continue
            if ls[i] == ls[j]:
                return 1
    return 0
def fileid(file,fid):
    return file.replace(".","_"+str(fid)+".")
def filename_str(file):
    return file.replace(FOLDER,"").replace(FILEEXT,"")
#######################################
def script_merge_any(fn):
    # Merges subfiles into one main file.
    # Prepends every subfile with its byte-length.
    qfiles = [FOLDER+f for f in os.listdir(FOLDER) if f.startswith(fn) and f.endswith(FILEEXT)] # https://stackoverflow.com/a/3964696
    mnam=fn+FILEEXT
    if mnam in qfiles:
        qfiles.pop(0) # "." < "_" (assuming no file names have been changed)
    print(qfiles)
    qlen=len(qfiles)
    if qlen == 0:
        print_error("No files to merge!")
        sys.exit()
    if qlen >= 256:
        print_error("Warning!\nThere exists 256 or more "+fn+"!\nRemove some and try again.\nWill now exit.")
        sys.exit()
    mfile=open(FOLDER+mnam,"wb")
    mfile.write((qlen-1).to_bytes()) # -1 to support 256 and not 255; then do +1 when reading.
    for fil in qfiles:
        qf=open(fil,"rb")
        mfile.write(os.path.getsize(fil).to_bytes(2,byteorder="little"))
        mfile.write(qf.read())
        qf.close()
    mfile.close()
    print("All "+fn+" files merged into "+mnam)
def script_patch_any(typstr,t1=None,d1=None,t2=None,d2=None,t3=None,d3=None,t4=None,d4=None):
    patch=[]
    for i in range(8):
        patch.append(None)
    if t1 is not None and d1 is not None:
        patch[0+0]=t1
        patch[0+1]=d1
    if t2 is not None and d2 is not None:
        patch[2+0]=t2
        patch[2+1]=d2
    if t3 is not None and d3 is not None:
        patch[4+0]=t3
        patch[4+1]=d3
    if t4 is not None and d4 is not None:
        patch[6+0]=t4
        patch[6+1]=d4
    nonesum=0
    for i in range(8):
        nonesum+=patch[i]==None
    if nonesum>6:
        print_error("nonesum exceeds 6 (7-8) implies no data")
        sys.exit()
    # unfinished
    # add o1,o2,o3,o4 (local to entry start)
    
    el=1 # entry length in bytes
    if typstr=="quiz":
        el=2
    elif typstr=="chat":
        el=3
    elif typstr=="quest":
        el=4
    else:
        pass
    # 
    fil=open(typstr+FILEEXT)
    
    fil.close()
#######################################
def script_make_quiz():
    # TODO: Move file writing to end, since an error during file writing corrupts the file.
    cq="green"
    ca="cyan"
    tq=colored("Question",cq)
    ta=colored("Answer",ca)
    tq2=tq+colored("s",cq)
    ta2=ta+colored("s",ca)
    num_id = get_byte("Quiz ID?");
    nid=str(num_id)
    fp = fileid(QUIZFILE,nid)
    if file_exists(fp):
        print_error("Warning!\n"+fp+" already exists!\nOverwrite? (0-1)")
        ov=int(input())%2
        if not ov:
            print("No overwriting; will exit.")
            sys.exit()
    tmpfil = open(TMPFILE,"wb")
    fw(tmpfil,num_id)
    num_question = write(tmpfil,get_byte("Number of "+tq2))
    strnumq=str(num_question)
    num_correct = write(tmpfil,median([0,num_question,get_byte("Of "+strnumq+" "+tq2+"; require how many correctly answered "+tq2+"?")]))
    txt_alreadywon = write(tmpfil,get_string("Already won this quiz."))
    for i in range(num_question):
        qid=str(i+1)+"/"+strnumq
        txt_q = write(tmpfil,get_string("What is "+tq+" "+qid+"?"))
        num_q_answers = write(tmpfil,get_byte("Number of "+ta2+" to "+tq+" "+qid))
        num_q_correct = write(tmpfil,get_byte("Number of correct "+ta2+" to "+tq+" "+qid))
        strnumqcorr=str(num_q_correct)        
        for j in range(num_q_correct):
            aid=str(j+1)+"/"+strnumqcorr
            write(tmpfil,get_int("This "+ta+" ID is correct: (0-"+strnumqcorr+")"))
        for j in range(num_q_answers):
            aid=str(j+1)+"/"+str(num_q_answers)
            txt_a = write(tmpfil,get_string("What is "+ta+" "+aid+" in "+tq+" "+qid+"?"))
        txt_q_right = write(tmpfil,get_string("Right "+ta+" on "+tq+" "+qid))
        txt_q_wrong = write(tmpfil,get_string("Wrong "+ta+" on "+tq+" "+qid))
    txt_quiz_won = write(tmpfil,get_string("Won quiz "+nid))
    txt_quiz_lost = write(tmpfil,get_string("Lost quiz "+nid))
    tmpfil.close()
    shutil.copy(TMPFILE,fp)
    os.remove(TMPFILE)
    script_inspect_quiz(num_id)
    print(text_rgb("Success!")+"\nWritten to: "+colored(fp,"yellow"))
def script_merge_quiz():
    script_merge_any(filename_str(QUIZFILE))
def script_inspect_quiz(cid):
    # Read from file to ensure expected result.
    # Mark right/wrong answers with green/red text.
    if cid != -1:
        cid %= 256
        # TODO: Compare values as in code block below
        mnam=fileid(QUIZFILE,cid)
        if not file_exists(mnam):
            print_error(mnam+" does not exist!")
            sys.exit()
        mfile=open(mnam,"rb")
        num_id = buffer_read(mfile,1)
        qn = buffer_read(mfile,1)
        qc = buffer_read(mfile,1)
        buffer_read_string(mfile)
        for i in range(qn):
            buffer_read_string(mfile)
            an = buffer_read(mfile,1)
            ac = buffer_read(mfile,1)
            for j in range(ac):
                ai = buffer_read(mfile,1)
            for j in range(an):
                at = buffer_read_string(mfile)
            buffer_read_string(mfile)
            buffer_read_string(mfile)
        buffer_read_string(mfile)
        buffer_read_string(mfile)
        mfile.close()
    else:
        mnam=QUIZFILE
        if not file_exists(mnam):
            print_error(mnam+" does not exist!")
            sys.exit()
        mfile=open(mnam,"rb")
        fs = os.path.getsize(mnam)
        qn = 1+buffer_read(mfile,1)
        # Intact length fields.
        wd = 2
        lf = 1
        for i in range(qn):
            ql = buffer_read(mfile,wd)
            buffer_read(mfile,ql)
            lf += wd+ql
        if lf != fs:
            print_error("Length field mismatch, or wrong number of quizzes.")
            sys.exit()
        # Intact data.
        mfile.seek(1)
        qid=[]
        for i in range(qn):
            ql = buffer_read(mfile,wd)
            qid.append(buffer_read(mfile,1)) # quiz id
            qm = buffer_read(mfile,1)
            qc = buffer_read(mfile,1)
            if qc > qm:
                print_error("Correct required number of questions exceeds the number of total questions.")
                sys.exit()
            buffer_read_string(mfile)
            for j in range(qm):
                qqid = str(j+1)+"/"+str(qn)
                buffer_read_string(mfile) # question
                an = buffer_read(mfile,1)
                ac = buffer_read(mfile,1)
                if ac > an:
                    print_error("Correct required number of answers exceeds the number of total answers, in question "+qqid)
                    sys.exit()
                aid=[]
                for k in range(ac):
                    aid.append(buffer_read(mfile,1)) # answer id
                if list_has_duplicates(aid):
                    print_error("Answer ID have duplicates, in question"+qqid)
                    sys.exit()
                for k in range(an):
                    buffer_read_string(mfile) # answer
                buffer_read_string(mfile) # correctly answered
                buffer_read_string(mfile) # wrongly answered
            buffer_read_string(mfile) # won quiz
            buffer_read_string(mfile) # lost quiz
        if list_has_duplicates(qid):
            print_error("Quiz ID have duplicates!")
            sys.exit()
        # Done
        mfile.close()
    print("Inspector done!\nScroll up/down to read file contents.")
#######################################
def script_make_chat():
    num_id = get_byte("Chat ID?")
    nid=str(num_id)
    fp = fileid(CHATFILE,nid)
    if file_exists(fp):
        print_error("Warning!\n"+fp+" already exists!\nOverwrite? (0-1)")
        ov=int(input())%2
        if not ov:
            print("No overwriting; will exit.")
            sys.exit()
    tmpfil = open(TMPFILE,"wb")
    fw(tmpfil,num_id)
    num_chat = write(tmpfil,get_byte("Number of chats"))
    for i in range(num_chat):
        txt_chat = write(tmpfil,get_string("Chat text "+str(i+1)+"/"+str(num_chat)))
    tmpfil.close()
    shutil.copy(TMPFILE,fp)
    os.remove(TMPFILE)
    script_inspect_chat(num_id)
    print(text_rgb("Success!")+"\nWritten to: "+colored(fp,"yellow"))
def script_merge_chat():
    script_merge_any(filename_str(CHATFILE))
def script_inspect_chat(cid):

    # Specific subchat file
    if cid != -1:
        cid %= 256
        fp = fileid(CHATFILE,cid)
        if not file_exists(fp):
            print_error(fp+" does not exist")
            sys.exit()
        file=open(fp,"rb")
        num_monologue = 0+buffer_read(file,1)
        for i in range(num_monologue):
            txt_chat = buffer_read_string(file) # chat text
        file.close()
        print("chat_"+str(cid)+".dat inspection passed!")
    # Main chat file.
    # UNFINISHED.
    else:
        fp = CHATFILE
        if not file_exists(fp):
            print_error(fp+" does not exist")
            sys.exit()
        file=open(fp,"rb")
        num_chat = 1+buffer_read(file,1)
        for i in range(num_chat):
            num_len = buffer_read(file,2)
            # chat data "i"
            #script_inspect_chat(i)
        file.close()
        print(CHATFILE+" inspection passed!")
#######################################
def script_make_quest():
    print_error("script_make_quest\nUNFINISHED")
def script_merge_quest():
    script_merge_any(filename_str(QUESTFILE))
def script_inspect_quest(cid):
    print_error("script_inspect_quest\nUNFINISHED")
    if cid != -1:
        cid %= 256
    else:
        pass
#######################################
def script_make_event():
    print_error("script_make_event\nUNFINISHED")
def script_merge_event():
    script_merge_any(filename_str(EVENTFILE))
def script_inspect_event(cid):
    print_error("script_inspect_event\nUNFINISHED")
    if cid != -1:
        cid %= 256
    else:
        pass
#######################################
if __name__ == "__main__":
    # Main
    colorama.init()
    argc=len(sys.argv)
    erstr="ERROR: "
    wastr="WARNING: "
    if argc >= 3:
        arg1=sys.argv[1]
        arg2=sys.argv[2]
        ageq4=argc >= 4
        if ageq4:
            arg3=sys.argv[3] # some only
        if arg1 == "quiz":
            if arg2 == "make":
                script_make_quiz()
            elif arg2 == "merge":
                script_merge_quiz()
            elif arg2 == "inspect":
                if ageq4:
                    script_inspect_quiz(int(arg3))
                else:
                    print_error(erstr+"missing arg3")
            else:
                print_error(erstr+"arg2="+str(arg2))
        elif arg1 == "chat":
            if arg2 == "make":
                script_make_chat()
            elif arg2 == "merge":
                script_merge_chat()
            elif arg2 == "inspect":
                if ageq4:
                    script_inspect_chat(int(arg3))
                else:
                    print_error(erstr+"missing arg3")
            else:
                print_error(erstr+"arg2="+str(arg2))
        elif arg1 == "quest":
            if arg2 == "make":
                script_make_quest()
            elif arg2 == "merge":
                script_merge_quest()
            elif arg2 == "inspect":
                if ageq4:
                    script_inspect_quest(int(arg3))
                else:
                    print_error(erstr+"missing arg3")
            else:
                print_error(erstr+"arg2="+str(arg2))
        elif arg1 == "event":
            if arg2 == "make":
                script_make_event()
            elif arg2 == "merge":
                script_merge_event()
            elif arg2 == "inspect":
                if ageq4:
                    script_inspect_event(int(arg3))
                else:
                    print_error(erstr+"missing arg3")
            else:
                print_error(erstr+"arg2="+str(arg2))
        
        else:
            print_error(erstr+"arg1="+str(arg1))
    else:
        print_error(erstr+"Got fewer than 3 cmd args!")
# EOF