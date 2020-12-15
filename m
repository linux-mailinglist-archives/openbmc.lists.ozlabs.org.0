Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3082DAA64
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 10:48:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwD341hR9zDqL0
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 20:48:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwD1r1y9wzDqBy;
 Tue, 15 Dec 2020 20:47:09 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0BF9gUfu077791;
 Tue, 15 Dec 2020 17:42:30 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Dec
 2020 17:45:45 +0800
Date: Tue, 15 Dec 2020 17:45:33 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20201215094532.GB24903@aspeedtech.com>
References: <20201209075921.26689-1-troy_lee@aspeedtech.com>
 <20201209075921.26689-5-troy_lee@aspeedtech.com>
 <20201210161653.GA107395@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20201210161653.GA107395@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BF9gUfu077791
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
Cc: "open list:HARDWARE
 MONITORING" <linux-hwmon@vger.kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "leetroy@gmail.com" <leetroy@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 12/11/2020 00:16, Guenter Roeck wrote:
> On Wed, Dec 09, 2020 at 03:59:20PM +0800, Troy Lee wrote:
> > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> > 16 FAN tacho channel.
> > 
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > ---
> >  drivers/hwmon/Kconfig                |   10 +
> >  drivers/hwmon/Makefile               |    1 +
> >  drivers/hwmon/aspeed2600-pwm-tacho.c | 1053 ++++++++++++++++++++++++++
> >  3 files changed, 1064 insertions(+)
> >  create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c
> > 
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 9aa89d7d4193..097c01430259 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -400,6 +400,16 @@ config SENSORS_ASPEED
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called aspeed_pwm_tacho.
> >  
> > +config SENSORS_ASPEED2600_PWM_TACHO
> > +        tristate "ASPEED AST2600 PWM and Fan Tachometer"
> > +        depends on THERMAL || THERMAL=n
> > +        help
> > +          This driver provides support for ASPEED AST2600 PWM
> > +          and Fan Tacho controllers.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called aspeed2600-pwm-tacho.
> > +
> >  config SENSORS_ATXP1
> >  	tristate "Attansic ATXP1 VID controller"
> >  	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index ae41ee71a71b..10be45768d36 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
> >  obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
> >  obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
> >  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
> > +obj-$(CONFIG_SENSORS_ASPEED2600_PWM_TACHO)      += aspeed2600-pwm-tacho.o
> >  obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
> >  obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
> >  obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
> > diff --git a/drivers/hwmon/aspeed2600-pwm-tacho.c b/drivers/hwmon/aspeed2600-pwm-tacho.c
> > new file mode 100644
> > index 000000000000..083eb3b253ff
> > --- /dev/null
> > +++ b/drivers/hwmon/aspeed2600-pwm-tacho.c
> > @@ -0,0 +1,1053 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) ASPEED Technology Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 or later as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/errno.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/delay.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/reset.h>
> > +#include <linux/regmap.h>
> > +#include <linux/thermal.h>
> > +/**********************************************************
> > + * PWM HW register offset define
> > + *********************************************************/
> > +//PWM Control Register
> 
> Please no C++ comments, and please use standard multi-line comments.
> 
Understood.

> > +#define ASPEED_PWM_CTRL_CH(ch)			((ch * 0x10) + 0x00)
> > +//PWM Duty Cycle Register
> > +#define ASPEED_PWM_DUTY_CYCLE_CH(ch)		((ch * 0x10) + 0x04)
> > +//TACH Control Register
> > +#define ASPEED_TACHO_CTRL_CH(ch)		((ch * 0x10) + 0x08)
> 
> (ch)
> 
> > +//TACH Status Register
> > +#define ASPEED_TACHO_STS_CH(x)			((x * 0x10) + 0x0C)
> 
> (x)
> 
Good catch.

> > +/**********************************************************
> > + * PWM register Bit field
> > + *********************************************************/
> > +/*PWM_CTRL */
> > +#define  PWM_LOAD_SEL_AS_WDT_BIT	(19)	//load selection as WDT
> > +#define  PWM_DUTY_LOAD_AS_WDT_EN	BIT(18)	//enable PWM duty load as WDT
> > +#define  PWM_DUTY_SYNC_DIS		BIT(17)	//disable PWM duty sync
> > +#define	 PWM_CLK_ENABLE			BIT(16)	//enable PWM clock
> > +#define  PWM_LEVEL_OUTPUT		BIT(15)	//output PWM level
> > +#define  PWM_INVERSE			BIT(14) //inverse PWM pin
> > +#define  PWM_OPEN_DRAIN_EN		BIT(13)	//enable open-drain
> > +#define  PWM_PIN_EN			BIT(12) //enable PWM pin
> > +#define  PWM_CLK_DIV_H_MASK		(0xf << 8) //PWM clock division H bit [3:0]
> > +#define  PWM_CLK_DIV_L_MASK		(0xff)	//PWM clock division H bit [3:0]
> > +/* [19] */
> > +#define LOAD_SEL_FALLING 0
> > +#define LOAD_SEL_RIGING  1
> > +
> > +/*PWM_DUTY_CYCLE */
> > +#define  PWM_PERIOD_BIT					(24)	//pwm period bit [7:0]
> > +#define  PWM_PERIOD_BIT_MASK			(0xff << 24)	//pwm period bit [7:0]
> > +#define  PWM_RISING_FALLING_AS_WDT_BIT  (16)
> > +#define  PWM_RISING_FALLING_AS_WDT_MASK (0xff << 16)	//pwm rising/falling point bit [7:0] as WDT
> > +#define  PWM_RISING_FALLING_MASK		(0xffff)
> > +#define  PWM_FALLING_POINT_BIT			(8)	//pwm falling point bit [7:0]
> > +#define  PWM_RISING_POINT_BIT			(0)	//pwm rising point bit [7:0]
> > +/* [31:24] */
> > +#define  DEFAULT_PWM_PERIOD 0xff
> > +
> > +/*PWM_TACHO_CTRL */
> > +#define  TACHO_IER						BIT(31)	//enable tacho interrupt
> > +#define  TACHO_INVERS_LIMIT				BIT(30) //inverse tacho limit comparison
> > +#define  TACHO_LOOPBACK					BIT(29) //tacho loopback
> > +#define  TACHO_ENABLE					BIT(28)	//{enable tacho}
> > +#define  TACHO_DEBOUNCE_MASK			(0x3 << 26) //{tacho de-bounce}
> > +#define  TACHO_DEBOUNCE_BIT				(26) //{tacho de-bounce}
> > +#define  TECHIO_EDGE_MASK				(0x3 << 24) //tacho edge}
> > +#define  TECHIO_EDGE_BIT				(24) //tacho edge}
> > +#define  TACHO_CLK_DIV_T_MASK			(0xf << 20)
> > +#define  TACHO_CLK_DIV_BIT				(20)
> > +#define  TACHO_THRESHOLD_MASK			(0xfffff)	//tacho threshold bit
> > +/* [27:26] */
> > +#define DEBOUNCE_3_CLK 0x00 /* 10b */
> > +#define DEBOUNCE_2_CLK 0x01 /* 10b */
> > +#define DEBOUNCE_1_CLK 0x02 /* 10b */
> > +#define DEBOUNCE_0_CLK 0x03 /* 10b */
> > +/* [25:24] */
> > +#define F2F_EDGES 0x00 /* 10b */
> > +#define R2R_EDGES 0x01 /* 10b */
> > +#define BOTH_EDGES 0x02 /* 10b */
> > +/* [23:20] */
> > +/* Cover rpm range 5~5859375 */
> > +#define  DEFAULT_TACHO_DIV 5
> > +
> > +/*PWM_TACHO_STS */
> > +#define  TACHO_ISR			BIT(31)	//interrupt status and clear
> > +#define  PWM_OUT			BIT(25)	//{pwm_out}
> > +#define  PWM_OEN			BIT(24)	//{pwm_oeN}
> > +#define  TACHO_DEB_INPUT	BIT(23)	//tacho deB input
> > +#define  TACHO_RAW_INPUT	BIT(22) //tacho raw input}
> > +#define  TACHO_VALUE_UPDATE	BIT(21)	//tacho value updated since the last read
> > +#define  TACHO_FULL_MEASUREMENT	BIT(20) //{tacho full measurement}
> > +#define  TACHO_VALUE_MASK	0xfffff	//tacho value bit [19:0]}
> > +/**********************************************************
> > + * Software setting
> > + *********************************************************/
> > +#define DEFAULT_TARGET_PWM_FREQ		25000
> > +#define DEFAULT_FAN_PULSE_PR 2
> > +#define MAX_CDEV_NAME_LEN 16
> > +
> > +struct aspeed_pwm_channel_params {
> > +	int target_freq;
> > +	int pwm_freq;
> > +	int load_wdt_rising_falling_pt;
> > +	int load_wdt_selection;		//0: rising , 1: falling
> > +	int load_wdt_enable;
> > +	int	duty_sync_enable;
> > +	int invert_pin;
> > +	u8	rising;
> > +	u8	falling;
> > +};
> > +
> > +static struct aspeed_pwm_channel_params default_pwm_params[] = {
> > +	[0] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 1,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> 
> I am in general very much opposed to include default configurations
> in hwmon drivers. Configuration should be provided through devicetree,
> or through platform data.
> 
I'll move most of these configurations into devicetree.

> > +	[1] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[2] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[3] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[4] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[5] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[6] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[7] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[8] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[9] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[10] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[11] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[12] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[13] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[14] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +	[15] = {
> > +		.target_freq = 25000,
> > +		.load_wdt_rising_falling_pt = 0x10,
> > +		.load_wdt_selection = LOAD_SEL_FALLING,
> > +		.load_wdt_enable = 0,
> > +		.duty_sync_enable = 0,
> > +		.invert_pin = 0,
> > +		.rising = 0x00,
> > +		.falling = 0x0a,
> > +	},
> > +};
> > +
> > +struct aspeed_tacho_channel_params {
> > +	int limited_inverse;
> > +	u16 threshold;
> > +	u8	tacho_edge;
> > +	u8	tacho_debounce;
> > +	u8  pulse_pr;
> > +	u32	divide;
> > +};
> > +
> > +
> > +static struct aspeed_tacho_channel_params default_tacho_params[] = {
> > +	[0] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> 
> Same as above.
> 
> > +	},
> > +	[1] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[2] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[3] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[4] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[5] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[6] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[7] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[8] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[9] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[10] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[11] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[12] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[13] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[14] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +	[15] = {
> > +		.limited_inverse = 0,
> > +		.threshold = 0,
> > +		.tacho_edge = F2F_EDGES,
> > +		.tacho_debounce = DEBOUNCE_3_CLK,
> > +		.pulse_pr = DEFAULT_FAN_PULSE_PR,
> > +		.divide = 8,
> > +	},
> > +};
> > +
> > +struct aspeed_pwm_tachometer_data {
> > +	struct regmap *regmap;
> > +	unsigned long clk_freq;
> > +	struct reset_control *reset;
> > +	bool pwm_present[16];
> > +	bool fan_tach_present[16];
> > +	struct aspeed_pwm_channel_params *pwm_channel;
> > +	struct aspeed_tacho_channel_params *tacho_channel;
> > +	/* for thermal */
> > +	struct aspeed_cooling_device *cdev[8];
> 
> This makes me wonder if this should be a thermal driver instead.
> Any thoughts ?
> 
> > +	/* for hwmon */
> > +	const struct attribute_group *groups[3];
> > +};
> > +
> > +struct aspeed_cooling_device {
> > +	char name[16];
> > +	struct aspeed_pwm_tachometer_data *priv;
> > +	struct thermal_cooling_device *tcdev;
> > +	int pwm_channel;
> > +	u8 *cooling_levels;
> > +	u8 max_state;
> > +	u8 cur_state;
> > +};
> > +
> > +static int regmap_aspeed_pwm_tachometer_reg_write(void *context, unsigned int reg,
> > +					     unsigned int val)
> > +{
> > +	void __iomem *regs = (void __iomem *)context;
> > +
> > +	writel(val, regs + reg);
> > +	return 0;
> > +}
> > +
> > +static int regmap_aspeed_pwm_tachometer_reg_read(void *context, unsigned int reg,
> > +					    unsigned int *val)
> > +{
> > +	void __iomem *regs = (void __iomem *)context;
> > +
> > +	*val = readl(regs + reg);
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_config aspeed_pwm_tachometer_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = 0x100,
> > +	.reg_write = regmap_aspeed_pwm_tachometer_reg_write,
> > +	.reg_read = regmap_aspeed_pwm_tachometer_reg_read,
> > +	.fast_io = true,
> > +};
> > +
> > +static void aspeed_set_pwm_channel_enable(struct regmap *regmap, u8 pwm_channel,
> > +				       bool enable)
> > +{
> > +	regmap_update_bits(regmap, ASPEED_PWM_CTRL_CH(pwm_channel),
> > +			   (PWM_CLK_ENABLE | PWM_PIN_EN),
> > +			   enable ? (PWM_CLK_ENABLE | PWM_PIN_EN) : 0);
> 
> Unnecessary ()
> 
OK.

> > +}
> > +
> > +static void aspeed_set_fan_tach_ch_enable(struct aspeed_pwm_tachometer_data *priv, u8 fan_tach_ch,
> > +					  bool enable, u32 tacho_div)
> 
> This function is only called with enable == true. Please no unnecessary
> complexity.
> 
> > +{
> > +	u32 reg_value = 0;
> 
> Unnecessary initialization.
> 
> > +
> > +	if (enable) {
> > +		/* divide = 2^(tacho_div*2) */
> > +		priv->tacho_channel[fan_tach_ch].divide = 1 << (tacho_div << 1);
> > +
> > +		reg_value = TACHO_ENABLE |
> > +				(priv->tacho_channel[fan_tach_ch].tacho_edge << TECHIO_EDGE_BIT) |
> > +				(tacho_div << TACHO_CLK_DIV_BIT) |
> > +				(priv->tacho_channel[fan_tach_ch].tacho_debounce << TACHO_DEBOUNCE_BIT);
> > +
> > +		if (priv->tacho_channel[fan_tach_ch].limited_inverse)
> > +			reg_value |= TACHO_INVERS_LIMIT;
> > +
> > +		if (priv->tacho_channel[fan_tach_ch].threshold)
> > +			reg_value |= (TACHO_IER | priv->tacho_channel[fan_tach_ch].threshold);
> > +
> > +		regmap_write(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch), reg_value);
> > +	} else
> > +		regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch),  TACHO_ENABLE, 0);
> > +}
> > +
> > +/*
> > + * The PWM frequency = HCLK(200Mhz) / (clock division L bit *
> > + * clock division H bit * (period bit + 1))
> > + */
> > +static void aspeed_set_pwm_channel_fan_ctrl(struct device *dev,
> > +					    struct aspeed_pwm_tachometer_data *priv,
> > +					    u8 index, u8 fan_ctrl)
> > +{
> > +	u32 duty_value,	ctrl_value;
> > +	u32 div_h, div_l, cal_freq;
> > +	u8 div_found;
> 
> div_found is used as boolean. Declaring it u8 makes the code more complex
> on many architectures. Please use bool.
> 
> > +
> > +	if (fan_ctrl == 0) {
> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, false);
> 
> Consider using return; here and drop else.
> 
> > +	} else {
> > +		cal_freq = priv->clk_freq / (DEFAULT_PWM_PERIOD + 1);
> > +		//calculate for target frequence
> > +		div_found = 0;
> > +		for (div_h = 0; div_h < 0x10; div_h++) {
> > +			for (div_l = 0; div_l < 0x100; div_l++) {
> > +				dev_dbg(dev, "div h %x, l : %x , freq %ld \n", div_h, div_l,
> > +						(cal_freq / (BIT(div_h) * (div_l + 1))));
> > +				if ((cal_freq / (BIT(div_h) * (div_l + 1))) < priv->pwm_channel[index].target_freq) {
> > +					div_found = 1;
> > +					break;
> > +				}
> > +			}
> > +			if (div_found)
> > +				break;
> > +		}
> 
> This double loop is quite expensive. Are yu sure there is no better means to
> determine the fan divider ? By using a binary search, maybe ?
> 
> Also, what happens if div_found is false at the end ? The code below suggests
> that this would be problematic.
> 
I'll change the algorithm, so it would not be double loop and remote the need
of div_found.

> > +
> > +		priv->pwm_channel[index].pwm_freq = cal_freq / (BIT(div_h) * (div_l + 1));
> > +		dev_dbg(dev, "div h %x, l : %x pwm out clk %d \n", div_h, div_l,
> > +				priv->pwm_channel[index].pwm_freq);
> > +		dev_dbg(dev, "hclk %ld, target pwm freq %d, real pwm freq %d\n", priv->clk_freq,
> > +				priv->pwm_channel[index].target_freq, priv->pwm_channel[index].pwm_freq);
> > +
> > +		ctrl_value = (div_h << 8) | div_l;
> > +
> > +		duty_value = (DEFAULT_PWM_PERIOD << PWM_PERIOD_BIT) |
> > +					(0 << PWM_RISING_POINT_BIT) | (fan_ctrl << PWM_FALLING_POINT_BIT);
> > +
> > +		if (priv->pwm_channel[index].load_wdt_enable) {
> > +			ctrl_value |= PWM_DUTY_LOAD_AS_WDT_EN;
> > +			ctrl_value |= priv->pwm_channel[index].load_wdt_selection << PWM_LOAD_SEL_AS_WDT_BIT;
> > +			duty_value |= (priv->pwm_channel[index].load_wdt_rising_falling_pt << PWM_RISING_FALLING_AS_WDT_BIT);
> > +		}
> > +
> > +		regmap_write(priv->regmap, ASPEED_PWM_DUTY_CYCLE_CH(index), duty_value);
> > +		regmap_write(priv->regmap, ASPEED_PWM_CTRL_CH(index), ctrl_value);
> > +
> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, true);
> > +	}
> > +}
> > +
> > +static int aspeed_get_fan_tach_ch_rpm(struct device *dev, struct aspeed_pwm_tachometer_data *priv,
> > +				      u8 fan_tach_ch)
> > +{
> > +	u32 raw_data, tach_div, clk_source, val;
> > +	int i, retries = 3;
> > +
> > +	for (i = 0; i < retries; i++) {
> > +		regmap_read(priv->regmap, ASPEED_TACHO_STS_CH(fan_tach_ch), &val);
> > +		if (TACHO_FULL_MEASUREMENT & val)
> 
> No Yoda programming please.
> 
Understood.

> > +			break;
> > +	}
> > +
> > +	raw_data = val & TACHO_VALUE_MASK;
> > +	if (raw_data == 0xfffff)
> > +		return 0;
> > +
> > +	raw_data += 1;
> > +
> > +	/*
> > +	 * We need the mode to determine if the raw_data is double (from
> > +	 * counting both edges).
> > +	 */
> > +	tach_div = raw_data * (priv->tacho_channel[fan_tach_ch].divide) * (priv->tacho_channel[fan_tach_ch].pulse_pr);
> > +
> > +	dev_dbg(dev, "clk %ld, raw_data %d , tach_div %d  \n", priv->clk_freq, raw_data, tach_div);
> > +	clk_source = priv->clk_freq;
> > +
> > +	if (raw_data == 0)
> > +		return 0;
> 
> How would raw_data ever be 0 here ? And why check it after using it,
> and not before ?
> 
No, it wouldn't be 0 here.

> > +
> > +	return ((clk_source / tach_div) * 60);
> > +
> > +}
> > +
> > +static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
> > +		       const char *buf, size_t count)
> > +{
> > +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> > +	int index = sensor_attr->index;
> > +	int ret;
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +	long fan_ctrl;
> > +	u8 org_falling = priv->pwm_channel[index].falling;
> > +
> > +	ret = kstrtol(buf, 10, &fan_ctrl);
> > +	if (ret != 0)
> > +		return ret;
> > +
> > +	if (fan_ctrl < 0 || fan_ctrl > DEFAULT_PWM_PERIOD)
> > +		return -EINVAL;
> 
> Please use kstrtoul().
> 
After change to use devm_device_hwmon_register_with_info, the kstrtoul doesn't
require anymore, this it will be removed in v2.

> > +
> > +	if (priv->pwm_channel[index].falling == fan_ctrl)
> > +		return count;
> > +
> > +	priv->pwm_channel[index].falling = fan_ctrl;
> > +
> > +	if (fan_ctrl == 0)
> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, false);
> > +	else {
> > +		if (fan_ctrl == DEFAULT_PWM_PERIOD)
> > +			regmap_update_bits(priv->regmap,
> > +					   ASPEED_PWM_DUTY_CYCLE_CH(index),
> > +					   GENMASK(15, 0), 0);
> > +		else
> > +			regmap_update_bits(priv->regmap,
> > +					   ASPEED_PWM_DUTY_CYCLE_CH(index),
> > +					   GENMASK(15, 8),
> > +					   (fan_ctrl << PWM_FALLING_POINT_BIT));
> > +	}
> > +
> > +	if (org_falling == 0)
> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, true);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
> > +			char *buf)
> > +{
> > +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> > +	int index = sensor_attr->index;
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +
> > +	return sprintf(buf, "%u\n", priv->pwm_channel[index].falling);
> > +}
> > +
> > +static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
> > +			char *buf)
> > +{
> > +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> > +	int index = sensor_attr->index;
> > +	int rpm;
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +
> > +	rpm = aspeed_get_fan_tach_ch_rpm(dev, priv, index);
> > +	if (rpm < 0)
> > +		return rpm;
> > +
> > +	return sprintf(buf, "%d\n", rpm);
> > +}
> > +
> > +static umode_t pwm_is_visible(struct kobject *kobj,
> > +			      struct attribute *a, int index)
> > +{
> > +	struct device *dev = container_of(kobj, struct device, kobj);
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +
> > +	if (!priv->pwm_present[index])
> > +		return 0;
> > +	return a->mode;
> > +}
> > +
> > +static umode_t fan_dev_is_visible(struct kobject *kobj,
> > +				  struct attribute *a, int index)
> > +{
> > +	struct device *dev = container_of(kobj, struct device, kobj);
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +
> > +	if (!priv->fan_tach_present[index])
> > +		return 0;
> > +	return a->mode;
> > +}
> > +
> > +static SENSOR_DEVICE_ATTR(pwm0, 0644,
> > +			show_pwm, set_pwm, 0);
> > +static SENSOR_DEVICE_ATTR(pwm1, 0644,
> > +			show_pwm, set_pwm, 1);
> > +static SENSOR_DEVICE_ATTR(pwm2, 0644,
> > +			show_pwm, set_pwm, 2);
> > +static SENSOR_DEVICE_ATTR(pwm3, 0644,
> > +			show_pwm, set_pwm, 3);
> > +static SENSOR_DEVICE_ATTR(pwm4, 0644,
> > +			show_pwm, set_pwm, 4);
> > +static SENSOR_DEVICE_ATTR(pwm5, 0644,
> > +			show_pwm, set_pwm, 5);
> > +static SENSOR_DEVICE_ATTR(pwm6, 0644,
> > +			show_pwm, set_pwm, 6);
> > +static SENSOR_DEVICE_ATTR(pwm7, 0644,
> > +			show_pwm, set_pwm, 7);
> > +static SENSOR_DEVICE_ATTR(pwm8, 0644,
> > +			show_pwm, set_pwm, 8);
> > +static SENSOR_DEVICE_ATTR(pwm9, 0644,
> > +			show_pwm, set_pwm, 9);
> > +static SENSOR_DEVICE_ATTR(pwm10, 0644,
> > +			show_pwm, set_pwm, 10);
> > +static SENSOR_DEVICE_ATTR(pwm11, 0644,
> > +			show_pwm, set_pwm, 11);
> > +static SENSOR_DEVICE_ATTR(pwm12, 0644,
> > +			show_pwm, set_pwm, 12);
> > +static SENSOR_DEVICE_ATTR(pwm13, 0644,
> > +			show_pwm, set_pwm, 13);
> > +static SENSOR_DEVICE_ATTR(pwm14, 0644,
> > +			show_pwm, set_pwm, 14);
> > +static SENSOR_DEVICE_ATTR(pwm15, 0644,
> > +			show_pwm, set_pwm, 15);
> > +static struct attribute *pwm_dev_attrs[] = {
> > +	&sensor_dev_attr_pwm0.dev_attr.attr,
> > +	&sensor_dev_attr_pwm1.dev_attr.attr,
> > +	&sensor_dev_attr_pwm2.dev_attr.attr,
> > +	&sensor_dev_attr_pwm3.dev_attr.attr,
> > +	&sensor_dev_attr_pwm4.dev_attr.attr,
> > +	&sensor_dev_attr_pwm5.dev_attr.attr,
> > +	&sensor_dev_attr_pwm6.dev_attr.attr,
> > +	&sensor_dev_attr_pwm7.dev_attr.attr,
> > +	&sensor_dev_attr_pwm8.dev_attr.attr,
> > +	&sensor_dev_attr_pwm9.dev_attr.attr,
> > +	&sensor_dev_attr_pwm10.dev_attr.attr,
> > +	&sensor_dev_attr_pwm11.dev_attr.attr,
> > +	&sensor_dev_attr_pwm12.dev_attr.attr,
> > +	&sensor_dev_attr_pwm13.dev_attr.attr,
> > +	&sensor_dev_attr_pwm14.dev_attr.attr,
> > +	&sensor_dev_attr_pwm15.dev_attr.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group pwm_dev_group = {
> > +	.attrs = pwm_dev_attrs,
> > +	.is_visible = pwm_is_visible,
> > +};
> > +
> > +static SENSOR_DEVICE_ATTR(fan0_input, 0444,
> > +		show_rpm, NULL, 0);
> > +static SENSOR_DEVICE_ATTR(fan1_input, 0444,
> > +		show_rpm, NULL, 1);
> > +static SENSOR_DEVICE_ATTR(fan2_input, 0444,
> > +		show_rpm, NULL, 2);
> > +static SENSOR_DEVICE_ATTR(fan3_input, 0444,
> > +		show_rpm, NULL, 3);
> > +static SENSOR_DEVICE_ATTR(fan4_input, 0444,
> > +		show_rpm, NULL, 4);
> > +static SENSOR_DEVICE_ATTR(fan5_input, 0444,
> > +		show_rpm, NULL, 5);
> > +static SENSOR_DEVICE_ATTR(fan6_input, 0444,
> > +		show_rpm, NULL, 6);
> > +static SENSOR_DEVICE_ATTR(fan7_input, 0444,
> > +		show_rpm, NULL, 7);
> > +static SENSOR_DEVICE_ATTR(fan8_input, 0444,
> > +		show_rpm, NULL, 8);
> > +static SENSOR_DEVICE_ATTR(fan9_input, 0444,
> > +		show_rpm, NULL, 9);
> > +static SENSOR_DEVICE_ATTR(fan10_input, 0444,
> > +		show_rpm, NULL, 10);
> > +static SENSOR_DEVICE_ATTR(fan11_input, 0444,
> > +		show_rpm, NULL, 11);
> > +static SENSOR_DEVICE_ATTR(fan12_input, 0444,
> > +		show_rpm, NULL, 12);
> > +static SENSOR_DEVICE_ATTR(fan13_input, 0444,
> > +		show_rpm, NULL, 13);
> > +static SENSOR_DEVICE_ATTR(fan14_input, 0444,
> > +		show_rpm, NULL, 14);
> > +static SENSOR_DEVICE_ATTR(fan15_input, 0444,
> > +		show_rpm, NULL, 15);
> > +static struct attribute *fan_dev_attrs[] = {
> > +	&sensor_dev_attr_fan0_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan1_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan2_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan3_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan4_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan5_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan6_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan7_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan8_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan9_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan10_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan11_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan12_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan13_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan14_input.dev_attr.attr,
> > +	&sensor_dev_attr_fan15_input.dev_attr.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group fan_dev_group = {
> > +	.attrs = fan_dev_attrs,
> > +	.is_visible = fan_dev_is_visible,
> > +};
> > +
> > +static void aspeed_create_pwm_channel(struct device *dev, struct aspeed_pwm_tachometer_data *priv,
> > +				   u8 pwm_channel, u32 target_pwm_freq)
> > +{
> > +	priv->pwm_present[pwm_channel] = true;
> > +	priv->pwm_channel[pwm_channel].target_freq = target_pwm_freq;
> > +
> > +	//use default
> > +	aspeed_set_pwm_channel_fan_ctrl(dev,
> > +					priv,
> > +					pwm_channel,
> > +					priv->pwm_channel[pwm_channel].falling);
> > +}
> > +
> > +static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tachometer_data *priv,
> > +					   u8 *fan_tach_ch, int count,
> > +					   u32 fan_pulse_pr, u32 tacho_div)
> > +{
> > +	u8 val, index;
> > +
> > +	for (val = 0; val < count; val++) {
> > +		index = fan_tach_ch[val];
> > +		priv->fan_tach_present[index] = true;
> > +		priv->tacho_channel[index].pulse_pr = fan_pulse_pr;
> > +		aspeed_set_fan_tach_ch_enable(priv, index, true, tacho_div);
> > +	}
> > +}
> > +
> > +static int
> > +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long *state)
> > +{
> > +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> > +
> > +	*state = cdev->max_state;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long *state)
> > +{
> > +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> > +
> > +	*state = cdev->cur_state;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long state)
> > +{
> > +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> > +
> > +	if (state > cdev->max_state)
> > +		return -EINVAL;
> > +
> > +	cdev->cur_state = state;
> > +	cdev->priv->pwm_channel[cdev->pwm_channel].falling =
> > +					cdev->cooling_levels[cdev->cur_state];
> > +	aspeed_set_pwm_channel_fan_ctrl(&tcdev->device, cdev->priv, cdev->pwm_channel,
> > +				     cdev->cooling_levels[cdev->cur_state]);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops = {
> > +	.get_max_state = aspeed_pwm_cz_get_max_state,
> > +	.get_cur_state = aspeed_pwm_cz_get_cur_state,
> > +	.set_cur_state = aspeed_pwm_cz_set_cur_state,
> > +};
> > +
> > +static int aspeed_create_pwm_cooling(struct device *dev,
> > +				     struct device_node *child,
> > +				     struct aspeed_pwm_tachometer_data *priv,
> > +				     u32 pwm_channel, u8 num_levels)
> > +{
> > +	int ret;
> > +	struct aspeed_cooling_device *cdev;
> > +
> > +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> > +	if (!cdev)
> > +		return -ENOMEM;
> > +
> > +	cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> > +	if (!cdev->cooling_levels)
> > +		return -ENOMEM;
> > +
> > +	cdev->max_state = num_levels - 1;
> > +	ret = of_property_read_u8_array(child, "cooling-levels",
> > +					cdev->cooling_levels,
> > +					num_levels);
> > +	if (ret) {
> > +		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> > +		return ret;
> > +	}
> > +	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, pwm_channel);
> > +
> > +	cdev->tcdev = thermal_of_cooling_device_register(child,
> > +							 cdev->name,
> > +							 cdev,
> > +							 &aspeed_pwm_cool_ops);
> > +	if (IS_ERR(cdev->tcdev))
> > +		return PTR_ERR(cdev->tcdev);
> > +
> > +	cdev->priv = priv;
> > +	cdev->pwm_channel = pwm_channel;
> > +
> > +	priv->cdev[pwm_channel] = cdev;
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_pwm_create_fan(struct device *dev,
> > +			     struct device_node *child,
> > +			     struct aspeed_pwm_tachometer_data *priv)
> > +{
> > +	u8 *fan_tach_ch;
> > +	u32 fan_pulse_pr;
> > +	u32 tacho_div;
> > +	u32 pwm_channel;
> > +	u32 target_pwm_freq = 0;
> > +	int ret, count;
> > +
> > +	ret = of_property_read_u32(child, "reg", &pwm_channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = of_property_read_u32(child, "aspeed,pwm-freq", &target_pwm_freq);
> > +	if (ret)
> > +		target_pwm_freq = DEFAULT_TARGET_PWM_FREQ;
> > +
> > +	aspeed_create_pwm_channel(dev, priv, (u8)pwm_channel, target_pwm_freq);
> > +
> > +	ret = of_property_count_u8_elems(child, "cooling-levels");
> > +	if (ret > 0) {
> > +		if (IS_ENABLED(CONFIG_THERMAL)) {
> > +			ret = aspeed_create_pwm_cooling(dev, child, priv, pwm_channel,
> > +							ret);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +	}
> > +
> > +	count = of_property_count_u8_elems(child, "aspeed,fan-tach-ch");
> > +	if (count < 1)
> > +		return -EINVAL;
> > +
> > +	fan_tach_ch = devm_kzalloc(dev, sizeof(*fan_tach_ch) * count,
> > +				   GFP_KERNEL);
> > +	if (!fan_tach_ch)
> > +		return -ENOMEM;
> > +	ret = of_property_read_u8_array(child, "aspeed,fan-tach-ch",
> > +					fan_tach_ch, count);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = of_property_read_u32(child, "aspeed,pulse-pr", &fan_pulse_pr);
> > +	if (ret)
> > +		fan_pulse_pr = DEFAULT_FAN_PULSE_PR;
> 
> Are those properties declared as optional ?
> 
I'll update the dt-bindings document and make it clearly.

> > +
> > +	ret = of_property_read_u32(child, "aspeed,tacho-div", &tacho_div);
> > +	if (ret)
> > +		tacho_div = DEFAULT_TACHO_DIV;
> > +
> > +	aspeed_create_fan_tach_channel(priv, fan_tach_ch, count, fan_pulse_pr, tacho_div);
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_pwm_tachometer_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np, *child;
> > +	struct aspeed_pwm_tachometer_data *priv;
> > +	void __iomem *regs;
> > +	struct resource *res;
> > +	struct device *hwmon;
> > +	struct clk *clk;
> > +	int ret;
> > +
> > +	np = dev->of_node;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENOENT;
> 
> Unnecessary error check. devm_ioremap_resource() does that (and
> returns -EINVAL).
> 
Change these line-of-codes into devm_platform_ioremap_resource(pdev, 0).

> > +	regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->pwm_channel = default_pwm_params;
> > +	priv->tacho_channel = default_tacho_params;
> > +	priv->regmap = devm_regmap_init(dev, NULL, (__force void *)regs,
> > +			&aspeed_pwm_tachometer_regmap_config);
> > +	if (IS_ERR(priv->regmap))
> > +		return PTR_ERR(priv->regmap);
> > +
> > +	clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(clk))
> > +		return -ENODEV;
> > +	priv->clk_freq = clk_get_rate(clk);
> > +
> > +	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
> > +	if (IS_ERR(priv->reset)) {
> > +		dev_err(&pdev->dev, "can't get aspeed_pwm_tacho reset\n");
> > +		return PTR_ERR(priv->reset);
> > +	}
> > +
> > +	//scu init
> > +	reset_control_assert(priv->reset);
> > +	reset_control_deassert(priv->reset);
> > +
> > +	for_each_child_of_node(np, child) {
> > +		ret = aspeed_pwm_create_fan(dev, child, priv);
> > +		if (ret) {
> > +			of_node_put(child);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	priv->groups[0] = &pwm_dev_group;
> > +	priv->groups[1] = &fan_dev_group;
> > +	priv->groups[2] = NULL;
> > +	dev_info(dev, "pwm tach probe done\n");
> > +	hwmon = devm_hwmon_device_register_with_groups(dev,
> > +						       "aspeed_pwm_tachometer",
> > +						       priv, priv->groups);
> 
> New drivers must use devm_hwmon_device_register_with_info().
> 
I will change using it in v2.

> > +
> > +	return PTR_ERR_OR_ZERO(hwmon);
> > +}
> > +
> > +static const struct of_device_id of_pwm_tachometer_match_table[] = {
> > +	{ .compatible = "aspeed,ast2600-pwm-tachometer", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, of_pwm_tachometer_match_table);
> > +
> > +static struct platform_driver aspeed_pwm_tachometer_driver = {
> > +	.probe		= aspeed_pwm_tachometer_probe,
> > +	.driver		= {
> > +		.name	= "aspeed_pwm_tachometer",
> > +		.of_match_table = of_pwm_tachometer_match_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(aspeed_pwm_tachometer_driver);
> > +
> > +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> > +MODULE_DESCRIPTION("ASPEED PWM and Fan Tachometer device driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.17.1
> > 

Thanks for you suggestion,
Troy Lee
