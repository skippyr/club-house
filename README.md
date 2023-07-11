# Club House

The Club House project is a theme for the ZSH shell with Git support.

![](images/preview.png)

> Colors will be different depending of your terminal emulator's theme. The
> theme used is [Flamerial](https://github.com/skippyr/flamerial).

## Features

This theme can show you the following information:

-   If you are root or not.
-   The exit code of the last command if it failed.
-   The name of sourced virtual environments.
-   Your current directory path abbreviated.
-   If inside a Git repository, the name of the branch.

## Installation

This theme has some dependencies that you need to download before installing it.

-   git

    This is the terminal utility used to obtain information about your Git
    repositories.

-   A font patched by the Nerd Fonts project.

    These fonts provides all pretty symbols used in this theme.

After you have installed the dependencies, you need to decide a way to install
the theme, use the one that suits you best.

### Manually

-   Run the following command to install the theme at
    `~/.local/share/zsh/themes/club_house`.

    ```bash
    git clone --depth=1 https://github.com/skippyr/club_house ~/.local/share/zsh/themes/club_house &&
    echo "source \"${HOME}/.local/share/zsh/themes/club_house/club_house.zsh-theme\"" >> ~/.zshrc
    ```

-   Reopen your terminal emulator.

### Within OhMyZSH

-   Install the theme in OhMyZSH custom themes' directory.

    ```bash
    git clone --depth=1 https://github.com/skippyr/club_house ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/club_house
    ```

-   Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
    `~/.zshrc`, to use the theme.

    ```bash
    ZSH_THEME="club_house/club_house"
    ```

-   Reopen your terminal emulator.

## Issues And Suggestions

Report issues and suggestions through the [issues tab](https://github.com/skippyr/club_house/issues).

## License

This project is released under the terms of the MIT license. A copy of the
license is bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.
