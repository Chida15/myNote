## 汇编语言

### 一.基本命令

| 段寄存器(不含栈)     | 三大基础命令 | 栈              | 位命令 | 乘除 | 特殊加减            |
| -------------------- | ------------ | --------------- | ------ | ---- | ------------------- |
| cs:ip                | mov          | SS:SP栈顶地址   | and    | mul  | abc(带进位加法)     |
| DS段寄存器：[偏移量] | add          | push/pop 寄存器 | or     | div  | sbb(带借位减法)     |
| es：额外段地址       | sub          |                 |        |      | cmp(减法不保存结果) |

用于偏移量的寄存器：bx、si、di和bp

### 二.程序结构

**assume** cs:codesg	//分配段地址

**codesg segment**

​	dw 0123h,0456h,...    //定义字型数据，同类指令：dd、dup

​	......

**codesg ends**

**end**

注意：mov **word/byte ptr** A,B，表示了数据的长度

### 三.循环loop

```assembly
assume cs:code
code segment
	mov ax,2
	mov cx,11	//循环次数
s:	add ax,ax
	loop s
	mov ax,4c00h //中断码
	int 21h		//中断地址
code ends
end
```

### 四.转移指令

标志寄存器：pushf和popf标志寄存器的栈操作

| ZF                 | PF                   | SF            | CF      | OF      |
| ------------------ | -------------------- | ------------- | ------- | ------- |
| 计算结果为0时，为1 | 记录1的个数，偶数为1 | 结果为负，为1 | 进位为1 | 溢出为1 |

| offset                     | 无条件跳转                  | 有条件跳转(cmp) |
| -------------------------- | --------------------------- | --------------- |
| 获取偏移地址(相当于代码段) | jmp short 标号              | je/jne(e:equal) |
|                            | jmp far ptr 标号(段间转移)  | jb/jnb(b:below) |
|                            | jmp word/dword ptr 内存单元 | ja/jna(a:above) |

### 五.函数跳转

```assembly
assume cs:code

stack segment
	db 16 dup (0)
stack ends

code segment
	mov ax,4c00h
	int 21h
	
start:	mov ax,stack
		mov ss,ax
		mov sp,16
		mov ax,0
		push ax
		mov bx,0
		ret/retf
code ends
end start  //表明main为start

call与ret结合实现函数跳转
```

### 六.串传送指令

| DF标志位         | movsb/sw        | rep movsb/movsw            |
| ---------------- | --------------- | -------------------------- |
| df=0：si、di递增 | es:[di]=ds:[si] | 根据cx寄存器的值来重复运行 |
| df=1：si、di递减 | 注意DF方向      |                            |

