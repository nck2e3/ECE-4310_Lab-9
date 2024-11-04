# Project: RGB LED Color Spectrum Control with ADC and MicroBlaze MCS

This project demonstrates how adjusting a potentiometer controls the color spectrum displayed on an RGB LED using an ADC input and PWM control on a **Nexys A7-100T** FPGA board. This setup uses the **MicroBlaze MCS** and **PoF (Peripherals on FPGA)** system, as presented in Pong P. Chu's book.

## Overview

As the potentiometer is adjusted, the RGB LED (onboard the Nexys A7-100T) gradually transitions through different colors, visually representing the analog input voltage. This is achieved by reading the analog voltage from a potentiometer and mapping that input to different duty cycles for red, green, and blue PWM signals.

### Hardware Configuration

1. **Board**: Nexys A7-100T FPGA
2. **Processor**: MicroBlaze MCS, configured to read from ADC and control PWM signals to the onboard RGB LED.
3. **ADC Channel**: Channel 1, as defined by the PoF system in Pong Chu's book.
4. **Voltage Divider**: A voltage divider is created using a 1kΩ potentiometer and a 2.38kΩ resistor to keep the voltage range within 0 to 1V, which is necessary for this ADC setup.
5. **Power Supply**: The potentiometer is powered from the 3.3V and GND pins on the same PMOD port used by the ADC.

### Voltage Divider Details

The voltage divider ensures the potentiometer output stays within the ADC’s 0 to 1V input range, allowing smooth control over the LED colors without exceeding the ADC’s limits. This setup keeps the input voltage within bounds for a single ADC channel configured for this experiment.

### RGB LED Color Stages

As the input voltage varies, the RGB LED cycles through six distinct stages. Each stage represents a specific color combination, achieved by adjusting the duty cycles of the red, green, and blue channels as follows:

1. **Stage 0 (0 - 0.167V)**:
   - **Red**: Maximum intensity
   - **Green**: Gradually increases from off to maximum
   - **Blue**: Off

2. **Stage 1 (0.167V - 0.334V)**:
   - **Red**: Gradually decreases from maximum to off
   - **Green**: Maximum intensity
   - **Blue**: Off

3. **Stage 2 (0.334V - 0.501V)**:
   - **Red**: Off
   - **Green**: Maximum intensity
   - **Blue**: Gradually increases from off to maximum

4. **Stage 3 (0.501V - 0.668V)**:
   - **Red**: Off
   - **Green**: Gradually decreases from maximum to off
   - **Blue**: Maximum intensity

5. **Stage 4 (0.668V - 0.835V)**:
   - **Red**: Gradually increases from off to maximum
   - **Green**: Off
   - **Blue**: Maximum intensity

6. **Stage 5 (0.835V - 1.0V)**:
   - **Red**: Maximum intensity
   - **Green**: Off
   - **Blue**: Gradually decreases from maximum to off

This configuration allows the RGB LED to smoothly transition across the color spectrum as the potentiometer adjusts the voltage input from 0 to 1V.

### Project Workflow

1. **ADC Reading**: The system reads the analog voltage on ADC Channel 1. This voltage varies between 0 and 1V, based on the potentiometer's position.
2. **Voltage Mapping**: The voltage reading is scaled and mapped to different stages of the color spectrum.
3. **PWM Control**: Duty cycles for the onboard RGB LED are adjusted according to the voltage, smoothly transitioning the LED through colors as the potentiometer is turned.

### Expected Outcome

As the potentiometer is rotated, the RGB LED changes color smoothly, covering the full color spectrum. This project highlights practical use of analog-to-digital conversion, PWM control, and real-time FPGA-based manipulation of onboard LEDs, creating a visually engaging interactive display on the Nexys A7-100T.
