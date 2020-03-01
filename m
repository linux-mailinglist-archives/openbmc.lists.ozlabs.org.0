Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52391750E7
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 00:10:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VzWz0g1CzDqnT
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 10:10:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VzV567GszDqvN
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 10:08:45 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 021MWhlo010915;
 Mon, 2 Mar 2020 00:32:43 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 2B4116032E; Mon,  2 Mar 2020 00:32:43 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: brendanhiggins@google.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 kfting@nuvoton.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, robh+dt@kernel.org, wsa@the-dreams.de,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v8 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
Date: Mon,  2 Mar 2020 00:32:00 +0200
Message-Id: <20200301223201.185450-3-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200301223201.185450-1-tali.perry1@gmail.com>
References: <20200301223201.185450-1-tali.perry1@gmail.com>
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
 drivers/i2c/busses/i2c-npcm7xx.c | 1888 ++++++++++++++++++++++++++++++
 3 files changed, 1898 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 146ce40d8e0a..833349971260 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -786,6 +786,15 @@ config I2C_NOMADIK
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
index 3ab8aebc39c9..4af59a806f3c 100644
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
index 000000000000..cef5288f0394
--- /dev/null
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -0,0 +1,1888 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM7xx I2C Controller driver
+ *
+ * Copyright (C) 2020 Nuvoton Technologies tali.perry@nuvoton.com
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/jiffies.h>
+
+enum i2c_mode {
+	I2C_MASTER,
+	I2C_SLAVE
+};
+
+/*
+ * External I2C Interface driver xfer indication values, which indicate status
+ * of the bus.
+ */
+enum i2c_state_ind {
+	I2C_NO_STATUS_IND = 0,
+	I2C_SLAVE_RCV_IND = 1,
+	I2C_SLAVE_XMIT_IND = 2,
+	I2C_SLAVE_XMIT_MISSING_DATA_IND = 3,
+	I2C_SLAVE_RESTART_IND = 4,
+	I2C_SLAVE_DONE_IND = 5,
+	I2C_MASTER_DONE_IND = 6,
+	I2C_NACK_IND = 8,
+	I2C_BUS_ERR_IND = 9,
+	I2C_WAKE_UP_IND = 10,
+	I2C_BLOCK_BYTES_ERR_IND = 12,
+	I2C_SLAVE_RCV_MISSING_DATA_IND = 14,
+};
+
+// I2Cus Operation type values
+enum i2c_oper {
+	I2C_NO_OPER = 0,
+	I2C_WRITE_OPER = 1,
+	I2C_READ_OPER = 2
+};
+
+// I2Cus Bank (FIFO mode)
+enum i2c_bank {
+	I2C_BANK_0 = 0,
+	I2C_BANK_1 = 1
+};
+
+// Internal I2C states values (for the I2C module state machine).
+enum i2c_state {
+	I2C_DISABLE = 0,
+	I2C_IDLE,
+	I2C_MASTER_START,
+	I2C_SLAVE_MATCH,
+	I2C_OPER_STARTED,
+	I2C_STOP_PENDING
+};
+
+// init register and default value required to enable module
+#define NPCM_I2CSEGCTL  0xE4
+#define I2CSEGCTL_VAL	0x0333F000
+
+// Common regs
+#define NPCM_I2CSDA			0x00
+#define NPCM_I2CST			0x02
+#define NPCM_I2CCST			0x04
+#define NPCM_I2CCTL1			0x06
+#define NPCM_I2CADDR1			0x08
+#define NPCM_I2CCTL2			0x0A
+#define NPCM_I2CADDR2			0x0C
+#define NPCM_I2CCTL3			0x0E
+#define NPCM_I2CCST2			0x18
+#define NPCM_I2CCST3			0x19
+#define I2C_VER				0x1F
+
+// BANK 0 regs
+#define NPCM_I2CADDR3			0x10
+#define NPCM_I2CADDR7			0x11
+#define NPCM_I2CADDR4			0x12
+#define NPCM_I2CADDR8			0x13
+#define NPCM_I2CADDR5			0x14
+#define NPCM_I2CADDR9			0x15
+#define NPCM_I2CADDR6			0x16
+#define NPCM_I2CADDR10			0x17
+
+#define NPCM_I2CCTL4			0x1A
+#define NPCM_I2CCTL5			0x1B
+#define NPCM_I2CSCLLT			0x1C // SCL Low Time
+#define NPCM_I2CFIF_CTL			0x1D // FIFO Control
+#define NPCM_I2CSCLHT			0x1E // SCL High Time
+
+// BANK 1 regs
+#define NPCM_I2CFIF_CTS			0x10 // Both FIFOs Control and status
+#define NPCM_I2CTXF_CTL			0x12 // Tx-FIFO Control
+#define NPCM_I2CT_OUT			0x14 // Bus T.O.
+#define NPCM_I2CPEC			0x16 // PEC Data
+#define NPCM_I2CTXF_STS			0x1A // Tx-FIFO Status
+#define NPCM_I2CRXF_STS			0x1C // Rx-FIFO Status
+#define NPCM_I2CRXF_CTL			0x1E // Rx-FIFO Control
+
+// NPCM_I2CST reg fields
+#define NPCM_I2CST_XMIT			BIT(0)
+#define NPCM_I2CST_MASTER		BIT(1)
+#define NPCM_I2CST_NMATCH		BIT(2)
+#define NPCM_I2CST_STASTR		BIT(3)
+#define NPCM_I2CST_NEGACK		BIT(4)
+#define NPCM_I2CST_BER			BIT(5)
+#define NPCM_I2CST_SDAST		BIT(6)
+#define NPCM_I2CST_SLVSTP		BIT(7)
+
+// NPCM_I2CCST reg fields
+#define NPCM_I2CCST_BUSY		BIT(0)
+#define NPCM_I2CCST_BB			BIT(1)
+#define NPCM_I2CCST_MATCH		BIT(2)
+#define NPCM_I2CCST_GCMATCH		BIT(3)
+#define NPCM_I2CCST_TSDA		BIT(4)
+#define NPCM_I2CCST_TGSCL		BIT(5)
+#define NPCM_I2CCST_MATCHAF		BIT(6)
+#define NPCM_I2CCST_ARPMATCH		BIT(7)
+
+// NPCM_I2CCTL1 reg fields
+#define NPCM_I2CCTL1_START		BIT(0)
+#define NPCM_I2CCTL1_STOP		BIT(1)
+#define NPCM_I2CCTL1_INTEN		BIT(2)
+#define NPCM_I2CCTL1_EOBINTE		BIT(3)
+#define NPCM_I2CCTL1_ACK		BIT(4)
+#define NPCM_I2CCTL1_GCMEN		BIT(5)
+#define NPCM_I2CCTL1_NMINTE		BIT(6)
+#define NPCM_I2CCTL1_STASTRE		BIT(7)
+
+// RW1S fields (inside a RW reg):
+#define NPCM_I2CCTL1_RWS_FIELDS	  (NPCM_I2CCTL1_START | NPCM_I2CCTL1_STOP | \
+				   NPCM_I2CCTL1_ACK)
+
+// npcm_i2caddr reg fields
+#define NPCM_I2CADDR_A			GENMASK(6, 0)
+#define NPCM_I2CADDR_SAEN		BIT(7)
+
+// NPCM_I2CCTL2 reg fields
+#define I2CCTL2_ENABLE			BIT(0)
+#define I2CCTL2_SCLFRQ6_0		GENMASK(7, 1)
+
+// NPCM_I2CCTL3 reg fields
+#define I2CCTL3_SCLFRQ8_7		GENMASK(1, 0)
+#define I2CCTL3_ARPMEN			BIT(2)
+#define I2CCTL3_IDL_START		BIT(3)
+#define I2CCTL3_400K_MODE		BIT(4)
+#define I2CCTL3_BNK_SEL			BIT(5)
+#define I2CCTL3_SDA_LVL			BIT(6)
+#define I2CCTL3_SCL_LVL			BIT(7)
+
+// NPCM_I2CCST2 reg fields
+#define NPCM_I2CCST2_MATCHA1F		BIT(0)
+#define NPCM_I2CCST2_MATCHA2F		BIT(1)
+#define NPCM_I2CCST2_MATCHA3F		BIT(2)
+#define NPCM_I2CCST2_MATCHA4F		BIT(3)
+#define NPCM_I2CCST2_MATCHA5F		BIT(4)
+#define NPCM_I2CCST2_MATCHA6F		BIT(5)
+#define NPCM_I2CCST2_MATCHA7F		BIT(5)
+#define NPCM_I2CCST2_INTSTS		BIT(7)
+
+// NPCM_I2CCST3 reg fields
+#define NPCM_I2CCST3_MATCHA8F		BIT(0)
+#define NPCM_I2CCST3_MATCHA9F		BIT(1)
+#define NPCM_I2CCST3_MATCHA10F		BIT(2)
+#define NPCM_I2CCST3_EO_BUSY		BIT(7)
+
+// NPCM_I2CCTL4 reg fields
+#define I2CCTL4_HLDT			GENMASK(5, 0)
+#define I2CCTL4_LVL_WE			BIT(7)
+
+// NPCM_I2CCTL5 reg fields
+#define I2CCTL5_DBNCT			GENMASK(3, 0)
+
+// NPCM_I2CFIF_CTS reg fields
+#define NPCM_I2CFIF_CTS_RXF_TXE		BIT(1)
+#define NPCM_I2CFIF_CTS_RFTE_IE		BIT(3)
+#define NPCM_I2CFIF_CTS_CLR_FIFO	BIT(6)
+#define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
+
+// NPCM_I2CTXF_CTL reg fields
+#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
+#define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
+
+// NPCM_I2CT_OUT reg fields
+#define NPCM_I2CT_OUT_TO_CKDIV		GENMASK(5, 0)
+#define NPCM_I2CT_OUT_T_OUTIE		BIT(6)
+#define NPCM_I2CT_OUT_T_OUTST		BIT(7)
+
+// NPCM_I2CTXF_STS reg fields
+#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
+#define NPCM_I2CTXF_STS_TX_THST		BIT(6)
+
+// NPCM_I2CRXF_STS reg fields
+#define NPCM_I2CRXF_STS_RX_BYTES	GENMASK(4, 0)
+#define NPCM_I2CRXF_STS_RX_THST		BIT(6)
+
+// NPCM_I2CFIF_CTL reg fields
+#define NPCM_I2CFIF_CTL_FIFO_EN		BIT(4)
+
+// NPCM_I2CRXF_CTL reg fields
+#define NPCM_I2CRXF_CTL_RX_THR		GENMASK(4, 0)
+#define NPCM_I2CRXF_CTL_LAST_PEC	BIT(5)
+#define NPCM_I2CRXF_CTL_THR_RXIE	BIT(6)
+
+#define I2C_HW_FIFO_SIZE			16
+
+// I2C_VER reg fields
+#define I2C_VER_VERSION			GENMASK(6, 0)
+#define I2C_VER_FIFO_EN			BIT(7)
+
+// stall/stuck timeout
+const unsigned int DEFAULT_STALL_COUNT =	25;
+
+// retries in a loop for master abort
+const unsigned int RETRIES_NUM =	10000;
+
+// clk settings. values in KHZ.
+// The HW has different configuration modes per range
+// each range handled separetly
+const unsigned int I2C_FREQ_MIN = 10;
+const unsigned int I2C_FREQ_MAX = 1000;
+const unsigned int I2C_FREQ_100KHZ = 100;
+const unsigned int I2C_FREQ_400KHZ = 400;
+const unsigned int I2C_FREQ_1MHZ = 1000;
+
+// SCLFRQ min/max field values
+const unsigned int SCLFRQ_MIN = 10;
+const unsigned int SCLFRQ_MAX = 511;
+
+// SCLFRQ field position
+#define SCLFRQ_0_TO_6		GENMASK(6, 0)
+#define SCLFRQ_7_TO_8		GENMASK(8, 7)
+
+const unsigned int I2C_NUM_OF_ADDR = 10;
+
+#define NPCM_I2C_EVENT_START	BIT(0)
+#define NPCM_I2C_EVENT_STOP	BIT(1)
+#define NPCM_I2C_EVENT_ABORT	BIT(2)
+#define NPCM_I2C_EVENT_WRITE	BIT(3)
+
+#define NPCM_I2C_EVENT_READ	BIT(4)
+#define NPCM_I2C_EVENT_BER	BIT(5)
+#define NPCM_I2C_EVENT_NACK	BIT(6)
+#define NPCM_I2C_EVENT_TO	BIT(7)
+
+#define NPCM_I2C_EVENT_EOB	BIT(8)
+#define NPCM_I2C_EVENT_STALL	BIT(9)
+#define NPCM_I2C_EVENT_CB	BIT(10)
+#define NPCM_I2C_EVENT_DONE	BIT(11)
+
+#define NPCM_I2C_EVENT_READ1	BIT(12)
+#define NPCM_I2C_EVENT_READ2	BIT(13)
+#define NPCM_I2C_EVENT_READ3	BIT(14)
+#define NPCM_I2C_EVENT_READ4	BIT(15)
+
+#define NPCM_I2C_EVENT_NMATCH_SLV	BIT(16)
+#define NPCM_I2C_EVENT_NMATCH_MSTR	BIT(17)
+#define NPCM_I2C_EVENT_BER_SLV		BIT(18)
+
+#define NPCM_I2C_EVENT_LOG(event)	(bus->event_log |= event)
+
+// Status of one I2C module
+struct npcm_i2c {
+	struct i2c_adapter	adap;
+	struct device		*dev;
+	unsigned char __iomem	*reg;
+	spinlock_t		lock;   /* IRQ synchronization */
+	struct completion	cmd_complete;
+	int			irq;
+	int			cmd_err;
+	struct i2c_msg		*msgs;
+	int			msgs_num;
+	int			num;
+	u32			apb_clk;
+	struct i2c_bus_recovery_info rinfo;
+	enum i2c_state		state;
+	enum i2c_oper		operation;
+	enum i2c_mode		master_or_slave;
+	enum i2c_state_ind	stop_ind;
+	u8			dest_addr;
+	u8			*rd_buf;
+	u16			rd_size;
+	u16			rd_ind;
+	u8			*wr_buf;
+	u16			wr_size;
+	u16			wr_ind;
+	bool			fifo_use;
+
+	// PEC bit mask per slave address.
+	//		1: use PEC for this address,
+	//		0: do not use PEC for this address
+	u16			PEC_mask;
+	bool			PEC_use;
+	bool			read_block_use;
+	u8			int_cnt;
+	u32			event_log;
+	u32			event_log_prev;
+	u32			clk_period_us;
+	unsigned long		int_time_stamp;
+	unsigned long		bus_freq; // in kHz
+	u32			xmits;
+
+};
+
+static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
+					enum i2c_bank bank)
+{
+	if (bank == I2C_BANK_0)
+		iowrite8(ioread8(bus->reg + NPCM_I2CCTL3) & ~I2CCTL3_BNK_SEL,
+			 bus->reg + NPCM_I2CCTL3);
+	else
+		iowrite8(ioread8(bus->reg + NPCM_I2CCTL3) | I2CCTL3_BNK_SEL,
+			 bus->reg + NPCM_I2CCTL3);
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
+	bus->event_log_prev = bus->event_log;
+	bus->event_log = 0;
+	bus->read_block_use = false;
+	bus->int_time_stamp = 0;
+	bus->PEC_use = false;
+	bus->PEC_mask = 0;
+	if (bus->slave)
+		bus->master_or_slave = I2C_SLAVE;
+}
+
+static inline void npcm_i2c_wr_byte(struct npcm_i2c *bus, u8 data)
+{
+	iowrite8(data, bus->reg + NPCM_I2CSDA);
+}
+
+static inline void npcm_i2c_rd_byte(struct npcm_i2c *bus, u8 *data)
+{
+	*data = ioread8(bus->reg + NPCM_I2CSDA);
+}
+
+static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
+{
+	u16 index = 0;
+
+	if (bus->operation == I2C_READ_OPER)
+		index = bus->rd_ind;
+	else if (bus->operation == I2C_WRITE_OPER)
+		index = bus->wr_ind;
+
+	return index;
+}
+
+// quick protocol (just address):
+static inline bool npcm_i2c_is_quick(struct npcm_i2c *bus)
+{
+	if (bus->wr_size == 0 && bus->rd_size == 0)
+		return true;
+	return false;
+}
+
+static void npcm_i2c_disable(struct npcm_i2c *bus)
+{
+	int i;
+
+	// select bank 0 for I2C addresses
+	npcm_i2c_select_bank(bus, I2C_BANK_0);
+
+	// Slave addresses removal
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OF_ADDR; i++)
+		iowrite8(0, bus->reg + npcm_i2caddr[i]);
+
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	// Disable module.
+	iowrite8(ioread8(bus->reg + NPCM_I2CCTL2) & ~I2CCTL2_ENABLE,
+		 bus->reg + NPCM_I2CCTL2);
+
+	bus->state = I2C_DISABLE;
+}
+
+static void npcm_i2c_enable(struct npcm_i2c *bus)
+{
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL2) | I2CCTL2_ENABLE),
+		 bus->reg + NPCM_I2CCTL2);
+
+	bus->state = I2C_IDLE;
+}
+
+static bool npcm_i2c_wait_for_bus_free(struct npcm_i2c *bus, bool may_sleep)
+{
+	int cnt = 0;
+	int max_count = 2; /* wait for 2 ms */
+
+	if (may_sleep)
+		might_sleep();
+	else
+		max_count = max_count * 100; /* since each delay is 10 us */
+
+	while  (ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BUSY) {
+		if (cnt < max_count) {
+			if (may_sleep)
+				msleep_interruptible(1);
+			else
+				udelay(10);
+			cnt++;
+
+		} else {
+			bus->cmd_err = -EAGAIN;
+			return false;
+		}
+	}
+	return true;
+}
+
+// enable\disable end of busy (EOB) interrupt
+static inline void npcm_i2c_eob_int(struct npcm_i2c *bus, bool enable)
+{
+	// Clear EO_BUSY pending bit:
+	iowrite8(ioread8(bus->reg + NPCM_I2CCST3) | NPCM_I2CCST3_EO_BUSY,
+		 bus->reg + NPCM_I2CCST3);
+
+	if (enable) {
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) |
+			 NPCM_I2CCTL1_EOBINTE)  & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+	} else {
+		iowrite8(ioread8(bus->reg + NPCM_I2CCTL1) &
+			 ~NPCM_I2CCTL1_EOBINTE & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+	}
+}
+
+static inline bool npcm_i2c_tx_fifo_empty(struct npcm_i2c *bus)
+{
+	u8 tx_fifo_sts = ioread8(bus->reg + NPCM_I2CTXF_STS);
+
+	// check if TX FIFO is not empty
+	if ((tx_fifo_sts & NPCM_I2CTXF_STS_TX_BYTES) == 0)
+		return false;
+
+	// check if TX FIFO status bit is set:
+	return (bool)FIELD_GET(NPCM_I2CTXF_STS_TX_THST, tx_fifo_sts);
+}
+
+static inline bool npcm_i2c_rx_fifo_full(struct npcm_i2c *bus)
+{
+	u8 rx_fifo_sts = ioread8(bus->reg + NPCM_I2CRXF_STS);
+
+	// check if RX FIFO is not empty:
+	if ((rx_fifo_sts & NPCM_I2CRXF_STS_RX_BYTES) == 0)
+		return false;
+
+	// check if rx fifo full status is set:
+	return (bool)FIELD_GET(NPCM_I2CRXF_STS_RX_THST, rx_fifo_sts);
+}
+
+static inline void npcm_i2c_clear_fifo_int(struct npcm_i2c *bus)
+{
+	iowrite8((ioread8(bus->reg + NPCM_I2CFIF_CTS) &
+			NPCM_I2CFIF_CTS_SLVRSTR) |
+			NPCM_I2CFIF_CTS_RXF_TXE,
+			bus->reg + NPCM_I2CFIF_CTS);
+}
+
+static inline void npcm_i2c_clear_tx_fifo(struct npcm_i2c *bus)
+{
+	iowrite8(ioread8(bus->reg + NPCM_I2CTXF_STS) | NPCM_I2CTXF_STS_TX_THST,
+		 bus->reg + NPCM_I2CTXF_STS);
+}
+
+static inline void npcm_i2c_clear_rx_fifo(struct npcm_i2c *bus)
+{
+	iowrite8(ioread8(bus->reg + NPCM_I2CRXF_STS) | NPCM_I2CRXF_STS_RX_THST,
+		 bus->reg + NPCM_I2CRXF_STS);
+}
+
+static void npcm_i2c_int_enable(struct npcm_i2c *bus, bool enable)
+{
+	if (enable)
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) |
+			 NPCM_I2CCTL1_INTEN) & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+	else
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) &
+			 ~NPCM_I2CCTL1_INTEN) & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_master_start(struct npcm_i2c *bus)
+{
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_START);
+
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_START) &
+		 ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK),
+		 bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_master_stop(struct npcm_i2c *bus)
+{
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_STOP);
+
+	// override HW issue: I2Cus may fail to supply stop condition in Master
+	// Write operation.
+	// Need to delay at least 5 us from the last int, before issueing a stop
+	udelay(10);
+
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_STOP) &
+		 ~(NPCM_I2CCTL1_START | NPCM_I2CCTL1_ACK),
+		 bus->reg + NPCM_I2CCTL1);
+
+	if (bus->fifo_use) {
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+		if (bus->operation == I2C_READ_OPER)
+			npcm_i2c_clear_rx_fifo(bus);
+		else
+			npcm_i2c_clear_tx_fifo(bus);
+
+		npcm_i2c_clear_fifo_int(bus);
+
+		iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+	}
+}
+
+static inline void npcm_i2c_stall_after_start(struct npcm_i2c *bus, bool stall)
+{
+	if (stall)
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) |
+			 NPCM_I2CCTL1_STASTRE)  & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+	else
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) &
+			 ~NPCM_I2CCTL1_STASTRE)  & ~NPCM_I2CCTL1_RWS_FIELDS,
+			 bus->reg + NPCM_I2CCTL1);
+}
+
+static inline void npcm_i2c_nack(struct npcm_i2c *bus)
+{
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_ACK) &
+		 ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_START),
+		 bus->reg + NPCM_I2CCTL1);
+}
+
+static int  npcm_i2c_slave_enable_l(struct npcm_i2c *bus,
+				    enum i2c_addr addr_type, u8 addr,
+				    bool enable);
+
+static void npcm_i2c_reset(struct npcm_i2c *bus)
+{
+	// Save NPCM_I2CCTL1 relevant bits. It is being cleared when the
+	// module is disabled
+	u8 i2cctl1;
+
+	i2cctl1 = ioread8(bus->reg + NPCM_I2CCTL1);
+
+	// Disable the I2C module
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL2) & ~I2CCTL2_ENABLE),
+		 bus->reg + NPCM_I2CCTL2);
+
+	// Enable the I2C module
+	npcm_i2c_enable(bus);
+
+	// Restore NPCM_I2CCTL1 status
+	iowrite8(i2cctl1 & ~NPCM_I2CCTL1_RWS_FIELDS, bus->reg + NPCM_I2CCTL1);
+
+	// Clear BB (BUS BUSY) bit
+	iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+
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
+	return (bool)FIELD_GET(NPCM_I2CST_MASTER,
+			       ioread8(bus->reg + NPCM_I2CST));
+}
+
+static void npcm_i2c_callback(struct npcm_i2c *bus,
+			      enum i2c_state_ind op_status, u16 info)
+{
+	struct i2c_msg *msgs = bus->msgs;
+	int msgs_num = bus->msgs_num;
+
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_CB);
+
+	if (!msgs)
+		return;
+
+	if (completion_done(&bus->cmd_complete) == true)
+		return;
+
+	switch (op_status) {
+	case I2C_MASTER_DONE_IND:
+		bus->cmd_err = bus->msgs_num;
+		// fall through:
+	case I2C_BLOCK_BYTES_ERR_IND:
+		// Master transaction finished and all transmit bytes were sent
+		if (bus->msgs) {
+			if (msgs[0].flags & I2C_M_RD)
+				msgs[0].len = info;
+			else if (msgs_num == 2 &&
+				 msgs[1].flags & I2C_M_RD)
+				msgs[1].len = info;
+		}
+
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_DONE);
+
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
+		// I2Cus wake up
+		break;
+	default:
+		break;
+	}
+
+	bus->operation = I2C_NO_OPER;
+	if (bus->slave)
+		bus->master_or_slave = I2C_SLAVE;
+}
+
+static u32 npcm_i2c_get_fifo_fullness(struct npcm_i2c *bus)
+{
+	if (bus->operation == I2C_WRITE_OPER)
+		return FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
+				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+	else if (bus->operation == I2C_READ_OPER)
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
+	if (max_bytes_to_send == 0)
+		return;
+	while ((max_bytes_to_send--) && (I2C_HW_FIFO_SIZE -
+					 npcm_i2c_get_fifo_fullness(bus))) {
+		if (bus->wr_ind < bus->wr_size)
+			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
+		else
+			npcm_i2c_wr_byte(bus, 0xFF);
+	}
+}
+
+// configure the FIFO before using it. If nread is -1 RX FIFO will not be
+// configured. same for	nwrite
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
+		rxf_ctl = min_t(u16, (u16)nread, (u16)I2C_HW_FIFO_SIZE);
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
+		npcm_i2c_rd_byte(bus, &data);
+
+		if (bus->master_or_slave == I2C_MASTER) {
+			if (bus->rd_ind < bus->rd_size)
+				bus->rd_buf[bus->rd_ind++] = data;
+		} else { // I2C_SLAVE:
+		}
+	}
+}
+
+static int npcm_i2c_master_abort(struct npcm_i2c *bus)
+{
+	int ret = 0;
+
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_ABORT);
+
+	// Only current master is allowed to issue Stop Condition
+	if (npcm_i2c_is_master(bus)) {
+		npcm_i2c_eob_int(bus, true);
+		npcm_i2c_master_stop(bus);
+
+		// Clear NEGACK, STASTR and BER bits
+		iowrite8(NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR,
+			 bus->reg + NPCM_I2CST);
+	}
+
+	return ret;
+}
+
+static void npcm_i2c_master_fifo_read(struct npcm_i2c *bus)
+{
+	int rcount;
+	int fifo_bytes;
+	enum i2c_state_ind ind = I2C_MASTER_DONE_IND;
+
+	fifo_bytes = npcm_i2c_get_fifo_fullness(bus);
+
+	rcount = bus->rd_size - bus->rd_ind;
+
+	// In order not to change the RX_TRH during transaction (we found that
+	// this might be problematic if it takes too much time to read the FIFO)
+	//  we read the data in the following way. If the number of bytes to
+	// read == FIFO Size + C (where C < FIFO Size)then first read C bytes
+	// and in the next int we read rest of the data.
+	if (rcount < (2 * I2C_HW_FIFO_SIZE) && rcount > I2C_HW_FIFO_SIZE)
+		fifo_bytes = (u8)(rcount - I2C_HW_FIFO_SIZE);
+
+	if ((rcount - fifo_bytes) <= 0) {
+		// last bytes are about to be read - end of transaction.
+		// Stop should be set before reading last byte.
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ4);
+
+		bus->state = I2C_STOP_PENDING;
+		bus->stop_ind = ind;
+
+		npcm_i2c_eob_int(bus, true);
+		npcm_i2c_master_stop(bus);
+		npcm_i2c_read_from_fifo(bus, fifo_bytes);
+	} else {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ3);
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
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_WRITE);
+	if (bus->fifo_use)
+		npcm_i2c_clear_tx_fifo(bus); // clear the TX fifo status bit
+
+	// Master write operation - last byte handling
+	if (bus->wr_ind == bus->wr_size) {
+		if (bus->fifo_use && npcm_i2c_get_fifo_fullness(bus) > 0)
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
+
+			bus->state = I2C_STOP_PENDING;
+			bus->stop_ind = I2C_MASTER_DONE_IND;
+
+			npcm_i2c_master_stop(bus);
+			// Clear SDA Status bit (by writing dummy byte)
+			npcm_i2c_wr_byte(bus, 0xFF);
+
+		} else {
+			// last write-byte written on previous int - need to
+			// restart & send slave address
+			npcm_i2c_set_fifo(bus, bus->rd_size, -1);
+
+			// Generate repeated start upon next write to SDA
+			npcm_i2c_master_start(bus);
+
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
+
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
+			npcm_i2c_write_to_fifo_master(bus, wcount);
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
+	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ);
+
+	// added bytes to the packet:
+	block_extra_bytes_size = (u8)bus->read_block_use + (u8)bus->PEC_use;
+
+	// Perform master read, distinguishing between last byte and the rest of
+	// the bytes. The last byte should be read when the clock is stopped
+	if (bus->rd_ind == 0) { //first byte handling:
+		// in block protocol first byte is the size
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ1);
+		if (bus->read_block_use) {
+			// first byte in block protocol is the size:
+			npcm_i2c_rd_byte(bus, &data);
+
+			// if slave returned illegal size. read up to 32 bytes.
+			if (data >= I2C_SMBUS_BLOCK_MAX)
+				data = I2C_SMBUS_BLOCK_MAX;
+
+			// is data is 0 -> not supported. read at least one byte
+			if (data == 0)
+				data = 1;
+
+			bus->rd_size = data + block_extra_bytes_size;
+
+			bus->rd_buf[bus->rd_ind++] = data;
+
+			// clear RX FIFO interrupt status:
+			if (bus->fifo_use) {
+				iowrite8(NPCM_I2CFIF_CTS_RXF_TXE |
+					 ioread8(bus->reg + NPCM_I2CFIF_CTS),
+					 bus->reg + NPCM_I2CFIF_CTS);
+			}
+
+			npcm_i2c_set_fifo(bus, (bus->rd_size - 1), -1);
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
+			npcm_i2c_read_from_fifo(bus,
+						npcm_i2c_get_fifo_fullness(bus)
+						);
+		} else {
+			NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ2);
+			npcm_i2c_master_fifo_read(bus);
+		}
+	}
+}
+
+static irqreturn_t npcm_i2c_int_master_handler(struct npcm_i2c *bus)
+{
+	irqreturn_t ret = IRQ_NONE;
+	u8 fif_cts;
+
+	if (FIELD_GET(NPCM_I2CST_NMATCH, ioread8(bus->reg + NPCM_I2CST))) {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_NMATCH_MSTR);
+		iowrite8(NPCM_I2CST_NMATCH, bus->reg + NPCM_I2CST);
+		npcm_i2c_nack(bus);
+		bus->stop_ind = I2C_BUS_ERR_IND;
+		npcm_i2c_callback(bus, bus->stop_ind, npcm_i2c_get_index(bus));
+
+		return IRQ_HANDLED;
+	}
+	// A NACK has occurred
+	if (FIELD_GET(NPCM_I2CST_NEGACK, ioread8(bus->reg + NPCM_I2CST))) {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_NACK);
+		if (bus->fifo_use) {
+			// if there are still untransmitted bytes in TX FIFO
+			// reduce them from wr_ind
+			if (bus->operation == I2C_WRITE_OPER)
+				bus->wr_ind -= npcm_i2c_get_fifo_fullness(bus);
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
+			npcm_i2c_eob_int(bus,  false);
+
+			npcm_i2c_master_stop(bus);
+
+			// Clear NEGACK, STASTR and BER bits
+			// In Master mode, NEGACK should be cleared only after
+			// generating STOP.
+			// In such case, the bus is released from stall only
+			// after the software clears NEGACK bit.
+			// Then a Stop condition is sent.
+			iowrite8(NPCM_I2CST_BER | NPCM_I2CST_NEGACK |
+				 NPCM_I2CST_STASTR, bus->reg + NPCM_I2CST);
+
+			npcm_i2c_wait_for_bus_free(bus, false);
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
+	if (FIELD_GET(NPCM_I2CST_BER, ioread8(bus->reg + NPCM_I2CST))) {
+		// Check whether bus arbitration or Start or Stop during data
+		// xfer bus arbitration problem should not result in recovery
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_BER);
+		bus->stop_ind = I2C_BUS_ERR_IND;
+		if (npcm_i2c_is_master(bus)) {
+			npcm_i2c_master_abort(bus);
+		} else {
+			// Clear NEGACK, STASTR and BER bits
+			iowrite8(NPCM_I2CST_BER | NPCM_I2CST_NEGACK |
+				 NPCM_I2CST_STASTR, bus->reg + NPCM_I2CST);
+
+			// Clear BB (BUS BUSY) bit
+			iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
+
+			bus->cmd_err = -EAGAIN;
+			npcm_i2c_callback(bus, bus->stop_ind,
+					  npcm_i2c_get_index(bus));
+		}
+		bus->state = I2C_IDLE;
+		ret =  IRQ_HANDLED;
+		return ret;
+	}
+
+	// A Master End of Busy (meaning Stop Condition happened)
+	// End of Busy int is on and End of Busy is set
+	if ((FIELD_GET(NPCM_I2CCTL1_EOBINTE,
+		       ioread8(bus->reg + NPCM_I2CCTL1)) == 1) &&
+	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
+		       ioread8(bus->reg + NPCM_I2CCST3)))) {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_EOB);
+		npcm_i2c_eob_int(bus, false);
+		bus->state = I2C_IDLE;
+		npcm_i2c_callback(bus, bus->stop_ind, bus->rd_ind);
+		return IRQ_HANDLED;
+	}
+
+	// Address sent and requested stall occurred (Master mode)
+	if (FIELD_GET(NPCM_I2CST_STASTR, ioread8(bus->reg + NPCM_I2CST))) {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_STALL);
+
+		if (npcm_i2c_is_quick(bus)) {
+			bus->state = I2C_STOP_PENDING;
+			bus->stop_ind = I2C_MASTER_DONE_IND;
+			npcm_i2c_eob_int(bus, true);
+			npcm_i2c_master_stop(bus);
+
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
+	if (FIELD_GET(NPCM_I2CST_SDAST, ioread8(bus->reg + NPCM_I2CST)) ||
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
+				// Initiate I2Cus master transaction
+				// Generate a Start condition on the I2Cus
+
+				// select bank 1 for FIFO regs
+				npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+				fif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+
+				// clear FIFO and relevant status bits.
+				iowrite8((fif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR)
+					| NPCM_I2CFIF_CTS_CLR_FIFO,
+					 bus->reg + NPCM_I2CFIF_CTS);
+
+				// and enable it
+				iowrite8((fif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR)
+					| NPCM_I2CFIF_CTS_RXF_TXE,
+					 bus->reg + NPCM_I2CFIF_CTS);
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
+			if ((NPCM_I2CST_XMIT &
+			     ioread8(bus->reg + NPCM_I2CST)) == 0) {
+				bus->operation = I2C_READ_OPER;
+				npcm_i2c_int_master_handler_read(bus);
+			} else {
+				bus->operation = I2C_WRITE_OPER;
+				npcm_i2c_int_master_handler_write(bus);
+			}
+		}
+		ret =  IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
+{
+	unsigned int ret = 0;
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+	u32 offset = 0;
+
+	offset = 0;
+	ret = FIELD_GET(I2CCTL3_SCL_LVL, ioread32(bus->reg + NPCM_I2CCTL3));
+
+	pr_debug("i2c%d get SCL 0x%08X\n", bus->num, ret);
+
+	return (ret >> (offset)) & 0x01;
+}
+
+static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
+{
+	unsigned int ret = 0;
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+	u32 offset = 0;
+
+	offset = 0;
+	ret = FIELD_GET(I2CCTL3_SDA_LVL, ioread32(bus->reg + NPCM_I2CCTL3));
+
+	pr_debug("i2c%d get SDA 0x%08X\n", bus->num, ret);
+
+	return (ret >> (offset)) & 0x01;
+}
+
+// recovery using TGCLK functionality of the module
+static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
+{
+	int  iter = 27;	  // Allow 3 bytes to be sent by the Slave
+	int  retries = 0;
+	bool done = false;
+	int  status = -(ENOTRECOVERABLE);
+	u8   fif_cts;
+	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
+
+	if ((npcm_i2c_get_SDA(_adap) == 1) && (npcm_i2c_get_SCL(_adap) == 1)) {
+		dev_dbg(bus->dev, "TGCLK recovery bus%d: skipped bus not stuck",
+			bus->num);
+		npcm_i2c_reset(bus);
+		return status;
+	}
+
+	// Disable int
+	npcm_i2c_int_enable(bus, false);
+
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
+	fif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+
+	// clear FIFO and relevant status bits.
+	iowrite8((fif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR) |
+		  NPCM_I2CFIF_CTS_CLR_FIFO,
+		  bus->reg + NPCM_I2CFIF_CTS);
+
+	npcm_i2c_set_fifo(bus, -1, 0);
+
+	// Check If the SDA line is active (low)
+	if (npcm_i2c_get_SDA(_adap) == 0) {
+		// Repeat the following sequence until SDA is released
+		do {
+			// Issue a single SCL cycle
+			iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
+			retries = 10;
+			while (retries != 0 &&
+			       FIELD_GET(NPCM_I2CCST_TGSCL,
+					 ioread8(bus->reg + NPCM_I2CCST))) {
+				udelay(20);
+				retries--;
+			}
+
+			// tgclk failed to toggle
+			if (retries == 0)
+				dev_err(bus->dev, "recovery toggle timeout");
+			// If SDA line is inactive (high), stop
+			if (npcm_i2c_get_SDA(_adap))
+				done = true;
+		} while ((!done) && (--iter != 0));
+
+		// If SDA line is released: send start-addr-stop, to re-sync.
+		if (done) {
+			npcm_i2c_master_start(bus);
+
+			// Wait until START condition is sent, or RETRIES_NUM
+			retries = RETRIES_NUM;
+			while (retries && !npcm_i2c_is_master(bus)) {
+				udelay(20);
+				retries--;
+			}
+
+			// If START condition was sent
+			if (retries > 0) {
+				// Send an address byte in write direction:
+				npcm_i2c_wr_byte(bus, bus->dest_addr);
+				udelay(200);
+				npcm_i2c_master_stop(bus);
+				udelay(200);
+				status = 0;
+			}
+		}
+	}
+
+	// if bus is still stuck: total reset: set SCL low for 35ms:
+	if (unlikely(npcm_i2c_get_SDA(_adap) == 0)) {
+		// Generate a START, to synchronize Master and Slave
+		npcm_i2c_master_start(bus);
+
+		// Wait until START condition is sent, or RETRIES_NUM
+		retries = RETRIES_NUM;
+		while (retries && !npcm_i2c_is_master(bus))
+			retries--;
+
+		// set SCL low for a long time (note: this is unlikely)
+		usleep_range(25000, 35000);
+		npcm_i2c_master_stop(bus);
+		udelay(200);
+		status = 0;
+	}
+
+	dev_dbg(bus->dev, "recovery done, iter = %d, done = %d, retries = %d\n",
+		27 - iter, done, retries);
+	// Enable I2C int and New Address Match int source
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_NMINTE) &
+		 ~NPCM_I2CCTL1_RWS_FIELDS,
+		 bus->reg + NPCM_I2CCTL1);
+	npcm_i2c_reset(bus);
+	npcm_i2c_int_enable(bus, true);
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
+static bool npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq)
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
+	if (bus_freq <= I2C_FREQ_100KHZ) {
+		sclfrq = src_clk_freq / (bus_freq * 4);
+
+		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
+			return false;
+
+		if (src_clk_freq >= 40000)
+			hldt = 17;
+		else if (src_clk_freq >= 12500)
+			hldt = 15;
+		else
+			hldt = 7;
+	}
+
+	else if (bus_freq == I2C_FREQ_400KHZ) {
+		sclfrq = 0;
+		fast_mode = true;
+
+		if (src_clk_freq < 7500)
+			// 400KHZ cannot be supported for core clock < 7.5 MHZ
+			return false;
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
+			hldt = (u8)__KERNEL_DIV_ROUND_UP(src_clk_freq * 300,
+							 1000000) + 7;
+
+			k1 = __KERNEL_DIV_ROUND_UP(src_clk_freq * 1600,
+						   1000000);
+			k2 = __KERNEL_DIV_ROUND_UP(src_clk_freq * 900,
+						   1000000);
+			k1 = round_up(k1, 2);
+			k2 = round_up(k2 + 1, 2);
+			if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
+			    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
+				return false;
+		}
+	}
+
+	else if (bus_freq == I2C_FREQ_1MHZ) {
+		sclfrq = 0;
+		fast_mode = true;
+
+		if (src_clk_freq < 24000)
+		// 1MHZ cannot be supported for master core clock < 15 MHZ
+		// or slave core clock < 24 MHZ
+			return false;
+
+		k1 = round_up((__KERNEL_DIV_ROUND_UP(src_clk_freq * 620,
+						     1000000)), 2);
+		k2 = round_up((__KERNEL_DIV_ROUND_UP(src_clk_freq * 380,
+						     1000000) + 1), 2);
+		if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
+		    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
+			return false;
+
+		// Master or Slave with frequency > 40 MHZ
+		if (src_clk_freq > 40000) {
+			// Set HLDT:
+			// SDA hold time:  (HLDT-7) * T(CLK) >= 120
+			// HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
+			hldt = (u8)__KERNEL_DIV_ROUND_UP(src_clk_freq * 120,
+							 1000000) + 7;
+		} else {
+			hldt = 7;
+			dbnct = 2;
+		}
+	}
+
+	// Frequency larger than 1 MHZ
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
+	if (bus_freq >= I2C_FREQ_400KHZ) {
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
+		iowrite8(ioread8(bus->reg + NPCM_I2CFIF_CTL) |
+			 NPCM_I2CFIF_CTL_FIFO_EN, bus->reg + NPCM_I2CFIF_CTL);
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
+
+	// Enable I2C int and New Address Match int source
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_NMINTE) &
+		 ~NPCM_I2CCTL1_RWS_FIELDS,
+		 bus->reg + NPCM_I2CCTL1);
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
+	bus->slave = NULL;
+	bus->xmits = 0;
+
+	ret = of_property_read_u32(pdev->dev.of_node,
+				   "bus-frequency", &clk_freq);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
+		clk_freq = 100000;
+	}
+
+	ret = npcm_i2c_init_module(bus, I2C_MASTER, clk_freq / 1000);
+	if (!ret) {
+		dev_err(&pdev->dev, "npcm_i2c_init_module() failed\n");
+		return -1;
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
+		bus->cmd_err = -(EBUSY);
+		return false;
+	}
+
+	bus->xmits++;
+
+	bus->dest_addr = (u8)(slave_addr << 1);// Translate 7bit to 8bit format
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
+
+	bus->int_cnt = 0;
+	bus->event_log = 0;
+
+	if (bus->fifo_use) {
+		u8 i2cfif_cts;
+		// select bank 1 for FIFO regs
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+		i2cfif_cts = ioread8(bus->reg + NPCM_I2CFIF_CTS);
+
+		// clear FIFO and relevant status bits.
+		iowrite8((i2cfif_cts & (~NPCM_I2CFIF_CTS_SLVRSTR)) |
+			 NPCM_I2CFIF_CTS_CLR_FIFO,
+			 bus->reg + NPCM_I2CFIF_CTS);
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
+	if (unlikely(bus->state == I2C_DISABLE)) {
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
+		if (!bus_busy && bus->slave)
+			iowrite8((bus->slave->addr & 0x7F),
+				 bus->reg + NPCM_I2CADDR1);
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+		if (!bus_busy)
+			break;
+	} while (time_is_after_jiffies(time_left));
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
+	bus->read_block_use = read_block;
+
+	reinit_completion(&bus->cmd_complete);
+
+	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+					write_data, read_data, read_PEC,
+					read_block))
+		ret = -(EBUSY);
+
+	if (ret != -(EBUSY)) {
+		time_left = wait_for_completion_timeout(&bus->cmd_complete,
+							timeout);
+
+		if (time_left == 0) {
+			NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_TO);
+			if (bus->master_or_slave == I2C_MASTER) {
+				dev_dbg(bus->dev,
+					"i2c%d TO = %d\n", bus->num, timeout);
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
+		i2c_recover_bus(adap);
+
+	// If nothing went wrong, return number of messages x-ferred.
+	if (ret >= 0)
+		return num;
+
+	return ret;
+}
+
+static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C |
+		   I2C_FUNC_SMBUS_EMUL |
+		   I2C_FUNC_SMBUS_BLOCK_DATA |
+		   I2C_FUNC_SMBUS_PEC
+		   ;
+}
+
+static const struct i2c_adapter_quirks npcm_i2c_quirks = {
+	.max_read_len = 32768,
+	.max_write_len = 32768,
+	.max_num_msgs = 2,
+	.flags = I2C_AQ_COMB_WRITE_THEN_READ
+};
+
+static const struct i2c_algorithm npcm_i2c_algo = {
+	.master_xfer = npcm_i2c_master_xfer,
+	.functionality = npcm_i2c_functionality,
+};
+
+static int  npcm_i2c_probe_bus(struct platform_device *pdev)
+{
+	struct npcm_i2c *bus;
+	struct i2c_adapter *adap;
+	struct resource *res;
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
+#ifdef CONFIG_OF
+	num = of_alias_get_id(pdev->dev.of_node, "i2c");
+	bus->num = num;
+	i2c_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(i2c_clk)) {
+		dev_err(bus->dev, " I2C probe failed: can't read clk\n");
+		return	-EPROBE_DEFER;
+	}
+	bus->apb_clk = clk_get_rate(i2c_clk);
+	dev_dbg(bus->dev, "I2C APB clock is %d\n", bus->apb_clk);
+#endif //  CONFIG_OF
+
+	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	if (IS_ERR(gcr_regmap)) {
+		dev_err(bus->dev, "%s: failed to find nuvoton,npcm750-gcr\n",
+			__func__);
+		return IS_ERR(gcr_regmap);
+	}
+	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, I2CSEGCTL_VAL);
+	dev_dbg(bus->dev, "I2C%d: gcr mapped\n", bus->num);
+
+	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
+	if (IS_ERR(clk_regmap)) {
+		dev_err(bus->dev, "%s: failed to find nuvoton,npcm750-clk\n",
+			__func__);
+		return IS_ERR(clk_regmap);
+	}
+	dev_dbg(bus->dev, "I2C%d: clk mapped\n", bus->num);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dev_dbg(bus->dev, "resource: %pR\n", res);
+	bus->reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR((bus)->reg))
+		return PTR_ERR((bus)->reg);
+
+	// Initialize the I2C adapter
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
+	bus->slave = NULL;
+
+	bus->irq = platform_get_irq(pdev, 0);
+	if (bus->irq < 0) {
+		dev_err(bus->dev, "I2C platform_get_irq error\n");
+		return -ENODEV;
+	}
+	dev_dbg(bus->dev, "irq = %d\n", bus->irq);
+
+	ret = devm_request_irq(&pdev->dev, bus->irq, npcm_i2c_bus_irq, 0,
+			       dev_name(&pdev->dev), (void *)bus);
+
+	if (ret) {
+		dev_err(&pdev->dev, "I2C%d: request_irq fail\n", bus->num);
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
+
+	ret = i2c_add_numbered_adapter(&bus->adap);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "I2C%d: i2c_add_numbered_adapter fail\n",
+			bus->num);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bus);
+
+	pr_info("npcm7xx I2C bus %d is registered\n", bus->adap.nr);
+
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
+	return 0;
+}
+
+static const struct of_device_id npcm_i2c_bus_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-i2c", },
+	{},
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
+MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
+MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
+MODULE_AUTHOR("Tyrone Ting <kfting@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton I2C Bus Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("0.1.1");
+
-- 
2.22.0

