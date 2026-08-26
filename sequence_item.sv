class trans extends uvm_sequence_item;
 
rand bit  [ADDR_WIDTH-1:0] AWADDR;
rand bit  [2:0] AWPROT;
rand bit  AWVALID;
bit  AWREADY;

rand bit  [DATA_WIDTH-1:0] WDATA;
rand bit  [(DATA_WIDTH/8)-1:0] WSTRB;
rand bit WVALID;
bit  WREADY;

bit  [1:0] BRESP;
bit  BVALID;
rand bit  BREADY;

rand bit  [ADDR_WIDTH-1:0] ARADDR;
rand bit  [2:0] ARPROT;
rand bit ARVALID;
bit  ARREADY;

bit  [DATA_WIDTH-1:0] RDATA;
bit  [1:0] RRESP;
bit  RVALID;
rand bit  RREADY;

function new(string name="trans");
	super.new(name);
endfunction

`uvm_object_utils_begin(trans)
		`uvm_field_int(AWADDR,UVM_HEX | UVM_ALL_ON)
		`uvm_field_int(AWPROT,UVM_HEX | UVM_ALL_ON)
		`uvm_field_int(AWVALID,UVM_HEX | UVM_ALL_ON)
		`uvm_field_int(WDATA,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(WSTRB,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(WVALID,UVM_HEX | UVM_ALL_ON)
		`uvm_field_int(BREADY,UVM_HEX | UVM_ALL_ON)
		`uvm_field_int(ARADDR,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(ARPROT,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(ARVALID,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(RREADY,UVM_BIN | UVM_ALL_ON)

		`uvm_field_int(AWREADY,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(WREADY,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(BRESP,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(BVALID,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(ARREADY,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(RDATA,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(RRESP,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(RVALID,UVM_BIN | UVM_ALL_ON)
`uvm_object_utils_end
endclass



