from sys import exit
import math as ø
οօо=ø.ceil(ø.pi)-ø.floor(ø.e)
оօо=οօо//οօо
օоο=οօо**(οօо+оօо)
օօо=(οօо+оօо)**οօо
οοօ=օоο//օօо
ccc=οօо*(օօо+οօо)*οօо
def test(օօօ):
    οοο=open("cosc345-game.tmx")
    for оօօ in range(οօо**оօо):
        while оօо:
            оοо=οοο.readline()
            if'v">'in оοо:
                break
        for օοо in range(οօо**օօо):
            оοо=οοο.readline()
            оοо+=chr(ccc)if օοо==οօо**օօо-оօо else""
            for ооο in range(οօо**օоο):
                օоо=оοо.find(chr(ccc))
                οօο=int(оοо[:օоо])
                оοо=оοо[օоо+оօо:]
                if not(οօο>=(оօо+оօօ*οօо**օоο)and οօο<=((оօօ+оօо)*οօо**օоο)):
                    if(not օօօ)*(οօο==οοօ):
                        continue
                    print(str(οօο)+"+"+str(оօօ)+"+"+str(օοо)+"="+str(οօο+оօօ+օοо))
                    return оօо
    οοο.close()
    return οοօ
if __name__ == "__main__":
    οоօ=test(οοօ)
    print("ERROR"if οоօ!=οοօ else"Success")
    exit(οоօ)