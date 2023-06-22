pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/gates.circom";

/* Circuit that proves the inputs A (0) & B (1) yields a 0 output.*/

template zkEVMcircuit () {
    // Inputs
    signal input a;
    signal input b;
    
    // Internal signals
    signal x;
    signal y;

    // Output
    signal output q;

    // Components
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // Wiring the components
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    notGate.in <== b;
    y <== notGate.out;

    orGate.a <== x;
    orGate.b <== y;
    q <== orGate.out;

    // Logging the output
    log("Output q", q);
}

// Instantiating the circuit
component main = zkEVMcircuit();