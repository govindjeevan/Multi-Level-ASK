
# Data Communications (CO250): Mini-Project
## BINARY AMPLITUDE SHIFT KEYING
### Statement:
Performance analysis of state-of-the-art Digital-to-Analog Conversion techniques using Binary Amplitude Shift Keying (BASK).
 
## Members:
 - Palak Singhal(16CO129)  smarty1palak@gmail.com 
 - Govind Jeevan(16CO221) govindjeevan7@gmail.com 
 - Prasanth Sagar(16CO225) kpsagar1999@gmail.com

## Abstract
With the increasing demand in communication, it has become necessary to give better and efficient service to users by using better technique.
Modulation and Demodulation is a key feature in wireless communication for data transmission.Digital modulation represents the transfer of digital bit stream from the transmitter to the receiver via the analog channels in an easy way. Digital modulation techniques play an efficient role in performing modulation process. Demodulation is the inverse operation of modulation performed to retrieve the original data signal. 
During the modulation the information signal modifies one or more carrier signal parameters leading to shift keying techniques. So it has more importance in modern communication systems.This paper implementation will analyze the performance of Amplitude Shift Keying (ASK).

## Objective
Our first aim would be to to generate and demodulate amplitude shift keyed (ASK) signal using MATLAB.
Later we will discuss its performance in presence of noise specifically speaking Additive White Gaussian Noise (AWGN) with fading and Rayleigh fading d in the channel and evaluate the Bit Error Rate.
The bit error rate (BER), or perhaps more appropriately the bit error ratio, is the number of bits received in error divided by the total number of bits transferred. We can estimate the BER by calculating the probability that a bit will be incorrectly received due to noise.
Ideally, we would like to get the lowest bit error rate while spending the smallest amount of energy for transmitting a bit and have the ability to simultaneously transmit at the highest possible data rate in the given bandwidth.
If time permits we would like to do other types of shift keying like Phase and Frequency and present a comparative study of all the modulating techniques with respect to performance in presence of different kinds of noises in the channel and varying bandwidths.
* Generate and demodulate amplitude shift keyed (ASK) signal using MATLAB.
* Analyzing its performance in presence of noise specifically speaking Additive White Gaussian Noise (AWGN) with fading and Rayleigh fading d in the channel.
* Evaluate the Bit Error Rate.(The bit error rate (BER), or perhaps more appropriately the bit error ratio, is the number of bits received in error divided by the total number of bits transferred.)
* We can estimate the BER by calculating the probability that a bit will be incorrectly received due to noise.(Ideally, we would like to get the lowest bit error rate while spending the smallest amount of energy for transmitting a bit and have the ability to simultaneously transmit at the highest possible data rate in the given bandwidth.)
* Compare BER for Multi Amplitude Shift Keying and Binary Amplitude Shift Keying.
* If time permits we would like to do other types of shift keying like Phase and Frequency and present a comparative study of all the modulating techniques with respect to performance in presence of different kinds of noises in the channel and varying bandwidths.

## RESULTS
### Progress I
**Binary Amplitude Shift Keying for [ 1 0 1 1 0 0 1]**

![enter image description here](https://image.ibb.co/kmKowc/bask.png)


**Performance Analysis of Binary Amplitude Shift Keying**
![enter image description here](https://image.ibb.co/ek3v9x/BASK_Performance.png)
### Progress II
***MULTILEVEL AMPLITUDE SHIFT KEYING***


**`Message Signal =[1 0 1 1 0 0 1 1 0 0 1 1 0 0]`**

***Amplitude of noise introduced: 20***

 **- Amplitude Levels [ 5  10 ]**
 
 ![enter image description here](https://image.ibb.co/mNzAz7/5_10.jpg)

 **- Amplitude Levels [ 5  10  15  20 ]**
 
 ![enter image description here](https://image.ibb.co/jn4omn/5_10_15_20.jpg)

 **- Amplitude Levels [ 5  10  15  20  25  30  35  40  45 ]**
 
 ![enter image description here](https://image.ibb.co/fd94Rn/5_10_15_20_40.jpg)

The Bit Error Rate is reduced to **6.6667%**

## Comparison of Mean Bit Error Across Multi Levels
Mean Bit Error for each Multi Level Shift Keying rate is calculated from all possible message signals uptil a length of 6 bits.


![enter image description here](https://image.ibb.co/iN9M6n/Multilevel_Comparison.jpg)

## Refrence

    http://ieeexplore.ieee.org/document/7888028/

## File Structure
![enter image description here](https://image.ibb.co/eq0j2H/Function_Sequence.png)

