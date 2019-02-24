### 第一章：基本数据类型

概述：本章将介绍三种基本类型及其函数、类型辅助函数、控制台输入输出

#### 1.1 整型数据及其函数

类型：(unsigned)int,short,long

#### 1.2 浮点型数据及其函数

类型：(unsigned)float,double,long double

#### 1.3 字符型数据及其函数

##### 1.3.1 类型

**本质是整型数据**：char

##### 1.3.2 字符类型判断函数

头文件：<ctype.h>

| 序号 | 函数 & 描述                                                  |
| ---- | ------------------------------------------------------------ |
| 1    | [int isalnum(int c)](http://www.runoob.com/cprogramming/c-function-isalnum.html) 该函数检查所传的字符是否是字母和数字。 |
| 2    | [int isalpha(int c)](http://www.runoob.com/cprogramming/c-function-isalpha.html) 该函数检查所传的字符是否是字母。 |
| 3    | [int iscntrl(int c)](http://www.runoob.com/cprogramming/c-function-iscntrl.html) 该函数检查所传的字符是否是控制字符。 |
| 4    | [int isdigit(int c)](http://www.runoob.com/cprogramming/c-function-isdigit.html) 该函数检查所传的字符是否是十进制数字。 |
| 5    | [int isgraph(int c)](http://www.runoob.com/cprogramming/c-function-isgraph.html) 该函数检查所传的字符是否有图形表示法。 |
| 6    | [int islower(int c)](http://www.runoob.com/cprogramming/c-function-islower.html) 该函数检查所传的字符是否是小写字母。 |
| 7    | [int isprint(int c)](http://www.runoob.com/cprogramming/c-function-isprint.html) 该函数检查所传的字符是否是可打印的。 |
| 8    | [int ispunct(int c)](http://www.runoob.com/cprogramming/c-function-ispunct.html) 该函数检查所传的字符是否是标点符号字符。 |
| 9    | [int isspace(int c)](http://www.runoob.com/cprogramming/c-function-isspace.html) 该函数检查所传的字符是否是空白字符。 |
| 10   | [int isupper(int c)](http://www.runoob.com/cprogramming/c-function-isupper.html) 该函数检查所传的字符是否是大写字母。 |
| 11   | [int isxdigit(int c)](http://www.runoob.com/cprogramming/c-function-isxdigit.html) 该函数检查所传的字符是否是十六进制数字。 |

##### 1.3.3 转换函数

头文件：<ctype.h>

| 序号 | 函数 & 描述                                                  |
| ---- | ------------------------------------------------------------ |
| 1    | [int tolower(int c)](http://www.runoob.com/cprogramming/c-function-tolower.html) 该函数把大写字母转换为小写字母。 |
| 2    | [int toupper(int c)](http://www.runoob.com/cprogramming/c-function-toupper.html) 该函数把小写字母转换为大写字母。 |

#### 1.4 控制台输入输出

##### 1.4.1 格式化输入输出

格式化字符串一般格式：%\[*\]\[输入数据宽度\][长度]类型

| 格式 | 字符意义                                                     |
| ---- | ------------------------------------------------------------ |
| %    | 该输入项，读入后不赋予相应的变量，即跳过该输入值             |
| d    | 输入十进制整数                                               |
| o    | 输入八进制整数                                               |
| x    | 输入十六进制整数                                             |
| u    | 输入无符号十进制整数                                         |
| f或e | 输入实型数(用小数形式或指数形式)                             |
| c    | 输入单个字符                                                 |
| s    | 输入字符串                                                   |
| 宽度 | 用十进制整数指定输入的宽度（即字符数）                       |
| 长度 | 长度格式符为l和h，l表示输入长整型数据（如%ld）和双精度浮点数（如%lf）。h表示输入短整型数据 |

**多数据输入**：在输入多个数值数据时，若格式控制串中没有非格式字符作输入数据之间的间隔则可用空格，TAB或回车作间隔。C编译在碰到空格，TAB，回车或非法数据(如对“%d”输入“12A”时，A即为非法数据)时即认为该数据结束。

**结束标志**：除非在格式字符串中指出空格为分割，否则遇到空格便作为一个输入的结束

**回车符号**：scanf遇到回车会停止读取，但是留下回车符号在输入缓存，可能影响下面的读取

##### 1.4.2 其他输入输出

| 输入                                                         | 输出                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **int getchar(void)** 函数从屏幕读取下一个可用的字符，并把它返回为一个整数 | **int putchar(int c)** 函数把字符输出到屏幕上，并返回相同的字符。 |
| **char \*gets(char \*s)** 函数从 **stdin** 读取一行到 **s** 所指向的缓冲区，直到一个终止符或 EOF。 | **int puts(const char \*s)** 函数把字符串 s 和一个尾随的换行符写入到 **stdout**。 |
| **char *fgets(char *s, int size, FILE *stream)**：基本输入流stdin | **int fputs(const char *s, FILE *stream)**：基本输出流stdout |

#### 1.5 类型转化

(类型名)变量名

### 第二章：基本数据运算

#### 2.1 运算符

| 通用运算符(略)      | 逻辑运算符 | 位运算符 | 其他运算符   |
| ------------------- | ---------- | -------- | ------------ |
| 算术运算符(+,-,*,/) | &&         | &        | 条件：?:     |
| 关系运算符(>,<,=)   | \|\|       | \|       | 特殊：sizeof |
|                     | !          | ^        |              |

#### 2.2 控制结构

```c
// 条件语句
if (条件){...
}
else if(条件){...
}
else {...
}

// for循环语句
for (表达式1; 表达式2; 表达式3){...
}

// while循环
while(条件){...
}

//do while循环
do{...
}
while (表达式);   //分号不可少

switch(表达式){ 
    case 常量表达式1:  语句1;
    … 
    default:  语句n+1;
}

continue 、 break 、 goto
```

### 第三章：数组

*数组名既是首地址指针*

#### 3.1 数组

```c
double balance[5] = {1000.0, 2.0, 3.4, 7.0, 50.0};		//简单数组
int a[3][4] = {  
 {0, 1, 2, 3} ,   /*  初始化索引号为 0 的行 */
 {4, 5, 6, 7} ,   /*  初始化索引号为 1 的行 */
 {8, 9, 10, 11}   /*  初始化索引号为 2 的行 */
};		//多维数组

```

#### 3.2 交换函数(指针)

```c
void swap(int *x,int * y){
    int temp;
    temp = *u;
    *u = *v;
    *v = temp;
}
swap(&x,&y);
```

#### 3.3 多维数组的指针

```c
int (* pz)[2];	
//括号中的*表明 pz 是一个指针，它指向一个数组，数组的类型为int [2]
//如果：int *pz[2],由于[]优先级高，那么会生成一个包含两个单指针数组
```

### 第四章：字符串及其数组

#### 4.1 字符串

```c
char greeting[] = "Hello";		//最后一位为 \0
```

#### 4.2 字符串函数

头文件：<string.h>

```c
int strlen(char *s);							//获取字符串长度

char *strdup(char *str); 						//字符串拷贝，返回地址
char *stpcpy(char *destin, char *source); 		//字符串拷贝

char *strcat(char *destin, char *source); 		//字符串拼接
char *strncat(char *dest,char *src,int n);		//字符串拼接指定长度

int strcmp(char *str1, char *str2); 			//字符串比较函数,返回值0为相等
int strncmpi(char *str1, char *str2, unsigned maxlen); 	//字符串比较，指定长度

char *strchr(char *str, char c); 				//在字符串中查找字符位置
char *strrchr(const char *str, int c)			//在字符串中反向查找字符位置
char *strstr(const char *haystack, const char *needle)	//字符串中查找另一字符串
char *strpbrk(const char *str1, const char *str2)		// 以目标字符串的所有字符作为集合，在当前字符串查找该集合的任一元素 
size_t strspn(const char *str1, const char *str2)		// 以目标字符串的所有字符作为集合，在当前字符串查找不属于该集合的任一元素的偏移 
int strcspn(char *str1, char *str2); 			//以目标字符串的所有字符作为集合，在当前字符串查找属于该集合的任一元素的偏移
```

#### 4.3 字符串转其他类型

头文件：<stdlib.h>

```c
double strtod(const char *nptr,char **endptr)	// 从字符串 p 中转换 double 类型数值，并将后续的字符串指针存储到 ppend 指向的 char* 类型存储。
long int strtol(const char *str, char **endptr, int base)	// 从字符串 p 中转换 long 类型整型数值，base 显式设置转换的整型进制，设置为 0 以根据特定格式判断所用进制，0x, 0X 前缀以解释为十六进制格式整型，0    前缀以解释为八进制格式整型
int atoi(const char *str)				// 字符串转换到 int 整型 
double atof(const char *str)			// 字符串转换到 double 符点数 
long int atol(const char *str)			// 字符串转换到 long 整型 
```

### 第五章：高级结构

#### 5.1 结构体

```c
//声明
struct name{
类型 子名字,
...
};       //分号不可少

//初始化
struct name hmc = {};

//访问变量,p为指针
结构体变量.成员名
(*p).成员名
p->成员名

//typedef命令
typedef int INTEGER;

//嵌套结构体
struct guy {
    struct name aName;
    ...;
};
//初始化
struct guy hmc = {{...(初始化name)}...};
```

**思考：结构体+函数指针岂不是类。。。**

联合体和伸缩体(略)

#### 5.2 枚举

**本质是int的对应**

```c
enum spectrum {red,orange,yellow,green,blue};	//声明
enum spectrum color = blue;		//初始化
```

#### 5.3 函数指针

```c
double (* pdf) (double);	//声明	
pdf = sin;		//赋值
x = (*pdf)(1.2);		//调用方式一
x = pdf(1.2);			//调用方式二
```

### 第六章：类型限定词

#### 6.1 类型限定

```c
// const不变
const int x = 10;		//可初始化，不可赋值和改变
const float * pf;		//指向常量浮点数，可以改变指向对象，但是对象必须为常量,const修饰float
float * const pt;		//一个常量指针，指针所指的地址固定,const修饰pt
const float * const pt;	//所指的地址不变，内容也不变
//作为函数参数的限定词

// volatile 可能被其他程序改变，如系统时间
int val1 = x;
int val2 = x;		// 编译器优化时，可能会只存储一次x，如果val2被外部改变，那么可能不安全
int val1 = x;
volatile int val2 = x;	//显式声明，不会优化为一个变量

const volatile int time = 100;	// 本程序不改变，其他程序可能改变的值

// restrict 表明只有该指针指向数据
// 当知道这是唯一且初识的指针后，就能在不考虑安t全下进行优化
int * restrict restar = (int *)malloc(10 * sizeof(int));
```

#### 6.2 链接

**gcc -o filename spring.c main.c**

```c
// spring.c
int x = 10;		//不在代码块中变量，默认为external属性
static int y = 10;		//static用于改变默认属性为internal，改为只在本文件使用

// main.c
int main(int z1){
    extern int x;	// 使用spring.c中的x，可调用外部函数
    int z2;		//函数参数和代码块中变量，默认为none属性，只在作用域中使用
}
```

#### 6.3 存储类型

##### 6.2.1 内存结构

| 名字   | 类型                                                         |
| ------ | ------------------------------------------------------------ |
| 代码区 | 存放CPU执行的机器指令，代码区是可共享，并且是只读的          |
| 数据区 | 存放已初始化的全局变量、静态变量（全局和局部）、常量数据     |
| BBS区  | 存放的是未初始化的全局变量和静态变量                         |
| 栈区   | 由编译器自动分配释放，存放函数的参数值、返回值和局部变量，在程序运行过程中实时分配和释放，栈区由操作系统自动管理，无须程序员手动管理 |
| 堆区   | 堆是由malloc()函数分配的内存块，使用free()函数来释放内存，堆的申请释放工作由程序员控制，容易产生内存泄漏 |

##### 6.2.2 四种存储类型

| 类型                                   | 作用                                                         |
| -------------------------------------- | ------------------------------------------------------------ |
| auto只用来标识局部变量                 | 默认的存储类型，不需要显示的指定，存储在栈区中               |
| extern用来声明其它文件中定义的全局变量 | 如果全局变量未被初始化，存在BBS区，在编译时自动赋值为0。如果已经被初始化，那么就被存在数据区中 |
| register的变量常驻在CPU的寄存器中      | 访问register变量将在很大程度上提高效率                       |
| static类型变量，生命周期为其作用域     | 存储于数据区，静态变量如果没有被初始化，则自动初始化为0。静态变量只能够初始化一次。 |

### 第七章：错误处理

头文件：<error.h>

#### 7.1 当前错误号errno

```c
printf("错误号: %d\n", errno);
```

#### 7.2 当前错误提示

```c
// perror函数
perror("通过 perror 输出错误");
// strerror函数
printf("打开文件错误: %s\n", strerror( errnum ));
```

### 第八章：常用操作

#### 8.1 命令行参数

```c
int main( int argc, char *argv[] )  {
    printf("参数个数%d\n",argc);	//argc最少一个(程序名称为第一个)
    printf("程序名称*%s\n",argv[0]);	//显示程序名称
    ...
    return 0;
}
```

#### 8.2 随机数

```c
#include <stdio.h>
#include <stdlib.h>		//随机数函数头文件
#include <time.h>		//用于生成种子
int main()
{
    srand(time(NULL));
    int i;
    for (i = 0; i < 10; i++)
    printf("%d, ", rand()%11); 
} 
```

#### 8.3 文件处理

| 分类     | 函数名              | 功能                         |
| -------- | ------------------- | ---------------------------- |
| 打开文件 | fopen()             | 打开文件                     |
| 关闭文件 | fclose()            | 关闭文件                     |
| 文件定位 | fseek()             | 改变文件指针位置             |
|          | rewind()            | 返回开头                     |
|          | ftell()             | 取得当前位置                 |
| 文件读写 | fgetc()，fputc()    | 字符读写                     |
|          | fread()，fwrite()   | 数据项读写                   |
|          | fscanf()，fprintf() | 指定格式读写                 |
| 文件状态 | feof()              | 若到达文件末尾，函数值为非零 |
|          | ferror()            | 文件操作出错时非零           |
|          | clearerr()          | 重置feod()和ferror()         |

####  8.4 内存管理

头文件： **<stdlib.h>**

| 函数                                             | 描述                                                         |
| ------------------------------------------------ | ------------------------------------------------------------ |
| **void \*calloc(int num, int size);**            | 动态分配 num 个长度为 size 的连续空间，并将每一个字节都初始化为 0 |
| **void free(void \*address);**                   | 该函数释放 address 所指向的内存块,释放的是动态分配的内存空间。 |
| **void \*malloc(int num);**                      | 在堆区分配一块指定大小的内存空间，用来存放数据。这块内存空间在函数执行完成后不会被初始化，它们的值是未知的。 |
| **void \*realloc(void \*address, int newsize);** | 该函数重新分配内存，把内存扩展到 **newsize**。               |

```c
description = (char *)malloc( 200 * sizeof(char) );
description = (char *)calloc(200, sizeof(char));
description = realloc( description, 500 * sizeof(char) );
free(description);
```

### 第九章：C的预处理

#### 9.1 宏定义

```c
//普通宏定义
#define SIX 2*3
#define SIX 2 * 3
//上面两种宏定义不相同，前者一个语言符号2*3,后者三个语言符号2、*、3

//带参数宏定义(类函数宏)
#define SQUARE(X) X*X
#define PSQR(X) printf("the square of X is %d.\n",((X)*(X)));

//宏参数替换(#运算符)
#define PSQR(X) printf("the square of " #X " is %d.\n",((X)*(X)));
//输出the square of 3 is 9,而上面输出X is 9

//宏参数拼接(##运算符)
#define X(n) x ## n
#define X(n) xn
//以上效果相同，相等于拼接了两个语言符号x和n

//可变参数宏
#define PR(...) printf(__VA_ARGS__)
PR("hello") = printf("hello")

//终止作用域
#undef PR
```

#### 9.2 文件包含

```c
//文件包含
#include <文件名>	//在系统文件中查找
#include "文件名"	//在工作目录或指定目录查找，之后在系统文件查找
#include "/usr/bin/p.h"
```

#### 9.3 条件编译

```c
#ifdef MAVIS		//如果MAVIS标识符被定义
	#include "horse.h"
#else				//可选
	#include "cow.h"
#endif

#if SYS ==1 		//判断值
	#include "ibmpc.h"
#elif definded(VAX)	//判断是否定义
	#include...
#endif
```

#### 9.4 内联函数

```c
inline void eatline(){
    ...
}
```

### 第十章：常用库函数

| 头文件         | 描述                                                         |
| -------------- | ------------------------------------------------------------ |
| <assert.h>     | 提供了一个名为 **assert** 的宏，它可用于验证程序做出的假设，并在假设为假时输出诊断消息 |
| **<ctype.h>**  | 测试和映射字符                                               |
| **<errno.h>**  | 定义了一系列表示不同错误代码的宏，这些宏应扩展为类型为 **int** 的整数常量表达式 |
| <float.h>      | 包含了一组与浮点值相关的依赖于平台的常量                     |
| <limits.h>     | 决定了各种变量类型的各种属性(最大值和最小值等)               |
| <locale.h>     | 特定地域的设置，比如日期格式和货币符号                       |
| **<math.h>**   | 各种数学函数和一个宏，在这个库中所有可用的功能都带有一个 **double** 类型的参数，且都返回 **double** 类型的结果 |
| <setjmp.h>     | 定义了宏 **setjmp()**、函数 **longjmp()** 和变量类型 **jmp_buf**，该变量类型会绕过正常的函数调用和返回规则 |
| <signal.h>     | 定义了一个变量类型 **sig_atomic_t**、两个函数调用和一些宏来处理程序执行期间报告的不同信号 |
| <stdarg.h>     | 定义了一个变量类型 **va_list** 和三个宏，这三个宏可用于在参数个数未知（即参数个数可变）时获取函数中的参数 |
| <stddef.h>     | 定义了各种变量类型和宏。这些定义中的大部分也出现在其它头文件中 |
| **<stdio.h>**  | 定义了三个变量类型、一些宏和各种函数来执行输入和输出         |
| **<stdlib.h>** | 定义了四个变量类型、一些宏和各种通用工具函数                 |
| **<string.h>** | 定义了一个变量类型、一个宏和各种操作字符数组的函数           |
| **<time.h>**   | 定义了四个变量类型、两个宏和各种操作日期和时间的函数         |