// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Wed May 24 08:56:30 2017
// Host        : PC-201602280044 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               f:/test/project_1/project_1.srcs/sources_1/ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0_stub.v
// Design      : ahblite_axi_bridge_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ahblite_axi_bridge,Vivado 2017.1" *)
module ahblite_axi_bridge_0(s_ahb_hclk, s_ahb_hresetn, s_ahb_hsel, 
  s_ahb_haddr, s_ahb_hprot, s_ahb_htrans, s_ahb_hsize, s_ahb_hwrite, s_ahb_hburst, 
  s_ahb_hwdata, s_ahb_hready_out, s_ahb_hready_in, s_ahb_hrdata, s_ahb_hresp, m_axi_awid, 
  m_axi_awlen, m_axi_awsize, m_axi_awburst, m_axi_awcache, m_axi_awaddr, m_axi_awprot, 
  m_axi_awvalid, m_axi_awready, m_axi_awlock, m_axi_wdata, m_axi_wstrb, m_axi_wlast, 
  m_axi_wvalid, m_axi_wready, m_axi_bid, m_axi_bresp, m_axi_bvalid, m_axi_bready, m_axi_arid, 
  m_axi_arlen, m_axi_arsize, m_axi_arburst, m_axi_arprot, m_axi_arcache, m_axi_arvalid, 
  m_axi_araddr, m_axi_arlock, m_axi_arready, m_axi_rid, m_axi_rdata, m_axi_rresp, m_axi_rvalid, 
  m_axi_rlast, m_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="s_ahb_hclk,s_ahb_hresetn,s_ahb_hsel,s_ahb_haddr[31:0],s_ahb_hprot[3:0],s_ahb_htrans[1:0],s_ahb_hsize[2:0],s_ahb_hwrite,s_ahb_hburst[2:0],s_ahb_hwdata[31:0],s_ahb_hready_out,s_ahb_hready_in,s_ahb_hrdata[31:0],s_ahb_hresp,m_axi_awid[3:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awcache[3:0],m_axi_awaddr[31:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_awlock,m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wlast,m_axi_wvalid,m_axi_wready,m_axi_bid[3:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,m_axi_arid[3:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arprot[2:0],m_axi_arcache[3:0],m_axi_arvalid,m_axi_araddr[31:0],m_axi_arlock,m_axi_arready,m_axi_rid[3:0],m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rvalid,m_axi_rlast,m_axi_rready" */;
  input s_ahb_hclk;
  input s_ahb_hresetn;
  input s_ahb_hsel;
  input [31:0]s_ahb_haddr;
  input [3:0]s_ahb_hprot;
  input [1:0]s_ahb_htrans;
  input [2:0]s_ahb_hsize;
  input s_ahb_hwrite;
  input [2:0]s_ahb_hburst;
  input [31:0]s_ahb_hwdata;
  output s_ahb_hready_out;
  input s_ahb_hready_in;
  output [31:0]s_ahb_hrdata;
  output s_ahb_hresp;
  output [3:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [31:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  output m_axi_awvalid;
  input m_axi_awready;
  output m_axi_awlock;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [3:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [3:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arcache;
  output m_axi_arvalid;
  output [31:0]m_axi_araddr;
  output m_axi_arlock;
  input m_axi_arready;
  input [3:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  input m_axi_rlast;
  output m_axi_rready;
endmodule