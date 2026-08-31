class AXI_test extends uvm_test;
	`uvm_component_utils(AXI_test)
	AXI_env env_h;

	function new(string name="AXI_test", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
                env_h=AXI_env::type_id::create("env_h",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
	endfunction
endclass

//==========================================================================================================================================

class test1 extends AXI_test;
	`uvm_component_utils(test1)
	AXI_sequence basic_seq_h;

	function new(string name="test1", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		
		phase.raise_objection(this);


		basic_seq_h=AXI_sequence::type_id::create("basic_seq_h");
		basic_seq_h.start(env_h.act_agt_h.sqr_h);


		phase.drop_objection(this);
	endtask
endclass

//===================================================================================================================================================







