class AXI_sequence extends uvm_sequence#(trans);
	`uvm_object_utils(AXI_sequence)

	function new(strinf name="AXI_sequence");
		super.new(AXI_sequence);
	endfunction

	task body();
		req=trans::type_id::create("req");
		start_item(req);
		assert(req.randomize());
		finish_item(req);
	endtask
endclass

