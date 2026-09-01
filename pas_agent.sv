class AXI_pas_agent extends uvm_agent;
        `uvm_component_utils(AXI_pas_agent)

        AXI_out_monitor out_mon_h;

        function new(string name="AXI_pas_agent",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                out_mon_h=AXI_out_monitor::type_id::create("out_mon_h",this);

        endfunction
endclass
