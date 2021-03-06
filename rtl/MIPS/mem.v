`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/06 15:19:50
// Design Name: 
// Module Name: mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "defines.h"

module mem(
	input wire rst,
	//from execution
	input wire[`RegAddrBus] wd_i,
	input wire wreg_i,
	input wire[`RegBus] wdata_i,
	input wire[`RegBus] hi_i,
	input wire[`RegBus] lo_i,
	input wire whilo_i,
	input wire[`AluOpBus] aluop_i,
	input wire[`RegBus] mem_addr_i,
	input wire[`RegBus] reg2_i,
	input wire cp0_reg_we_i,
	input wire[4:0] cp0_reg_write_addr_i,
	input wire[`RegBus] cp0_reg_data_i,
	input wire[`RegBus] excepttype_i,
	input wire is_in_delayslot_i,
	input wire[`RegBus] current_inst_address_i,
	//from cp0
	input wire[`RegBus] cp0_status_i,
	input wire[`RegBus] cp0_cause_i,
	input wire[`RegBus] cp0_epc_i,
	//for data correlation
	input wire wb_cp0_reg_we,
	input wire[4:0] wb_cp0_reg_write_addr,
	input wire[`RegBus] wb_cp0_reg_data,
	//from ram
	input wire[`RegBus] mem_data_i,
	//mem result
	output reg[`RegBus] bad_addr_o,
	output reg[`RegAddrBus] wd_o,
	output reg wreg_o,
	output reg[`RegBus] wdata_o,
	output reg[`RegBus] hi_o,
	output reg[`RegBus] lo_o,
	output reg whilo_o,
	output reg[`RegBus] mem_addr_o,
	output wire mem_we_o,
	output reg[3:0] mem_sel_o,
	output reg[`RegBus] mem_data_o,
	output reg mem_ce_o,
	output reg cp0_reg_we_o,
	output reg[4:0] cp0_reg_write_addr_o,
	output reg[`RegBus] cp0_reg_data_o,
	output reg[`RegBus] excepttype_o,
	output wire[`RegBus] cp0_epc_o,
	output wire is_in_delayslot_o,
	output wire[`RegBus] current_inst_address_o,
	// LLBit
	input wire LLbit_i,
	input wire wb_LLbit_we_i,
	input wire wb_LLbit_value_i,
	output reg LLbit_we_o,
	output reg LLbit_value_o
    );
	
	wire[`RegBus] zero32;
	reg mem_we;
	assign mem_we_o = mem_we & (~(|excepttype_o));
	assign zero32 = `ZeroWord;
	assign is_in_delayslot_o = is_in_delayslot_i;
	assign current_inst_address_o = current_inst_address_i;

	reg LLbit;
	reg[`RegBus] cp0_status;
	reg[`RegBus] cp0_cause;
	reg[`RegBus] cp0_epc;
	reg excepttype_is_adel;
	reg excepttype_is_ades;


	//get cp0 status
	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			cp0_status <= `ZeroWord;
		end else if((wb_cp0_reg_we == `WriteEnable) && (wb_cp0_reg_write_addr == `CP0_REG_STATUS)) begin
			/* code */
			cp0_status <= wb_cp0_reg_data;
		end else begin 
			cp0_status <= cp0_status_i;
		end
	
	end
	//get cp0 epc
	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			cp0_epc <= `ZeroWord;
		end else if((wb_cp0_reg_we == `WriteEnable) && (wb_cp0_reg_write_addr == `CP0_REG_EPC)) begin
			/* code */
			cp0_epc <= wb_cp0_reg_data;
		end else begin 
			cp0_epc <= cp0_epc_i;
		end
	
	end
	assign cp0_epc_o = cp0_epc;
	//get cp0 cause
	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			cp0_cause <= `ZeroWord;
		end else if((wb_cp0_reg_we == `WriteEnable) && (wb_cp0_reg_write_addr == `CP0_REG_CAUSE)) begin
			/* code */
			cp0_cause[9:8] <= wb_cp0_reg_data[9:8];
			cp0_cause[22] <= wb_cp0_reg_data[22];
			cp0_cause[23] <= wb_cp0_reg_data[23];
		end else begin 
			cp0_cause <= cp0_cause_i;
		end
	
	end
	//get exception
	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			excepttype_o <= `ZeroWord;
		end else begin 
			excepttype_o <= `ZeroWord;
			if(current_inst_address_i != `ZeroWord) begin
				/* code */
				if(((cp0_cause[15:8] & cp0_status[15:8]) != 8'h00) &&
				 	(cp0_status[1] == 1'b0) && (cp0_status[0] == 1'b1)) begin
					/* code */
					excepttype_o <= 32'h00000001;
				end else if(excepttype_i[8] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h00000008;
				end else if(excepttype_i[9] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h00000009;
				end else if(excepttype_i[10] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h0000000a;
				end else if(excepttype_i[11] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h0000000d;
				end else if(excepttype_i[12] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h0000000c;
				end else if(excepttype_i[13] == 1'b1) begin
					/* code */
					excepttype_o <= 32'h0000000e;
				end else if(excepttype_is_adel) begin
					/* code */
					excepttype_o <= 32'h00000004;
				end else if(excepttype_is_ades) begin
					/* code */
					excepttype_o <= 32'h00000005;
				end
			end
		end
	
	end
	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			LLbit <= 1'b0;
		end else begin 
			if(wb_LLbit_we_i == 1'b1) begin 
				LLbit <= wb_LLbit_value_i;
			end else begin 
				LLbit <= LLbit_i;
			end
		end
	
	end

	always @(*) begin
		if(rst == `RstEnable) begin
			/* code */
			wd_o <= `NOPRegAddr;
			wreg_o <= `WriteDisable;
			wdata_o <= `ZeroWord;
			hi_o <= `ZeroWord;
			lo_o <= `ZeroWord;
			whilo_o <= `WriteDisable;
			mem_addr_o <= `ZeroWord;
			mem_we <= `WriteDisable;
			mem_sel_o <= 4'b0000;
			mem_data_o <= `ZeroWord;
			mem_ce_o <= `ChipDisable;
			LLbit_we_o <= 1'b0;
			LLbit_value_o <= 1'b0;
			cp0_reg_we_o <=`WriteDisable;
			cp0_reg_write_addr_o <= 5'b00000;
			cp0_reg_data_o <= `ZeroWord;
			excepttype_is_adel <= 1'b0;
			excepttype_is_ades <= 1'b0;
			bad_addr_o <= `ZeroWord;
		end else begin 
			wd_o <= wd_i;
			wreg_o <= wreg_i;
			wdata_o <= wdata_i;
			hi_o <= hi_i;
			lo_o <= lo_i;
			whilo_o <= whilo_i;
			LLbit_we_o <= 1'b0;
			LLbit_value_o <= 1'b0;
			mem_we <= `WriteDisable;
			mem_sel_o <= 4'b1111;
			mem_ce_o <= `ChipDisable;
			cp0_reg_we_o <=cp0_reg_we_i;
			cp0_reg_write_addr_o <= cp0_reg_write_addr_i;
			cp0_reg_data_o <= cp0_reg_data_i;
			excepttype_is_adel <= current_inst_address_i[1:0] == 2'b00 ? 1'b0 : 1'b1;
			excepttype_is_ades <= 1'b0;
			bad_addr_o <= current_inst_address_i[1:0] == 2'b00 ? `ZeroWord : current_inst_address_i;
			case (aluop_i)
				`EXE_LB_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							wdata_o <= {{24{mem_data_i[31]}},mem_data_i[31:24]};
							mem_sel_o <= 4'b1000;
						end
						2'b10:begin 
							wdata_o <= {{24{mem_data_i[23]}},mem_data_i[23:16]};
							mem_sel_o <= 4'b0100;
						end
						2'b01:begin 
							wdata_o <= {{24{mem_data_i[15]}},mem_data_i[15:8]};
							mem_sel_o <= 4'b0010;
						end
						2'b00:begin 
							wdata_o <= {{24{mem_data_i[7]}},mem_data_i[7:0]};
							mem_sel_o <= 4'b0001;
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
						end
					endcase
				end
				`EXE_LBU_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							wdata_o <= {{24{1'b0}},mem_data_i[31:24]};
							mem_sel_o <= 4'b1000;
						end
						2'b10:begin 
							wdata_o <= {{24{1'b0}},mem_data_i[23:16]};
							mem_sel_o <= 4'b0100;
						end
						2'b01:begin 
							wdata_o <= {{24{1'b0}},mem_data_i[15:8]};
							mem_sel_o <= 4'b0010;
						end
						2'b00:begin 
							wdata_o <= {{24{1'b0}},mem_data_i[7:0]};
							mem_sel_o <= 4'b0001;
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
						end
					endcase
				end
				`EXE_LH_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b10:begin 
							wdata_o <= {{16{mem_data_i[31]}},mem_data_i[31:16]};
							mem_sel_o <= 4'b1100;
						end
						2'b00:begin 
							wdata_o <= {{16{mem_data_i[15]}},mem_data_i[15:0]};
							mem_sel_o <= 4'b0011;
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
							excepttype_is_adel <= 1'b1;
							bad_addr_o <= mem_addr_i;
						end
					endcase
				end
				`EXE_LHU_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b10:begin 
							wdata_o <= {{16{1'b0}},mem_data_i[31:16]};
							mem_sel_o <= 4'b1100;
						end
						2'b00:begin 
							wdata_o <= {{16{1'b0}},mem_data_i[15:0]};
							mem_sel_o <= 4'b0011;
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
							excepttype_is_adel <= 1'b1;
							bad_addr_o <= mem_addr_i;
						end
					endcase
				end
				`EXE_LW_OP:begin
					if(mem_addr_i[1:0] == 2'b00) begin
						/* code */
						mem_addr_o <= mem_addr_i;
						mem_we <= `WriteDisable;
						mem_ce_o <= `ChipEnable;
						wdata_o <= mem_data_i;
						mem_sel_o <= 4'b1111;
					end else begin 
						excepttype_is_adel <= 1'b1;
						bad_addr_o <= mem_addr_i;
						wdata_o <= `ZeroWord;
					end
					
				end
				`EXE_LWL_OP:begin 
					mem_addr_o <= {mem_addr_i[31:2],2'b00};
					mem_sel_o <= 4'b1111;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							wdata_o <= mem_data_i[31:0];
						end
						2'b10:begin 
							wdata_o <= {mem_data_i[23:0],reg2_i[7:0]};
						end
						2'b01:begin 
							wdata_o <= {mem_data_i[15:0],reg2_i[15:0]};
						end
						2'b00:begin 
							wdata_o <= {mem_data_i[7:0],reg2_i[23:0]};
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
						end
					endcase
				end
				`EXE_LWR_OP:begin 
					mem_addr_o <= {mem_addr_i[31:2],2'b00};
					mem_sel_o <= 4'b1111;
					mem_we <= `WriteDisable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							wdata_o <= {reg2_i[31:8],mem_data_i[31:24]};
						end
						2'b10:begin 
							wdata_o <= {reg2_i[31:16],mem_data_i[31:16]};
						end
						2'b01:begin 
							wdata_o <= {reg2_i[31:24],mem_data_i[31:8]};
						end
						2'b00:begin 
							wdata_o <= mem_data_i[31:0];
						end
						default : /* default */begin 
							wdata_o <= `ZeroWord;
						end
					endcase
				end
				`EXE_SB_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteEnable;
					mem_data_o <= {reg2_i[7:0],reg2_i[7:0],reg2_i[7:0],reg2_i[7:0]};
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							mem_sel_o <= 4'b1000;
						end
						2'b10:begin 
							mem_sel_o <= 4'b0100;
						end
						2'b01:begin 
							mem_sel_o <= 4'b0010;
						end
						2'b00:begin 
							mem_sel_o <= 4'b0001;
						end
						default : /* default */begin 
							mem_sel_o <= 4'b0000;
						end
					endcase
				end
				`EXE_SH_OP:begin 
					mem_addr_o <= mem_addr_i;
					mem_we <= `WriteEnable;
					mem_data_o <= {reg2_i[15:0],reg2_i[15:0]};
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b10:begin 
							mem_sel_o <= 4'b1100;
						end
						2'b00:begin 
							mem_sel_o <= 4'b0011;
						end
						default : /* default */begin 
							mem_sel_o <= 4'b0000;
							excepttype_is_ades <= 1'b1;
							bad_addr_o <= mem_addr_i;
						end
					endcase
				end
				`EXE_SW_OP:begin
					if(mem_addr_i[1:0] == 2'b00) begin
						/* code */
						mem_addr_o <= mem_addr_i;
						mem_we <= `WriteEnable;
						mem_ce_o <= `ChipEnable;
						mem_data_o <= reg2_i;
						mem_sel_o <= 4'b1111;
					end else begin 
						excepttype_is_ades <= 1'b1;
						mem_sel_o <= 4'b0000;
						bad_addr_o <= mem_addr_i;
					end
					
				end
				`EXE_SWL_OP:begin 
					mem_addr_o <= {mem_addr_i[31:2],2'b00};
					mem_we <= `WriteEnable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							mem_sel_o <= 4'b1111;
							mem_data_o <= reg2_i;
						end
						2'b10:begin 
							mem_sel_o <= 4'b0111;
							mem_data_o <= {zero32[7:0],reg2_i[31:8]};
						end
						2'b01:begin 
							mem_sel_o <= 4'b0011;
							mem_data_o <= {zero32[15:0],reg2_i[31:16]};
						end
						2'b00:begin 
							mem_sel_o <= 4'b0001;
							mem_data_o <= {zero32[23:0],reg2_i[31:24]};
						end
						default : /* default */begin 
							mem_sel_o <= 4'b0000;
						end
					endcase
				end
				`EXE_SWR_OP:begin 
					mem_addr_o <= {mem_addr_i[31:2],2'b00};
					mem_we <= `WriteEnable;
					mem_ce_o <= `ChipEnable;
					case (mem_addr_i[1:0])
						2'b11:begin 
							mem_sel_o <= 4'b1000;
							mem_data_o <= {reg2_i[7:0],zero32[23:0]};
						end
						2'b10:begin 
							mem_sel_o <= 4'b1100;
							mem_data_o <= {reg2_i[15:0],zero32[15:0]};
						end
						2'b01:begin 
							mem_sel_o <= 4'b1110;
							mem_data_o <= {reg2_i[23:0],zero32[7:0]};
						end
						2'b00:begin 
							mem_sel_o <= 4'b1111;
							mem_data_o <= reg2_i;
						end
						default : /* default */begin 
							mem_sel_o <= 4'b0000;
						end
					endcase
				end
				`EXE_LL_OP:begin 
					mem_we <= `WriteDisable;
					mem_addr_o <= mem_addr_i;
					wdata_o <= mem_data_i;
					LLbit_we_o <= 1'b1;
					LLbit_value_o <= 1'b1;
					mem_sel_o <= 4'b1111;
					mem_ce_o <= `ChipEnable;
				end
				`EXE_SC_OP:begin 
					if(LLbit == 1'b1) begin
						/* code */
						mem_we <= `WriteEnable;
						mem_addr_o <= mem_addr_i;
						mem_data_o <= reg2_i;
						wdata_o <= 32'b1;
						LLbit_we_o <= 1'b1;
						LLbit_value_o <= 1'b0;
						mem_sel_o <= 4'b1111;
						mem_ce_o <= `ChipEnable;
					end else begin 
						wdata_o <= `ZeroWord;
					end
				end
				default : /* default */;
			endcase
		end
	
	end
endmodule
