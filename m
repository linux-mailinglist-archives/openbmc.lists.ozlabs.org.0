Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7418F93D
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 17:06:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mK4Y3R9dzDqjb
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 03:06:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJzb4l31zDqCt
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 03:02:02 +1100 (AEDT)
IronPort-SDR: 9SUU9oAvVH4BHSjAbks3pLu9/7mNprawNTRJtkNgknSbb1r14fEL8E9RtDtYMvUfzXUDmDkuE9
 GW1ALVSVajCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 09:02:00 -0700
IronPort-SDR: phtAgXXYbKsiJe/zuUmNdIE1gUiEZCE8YR7T4VrWwwkSIrwsF2/9wxBJwxSQMlx+2lPFi5ZkMR
 RMlpw1k/n3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="264820911"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2020 09:01:56 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jGPWY-00CHV3-M7; Mon, 23 Mar 2020 18:01:58 +0200
Date: Mon, 23 Mar 2020 18:01:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v9 3/3] i2c: npcm7xx: Add support for slave mode for
 Nuvoton
Message-ID: <20200323160158.GR1922688@smile.fi.intel.com>
References: <20200323134437.259210-1-tali.perry1@gmail.com>
 <20200323134437.259210-4-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200323134437.259210-4-tali.perry1@gmail.com>
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

On Mon, Mar 23, 2020 at 03:44:37PM +0200, Tali Perry wrote:
> Add support for slave mode for Nuvoton
> NPCM BMC I2C controller driver.

Same comments apply as per previous patch.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Perhaps create a separate module and compile it when user selects?
See I²C DesignWare split.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (bus->slave) {
> +		npcm_i2c_slave_enable_l(bus, I2C_SLAVE_ADDR1, bus->slave->addr,
> +					true);
> +	}

Put it on one line and drop {} -- it will be much better to read.

> +#endif

...

> +static void npcm_i2c_write_to_fifo_slave(struct npcm_i2c *bus,
> +					 u16 max_bytes_to_send)
> +{
> +	// Fill the FIFO, while the FIFO is not full and there are more bytes to
> +	// write
> +	npcm_i2c_clear_fifo_int(bus);
> +	npcm_i2c_clear_tx_fifo(bus);
> +	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
> +
> +	while ((max_bytes_to_send--) && (I2C_HW_FIFO_SIZE -
> +					 npcm_i2c_get_fifo_fullness(bus))) {
> +		if (bus->slv_wr_size > 0) {
> +			npcm_i2c_wr_byte(bus,
> +					 bus->slv_wr_buf[bus->slv_wr_ind %
> +					 I2C_HW_FIFO_SIZE]);
> +			bus->slv_wr_ind = (bus->slv_wr_ind + 1) %
> +					   I2C_HW_FIFO_SIZE;
> +			bus->slv_wr_size--; // size indicates the # of bytes in
> +					    // the SW FIFO, not HW.
> +		} else {
> +			break;
> +		}

This looks ugly. Can you redo the style.

> +	}
> +}

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +			if (bus->slave) {
> +				bus->slv_rd_buf[bus->slv_rd_ind %
> +						I2C_HW_FIFO_SIZE] = data;
> +				bus->slv_rd_ind++;
> +				if (bus->slv_rd_ind == 1 && bus->read_block_use)
> +					// 1st byte is length in block protocol
> +					bus->slv_rd_size = data +
> +							   (u8)bus->PEC_use +
> +							(u8)bus->read_block_use;
> +			}
> +#endif

Ditto.

...

>  		   I2C_FUNC_SMBUS_EMUL |
>  		   I2C_FUNC_SMBUS_BLOCK_DATA |
>  		   I2C_FUNC_SMBUS_PEC
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		   | I2C_FUNC_SLAVE
> +#endif

Completely inconsistent style.

>  		   ;

-- 
With Best Regards,
Andy Shevchenko


