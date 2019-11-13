from functools import reduce
import re
import os
def solvepos(posin,indexin):
    if posin < indexin:
        posin = (255 - (indexin - (posin - 1)))
    elif posin > indexin:
        posin = posin - indexin - 2
    return posin

def opchange(inFileName, outFileName):
    with open(inFileName, 'r')as f:
        lines = f.readlines()
    ans = []
    for index, line in enumerate(lines):
        ele = line.replace('\n', '').split(' ')
        if ele[0] == 'j':
            pos = int(ele[1])
            pos=solvepos(pos,index)
            ele[1] = str(pos)
        elif ele[0] == 'beq' or ele[0]=='bne':
            pos = int(ele[3])
            pos = solvepos(pos, index)
            ele[3] = str(pos)
        elif ele[0]=='beqz' or ele[0]=='bnez':
            pos = int(ele[2])
            pos = solvepos(pos, index)
            ele[2] = str(pos)
        elif ele[0] == 'mul' or ele[0] == 'div':
            ele = [ele[0], str(0), ele[1], ele[2]]
        strnow = ''
        for x in ele:
            strnow += x + ' '
        ans.append(strnow)
    with open(outFileName, 'w')as f:
        for index, item in enumerate(ans):
            if index != len(ans) - 1:
                f.write(item + '\n')
            else:
                f.write(item)


opchange('code.s', 'code.asm')
os.system('conv.exe')
bitNum = 16
intArr = map(lambda x: (f"%0{bitNum // 4}X") % int(x, 2), open('output.bin', 'r').read().splitlines())
with open('./t6/romCode.hex', 'w')as f:
    for index, x in enumerate(intArr):
        strCode = "%02X" % (bitNum // 8) + "%04X" % index + '00' + x
        sumCode = (~reduce(lambda i, j: i + j, map(lambda x: int(x, 16), re.findall(r'.{2}', strCode))) + 1) & 0xff
        f.write(f':{strCode}{"%02X" % sumCode}\n')
    for i in range(index + 1, 128):
        strCode = "%02X" % (bitNum // 8) + "%04X" % i + '00' + "0000"
        sumCode = (~reduce(lambda i, j: i + j, map(lambda x: int(x, 16), re.findall(r'.{2}', strCode))) + 1) & 0xff
        f.write(f':{strCode}{"%02X" % sumCode}\n')
    f.write(':00000001FF\n')
