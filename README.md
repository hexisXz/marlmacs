# what is marlmacs
marlmacs is a simple and easy to use emacs config.

![marlmacs2](https://github.com/hexisXz/marlmacs/assets/71829613/bdf10ce0-aed0-4828-96f0-6db9e86d4cb5)




# marlmacs in action



https://github.com/hexisXz/marlmacs/assets/71829613/ae28ba22-39a1-4d99-a8fe-c9d4831e7282




# keybinds
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
```


# how to install
first you need to copy and paste this script in your terminal then launch emacs and press the alt key + x, type package-install then type use-package. after thats done relaunch emacs and marlmacs should work. 


``` sh
sh <(curl -v -L https://raw.githubusercontent.com/hexisXz/marlmacs/main/install)
```
