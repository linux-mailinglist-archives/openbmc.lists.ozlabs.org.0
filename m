Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF617509A
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 23:36:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VymT5v83zDqw8
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 09:36:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 130 seconds by postgrey-1.36 at bilbo;
 Mon, 02 Mar 2020 09:35:30 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Vylk4QY4zDqv5
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 09:35:30 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 021MWmcg010918;
 Mon, 2 Mar 2020 00:32:48 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 1A70B6032E; Mon,  2 Mar 2020 00:32:48 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: brendanhiggins@google.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 kfting@nuvoton.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, robh+dt@kernel.org, wsa@the-dreams.de,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v8 3/3] i2c: npcm7xx: Add support for slave mode for Nuvoton
Date: Mon,  2 Mar 2020 00:32:01 +0200
Message-Id: <20200301223201.185450-4-tali.perry1@gmail.com>
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

Add support for slave mode for Nuvoton
NPCM BMC I2C controller driver.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 602 +++++++++++++++++++++++++++++++
 1 file changed, 602 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index cef5288f0394..06de2454215d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -65,6 +65,24 @@ enum i2c_state {
 	I2C_STOP_PENDING
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+// Module supports setting multiple own slave addresses
+enum i2c_addr {
+	I2C_SLAVE_ADDR1 = 0,
+	I2C_SLAVE_ADDR2,
+	I2C_SLAVE_ADDR3,
+	I2C_SLAVE_ADDR4,
+	I2C_SLAVE_ADDR5,
+	I2C_SLAVE_ADDR6,
+	I2C_SLAVE_ADDR7,
+	I2C_SLAVE_ADDR8,
+	I2C_SLAVE_ADDR9,
+	I2C_SLAVE_ADDR10,
+	I2C_GC_ADDR,
+	I2C_ARP_ADDR
+};
+#endif
+
 // init register and default value required to enable module
 #define NPCM_I2CSEGCTL  0xE4
 #define I2CSEGCTL_VAL	0x0333F000
@@ -92,6 +110,14 @@ enum i2c_state {
 #define NPCM_I2CADDR6			0x16
 #define NPCM_I2CADDR10			0x17
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+// I2CADDR array: because the addr regs are sprinkled all over the address space
+const int  npcm_i2caddr[10] = {NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3,
+			       NPCM_I2CADDR4, NPCM_I2CADDR5, NPCM_I2CADDR6,
+			       NPCM_I2CADDR7, NPCM_I2CADDR8, NPCM_I2CADDR9,
+			       NPCM_I2CADDR10};
+#endif
+
 #define NPCM_I2CCTL4			0x1A
 #define NPCM_I2CCTL5			0x1B
 #define NPCM_I2CSCLLT			0x1C // SCL Low Time
@@ -310,6 +336,26 @@ struct npcm_i2c {
 	unsigned long		bus_freq; // in kHz
 	u32			xmits;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	u8			own_slave_addr;
+	struct i2c_client	*slave;
+
+	// currently I2C slave IF only supports single byte operations.
+	// in order to utilyze the npcm HW FIFO, the driver will ask for 16bytes
+	// at a time, pack them in buffer, and then transmit them all together
+	// to the FIFO and onward to the bus .
+	// NACK on read will be once reached to bus->adap->quirks->max_read_len
+	// sending a NACK whever the backend requests for it is not supported.
+
+	// This module can be master and slave at the same time. separate ptrs
+	// and counters:
+	int			slv_rd_size;
+	int			slv_rd_ind;
+	int			slv_wr_size;
+	int			slv_wr_ind;
+	u8			slv_rd_buf[I2C_HW_FIFO_SIZE];
+	u8			slv_wr_buf[I2C_HW_FIFO_SIZE];
+#endif
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -587,6 +633,13 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	// Clear all fifo bits:
 	iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (bus->slave) {
+		npcm_i2c_slave_enable_l(bus, I2C_SLAVE_ADDR1, bus->slave->addr,
+					true);
+	}
+#endif
+
 	bus->state = I2C_IDLE;
 }
 
@@ -684,6 +737,36 @@ static void npcm_i2c_write_to_fifo_master(struct npcm_i2c *bus,
 	}
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void npcm_i2c_write_to_fifo_slave(struct npcm_i2c *bus,
+					 u16 max_bytes_to_send)
+{
+	// Fill the FIFO, while the FIFO is not full and there are more bytes to
+	// write
+	npcm_i2c_clear_fifo_int(bus);
+	npcm_i2c_clear_tx_fifo(bus);
+	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+
+	if (max_bytes_to_send == 0)
+		return;
+
+	while ((max_bytes_to_send--) && (I2C_HW_FIFO_SIZE -
+					 npcm_i2c_get_fifo_fullness(bus))) {
+		if (bus->slv_wr_size > 0) {
+			npcm_i2c_wr_byte(bus,
+					 bus->slv_wr_buf[bus->slv_wr_ind %
+					 I2C_HW_FIFO_SIZE]);
+			bus->slv_wr_ind = (bus->slv_wr_ind + 1) %
+					   I2C_HW_FIFO_SIZE;
+			bus->slv_wr_size--; // size indicates the # of bytes in
+					    // the SW FIFO, not HW.
+		} else {
+			break;
+		}
+	}
+}
+#endif
+
 // configure the FIFO before using it. If nread is -1 RX FIFO will not be
 // configured. same for	nwrite
 static void npcm_i2c_set_fifo(struct npcm_i2c *bus, int nread, int nwrite)
@@ -740,6 +823,18 @@ static void npcm_i2c_read_from_fifo(struct npcm_i2c *bus, u8 bytes_in_fifo)
 			if (bus->rd_ind < bus->rd_size)
 				bus->rd_buf[bus->rd_ind++] = data;
 		} else { // I2C_SLAVE:
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+			if (bus->slave) {
+				bus->slv_rd_buf[bus->slv_rd_ind %
+						I2C_HW_FIFO_SIZE] = data;
+				bus->slv_rd_ind++;
+				if (bus->slv_rd_ind == 1 && bus->read_block_use)
+					// 1st byte is length in block protocol
+					bus->slv_rd_size = data +
+							   (u8)bus->PEC_use +
+							(u8)bus->read_block_use;
+			}
+#endif
 		}
 	}
 }
@@ -763,6 +858,491 @@ static int npcm_i2c_master_abort(struct npcm_i2c *bus)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id);
+
+static int  npcm_i2c_slave_enable_l(struct npcm_i2c *bus,
+				    enum i2c_addr addr_type, u8 addr,
+				    bool enable)
+{
+	u8 slave_addr_reg = FIELD_PREP(NPCM_I2CADDR_A, addr) |
+		FIELD_PREP(NPCM_I2CADDR_SAEN, enable);
+
+	if (addr_type == I2C_GC_ADDR) {
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) &
+			~NPCM_I2CCTL1_GCMEN) |
+			FIELD_PREP(NPCM_I2CCTL1_GCMEN, enable),
+			bus->reg + NPCM_I2CCTL1);
+		return 0;
+	}
+	if (addr_type == I2C_ARP_ADDR) {
+		iowrite8((ioread8(bus->reg + NPCM_I2CCTL3) &
+			~I2CCTL3_ARPMEN) |
+			FIELD_PREP(I2CCTL3_ARPMEN, enable),
+			bus->reg + NPCM_I2CCTL3);
+		return 0;
+	}
+	if (addr_type >= I2C_ARP_ADDR)
+		return -EFAULT;
+
+	// select bank 0 for address 3 to 10
+	if (addr_type > I2C_SLAVE_ADDR2)
+		npcm_i2c_select_bank(bus, I2C_BANK_0);
+
+	// Set and enable the address
+	iowrite8(slave_addr_reg, bus->reg + npcm_i2caddr[(int)addr_type]);
+
+	// enable interrupt on slave match:
+	iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) | NPCM_I2CCTL1_NMINTE) &
+		 ~NPCM_I2CCTL1_RWS_FIELDS, bus->reg + NPCM_I2CCTL1);
+
+	if (addr_type > I2C_SLAVE_ADDR2)
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+	return 0;
+}
+
+static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus,
+				  enum i2c_addr addr_type)
+{
+	u8 slave_add;
+
+	// select bank 0 for address 3 to 10
+	if (addr_type > I2C_SLAVE_ADDR2)
+		npcm_i2c_select_bank(bus, I2C_BANK_0);
+
+	slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
+
+	if (addr_type > I2C_SLAVE_ADDR2)
+		npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	return  slave_add;
+}
+
+static int  npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
+{
+	int i;
+
+	slave_add |= 0x80; //Set the enable bit
+
+	npcm_i2c_select_bank(bus, I2C_BANK_0);
+
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OF_ADDR; i++) {
+		if (ioread8(bus->reg + npcm_i2caddr[i]) == slave_add)
+			iowrite8(0, bus->reg + npcm_i2caddr[i]);
+	}
+
+	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
+	return 0;
+}
+
+static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
+{
+	u8 value = 0;
+	int ret = bus->slv_wr_ind;
+	int i;
+
+	// fill a cyclic buffer
+	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
+		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
+			break;
+		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		bus->slv_wr_buf[(bus->slv_wr_ind + bus->slv_wr_size) %
+				 I2C_HW_FIFO_SIZE] = value;
+		bus->slv_wr_size++;
+		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+	}
+	return I2C_HW_FIFO_SIZE - ret;
+}
+
+static void npcm_i2c_slave_send_rd_buf(struct npcm_i2c *bus)
+{
+	int i;
+
+	for (i = 0; i < bus->slv_rd_ind; i++)
+		i2c_slave_event(bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+				&bus->slv_rd_buf[i]);
+
+	// once we send bytes up, need to reset the counter of the wr buf
+	// got data from master (new offset in device), ignore wr fifo:
+	if (bus->slv_rd_ind) {
+		bus->slv_wr_size = 0;
+		bus->slv_wr_ind = 0;
+	}
+
+	bus->slv_rd_ind = 0;
+	bus->slv_rd_size = bus->adap.quirks->max_read_len;
+
+	npcm_i2c_clear_fifo_int(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+}
+
+static bool npcm_i2c_slave_receive(struct npcm_i2c *bus, u16 nread,
+				   u8 *read_data)
+{
+	bus->state = I2C_OPER_STARTED;
+	bus->operation	 = I2C_READ_OPER;
+	bus->slv_rd_size = nread;
+	bus->slv_rd_ind	= 0;
+
+	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+	iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CRXF_CTL);
+
+	npcm_i2c_clear_tx_fifo(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+
+	return true;
+}
+
+static bool npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
+				u8 *write_data)
+{
+	if (nwrite == 0)
+		return false;
+
+	bus->state = I2C_OPER_STARTED;
+	bus->operation = I2C_WRITE_OPER;
+
+	// get the next buffer
+	npcm_i2c_slave_get_wr_buf(bus);
+
+	if (nwrite > 0)
+		npcm_i2c_write_to_fifo_slave(bus, nwrite);
+
+	return true;
+}
+
+// currently slave IF only supports single byte operations.
+// in order to utilyze the npcm HW FIFO, the driver will ask for 16 bytes
+// at a time, pack them in buffer, and then transmit them all together
+// to the FIFO and onward to the bus.
+// NACK on read will be once reached to bus->adap->quirks->max_read_len.
+// sending a NACK wherever the backend requests for it is not supported.
+// the next two functions allow reading to local buffer before writing it all
+// to the HW FIFO.
+// ret val: number of bytes read form the IF:
+
+static int npcm_i2c_slave_wr_buf_sync(struct npcm_i2c *bus)
+{
+	int left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
+			ioread8(bus->reg + NPCM_I2CTXF_STS));
+
+	if (left_in_fifo >= I2C_HW_FIFO_SIZE)
+		return left_in_fifo;
+
+	if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
+		return left_in_fifo; // fifo already full
+
+	// update the wr fifo ind, back to the untransmitted bytes:
+	bus->slv_wr_ind = bus->slv_wr_ind - left_in_fifo;
+	bus->slv_wr_size = bus->slv_wr_size + left_in_fifo;
+
+	if (bus->slv_wr_ind < 0)
+		bus->slv_wr_ind += I2C_HW_FIFO_SIZE;
+
+	return left_in_fifo;
+}
+
+static void npcm_i2c_slave_rd_wr(struct npcm_i2c *bus)
+{
+	if (FIELD_GET(NPCM_I2CST_XMIT, ioread8(bus->reg + NPCM_I2CST))) {
+		// Slave got an address match with direction bit 1 so
+		// it should transmit data
+		// Write till the master will NACK
+		bus->operation = I2C_WRITE_OPER;
+		npcm_i2c_slave_xmit(bus,
+				    bus->adap.quirks->max_write_len,
+				    bus->slv_wr_buf);
+	} else {
+		// Slave got an address match with direction bit 0
+		// so it should receive data.
+		// this module does not support saying no to bytes.
+		// it will always ACK.
+		bus->operation = I2C_READ_OPER;
+		npcm_i2c_read_from_fifo(bus, npcm_i2c_get_fifo_fullness(bus));
+		bus->stop_ind = I2C_SLAVE_RCV_IND;
+		npcm_i2c_slave_send_rd_buf(bus);
+		npcm_i2c_slave_receive(bus,
+				       bus->adap.quirks->max_read_len,
+				       bus->slv_rd_buf);
+	}
+}
+
+static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
+{
+	irqreturn_t ret = IRQ_NONE;
+	u8 i2cst = ioread8(bus->reg + NPCM_I2CST);
+	// Slave: A NACK has occurred
+	if (FIELD_GET(NPCM_I2CST_NEGACK, i2cst)) {
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_NACK);
+		bus->stop_ind = I2C_NACK_IND;
+		npcm_i2c_slave_wr_buf_sync(bus);
+		if (bus->fifo_use)
+			// clear the FIFO
+			iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO,
+				 bus->reg + NPCM_I2CFIF_CTS);
+
+		// In slave write, NACK is OK, otherwise it is a problem
+		bus->stop_ind = I2C_NO_STATUS_IND;
+		bus->operation = I2C_NO_OPER;
+		bus->own_slave_addr = 0xFF;
+
+		// Slave has to wait for I2C_STOP to decide this is the end
+		// of the transaction.
+		// Therefore transaction is not yet considered as done
+		iowrite8(NPCM_I2CST_NEGACK, bus->reg + NPCM_I2CST);
+
+		ret = IRQ_HANDLED;
+	}
+
+	// Slave mode: a Bus Error (BER) has been identified
+	if (FIELD_GET(NPCM_I2CST_BER, i2cst)) {
+		// Check whether bus arbitration or Start or Stop during data
+		// xfer bus arbitration problem should not result in recovery
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_BER_SLV);
+		bus->stop_ind = I2C_BUS_ERR_IND;
+
+		// wait for bus busy before clear fifo
+		iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
+
+		bus->state = I2C_IDLE;
+
+		// in BER case we might get 2 interrupts: one for slave one for
+		// master ( for a channel which is master\slave switching)
+		if (completion_done(&bus->cmd_complete) == false) {
+			bus->cmd_err = -EIO;
+			complete(&bus->cmd_complete);
+		}
+		bus->own_slave_addr = 0xFF;
+		iowrite8(NPCM_I2CST_BER, bus->reg + NPCM_I2CST);
+		ret =  IRQ_HANDLED;
+	}
+
+	// A Slave Stop Condition has been identified
+	if (FIELD_GET(NPCM_I2CST_SLVSTP, i2cst)) {
+		int bytes_in_fifo = npcm_i2c_get_fifo_fullness(bus);
+
+		bus->stop_ind = I2C_SLAVE_DONE_IND;
+
+		if (bus->operation == I2C_READ_OPER) {
+			npcm_i2c_read_from_fifo(bus, bytes_in_fifo);
+
+			// Slave done transmitting or receiving
+			// if the buffer is empty nothing will be sent
+		}
+
+		// Slave done transmitting or receiving
+		// if the buffer is empty nothing will be sent
+		npcm_i2c_slave_send_rd_buf(bus);
+
+		bus->stop_ind = I2C_NO_STATUS_IND;
+
+		// Note, just because we got here, it doesn't mean we through
+		// away the wr buffer.
+		// we keep it until the next received offset.
+		bus->operation = I2C_NO_OPER;
+		bus->int_cnt = 0;
+		bus->event_log_prev = bus->event_log;
+		bus->event_log = 0;
+		bus->own_slave_addr = 0xFF;
+
+		i2c_slave_event(bus->slave, I2C_SLAVE_STOP, 0);
+
+		iowrite8(NPCM_I2CST_SLVSTP, bus->reg + NPCM_I2CST);
+
+		if (bus->fifo_use) {
+			npcm_i2c_clear_fifo_int(bus);
+			npcm_i2c_clear_rx_fifo(bus);
+			npcm_i2c_clear_tx_fifo(bus);
+
+			iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO,
+				 bus->reg + NPCM_I2CFIF_CTS);
+		}
+
+		bus->state = I2C_IDLE;
+		ret =  IRQ_HANDLED;
+	}
+
+	// restart condition occurred and Rx-FIFO was not empty
+	if (bus->fifo_use && FIELD_GET(NPCM_I2CFIF_CTS_SLVRSTR,
+				       ioread8(bus->reg + NPCM_I2CFIF_CTS))) {
+		bus->stop_ind = I2C_SLAVE_RESTART_IND;
+
+		bus->master_or_slave = I2C_SLAVE;
+
+		if (bus->operation == I2C_READ_OPER)
+			npcm_i2c_read_from_fifo(bus,
+						npcm_i2c_get_fifo_fullness(bus)
+						);
+
+		bus->operation = I2C_WRITE_OPER;
+
+		iowrite8(0, bus->reg + NPCM_I2CRXF_CTL);
+
+		iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO | NPCM_I2CFIF_CTS_SLVRSTR |
+			 NPCM_I2CFIF_CTS_RXF_TXE, bus->reg + NPCM_I2CFIF_CTS);
+
+		npcm_i2c_slave_rd_wr(bus);
+
+		ret =  IRQ_HANDLED;
+	}
+
+	// A Slave Address Match has been identified
+	if (FIELD_GET(NPCM_I2CST_NMATCH, i2cst)) {
+		u8 info = 0;
+
+		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_NMATCH_SLV);
+		// Address match automatically implies slave mode
+		bus->master_or_slave = I2C_SLAVE;
+
+		npcm_i2c_clear_fifo_int(bus);
+		npcm_i2c_clear_rx_fifo(bus);
+		npcm_i2c_clear_tx_fifo(bus);
+		iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+		iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CRXF_CTL);
+
+		if (FIELD_GET(NPCM_I2CST_XMIT, i2cst)) {
+			bus->operation = I2C_WRITE_OPER;
+		} else {
+			i2c_slave_event(bus->slave, I2C_SLAVE_WRITE_REQUESTED,
+					&info);
+			bus->operation = I2C_READ_OPER;
+		}
+
+		if (bus->own_slave_addr == 0xFF) { // unknown address
+			// Check which type of address match
+			if (FIELD_GET(NPCM_I2CCST_MATCH,
+				      ioread8(bus->reg + NPCM_I2CCST))) {
+				u16 addr;
+				enum i2c_addr eaddr;
+
+				addr = ((ioread8(bus->reg + NPCM_I2CCST3) &
+					 0x7) << 7) |
+					(ioread8(bus->reg + NPCM_I2CCST2) &
+					 0x7F);
+
+				info = ffs(addr);
+				eaddr = (enum i2c_addr)info;
+
+				addr = FIELD_GET(NPCM_I2CADDR_A,
+						 npcm_i2c_get_slave_addr(bus,
+									 eaddr)
+						);
+				bus->own_slave_addr = addr;
+
+				if (bus->PEC_mask & BIT(info))
+					bus->PEC_use = true;
+				else
+					bus->PEC_use = false;
+			} else {
+				if (FIELD_GET(NPCM_I2CCST_GCMATCH,
+					      ioread8(bus->reg + NPCM_I2CCST)))
+					bus->own_slave_addr = 0;
+				if (FIELD_GET(NPCM_I2CCST_ARPMATCH,
+					      ioread8(bus->reg + NPCM_I2CCST)))
+					bus->own_slave_addr = 0x61;
+			}
+		} else {
+			//  Slave match can happen in two options:
+			//  1. Start, SA, read	(slave read without further ado)
+			//  2. Start, SA, read, data, restart, SA, read,  ...
+			//     (slave read in fragmented mode)
+			//  3. Start, SA, write, data, restart, SA, read, ..
+			//     (regular write-read mode)
+			if ((bus->state == I2C_OPER_STARTED &&
+			     bus->operation == I2C_READ_OPER &&
+			     bus->stop_ind == I2C_SLAVE_XMIT_IND) ||
+			     bus->stop_ind == I2C_SLAVE_RCV_IND) {
+				// slave transmit after slave receive w/o Slave
+				// Stop implies repeated start
+				bus->stop_ind = I2C_SLAVE_RESTART_IND;
+			}
+		}
+
+		if (FIELD_GET(NPCM_I2CST_XMIT, i2cst))
+			bus->stop_ind = I2C_SLAVE_XMIT_IND;
+		else
+			bus->stop_ind = I2C_SLAVE_RCV_IND;
+
+		bus->state = I2C_SLAVE_MATCH;
+
+		npcm_i2c_slave_rd_wr(bus);
+
+		iowrite8(NPCM_I2CST_NMATCH, bus->reg + NPCM_I2CST);
+		ret =  IRQ_HANDLED;
+	}
+
+	// Slave SDA status is set - transmit or receive, slave
+	if (FIELD_GET(NPCM_I2CST_SDAST, i2cst) ||
+	    (bus->fifo_use   &&
+	    (npcm_i2c_tx_fifo_empty(bus) || npcm_i2c_rx_fifo_full(bus)))) {
+		npcm_i2c_slave_rd_wr(bus);
+
+		iowrite8(NPCM_I2CST_SDAST, bus->reg + NPCM_I2CST);
+
+		ret =  IRQ_HANDLED;
+	} //SDAST
+
+	return ret;
+}
+
+static int  npcm_i2c_reg_slave(struct i2c_client *client)
+{
+	unsigned long lock_flags;
+	struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
+
+	bus->slave = client;
+
+	if (!bus->slave)
+		return -EINVAL;
+
+	if (client->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	spin_lock_irqsave(&bus->lock, lock_flags);
+
+	npcm_i2c_init_params(bus);
+	bus->slv_rd_size = 0;
+	bus->slv_wr_size = 0;
+	bus->slv_rd_ind = 0;
+	bus->slv_wr_ind = 0;
+	if (client->flags & I2C_CLIENT_PEC)
+		bus->PEC_use = true;
+
+	dev_info(bus->dev, "I2C%d register slave SA=0x%x, PEC=%d\n", bus->num,
+		 client->addr, bus->PEC_use);
+
+	npcm_i2c_slave_enable_l(bus, I2C_SLAVE_ADDR1, client->addr, true);
+
+	npcm_i2c_clear_fifo_int(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+	npcm_i2c_clear_tx_fifo(bus);
+
+	spin_unlock_irqrestore(&bus->lock, lock_flags);
+
+	return 0;
+}
+
+static int  npcm_i2c_unreg_slave(struct i2c_client *client)
+{
+	struct npcm_i2c *bus = client->adapter->algo_data;
+	unsigned long lock_flags;
+
+	spin_lock_irqsave(&bus->lock, lock_flags);
+	if (!bus->slave) {
+		spin_unlock_irqrestore(&bus->lock, lock_flags);
+		return -EINVAL;
+	}
+
+	npcm_i2c_remove_slave_addr(bus, client->addr);
+
+	bus->slave = NULL;
+	spin_unlock_irqrestore(&bus->lock, lock_flags);
+
+	return 0;
+}
+#endif // CONFIG_I2C_SLAVE
+
 static void npcm_i2c_master_fifo_read(struct npcm_i2c *bus)
 {
 	int rcount;
@@ -1512,6 +2092,14 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 		if (ret == IRQ_HANDLED)
 			return ret;
 	}
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (bus->slave) {
+		bus->master_or_slave = I2C_SLAVE;
+		ret = npcm_i2c_int_slave_handler(bus);
+		if (ret == IRQ_HANDLED)
+			return ret;
+	}
+#endif
 	return IRQ_HANDLED;
 }
 
@@ -1711,6 +2299,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (bus->cmd_err == -EAGAIN)
 		i2c_recover_bus(adap);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	// reenable slave if it was enabled
+	if (bus->slave)
+		iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+			 bus->reg + NPCM_I2CADDR1);
+#endif
+
 	// If nothing went wrong, return number of messages x-ferred.
 	if (ret >= 0)
 		return num;
@@ -1724,6 +2319,9 @@ static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
 		   I2C_FUNC_SMBUS_EMUL |
 		   I2C_FUNC_SMBUS_BLOCK_DATA |
 		   I2C_FUNC_SMBUS_PEC
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		   | I2C_FUNC_SLAVE
+#endif
 		   ;
 }
 
@@ -1737,6 +2335,10 @@ static const struct i2c_adapter_quirks npcm_i2c_quirks = {
 static const struct i2c_algorithm npcm_i2c_algo = {
 	.master_xfer = npcm_i2c_master_xfer,
 	.functionality = npcm_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave	= npcm_i2c_reg_slave,
+	.unreg_slave	= npcm_i2c_unreg_slave,
+#endif
 };
 
 static int  npcm_i2c_probe_bus(struct platform_device *pdev)
-- 
2.22.0

