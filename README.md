# Bus-Synchronizer for CDC Problems
The Bus Synchronizer is a specialized circuit designed to safely transfer multi-bit data (a bus) between two asynchronous clock domains. Unlike single-bit synchronizers, which can only safely transfer control signals, bus synchronizers handle entire data words while minimizing the risk of metastability and data corruption.

# Features:
Safe transfer of multi-bit data between different clock domains

Implements double or triple-flop synchronization for control signals

Uses handshake or valid/ready signaling to ensure data stability during transfer

Designed to prevent metastability and timing violations

# How it works:
The source domain captures and holds the data until it is safely transferred.

A valid or request signal is synchronized and sent to the destination domain.

The destination domain samples the data once it is stable and asserts an acknowledge or ready signal.

Optional double-register buffering in the destination clock domain ensures metastability protection.

This type of synchronizer is commonly used in SoCs, FPGAs, and systems where different modules operate on independent clocks but need to exchange data reliably.

# How to Run
1. Clone the repository
2. Open Vivado and load the project
3. Run the design flow:
      Synthesize the design.
      Implement the design.
      Generate the bitstream.
4. Simulation:
       use the Questasim to run simulation easily.

## Contact Me!
- **Email:** shehabeldeen2004@gmail.com
- **LinkedIn:** (https://www.linkedin.com/in/shehabeldeen22)
- **GitHub:** (https://github.com/shehab-25)
