## Material and Mouse driven theme for [AwesomeWM](https://awesomewm.org/) 

Almost a desktop environment, made with [AwesomeWM](https://awesomewm.org/) following the [Material Design guidelines](https://material.io) with a performant opinionated mouse/keyboard workflow to increase daily productivity and comfort.

[![](./theme/PapyElGringo-theme/demo.gif?raw=true)](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)
*[Click to view in high quality](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)*

| Tiled         | Panel         | Exit screen   |
|:-------------:|:-------------:|:-------------:|
|![](https://i.imgur.com/fELCtep.png)|![](https://i.imgur.com/7IthpQS.png)|![](https://i.imgur.com/rcKOLYQ.png)|



## Installation

### 1) Get all the dependencies
- [AwesomeWM](https://awesomewm.org/) as the window manager
- [Ubuntu](https://fonts.google.com/specimen/Ubuntu) as the **font**
- [Rofi](https://github.com/DaveDavenport/rofi) for the app launcher
- [Picom](https://github.com/tryone144/compton) for the compositor (blur and animations)
- [lxpolkit](https://flameshot.js.org/) for granting root privilege to GUI applications
- (Optional) [Qogir](https://www.gnome-look.org/p/1230631/) as GTK theme
- (Optional) [Breeze Dark](https://github.com/KDE/breeze-icons) as icon theme
- (Optional) [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) to set up the gtk and icon theme
- (Optional) [Flameshot](https://flameshot.js.org/) for screenshots

### 2) Clone the configuration

```
git clone https://github.com/RaphGL/material-awesome.git ~/.config/awesome
```

### 3) Set the themes
Start **lxappearance** to activate the **icon** and **GTK** themes

### 4) Read the documentation
The documentation lives within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additional information about them.

* [Configuration](./configuration) is about all the **settings** available
* [Layout](./layout) has the **layout** of all the widgets
* [Module](./module) contains all of the **features** available
* [Theme](./theme) has all of the **aesthetics**
* [Widget](./widget) contains all of the **widgets** available
