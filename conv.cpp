#include<bits/stdc++.h>
using namespace std;
const int reglen = 3;
const int outlen = 16;
string ins;
int num[201];
int out[201];
void change10to2(int l,int x,int p) {
	//在out中的下标 l 开始填长度为 p 的二进制数 x，高位补零
	int pos = l;
	int s = (1 << (p-1));
	for(int i = s ; i >= 1 ; i /= 2) {
		out[pos++] = x / i;
		x %= i;
	}
	return ;
}
fstream fout("output.bin",ios::out);
void print() {

	for(int i = 0 ; i < outlen ; i ++) {
		fout<<out[i];
		cout<<out[i];
	}
	cout<<endl;
	fout<<endl;


}
unordered_map <string,int> opcodelen,isfucked;
unordered_map <string,string> opcode;
void init() {
	fstream fin("ins.txt",ios::in);
		string ins,opc;
	while(fin >> ins) {
		int opl,fucklen;
		fin>> opc >> opl >> fucklen;
		opcodelen[ins] = opl;
		isfucked[ins] = fucklen;
		opcode[ins] = opc;
	}
	fin.close();
}
int main() {
	init();
	puts("init completed");
	fstream fin("code.asm",ios::in);
	while(fin >> ins) {
		cout<<"ins="<<ins<<endl;
		int len = opcodelen[ins];
		int imdnum = isfucked[ins];
		for(int i = 1 ; i <= len ; i ++)
			fin>>num[i];
		int ins_len = opcode[ins].length();
		for(int i = 0 ; i < ins_len ; i ++) {
			out[i] = opcode[ins][i] - '0';
		}
		int regnum = len;
		if(imdnum)
			regnum --;
		for(int i = 1 ; i <= regnum ; i ++) {
			change10to2(ins_len,num[i],reglen);
			ins_len += reglen;
		}
		if(imdnum) {
			change10to2(outlen-imdnum,num[len],imdnum);
		}
		print();
		memset(out,0,sizeof(out));

	}
	fin.close();
	fout.close();
	return 0;
}
