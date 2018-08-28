# Fishing for Compliments

A game written in Processing with a custom, Arduino based controller

![screencapture](screencap.gif)

## About the game

In Fishing for Compliments you try to catch the fish in the pond with your fishing rod. Once you get them they'll leave an encouraging message for you.

The world can be mean, but fish can be nice.

Use the joystick to move the rod left and right. Move the water level sensor (like a real life fishing rod) up and down in water to sink or pull up.

## Technical things

### Processing

The folder `fishing_for_compliments` contains the Processing sketch.

To run it yourself, [download Processing](https://processing.org/download/) open the sketch and run it.

If you don't want or can't use the custom controller, you can set the [`controller` flag](https://github.com/lislis/fishing_for_compliments/blob/master/fishing_for_compliments/fishing_for_compliments.pde#L11) to false and play it with the arrow keys on your keyboard.

### Arduino controller

The folder `arduino_controller` contains the Arduino sketch.

To flash it onto your own device (first get your own device), [download the Arudino IDE](https://www.arduino.cc/en/Main/Software) open the sketch and flash it.

The controller is build around an Arduino Uno (or compatible board I guess), a joystick and a water level sensor.
I annotated which pins I used [in the code](https://github.com/lislis/fishing_for_compliments/blob/master/arduino_controller/arduino_controller.ino).

## Troubleshooting

This setup is very error prone (sadly). Here are some tips to help you figure out what might be wrong. I will not give any further support for this, because it works on my machine :tm:.

- check all the pins :)

- close the Arduino IDE before running the Processing sketch, otherwise the Serial port is blocked

- check if you have permissions on the Serial port, maybe `sudo chmod 666 /dev/ttyACM0` can help


## Credits

Open assets are awesome! Big thanks to the fine folk who contribute their works to the commons.

### Graphics

- [2D retro fish](https://opengameart.org/content/2d-retro-fish) by [EXCITESZZ](https://opengameart.org/users/exciteszz) under [CC0](https://creativecommons.org/publicdomain/zero/1.0/)

### Sounds

- [lake boadella waves](https://freesound.org/people/eguaus/sounds/321722/) by [eguaus](https://freesound.org/people/eguaus/) under [CC0](https://creativecommons.org/publicdomain/zero/1.0/)

- [New York Jazz Loop](https://freesound.org/people/FoolBoyMedia/sounds/347848/) by [FoolBoyMedia](https://freesound.org/people/FoolBoyMedia/) under [CC BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/)

- [blip1](https://freesound.org/people/nsstudios/sounds/321103/) by [nsstudios](https://freesound.org/people/nsstudios/) under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/)

- [Small boom](https://freesound.org/people/ProjectsU012/sounds/341626/) by [ProjectsU012](https://freesound.org/people/ProjectsU012/) under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/)

- [Horn Stabs Entrance](https://freesound.org/people/benjaminharveydesign/sounds/350433/) by [benjaminharveydesign](https://freesound.org/people/benjaminharveydesign/) under [CC0](https://creativecommons.org/publicdomain/zero/1.0/)
