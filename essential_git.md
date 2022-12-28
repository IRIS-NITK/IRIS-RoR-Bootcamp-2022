# Essential Git

Git is a software designed for coordinating work among programmers and
tracking changes. We will be using Git to coordinate with other
developers (i.e. Bootcamp mentors) by downloading and submitting
exercises.
 
If you are new to Git or would like a refresher, read through the
'Beginner', 'Getting Started' and 'Collaborating' sections of the
Atlassian tutorials: https://www.atlassian.com/git/tutorials

## Setting Up Local Workspace

- Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- Once you are done setting up Git, you will need to fork this repo & work on your forked repo. You can follow the [official docs](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo) to learn how to fork a repo.

- Clone and change directory into the repository

```bash
git clone https://github.com/<your_github_handle>/IRIS-RoR-Bootcamp-2022.git
cd IRIS-RoR-Bootcamp-2022
```

> In Git terminology, a _repository_ is an independent project. _Cloning
> a repository_ is to make a copy of an existing project. Here, we are
> copy the RoR bootcamp exercises.
- Create and checkout to a new branch `week<n>_<your_name>` where
  `n` is the week number.

```bash
git checkout -b week1_abhishek_kumar
```

> A [_branch_](https://www.atlassian.com/git/tutorials/using-branches) represents an independent line of development. Thus,
> working in branches will help seperate your work from other
> participant's work as well as different sessions from each other.
## Submitting Your Changes

If you are working on an session's exercises and the tests pass - you
can submit your work for mentors to review, suggest improvements and
applaud you for a job well done. It's optional but highly recommended.

- Commit your changes.

```bash
git add .
git commit
```

> Commits can be thought of as snapshots or milestones along the
> timeline of a project. Commits capture the state of project at that
> point of time. [Read more](https://www.atlassian.com/git/tutorials/saving-changes/git-commit)
> We are capturing the state to ensure that our changes can be shared with
> other people.
- Push your changes.

```bash
git push --set-upstream origin <branch name>
```

> We can transfer commits from local repository to a remote repository
> using push. This command takes our changes and uploads to the central
> repository, where it can be viewed by other collobarators.
- [Create a pull request on Github](https://opensource.com/article/19/7/create-pull-request-github) 
through https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/pulls

> When you create a pull request, you are _requesting_ another developer
> (i.e. Bootcamp mentors) review your work and integrate with the rest
> of code.
## Conflicts

_Merge conflicts_ are common when collaborating using Git. If you ever come across merge conflicts, follow [this tutorial to _resolve_ them](https://www.atlassian.com/git/tutorials/using-branches/merge-conflicts).
