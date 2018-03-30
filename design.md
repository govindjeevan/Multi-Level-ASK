# BINARY AMPLITUDE SHIFT KEYING
##  IMPLEMENTATION DESIGN

In MATLAB Simulation of Amplitude Shift Keying (ASK), the user is asked about the frequency of the carrier wave, binary or multilevel message periodic pulse & the amplitude of the waves (considering both square message wave & carrier wave have equal amplitude).

The MATLAB code lets the user to plot 3 graphs, namely of The Carrier Wave (Sinusoid), The Binary or Multilevel Message Pulse & The Amplitude Shift Keyed Wave.

  
![](https://lh5.googleusercontent.com/_m73EN48Peswided_abCGbH4Nv-AxdC1tPpxpDoRzWMjjafpaHRF6ehWGbdYLJPoVHKAga54u4e13XhHFHHLTMIDwbD4nzt9Rh9EkzzXfpLEOJDuec0W2rXXcek1LDZ65kbFr1Mg)

 ASK system can be divided into three blocks. The first one represents the transmitter, the second one is a linear model of the effects of the channel, the third one shows the structure of the receiver. The following notation is used:

-   ht(f) is the carrier signal for the transmission
    
-   hc(f) is the impulse response of the channel
    
-   n(t) is the noise introduced by the channel
    
-   hr(f) is the filter at the receiver
    
-   L is the number of levels that are used for transmission
    
-   Ts is the time between the generation of two symbols
    

The probability density function of having an error of a given size can be modelled by a Gaussian function; the mean value will be the relative sent value, and its variance will be given by:

![](https://lh4.googleusercontent.com/rb3qhW1bbGrs0nl-5glGjVMa7UYEZiiEPXKmO86Dhm_ZFkWDp-TYyd2_P7akXGD_Orn7-wpYKl7_fFt6_lYt6QvpEuFV6vKLyzVO0-aPBEJrtGXxTvjypglh9L6pEAKn4xOvBRxo)

![](https://lh5.googleusercontent.com/maYr4zPQeN2VbHUbgESBp9ZOUTlFUy7WDw9YHZQvxPFG30iATR89GQsQYRze9hEU7NJt8-N35LJWGc4GjgzZhTROECwsIqdLCWU-UEYqp9SXeGNi4Ncertjln_D4f9l5zG_db22u) is the spectral density of the noise within the band and Hr (f) is the continuous Fourier transform of the impulse response of the filter hr (f).

Along with implementing the algorithm in MATLAB and analysing it’s performance, We will try and implement the BASK or MASK circuit in a simulation tool such as proteus or Logisim.

Amplitude Shift Keying modulation and demodulation processes are relatively inexpensive and easy to implement. The main disadvantage of ASK is that it is sensitive to atmospheric noise, distortions and propagation conditions. Here is the practical circuit diagram of amplitude shift keying modulator using CD4016 IC. CD4016 is a switching IC with four embedded switches

  

### Circuit Diagram

![](https://lh4.googleusercontent.com/lG4sIVwQ1aX3zLgkVcVLbid1pM5Fr4Jv9nyBnMPmRIlpIumLqB0wvg2-9KY6IDkBslu4ifkg6Us-geNWB6oWrNQ7_lq9m6ko5YaxRnBwJVcQN1Gdln_UvpFEZKIN2Tg8W8oIAtYi)

###  Components Required

    1.  CD4016 IC
        
    2.  NOT gate 7404

