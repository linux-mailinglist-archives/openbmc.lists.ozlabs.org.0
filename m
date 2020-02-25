Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAB16EF89
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 21:01:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RqZl3Fw2zDqJl
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 07:01:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Op4CdOv9; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RqZ255M8zDqT7
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 07:01:14 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id n96so186003pjc.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 12:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KjRFlsfuxT4vxziXeRHss8nPZaf91ZUGhPDlLtdF30A=;
 b=Op4CdOv9JYW/HfVxGkG/EoCql9hYePMyovqlYGe4tHzpWSLQkvPxYOHk6ygv8cP0re
 DBxudk62DrsgYY4E3XljVsXrw8Tpyd+n/eiWMw/YEljhoJQ4e9/KnEWPT1IO86EiPi2x
 2XoCbuDAG7iZ3tmNWSLjqq7z9yArIhX9PodEomS2MBb8MDD6vx8stMDk7WEdck6yL8uP
 fuAMKI97JSGNmQoHNnpr04RwC9wPOhnVheG0VdM0BFcVHbBuvfL/kAmpb2YuqHOzD5tJ
 e/jORxYy/3U0rfiiKGqRO3dL4Je4cUlsByba8HHhmfsuJxPjfX54B+1T0Qj2ylVWIWJR
 dJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KjRFlsfuxT4vxziXeRHss8nPZaf91ZUGhPDlLtdF30A=;
 b=bAU30GY1R9sSzEnMw3PTfUMSck41OkJ51hJFCVbdWo/ASUKM42Nue+MLiLSj63+764
 hcXp0JjmW+iNKTKHmHCVz9nxXksZ6RuhWMuTPviUYkH8PIvjq15F90uDdcVcGylg6RdY
 wO/0NFwZamRlffG9k7GHbvSk0uMtzQ29c7lh8/AuXWxepDNtdhi9cx0ITpbTwEi20BPF
 igw4dZAckWl8WQ4JWC/UMDrXoWAzjvYPMJo2xoOejb6OiQUCyGYvQBYJM0EiDIyUStpP
 xXxB0okCOR3uNtoJaP2xGG7Gg/fm4TFzD/pmk3LxWNPYJrEJxa+wqLG5BSfv+o+6j74a
 UsGQ==
X-Gm-Message-State: APjAAAVkKVjUrw887Cyg6757sVtszpVhTjr7zFzsPnawcMo4+TY1RMEC
 O9aWwXyNSYED+QzTUMy14fHAcQ==
X-Google-Smtp-Source: APXvYqwvDgAPn3GEozg3alU/iO6tq1c2UYPLL6tkdKM/d2mLJdS9Dqy+EuJ9hlzatZgL4KmyeSBNQw==
X-Received: by 2002:a17:902:b714:: with SMTP id
 d20mr189231pls.272.1582660869611; 
 Tue, 25 Feb 2020 12:01:09 -0800 (PST)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id l1sm4388979pjb.28.2020.02.25.12.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 12:01:09 -0800 (PST)
Date: Tue, 25 Feb 2020 12:01:04 -0800
From: Brendan Higgins <brendanhiggins@google.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v7 2/2] i2c: npcm: Add Nuvoton NPCM I2C controller driver
Message-ID: <20200225200104.GA105722@google.com>
References: <20191121095350.158689-1-tali.perry1@gmail.com>
 <20191121095350.158689-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121095350.158689-3-tali.perry1@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 wsa@the-dreams.de, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, robh+dt@kernel.org, syniurge@gmail.com,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:
> Add Nuvoton NPCM BMC i2c controller driver.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig       |   11 +
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-npcm7xx.c | 2485 ++++++++++++++++++++++++++++++
>  3 files changed, 2497 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 146ce40d8e0a..9091b93aaf90 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -786,6 +786,17 @@ config I2C_NOMADIK
>  	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
>  	  as well as the STA2X11 PCIe I/O HUB.
>  
> +config I2C_NPCM7XX
> +	tristate "Nuvoton I2C Controller"
> +	depends on ARCH_NPCM7XX

This should also depend on "|| COMPILE_TEST"

> +	select I2C_SLAVE

Personally, I would prefer if this was optional, but it's up to you.

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Nuvoton I2C controller.

Might want to elaborate about the capabilities of the driver/hardware.

> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-npcm7xx.

Probably unnecessary; this follows the pattern that most other I2C
drivers do.

>  config I2C_OCORES
>  	tristate "OpenCores I2C Controller"
>  	help
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aebc39c9..4af59a806f3c 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
>  obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
>  obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
>  obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
> +obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
>  obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
>  obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
>  obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> new file mode 100644
> index 000000000000..ce9699d56835
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -0,0 +1,2485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM7xx SMB Controller driver
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com

You should update the date.

> + */
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
> +
> +#define I2C_VERSION "0.1.0"

nit: You only use this macro in one place. I think it would be clearer
to just use the raw string there.

> +
> +enum smb_mode {
> +	SMB_SLAVE = 1,
> +	SMB_MASTER
> +};

Please use proper namespacing.

> +/*
> + * External SMB Interface driver xfer indication values, which indicate status
> + * of the bus.
> + */
> +enum smb_state_ind {
> +	SMB_NO_STATUS_IND = 0,
> +	SMB_SLAVE_RCV_IND = 1,
> +	SMB_SLAVE_XMIT_IND = 2,
> +	SMB_SLAVE_XMIT_MISSING_DATA_IND = 3,
> +	SMB_SLAVE_RESTART_IND = 4,
> +	SMB_SLAVE_DONE_IND = 5,
> +	SMB_MASTER_DONE_IND = 6,
> +	SMB_NACK_IND = 8,
> +	SMB_BUS_ERR_IND = 9,
> +	SMB_WAKE_UP_IND = 10,
> +	SMB_BLOCK_BYTES_ERR_IND = 12,
> +	SMB_SLAVE_RCV_MISSING_DATA_IND = 14,
> +};
> +
> +// SMBus Operation type values
> +enum smb_oper {
> +	SMB_NO_OPER = 0,
> +	SMB_WRITE_OPER = 1,
> +	SMB_READ_OPER = 2
> +};
> +
> +// SMBus Bank (FIFO mode)
> +enum smb_bank {
> +	SMB_BANK_0 = 0,
> +	SMB_BANK_1 = 1
> +};
> +
> +// Internal SMB states values (for the SMB module state machine).
> +enum smb_state {
> +	SMB_DISABLE = 0,
> +	SMB_IDLE,
> +	SMB_MASTER_START,
> +	SMB_SLAVE_MATCH,
> +	SMB_OPER_STARTED,
> +	SMB_STOP_PENDING
> +};
> +
> +// Module supports setting multiple own slave addresses
> +enum smb_addr {
> +	SMB_SLAVE_ADDR1 = 0,
> +	SMB_SLAVE_ADDR2,
> +	SMB_SLAVE_ADDR3,
> +	SMB_SLAVE_ADDR4,
> +	SMB_SLAVE_ADDR5,
> +	SMB_SLAVE_ADDR6,
> +	SMB_SLAVE_ADDR7,
> +	SMB_SLAVE_ADDR8,
> +	SMB_SLAVE_ADDR9,
> +	SMB_SLAVE_ADDR10,
> +	SMB_GC_ADDR,
> +	SMB_ARP_ADDR
> +};
> +
> +// global regs
> +static struct regmap *gcr_regmap;
> +static struct regmap *clk_regmap;

It's generally best to avoid global variables.

> +#define NPCM_I2CSEGCTL  0xE4
> +#define I2CSEGCTL_VAL	0x0333F000

What is this value? It doesn't look like a register offset.

> +// Common regs
> +#define NPCM_SMBSDA			0x000
> +#define NPCM_SMBST			0x002
> +#define NPCM_SMBCST			0x004
> +#define NPCM_SMBCTL1			0x006
> +#define NPCM_SMBADDR1			0x008
> +#define NPCM_SMBCTL2			0x00A
> +#define NPCM_SMBADDR2			0x00C
> +#define NPCM_SMBCTL3			0x00E
> +#define NPCM_SMBCST2			0x018
> +#define NPCM_SMBCST3			0x019
> +#define SMB_VER				0x01F

nit: I am guessing these are not 12 bit values. Can you use just two digits?

> +// BANK 0 regs
> +#define NPCM_SMBADDR3			0x010
> +#define NPCM_SMBADDR7			0x011
> +#define NPCM_SMBADDR4			0x012
> +#define NPCM_SMBADDR8			0x013
> +#define NPCM_SMBADDR5			0x014
> +#define NPCM_SMBADDR9			0x015
> +#define NPCM_SMBADDR6			0x016
> +#define NPCM_SMBADDR10			0x017
> +
> +// SMBADDR array: because the addr regs are sprinkled all over the address space
> +const int  NPCM_SMBADDR[10] = {NPCM_SMBADDR1, NPCM_SMBADDR2, NPCM_SMBADDR3,

Please only use all caps for macros.

> +			       NPCM_SMBADDR4, NPCM_SMBADDR5, NPCM_SMBADDR6,
> +			       NPCM_SMBADDR7, NPCM_SMBADDR8, NPCM_SMBADDR9,
> +			       NPCM_SMBADDR10};
> +
> +#define NPCM_SMBCTL4			0x01A
> +#define NPCM_SMBCTL5			0x01B
> +#define NPCM_SMBSCLLT			0x01C // SCL Low Time
> +#define NPCM_SMBFIF_CTL			0x01D // FIFO Control
> +#define NPCM_SMBSCLHT			0x01E // SCL High Time
> +
> +// BANK 1 regs
> +#define NPCM_SMBFIF_CTS			0x010 // Both FIFOs Control and status
> +#define NPCM_SMBTXF_CTL			0x012 // Tx-FIFO Control
> +#define NPCM_SMBT_OUT			0x014 // Bus T.O.
> +#define NPCM_SMBPEC			0x016 // PEC Data
> +#define NPCM_SMBTXF_STS			0x01A // Tx-FIFO Status
> +#define NPCM_SMBRXF_STS			0x01C // Rx-FIFO Status
> +#define NPCM_SMBRXF_CTL			0x01E // Rx-FIFO Control
> +
> +// NPCM_SMBST reg fields
> +#define NPCM_SMBST_XMIT			BIT(0)
> +#define NPCM_SMBST_MASTER		BIT(1)
> +#define NPCM_SMBST_NMATCH		BIT(2)
> +#define NPCM_SMBST_STASTR		BIT(3)
> +#define NPCM_SMBST_NEGACK		BIT(4)
> +#define NPCM_SMBST_BER			BIT(5)
> +#define NPCM_SMBST_SDAST		BIT(6)
> +#define NPCM_SMBST_SLVSTP		BIT(7)
> +
> +// NPCM_SMBCST reg fields
> +#define NPCM_SMBCST_BUSY		BIT(0)
> +#define NPCM_SMBCST_BB			BIT(1)
> +#define NPCM_SMBCST_MATCH		BIT(2)
> +#define NPCM_SMBCST_GCMATCH		BIT(3)
> +#define NPCM_SMBCST_TSDA		BIT(4)
> +#define NPCM_SMBCST_TGSCL		BIT(5)
> +#define NPCM_SMBCST_MATCHAF		BIT(6)
> +#define NPCM_SMBCST_ARPMATCH		BIT(7)
> +
> +// NPCM_SMBCTL1 reg fields
> +#define NPCM_SMBCTL1_START		BIT(0)
> +#define NPCM_SMBCTL1_STOP		BIT(1)
> +#define NPCM_SMBCTL1_INTEN		BIT(2)
> +#define NPCM_SMBCTL1_EOBINTE		BIT(3)
> +#define NPCM_SMBCTL1_ACK		BIT(4)
> +#define NPCM_SMBCTL1_GCMEN		BIT(5)
> +#define NPCM_SMBCTL1_NMINTE		BIT(6)
> +#define NPCM_SMBCTL1_STASTRE		BIT(7)
> +
> +// RW1S fields (inside a RW reg):
> +#define NPCM_SMBCTL1_RWS_FIELDS	  (NPCM_SMBCTL1_START | NPCM_SMBCTL1_STOP | \
> +				   NPCM_SMBCTL1_ACK)
> +// NPCM_SMBADDR reg fields
> +#define NPCM_SMBADDR_A			GENMASK(6, 0)
> +#define NPCM_SMBADDR_SAEN		BIT(7)
> +
> +// NPCM_SMBCTL2 reg fields
> +#define SMBCTL2_ENABLE			BIT(0)
> +#define SMBCTL2_SCLFRQ6_0		GENMASK(7, 1)
> +
> +// NPCM_SMBCTL3 reg fields
> +#define SMBCTL3_SCLFRQ8_7		GENMASK(1, 0)
> +#define SMBCTL3_ARPMEN			BIT(2)
> +#define SMBCTL3_IDL_START		BIT(3)
> +#define SMBCTL3_400K_MODE		BIT(4)
> +#define SMBCTL3_BNK_SEL			BIT(5)
> +#define SMBCTL3_SDA_LVL			BIT(6)
> +#define SMBCTL3_SCL_LVL			BIT(7)
> +
> +// NPCM_SMBCST2 reg fields
> +#define NPCM_SMBCST2_MATCHA1F		BIT(0)
> +#define NPCM_SMBCST2_MATCHA2F		BIT(1)
> +#define NPCM_SMBCST2_MATCHA3F		BIT(2)
> +#define NPCM_SMBCST2_MATCHA4F		BIT(3)
> +#define NPCM_SMBCST2_MATCHA5F		BIT(4)
> +#define NPCM_SMBCST2_MATCHA6F		BIT(5)
> +#define NPCM_SMBCST2_MATCHA7F		BIT(5)
> +#define NPCM_SMBCST2_INTSTS		BIT(7)
> +
> +// NPCM_SMBCST3 reg fields
> +#define NPCM_SMBCST3_MATCHA8F		BIT(0)
> +#define NPCM_SMBCST3_MATCHA9F		BIT(1)
> +#define NPCM_SMBCST3_MATCHA10F		BIT(2)
> +#define NPCM_SMBCST3_EO_BUSY		BIT(7)
> +
> +// NPCM_SMBCTL4 reg fields
> +#define SMBCTL4_HLDT			GENMASK(5, 0)
> +#define SMBCTL4_LVL_WE			BIT(7)
> +
> +// NPCM_SMBCTL5 reg fields
> +#define SMBCTL5_DBNCT			GENMASK(3, 0)
> +
> +// NPCM_SMBFIF_CTS reg fields
> +#define NPCM_SMBFIF_CTS_RXF_TXE		BIT(1)
> +#define NPCM_SMBFIF_CTS_RFTE_IE		BIT(3)
> +#define NPCM_SMBFIF_CTS_CLR_FIFO	BIT(6)
> +#define NPCM_SMBFIF_CTS_SLVRSTR		BIT(7)
> +
> +// NPCM_SMBTXF_CTL reg fields
> +#define NPCM_SMBTXF_CTL_TX_THR		GENMASK(4, 0)
> +#define NPCM_SMBTXF_CTL_THR_TXIE	BIT(6)
> +
> +// NPCM_SMBT_OUT reg fields
> +#define NPCM_SMBT_OUT_TO_CKDIV		GENMASK(5, 0)
> +#define NPCM_SMBT_OUT_T_OUTIE		BIT(6)
> +#define NPCM_SMBT_OUT_T_OUTST		BIT(7)
> +
> +// NPCM_SMBTXF_STS reg fields
> +#define NPCM_SMBTXF_STS_TX_BYTES	GENMASK(4, 0)
> +#define NPCM_SMBTXF_STS_TX_THST		BIT(6)
> +
> +// NPCM_SMBRXF_STS reg fields
> +#define NPCM_SMBRXF_STS_RX_BYTES	GENMASK(4, 0)
> +#define NPCM_SMBRXF_STS_RX_THST		BIT(6)
> +
> +// NPCM_SMBFIF_CTL reg fields
> +#define NPCM_SMBFIF_CTL_FIFO_EN		BIT(4)
> +
> +// NPCM_SMBRXF_CTL reg fields
> +#define NPCM_SMBRXF_CTL_RX_THR		GENMASK(4, 0)
> +#define NPCM_SMBRXF_CTL_LAST_PEC	BIT(5)
> +#define NPCM_SMBRXF_CTL_THR_RXIE	BIT(6)
> +
> +#define SMBUS_FIFO_SIZE			16
> +
> +// SMB_VER reg fields
> +#define SMB_VER_VERSION			GENMASK(6, 0)
> +#define SMB_VER_FIFO_EN			BIT(7)
> +
> +// stall/stuck timeout
> +const unsigned int DEFAULT_STALL_COUNT =	25;
> +
> +// retries in a loop for master abort
> +const unsigned int RETRIES_NUM =	10000;
> +
> +// SMBus spec. values in KHZ
> +const unsigned int SMBUS_FREQ_MIN = 10;
> +const unsigned int SMBUS_FREQ_MAX = 1000;
> +const unsigned int SMBUS_FREQ_100KHZ = 100;
> +const unsigned int SMBUS_FREQ_400KHZ = 400;
> +const unsigned int SMBUS_FREQ_1MHZ = 1000;

Does the hardware only support these clock speeds?

> +// SCLFRQ min/max field values
> +const unsigned int SCLFRQ_MIN = 10;
> +const unsigned int SCLFRQ_MAX = 511;
> +
> +// SCLFRQ field position
> +#define SCLFRQ_0_TO_6		GENMASK(6, 0)
> +#define SCLFRQ_7_TO_8		GENMASK(8, 7)
> +
> +const unsigned int SMB_NUM_OF_ADDR = 10;
> +
> +#define NPCM_I2C_EVENT_START	BIT(0)
> +#define NPCM_I2C_EVENT_STOP	BIT(1)
> +#define NPCM_I2C_EVENT_ABORT	BIT(2)
> +#define NPCM_I2C_EVENT_WRITE	BIT(3)
> +
> +#define NPCM_I2C_EVENT_READ	BIT(4)
> +#define NPCM_I2C_EVENT_BER	BIT(5)
> +#define NPCM_I2C_EVENT_NACK	BIT(6)
> +#define NPCM_I2C_EVENT_TO	BIT(7)
> +
> +#define NPCM_I2C_EVENT_EOB	BIT(8)
> +#define NPCM_I2C_EVENT_STALL	BIT(9)
> +#define NPCM_I2C_EVENT_CB	BIT(10)
> +#define NPCM_I2C_EVENT_DONE	BIT(11)
> +
> +#define NPCM_I2C_EVENT_READ1	BIT(12)
> +#define NPCM_I2C_EVENT_READ2	BIT(13)
> +#define NPCM_I2C_EVENT_READ3	BIT(14)
> +#define NPCM_I2C_EVENT_READ4	BIT(15)
> +
> +#define NPCM_I2C_EVENT_NMATCH_SLV	BIT(16)
> +#define NPCM_I2C_EVENT_NMATCH_MSTR	BIT(17)
> +#define NPCM_I2C_EVENT_BER_SLV		BIT(18)
> +
> +#define NPCM_I2C_EVENT_LOG(event)	(bus->event_log |= event)
> +
> +// Status of one SMBus module
> +struct npcm_i2c {
> +	struct i2c_adapter	adap;
> +	struct device		*dev;
> +	unsigned char __iomem	*reg;
> +	spinlock_t		lock;   /* IRQ synchronization */
> +	struct completion	cmd_complete;
> +	int			irq;
> +	int			cmd_err;
> +	struct i2c_msg		*msgs;
> +	int			msgs_num;
> +	int			num;
> +	u32			apb_clk;
> +	struct i2c_bus_recovery_info rinfo;
> +	enum smb_state		state;
> +	enum smb_oper		operation;
> +	enum smb_mode		master_or_slave;
> +	enum smb_state_ind	stop_ind;
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
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Aha! It appears that selecting I2C_SLAVE is unnecessary.

Since you already ifdeffed out all the I2C slave code, can you put it in
a separate patch to make this easier to review?

> +	u8			own_slave_addr;
> +	struct i2c_client	*slave;
> +
> +	// currently I2C slave IF only supports single byte operations.
> +	// in order to utilyze the npcm HW FIFO, the driver will ask for 16bytes
> +	// at a time, pack them in buffer, and then transmit them all together
> +	// to the FIFO and onward to the bus .
> +	// NACK on read will be once reached to bus->adap->quirks->max_read_len
> +	// sending a NACK whever the backend requests for it is not supported.
> +
> +	// This module can be master and slave at the same time. separate ptrs
> +	// and counters:
> +	int			slv_rd_size;
> +	int			slv_rd_ind;
> +	int			slv_wr_size;
> +	int			slv_wr_ind;
> +	u8			slv_rd_buf[SMBUS_FIFO_SIZE];
> +	u8			slv_wr_buf[SMBUS_FIFO_SIZE];
> +#endif
> +};

Cheers!
