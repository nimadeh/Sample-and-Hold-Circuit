# Sample-and-Hold-Circuit (Linear S/H)
first- Design of a Linear 15-bit Mid-Rise quantizer with a sampling frequency of 100 MHz.
______________
![2022-10-23_17-05-40](https://user-images.githubusercontent.com/115939486/197395446-39d362e4-1441-4e08-9e0c-2bf433221c60.png)
___
By applying a sinusoidal signal with a frequency of 5.49621582 MHz (fin) and amplitude of 1 V (A = 1), the quantization wave in the time domain, the quantization noise power spectrum and the output power spectrum of the A / D converter are plotted, and finally the parameters SFDR, SNDR, SNR, SNR. ENOB is calculated. This process is done in MATLAB software.
_______
Output Results:
___________
![2022-10-23_17-01-53](https://user-images.githubusercontent.com/115939486/197398544-907ddfe2-9ab4-48c0-aae0-e93c0a8f584d.png)
_____
Output Waves When Amplitude of Input Sinusoidal is 1V (A = 1)
____
![Quantized Wave](https://user-images.githubusercontent.com/115939486/197396026-f68f45bf-3936-41f2-a937-19ea0ce05c94.jpg)
_______
![Quantization specturm](https://user-images.githubusercontent.com/115939486/197396743-49929599-11ff-4122-bb5b-3bda95592b58.jpg)
____
![untitled](https://user-images.githubusercontent.com/115939486/197396704-d89351a8-66b8-4f3c-9e30-bc629d4c679c.jpg)
_________
Output Waves When Amplitude of Input Sinusoidal is 0.1V (A = 0.1)
_____
![untitled3](https://user-images.githubusercontent.com/115939486/197397044-7239fd4d-ebd3-4f3f-94cb-bd36b8584fc3.jpg)
________
![4](https://user-images.githubusercontent.com/115939486/197397046-73d85d66-1feb-4774-9514-a4cc3097ee4b.jpg)
________
![6](https://user-images.githubusercontent.com/115939486/197397048-6bb75800-b574-47ab-9a76-8c60378d6ad9.jpg)
________
second - if we nonlinearize the 15-bit Mid-Rise quantifier S / H circuit, the simulation result of the circuit is equal to below:
_____
Output Specturm Wave When Amplitude of Input Sinusoidal is 1V (A = 1) and the S / H circuit is NonLinear :
_______
![10](https://user-images.githubusercontent.com/115939486/197399460-be3588c4-bd6a-44c4-a95f-97c54e783bef.jpg)
_____
Output Specturm Wave When Amplitude of Input Sinusoidal is 0.1V (A = 0.1) and the S / H circuit is NonLinear :
____
![11](https://user-images.githubusercontent.com/115939486/197399488-6cb52290-9b85-40b6-b151-0050b94a7a28.jpg)
_____

