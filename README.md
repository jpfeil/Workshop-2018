# BD2K Summer Coding Workshop 2018
Welcome! The goal of this workshop is to get your Python environment up to speed. We will discuss useful coding tools, environments, and structuring a project. There isn't one way or even a common standard. One of the great things about open source software is you can take this information and modify it to suite your needs. The Internet is also your best friend for learning and writing software. Just type your question into Google and you will find your answer more often than not.

One of the challenges with these workshops is dealing with operating systems. The way you will install software will change depending on your operating system. Since this has been a problem for a long time, there is fortunately a set of tools that will help us work across systems. The first thing we need to do is download the code we will be working with for the workshop.

## Download Code for Workshop (5 min)
The github repository for the workshop is located here:

`https://github.com/jpfeil/Workshop-2018`

Simply click on the clone or download button and click download zip. This will copy all of the material for the workshop to your machine.

## Git bash for Windows
I am not as familiar with windows as I am for the linux operating system. So,to make life easier, all of the windows users are going to download the git bash tool. Mac users don't have to worry about this because they already have a linux like command-line interface called the terminal.

1. Download the 64-bit version:
   https://git-scm.com/download/win
2. Follow the install prompt
3. Double-click on the desktop icon

## Basic Commands

We're going to be working with data on a remote linux server. The interface is entirely in text, so we will need to use the command line. Log onto your server using SSH and then we are going to explore the filesystem. The first command we are going to look at is **ls** - list directory contents

Try these different flags:
* ls --help
* ls --version
* ls -lha

Another important command is **cd** - change directory. First, let's go to the root of the filesystem. This can be done using:
```
cd /
```
Use ls to list all of the files in your root directory. These folders have all of the programs and configuration files that make up your operating system.

To go back to your home directory type:
```
cd ~
```
Another important utility is **mkdir** - make directory. Let's make a directory in our home directory called **bin**.
```
mkdir bin
```
Your ~/bin directory is a good place to store executables.

## Install conda (5 min)
You will likely install a lot of software during your research career. Software often requires very specific dependencies and it is difficult to satisfy the dependencies for many different software packages on one machine. Anaconda is a python package manager that makes this process a lot easier. Sometimes software breaks and it can make your operating system non-functional. Installing your software using anaconda mitigates this problem by installing the software in your home directory, so if your software breaks you can just delete the Anaconda directory and start over again. Let's install anaconda now:

### Windows
1. Go to https://conda.io/miniconda.html
2. Download the Python 3.6 windows installer
3. Double click the .exe file
4. Follow the prompts

### Mac /Linux
1. Go to https://conda.io/miniconda.html
2. Download the Python 3.6 macOS installer
3. Run bash Miniconda3-latest-MacOSX-x86_64.sh
4. Follow the prompts on the installer screen

## Python
We will be using the python programming language in this workshop. Conda comes with its own installation of python. The conda installation should have modified your path so that the conda python version is used instead of your system version. Python includes a read execute print loop (REPL) tool. You can access this by typing python in the command prompt.

### Windows
Open the command prompt window by going to the start menu and then the All Programs menu and then the Accessories section. Select the Command Prompt option. Type python and hit enter.

### Mac /Linux
Select the Go menu at the top of your desktop. Click utilities and then select terminal. Now type `python` and hit return.

As you can see it has some very basic interactive features. You can execute a line of python and save state, but it isn't very flexible and can be prone to typos.

### Write a hello-world function (2.5 min)
Write a hello-world function

```
def hello_world():
	print("Hello, world!")

hello_world()
```

## Install iPython (5 min)
The tools that come out of the box with python are very basic, but there have been several tools recently developed that make scientific computing with python much more convenient. The next tool I want to share with you is a more interactive form of python called iPython. IPython is only a slight improvement, but it is convenient for simple tasks. Let's start an instance of ipython and see how it is different than the python REPL.

### Write a hello-world function in ipython (2.5 min)
```
def hello_world():
	print("Hello, world!")

hello_world()
```

I think Ipython is helpful because it allows you to use bash commands so that you can interact with the filesystem more easily.

### Exercise:
1. List all of the files in your Workshop-2018 directory using the `ls` command
2. Write a python function to count how many lines are in the data/titles.csv file
3. Use the wc -l command to count the lines in data/titles.csv by putting an ! before the command

ipython will help you with tab completion, so you can hit tab once you start writing out a directory name. Try typing `ls data` in your Ipython session. iPython is helpful for doing simple calculations while navigating your filesystem.

### Install jupyter notebook (5 min)
The real scientific computing powerhouse is called Jupyter. Jupyter is not specific to python. You can also run R and Julia kernels as well as others. Jupyter notebook is powerful because it allows you to code in an interactive way but you can also preserve your code and notes in the same place. This makes your scientific coding reproducible and it reminds you how you obtained those results months after you wrote the code when it is time to publish the results. Let's now install Jupyter using conda.

### Windows
Open the Anaconda command prompt by navigating to the start menu and selecting anaconda in your programs menu. Type conda install jupyter in the command prompt and follow the install instructions.

### Mac /Linux
Open up a terminal and type conda install jupyter and follow the install instructions.

### Jupyter basics (5 min)
Start a jupyter session by typing `jupyter notebook` in the terminal or Command Prompt. This will bring up a filesystem on your browser. Hopefully, you are in your Workshop-2018 directory, so you see the data and notebooks directories. Click on the notebooks directory and click the new drop-down menu and select the python kernel. This should bring up an Untitled.ipynb file. Click on Untitled next to the jupyter logo and rename the notebook.

### Documentation (5 min)
You can use the Markdown language to document your Jupyter notebook. Markdown is a simple language for formatting text. Here are a few commonly used features:
```
Headers:
 # - is the largest header
 ## - is a slightly smaller header
 ### - you get the idea...

 Bullet Points
 *
 ...

 Numbered List
 1.
 2.
 3.
 ...

 Code
 Back tick
 ...
```

### Writing Python Code
You can execute the code in each cell out of order, but the state is shared across cells. So, variables you instantiate in one cell will be available in other cells. This is a huge source of bugs, so be careful with how you name variables because you may be modifying a variable unknowingly.

Let's write the hello-world function again. To execute the cell you can either press the run button at the top of the notebook (the play button) or type shift-enter on your keyboard. This should print Hello, world to the jupyter notebook.

Jupyter notebooks are very useful for research because you can document your work next to your code. This allows for reproducible results and keeps your research projects moving forward. I highly recommend creating a notebook for each research task you begin. Organizing many jupyter notebooks in a git repo and backing up the notebooks to github is a great way to make progress on your research. It is also easy to share notebooks with collaborators this way. One caveat is that some of the git features will get confused with jupyter notebooks, so do not try to merge notebooks using git. If you need to pull changes into a git repo, merge the entire notebook at a time.

### Useful scientific libraries for Python
Python is a great programming language, but it doesn't take long before you start having problems that are not easily solved with python alone. To tackle these problems efficiently, you will need to import libraries. Python has a vibrant open-source community, so there are constantly new libraries being developed for scientific computing tasks. I've listed a few essential libraries here.

* Numpy
* Pandas
* Matplotlib
* Seaborn

### Exercise:
1. Use your conda environment to install these libraries (5 min)

### Numpy (10 min)
Numpy is optimized for numeric operations like linear algebra. Python is built on top of the C programming language and can be slow. To overcome this, numpy and other packages optimize routine calculations.

A common way to import numpy is to type:
`
import numpy as np
`

We are going to use numpy to perform some basic linear algebra calculations and we are going to compare the speed of a pure python implementation to the numpy implementation.

#### Exercise
1. Go to the notebooks/numpy.ipynb notebook and follow the instructions.

### Pandas
The second library I want to show is called pandas. Pandas provides a dataframe object that is very useful for data analysis. If you are familiar with R, then you have likely interacted with a similar kind of object. You can think of a dataframe as a large table where the rows and columns have labels. The row labels are referred to as the index and the column labels are referred to as columns. Let's create an empty dataframe in the next cell by typing this line:

`
import pandas as pd

df = pd.DataFrame(index=['a', 'b', 'c'], columns=[1, 2, 3])
`

You can fill in the dataframe by accessing specific rows, columns, or cells. For example, you
can fill the entire column with a single value by using hard-brackets.

`
df[1] = 'alpha'
``

You can fill in a specific row using
`
df.loc['b', :] = 'beta'

Likewise, you can fill specific cells using the loc operator

`
df.loc['c', 3] = 'gamma'
`

Download the Treehouse gene expression compendium:
https://xena.treehouse.gi.ucsc.edu/download/TreehousePEDv5_unique_hugo_log2_tpm_plus_1.2018-05-09.tsv

#### Exercise:
1. Go to the notebooks/pandas.ipynb notebook and follow the instructions.

### Matplotlib
All of the information is in the jupyter notebook, so after a brief presentation
you can proceed to the notebook.

#### Exercise:
1. Go to the notebooks/matplotlib.ipynb notebook and follow the instructions.

### Seaborn
All of the information is in the jupyter notebook, so after a brief presentation
you can proceed to the notebook.

### Exercise:
1. Go to the notebooks/seaborn.ipynb notebook and follow the instructions.

## For tomorrow!
You will need to have a github, pycharm, dockerhub, and rosalind accounts for tomorrow. Please go to these websites and create logins so that we don't have to use up too much time tomorrow. Let me know if you have trouble making an account.

https://github.com

https://www.jetbrains.com/pycharm/
- apply for a student account or download the community edition

https://hub.docker.com/

You also need to install docker
Windows instructions:
https://store.docker.com/editions/community/docker-ce-desktop-windows

Mac instructions:
https://store.docker.com/editions/community/docker-ce-desktop-mac

http://rosalind.info/problems/locations/

Tomorrow we will work through the README in the rosalind directory.
