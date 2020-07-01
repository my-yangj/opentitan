// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_peri module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// main
//   -> s1n_14
//     -> uart
//     -> uart1
//     -> uart2
//     -> uart3
//     -> gpio
//     -> spi_device
//     -> rv_timer
//     -> i2c0
//     -> i2c1
//     -> i2c2
//     -> pattgen
//     -> sensor_ctrl
//     -> otp_ctrl

module xbar_peri (
  input clk_peri_i,
  input rst_peri_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_main_i,
  output tlul_pkg::tl_d2h_t tl_main_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_uart_o,
  input  tlul_pkg::tl_d2h_t tl_uart_i,
  output tlul_pkg::tl_h2d_t tl_uart1_o,
  input  tlul_pkg::tl_d2h_t tl_uart1_i,
  output tlul_pkg::tl_h2d_t tl_uart2_o,
  input  tlul_pkg::tl_d2h_t tl_uart2_i,
  output tlul_pkg::tl_h2d_t tl_uart3_o,
  input  tlul_pkg::tl_d2h_t tl_uart3_i,
  output tlul_pkg::tl_h2d_t tl_gpio_o,
  input  tlul_pkg::tl_d2h_t tl_gpio_i,
  output tlul_pkg::tl_h2d_t tl_spi_device_o,
  input  tlul_pkg::tl_d2h_t tl_spi_device_i,
  output tlul_pkg::tl_h2d_t tl_rv_timer_o,
  input  tlul_pkg::tl_d2h_t tl_rv_timer_i,
  output tlul_pkg::tl_h2d_t tl_i2c0_o,
  input  tlul_pkg::tl_d2h_t tl_i2c0_i,
  output tlul_pkg::tl_h2d_t tl_i2c1_o,
  input  tlul_pkg::tl_d2h_t tl_i2c1_i,
  output tlul_pkg::tl_h2d_t tl_i2c2_o,
  input  tlul_pkg::tl_d2h_t tl_i2c2_i,
  output tlul_pkg::tl_h2d_t tl_pattgen_o,
  input  tlul_pkg::tl_d2h_t tl_pattgen_i,
  output tlul_pkg::tl_h2d_t tl_sensor_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_sensor_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_otp_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_otp_ctrl_i,

  input scanmode_i
);

  import tlul_pkg::*;
  import tl_peri_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = scanmode_i;

  tl_h2d_t tl_s1n_14_us_h2d ;
  tl_d2h_t tl_s1n_14_us_d2h ;


  tl_h2d_t tl_s1n_14_ds_h2d [13];
  tl_d2h_t tl_s1n_14_ds_d2h [13];

  // Create steering signal
  logic [3:0] dev_sel_s1n_14;



  assign tl_uart_o = tl_s1n_14_ds_h2d[0];
  assign tl_s1n_14_ds_d2h[0] = tl_uart_i;

  assign tl_uart1_o = tl_s1n_14_ds_h2d[1];
  assign tl_s1n_14_ds_d2h[1] = tl_uart1_i;

  assign tl_uart2_o = tl_s1n_14_ds_h2d[2];
  assign tl_s1n_14_ds_d2h[2] = tl_uart2_i;

  assign tl_uart3_o = tl_s1n_14_ds_h2d[3];
  assign tl_s1n_14_ds_d2h[3] = tl_uart3_i;

  assign tl_gpio_o = tl_s1n_14_ds_h2d[4];
  assign tl_s1n_14_ds_d2h[4] = tl_gpio_i;

  assign tl_spi_device_o = tl_s1n_14_ds_h2d[5];
  assign tl_s1n_14_ds_d2h[5] = tl_spi_device_i;

  assign tl_rv_timer_o = tl_s1n_14_ds_h2d[6];
  assign tl_s1n_14_ds_d2h[6] = tl_rv_timer_i;

  assign tl_i2c0_o = tl_s1n_14_ds_h2d[7];
  assign tl_s1n_14_ds_d2h[7] = tl_i2c0_i;

  assign tl_i2c1_o = tl_s1n_14_ds_h2d[8];
  assign tl_s1n_14_ds_d2h[8] = tl_i2c1_i;

  assign tl_i2c2_o = tl_s1n_14_ds_h2d[9];
  assign tl_s1n_14_ds_d2h[9] = tl_i2c2_i;

  assign tl_pattgen_o = tl_s1n_14_ds_h2d[10];
  assign tl_s1n_14_ds_d2h[10] = tl_pattgen_i;

  assign tl_sensor_ctrl_o = tl_s1n_14_ds_h2d[11];
  assign tl_s1n_14_ds_d2h[11] = tl_sensor_ctrl_i;

  assign tl_otp_ctrl_o = tl_s1n_14_ds_h2d[12];
  assign tl_s1n_14_ds_d2h[12] = tl_otp_ctrl_i;

  assign tl_s1n_14_us_h2d = tl_main_i;
  assign tl_main_o = tl_s1n_14_us_d2h;

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_14 = 4'd13;
    if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_UART)) == ADDR_SPACE_UART) begin
      dev_sel_s1n_14 = 4'd0;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_UART1)) == ADDR_SPACE_UART1) begin
      dev_sel_s1n_14 = 4'd1;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_UART2)) == ADDR_SPACE_UART2) begin
      dev_sel_s1n_14 = 4'd2;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_UART3)) == ADDR_SPACE_UART3) begin
      dev_sel_s1n_14 = 4'd3;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_GPIO)) == ADDR_SPACE_GPIO) begin
      dev_sel_s1n_14 = 4'd4;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_SPI_DEVICE)) == ADDR_SPACE_SPI_DEVICE) begin
      dev_sel_s1n_14 = 4'd5;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_RV_TIMER)) == ADDR_SPACE_RV_TIMER) begin
      dev_sel_s1n_14 = 4'd6;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_I2C0)) == ADDR_SPACE_I2C0) begin
      dev_sel_s1n_14 = 4'd7;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_I2C1)) == ADDR_SPACE_I2C1) begin
      dev_sel_s1n_14 = 4'd8;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_I2C2)) == ADDR_SPACE_I2C2) begin
      dev_sel_s1n_14 = 4'd9;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_PATTGEN)) == ADDR_SPACE_PATTGEN) begin
      dev_sel_s1n_14 = 4'd10;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_SENSOR_CTRL)) == ADDR_SPACE_SENSOR_CTRL) begin
      dev_sel_s1n_14 = 4'd11;

    end else if ((tl_s1n_14_us_h2d.a_address & ~(ADDR_MASK_OTP_CTRL)) == ADDR_SPACE_OTP_CTRL) begin
      dev_sel_s1n_14 = 4'd12;
end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (52'h0),
    .DRspDepth (52'h0),
    .N         (13)
  ) u_s1n_14 (
    .clk_i        (clk_peri_i),
    .rst_ni       (rst_peri_ni),
    .tl_h_i       (tl_s1n_14_us_h2d),
    .tl_h_o       (tl_s1n_14_us_d2h),
    .tl_d_o       (tl_s1n_14_ds_h2d),
    .tl_d_i       (tl_s1n_14_ds_d2h),
    .dev_select   (dev_sel_s1n_14)
  );

endmodule
