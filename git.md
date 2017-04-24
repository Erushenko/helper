^ - предыдущий коммит
~1 - текущий коммит минус 1
~n - текущий коммит минус n


#git rebase
git co master2
git fetch
git pull
git co <branch>
git rebase origin\master2
git rebase -- continue or -- skip

resolve conflict
git add (conflict file)

git push origin <branch> !!! -f


#remove local
git branch -D 548

#diff
git diff --staged

#04.undoing changes-retrieving old versions
git log
##copy part SHA
git co SHA -- <file>
git reset HEAD <file>
git co -- <file>

#05.undoing changes-reverting a commit
git log
##get SHA commit's
git revert SHA

#06.undoing changes-using reset to undo many commits
##I/m must copy SHA to file use => git log
git reset
	--soft
		- does not change staging index or working directory
	--mixed (default)
		- changes staging index to match repository
		- does not change working directory
	--hard
		- changes staging index and working directory to match repository

#09 Navigating the commit tree
##Referencing commits
git ls-tree <HEAD> <SHA>
##
git log --oneline
## 16 in current month
git log --since=16 --oneline
git log --since "2017-03-16" --oneline
git log --until "2017-03-16"
git log --since=1.weeks.ago --until=2.days --oneline
##to show diff in commits
git log <SHA> -p

git log --graph --oneline --all --decorate

##show diff in the commit
git show <SHA>
##show diff 3 commit ago
git show HEAD~3
## diff in the file
git diff <SHA> <path file>

#to change last commit message
git commit --amend

#squash
git commit squash

#10 Branching
git diff <name_branch>..<name_branche2>
git diff --color-words <name_branch>..<name_branche2>

git diff --color-words <name_branch>..<name_branche2>^

##показать список бранчей в текущем бранче
git branch --merched

#rename branch's
git branch --move/-m <last_name> <new_name>

##deleting branches
git branch --delete/d <name_branch>

#11 merged branches
git branch --merged <name_branch>
