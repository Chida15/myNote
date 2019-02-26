## JUnit

---------

### 目录：
#### [1.初次使用](#first)
#### [2.多种注解](#second)
#### [3.断言](#third)
#### [4.套件测试](#fourth)
#### [5.参数化测试](#fifth)
#### [6.规则](#sixth)
#### [7.参考资料](#seventh)

----------------

### <p id="first">1.最基础使用@Test</p>
```Java
@Test
public void testSum() {
    System.out.println("@Test sum(): " + sum + " = " + testSum);
    assertEquals(sum, testSum);
}
```

### <p id="second">2.多种注解</p>
| 注解 | 函数标准 | 用处 |
| - | - | - |
| @Test | public void method() | 略 |
| @Before | public void method() | 在test之前 |
| @After | public void method() | test之后 |
| @BeforeClass | public static void method() | 类加载之前 |
| @AfterClass | public static void method() | 类加载之后 |
| @Ignore | public void method() | 忽略测试 |

### <p id="third">3.断言</p>
| 断言 | 描述 |
| - | - |
| void assertEquals([String message], expected value, actual value) | 断言两个值相等。值可能是类型有 int, short, long, byte, char or java.lang.Object. 第一个参数是一个可选的字符串消息 |
| void assertTrue([String message], boolean condition) | 断言一个条件为真 |
| void assertFalse([String message],boolean condition) | 断言一个条件为假 |
| void assertNotNull([String message], java.lang.Object object) | 断言一个对象不为空(null) |
| void assertNull([String message], java.lang.Object object) | 断言一个对象为空(null) |
| void assertSame([String message], java.lang.Object expected, java.lang.Object actual) | 断言，两个对象引用相同的对象 |
| void assertNotSame([String message], java.lang.Object unexpected, java.lang.Object actual) | 断言，两个对象不是引用同一个对象 |
| void assertArrayEquals([String message], expectedArray, resultArray) | 断言预期数组和结果数组相等。数组的类型可能是 int, long, short, char, byte or java.lang.Object. |

### <p id="fourth">4.套件测试(多类测试)</p>
```Java
@RunWith(Suite.class)
@Suite.SuiteClasses({ PrepareMyBagTest.class, AddPencilsTest.class })
```

### <p id="fifth">5.参数化测试</p>
#### 实现条件
① 该类被注解为 @RunWith(Parameterized.class)
```Java
@RunWith(Parameterized.class)
public class CalculateTest {
```
② 这个类有一个构造函数，存储测试数据。
```Java
public CalculateTest(int expectedResult, int firstNumber, int secondNumber) {
    this.expected = expectedResult;
    this.first = firstNumber;
    this.second = secondNumber;
}
```
③ 这个类有一个静态方法生成并返回测试数据，并注明@Parameters注解。
```Java
@Parameters
public static Collection addedNumbers() {
    return Arrays.asList(new Integer[][] { { 3, 1, 2 }, { 5, 2, 3 },
            { 7, 3, 4 }, { 9, 4, 5 }, });
}
```
④ 有一个@Test
```Java
@Test
public void sum() {
    Calculate add = new Calculate();
    System.out.println("Addition with parameters : " + first + " and "
            + second);
    assertEquals(expected, add.sum(first, second));
}
```

#### 注意点：
**构造函数**决定三个数的位置

### <p id="sixth">6.规则rule</p>
定义：用于一个类的规定
①最简单例子
```Java
@Rule
	public TestName name = new TestName();
```

②复杂例子
```Java
public class MethodNameExample implements TestRule {
    @Override
    public Statement apply(final Statement base, final Description description) {
        return new Statement() {
            @Override
            public void evaluate() throws Throwable {
                //想要在测试方法运行之前做一些事情，就在base.evaluate()之前做
                String className = description.getClassName();
                String methodName = description.getMethodName();

                base.evaluate();  //这其实就是运行测试方法

                //想要在测试方法运行之后做一些事情，就在base.evaluate()之后做
                System.out.println("Class name: "+className +", method name: "+methodName);
            }
        };
    }
}

@Rule
   public MethodNameExample methodNameExample = new MethodNameExample();
```

### <p id="seventh">7.参考资料</p>
#### [易百教程](https://www.yiibai.com/junit/what-is-junit.html)
#### [安卓单元测试(八)：Junit Rule的使用](https://www.jianshu.com/p/2cd745e54a78)
