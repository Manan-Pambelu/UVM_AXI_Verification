class AXI_env extends uvm_env;
	`uvm_component_utils(AXI_env)

	AXI_act_agent act_agent_h;
	AXI_pas_agent pas_agent_h;
	AXI_scoreboard scb_h;

	function new(string name="AXI_env", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		act_agent_h=AXI_act_agent::type_id::create("act_agent_h",this);
		pas_agent_h=AXI_act_agent::type_id::create("act_agent_h",this);

	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		act_agent_h.inp_mon_h.inp_mon_aport.connect(scb_h.inp_fifo_aport);
	endfunction
endclass

