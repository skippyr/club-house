# Club House
## About
A theme for the ZSH shell that is decorated by a cards club symbol. 
![](preview.png)

It can show you:
-	If you are the root user or a normal user.
-	Your current directory abbreviating parent directories.
-	If inside a Git repository, the branch.

## Installation
### Dependencies
-	git
-	A Nerd Font's font.

### Procedures
-	Clone this repository.
```bash
git\
   clone --depth=1 https://github.com/skippyr/club-house\
   ~/.local/share/zsh/themes/club-house
```

-	Add the following source rule to your `~/.zshrc` file. Ensure to not source other theme.

```bash
source ~/.local/share/zsh/themes/club-house/club-house.zsh-theme
```

-	Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
