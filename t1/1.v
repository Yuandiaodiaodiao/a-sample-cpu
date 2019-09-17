module my74181(C0,C1,C2,C3,C4,C5,C6,C7,C8,G0,G1,G2,G3,G4,G5,G6,G7,P0,P1,P2,P3,P4,P5,P6,P7);
	input C0,G0,G1,G2,G3,G4,G5,G6,G7,P0,P1,P2,P3,P4,P5,P6,P7;
	output C1,C2,C3,C4,C5,C6,C7,C8;
	assign C1 = G0|(P0&C0);
	assign C2 = G1|((P1&G0)|(P1&P0&C0));
	assign C3 = G2|((P2&G1)|(P2&P1&G0)|(P2&P1&P0&C0));
	assign C4 = G3|((P3&G2)|(P3&P2&G1)|(P3&P2&P1&G0)|(P3&P2&P1&P0&C0));
	assign C5 = G4|((P4&G3)|(P4&P3&G2)|(P4&P3&P2&G1)|(P4&P3&P2&P1&G0)|(P4&P3&P2&P1&P0&C0));
	assign C6 = G5|((P5&G4)|(P5&P4&G3)|(P5&P4&P3&G2)|(P5&P4&P3&P2&G1)|(P5&P4&P3&P2&P1&G0)|(P5&P4&P3&P2&P1&P0&C0));
	assign C7 = G6|((P6&G5)|(P6&P5&G4)|(P6&P5&P4&G3)|(P6&P5&P4&P3&G2)|(P6&P5&P4&P3&P2&G1)|(P6&P5&P4&P3&P2&P1&G0)|(P6&P5&P4&P3&P2&P1&P0&C0));
	assign C8 = G7|((P7&G6)|(P7&P6&G5)|(P7&P6&P5&G4)|(P7&P6&P5&P4&G3)|(P7&P6&P5&P4&P3&G2)|(P7&P6&P5&P4&P3&P2&G1)|(P7&P6&P5&P4&P3&P2&P1&G0)|(P7&P6&P5&P4&P3&P2&P1&P0&C0));
endmodule
