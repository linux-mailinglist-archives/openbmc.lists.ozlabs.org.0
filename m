Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A31758AC
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 11:51:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WH5F2kKhzDqTj
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 21:51:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WH4R1zm7zDqHY
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 21:50:58 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 02:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="262733829"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2020 02:50:51 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1j8iez-0066vK-MN; Mon, 02 Mar 2020 12:50:53 +0200
Date: Mon, 2 Mar 2020 12:50:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v8 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200302105053.GO1224808@smile.fi.intel.com>
References: <20200301223201.185450-1-tali.perry1@gmail.com>
 <20200301223201.185450-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200301223201.185450-3-tali.perry1@gmail.com>
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

On Mon, Mar 02, 2020 at 12:32:00AM +0200, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

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

...

> +enum i2c_mode {
> +	I2C_MASTER,

> +	I2C_SLAVE

If it's not a terminator line (like MAX or something like that) it's better to
have comma at the end. This applies to all enum:s in your code.

> +};

...

> +// I2Cus Operation type values

It's funny style of comments when you have different for multi-line ones. I
don't know Wolfram's opinion on that, but at least for me looks like a bit of
consistency should be applied.

Also in some of them you missed English grammar / punctuation.

> +enum i2c_oper {
> +	I2C_NO_OPER = 0,
> +	I2C_WRITE_OPER = 1,
> +	I2C_READ_OPER = 2

If it's not hardware related values, why we need to define them explicitly?

> +};

...

> +#define NPCM_I2CCTL1_RWS_FIELDS	  (NPCM_I2CCTL1_START | NPCM_I2CCTL1_STOP | \
> +				   NPCM_I2CCTL1_ACK)

Better do like

#define FOO			\
	(BAR | BAZ)

...

> +const unsigned int RETRIES_NUM =	10000;

> +const unsigned int I2C_FREQ_MIN = 10;
> +const unsigned int I2C_FREQ_MAX = 1000;
> +const unsigned int I2C_FREQ_100KHZ = 100;
> +const unsigned int I2C_FREQ_400KHZ = 400;
> +const unsigned int I2C_FREQ_1MHZ = 1000;

> +const unsigned int SCLFRQ_MIN = 10;
> +const unsigned int SCLFRQ_MAX = 511;

> +const unsigned int I2C_NUM_OF_ADDR = 10;

Hmm... Why they are not defines?

...

> +// Status of one I2C module
> +struct npcm_i2c {
> +	struct i2c_adapter	adap;
> +	struct device		*dev;
> +	unsigned char __iomem	*reg;

> +	spinlock_t		lock;   /* IRQ synchronization */

Perhaps you describe all of the fields in kernel-doc format?

> +	struct completion	cmd_complete;
> +	int			irq;
> +	int			cmd_err;
> +	struct i2c_msg		*msgs;
> +	int			msgs_num;
> +	int			num;
> +	u32			apb_clk;
> +	struct i2c_bus_recovery_info rinfo;
> +	enum i2c_state		state;
> +	enum i2c_oper		operation;
> +	enum i2c_mode		master_or_slave;
> +	enum i2c_state_ind	stop_ind;
> +	u8			dest_addr;
> +	u8			*rd_buf;
> +	u16			rd_size;
> +	u16			rd_ind;
> +	u8			*wr_buf;
> +	u16			wr_size;
> +	u16			wr_ind;
> +	bool			fifo_use;
> +
> +	// PEC bit mask per slave address.
> +	//		1: use PEC for this address,
> +	//		0: do not use PEC for this address

Ditto.

> +	u16			PEC_mask;
> +	bool			PEC_use;
> +	bool			read_block_use;
> +	u8			int_cnt;
> +	u32			event_log;
> +	u32			event_log_prev;
> +	u32			clk_period_us;
> +	unsigned long		int_time_stamp;
> +	unsigned long		bus_freq; // in kHz
> +	u32			xmits;
> +
> +};

...

> +static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
> +					enum i2c_bank bank)
> +{
> +	if (bank == I2C_BANK_0)
> +		iowrite8(ioread8(bus->reg + NPCM_I2CCTL3) & ~I2CCTL3_BNK_SEL,
> +			 bus->reg + NPCM_I2CCTL3);
> +	else
> +		iowrite8(ioread8(bus->reg + NPCM_I2CCTL3) | I2CCTL3_BNK_SEL,
> +			 bus->reg + NPCM_I2CCTL3);

Usual patter (better to read) is

	u8 value;

	value = ioread8(...);
	if (a)
		val ...;
	else
		val ...;
	iowrite8(val, ...);

> +}

...

> +static inline void npcm_i2c_rd_byte(struct npcm_i2c *bus, u8 *data)
> +{
> +	*data = ioread8(bus->reg + NPCM_I2CSDA);
> +}

Hmm... why not u8 as return type?

...

> +static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
> +{
> +	u16 index = 0;
> +
> +	if (bus->operation == I2C_READ_OPER)
> +		index = bus->rd_ind;
> +	else if (bus->operation == I2C_WRITE_OPER)
> +		index = bus->wr_ind;
> +
> +	return index;

Why do you need temporary variable?

	if (a)
		return X;
	if (b)
		return Y;
	return 0;

> +}

...

> +static inline bool npcm_i2c_is_quick(struct npcm_i2c *bus)
> +{
> +	if (bus->wr_size == 0 && bus->rd_size == 0)
> +		return true;
> +	return false;

	return bus->wr_size == 0 && bus->rd_size == 0;

> +}

...

> +static void npcm_i2c_disable(struct npcm_i2c *bus)
> +{
> +	int i;
> +
> +	// select bank 0 for I2C addresses
> +	npcm_i2c_select_bank(bus, I2C_BANK_0);
> +
> +	// Slave addresses removal
> +	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OF_ADDR; i++)
> +		iowrite8(0, bus->reg + npcm_i2caddr[i]);
> +
> +	npcm_i2c_select_bank(bus, I2C_BANK_1);
> +

> +	// Disable module.
> +	iowrite8(ioread8(bus->reg + NPCM_I2CCTL2) & ~I2CCTL2_ENABLE,
> +		 bus->reg + NPCM_I2CCTL2);


Usual pattern

	value = ioread8(...);
	value ...;
	iowrite(value, ...);

> +
> +	bus->state = I2C_DISABLE;
> +}

...

> +
> +static void npcm_i2c_enable(struct npcm_i2c *bus)
> +{
> +	iowrite8((ioread8(bus->reg + NPCM_I2CCTL2) | I2CCTL2_ENABLE),
> +		 bus->reg + NPCM_I2CCTL2);

Ditto. Applies to all your code.

> +
> +	bus->state = I2C_IDLE;
> +}

...

> +static bool npcm_i2c_wait_for_bus_free(struct npcm_i2c *bus, bool may_sleep)
> +{
> +	int cnt = 0;
> +	int max_count = 2; /* wait for 2 ms */
> +
> +	if (may_sleep)
> +		might_sleep();
> +	else
> +		max_count = max_count * 100; /* since each delay is 10 us */

> +	while  (ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BUSY) {
> +		if (cnt < max_count) {
> +			if (may_sleep)
> +				msleep_interruptible(1);
> +			else
> +				udelay(10);
> +			cnt++;
> +
> +		} else {
> +			bus->cmd_err = -EAGAIN;
> +			return false;
> +		}
> +	}

NIH of readx_poll_timeout{_atomic}().

> +	return true;
> +}

...

> +static inline void npcm_i2c_eob_int(struct npcm_i2c *bus, bool enable)
> +{
> +	// Clear EO_BUSY pending bit:
> +	iowrite8(ioread8(bus->reg + NPCM_I2CCST3) | NPCM_I2CCST3_EO_BUSY,
> +		 bus->reg + NPCM_I2CCST3);
> +
> +	if (enable) {
> +		iowrite8((ioread8(bus->reg + NPCM_I2CCTL1) |
> +			 NPCM_I2CCTL1_EOBINTE)  & ~NPCM_I2CCTL1_RWS_FIELDS,
> +			 bus->reg + NPCM_I2CCTL1);
> +	} else {
> +		iowrite8(ioread8(bus->reg + NPCM_I2CCTL1) &
> +			 ~NPCM_I2CCTL1_EOBINTE & ~NPCM_I2CCTL1_RWS_FIELDS,
> +			 bus->reg + NPCM_I2CCTL1);
> +	}

Hard to follow. See above comments.

> +}

...

> +	return (bool)FIELD_GET(NPCM_I2CTXF_STS_TX_THST, tx_fifo_sts);

!! will do better than explicit casting.
Ditto for the rest.

...

> +static int  npcm_i2c_slave_enable_l(struct npcm_i2c *bus,
> +				    enum i2c_addr addr_type, u8 addr,
> +				    bool enable);

Why is it here? Do you have recursion / circular dependency?

...

> +	if (!msgs)
> +		return;

Is it possible?

> +	if (completion_done(&bus->cmd_complete) == true)

' == true' is redundant. Same for ' == false' (use ! instead).

> +		return;

...

> +static void npcm_i2c_write_to_fifo_master(struct npcm_i2c *bus,
> +					  u16 max_bytes_to_send)
> +{
> +	// Fill the FIFO, while the FIFO is not full and there are more bytes to
> +	// write

> +	if (max_bytes_to_send == 0)
> +		return;

Duplicate check, thus redundant.

> +	while ((max_bytes_to_send--) && (I2C_HW_FIFO_SIZE -
> +					 npcm_i2c_get_fifo_fullness(bus))) {

Badly formatted line. Moreover, too many parentheses.

> +		if (bus->wr_ind < bus->wr_size)
> +			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
> +		else
> +			npcm_i2c_wr_byte(bus, 0xFF);
> +	}
> +}

...

> +		rxf_ctl = min_t(u16, (u16)nread, (u16)I2C_HW_FIFO_SIZE);

Explicit casting when use min_t()? It's strange. Have you chance to read what
min_t() does?

...

> +
> +static int npcm_i2c_master_abort(struct npcm_i2c *bus)
> +{

> +	int ret = 0;

I don't see why this variable is needed.

> +
> +	NPCM_I2C_EVENT_LOG(NPCM_I2C_EVENT_ABORT);
> +
> +	// Only current master is allowed to issue Stop Condition
> +	if (npcm_i2c_is_master(bus)) {
> +		npcm_i2c_eob_int(bus, true);
> +		npcm_i2c_master_stop(bus);
> +
> +		// Clear NEGACK, STASTR and BER bits
> +		iowrite8(NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR,
> +			 bus->reg + NPCM_I2CST);
> +	}
> +
> +	return ret;
> +}

...

> +	pr_debug("i2c%d get SCL 0x%08X\n", bus->num, ret);

Do you need this in production code?

> +	return (ret >> (offset)) & 0x01;

Too many parentheses, but why not simple
	return !!(ret & BIT(offset));
?

Same for the rest similar code.

...

> +static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
> +{
> +	unsigned int ret = 0;
> +	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);

> +	u32 offset = 0;
> +
> +	offset = 0;

What the point?

> +	ret = FIELD_GET(I2CCTL3_SDA_LVL, ioread32(bus->reg + NPCM_I2CCTL3));
> +
> +	pr_debug("i2c%d get SDA 0x%08X\n", bus->num, ret);
> +
> +	return (ret >> (offset)) & 0x01;
> +}

I (almost) stopped here, I thing this driver needs more work (style,
refactoring, etc) before real review.

...

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	dev_dbg(bus->dev, "resource: %pR\n", res);
> +	bus->reg = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource();

> +	if (IS_ERR((bus)->reg))
> +		return PTR_ERR((bus)->reg);

...

> +	bus->irq = platform_get_irq(pdev, 0);
> +	if (bus->irq < 0) {

> +		dev_err(bus->dev, "I2C platform_get_irq error\n");

Redundant.

> +		return -ENODEV;
> +	}

...

> +	dev_dbg(bus->dev, "irq = %d\n", bus->irq);

Why?! There are other means to get this information.

> +	ret = devm_request_irq(&pdev->dev, bus->irq, npcm_i2c_bus_irq, 0,
> +			       dev_name(&pdev->dev), (void *)bus);

Explicit casting?!

...

> +	pr_info("npcm7xx I2C bus %d is registered\n", bus->adap.nr);

Noise.

...

> +static const struct of_device_id npcm_i2c_bus_of_table[] = {
> +	{ .compatible = "nuvoton,npcm750-i2c", },

> +	{},

For terminator line comma is redundant.

> +};

...

> +MODULE_VERSION("0.1.1");

What the point?

-- 
With Best Regards,
Andy Shevchenko


