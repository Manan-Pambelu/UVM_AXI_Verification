interface axi_if(input ACLK);

logic ACLK;
logic ARESETn;

//write address channel
logic  [ADDR_WIDTH-1:0] AWADDR;
logic  [2:0] AWPROT;
logic  AWVALID;
logic  AWREADY;

//write data channel
logic  [DATA_WIDTH-1:0] WDATA;
logic  [(DATA_WIDTH/8)-1:0] WSTRB;
logic  WVALID;
logic  WREADY;

//write response channel
logic  [1:0] BRESP;
logic  BVALID;
logic  BREADY;

//read address channel
logic  [ADDR_WIDTH-1:0] ARADDR;
logic  [2:0] ARPROT;
logic  ARVALID;
logic  ARREADY;

//read data channel
logic  [DATA_WIDTH-1:0] RDATA;
logic  [1:0] RRESP;
logic  RVALID;
logic  RREADY;

clocking driver_cb @(posedge ACLK);

default input #0 output #0;

	output ARESETn;
	output AWADDR;
	output AWPROT;
	output AWVALID;
	
	output WDATA;
	output WSTRB;
	output WVALID;
	
	output BREADY;

	output ARADDR;
	output ARPROT;
	output ARVALID;

	output RREADY;
endclocking 

clocking inp_monitor_cb @(posedge ACLK);

default input #0 output #0;

	        input ARESETn;
	        input AWADDR;
	        input AWPROT;
	        input AWVALID;

	        input WDATA;
	        input WSTRB;
	        input WVALID;

	        input BREADY;

	        input ARADDR;
	        input ARPROT;
	        input ARVALID;

	        input RREADY;
endclocking


clocking out_monitor_cb @(posedge ACLK);

default input #0 output #0;

	input AWREADY;
	input WREADY;
	input BRESP;
	input BVALID;
	input ARREADY;
	input RDATA;
	input RRESP;
	input RVALID;
endclocking 

modport DRIVER(clocking driver_cb);
modport INP_MONITOR(clocking inp_monitor_cb);
modport OUT_MONITOR(clocking out_monitor_cb);

endinterface

	







