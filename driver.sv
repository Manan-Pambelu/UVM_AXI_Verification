class AXI_driver extends uvm_driver#(trans);
	`uvm_component_utils(AXI_driver)
	virtual AXI_if vif;

	function new(string name ="AXI_driver", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual AXI_if)::set(this,"","AXI_if",vif))
			`uvm_fatal(get_type_name(),"config failed")
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin
			seq_item_port.get_next_item(req);

			wraddr_channel();
			wrdata_channel();
			wrresp_channel();
			rdaddr_channel();
			rddata_channel();
			
			seq_item_port.item_done(req);
		end
	endtask

	task wraddr_channel();
                        vif.AWADDR <=req.AWADDR;
		        vif.AWPROT <=req.AWPROT;
		        vif.AWVALID<=req.AWVALID;
	endtask

	task wrdata_channel();
                        vif.WDATA <=req.WDATA;
		        vif.WSTRB <=req.WSTRB;
		        vif.WVALID<=req.WVALID;
	endtask

	task wrresp_channel();
		vif.BREADY<=req.BREADY;
	endtask

	task rdaddr_channel();
                        vif.ARADDR<=req.ARADDR;
		        vif.ARPROT<=req.ARPROT;
		        vif.ARVALID<=req.ARVALID;
	endtask

	task rddata_channel();
		vif.RREADY <=req.RREADY;
	endtask

endclass












