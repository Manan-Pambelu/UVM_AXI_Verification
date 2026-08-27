class AXI_act_agent extends uvm_agent;
	`uvm_component_utils(AXI_act_agent)

	AXI_sequencer seqr_h;
	AXI_driver drv_h;
	AXI_inp_monitor inp_mon_h;

	function new(string name="AXI_act_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		seqr_h=AXI_sequencer::type_id::create("seqr_h",this);
		drv_h=AXI_driver::type_id::create("drv_h",this);
		inp_mon_h=AXI_inp_monitor::type_id::create("inp_mon_h",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		drv_h.seq_item_port.connect(seqr_h.seq_item_export);
	endfunction
endclass


		



