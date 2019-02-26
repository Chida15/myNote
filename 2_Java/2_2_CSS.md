## CSS笔记

#### CSS导入方式

1. 标签内部CSS
2. head头部
3. @import引入外部CSS
4. link引入外部CSS

#### 优先级

1. 内联CSS
2. id选择器
3. class选择器
4. 标签

#### 选择器

| 基本选择器       | 关系选择               | 层级选择器          | 伪类选择器  | 属性选择器(表单常用) |
| ---------------- | ---------------------- | ------------------- | ----------- | -------------------- |
| id选择器：#id    | 其他选择器:first-child | 内部：空格隔开      | :hover      | [attribute]          |
| 类选择器：#class | :first-letter          | 组合：逗号隔开      | :focus      | [attribute=value]    |
| 标签选择器：a    | :first-line            | 子元素：>号隔开     | ::selection | [attribute~=value]   |
|                  | :last-child            | 后面的元素：+号隔开 |             | [attribute\|=value]  |
|                  | :nth-child(number)     |                     |             |                      |

#### 字体

1. font-family
2. font-size
3. font-style
4. font-weight

#### 文本

1. letter-spacing
2. word-spacing
3. text-decoration：下划线
4. text-align
5. text-indent
6. line-height
7. color
8. word-break：折行