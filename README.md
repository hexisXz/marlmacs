<div align="center">
  
  ![marlmacs23](https://github.com/hexisXz/marlmacs/assets/71829613/d9a808c4-e0b8-4aa0-9848-28083ced56fc)

  
  # what is marlmacs
  marlmacs is a simple and easy to use emacs config.
  
  ![marlmacs2](https://github.com/hexisXz/marlmacs/assets/71829613/bdf10ce0-aed0-4828-96f0-6db9e86d4cb5)
  
  
  
  # marlmacs in action
  
  https://github.com/hexisXz/marlmacs/assets/71829613/ae28ba22-39a1-4d99-a8fe-c9d4831e7282
  
  # keybinds

</div>

  ```
M-f to open the file manager

M-b to switch buffers

M-ENTER to split windows

M-SHIFT-C to close split windows

M-s to open a window below

M-w to open the emacs browser

M-o to run org tangle in a org doc

M-l to reload marlmacs (note: this bind conflicts with the vim binds so you have to switch to the *dastboard* buffer to reload emacs)  

M-N to open a scratchpad

M-K to kill a buffer

M-t to open the term
```

<div align="center">


# dont edit the init.el
</div>

You can edit the init.el but the keybinds, packages, startpage and themes aren't in the init.el.
if you want to install new packages or change the theme and startpage you need to change into the ~/.config/marlmacs/config dir and you will find all of the files to edit and configure marlmacs.

<div align="center">

# how to install
</div>

on some distros you might need to copy and paste this script in your terminal then launch emacs and press the alt key + x, type package-install then type use-package. after thats done relaunch emacs and marlmacs should work. 


but on a lot of distros like ubuntu void linux and arch just copying this in your terminal should install the whole thing.

<div align="center">

``` sh
sh <(curl -v -L https://raw.githubusercontent.com/hexisXz/marlmacs/main/install)
```

</div>
