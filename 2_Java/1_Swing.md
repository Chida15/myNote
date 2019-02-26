## 基本界面设计

### 10.1 结构

```bash
Swing组件/
	顶层组件类/
	中间组件类/
		中间容器类/
		特殊中间组件类/
	基本组件类/
```

顶层容器（即Window组件）：JFrame、JApplet、JDialog、JWindow;

中间容器：JPanel、JScrollPane、JSplitOPane、JToolBar；这些容器可以充当载体，但也是不可以独立显示的组件，必须依附在顶层容器内；

特殊容器：在GUI上起特殊作用的中间层，如JInternalFrame、JLayeredPane等；

基本组件：实现人机交互的组件，如JButton、JComboBox、JList、JMenu、JTextField。

### 10.2 顶层组件:主窗口JFrame

```java
import javax.swing.*;
import static javax.swing.JFrame.*;
class MyJFrame extends JFrame{
	MyJFrame(String s,int x,int y,int w,int h){
		setTitle(s);
		setBounds(x,y,w,h);
		setDefaultCloseOperation(EXIT_ON_CLOSE); //设置关闭按钮
	}
}
public class MyJFrameDemo{
	public static void main(String args[]){
		MyJFrame myJFrame=new MyJFrame("我的窗口",100,100,300,150);
		myJFrame.setVisible(true);      //设置可见性
	}
}
```

### 10.3 中间容器

#### JPanel面板

#### JScrollPane滚动窗格

实现滚动条

### 10.4 基本组件

1. JTextField文本框
2. JTextArea文本区
3. JButton按钮
4. JLabel标签
5. JCheckBox复选框
6. JRadioButton单选按钮
7. JComboBox下拉列表
8. JPasswordField密码框

### 10.5 特殊中间组件类(布局)

#### 10.5.1 FlowLayout

按照先后顺序从左向右排序，一行排满之后转入下一行。

```java
con.setLayout(new FlowLayout());

myJFrame.setLayout(new FlowLayout());  //具体布局类
```

#### 10.5.2 BorderLayout

按照指定的空间位置布局，例如东南西北中。

同上

#### 10.5.3 CardLayout

类似扑克牌，将页面像扑克牌一样进行切换。

```java
import javax.smartcardio.Card;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Layout5 {
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("我的窗口",100,100,500,500);

        JPanel panel1 = new JPanel();
        CardLayout card = new CardLayout();
        panel1.setLayout(card);         //将panel1与card布局相绑定
        panel1.setBackground(Color.yellow);

        JPanel panel2 = new JPanel();
        myJFrame.add(panel1,BorderLayout.CENTER);
        myJFrame.add(panel2,BorderLayout.SOUTH);
		
      	//panel1中添加五个标签
        String[] names = {"第一张","第二张","第三张","第四张","第五张"};
        JLabel label;
        for (int i = 0;i<names.length;i++){
            label = new JLabel(names[i],SwingConstants.CENTER);
            label.setFont(new Font("宋体",Font.PLAIN,28));
            panel1.add(names[i],label);
        }
      
      	//设置按钮功能，使用布局类自带函数
        JButton button1 = new JButton("上一张");
        button1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                card.previous(panel1);
            }
        });
        JButton button2 = new JButton("下一张");
        button2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                card.next(panel1);
            }
        });
        JButton button3 = new JButton("第一张");
        button3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                card.first(panel1);
            }
        });
        JButton button4 = new JButton("最后一张");
        button4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                card.last(panel1);
            }
        });
        panel2.add(button1);
        panel2.add(button2);
        panel2.add(button3);
        panel2.add(button4);

        myJFrame.setVisible(true);
    }
}
```

#### 10.5.4 GridLayout

```java
con.setLayout(new GridLayout(3,2));
```

#### 10.5.5 BoxLayout布局类

类似HTML盒子模型

```java
import javax.swing.*;
import java.awt.*;

class MyJFrame extends JFrame{
    MyJFrame(String s,int x,int y,int w,int h){
        setTitle(s);
        setBounds(x,y,w,h);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

public class Test{
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("测试",100,100,300,300);
        myJFrame.setLayout(new FlowLayout());
        // 第一竖列
        Box boxV1 = Box.createVerticalBox();
        boxV1.add(new JLabel("姓名"));
        // 行间空隙
        boxV1.add(Box.createVerticalStrut(8));
        boxV1.add(new JLabel("email"));
        boxV1.add(Box.createVerticalStrut(8));
        boxV1.add(new JLabel("职业"));

        // 第二竖列
        Box boxV2 = Box.createVerticalBox();
        boxV2.add(new JTextField(10));
        boxV2.add(Box.createVerticalStrut(8));
        boxV2.add(new JTextField(10));
        boxV2.add(Box.createVerticalStrut(8));
        boxV2.add(new JTextField(10));
        
        // 一个横向盒子
        Box baseBox = Box.createHorizontalBox();
        baseBox.add(boxV1);
        baseBox.add(Box.createVerticalStrut(10));
        baseBox.add(boxV2);

        myJFrame.add(baseBox);
        myJFrame.pack();
        myJFrame.setVisible(true);
    }
}
```

#### 10.5.6 null布局类

组件可以通过

```java
setBounds(int a,int b,int width,int height)  //设置大小和容器中位置
```

### 10.6 事件

#### 10.6.1 事件类型

| 事件类型          | 触发器                 | 接口               |
| ------------- | ------------------- | ---------------- |
| ActionEvent   | 文本框、按钮、菜单项、密码框和单选按钮 | ActionListener   |
| ItemEvent     | 选择框、下拉列表            | ItemListener     |
| DocumentEvent | 文本区内容发生变化           | DocumentListener |
| MouseEvent    | 任何组件                | MouseListener    |
| FocusEvent    | 任何组件                | FocusListener    |
| KeyEvent      | 当按下、释放或敲击键盘上一个键     | KeyListener      |

#### 10.6.2 事件上的信息

ActionEvent事件对象可以调用如下方法获取事件的基本信息，包括：

1. Object getSource()获取ActionEvent事件的事件源对象的引用，即将事件源上转型为Object对象，并返回这个上转型对象的引用。
2. String getActionCommand()获取ActionEvent事件发生时，和该事件相关的一个命令字符串。如文本框发生ActionEvent事件时，与事件相关的命令字符串就是文本框中的文本字符串。

#### 10.6.3 代码实例

##### ActionEvent

```java
import javax.swing.*;
import static javax.swing.JFrame.*;
import java.awt.event.*;
import java.awt.*;
class MyJFrame extends JFrame{
	MyJFrame(String s,int x,int y,int w,int h){		
		setLayout(new FlowLayout());
		setTitle(s);
		setBounds(x,y,w,h);		
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
}
public class ActionGUIDemo{
	public static void main(String args[]){
		MyJFrame myJFrame=new MyJFrame("我的窗口",100,100,400,300);
		JButton button=new JButton("Press me!");
		myJFrame.add(button);
		
		JTextArea textArea=new JTextArea(9,30);
		myJFrame.add(new JScrollPane(textArea));
		
		JButtonHandler listener=new JButtonHandler();
		listener.setJTextArea(textArea);
		//实现了事件绑定
		button.addActionListener(listener);
		myJFrame.setVisible(true);
	}
}
// 实现接口，重写了actionPerformed方法
class JButtonHandler implements ActionListener{
	JTextArea textshow;
	public void setJTextArea(JTextArea area){
		textshow=area;
	}
	public void actionPerformed(ActionEvent e){
		textshow.append("Action occurred\n");
	}
}
```

##### ItemEvent

```java
import javax.swing.*;
import static javax.swing.JFrame.*;
import java.awt.event.*;
import java.awt.*;
import java.io.*;
class MyJFrame extends JFrame{
	MyJFrame(String s,int x,int y,int w,int h){		
		setLayout(new FlowLayout());
		setTitle(s);
		setBounds(x,y,w,h);		
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
}
public class ItemEventDemo{
	public static void main(String args[]){
		MyJFrame myJFrame=new MyJFrame("ComboBox事件处理",100,100,400,300);		
      	// 下拉框显示当前目录java文件
		File dir=new File(".");
		FileAccept fileAccept=new FileAccept();
		fileAccept.setExtendName("java");
		String[] fileName=dir.list(fileAccept);
		String itemList[]=new String[fileName.length+1];
		itemList[0]="请选择文件：";
		for(int i=0;i<fileName.length;i++){
			itemList[i+1]=fileName[i];
		}
		
		JComboBox jcb=new JComboBox(itemList);		
		myJFrame.add(jcb);
		
		JTextArea textArea=new JTextArea(9,30);		
		myJFrame.add(new JScrollPane(textArea));
		
		JComboBoxHandler listener=new JComboBoxHandler();
		listener.setJTextArea(textArea);
		listener.setJComboBox(jcb);
	
		jcb.addItemListener(listener);		
		myJFrame.setVisible(true);
	}
}
class FileAccept implements FilenameFilter{
	private String extendName;
	public void setExtendName(String s){
		extendName="."+s;
	}
	public boolean accept(File dir,String name){
		return name.endsWith(extendName);
	}
}

class JComboBoxHandler implements ItemListener{
	JComboBox choice;
	JTextArea textShow;
	public void setJComboBox(JComboBox jcb) {
		choice = jcb;
	}
	public void setJTextArea(JTextArea area) {
		textShow = area;
	}
  	// 当下拉框中文件被选中，在文本框中显示内容
	public void itemStateChanged(ItemEvent e) {
		textShow.setText(null);
      	// 获取被选中目标项目
		String fileName=choice.getSelectedItem().toString();
		try(FileReader inOne = new FileReader(fileName);
			BufferedReader inTwo = new BufferedReader(inOne)){
			String s=null;
			while((s=inTwo.readLine())!=null) {
				textShow.append(s+"\n");
			}
		}catch(Exception ee) {
			textShow.append(ee.toString());
		}
	}
}
```

##### DocumentEvent

注意：向文档区注册。实现三个方法：changedUpdate变化事务、insertUpdate插入事务、removeUpdate删除事务

```java
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.*;

class MyJFrame extends JFrame{
    MyJFrame(String s,int x,int y,int w,int h){
        setLayout(new FlowLayout());
        setTitle(s);
        setBounds(x,y,w,h);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

class JTextAreaHandler implements DocumentListener{
    JTextArea inputText,showText;

    public void setInputText(JTextArea inputText) {
        this.inputText = inputText;
    }

    public void setShowText(JTextArea showText) {
        this.showText = showText;
    }

    public void changedUpdate(DocumentEvent e){
        String str = inputText.getText();
        showText.setText(str);
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
       changedUpdate(e);
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        changedUpdate(e);
    }
}

public class Test{
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("DocumentEvent",100,100,400,300);

        JTextArea inputText = new JTextArea(8,15);
        JTextArea showText = new JTextArea(8,15);
        myJFrame.add(new JScrollPane(inputText));
        myJFrame.add(new JScrollPane(showText));

        JTextAreaHandler listen = new JTextAreaHandler();
        listen.setInputText(inputText);
        listen.setShowText(showText);
        // 向文档注册事件
        (inputText.getDocument()).addDocumentListener(listen);
        myJFrame.setVisible(true);
    }
}
```

##### MouseEvent

事件属性：

getX()；X轴上坐标

getY()；Y轴上坐标

getSource()；事件源

MouseListener方法：

1. mousePressed按下事件
2. mouseReleased释放事件
3. mouseEntered进入组件事件
4. mouseExited离开组件事件
5. mouseClicked单击事件

MouseMotionListener方法：

1. mouseDragged拖动鼠标事件
2. mouseMoved移动鼠标事件

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;

class MyJFrame extends JFrame{
    MyJFrame(String s,int x,int y,int w,int h){
        setLayout(new FlowLayout());
        setTitle(s);
        setBounds(x,y,w,h);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

class MouseHandler implements MouseListener,MouseMotionListener{
    int a,b,x0,y0,x,y;
    JTextArea area;

    public void setJTextArea(JTextArea area) {
        this.area = area;
    }

    @Override
    public void mousePressed(MouseEvent e) {
        area.append("\n鼠标按下，位置:("+e.getX()+","+e.getY()+")");
        // 设置位置
        JComponent com = (JComponent)e.getSource();
        a = com.getBounds().x;
        b = com.getBounds().y;
        x0 = e.getX();
        y0 = e.getY();
    }

    @Override
    public void mouseReleased(MouseEvent e) {
    }

    @Override
    public void mouseEntered(MouseEvent e) {
    }

    @Override
    public void mouseExited(MouseEvent e) {
    }

    @Override
    public void mouseClicked(MouseEvent e) {
    }

    @Override
    public void mouseMoved(MouseEvent e) {
    }

    @Override
    public void mouseDragged(MouseEvent e) {
        // 新建一个组件
        Component com = null;
        if (e.getSource() instanceof Component){
            com = (Component)e.getSource();
            // 设置位置
            a = com.getBounds().x;
            b = com.getBounds().y;
            x = e.getX();
            y = e.getY();
            a = a + x;
            b = b + y;
            com.setLocation(a - x0,b - y0);
        }
    }
}

public class Test{
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("DocumentEvent",100,100,400,300);
        JButton button = new JButton("用鼠标拖动我");
        JTextArea area = new JTextArea(10,20);

        MouseHandler mouseHandler = new MouseHandler();
        mouseHandler.setJTextArea(area);
        button.addMouseListener(mouseHandler);
        button.addMouseMotionListener(mouseHandler);
        myJFrame.add(button);
        myJFrame.add(new JScrollPane(area));
        myJFrame.setVisible(true);
    }
}
```

##### FocusEvent(组件)

1. focusGained获得焦点
2. focusLost失去焦点

##### KeyEvent

| 事件属性                          | KeyListener接口        |
| ----------------------------- | -------------------- |
| getKeyCode()      判断哪个键，返回键码值 | keyPressed(e)   按下键  |
| getKeyChar()       返回键上的字符    | keyTyped(e)    按下后释放 |
|                               | keyReleased(e)   释放键 |

### 10.7 对话框

##### 10.7.1 普通对话框

构建函数：public JDialog(Frame owner,String title,boolean modal)

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class MyJFrame extends JFrame{
    MyJFrame(String s,int x,int y,int w,int h){
        setLayout(new FlowLayout());
        setTitle(s);
        setBounds(x,y,w,h);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

class ButtonHandler implements ActionListener{
    JFrame frame;

    public void setFather(JFrame frame) {
        this.frame = frame;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // 关键是父容器
        JDialog d = new JDialog(frame,"对话框",false);
        d.add(new JLabel("你好"));
        d.setBounds(100,400,100,100);
        d.setVisible(true);
    }
}

public class Test{
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("DocumentEvent",100,100,400,300);
        JButton button = new JButton("弹出对话框");
        myJFrame.add(button);

        ButtonHandler buttonHandler = new ButtonHandler();
        buttonHandler.setFather(myJFrame);
        button.addActionListener(buttonHandler);
        myJFrame.setVisible(true);
    }
}
```

##### 10.7.2 消息对话框

public static void showMessageDialog(Component parentComponent,Object message,String title,int messageType)

```java
import javax.swing.JoptionPane;
public Test{
  public static void main(String[] args){
    JOptionPane.showMessageDialog(null,"您好","输入",JOptionPane.INFOMATION_MESSAGE);
  }
}
```

##### 10.7.3 输入对话框

```java
// public staticString showInputDialog(Component parentComponent,Object message,String titile,int messageType)
import javax.swing.JOptionPane;
public static void main(String[] args){
  String str = JOptionPane.showInputDialog(null,"请输入","对话框",JOptionPane.INFORMATION_MESSAGE);
  System.out.println(str);
}
```

##### 10.7.4 确认对话框

```java
// public static int showConfirmDialog(Component parentComponent,Object message,String title,int messageType)
import javax.swing.JOptionPane;
public class Test{
  public static void main(String[] args){
    int i = JOptionPane.showConfirmDialog(null,"确认是否正确","确认对话框",JOptionPane.OK_CANCEL_OPTION);
    System.out.println(i);
  }
}
```

##### 10.7.5 颜色对话框

```java
// public static Color showDialog(Component component,String title,Color initialColor)
import java.awt.Color;
import javax.swing.JColorChooser;
public class Test{
  public static void main(String[] args){
    Color newColor = JColorChooser.showDialog(null,"颜色对话框",Color.red);
    System.out.println(newColor.toString());
  }
}
```

##### 10.7.6 文件对话框

| 构建方法                            | 返回值                                 |
| ------------------------------- | ----------------------------------- |
| int showSaveDialog(Component a) | JFileChooser.APPROVE_OPTION(按了确认按钮) |
| int showOpenDialog(Component a) | JFileChooser.CANCE_OPTION(按了取消按钮)   |

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

class MyJFrame extends JFrame{
    JFileChooser fileDialog;
    JMenuBar menuBar;
    JMenu menu;
    JMenuItem itemSave,itemOpen;
    JTextArea text;

    MyJFrame(String s,int x,int y,int w,int h){
        setLayout(new FlowLayout());
        setTitle(s);
        setBounds(x,y,w,h);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        text = new JTextArea(10,60);
        add(new JScrollPane(text),BorderLayout.CENTER);
        menuBar = new JMenuBar();
        menu = new JMenu("文件");
        itemSave = new JMenuItem("保存文件");
        itemOpen = new JMenuItem("打开文件");
        menu.add(itemSave);
        menu.add(itemOpen);
        menuBar.add(menu);
        setJMenuBar(menuBar);
        fileDialog = new JFileChooser();
        // 设置事件
        SaveListener saveListener = new SaveListener();
        saveListener.setFather(this);
        saveListener.setFileDialog(fileDialog);
        saveListener.setText(text);
        itemSave.addActionListener(saveListener);
        OpenListener openListener = new OpenListener();
        openListener.setFather(this);
        openListener.setFileDialog(fileDialog);
        openListener.setText(text);
        itemOpen.addActionListener(openListener);
        setVisible(true);
    }
}

class SaveListener implements ActionListener{
    JFrame father;
    JFileChooser fileDialog;
    JTextArea text;

    BufferedReader in;
    FileReader fileReader;
    BufferedWriter out;
    FileWriter fileWriter;

    public void setFather(JFrame father) {
        this.father = father;
    }

    public void setFileDialog(JFileChooser fileDialog) {
        this.fileDialog = fileDialog;
    }

    public void setText(JTextArea text) {
        this.text = text;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        int state = fileDialog.showSaveDialog(father);
        if (state == JFileChooser.APPROVE_OPTION){
            try{
                File dir = fileDialog.getCurrentDirectory();
                String name = fileDialog.getSelectedFile().getName();
                File file = new File(dir,name);
                fileWriter = new FileWriter(file);
                out = new BufferedWriter(fileWriter);
                out.write(text.getText());
                out.close();
                fileWriter.close();
            }
            catch (IOException exp){

            }
        }
    }
}

class OpenListener implements ActionListener{
    JFrame father;
    JFileChooser fileDialog;
    JTextArea text;

    BufferedReader in;
    FileReader fileReader;
    BufferedWriter out;
    FileWriter fileWriter;

    public void setFather(JFrame father) {
        this.father = father;
    }

    public void setFileDialog(JFileChooser fileDialog) {
        this.fileDialog = fileDialog;
    }

    public void setText(JTextArea text) {
        this.text = text;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        int state = fileDialog.showOpenDialog(father);
        if (state == JFileChooser.APPROVE_OPTION){
            try{
                File dir = fileDialog.getCurrentDirectory();
                String name = fileDialog.getSelectedFile().getName();
                File file = new File(dir,name);
                fileReader = new FileReader(file);
                in = new BufferedReader(fileReader);
                String s = null;
                while ((s = in.readLine()) != null){
                    text.append(s+"\n");
                }
                in.close();
                fileReader.close();
            }
            catch (IOException exp){

            }
        }
    }
}

public class Test{
    public static void main(String[] args){
        MyJFrame myJFrame = new MyJFrame("文件对话框",100,100,620,300);
    }
}
```