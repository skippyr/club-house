# House Club

## Starting Point

The House Club project is a theme for the ZSH shell with Git support.

![](images/preview.png)

> Colors will be different depending of your terminal emulator's theme. The
> theme used is [Flamerial](https://github.com/skippyr/flamerial).

## Features

This theme can show you the following information:

-   The name of sourced virtual environments.
-   Your current directory path abbreviated.
-   If inside a Git repository, the name of the branch.

## Dependencies

This theme has some dependencies that you need to download before installing it.

-   git

    This is the terminal utility used to obtain information about your Git
    repositories.

-   A font patched by the Nerd Fonts project.

    These fonts provides all pretty symbols used in this theme.

## Installation

You can install this theme in multiple ways, use the one that suits you best.

### Manually

-   Run the following command to install the theme at
    `~/.local/share/zsh/themes/house_club`.

    ```bash
    git clone --depth=1 https://github.com/skippyr/house_club ~/.local/share/zsh/themes/house_club &&
    echo "source \"${HOME}/.local/share/zsh/themes/house_club/house_club.zsh-theme\"" >> ~/.zshrc
    ```

-   Reopen your terminal emulator.

### Within OhMyZSH

-   Install the theme in OhMyZSH custom themes' directory.

    ```bash
    git clone --depth=1 https://github.com/skippyr/house_club ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/house_club
    ```

-   Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
    `~/.zshrc`, to use the theme.

    ```bash
    ZSH_THEME="house_club/house_club"
    ```

-   Reopen your terminal emulator.

## Issues And Contributions

Learn how to report issues and contribute to this project by reading its
[contributions guidelines](https://skippyr.github.io/materials/pages/contributions_guidelines.html).

## License

This project is released under the terms of the MIT license. A copy of the
license is bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.
