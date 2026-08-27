class AXI_inp_monitor extends uvm_monitor#(trans);

	`uvm_component_utils(AXI_inp_monitor)

	virtual AXI_if vif;
	uvm_analysis_port #(trans) inp_mon_aport;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(virtual AXI_if)::get(this,"","AXI_if",vif))
			`uvm_fatal(get_type_name(),"configuration failed")
		inp_mon_aport=new("inp_mon_aport",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin
			@(posedge vif.inp_monitor_cb)
			tx=trans::type_id::create("tx");

                        
                        tx.AWADDR <=vif.AWADDR;
                        tx.AWPROT <=vif.AWPROT;
                        tx.AWVALID<=vif.AWVALID;

                        tx.WDATA <=vif.WDATA;
                        tx.WSTRB <=vif.WSTRB;
                        tx.WVALID<=vif.WVALID;

                        tx.BREADY<=vif.BREADY;

                        tx.ARADDR<=vif.ARADDR;
                        tx.ARPROT<=vif.ARPROT;
                        tx.ARVALID<=vif.ARVALID;

                        tx.RREADY <=vif.RREADY;
			
			inp_mon_aport.write(tx);
		end
	endtask
endclass




