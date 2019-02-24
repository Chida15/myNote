## HTML笔记

#### 骨架

```html
<html>
  <head>
    <title>xyz</title>
    <meta charset="utf-8">
    <meta name="keywords" content="xxx">
    <meta name="description" content="xxx">
  </head>
  <body>
  </body>
</html>
```

#### 布局

| 名称       | 写法 |
| ---------- | ---- |
| 盒子       | div  |
| 段落       | p    |
| 分行       | br   |
| 字块       | span |
| 预格式输出 | pre  |
| 引用       | cite |

#### 实体

不能直接表示的内容，例如小于号、空格

#### 图片

<img src="xxx.xxx" alt="xxx">

#### 链接

```html
<a href="http://www.w3school.com.cn/" target="_blank">Visit W3School!</a>
```

#### 表格

```html
<table border="1">
<tr>
<td>1,1</td>
<td>1,2</td>
</tr>
<tr>
<td>2,1</td>
<td>2,2</td>
</tr>
</table>
```

#### 列表

```html
<!--无序-->
<ul>
<li>Coffee</li>
<li>Milk</li>
</ul>
<!--有序-->
<ol>
<li>Coffee</li>
<li>Milk</li>
</ol>
```

#### 表单

```html
<form>
 .
form elements
 .
</form>
```

元素种类

1. 文本元素
2. 密码元素
3. 文件元素(表头需要多部分声明)
4. 确认(提交)元素
5. 重置(reset)
6. 下拉菜单
7. 单元
8. 多选
9. 文本域

#### 框架

用于在当前页面显示其他页面。

目前主要使用iframe，不推荐使用frame。

```html
<iframe src="URL"></iframe>
```