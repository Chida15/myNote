<!-- toc -->

### 第一章：安装和新建项目

#### 1.1 安装

安装django：```pip install Django```

验证安装：```django-admin --version```

#### 1.2 第一个项目

新建项目：```django-admin startproject mysite```

生成的目录

```shell
mysite/
    manage.py
    mysite/
        __init__.py
        settings.py
        urls.py
        wsgi.py
```

| 名字               | 作用                                                         |
| ------------------ | ------------------------------------------------------------ |
| mysite/            | 根目录只是你项目的容器                                       |
| manage.py          | 管理 Django 项目的命令行工具。你可以阅读 [django-admin and manage.py](https://docs.djangoproject.com/zh-hans/2.1/ref/django-admin/) 获取所有细节 |
| mysite/__init__.py | 告诉 Python 这个目录应该被认为是一个 Python 包               |
| mysite/settings.py | Django 项目的配置文件，，请查看 [Django settings](https://docs.djangoproject.com/zh-hans/2.1/topics/settings/) 了解细节 |
| mysite/urls.py     | Django 项目的 URL 声明，就像你网站的“目录”。阅读 [URL调度器](https://docs.djangoproject.com/zh-hans/2.1/topics/http/urls/) 文档来获取更多内容 |
| mysite/wsgi.py     | 作为运行在 WSGI 兼容的Web服务器上的入口，阅读 [如何使用 WSGI 进行部署](https://docs.djangoproject.com/zh-hans/2.1/howto/deployment/wsgi/) 了解更多细节 |

#### 1.3 第一次启动

启动调试界面：`python manage.py runserver`

### 第二章：第一个应用(polls)

#### 2.1 文件目录

```shell
polls/
    __init__.py
    admin.py
    apps.py
    migrations/
        __init__.py
    models.py
    tests.py
    urls.py
    views.py
```

#### 2.2 添加一个视图

app中视图文件：views

```python
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
```

app中链接文件：urls

```python
from django.urls import path
from . import views

# 函数 path() 具有四个参数，两个必须参数：route 和 view，两个可选参数：kwargs 和 name
urlpatterns = [
    path('', views.index, name='index'),
]
```

项目中链接文件：urls

```python
from django.contrib import admin
from django.urls import include, path

# 函数 include() 允许引用其它 URLconfs
urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
```

#### 2.3 自带应用数据库

查看setting.py中自带应用：

- [`django.contrib.admin`](https://docs.djangoproject.com/zh-hans/2.1/ref/contrib/admin/#module-django.contrib.admin) -- 管理员站点， 你很快就会使用它。
- [`django.contrib.auth`](https://docs.djangoproject.com/zh-hans/2.1/topics/auth/#module-django.contrib.auth) -- 认证授权系统。
- [`django.contrib.contenttypes`](https://docs.djangoproject.com/zh-hans/2.1/ref/contrib/contenttypes/#module-django.contrib.contenttypes) -- 内容类型框架。
- [`django.contrib.sessions`](https://docs.djangoproject.com/zh-hans/2.1/topics/http/sessions/#module-django.contrib.sessions) -- 会话框架。
- [`django.contrib.messages`](https://docs.djangoproject.com/zh-hans/2.1/ref/contrib/messages/#module-django.contrib.messages) -- 消息框架。
- [`django.contrib.staticfiles`](https://docs.djangoproject.com/zh-hans/2.1/ref/contrib/staticfiles/#module-django.contrib.staticfiles) -- 管理静态文件的框架。

为应用创建数据库表：`python manage.py migrate`

#### 2.4 创建数据模型

同我课程设计中使用的结构不谋而和，用类包装数据库

```python
from django.db import models

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```

在setting.py中激活模型(添加一行)

```python
'polls.apps.PollsConfig',
```

生成数据库迁移文件：`python manage.py makemigrations polls`

创建polls/migrations/xxxx_initial.py迁移文件

查看迁移文件sql语句：`python manage.py sqlmigrate polls xxxx`

提交数据库迁移：`python manage.py migrate`

#### 2.5 django命令行

进入命令行：`python manage.py shell`

导入模型：`from polls.models import Choice, Question`

查看所有：`Question.objects.all()`

新建对象：`q = Question(question_text="What's new?", pub_date=timezone.now())`

保存对象：`q.save()`

按编号获取对象：`Question.objects.get(pk=1)`

查看对象被参考对象：`q.choice_set.all()`

为对象新建参考对象：`c = q.choice_set.create(choice_text='Just hacking again', votes=0)`

查看该对象参考：`c.question`

#### 2.6 友好化输出

```python
    def __str__(self):
        return self.question_text
    
    def __str__(self):
        return self.choice_text
```

#### 2.7 后台管理

创建管理员账号：`python manage.py createsuperuser`

打开管理员界面：`http://127.0.0.1:8000/admin/`

注册管理对象：在polls/admin.py中

```python
from .models import Question
admin.site.register(Question)
```

### 第三章：视图和链接

#### 3.1 传递参数

polls/views.py

```python
def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
```

polls/urls.py

```python
from django.urls import path
from . import views

# int:question_id 表明接收一个整型数据，并传递
urlpatterns = [
    # ex: /polls/
    path('', views.index, name='index'),
    # ex: /polls/5/
    path('<int:question_id>/', views.detail, name='detail'),
    # ex: /polls/5/results/
    path('<int:question_id>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```

#### 3.2 使用模板

polls/templates/polls/index.html

```html
{% if latest_question_list %}
    <ul>
    {% for question in latest_question_list %}
        <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
    {% endfor %}
    </ul>
{% else %}
    <p>No polls are available.</p>
{% endif %}
```

使用模板polls/views.py

```python
from django.template import loader
from .models import Question

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('polls/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))
```

一个快捷方式：

```python
from django.shortcuts import render
from .models import Question

# render需要request、模板和参数列表
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)
```

#### 3.3 考虑404错误

polls/views

```python
from django.http import Http404
from django.shortcuts import render

# 捕获错误后输出404
from .models import Question
def detail(request, question_id):
    try:
        question = Question.objects.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request, 'polls/detail.html', {'question': question})
```

一个快捷方式：

```python
from django.shortcuts import get_object_or_404, render
from .models import Question
# get_object_or_404 一个快捷函数
def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})
```

#### 3.4 去除硬链接

polls/index.html中的投票链接：`<a href="/polls/{{ question.id }}/">{{ question.question_text }}</a>`

改为`<a href="{% url 'detail' question.id %}">{{ question.question_text }}</a>`

url表示polls的urls.py文件，中name='detail'的函数

#### 3.5 设置链接命名空间

polls/urls.py中添加`app_name = 'polls'`

polls/index.html中修改为：`<li><a href="{% url 'polls:detail' question.id %}">{{ question.question_text }}</a></li>`

### 第四章：进阶应用

#### 4.1 表格

polls/templates/polls/detail.html

```html
<h1>{{ question.question_text }}</h1>

{% if error_message %}<p><strong>{{ error_message }}</strong></p>{% endif %}

<form action="{% url 'polls:vote' question.id %}" method="post">
{% csrf_token %}	<!-- 表格验证app -->
{% for choice in question.choice_set.all %}
    <input type="radio" name="choice" id="choice{{ forloop.counter }}" value="{{ choice.id }}">
    <label for="choice{{ forloop.counter }}">{{ choice.choice_text }}</label><br>
{% endfor %}
<input type="submit" value="Vote">
</form>
```

添加到链接文件：`path('<int:question_id>/vote/', views.vote, name='vote'),`

设置视图函数polls/views.py：

```python
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse

from .models import Choice, Question
# ...
# request.POST 是一个类字典对象，让你可以通过关键字的名字获取提交的数据
# 如果在 request.POST['choice'] 数据中没有提供 choice ， POST 将引发一个 KeyError
# HttpResponseRedirect 只接收一个参数：用户将要被重定向的 URL
# 这个函数避免了我们在视图函数中硬编码 URL,需要给出跳转的视图的名字和该视图所对应的 URL 模式中需要给该视图提供的参数
def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
```

#### 4.2 通用视图

polls/urls.py

```python
from django.urls import path

from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```

polls/views.py

```python
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
# generic引入通用视图
from django.views import generic
from .models import Choice, Question

# 两种通用视图： ListView 和 DetailView 
# 条件:①指定模型	②使用 "pk" 为主键值
# template_name 指定模板位置
# context_object_name 指定使用列表
class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'
    def get_queryset(self):
        """Return the last five published questions."""
        return Question.objects.order_by('-pub_date')[:5]

class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'

class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'

def vote(request, question_id):
    ... # same as above, no changes needed.
```

#### 4.3 自动化测试之函数

polls/test.py

```python
import datetime
from django.test import TestCase
from django.utils import timezone
from .models import Question

# 条件:①继承TestCase类	②有test开头函数
# assertIs函数，判定输出函数
class QuestionModelTests(TestCase):
    def test_was_published_recently_with_future_question(self):
        """
        was_published_recently() returns False for questions whose pub_date
        is in the future.
        """
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertIs(future_question.was_published_recently(), False)
```

#### 4.4 自动化测试之视图

> `python manage.py shell`
>
> > `from django.test.utils import setup_test_environment`
> >
> > `setup_test_environment()`
> >
> > [`setup_test_environment()`](https://docs.djangoproject.com/zh-hans/2.1/topics/testing/advanced/#django.test.utils.setup_test_environment) 提供了一个模板渲染器，允许我们为 responses 添加一些额外的属性，例如 `response.context`
>
> > `from django.test import Client`
> >
> > `client = Client()`
> >
> > 引入测试包
>
> > 普通网页测试
> >
> > `response = client.get('/')`
> >
> > `response.status_code`
>
> > 复杂网页测试
> >
> > `from django.urls import reverse`
> >
> > `response = client.get(reverse('polls:index'))`
> >
> > `response.status_code`
> >
> > `response.content`
> >
> > `response.context['latest_question_list']`