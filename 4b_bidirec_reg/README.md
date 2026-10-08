In this minor project we have succesfully implemented a bidirectional shift 4-bit register with multiple control inputs via a 4-1 multiplexer setup. We have used a simple edge triggered d-ff as the memory element for our register. The control setup for our register is as folowing -:
ctrl(0,0) - Load
ctrl(0,1) - Left Shift
ctrl(1,0) - Right Shift
ctrl(1,1) - Hold

P.S. -
The main hurdle i faced was remembering the connections for shifting in through the mux so make the circuit diagram first and make it clean, also remember to take the msb d-ff in the front of your schematic otherwise you will cross your shift control operation.