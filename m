Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C88541CCA8C
	for <lists+openbmc@lfdr.de>; Sun, 10 May 2020 13:10:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KhDx1lyLzDqvT
	for <lists+openbmc@lfdr.de>; Sun, 10 May 2020 21:10:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KhBc0n9bzDqtl
 for <openbmc@lists.ozlabs.org>; Sun, 10 May 2020 21:08:23 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 04AANrK3015177;
 Sun, 10 May 2020 13:23:53 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id A5B1C639C2; Sun, 10 May 2020 13:23:53 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: ofery@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 wsa@the-dreams.de, andriy.shevchenko@linux.intel.com
Subject: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
Date: Sun, 10 May 2020 13:23:29 +0300
Message-Id: <20200510102330.66715-3-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200510102330.66715-1-tali.perry1@gmail.com>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC I2C controller driver.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/Kconfig       |    9 +
 drivers/i2c/busses/Makefile      |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c | 1853 ++++++++++++++++++++++++++++++
 3 files changed, 1863 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..a2cfc555c284 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -791,6 +791,15 @@ config I2C_NOMADIK
 	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
 	  as well as the STA2X11 PCIe I/O HUB.
 
+config I2C_NPCM7XX
+	tristate "Nuvoton I2C Controller"
+	depends on ARCH_NPCM7XX || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
+	  controller.
+	  Driver can also support slave mode (select I2C_SLAVE).
+
 config I2C_OCORES
 	tristate "OpenCores I2C Controller"
 	help
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 25d60889713c..8f3dfd376bec 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
 obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
+obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
new file mode 100644
index 000000000000..e732c40f0cf3
--- /dev/null
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -0,0 +1,1853 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM7xx I2C Controller driver
+ *
+ * Copyright (C) 2020 Nuvoton Technologies tali.perry@nuvoton.com
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+#include <linux/debugfs.h>
+#endif
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+//#define _I2C_DEBUG_
+
+enum i2c_mode {
+	I2C_MASTER,
+	I2C_SLAVE,
+};
+
+/*
+ * External I2C Interface driver xfer indication values, which indicate status
+ * of the bus.
+ */
+enum i2c_state_ind {
+	I2C_NO_STATUS_IND = 0,
+	I2C_SLAVE_RCV_IND,
+	I2C_SLAVE_XMIT_IND,
+	I2C_SLAVE_XMIT_MISSING_DATA_IND,
+	I2C_SLAVE_RESTART_IND,
+	I2C_SLAVE_DONE_IND,
+	I2C_MASTER_DONE_IND,
+	I2C_NACK_IND,
+	I2C_BUS_ERR_IND,
+	I2C_WAKE_UP_IND,
+	I2C_BLOCK_BYTES_ERR_IND,
+	I2C_SLAVE_RCV_MISSING_DATA_IND,
+};
+
+// Operation type values (used to define the operation currently held)
+// module is interrupt driven, on each interrupt the current operation is
+// checked to see if the module is currently reading or writing.
+enum i2c_oper {
+	I2C_NO_OPER = 0,
+	I2C_WRITE_OPER,
+	I2C_READ_OPER,
+};
+
+// I2C Bank (module had 2 banks of registers)
+enum i2c_bank {
+	I2C_BANK_0 = 0,
+	I2C_BANK_1,
+};
+
+// Internal I2C states values (for the I2C module state machine).
+enum i2c_state {
+	I2C_DISABLE = 0,
+	I2C_IDLE,
+	I2C_MASTER_START,
+	I2C_SLAVE_MATCH,
+	I2C_OPER_STARTED,
+	I2C_STOP_PENDING,
+};
+
+// init register and default value required to enable module
+#define NPCM_I2CSEGCTL                    0xE4
+#define NPCM_I2CSEGCTL_INIT_VAL           0x0333F000
+
+// Common regs
+#define NPCM_I2CSDA                       0x00
+#define NPCM_I2CST                        0x02
+#define NPCM_I2CCST                       0x04
+#define NPCM_I2CCTL1	                  0x06
+#define NPCM_I2CADDR1                     0x08
+#define NPCM_I2CCTL2                      0x0A
+#define NPCM_I2CADDR2                     0x0C
+#define NPCM_I2CCTL3                      0x0E
+#define NPCM_I2CCST2                      0x18
+#define NPCM_I2CCST3                      0x19
+#define I2C_VER                           0x1F
+
+// BANK 0 regs
+#define NPCM_I2CADDR3                     0x10
+#define NPCM_I2CADDR7                     0x11
+#define NPCM_I2CADDR4                     0x12
+#define NPCM_I2CADDR8                     0x13
+#define NPCM_I2CADDR5                     0x14
+#define NPCM_I2CADDR9                     0x15
+#define NPCM_I2CADDR6                     0x16
+#define NPCM_I2CADDR10                    0x17
+
+#define NPCM_I2CCTL4                      0x1A
+#define NPCM_I2CCTL5                      0x1B
+#define NPCM_I2CSCLLT                     0x1C // SCL Low Time
+#define NPCM_I2CFIF_CTL                   0x1D // FIFO Control
+#define NPCM_I2CSCLHT                     0x1E // SCL High Time
+
+// BANK 1 regs
+#define NPCM_I2CFIF_CTS                   0x10 // Both FIFOs Control and status
+#define NPCM_I2CTXF_CTL                   0x12 // Tx-FIFO Control
+#define NPCM_I2CT_OUT                     0x14 // Bus T.O.
+#define NPCM_I2CPEC                       0x16 // PEC Data
+#define NPCM_I2CTXF_STS                   0x1A // Tx-FIFO Status
+#define NPCM_I2CRXF_STS                   0x1C // Rx-FIFO Status
+#define NPCM_I2CRXF_CTL                   0x1E // Rx-FIFO Control
+
+// NPCM_I2CST reg fields
+#define NPCM_I2CST_XMIT                   BIT(0)
+#define NPCM_I2CST_MASTER                 BIT(1)
+#define NPCM_I2CST_NMATCH                 BIT(2)
+#define NPCM_I2CST_STASTR                 BIT(3)
+#define NPCM_I2CST_NEGACK                 BIT(4)
+#define NPCM_I2CST_BER                    BIT(5)
+#define NPCM_I2CST_SDAST                  BIT(6)
+#define NPCM_I2CST_SLVSTP                 BIT(7)
+
+// NPCM_I2CCST reg fields
+#define NPCM_I2CCST_BUSY                  BIT(0)
+#define NPCM_I2CCST_BB                    BIT(1)
+#define NPCM_I2CCST_MATCH                 BIT(2)
+#define NPCM_I2CCST_GCMATCH               BIT(3)
+#define NPCM_I2CCST_TSDA                  BIT(4)
+#define NPCM_I2CCST_TGSCL                 BIT(5)
+#define NPCM_I2CCST_MATCHAF               BIT(6)
+#define NPCM_I2CCST_ARPMATCH              BIT(7)
+
+// NPCM_I2CCTL1 reg fields
+#define NPCM_I2CCTL1_START                BIT(0)
+#define NPCM_I2CCTL1_STOP                 BIT(1)
+#define NPCM_I2CCTL1_INTEN                BIT(2)
+#define NPCM_I2CCTL1_EOBINTE              BIT(3)
+#define NPCM_I2CCTL1_ACK                  BIT(4)
+#define NPCM_I2CCTL1_GCMEN                BIT(5)
+#define NPCM_I2CCTL1_NMINTE               BIT(6)
+#define NPCM_I2CCTL1_STASTRE              BIT(7)
+
+// RW1S fields (inside a RW reg):
+#define NPCM_I2CCTL1_RWS   \
+	(NPCM_I2CCTL1_START | NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK)
+
+// npcm_i2caddr reg fields
+#define NPCM_I2CADDR_A                    GENMASK(6, 0)
+#define NPCM_I2CADDR_SAEN                 BIT(7)
+
+// NPCM_I2CCTL2 reg fields
+#define I2CCTL2_ENABLE                    BIT(0)
+#define I2CCTL2_SCLFRQ6_0                 GENMASK(7, 1)
+
+// NPCM_I2CCTL3 reg fields
+#define I2CCTL3_SCLFRQ8_7                 GENMASK(1, 0)
+#define I2CCTL3_ARPMEN                    BIT(2)
+#define I2CCTL3_IDL_START                 BIT(3)
+#define I2CCTL3_400K_MODE                 BIT(4)
+#define I2CCTL3_BNK_SEL                   BIT(5)
+#define I2CCTL3_SDA_LVL                   BIT(6)
+#define I2CCTL3_SCL_LVL                   BIT(7)
+
+// NPCM_I2CCST2 reg fields
+#define NPCM_I2CCST2_MATCHA1F             BIT(0)
+#define NPCM_I2CCST2_MATCHA2F             BIT(1)
+#define NPCM_I2CCST2_MATCHA3F             BIT(2)
+#define NPCM_I2CCST2_MATCHA4F             BIT(3)
+#define NPCM_I2CCST2_MATCHA5F             BIT(4)
+#define NPCM_I2CCST2_MATCHA6F             BIT(5)
+#define NPCM_I2CCST2_MATCHA7F             BIT(5)
+#define NPCM_I2CCST2_INTSTS               BIT(7)
+
+// NPCM_I2CCST3 reg fields
+#define NPCM_I2CCST3_MATCHA8F             BIT(0)
+#define NPCM_I2CCST3_MATCHA9F             BIT(1)
+#define NPCM_I2CCST3_MATCHA10F            BIT(2)
+#define NPCM_I2CCST3_EO_BUSY              BIT(7)
+
+// NPCM_I2CCTL4 reg fields
+#define I2CCTL4_HLDT                      GENMASK(5, 0)
+#define I2CCTL4_LVL_WE                    BIT(7)
+
+// NPCM_I2CCTL5 reg fields
+#define I2CCTL5_DBNCT                     GENMASK(3, 0)
+
+// NPCM_I2CFIF_CTS reg fields
+#define NPCM_I2CFIF_CTS_RXF_TXE           BIT(1)
+#define NPCM_I2CFIF_CTS_RFTE_IE           BIT(3)
+#define NPCM_I2CFIF_CTS_CLR_FIFO          BIT(6)
+#define NPCM_I2CFIF_CTS_SLVRSTR           BIT(7)
+
+// NPCM_I2CTXF_CTL reg fields
+#define NPCM_I2CTXF_CTL_TX_THR            GENMASK(4, 0)
+#define NPCM_I2CTXF_CTL_THR_TXIE          BIT(6)
+
+// NPCM_I2CT_OUT reg fields
+#define NPCM_I2CT_OUT_TO_CKDIV            GENMASK(5, 0)
+#define NPCM_I2CT_OUT_T_OUTIE             BIT(6)
+#define NPCM_I2CT_OUT_T_OUTST             BIT(7)
+
+// NPCM_I2CTXF_STS reg fields
+#define NPCM_I2CTXF_STS_TX_BYTES          GENMASK(4, 0)
+#define NPCM_I2CTXF_STS_TX_THST           BIT(6)
+
+// NPCM_I2CRXF_STS reg fields
+#define NPCM_I2CRXF_STS_RX_BYTES          GENMASK(4, 0)
+#define NPCM_I2CRXF_STS_RX_THST           BIT(6)
+
+// NPCM_I2CFIF_CTL reg fields
+#define NPCM_I2CFIF_CTL_FIFO_EN           BIT(4)
+
+// NPCM_I2CRXF_CTL reg fields
+#define NPCM_I2CRXF_CTL_RX_THR            GENMASK(4, 0)
+#define NPCM_I2CRXF_CTL_LAST_PEC          BIT(5)
+#define NPCM_I2CRXF_CTL_THR_RXIE          BIT(6)
+
+#define I2C_HW_FIFO_SIZE                  16
+
+// I2C_VER reg fields
+#define I2C_VER_VERSION                   GENMASK(6, 0)
+#define I2C_VER_FIFO_EN                   BIT(7)
+
+// stall/stuck timeout in us
+#define DEFAULT_STALL_COUNT               25
+
+// supported clk settings. values in KHz.
+#define I2C_FREQ_MIN                      10
+#define I2C_FREQ_MAX                      1000
+
+// SCLFRQ field position
+#define SCLFRQ_0_TO_6                     GENMASK(6, 0)
+#define SCLFRQ_7_TO_8                     GENMASK(8, 7)
+
+#define I2C_NUM_OF_ADDR 10
+
+// Status of one I2C module
+struct npcm_i2c {
+	struct i2c_adapter adap;
+	struct device *dev;
+	unsigned char __iomem *reg;
+	spinlock_t lock;   // IRQ synchronization
+	struct completion cmd_complete;
+	int irq;
+	int cmd_err;
+	struct i2c_msg *msgs;
+	int msgs_num;
+	int num;
+	u32 apb_clk;
+	struct i2c_bus_recovery_info rinfo;
+	enum i2c_state state;
+	enum i2c_oper operation;
+	enum i2c_mode master_or_slave;
+	enum i2c_state_ind stop_ind;
+	u8 dest_addr;
+	u8 *rd_buf;
+	u16 rd_size;
+	u16 rd_ind;
+	u8 *wr_buf;
+	u16 wr_size;
+	u16 wr_ind;
+	bool fifo_use;
+	u16 PEC_mask; // PEC bit mask per slave address
+	bool PEC_use;
+	bool read_block_use;
+	u8 int_cnt;
+	u32 clk_period_us;
+	unsigned long int_time_stamp;
+	unsigned long bus_freq; // in kHz
+	u32 xmits;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *debugfs;/* debugfs device directory */
+	uint64_t ber_count;
+	uint64_t rec_succ_count;
+	uint64_t rec_fail_count;
+	uint64_t nack_count;
+	uint64_t timeout_count;
+#endif
+};
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static struct dentry *npcm_i2c_debugfs_dir;   /* i2c debugfs directory */
+static const char *ber_cnt_name      = "ber_count";
+static const char *rec_succ_cnt_name = "rec_succ_count";
+static const char *rec_fail_cnt_name = "rec_fail_count";
+static const char *nack_cnt_name     = "nack_count";
+static const char *timeout_cnt_name  = "timeout_count";
+#endif
+
+static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
+					enum i2c_bank bank)
+{
+	u8 i2cctl3 = ioread8(bus->reg + NPCM_I2CCTL3);
+
+	if (bank == I2C_BANK_0)
+		i2cctl3 = i2cctl3 & ~I2CCTL3_BNK_SEL;
+	else
+		i2cctl3 = i2cctl3 | I2CCTL3_BNK_SEL;
+	iowrite8(i2cctl3, bus->reg + NPCM_I2CCTL3);
+}
+
+static void npcm_i2c_init_params(struct npcm_i2c *bus)
+{
+	bus->stop_ind = I2C_NO_STATUS_IND;
+	bus->rd_size = 0;
+	bus->wr_size = 0;
+	bus->rd_ind = 0;
+	bus->wr_ind = 0;
+	bus->int_cnt = 0;
+	bus->read_block_use = false;
+	bus->int_time_stamp = 0;
+	bus->PEC_use = false;
+	bus->PEC_mask = 0;
+}
+
+static inline void npcm_i2c_wr_byte(struct npcm_i2c *bus, u8 data)
+{
+	iowrite8(data, bus->reg + NPCM_I2CSDA);
+}
+
+static inline u8 npcm_i2c_rd_byte(struct npcm_i2c *bus)
+{
+	return ioread8(bus->reg + NPCM_I2CSDA);
+}
+
+static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
+{
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+
+	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+
+}
+
+static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
+{
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+
+	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+
+}
+
+static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
+{
+	if (bus->operation == I2C_READ_OPER)
+		return bus->rd_ind;
+	if (bus->operation == I2C_WRITE_OPER)
+		return bus->wr_ind;
+	return 0;
+}
+
+// quick protocol (just address):
+static inline bool npcm_i2c_is_quick(struct npcm_i2c *bus)
+{
+	return bus->wr_size == 0 && bus->rd_size == 0;
+}
+
+static void npcm_i2c_disable(struct npcm_i2c *bus)
+{
+	u8 i2cctl2;
+
+	// Disable module.
+	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
+	i2cctl2 = i2cctl2 & ~I2CCTL2_ENABLE;
+	iowrite8(i2cctl2, bus->reg + NPCM_I2CCTL2);
+
+	bus->state = I2C_DISABLE;
+}
+
+static void npcm_i2c_enable(struct npcm_i2c *bus)
+{
+	u8 i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
+
+	i2cctl2 = i2cctl2 | I2CCTL2_ENABLE;
+	iowrite8(i2cctl2, bus->reg + NPCM_I2CCTL2);
+	bus->state = I2C_IDLE;
+}
+
+// enable\disable end of busy (EOB) interrupt
+static inline void npcm_i2c_eob_int(struct npcm_i2c *bus, bool enable)
+{
+	u8 val;
+
+	// Clear EO_BUSY pending bit:
+	val = ioread8(bus->reg + NPCM_I2CCST3);
+	val = val | NPCM_I2CCST3_EO_BUSY;
+	iowrite8(val, bus->reg + NPCM_I2CCST3);
+
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~NPCM_I2CCTL1_RWS;
+	if (enable)
+		val |= NPCM_I2CCTL1_EOBINTE;
+	else
+		val &= ~NPCM_I2CCTL1_EOBINTE;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+}
+
+static inline bool npcm_i2c_tx_fifo_empty(struct npcm_i2c *bus)
+{
+	u8 tx_fifo_sts;
+
+	tx_fifo_sts = ioread8(bus->reg + NPCM_I2CTXF_STS);
+	// check if TX FIFO is not empty
+	if ((tx_fifo_sts & NPCM_I2CTXF_STS_TX_BYTES) == 0)
+		return false;
+
+	// check if TX FIFO status bit is set:
+	return !!FIELD_GET(NPCM_I2CTXF_STS_TX_THST, tx_fifo_sts);
+}
+
+static inline bool npcm_i2c_rx_fifo_full(struct npcm_i2c *bus)
+{
+	u8 rx_fifo_sts;
+
+	rx_fifo_sts = ioread8(bus->reg + NPCM_I2CRXF_STS);
+	// check if RX FIFO is not empty:
+	if ((rx_fifo_sts & NPCM_I2CRXF_STS_RX_BYTES) == 0)
+		return false;
+
+	// check if rx fifo full status is set:
+	return !!FIELD_GET(NPCM_I2CRXF_STS_RX_THST, rx_fifo_sts);
+}
+
+static inline void npcm_i2c_clear_fifo_int(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+	val = (val & NPCM_I2CFIF_CTS_SLVRSTR) |	NPCM_I2CFIF_CTS_RXF_TXE;
+	iowrite8(val, bus->reg + NPCM_I2CFIF_CTS);
+}
+
+static inline void npcm_i2c_clear_tx_fifo(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CTXF_STS);
+	val = val | NPCM_I2CTXF_STS_TX_THST;
+	iowrite8(val, bus->reg + NPCM_I2CTXF_STS);
+}
+
+static inline void npcm_i2c_clear_rx_fifo(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CRXF_STS);
+	val = val | NPCM_I2CRXF_STS_RX_THST;
+	iowrite8(val, bus->reg + NPCM_I2CRXF_STS);
+}
+
+static void npcm_i2c_int_enable(struct npcm_i2c *bus, bool enable)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~NPCM_I2CCTL1_RWS;
+	if (enable)
+		val |= NPCM_I2CCTL1_INTEN;
+	else
+		val &= ~NPCM_I2CCTL1_INTEN;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_master_start(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK);
+	val |= NPCM_I2CCTL1_START;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_master_stop(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	/*
+	 * override HW issue: I2C may fail to supply stop condition in Master
+	 * Write operation.
+	 * Need to delay at least 5 us from the last int, before issueing a stop
+	 */
+	udelay(10);
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~(NPCM_I2CCTL1_START | NPCM_I2CCTL1_ACK);
+	val |= NPCM_I2CCTL1_STOP;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+
+	if (!bus->fifo_use)
+		return;
+
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	if (bus->operation == I2C_READ_OPER)
+		npcm_i2c_clear_rx_fifo(bus);
+	else
+		npcm_i2c_clear_tx_fifo(bus);
+
+	npcm_i2c_clear_fifo_int(bus);
+
+	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+
+}
+
+static inline void npcm_i2c_stall_after_start(struct npcm_i2c *bus, bool stall)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~NPCM_I2CCTL1_RWS;
+	if (stall)
+		val |= NPCM_I2CCTL1_STASTRE;
+	else
+		val &= ~NPCM_I2CCTL1_STASTRE;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_nack(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val &= ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_START);
+	val |= NPCM_I2CCTL1_ACK;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+}
+
+static void npcm_i2c_reset(struct npcm_i2c *bus)
+{
+	// Save I2CCTL1 relevant bits. It is being cleared when the module
+	//  is disabled
+	u8 i2cctl1;
+	u8 i2cctl2;
+
+	i2cctl1 = ioread8(bus->reg + NPCM_I2CCTL1);
+	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
+
+	npcm_i2c_disable(bus);
+	npcm_i2c_enable(bus);
+
+	// Restore NPCM_I2CCTL1 status
+	i2cctl1 &= ~NPCM_I2CCTL1_RWS;
+	iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
+
+	// Clear BB (BUS BUSY) bit
+	iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+	iowrite8(0xFF, bus->reg + NPCM_I2CST);
+
+	// Clear EOB bit
+	iowrite8(NPCM_I2CCST3_EO_BUSY, bus->reg + NPCM_I2CCST3);
+
+	// Clear all fifo bits:
+	iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
+
+	bus->state = I2C_IDLE;
+}
+
+static inline bool npcm_i2c_is_master(struct npcm_i2c *bus)
+{
+	return !!FIELD_GET(NPCM_I2CST_MASTER, ioread8(bus->reg + NPCM_I2CST));
+}
+
+static void npcm_i2c_callback(struct npcm_i2c *bus,
+			      enum i2c_state_ind op_status, u16 info)
+{
+	struct i2c_msg *msgs;
+	int msgs_num;
+
+	msgs = bus->msgs;
+	msgs_num = bus->msgs_num;
+	// check that transaction was not timed-out, and msgs still
+	// holds a valid value.
+	if (!msgs)
+		return;
+
+	if (completion_done(&bus->cmd_complete))
+		return;
+
+	switch (op_status) {
+	case I2C_MASTER_DONE_IND:
+		bus->cmd_err = bus->msgs_num;
+		fallthrough;
+	case I2C_BLOCK_BYTES_ERR_IND:
+		// Master transaction finished and all transmit bytes were sent
+		if (bus->msgs) {
+			if (msgs[0].flags & I2C_M_RD)
+				msgs[0].len = info;
+			else if (msgs_num == 2 &&
+				 msgs[1].flags & I2C_M_RD)
+				msgs[1].len = info;
+		}
+		if (completion_done(&bus->cmd_complete) == false)
+			complete(&bus->cmd_complete);
+	break;
+
+	case I2C_NACK_IND:
+		// MASTER transmit got a NACK before tx all bytes
+		// info: number of transmitted bytes
+		bus->cmd_err = -ENXIO;
+		if (bus->master_or_slave == I2C_MASTER)
+			complete(&bus->cmd_complete);
+
+		break;
+	case I2C_BUS_ERR_IND:
+		// Bus error
+		bus->cmd_err = -EAGAIN;
+		if (bus->master_or_slave == I2C_MASTER)
+			complete(&bus->cmd_complete);
+
+		break;
+	case I2C_WAKE_UP_IND:
+		// I2C wake up
+		break;
+	default:
+		break;
+	}
+
+	bus->operation = I2C_NO_OPER;
+}
+
+static u32 npcm_i2c_fifo_usage(struct npcm_i2c *bus)
+{
+	if (bus->operation == I2C_WRITE_OPER)
+		return FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
+				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+	if (bus->operation == I2C_READ_OPER)
+		return FIELD_GET(NPCM_I2CRXF_STS_RX_BYTES,
+				 ioread8(bus->reg + NPCM_I2CRXF_STS));
+	return 0;
+}
+
+static void npcm_i2c_write_to_fifo_master(struct npcm_i2c *bus,
+					  u16 max_bytes_to_send)
+{
+	// Fill the FIFO, while the FIFO is not full and there are more bytes to
+	// write
+	while ((max_bytes_to_send--) &&
+	       (I2C_HW_FIFO_SIZE - npcm_i2c_fifo_usage(bus))) {
+		if (bus->wr_ind < bus->wr_size)
+			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
+		else
+			npcm_i2c_wr_byte(bus, 0xFF);
+	}
+}
+
+/*
+ * configure the FIFO before using it. If nread is -1 RX FIFO will not be
+ * configured. same for nwrite
+ */
+static void npcm_i2c_set_fifo(struct npcm_i2c *bus, int nread, int nwrite)
+{
+	u8 rxf_ctl = 0;
+
+	if (!bus->fifo_use)
+		return;
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+	npcm_i2c_clear_tx_fifo(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+
+	// configure RX FIFO
+	if (nread > 0) {
+		rxf_ctl = min_t(int, nread, I2C_HW_FIFO_SIZE);
+
+		// set LAST bit. if LAST is set enxt FIFO packet is nacked
+		// regular read of less then buffer size:
+		if (nread <= I2C_HW_FIFO_SIZE)
+			rxf_ctl |= NPCM_I2CRXF_CTL_LAST_PEC;
+		// if we are about to read the first byte in blk rd mode,
+		// don't NACK it. BTW, if slave return zero size HW can't NACK
+		// it immidiattly, it will read extra byte and then NACK.
+		if (bus->rd_ind == 0 && bus->read_block_use) {
+			// set fifo to read one byte, no last:
+			rxf_ctl = 1;
+		}
+
+		// set fifo size:
+		iowrite8(rxf_ctl, bus->reg + NPCM_I2CRXF_CTL);
+	}
+
+	// configure TX FIFO
+	if (nwrite > 0) {
+		if (nwrite > I2C_HW_FIFO_SIZE)
+			// data to send is more then FIFO size.
+			// Configure the FIFO int to be after of FIFO is cleared
+			iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CTXF_CTL);
+		else
+			iowrite8(nwrite, bus->reg + NPCM_I2CTXF_CTL);
+
+		npcm_i2c_clear_tx_fifo(bus);
+	}
+}
+
+static void npcm_i2c_read_from_fifo(struct npcm_i2c *bus, u8 bytes_in_fifo)
+{
+	u8 data;
+
+	while (bytes_in_fifo--) {
+		data = npcm_i2c_rd_byte(bus);
+
+		if (bus->master_or_slave == I2C_MASTER) {
+			if (bus->rd_ind < bus->rd_size)
+				bus->rd_buf[bus->rd_ind++] = data;
+		}
+	}
+}
+
+static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	// Clear NEGACK, STASTR and BER bits
+	val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
+	iowrite8(val, bus->reg + NPCM_I2CST);
+}
+
+static void npcm_i2c_master_abort(struct npcm_i2c *bus)
+{
+	// Only current master is allowed to issue a stop condition
+	if (npcm_i2c_is_master(bus)) {
+		npcm_i2c_eob_int(bus, true);
+		npcm_i2c_master_stop(bus);
+		npcm_i2c_clear_master_status(bus);
+	}
+}
+
+static void npcm_i2c_master_fifo_read(struct npcm_i2c *bus)
+{
+	int rcount;
+	int fifo_bytes;
+	enum i2c_state_ind ind = I2C_MASTER_DONE_IND;
+
+	fifo_bytes = npcm_i2c_fifo_usage(bus);
+
+	rcount = bus->rd_size - bus->rd_ind;
+
+	// In order not to change the RX_TRH during transaction (we found that
+	// this might be problematic if it takes too much time to read the FIFO)
+	// we read the data in the following way. If the number of bytes to
+	// read == FIFO Size + C (where C < FIFO Size)then first read C bytes
+	// and in the next int we read rest of the data.
+	if (rcount < (2 * I2C_HW_FIFO_SIZE) && rcount > I2C_HW_FIFO_SIZE)
+		fifo_bytes = rcount - I2C_HW_FIFO_SIZE;
+
+	if (rcount <= fifo_bytes) {
+		// last bytes are about to be read - end of transaction.
+		// Stop should be set before reading last byte.
+		bus->state = I2C_STOP_PENDING;
+		bus->stop_ind = ind;
+		npcm_i2c_eob_int(bus, true);
+		npcm_i2c_master_stop(bus);
+		npcm_i2c_read_from_fifo(bus, fifo_bytes);
+	} else {
+		npcm_i2c_read_from_fifo(bus, fifo_bytes);
+		rcount = bus->rd_size - bus->rd_ind;
+		npcm_i2c_set_fifo(bus, rcount, -1);
+	}
+}
+
+static void npcm_i2c_int_master_handler_write(struct npcm_i2c *bus)
+{
+	u16 wcount;
+
+	if (bus->fifo_use)
+		npcm_i2c_clear_tx_fifo(bus); // clear the TX fifo status bit
+
+	// Master write operation - last byte handling
+	if (bus->wr_ind == bus->wr_size) {
+		if (bus->fifo_use && npcm_i2c_fifo_usage(bus) > 0)
+			// No more bytes to send (to add to the FIFO),
+			// however the FIFO is not empty yet. It is
+			// still in the middle of tx. Currently there's nothing
+			// to do except for waiting to the end of the tx.
+			// We will get an int when the FIFO will get empty.
+			return;
+
+		if (bus->rd_size == 0) {
+			// all bytes have been written, in a pure wr operation
+			npcm_i2c_eob_int(bus, true);
+			bus->state = I2C_STOP_PENDING;
+			bus->stop_ind = I2C_MASTER_DONE_IND;
+			npcm_i2c_master_stop(bus);
+			// Clear SDA Status bit (by writing dummy byte)
+			npcm_i2c_wr_byte(bus, 0xFF);
+
+		} else {
+			// last write-byte written on previous int - need to
+			// restart & send slave address
+			npcm_i2c_set_fifo(bus, bus->rd_size, -1);
+			// Generate repeated start upon next write to SDA
+			npcm_i2c_master_start(bus);
+			if (bus->rd_size == 1)
+				// Receiving one byte only - stall after
+				// successful completion of send
+				// address byte. If we NACK here,
+				// and slave doesn't ACK the address, we
+				// might unintentionally NACK the next
+				// multi-byte read
+				npcm_i2c_stall_after_start(bus, true);
+
+			// Next int will occur on read
+			bus->operation = I2C_READ_OPER;
+			// send the slave address in read direction
+			npcm_i2c_wr_byte(bus, bus->dest_addr | 0x1);
+		}
+	} else {
+		// write next byte not last byte and not slave address
+		if (!bus->fifo_use || bus->wr_size == 1) {
+			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
+		} else {
+			wcount = bus->wr_size - bus->wr_ind;
+			npcm_i2c_set_fifo(bus, -1, wcount);
+			if (wcount)
+				npcm_i2c_write_to_fifo_master(bus, wcount);
+		}
+	}
+}
+
+static void npcm_i2c_int_master_handler_read(struct npcm_i2c *bus)
+{
+	u16 block_extra_bytes_size;
+	u8 data;
+
+	// Master read operation (pure read or following a write operation).
+
+	// added bytes to the packet:
+	block_extra_bytes_size = bus->read_block_use + bus->PEC_use;
+
+	// Perform master read, distinguishing between last byte and the rest of
+	// the bytes. The last byte should be read when the clock is stopped
+	if (bus->rd_ind == 0) { //first byte handling:
+		// in block protocol first byte is the size
+		if (bus->read_block_use) {
+			// first byte in block protocol is the size:
+			data = npcm_i2c_rd_byte(bus);
+			data = clamp_val(data, 1, I2C_SMBUS_BLOCK_MAX);
+			bus->rd_size = data + block_extra_bytes_size;
+			bus->rd_buf[bus->rd_ind++] = data;
+
+			// clear RX FIFO interrupt status:
+			if (bus->fifo_use) {
+				data = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+				data = data | NPCM_I2CFIF_CTS_RXF_TXE;
+				iowrite8(data, bus->reg + NPCM_I2CFIF_CTS);
+			}
+
+			npcm_i2c_set_fifo(bus, bus->rd_size - 1, -1);
+			npcm_i2c_stall_after_start(bus, false);
+		} else {
+			npcm_i2c_clear_tx_fifo(bus);
+			npcm_i2c_master_fifo_read(bus);
+		}
+	} else {
+		if (bus->rd_size == block_extra_bytes_size &&
+		    bus->read_block_use) {
+			bus->state = I2C_STOP_PENDING;
+			bus->stop_ind = I2C_BLOCK_BYTES_ERR_IND;
+			bus->cmd_err = -EIO;
+			npcm_i2c_eob_int(bus, true);
+			npcm_i2c_master_stop(bus);
+			npcm_i2c_read_from_fifo(bus, npcm_i2c_fifo_usage(bus));
+		} else {
+			npcm_i2c_master_fifo_read(bus);
+		}
+	}
+}
+
+static irqreturn_t npcm_i2c_int_master_handler(struct npcm_i2c *bus)
+{
+	irqreturn_t ret = IRQ_NONE;
+	u8 fif_cts;
+	u8 val;
+	u8 i2cst = ioread8(bus->reg + NPCM_I2CST);
+
+	if (FIELD_GET(NPCM_I2CST_NMATCH, i2cst)) {
+		iowrite8(NPCM_I2CST_NMATCH, bus->reg + NPCM_I2CST);
+		npcm_i2c_nack(bus);
+		bus->stop_ind = I2C_BUS_ERR_IND;
+		npcm_i2c_callback(bus, bus->stop_ind, npcm_i2c_get_index(bus));
+
+		return IRQ_HANDLED;
+	}
+	// A NACK has occurred
+	if (FIELD_GET(NPCM_I2CST_NEGACK, i2cst)) {
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+		if (bus->nack_count == ULLONG_MAX) {
+			dev_dbg(bus->dev, "%s reaches maximum, reset to 0",
+					   nack_cnt_name);
+			bus->nack_count = 0;
+		}
+		bus->nack_count++;
+#endif
+		if (bus->fifo_use) {
+			// if there are still untransmitted bytes in TX FIFO
+			// reduce them from wr_ind
+			if (bus->operation == I2C_WRITE_OPER)
+				bus->wr_ind -= npcm_i2c_fifo_usage(bus);
+
+			// clear the FIFO
+			iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO,
+				 bus->reg + NPCM_I2CFIF_CTS);
+		}
+
+		// In master write operation, NACK is a problem
+		// number of bytes sent to master less than required
+		bus->stop_ind = I2C_NACK_IND;
+		// Only current master is allowed to issue Stop Condition
+		if (npcm_i2c_is_master(bus)) {
+			// stopping in the middle, not waiting for ints anymore
+			npcm_i2c_eob_int(bus, false);
+
+			npcm_i2c_master_stop(bus);
+
+			// The bus is released from stall only
+			// after the software clears NEGACK bit.
+			// Then a Stop condition is sent.
+			npcm_i2c_clear_master_status(bus);
+
+			readx_poll_timeout_atomic(ioread8,
+						  bus->reg + NPCM_I2CCST, val,
+						  !(val & NPCM_I2CCST_BUSY), 10,
+						  200);
+
+		}
+		bus->state = I2C_IDLE;
+
+		// In Master mode, NACK should be cleared only after
+		// generating STOP.
+		// In such case, the bus is released from stall only after the
+		// software clears NACK bit.
+		// Then a Stop condition is sent.
+		npcm_i2c_callback(bus, bus->stop_ind, bus->wr_ind);
+		return IRQ_HANDLED;
+	}
+
+	// Master mode: a Bus Error has been identified
+	if (FIELD_GET(NPCM_I2CST_BER, i2cst)) {
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+		if (bus->ber_count == ULLONG_MAX) {
+			dev_dbg(bus->dev, "%s reach max, reset", ber_cnt_name);
+			bus->ber_count = 0;
+		}
+		bus->ber_count++;
+#endif
+		// Check whether bus arbitration or Start or Stop during data
+		// xfer bus arbitration problem should not result in recovery
+		bus->stop_ind = I2C_BUS_ERR_IND;
+		if (npcm_i2c_is_master(bus)) {
+			npcm_i2c_master_abort(bus);
+		} else {
+			npcm_i2c_clear_master_status(bus);
+
+			// Clear BB (BUS BUSY) bit
+			iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+
+			bus->cmd_err = -EAGAIN;
+			npcm_i2c_callback(bus, bus->stop_ind,
+					  npcm_i2c_get_index(bus));
+		}
+		bus->state = I2C_IDLE;
+		return IRQ_HANDLED;
+	}
+
+	// A Master End of Busy (meaning Stop Condition happened)
+	// End of Busy int is on and End of Busy is set
+	if ((FIELD_GET(NPCM_I2CCTL1_EOBINTE,
+		       ioread8(bus->reg + NPCM_I2CCTL1)) == 1) &&
+	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
+		       ioread8(bus->reg + NPCM_I2CCST3)))) {
+		npcm_i2c_eob_int(bus, false);
+		bus->state = I2C_IDLE;
+		npcm_i2c_callback(bus, bus->stop_ind, bus->rd_ind);
+		return IRQ_HANDLED;
+	}
+
+	// Address sent and requested stall occurred (Master mode)
+	if (FIELD_GET(NPCM_I2CST_STASTR, i2cst)) {
+		if (npcm_i2c_is_quick(bus)) {
+			bus->state = I2C_STOP_PENDING;
+			bus->stop_ind = I2C_MASTER_DONE_IND;
+			npcm_i2c_eob_int(bus, true);
+			npcm_i2c_master_stop(bus);
+		} else if ((bus->rd_size == 1) && !bus->read_block_use) {
+			// Receiving one byte only - set NACK after ensuring
+			// slave ACKed the address byte
+			npcm_i2c_nack(bus);
+		}
+
+		// Reset stall-after-address-byte
+		npcm_i2c_stall_after_start(bus, false);
+
+		// Clear stall only after setting STOP
+		iowrite8(NPCM_I2CST_STASTR, bus->reg + NPCM_I2CST);
+
+		ret =  IRQ_HANDLED;
+	}
+
+	// SDA status is set - TX or RX, master
+	if (FIELD_GET(NPCM_I2CST_SDAST, i2cst) ||
+	    (bus->fifo_use &&
+	    (npcm_i2c_tx_fifo_empty(bus) || npcm_i2c_rx_fifo_full(bus)))) {
+		// Status Bit is cleared by writing to or reading from SDA
+		// (depending on current direction)
+
+		// Send address:
+		if (bus->state == I2C_IDLE) {
+			if (npcm_i2c_is_master(bus)) {
+				bus->stop_ind = I2C_WAKE_UP_IND;
+
+				// test stall on start
+				if (npcm_i2c_is_quick(bus) ||
+				    bus->read_block_use)
+					// Need to stall after successful
+					// completion of sending address byte
+					npcm_i2c_stall_after_start(bus, true);
+				else
+					npcm_i2c_stall_after_start(bus, false);
+
+				// Receiving one byte only - stall after
+				// successful completion of sending address byte
+				// If we NACK here, and slave doesn't ACK the
+				// address, we might unintentionally NACK
+				// the next multi-byte read
+				if (bus->wr_size == 0 && bus->rd_size == 1)
+					npcm_i2c_stall_after_start(bus, true);
+
+				// Initiate I2C master transaction
+				// Generate a Start condition on the I2C
+
+				// select bank 1 for FIFO regs
+				npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+				fif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+				fif_cts = fif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR;
+
+				// clear FIFO and relevant status bits.
+				fif_cts = fif_cts | NPCM_I2CFIF_CTS_CLR_FIFO;
+				iowrite8(fif_cts, bus->reg + NPCM_I2CFIF_CTS);
+
+				// and enable it
+				fif_cts = fif_cts | NPCM_I2CFIF_CTS_RXF_TXE;
+				iowrite8(fif_cts, bus->reg + NPCM_I2CFIF_CTS);
+
+				// Configure the FIFO threshold
+				// according to the needed # of bytes to read.
+				// Note: due to HW limitation can't config the
+				// rx fifo before
+				// got and ACK on the restart. LAST bit will not
+				// be reset unless RX completed.
+				// It will stay set on the next tx.
+				if (bus->wr_size)
+					npcm_i2c_set_fifo(bus, -1,
+							  bus->wr_size);
+				else
+					npcm_i2c_set_fifo(bus, bus->rd_size,
+							  -1);
+
+				bus->state = I2C_OPER_STARTED;
+
+				if (npcm_i2c_is_quick(bus) || bus->wr_size)
+					npcm_i2c_wr_byte(bus, bus->dest_addr);
+				else
+					npcm_i2c_wr_byte(bus, bus->dest_addr |
+							      0x01);
+			}
+
+			return IRQ_HANDLED;
+		// SDA status is set - transmit or receive: Handle master mode
+		} else {
+			if (!(NPCM_I2CST_XMIT & i2cst)) {
+				bus->operation = I2C_READ_OPER;
+				npcm_i2c_int_master_handler_read(bus);
+			} else {
+				bus->operation = I2C_WRITE_OPER;
+				npcm_i2c_int_master_handler_write(bus);
+			}
+		}
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+// recovery using TGCLK functionality of the module
+static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
+{
+	u8               val;
+	u8               fif_cts;
+	bool             done = false;
+	int              status = -ENOTRECOVERABLE;
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+	// Allow 3 bytes (27 toggles) to be read from the slave:
+	int              iter = 27;
+
+	if ((npcm_i2c_get_SDA(_adap) == 1) && (npcm_i2c_get_SCL(_adap) == 1)) {
+		dev_dbg(bus->dev, "bus%d recovery skipped, bus not stuck",
+			bus->num);
+		npcm_i2c_reset(bus);
+		return status;
+	}
+
+	// Disable int
+	npcm_i2c_int_enable(bus, false);
+	npcm_i2c_disable(bus);
+	npcm_i2c_enable(bus);
+	iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+	npcm_i2c_clear_tx_fifo(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+	iowrite8(0, bus->reg + NPCM_I2CRXF_CTL);
+	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+	npcm_i2c_stall_after_start(bus, false);
+
+	// select bank 1 for FIFO regs
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	// clear FIFO and relevant status bits.
+	fif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+	fif_cts &= ~NPCM_I2CFIF_CTS_SLVRSTR;
+	fif_cts |= NPCM_I2CFIF_CTS_CLR_FIFO;
+	iowrite8(fif_cts, bus->reg + NPCM_I2CFIF_CTS);
+	npcm_i2c_set_fifo(bus, -1, 0);
+
+	// Repeat the following sequence until SDA is released
+	do {
+		// Issue a single SCL toggle
+		iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
+		udelay(20);
+		// If SDA line is inactive (high), stop
+		if (npcm_i2c_get_SDA(_adap)) {
+			done = true;
+			status = 0;
+		}
+	} while (!done && iter--);
+
+	// If SDA line is released: send start-addr-stop, to re-sync.
+	if (npcm_i2c_get_SDA(_adap)) {
+		// Send an address byte in write direction:
+		npcm_i2c_wr_byte(bus, bus->dest_addr);
+		npcm_i2c_master_start(bus);
+		// Wait until START condition is sent
+		status = readx_poll_timeout(npcm_i2c_get_SCL, _adap, val, !val,
+					    20, 200);
+		// If START condition was sent
+		if (npcm_i2c_is_master(bus) > 0) {
+
+			udelay(20);
+			npcm_i2c_master_stop(bus);
+			udelay(200);
+		}
+	}
+	npcm_i2c_reset(bus);
+	npcm_i2c_int_enable(bus, true);
+
+	if ((npcm_i2c_get_SDA(_adap) == 1) && (npcm_i2c_get_SCL(_adap) == 1))
+		status = 0;
+	else
+		status = -ENOTRECOVERABLE;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	if (!status) {
+		if (bus->rec_succ_count == ULLONG_MAX) {
+			dev_dbg(bus->dev,
+				"%s reaches maximum, reset to 0",
+				rec_succ_cnt_name);
+			bus->rec_succ_count = 0;
+		}
+		bus->rec_succ_count++;
+	} else {
+		if (bus->rec_succ_count == ULLONG_MAX) {
+			dev_dbg(bus->dev,
+				"%s reaches maximum, reset to 0",
+				rec_succ_cnt_name);
+			bus->rec_fail_count = 0;
+		}
+		bus->rec_fail_count++;
+	}
+#endif
+	return status;
+}
+
+// recovery using bit banging functionality of the module
+static int npcm_i2c_recovery_init(struct i2c_adapter *_adap)
+{
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+	struct i2c_bus_recovery_info *rinfo = &bus->rinfo;
+
+	rinfo->recover_bus = npcm_i2c_recovery_tgclk;
+	rinfo->prepare_recovery = NULL;
+	rinfo->unprepare_recovery = NULL;
+	rinfo->set_scl = NULL;
+	rinfo->set_sda = NULL;
+
+	dev_dbg(bus->dev, "init i2c recovery using TGCLK\n");
+
+	rinfo->get_scl = npcm_i2c_get_SCL;
+	rinfo->get_sda = npcm_i2c_get_SDA;
+
+	_adap->bus_recovery_info = rinfo;
+
+	return 0;
+}
+
+// SCLFRQ min/max field values
+#define SCLFRQ_MIN  10
+#define SCLFRQ_MAX  511
+
+/*
+ * npcm_i2c_init_clk: init HW timing parameters.
+ * NPCM7XX i2c module timing parameters are depenent on module core clk (APB)
+ * and bus frequency.
+ * 100kHz bus requires tSCL = 4 * SCLFRQ * tCLK. LT and HT are simetric.
+ * 400kHz bus requires assymetric HT and LT. A different equation is recomended
+ * by the HW designer, given core clock range (equations in comments below).
+ *
+ */
+static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq)
+{
+	u32  k1 = 0;
+	u32  k2 = 0;
+	u8   dbnct = 0;
+	u32  sclfrq = 0;
+	u8   hldt = 7;
+	bool fast_mode = false;
+	u32  src_clk_freq; // in KHz
+
+	src_clk_freq = bus->apb_clk / 1000;
+	bus->bus_freq = bus_freq;
+
+	// 100KHz and below:
+	if (bus_freq <= (I2C_MAX_STANDARD_MODE_FREQ / 1000)) {
+		sclfrq = src_clk_freq / (bus_freq * 4);
+
+		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
+			return -EDOM;
+
+		if (src_clk_freq >= 40000)
+			hldt = 17;
+		else if (src_clk_freq >= 12500)
+			hldt = 15;
+		else
+			hldt = 7;
+	}
+
+	// 400KHz:
+	else if (bus_freq <= (I2C_MAX_FAST_MODE_FREQ / 1000)) {
+		sclfrq = 0;
+		fast_mode = true;
+
+		if (src_clk_freq < 7500)
+			// 400KHZ cannot be supported for core clock < 7.5 MHZ
+			return -EDOM;
+
+		else if (src_clk_freq >= 50000) {
+			k1 = 80;
+			k2 = 48;
+			hldt = 12;
+			dbnct = 7;
+		}
+
+		// Master or Slave with frequency > 25 MHZ
+		else if (src_clk_freq > 25000) {
+			hldt = (DIV_ROUND_UP(src_clk_freq * 300,
+							 1000000) + 7) & 0xFF;
+
+			k1 = DIV_ROUND_UP(src_clk_freq * 1600,
+						   1000000);
+			k2 = DIV_ROUND_UP(src_clk_freq * 900,
+						   1000000);
+			k1 = round_up(k1, 2);
+			k2 = round_up(k2 + 1, 2);
+			if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
+			    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
+				return -EDOM;
+		}
+	}
+
+	else if (bus_freq <= (I2C_MAX_FAST_MODE_PLUS_FREQ / 1000)) {
+		sclfrq = 0;
+		fast_mode = true;
+
+		if (src_clk_freq < 24000)
+		// 1MHZ cannot be supported for master core clock < 15 MHZ
+		// or slave core clock < 24 MHZ
+			return -EDOM;
+
+		k1 = round_up((DIV_ROUND_UP(src_clk_freq * 620,
+						     1000000)), 2);
+		k2 = round_up((DIV_ROUND_UP(src_clk_freq * 380,
+						     1000000) + 1), 2);
+		if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
+		    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
+			return -EDOM;
+
+		// Core clk > 40 MHZ
+		if (src_clk_freq > 40000) {
+			// Set HLDT:
+			// SDA hold time:  (HLDT-7) * T(CLK) >= 120
+			// HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
+			hldt = (DIV_ROUND_UP(src_clk_freq * 120,
+							 1000000) + 7) & 0xFF;
+		} else {
+			hldt = 7;
+			dbnct = 2;
+		}
+	}
+
+	// Frequency larger than 1 MHZ is not supported
+	else
+		return false;
+
+	// After clock parameters calculation update reg (ENABLE should be 0):
+	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, sclfrq & 0x7F),
+		 bus->reg + NPCM_I2CCTL2);
+
+	// force to bank 0, set SCL and fast mode
+	iowrite8(FIELD_PREP(I2CCTL3_400K_MODE, fast_mode) |
+		 FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
+		 bus->reg + NPCM_I2CCTL3);
+
+	// Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5
+	npcm_i2c_select_bank(bus, I2C_BANK_0);
+
+	if (bus_freq >= (I2C_MAX_FAST_MODE_FREQ / 1000)) {
+		// Set SCL Low/High Time:
+		// k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
+		// k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
+		iowrite8((u8)k1 / 2, bus->reg + NPCM_I2CSCLLT);
+		iowrite8((u8)k2 / 2, bus->reg + NPCM_I2CSCLHT);
+
+		iowrite8(dbnct, bus->reg + NPCM_I2CCTL5);
+	}
+
+	iowrite8(hldt, bus->reg + NPCM_I2CCTL4);
+
+	// Return to Bank 1, and stay there by default:
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	return true;
+}
+
+static bool npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
+				 u32 bus_freq)
+{
+	u8 val;
+
+	// Check whether module already enabled or frequency is out of bounds
+	if ((bus->state != I2C_DISABLE && bus->state != I2C_IDLE) ||
+	    bus_freq < I2C_FREQ_MIN || bus_freq > I2C_FREQ_MAX)
+		return false;
+
+	npcm_i2c_disable(bus);
+
+	// Configure FIFO mode :
+	if (FIELD_GET(I2C_VER_FIFO_EN, ioread8(bus->reg + I2C_VER))) {
+		bus->fifo_use = true;
+		npcm_i2c_select_bank(bus, I2C_BANK_0);
+		val = ioread8(bus->reg + NPCM_I2CFIF_CTL);
+		val |= NPCM_I2CFIF_CTL_FIFO_EN;
+		iowrite8(val, bus->reg + NPCM_I2CFIF_CTL);
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+	} else {
+		bus->fifo_use = false;
+	}
+
+	// Configure I2C module clock frequency
+	if (!npcm_i2c_init_clk(bus, bus_freq)) {
+		dev_err(bus->dev, "npcm_i2c_init_clk failed\n");
+		return false;
+	}
+
+	// Enable module (before configuring CTL1)
+	npcm_i2c_enable(bus);
+	bus->state = I2C_IDLE;
+	val = ioread8(bus->reg + NPCM_I2CCTL1);
+	val = (val | NPCM_I2CCTL1_NMINTE) & ~NPCM_I2CCTL1_RWS;
+	iowrite8(val, bus->reg + NPCM_I2CCTL1);
+
+	npcm_i2c_int_enable(bus, true);
+
+	npcm_i2c_reset(bus);
+
+	return true;
+}
+
+static int __npcm_i2c_init(struct npcm_i2c *bus, struct platform_device *pdev)
+{
+	u32 clk_freq;
+	int ret;
+
+	// Initialize the internal data structures
+	bus->state = I2C_DISABLE;
+	bus->master_or_slave = I2C_SLAVE;
+	bus->int_time_stamp = 0;
+	bus->xmits = 0;
+
+	ret = device_property_read_u32(&pdev->dev, "bus-frequency", &clk_freq);
+	if (ret < 0) {
+		dev_info(&pdev->dev, "Could not read bus-frequency property\n");
+		clk_freq = 100000;
+	}
+
+	ret = npcm_i2c_init_module(bus, I2C_MASTER, clk_freq / 1000);
+	if (!ret) {
+		dev_err(&pdev->dev, "npcm_i2c_init_module failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
+{
+	irqreturn_t ret;
+	struct npcm_i2c *bus = dev_id;
+
+	bus->int_cnt++;
+
+	if (npcm_i2c_is_master(bus))
+		bus->master_or_slave = I2C_MASTER;
+
+	if (bus->master_or_slave == I2C_MASTER)	{
+		bus->int_time_stamp = jiffies;
+		ret = npcm_i2c_int_master_handler(bus);
+		if (ret == IRQ_HANDLED)
+			return ret;
+	}
+	return IRQ_HANDLED;
+}
+
+static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
+				       u8 slave_addr, u16 nwrite, u16 nread,
+				       u8 *write_data, u8 *read_data,
+				       bool use_PEC, bool use_read_block)
+{
+	if (bus->state != I2C_IDLE) {
+		bus->cmd_err = -EBUSY;
+		return false;
+	}
+	bus->xmits++;
+	bus->dest_addr = (slave_addr << 1) & 0xFE;
+	bus->wr_buf = write_data;
+	bus->wr_size = nwrite;
+	bus->wr_ind = 0;
+	bus->rd_buf = read_data;
+	bus->rd_size = nread;
+	bus->rd_ind = 0;
+	bus->PEC_use = 0;
+
+	// for write, PEC is appended to buffer from i2c IF. PEC flag is ignored
+	if (nread)
+		bus->PEC_use = use_PEC;
+	bus->read_block_use = use_read_block;
+	if (nread && !nwrite)
+		bus->operation = I2C_READ_OPER;
+	else
+		bus->operation = I2C_WRITE_OPER;
+	bus->int_cnt = 0;
+	if (bus->fifo_use) {
+		u8 i2cfif_cts;
+
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+		// clear FIFO and relevant status bits.
+		i2cfif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+		i2cfif_cts &= ~NPCM_I2CFIF_CTS_SLVRSTR;
+		i2cfif_cts |= NPCM_I2CFIF_CTS_CLR_FIFO;
+		iowrite8(i2cfif_cts, bus->reg + NPCM_I2CFIF_CTS);
+	}
+
+	bus->state = I2C_IDLE;
+
+	npcm_i2c_stall_after_start(bus, true);
+	npcm_i2c_master_start(bus);
+
+	return true;
+}
+
+static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				int num)
+{
+	struct npcm_i2c *bus = container_of(adap, struct npcm_i2c, adap);
+	struct i2c_msg *msg0, *msg1;
+	unsigned long time_left, flags;
+	u16 nwrite, nread;
+	u8 *write_data, *read_data;
+	u8 slave_addr;
+	int timeout;
+	int ret = 0;
+	bool read_block = false;
+	bool read_PEC = false;
+	u8 bus_busy;
+	unsigned long timeout_usec;
+
+	if (bus->state == I2C_DISABLE) {
+		dev_err(bus->dev, "I2C%d module is disabled", bus->num);
+		return -EINVAL;
+	}
+
+	if (num > 2 || num < 1) {
+		dev_err(bus->dev, "I2C cmd not supported num of msgs=%d", num);
+		return -EINVAL;
+	}
+
+	msg0 = &msgs[0];
+	slave_addr = msg0->addr;
+	if (msg0->flags & I2C_M_RD) { // read
+		if (num == 2) {
+			dev_err(bus->dev, "num=2 but 1st msg rd instead of wr");
+			return -EINVAL;
+		}
+		nwrite = 0;
+		write_data = NULL;
+		read_data = msg0->buf;
+		if (msg0->flags & I2C_M_RECV_LEN) {
+			nread = 1;
+			read_block = true;
+			if (msg0->flags & I2C_CLIENT_PEC)
+				read_PEC = true;
+		} else {
+			nread = msg0->len;
+		}
+	} else { // write
+		nwrite = msg0->len;
+		write_data = msg0->buf;
+		nread = 0;
+		read_data = NULL;
+		if (num == 2) {
+			msg1 = &msgs[1];
+			read_data = msg1->buf;
+			if (slave_addr != msg1->addr) {
+				dev_err(bus->dev,
+					"SA==%02x but msg1->addr==%02x\n",
+				       slave_addr, msg1->addr);
+				return -EINVAL;
+			}
+			if ((msg1->flags & I2C_M_RD) == 0) {
+				dev_err(bus->dev,
+					"num = 2 but both msg are write.\n");
+				return -EINVAL;
+			}
+			if (msg1->flags & I2C_M_RECV_LEN) {
+				nread = 1;
+				read_block = true;
+				if (msg1->flags & I2C_CLIENT_PEC)
+					read_PEC = true;
+			} else {
+				nread = msg1->len;
+				read_block = false;
+			}
+		}
+	}
+
+	/* Adaptive TimeOut: astimated time in usec  + 100% margin */
+	timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
+	timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
+	if (nwrite >= 32 * 1024 ||  nread >= 32 * 1024) {
+		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
+		return -EINVAL;
+	}
+
+	time_left = jiffies +
+		    msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
+	do {
+		/* we must clear slave address immediately when the bus is not
+		 * busy, so we spinlock it, but we don't keep the lock for the
+		 * entire while since it is too long.
+		 */
+		spin_lock_irqsave(&bus->lock, flags);
+		bus_busy = ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BB;
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+	} while (time_is_after_jiffies(time_left) && bus_busy);
+
+	if (bus_busy) {
+		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+		npcm_i2c_reset(bus);
+		i2c_recover_bus(adap);
+		return -EAGAIN;
+	}
+
+	npcm_i2c_init_params(bus);
+	bus->dest_addr = slave_addr;
+	bus->msgs = msgs;
+	bus->msgs_num = num;
+	bus->cmd_err = 0;
+	bus->read_block_use = read_block;
+
+	reinit_completion(&bus->cmd_complete);
+
+	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+					write_data, read_data, read_PEC,
+					read_block))
+		ret = -EBUSY;
+
+	if (ret != -EBUSY) {
+		time_left = wait_for_completion_timeout(&bus->cmd_complete,
+							timeout);
+
+		if (time_left == 0) {
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+			if (bus->timeout_count == ULLONG_MAX) {
+				dev_dbg(bus->dev,
+					"%s reaches to maximum, reset to 0",
+					timeout_cnt_name);
+				bus->timeout_count = 0;
+			}
+			bus->timeout_count++;
+#endif
+			if (bus->master_or_slave == I2C_MASTER) {
+				i2c_recover_bus(adap);
+				bus->cmd_err = -EIO;
+				bus->state = I2C_IDLE;
+			}
+		}
+	}
+	ret = bus->cmd_err;
+
+	// if there was BER, check if need to recover the bus:
+	if (bus->cmd_err == -EAGAIN)
+		ret = i2c_recover_bus(adap);
+
+	return bus->cmd_err;
+}
+
+static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C |
+	       I2C_FUNC_SMBUS_EMUL |
+	       I2C_FUNC_SMBUS_BLOCK_DATA |
+	       I2C_FUNC_SMBUS_PEC |
+	       I2C_FUNC_SLAVE;
+}
+
+static const struct i2c_adapter_quirks npcm_i2c_quirks = {
+	.max_read_len = 32768,
+	.max_write_len = 32768,
+	.max_num_msgs = 2,
+	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
+};
+
+static const struct i2c_algorithm npcm_i2c_algo = {
+	.master_xfer = npcm_i2c_master_xfer,
+	.functionality = npcm_i2c_functionality,
+};
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int i2c_debugfs_get(void *data, u64 *val)
+{
+	*val = *(u64 *)(data);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(i2c_debugfs_ops, i2c_debugfs_get, NULL, "0x%02llx\n");
+
+static int i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
+{
+	if (!npcm_i2c_debugfs_dir)
+		return -ENODEV;
+
+	if (!pdev || !bus)
+		return -ENODEV;
+
+	bus->debugfs = debugfs_create_dir(dev_name(&pdev->dev),
+					  npcm_i2c_debugfs_dir);
+
+	if (IS_ERR_OR_NULL(bus->debugfs)) {
+		bus->debugfs = NULL;
+		return -ENODEV;
+	}
+
+	debugfs_create_file(ber_cnt_name, 0444, bus->debugfs,
+			    &bus->ber_count,
+			    &i2c_debugfs_ops);
+
+	debugfs_create_file(rec_succ_cnt_name, 0444, bus->debugfs,
+			    &bus->rec_succ_count,
+			    &i2c_debugfs_ops);
+
+	debugfs_create_file(rec_fail_cnt_name, 0444, bus->debugfs,
+			    &bus->rec_fail_count,
+			    &i2c_debugfs_ops);
+
+	debugfs_create_file(nack_cnt_name, 0444, bus->debugfs,
+			    &bus->nack_count,
+			    &i2c_debugfs_ops);
+
+	debugfs_create_file(timeout_cnt_name, 0444, bus->debugfs,
+			    &bus->timeout_count,
+			    &i2c_debugfs_ops);
+
+	return 0;
+}
+#endif
+
+static int  npcm_i2c_probe_bus(struct platform_device *pdev)
+{
+	struct npcm_i2c *bus;
+	struct i2c_adapter *adap;
+	struct clk *i2c_clk;
+	static struct regmap *gcr_regmap;
+	static struct regmap *clk_regmap;
+	int ret;
+	int num;
+
+	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
+	if (!bus)
+		return -ENOMEM;
+
+	bus->dev = &pdev->dev;
+
+	num = of_alias_get_id(pdev->dev.of_node, "i2c");
+	bus->num = num;
+	// core clk must be acquired to calculate module timing settings
+	i2c_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(i2c_clk))
+		return PTR_ERR(i2c_clk);
+	bus->apb_clk = clk_get_rate(i2c_clk);
+
+	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	if (IS_ERR(gcr_regmap))
+		return IS_ERR(gcr_regmap);
+	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
+
+	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
+	if (IS_ERR(clk_regmap))
+		return IS_ERR(clk_regmap);
+
+	bus->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bus->reg))
+		return PTR_ERR((bus)->reg);
+
+	spin_lock_init(&bus->lock);
+	init_completion(&bus->cmd_complete);
+
+	adap = &bus->adap;
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD | I2C_CLIENT_SLAVE;
+	adap->retries = 3;
+	adap->timeout = HZ;
+	adap->algo = &npcm_i2c_algo;
+	adap->quirks = &npcm_i2c_quirks;
+	adap->algo_data = bus;
+	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
+	adap->nr = pdev->id;
+
+	bus->irq = platform_get_irq(pdev, 0);
+	if (bus->irq < 0) {
+		dev_err(&pdev->dev, "failed to get IRQ number\n");
+		return bus->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, bus->irq, npcm_i2c_bus_irq, 0,
+			       dev_name(&pdev->dev), bus);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d\n", ret);
+		return ret;
+	}
+
+	ret = __npcm_i2c_init(bus, pdev);
+	if (ret < 0)
+		return ret;
+
+	ret = npcm_i2c_recovery_init(adap);
+	if (ret)
+		return ret;
+
+	i2c_set_adapdata(adap, bus);
+
+	snprintf(bus->adap.name, sizeof(bus->adap.name), "Nuvoton i2c");
+	ret = i2c_add_numbered_adapter(&bus->adap);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add numbered adapter %d\n", ret);
+		return ret;
+	}
+	platform_set_drvdata(pdev, bus);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	ret = i2c_init_debugfs(pdev, bus);
+	if (ret < 0)
+		return ret;
+#endif
+	return 0;
+}
+
+static int  npcm_i2c_remove_bus(struct platform_device *pdev)
+{
+	unsigned long lock_flags;
+	struct npcm_i2c *bus = platform_get_drvdata(pdev);
+
+	spin_lock_irqsave(&bus->lock, lock_flags);
+	npcm_i2c_disable(bus);
+	spin_unlock_irqrestore(&bus->lock, lock_flags);
+	i2c_del_adapter(&bus->adap);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	if (!!bus->debugfs) {
+		debugfs_remove_recursive(bus->debugfs);
+		bus->debugfs = NULL;
+	}
+#endif
+
+	return 0;
+}
+
+static const struct of_device_id npcm_i2c_bus_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-i2c", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
+
+static struct platform_driver npcm_i2c_bus_driver = {
+	.probe = npcm_i2c_probe_bus,
+	.remove = npcm_i2c_remove_bus,
+	.driver = {
+		.name = "nuvoton-i2c",
+		.of_match_table = npcm_i2c_bus_of_table,
+	}
+};
+module_platform_driver(npcm_i2c_bus_driver);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int __init npcm_i2c_init(void)
+{
+	npcm_i2c_debugfs_dir = debugfs_create_dir("i2c", NULL);
+	if (IS_ERR_OR_NULL(npcm_i2c_debugfs_dir)) {
+		pr_warn("i2c init of debugfs failed\n");
+		npcm_i2c_debugfs_dir = NULL;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void __exit npcm_i2c_exit(void)
+{
+	if (!!npcm_i2c_debugfs_dir) {
+		debugfs_remove_recursive(npcm_i2c_debugfs_dir);
+		npcm_i2c_debugfs_dir = NULL;
+	}
+}
+
+module_init(npcm_i2c_init);
+module_exit(npcm_i2c_exit);
+#endif
+
+MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
+MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
+MODULE_AUTHOR("Tyrone Ting <kfting@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton I2C Bus Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("0.1.2");
+
-- 
2.22.0

