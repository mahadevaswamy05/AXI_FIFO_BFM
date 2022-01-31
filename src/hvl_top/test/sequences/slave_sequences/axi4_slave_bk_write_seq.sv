`ifndef AXI4_SLAVE_BK_WRITE_SEQ_INCLUDED_
`define AXI4_SLAVE_BK_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_slave_bk_write_seq
// Extends the axi4_slave_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class axi4_slave_bk_write_seq extends axi4_slave_bk_base_seq;
  `uvm_object_utils(axi4_slave_bk_write_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_slave_bk_write_seq");
  extern task body();
endclass : axi4_slave_bk_write_seq

//--------------------------------------------------------------------------------------------
// Construct: new
// Initializes new memory for the object
//
// Parameters:
//  name - axi4_slave_bk_write_seq
//--------------------------------------------------------------------------------------------
function axi4_slave_bk_write_seq::new(string name = "axi4_slave_bk_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the req of type slave transaction and randomises the req
//--------------------------------------------------------------------------------------------
task axi4_slave_bk_write_seq::body();
  super.body();
  req.transfer_type=BLOCKING_WRITE;
  // MSHA: req.type = this.type;
  //req.axi4_slave_agent_cfg_h = p_sequencer.axi4_slave_agent_cfg_h;
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: BEFORE axi4_slave_bk_write_seq"), UVM_NONE); 

  start_item(req);
  if(!req.randomize)begin
    `uvm_fatal("axi4","Rand failed");
  end
  
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: slave_seq \n%s",req.sprint()), UVM_NONE); 
  finish_item(req);
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: AFTER axi4_slave_bk_write_seq"), UVM_NONE); 

endtask : body

`endif

