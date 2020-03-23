Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E518F917
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 16:58:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJvq0l0tzDqHG
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 02:58:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJsv0ppmzDr4R
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 02:57:05 +1100 (AEDT)
IronPort-SDR: CkGHDGjSfB9lk/xF5l+k6/tYq8m4z39zL3rYlwVkZ6uD7jk6eAi0vicRyCozsTCpM2AlVkV9Hz
 8+LK9yvKAxpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 08:56:57 -0700
IronPort-SDR: BNnYiC2VQITkM9v+SQUXhKRBHmLA2et7wJmlJvVdo2CApTzsgG6077xe40tzgSWuEQcNuw27/3
 gO2RFey/aX+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="235258454"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2020 08:56:52 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jGPRf-00CHQX-0w; Mon, 23 Mar 2020 17:56:55 +0200
Date: Mon, 23 Mar 2020 17:56:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v9 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200323155655.GQ1922688@smile.fi.intel.com>
References: <20200323134437.259210-1-tali.perry1@gmail.com>
 <20200323134437.259210-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323134437.259210-3-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, wsa@the-dreams.de,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 03:44:36PM +0200, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

...

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/jiffies.h>
> +#include <linux/iopoll.h>

Perhaps ordered?

> +enum i2c_mode {
> +	I2C_MASTER,
> +	I2C_SLAVE

+ Comma.

> +};

...

> +#define NPCM_I2CSEGCTL  0xE4

Indentation issue, see the below lines.

> +#define NPCM_I2CSEGCTL_INIT_VAL	0x0333F000
> +
> +// Common regs
> +#define NPCM_I2CSDA			0x00

...

> +#define  I2C_FREQ_100KHZ  100
> +#define  I2C_FREQ_400KHZ  400
> +#define  I2C_FREQ_1MHZ   1000

Can you rather use standard definitions in Hz?

...

> +#define NPCM_I2C_EVENT_LOG(event)	(bus->event_log |= event)

Useless macro, and even harmful to some extend - it hides one of the parameter
(proper should take bus and event, but it will be quite longer than simple
 conditional). Use in-place the conditional.

...

> +struct npcm_i2c {

> +	u32			xmits;

> +

Unnecessary blank line.
I have noticed other places with the same issue. Fix 'em all.

> +};

...

> +static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
> +{
> +	if (bus->operation == I2C_READ_OPER)
> +		return bus->rd_ind;

> +	else if (bus->operation == I2C_WRITE_OPER)

Redundant 'else'

> +		return bus->wr_ind;
> +	return 0;
> +}

...

> +static void npcm_i2c_disable(struct npcm_i2c *bus)
> +{
> +	u8 i2cctl2;

+ blank line.

> +	// Disable module.
> +	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
> +	i2cctl2 = i2cctl2 & ~I2CCTL2_ENABLE;
> +	iowrite8(i2cctl2, bus->reg + NPCM_I2CCTL2);
> +
> +	bus->state = I2C_DISABLE;
> +}

...

> +static void npcm_i2c_enable(struct npcm_i2c *bus)
> +{
> +	u8 i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);

In this case direct assignment like above is okay...

> +
> +	i2cctl2 = i2cctl2 | I2CCTL2_ENABLE;
> +	iowrite8(i2cctl2, bus->reg + NPCM_I2CCTL2);
> +	bus->state = I2C_IDLE;
> +}
> +
> +// enable\disable end of busy (EOB) interrupt
> +static inline void npcm_i2c_eob_int(struct npcm_i2c *bus, bool enable)
> +{

> +	u8 val = ioread8(bus->reg + NPCM_I2CCST3);

...but not here. Better...

> +

> +	// Clear EO_BUSY pending bit:

...to perform it explicitly here.

> +	val = val | NPCM_I2CCST3_EO_BUSY;
> +	iowrite8(val, bus->reg + NPCM_I2CCST3);
> +
> +	val = ioread8(bus->reg + NPCM_I2CCTL1);
> +	if (enable)
> +		val = (val | NPCM_I2CCTL1_EOBINTE) & ~NPCM_I2CCTL1_RWS;
> +	else
> +		val = (val & ~NPCM_I2CCTL1_EOBINTE) & ~NPCM_I2CCTL1_RWS;
> +	iowrite8(val, bus->reg + NPCM_I2CCTL1);
> +}

...

> +static void npcm_i2c_int_enable(struct npcm_i2c *bus, bool enable)
> +{
> +	u8 val = ioread8(bus->reg + NPCM_I2CCTL1);
> +
> +	if (enable)
> +		val = (val | NPCM_I2CCTL1_INTEN) & ~NPCM_I2CCTL1_RWS;
> +	else
> +		val = (val & ~NPCM_I2CCTL1_INTEN) & ~NPCM_I2CCTL1_RWS;
> +	iowrite8(val, bus->reg + NPCM_I2CCTL1);

	if (enable)
		val |= NPCM_I2CCTL1_INTEN;
	else
		val &= ~NPCM_I2CCTL1_INTEN;
	iowrite8(val & ~NPCM_I2CCTL1_RWS, bus->reg + NPCM_I2CCTL1);

Ditto for the rest similar cases.

> +}

...

> +	val = (val | NPCM_I2CCTL1_START) &
> +		 ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK);

	val |= NPCM_I2CCTL1_START;
	val &= ~(NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK);

Ditto for other similar cases.

...

> +static inline void npcm_i2c_master_stop(struct npcm_i2c *bus)
> +{

> +	if (bus->fifo_use) {

	if (...)
		return;

> +		npcm_i2c_select_bank(bus, I2C_BANK_1);
> +
> +		if (bus->operation == I2C_READ_OPER)
> +			npcm_i2c_clear_rx_fifo(bus);
> +		else
> +			npcm_i2c_clear_tx_fifo(bus);
> +
> +		npcm_i2c_clear_fifo_int(bus);
> +
> +		iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
> +	}
> +}

...

> +	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_CB);

Some magic happens here...

...

> +static u32 npcm_i2c_get_fifo_fullness(struct npcm_i2c *bus)
> +{
> +	if (bus->operation == I2C_WRITE_OPER)
> +		return FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> +				 ioread8(bus->reg + NPCM_I2CTXF_STS));

> +	else if (bus->operation == I2C_READ_OPER)

Redundant 'else'

> +		return FIELD_GET(NPCM_I2CRXF_STS_RX_BYTES,
> +				 ioread8(bus->reg + NPCM_I2CRXF_STS));
> +	return 0;
> +}

...

> +// configure the FIFO before using it. If nread is -1 RX FIFO will not be
> +// configured. same for	nwrite

TABs/spaces mix.

...

> +static void npcm_i2c_read_from_fifo(struct npcm_i2c *bus, u8 bytes_in_fifo)
> +{
> +	u8 data;
> +
> +	while (bytes_in_fifo--) {
> +		data = npcm_i2c_rd_byte(bus);
> +
> +		if (bus->master_or_slave == I2C_MASTER) {
> +			if (bus->rd_ind < bus->rd_size)
> +				bus->rd_buf[bus->rd_ind++] = data;

> +		} else { // I2C_SLAVE:

Redundant (at least in this patch).

> +		}
> +	}
> +}

...

> +	int rcount;
> +	int fifo_bytes;

> +	if (rcount < (2 * I2C_HW_FIFO_SIZE) && rcount > I2C_HW_FIFO_SIZE)

> +		fifo_bytes = (u8)(rcount - I2C_HW_FIFO_SIZE);

Why explicit casting?

> +	if ((rcount - fifo_bytes) <= 0) {

Why not positive conditional and drop those parentheses?

> +		// last bytes are about to be read - end of transaction.
> +		// Stop should be set before reading last byte.
> +		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ4);
> +
> +		bus->state = I2C_STOP_PENDING;
> +		bus->stop_ind = ind;
> +
> +		npcm_i2c_eob_int(bus, true);
> +		npcm_i2c_master_stop(bus);
> +		npcm_i2c_read_from_fifo(bus, fifo_bytes);
> +	} else {
> +		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ3);
> +		npcm_i2c_read_from_fifo(bus, fifo_bytes);
> +		rcount = bus->rd_size - bus->rd_ind;
> +		npcm_i2c_set_fifo(bus, rcount, -1);
> +	}

...

> +static void npcm_i2c_int_master_handler_read(struct npcm_i2c *bus)
> +{
> +	u16 block_extra_bytes_size;
> +	u8 data;
> +
> +	// Master read operation (pure read or following a write operation).
> +	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ);
> +
> +	// added bytes to the packet:
> +	block_extra_bytes_size = (u8)bus->read_block_use + (u8)bus->PEC_use;

Why explicit castings?

> +
> +	// Perform master read, distinguishing between last byte and the rest of
> +	// the bytes. The last byte should be read when the clock is stopped
> +	if (bus->rd_ind == 0) { //first byte handling:
> +		// in block protocol first byte is the size
> +		NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ1);
> +		if (bus->read_block_use) {
> +			// first byte in block protocol is the size:
> +			data = npcm_i2c_rd_byte(bus);

> +			// if slave returned illegal size. read up to 32 bytes.
> +			if (data >= I2C_SMBUS_BLOCK_MAX)
> +				data = I2C_SMBUS_BLOCK_MAX;

min() / min_t() ? See below...

> +
> +			// is data is 0 -> not supported. read at least one byte
> +			if (data == 0)
> +				data = 1;

...actually clamp_val().

> +			bus->rd_size = data + block_extra_bytes_size;
> +
> +			bus->rd_buf[bus->rd_ind++] = data;
> +
> +			// clear RX FIFO interrupt status:
> +			if (bus->fifo_use) {
> +				data = ioread8(bus->reg + NPCM_I2CFIF_CTS);
> +				data = data | NPCM_I2CFIF_CTS_RXF_TXE;
> +				iowrite8(data, bus->reg + NPCM_I2CFIF_CTS);
> +			}

> +			npcm_i2c_set_fifo(bus, (bus->rd_size - 1), -1);

Too many parentheses.

> +			npcm_i2c_stall_after_start(bus, false);
> +		} else {
> +			npcm_i2c_clear_tx_fifo(bus);
> +			npcm_i2c_master_fifo_read(bus);
> +		}
> +	} else {
> +		if (bus->rd_size == block_extra_bytes_size &&
> +		    bus->read_block_use) {
> +			bus->state = I2C_STOP_PENDING;
> +			bus->stop_ind = I2C_BLOCK_BYTES_ERR_IND;
> +			bus->cmd_err = -EIO;
> +			npcm_i2c_eob_int(bus, true);
> +			npcm_i2c_master_stop(bus);

> +			npcm_i2c_read_from_fifo(bus,
> +						npcm_i2c_get_fifo_fullness(bus)
> +						);

Bad style. Combine last two lines together.

> +		} else {
> +			NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_READ2);
> +			npcm_i2c_master_fifo_read(bus);
> +		}
> +	}
> +}

...

> +static irqreturn_t npcm_i2c_int_master_handler(struct npcm_i2c *bus)
> +{

> +			npcm_i2c_eob_int(bus,  false);

Extra spaces.
I have noticed more places with the same issue, fix 'em all.

> +			val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK |
> +				 NPCM_I2CST_STASTR;

Make it temporary variable and use here and below...

> +			val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK |
> +				 NPCM_I2CST_STASTR;

...here.

> +	return ret;
> +}

Refactoring of such a big function will be benefit to all. And you may decrease
indentation level at the same time.

...

> +	fif_cts = (fif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR) |
> +		  NPCM_I2CFIF_CTS_CLR_FIFO;

	fif_cts &= ~NPCM_I2CFIF_CTS_SLVRSTR;
	fif_cts |= NPCM_I2CFIF_CTS_CLR_FIFO;

...

> +	if (npcm_i2c_get_SDA(_adap) == 0) {
> +		// Repeat the following sequence until SDA is released
> +		do {
> +			// Issue a single SCL cycle
> +			iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);

> +			retries = 10;
> +			while (retries != 0 &&
> +			       FIELD_GET(NPCM_I2CCST_TGSCL,
> +					 ioread8(bus->reg + NPCM_I2CCST))) {
> +				udelay(20);
> +				retries--;
> +			}

timeout loops more natural in do {} while form. But here is
readx_poll_timeout() NIH.

> +			// tgclk failed to toggle
> +			if (retries == 0)
> +				dev_err(bus->dev, "recovery toggle timeout");

If it's an error, why we are still continuing?

> +			// If SDA line is inactive (high), stop
> +			if (npcm_i2c_get_SDA(_adap))
> +				done = true;

> +		} while ((!done) && (--iter != 0));

Too many parentheses. done can be dropped (below you may use iter in condition).

> +		// If SDA line is released: send start-addr-stop, to re-sync.
> +		if (done) {
> +			npcm_i2c_master_start(bus);
>
> +			// Wait until START condition is sent, or RETRIES_NUM
> +			retries = RETRIES_NUM;
> +			while (retries && !npcm_i2c_is_master(bus)) {
> +				udelay(20);
> +				retries--;
> +			}

do {} while ().

> +			// If START condition was sent
> +			if (retries > 0) {
> +				// Send an address byte in write direction:
> +				npcm_i2c_wr_byte(bus, bus->dest_addr);
> +				udelay(200);
> +				npcm_i2c_master_stop(bus);
> +				udelay(200);
> +				status = 0;
> +			}
> +		}
> +	}

...

> +	if (unlikely(npcm_i2c_get_SDA(_adap) == 0)) {
> +		// Generate a START, to synchronize Master and Slave
> +		npcm_i2c_master_start(bus);
> +
> +		// Wait until START condition is sent, or RETRIES_NUM
> +		retries = RETRIES_NUM;

> +		while (retries && !npcm_i2c_is_master(bus))
> +			retries--;

do {} while (). Fix them all.

> +		// set SCL low for a long time (note: this is unlikely)
> +		usleep_range(25000, 35000);
> +		npcm_i2c_master_stop(bus);
> +		udelay(200);
> +		status = 0;
> +	}

...

> +static bool npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq)
> +{
> +	u32  k1 = 0;
> +	u32  k2 = 0;
> +	u8   dbnct = 0;
> +	u32  sclfrq = 0;
> +	u8   hldt = 7;
> +	bool fast_mode = false;
> +	u32  src_clk_freq; // in KHz

This is very cryptic.

The function deserve a good comment above which shows all formulas in use with
reference to datasheet pages, etc.

> +		// Master or Slave with frequency > 25 MHZ
> +		else if (src_clk_freq > 25000) {

> +			hldt = (u8)__KERNEL_DIV_ROUND_UP(src_clk_freq * 300,
> +							 1000000) + 7;
> +
> +			k1 = __KERNEL_DIV_ROUND_UP(src_clk_freq * 1600,
> +						   1000000);
> +			k2 = __KERNEL_DIV_ROUND_UP(src_clk_freq * 900,
> +						   1000000);

Why casting? Why __ special macro? Isn't DIV_ROUND_UP() enough?
Ditto for other similar cases.

> +			k1 = round_up(k1, 2);
> +			k2 = round_up(k2 + 1, 2);
> +			if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
> +			    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
> +				return false;
> +		}

> +	// After clock parameters calculation update reg (ENABLE should be 0):
> +	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, sclfrq & 0x7F),

Magic number.

> +		 bus->reg + NPCM_I2CCTL2);
> +
> +	// force to bank 0, set SCL and fast mode
> +	iowrite8(FIELD_PREP(I2CCTL3_400K_MODE, fast_mode) |
> +		 FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
> +		 bus->reg + NPCM_I2CCTL3);
> +
> +	// Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5
> +	npcm_i2c_select_bank(bus, I2C_BANK_0);

> +		iowrite8((u8)k1 / 2, bus->reg + NPCM_I2CSCLLT);
> +		iowrite8((u8)k2 / 2, bus->reg + NPCM_I2CSCLHT);

Why casting?

...

> +	if (FIELD_GET(I2C_VER_FIFO_EN, ioread8(bus->reg + I2C_VER))) {
> +		bus->fifo_use = true;
> +		npcm_i2c_select_bank(bus, I2C_BANK_0);
> +		val = ioread8(bus->reg + NPCM_I2CFIF_CTL);

> +		iowrite8(val | NPCM_I2CFIF_CTL_FIFO_EN,
> +			 bus->reg + NPCM_I2CFIF_CTL);

Do it in two operations.

> +		npcm_i2c_select_bank(bus, I2C_BANK_1);
> +	} else {
> +		bus->fifo_use = false;
> +	}
> +
> +	// Configure I2C module clock frequency
> +	if (!npcm_i2c_init_clk(bus, bus_freq)) {
> +		dev_err(bus->dev, "npcm_i2c_init_clk failed\n");
> +		return false;
> +	}
> +
> +	// Enable module (before configuring CTL1)
> +	npcm_i2c_enable(bus);
> +	bus->state = I2C_IDLE;
> +
> +	// Enable I2C int and New Address Match int source
> +	val = ioread8(bus->reg + NPCM_I2CCTL1);

> +	val = (val | NPCM_I2CCTL1_NMINTE) & ~NPCM_I2CCTL1_RWS;

Usually we mask first, then disjunct with new bits.
Actually this applies to all code where I also suggest to split to two
operations.

> +	iowrite8(val, bus->reg + NPCM_I2CCTL1);

...

> +	ret = of_property_read_u32(pdev->dev.of_node,
> +				   "bus-frequency", &clk_freq);

With ugly ifdefery this seems suspicious. Probably you imply
device_property_read_u32()?

> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
> +		clk_freq = 100000;
> +	}
> +
> +	ret = npcm_i2c_init_module(bus, I2C_MASTER, clk_freq / 1000);

> +	if (!ret) {

0 is error condition?!

> +		dev_err(&pdev->dev, "npcm_i2c_init_module() failed\n");

> +		return -1;

Use proper error coded.

> +	}

...

> +	bus->dest_addr = (u8)(slave_addr << 1);// Translate 7bit to 8bit format

Awful formatting (comments) and casting.

> +		i2cfif_cts = (i2cfif_cts & ~NPCM_I2CFIF_CTS_SLVRSTR) |
> +			 NPCM_I2CFIF_CTS_CLR_FIFO;

Do it in two operations.

...

> +	if (unlikely(bus->state == I2C_DISABLE)) {

Why unlikely() is in use? Any performance improvement? Show numbers.

> +		dev_err(bus->dev, "I2C%d module is disabled", bus->num);
> +		return -EINVAL;
> +	}

...

> +	time_left = jiffies +
> +		    msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
> +	do {
> +		/* we must clear slave address immediately when the bus is not
> +		 * busy, so we spinlock it, but we don't keep the lock for the
> +		 * entire while since it is too long.
> +		 */

> +		spin_lock_irqsave(&bus->lock, flags);
> +		bus_busy = ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BB;
> +		spin_unlock_irqrestore(&bus->lock, flags);

> +		if (!bus_busy)
> +			break;

This can be part of below condition.

> +
> +	} while (time_is_after_jiffies(time_left));

...

> +	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
> +					write_data, read_data, read_PEC,
> +					read_block))

> +		ret = -(EBUSY);
> +
> +	if (ret != -(EBUSY)) {

Too many parentheses. Fix them all in entire driver.

> +		time_left = wait_for_completion_timeout(&bus->cmd_complete,
> +							timeout);
> +
> +		if (time_left == 0) {
> +			NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_TO);
> +			if (bus->master_or_slave == I2C_MASTER) {

> +				dev_dbg(bus->dev,
> +					"i2c%d TO = %d\n", bus->num, timeout);

Why not first line fit enough?

> +				i2c_recover_bus(adap);
> +				bus->cmd_err = -EIO;
> +				bus->state = I2C_IDLE;
> +			}
> +		}
> +	}
> +	ret = bus->cmd_err;

> +	// If nothing went wrong, return number of messages x-ferred.
> +	if (ret >= 0)
> +		return num;
> +
> +	return ret;

Why not traditional pattern, i.e.

	if (ret < 0)
		return ret;

?

> +}

...

> +static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C |
> +		   I2C_FUNC_SMBUS_EMUL |
> +		   I2C_FUNC_SMBUS_BLOCK_DATA |
> +		   I2C_FUNC_SMBUS_PEC
> +		   ;

Awful indentation.

> +}

...

> +static const struct i2c_adapter_quirks npcm_i2c_quirks = {
> +	.max_read_len = 32768,
> +	.max_write_len = 32768,
> +	.max_num_msgs = 2,
> +	.flags = I2C_AQ_COMB_WRITE_THEN_READ

Missed comma.

> +};

...

> +static int  npcm_i2c_probe_bus(struct platform_device *pdev)
> +{

> +#ifdef CONFIG_OF

Why this ugly ifdefery?

> +	num = of_alias_get_id(pdev->dev.of_node, "i2c");
> +	bus->num = num;

> +	i2c_clk = devm_clk_get(&pdev->dev, NULL);

Can't be optional?

> +	if (IS_ERR(i2c_clk))

> +		return	-EPROBE_DEFER;

Why shadow an error code? Fix them all.

> +	bus->apb_clk = clk_get_rate(i2c_clk);
> +#endif //  CONFIG_OF

> +	bus->irq = platform_get_irq(pdev, 0);
> +	if (bus->irq < 0)

> +		return -ENODEV;

Why shadowed error code?

> +	ret = i2c_add_numbered_adapter(&bus->adap);

> +	if (ret < 0)

What about positive? Do they ever happen?
Hint: drop ' < 0' part in each case you have in this driver where it's not
needed.

> +		return ret;
> +
> +	platform_set_drvdata(pdev, bus);
> +
> +	return 0;
> +}

...

> +MODULE_VERSION("0.1.1");

Does it make any sense?

-- 
With Best Regards,
Andy Shevchenko


