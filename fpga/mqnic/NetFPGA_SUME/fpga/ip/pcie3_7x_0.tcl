
create_ip -name pcie3_7x -vendor xilinx.com -library ip -module_name pcie3_7x_0

# Note: axisten_if_enable_client_tag setting appears to be inverted 
set_property -dict [list \
    CONFIG.pcie_blk_locn {X0Y1} \
    CONFIG.PL_LINK_CAP_MAX_LINK_SPEED {8.0_GT/s} \
    CONFIG.PL_LINK_CAP_MAX_LINK_WIDTH {X8} \
    CONFIG.AXISTEN_IF_RC_STRADDLE {true} \
    CONFIG.axisten_if_enable_client_tag {false} \
    CONFIG.axisten_if_width {256_bit} \
    CONFIG.extended_tag_field {true} \
    CONFIG.pf0_dev_cap_max_payload {1024_bytes} \
    CONFIG.axisten_freq {250} \
    CONFIG.PF0_CLASS_CODE {020000} \
    CONFIG.PF0_DEVICE_ID {1001} \
    CONFIG.PF0_SUBSYSTEM_ID {7028} \
    CONFIG.PF0_SUBSYSTEM_VENDOR_ID {10ee} \
    CONFIG.pf0_bar0_64bit {true} \
    CONFIG.pf0_bar0_prefetchable {true} \
    CONFIG.pf0_bar0_scale {Megabytes} \
    CONFIG.pf0_bar0_size {16} \
    CONFIG.pf0_msi_enabled {false} \
    CONFIG.pf0_msix_enabled {true} \
    CONFIG.PF0_MSIX_CAP_TABLE_SIZE {01F} \
    CONFIG.PF0_MSIX_CAP_TABLE_BIR {BAR_1:0} \
    CONFIG.PF0_MSIX_CAP_TABLE_OFFSET {00010000} \
    CONFIG.PF0_MSIX_CAP_PBA_BIR {BAR_1:0} \
    CONFIG.PF0_MSIX_CAP_PBA_OFFSET {00018000} \
    CONFIG.aspm_support {No_ASPM} \
    CONFIG.vendor_id {1234} \
] [get_ips pcie3_7x_0]
