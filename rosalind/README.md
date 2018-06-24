# Day 2: Developing your own projects

The first part of this workshop was to introduce you to useful python programming tools. Today, I want to show you some basic engineering skills for getting your project off the ground. We will be learning to use the powerful integrated development environment (IDE) called Pycharm. After we begin to write our rosalind problem solving project, we will learn how to track changes to the project using git and github. Finally, we will discuss the very useful docker container approach for packaging your project and distributing it.

### Pycharm
There are many IDEs for python, but I have found that Pycharm is the best. You are welcome to use whatever you like, but Pycharm is what I recommend you use. One of the downsides to Pycharm is that you have to pay for it... However, if you are a student, then you can apply for a student membership which is fee. There is also a community version that is free but it does not have all of the features of the professional version. For this workshop, you can get by with the community addition. Hopefully, you have already installed pycharm.

Unlike other IDEs, when you open a pycharm session you can only work on one project at a time. You can open several sessions, but don't mix files from different sessions because pycharm will try to integrate them. Basically, when you open a pycharm window, try to work on only one project.

To start a new project, you simply click on the File menu and select open. This will open a file browser and then you will select the directory your project is in. This should ask you if you want to open the directory in the current window are a new window. Always open it in the new window.

Pycharm has some nice features like tab completion, style suggestions, syntax error notifications, a built in terminal, and a debugger. It can do a lot more than this,
so dig into the documentation if you want to become a power-user.

#### Exercise:
1. Start up a pycharm session
2. Open the rosalind directory
3. Go to file and then settings
4. Select project:rosalind
5. Select Project Interpreter
6. Check that the interpreter is set to your conda installation
7. Select Project structure
8. Select the second rosalind directory
9. Select mark as Sources

Now your PyCharm environment is set up for developing a rosalind problem solving machine!

### Argparse
Most bioinformatics software is used using the command line. The command-line gives you a lot of power to solve problems. If your command-line program takes off and does really well then you should think about making a graphical user interface, but until then you will likely write command-line tools.

Programs that do just one thing are not very interesting, so we will also need a way to modify your programs at runtime. To accomplish this, we will use the python Argparse library. The argparse library can handle may different types of input and once you become familiar with using the library you will find that you can copy and paste argparse code from old programs into your new programs.

Here is an example of a program that uses the argparse library. You first
instantiate an instance of the ArgumentParser object. The description will
be printed whenever the user uses the -h or --help flags which are reserved
for displaying help information. Use the add_argument function to add another
argument to the parser. You can add short and long versions of flags. For
example, the user can specify `-s` or `--sum` to take the sum of the list
of integers.

```
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator')
parser.add_argument('-s', '--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)')

args = parser.parse_args()
print(args.accumulate(args.integers))
```

#### Exercise:
For this exercise we will make a basic argparse command line tool. We will use
this same argparse code for later sections, so we might as well design it in
a way that will be useful later. Create a positional argument (so no flag) called
problem. This will store a string that will tell us what problem to solve later.
You will also create a flag called --input that takes a path to a file.

Use the run.py script as a starting point for your program. Write a function called echo that reads text from a file and prints it to the console. Next create a conditional
if args.problem == "echo" block that then passes the path from the command-line
to your echo function.

Finally, add an else block that raises a ValueError and lists all of the problems
your program is able to solve. In this case it is just echo, which isn't really
a problem but you will get the idea later.

#### Adding modules
Once you start making more complex programs, you will need to become familiar with loading your own modules. Loading modules in python is straightforward because you just have to add an empty file called `__init__.py` in the directory with your modules.

Since you set the source directory for your rosalind project, you should be able
to import modules from the library directory. Check that the library directory has
a `__init__.py` file.

#### Exercise:
Often I will write functions in run.py but then I want to add more features. So, to make less clutter, I will cut functions out of run.py and place them in a module. I like to make a module called utils.py in the library directory for basic functions like echo. So, create a module called utils.py, add your echo function to this module, and finally import this function in run.py. Make sure you get the same results. The import should look like:

`from library.utils import echo`

### Rosalind
Rosalind is a great way to learn new algorithms and/or programming languages. Basically, Rosalind provides a series of questions with increasing difficulty. Each problem gives background for the biology and the computer science. It also provides a training data set with the correct solution. Once you think you have code to solve the problem, you can download the test data and then upload the solution. But be aware that you only have 5 minutes to upload your solution to the problem.

#### Exercise:
We will make your program capable of solving all of the rosalind problems...eventually. We will use the problem positional argument to determine which problem to solve. I recommend using the rosalind problem IDs as the input for the problem argument. So, DNA would be the first problem. After the `if args.problem == 'echo'` block, add a `elif args.problem == 'DNA'` block. Then, create a function that solves the DNA problem. You will also
want an output file argument (--output). The default of --output can be set to "output.tsv".

Tip:
It's a good idea to keep your programs DRY (don't repeat yourself!). When you add a function to utils.py for example, try to use the same function for other rosalind problems.
Once your utils.py module starts filling up, you will want to separate the functions into
other modules. So, you may want a module for parsers, for sorting algorithms, for alignment algorithms, etc.

### Git
We have already used GitHub to download the source code for the workshop. I recommend you use github for all of your programming tasks. This way your code is secure so it will survive even if you spill diet coke on your laptop. It also makes it easy to distribute your code to collaborators as well as show people what you are working on.

That being said, git is not an easy tool to use and should be used with extreme caution. Since git is a command-line utility it is difficult to know exactly what the commands are doing until you have used the tool for some time and have seen all the possible and terrible outcomes.

The first command you should become familiar with is git status.

Execute:
`git status`

This command will list the branch you are on as well the files that have been modified. One limitation of github is that you cannot upload large files, so be careful not to add files larger than 10MB to your repo. For example, the cast.csv file is too large for github. So, do not add this file to the repository.

During the course of this workshop, you have made several changes to the notebooks and other files. Use the `git diff` command to see all of the changes you have made since the last commit was made.

Once you are happy with the changes you have made, you can add each individual file using the `git add` command.

#### Exercise:
Go through all of the files you have modified and add them to the repo.

Example:
`git add <path to file>`

Now that we have bundled all of the changes, we can use the git commit command to make an official commit to our repo. It's good practice to make an informative commit message so you know what is in the commit. Say you want to go back to a previous version. You can use these commit messages to remind you where you left off in the last commit.

#### Exercise:
Think of a commit message that describes the work you have done so far.

Example:
`git commit -m <Your commit message>`

The `git log` command allows you to see the commits that have been entered for a branch.

#### Exercise:
Check that your commit was logged successfully by executing the `git log` command

You have been working in my copy of the workshop code, but you will want to save your personal changes to your own github repo. To do this you will need to make a fork of my Workshop-2018 repo and then add your fork as a remote repo.

#### Exercise:
1. Go to the Workshop-2018 repo and click the fork button in the top right side of the page
2. Use the `git remote add <name for fork> <url for your forked repo>`
  - you need to create your own name for the fork
  - use the clone button on your forked repo to get the URL

When you are ready to "save" your changes on github, use the `git push` command to push your changes to the github website. This will save your changes on the master branch.

#### Exercise:
Push your changes to your forked repository.

Example:
`git push <name for fork> master`

Tip:
Jupyter notebooks are very complicated files, so be careful merging code when
using jupyter notebooks. You should clear the output of the notebook before
pushing the changes and you may have to force push or force pull to delete the
remote or local code and replace it with your changes. This should of course
be done with extreme caution. Of course, the code doesn't matter much for this
workshop, so don't worry about breaking this repo, but take care for future projects.

### Workflow
Make github issues for each modification to the repo and then make a git branch for each issue. Then, when you are done with your changes and you are ready to merge them with the master branch, you start a pull request that will merge those changes in. Do not start
multiple branches at the same time because you will need to rebase each branch after
each issue is merged.

#### Exercise:
1. Make a github issue on your fork for the next rosalind problem
2. Make a branch for the next rosalind probem using `git branch <name of branch>` (I recommend using the issue name in the branch name (i.e. issue-<#>/solve-rosalind-RNA)
3. Now make your changes to the rosalind directory to solve the second rosalind problem
4. Check your solution using the rosalind website
5. Add, commit, and push your changes to the branch (i.e. `git push <fork name> issue-<#>/solve-rosalind-2`)
6. Go to your forked repo on github. You should see a line that says something like "make a pull request for recent changes?" Click that button
  - Check that you are not making a pull request to my repo
  - If you are, then you just have to click on the repo menu and select your repo
7. Review the changes you have made
8. Go to the bottom of the pull request and click merge code
9. Now on your computer...checkout the master branch using the command `git checkout master`
10. Now your github master branch is farther along than your local master branch. To bring these changes to your local machine use the git pull command (i.e. `git pull <name of fork> master)`

#### Exercises:
Repeat this process again for the third rosalind problem. Once you merge the code into
your repo, close the issues and enjoy the endorphin hit.

### Docker
One of the issues with distributing software is that an algorithm may behave differently on my computer than on your computer depending on the other libraries you have on your computer. To make life simpler, a lot of smart people developed a tool called Docker. Docker is basically a virtual machine that allows you to ship your code with all of its dependencies. We will learn how to install docker and then we will package your rosalind solving machine in a docker container and then you will have your partner run your code on their machine to show how easy it is to run other people's code when using docker.

#### Windows
You will need to make a docker account first

Follow the instructions here:
https://store.docker.com/editions/community/docker-ce-desktop-windows

Open the PowerShell and run `docker version`
Check that docker is installed correctly by running `docker run hello-world`

#### Mac
Follow the instructions here:
https://store.docker.com/editions/community/docker-ce-desktop-mac

Open the a terminal and run `docker version`
Check that docker is installed correctly by running `docker run hello-world`

### Dockerfile
The next thing we need to do is make a Dockerfile that packages up your code and creates a docker container. Think of a Dockerfile as a list of instructions for creating a docker container. They function very similarly to bash commands for installing software.

Set your version number to the number of problems you have solved. So, the first version should be 0.1.0. If you change the way the program functions, make a major version change (1.0.0), and if there is an important bugfix, create a hotfix version (1.0.1).

Running a docker container is the most difficult part of this. You have to keep in mind that your docker container is like its own linux computer running inside your computer. So, your docker container does not behave like your computer. You also have to mount your filesystem because the docker container's filesytem is different than your filesystem. To make this easy, just always run your code in your working directory and always mount your working directory as /data in the docker container. For example,

`docker run -it -v $(pwd):/data/ DockerhubName/rosalind:version -h`

The -it makes it an interactive session and also terminates the container at the end. The -v stands for volume and it is this command that maps a directory on your filesystem (your working directory) to the docker container filesystem at /data/. If you stick with this then you should be fine.

#### Exercise:
Make sure you know your dockerhub username and password before you push
your docker container.

1. Fill out the Dockerfile for your version of the rosalind project
2. Build you container `docker build . -t DockerhubName/rosalind:version`
3. Run your docker container (see note above)
4. Now push the container to your dockerhub account `docker push DockerhubName/rosalind:version`
5. Now pull your partner's docker container and make sure you are getting the same answers to the rosalind problems. `docker pull DockerhubName/rosalind:version`

#### Exercise:
This is a challenge problem. You and your partner are going to implement the next rosalind problem, but you are not going to submit your own solution. In the time it takes to download the data, you will pull your partner's code from dockerhub, run it on the data, and upload their solution to your rosalind account. Your partner will do the same thing, but with your code. Good luck!

### Summer Rosalind Drop-Ins
I will be having office hours from 7 pm - 8 pm on Tuesdays. Come by if you
want to work on Rosalind problems together. We can also discuss your research
and what tools are available to help you accomplish your research goals.

JULY DROP-INS
July 10th, 17th, and 24th (TUESDAYS), all at 7:00PM.
Location: S&E Library - 332

AUGUST DROP-INS
Aug 4th and 11th (SATURDAYS), all at 10:00AM
Location: TBD
