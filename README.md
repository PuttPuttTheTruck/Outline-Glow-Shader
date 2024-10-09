# A highly customisable, glow outline shader for Gamemaker, written in GLSL.

![puffin2](https://github.com/user-attachments/assets/a6e1b900-69d7-400b-bfc9-9f2ad60706db)


## Install Instructions:

1. Go to the releases tab and download the latest Gamemaker package.
2. Add the Gamemaker package to your project. (THE SHADER & SCRIPT ARE NECESSARY)


## Usage Instructions:

1. On any sprite you plan to use your shader on, you must go to the sprite, expand the texture settings option, and tick "Seperate Texture Page". 
2. When you want to use the shader, first call "scr_initialise_outline_shader".
   The first two parameters are required, the rest are optional for tweaking the effect depending on your sprite.
3. Next draw your sprite.
4. After all drawing is done, be sure to call "shader_reset()".
