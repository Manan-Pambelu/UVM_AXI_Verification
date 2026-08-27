class AXI_out_monitor extends uvm_monitor;
	`uvm_component_utils(AXI_out_monitor)

	virtual AXI_if vif;
	uvm_analysis_port #(trans) out_mon_aport;

	function new(string name="AXI_out_monitor", uvm_component parent);
		super.new(name,parent);
		out_mon_aport=new("out_mon_aport",this);
	endfunction

	function build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual AXI_if)::get(this,"","AXI_if",vif))
			`uvm_fatal(get_full_name(),"configuration failed")
		out_mon_aport.new("out_monitor_aport",this);
	endfunction

	task run_phase(uvm_pahse phase);
		super.run_phase(phase);







