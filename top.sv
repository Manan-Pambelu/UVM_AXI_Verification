`include "interface.sv"
`include "package.svh"


module top();

	import test_pkg::*;
	import uvm_pkg::*;

	bit clk;
	AXI_if vif(clk);

	axi4_lite_slave DUT(
		.ACLK(vif.ACLK),
		.ARESETn(vif.ARESETn),

		.AWADDR(vif.AWADDR),
		.AWPROT(vif.AWPROT),
		.AWVALID(vif.AWVALID),
		.AWREADY(vif.AWREADY),
		
		.WDATA(vif.WDATA),
		.WSTRB(vif.WSTRB),
		.WVALID(vif.WVALID),
		.WREADY(vif.WREADY),
		
		.BRESP(vif.BRESP),
		.BVALID(vif.BVALID),
		.BREADY(vif.BREADY),
		
		.ARADDR(vif.ARADDR),
		.ARPROT(vif.ARPROT),
		.ARVALID(vif.ARVALID),
		.ARREADY(vif.ARREADY),
	
		.RDATA(vif.RDATA),
		.RRESP(vif.RRESP),
		.RVALID(vif.RVALID),
		.RREADY(vif.RREADY)
		);
		

	initial begin
		uvm_config_db#(virtual AXI_if)::set(null, "*", "AXI_if", vif);
		run_test("test_1");
	end

	initial begin
		clk=0;
		forever #5 clk=~clk;
	end

endmodule

