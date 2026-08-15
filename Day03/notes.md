# Day 3 - Git Mastery
## What I did
- Learngitbranching: All levels done including remote
- OhMyGit: Practiced git on the game based env
- First Contribution: Made my first real open source PR

## What I learned
- git init = initialize
- git status = check the status
- git add = add to staging area
- git restore -- staged <file> = to unstage
- git log = shows the entire git log
- git reset = can reset a file back to the state in your branch without committing.
- git stash = used when required,  temporarily saves your current local changes so you can get back to a clean working tree, without committing.
- git remote add origin url = clone a repo
- git branch = to check the branches of a repo
- git checkout <branchname> "=switch branches" = work on the specific branch
- git checkout -b <branch name> "=creating and switching branches"
- git push -- set-upstream origin repo = to push the branch
- git branch -d 'name of the branch' = to delete a branch 
- git clone = Download a repository (and its history) from a remote.
- git add . = Stage all changes in the current directory.
- git commit = Create a new commit from staged changes.
- git commit -m "msg" = Commit with an inline message.
- git rm = Remove files and stage the removal.
- git mv = Move/rename files and stage the change.
- git diff = Show differences between commits/working tree.
- git diff --staged = Show differences between staged changes and the last commit.
- git show = Show details (diff) of a specific commit.
- git switch = Switch branches (modern).
- git merge = Merge another branch into the current one.
- git rebase = Reapply your commits on top of another base.
- git pull = Fetch + integrate remote changes (merge by default).
- git pull --rebase = Fetch + rebase local commits on remote changes.
- git fetch = Download remote changes without integrating.
- git push = Upload local commits to a remote.
- git remote = Manage remotes.
- git remote -v = Show remote URLs.
- git pull <remote> <branch> = Pull a specific remote/branch.
- git push -u origin <branch> = Push and set upstream tracking.
- git tag = List/create/delete tags.
- git ls-files = List tracked files.
- git grep = Search for text in the repo.
- git blame = Show who changed each line and when.
- git cherry-pick = Apply a specific commit from another branch.
- git revert = Create a new commit that undoes a previous commit.
- git clean — Remove untracked files from the working directory.
- git stash list — List stashes.
- git stash pop = Apply the latest stash and drop it.
- git stash apply = Apply a stash without dropping it.
- git config = Get/set Git configuration.
- git help = Show help for Git commands.
# what surprised me
- Rebase rewrites commit history completely = I used to always merge, never rebased. Cleaner history but dangerous on shared branches.
- cherry-pick lets you grab One commit from any branch = Didn't knew this existed, solves problems I used to solve by copy-pasting code manually
- Pre-commit hooks run automatically before every commit= This could have caught so many bugs in my earlier work.
- Interactive rebase (git rebase -i) = lets you edit, squash, reorder past commits(Now that feels like time travel)
- git reflog saves everything (even deleted branches recoverable for 30 days)
# what i Struggled with 
- Rebase vs merge = conceptually clear but muscle memory keeps reaching for merge
- Resolving merge conflicts in terminal without a GUI 
- Understanding detache Head state - took 3 reads to fully click.
# Tomorrow 
- Python For Devops.
