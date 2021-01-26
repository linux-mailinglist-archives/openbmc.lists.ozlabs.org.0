Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 205623039D4
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 11:08:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2W73rmfzDqxZ
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 21:08:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2Tz1CFHzDqCl;
 Tue, 26 Jan 2021 21:07:32 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10Q9xn6g039910;
 Tue, 26 Jan 2021 17:59:49 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Jan
 2021 18:05:36 +0800
Date: Tue, 26 Jan 2021 10:05:25 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210126100525.GA2353270@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
 <20210118065059.2478078-5-troy_lee@aspeedtech.com>
 <5a22c7ff-bf00-4827-ad9b-266ed98375b4@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5a22c7ff-bf00-4827-ad9b-266ed98375b4@www.fastmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10Q9xn6g039910
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, kbuild test robot <lkp@intel.com>,
 "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Troy
 Lee <leetroy@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

The 01/22/2021 12:38, Andrew Jeffery wrote:
> Hi Troy,
> 
> On Mon, 18 Jan 2021, at 17:20, Troy Lee wrote:
> > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> > 16 FAN tacho channel.
> > 
> > Changes since v2:
> >  - declare local function as static function
> > 
> > Changes since v1:
> >  - fixed review comments
> >  - fixed double-looped calculation of div_h and div_l
> >  - moving configuration to device tree
> >  - register hwmon driver with devm_hwmon_device_register_with_info()
> > 
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
...

> > diff --git a/drivers/hwmon/aspeed2600-pwm-tacho.c 
> > b/drivers/hwmon/aspeed2600-pwm-tacho.c
> > new file mode 100644
> > index 000000000000..00ff100db92f
> > --- /dev/null
> > +++ b/drivers/hwmon/aspeed2600-pwm-tacho.c
> > @@ -0,0 +1,756 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) ASPEED Technology Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 or 
> > later as
> > + * published by the Free Software Foundation.
> > + */
> 
> The license is captured by the SPDX marker above. This summary text should be dropped (though retain the copyright line).
> 
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
> 
> Banner comments like this generally aren't preferred. If you think the comment text itself is necessary, just do:
> 
> /* PWM HW register offset define */
> 
> However, the macro names should indicate what we're defining anyway, so I feel we can remove it entirely without too much loss
> 
I'll remove the redundant description and comments.

> > +/* PWM Control Register */
> > +#define ASPEED_PWM_CTRL_CH(ch)			(((ch) * 0x10) + 0x00)
> > +/* PWM Duty Cycle Register */
> > +#define ASPEED_PWM_DUTY_CYCLE_CH(ch)		(((ch) * 0x10) + 0x04)
> > +/* TACH Control Register */
> > +#define ASPEED_TACHO_CTRL_CH(ch)		(((ch) * 0x10) + 0x08)
> > +/* TACH Status Register */
> > +#define ASPEED_TACHO_STS_CH(x)			(((x) * 0x10) + 0x0C)
> > +
> > +/**********************************************************
> > + * PWM register Bit field
> > + *********************************************************/
> > +/*PWM_CTRL */
> > +#define PWM_LOAD_SEL_AS_WDT_BIT		(19)	/* load selection as WDT */
> 
> The trailing comments don't really add any further information in the context of the macro name. Let's remove these as well.
> 
> > +#define PWM_DUTY_LOAD_AS_WDT_EN		BIT(18)	/* enable PWM duty load as 
> > WDT */
> > +#define PWM_DUTY_SYNC_DIS		BIT(17)	/* disable PWM duty sync */
> > +#define PWM_CLK_ENABLE			BIT(16)	/* enable PWM clock */
> > +#define PWM_LEVEL_OUTPUT		BIT(15)	/* output PWM level */
> > +#define PWM_INVERSE			BIT(14) /* inverse PWM pin */
> > +#define PWM_OPEN_DRAIN_EN		BIT(13)	/* enable open-drain */
> > +#define PWM_PIN_EN			BIT(12) /* enable PWM pin */
> > +#define PWM_CLK_DIV_H_MASK		(0xf << 8) /* PWM clock division H bit 
> > [3:0] */
> > +#define PWM_CLK_DIV_L_MASK		(0xff)	/* PWM clock division H bit [3:0] */
> > +/* [19] */
> > +#define LOAD_SEL_FALLING 0
> > +#define LOAD_SEL_RIGING  1
> 
> It's much easier to track these macros if you place them alongside the associated register, and in a way that makes them self-documenting (i.e. we remove the need for the banner comments). Often the bit/mask macros are indented to help with visuals, for example:
> 
> #define ASPEED_PWM_CTRL_CH(ch)			(((ch) * 0x10) + 0x00)
> #define     PWM_DUTY_LOAD_AS_WDT_EN		BIT(18)
> #define     PWM_DUTY_SYNC_DIS                             BIT(17)
> ...
> 
> #define ASPEED_PWM_DUTY_CYCLE_CH(ch)			(((ch) * 0x10) + 0x04)
> #define     PWM_PERIOD_BIT						(24)
> #define     PWM_PERIOD_BIT_MASK					(0xff << 24)
> ...
> 
> etcetera. It also helps to make the name of the bitfield macros use a similar prefix to name of the associated register macro.
> 
Yes, this will increase readibility, I'll re-order these in v4.

> > +
> > +/*PWM_DUTY_CYCLE */
> > +#define PWM_PERIOD_BIT			(24)		/* pwm period bit [7:0] */
> > +#define PWM_PERIOD_BIT_MASK		(0xff << 24)	/* pwm period bit [7:0] */
> > +#define PWM_RISING_FALLING_AS_WDT_BIT	(16)
> > +#define PWM_RISING_FALLING_AS_WDT_MASK	(0xff << 16)	/* rising/falling 
> > point bit [7:0] as WDT */
> > +#define PWM_RISING_FALLING_MASK		(0xffff)
> > +#define PWM_FALLING_POINT_BIT		(8)		/* pwm falling point bit [7:0] */
> > +#define PWM_RISING_POINT_BIT		(0)		/* pwm rising point bit [7:0] */
> > +/* [31:24] */
> > +#define DEFAULT_PWM_PERIOD 0xff
> > +
> > +/*PWM_TACHO_CTRL */
> > +#define TACHO_IER				BIT(31)	/* enable tacho interrupt */
> > +#define TACHO_INVERS_LIMIT			BIT(30) /* inverse tacho limit comparison 
> > */
> > +#define TACHO_LOOPBACK				BIT(29) /* tacho loopback */
> > +#define TACHO_ENABLE				BIT(28)	/* enable tacho */
> > +#define TACHO_DEBOUNCE_MASK			(0x3 << 26) /* tacho de-bounce */
> > +#define TACHO_DEBOUNCE_BIT			(26) /* tacho de-bounce */
> > +#define TECHIO_EDGE_MASK			(0x3 << 24) /* tacho edge */
> > +#define TECHIO_EDGE_BIT				(24) /* tacho edge */
> > +#define TACHO_CLK_DIV_T_MASK			(0xf << 20)
> > +#define TACHO_CLK_DIV_BIT			(20)
> > +#define TACHO_THRESHOLD_MASK			(0xfffff)	/* tacho threshold bit */
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
> > +#define  TACHO_ISR		BIT(31)	/* interrupt status and clear */
> > +#define  PWM_OUT		BIT(25)	/* pwm_out */
> > +#define  PWM_OEN		BIT(24)	/* pwm_oeN */
> > +#define  TACHO_DEB_INPUT	BIT(23)	/* tacho deB input */
> > +#define  TACHO_RAW_INPUT	BIT(22) /* tacho raw input */
> > +#define  TACHO_VALUE_UPDATE	BIT(21)	/* tacho value updated since the 
> > last read */
> > +#define  TACHO_FULL_MEASUREMENT	BIT(20) /* tacho full measurement */
> > +#define  TACHO_VALUE_MASK	0xfffff	/* tacho value bit [19:0] */
> > +/**********************************************************
> > + * Software setting
> > + *********************************************************/
> > +#define DEFAULT_TARGET_PWM_FREQ		25000
> > +#define DEFAULT_FAN_PULSE_PR		2
> > +#define DEFAULT_WDT_RISING_FALLING_PT	0x10
> > +#define DEFAULT_RISING_PT		0x00
> > +#define DEFAULT_FALLING_PT		0x0a
> > +#define MAX_CDEV_NAME_LEN		16
> > +
> > +struct aspeed_pwm_channel_params {
> > +	int target_freq;
> > +	int pwm_freq;
> > +	int load_wdt_rising_falling_pt;
> > +	int load_wdt_selection;		/* 0: rising , 1: falling */
> > +	int load_wdt_enable;
> > +	int duty_sync_disable;
> > +	int inverse_pin;
> > +	u8 falling;
> > +};
> > +
> > +static struct aspeed_pwm_channel_params default_pwm_params[16];
> > +
> > +struct aspeed_tacho_channel_params {
> > +	int limited_inverse;
> > +	u16 threshold;
> > +	u8 tacho_edge;
> > +	u8 tacho_debounce;
> > +	u8 pulse_pr;
> > +	u32 divide;
> > +};
> > +
> > +static struct aspeed_tacho_channel_params default_tacho_params[16];
> > +
> > +struct aspeed_pwm_tachometer_data {
> > +	struct regmap *regmap;
> 
> What's the reason for using a regmap? For MMIO the benefit is that the API provides some locking for when regmap is used as a syscon, but that doesn't appear to be how it's used here? regmap generates a bunch of overhead compared to readl()/writel().
> 
Nope, the readl()/writel() will work as well.

> > +	unsigned long clk_freq;
> > +	struct reset_control *reset;
> > +	bool pwm_present[16];
> > +	bool fan_tach_present[16];
> > +	struct aspeed_pwm_channel_params *pwm_channel;
> > +	struct aspeed_tacho_channel_params *tacho_channel;
> > +	/* for thermal */
> > +	struct aspeed_cooling_device *cdev[8];
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
> > +static int regmap_aspeed_pwm_tachometer_reg_write(void *context, 
> > unsigned int reg,
> > +					     unsigned int val)
> > +{
> > +	void __iomem *regs = (void __iomem *)context;
> > +
> > +	writel(val, regs + reg);
> > +	return 0;
> > +}
> > +
> > +static int regmap_aspeed_pwm_tachometer_reg_read(void *context, 
> > unsigned int reg,
> > +					    unsigned int *val)
> > +{
> > +	void __iomem *regs = (void __iomem *)context;
> > +
> > +	*val = readl(regs + reg);
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_config aspeed_pwm_tachometer_regmap_config 
> > = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = 0x100,
> > +	.reg_write = regmap_aspeed_pwm_tachometer_reg_write,
> > +	.reg_read = regmap_aspeed_pwm_tachometer_reg_read,
> 
> These just do an MMIO access, do we really need our own read/write definitions?
> 
> > +	.fast_io = true,
> > +};
> > +
> > +static void aspeed_set_pwm_channel_enable(struct regmap *regmap, u8 
> > pwm_channel,
> > +				       bool enable)
> > +{
> > +	regmap_update_bits(regmap, ASPEED_PWM_CTRL_CH(pwm_channel),
> > +			   PWM_CLK_ENABLE | PWM_PIN_EN,
> > +			   enable ? PWM_CLK_ENABLE | PWM_PIN_EN : 0);
> 
> If the motivation for regmap is something like regmap_update_bits(), you can alternatively use the FIELD_*() macros from linux/bitfield.h
> 
Got it.

> > +}
> > +
> > +static void aspeed_set_fan_tach_ch_enable(struct 
> > aspeed_pwm_tachometer_data *priv, u8 fan_tach_ch,
> > +					  bool enable, u32 tacho_div)
> > +{
> > +	u32 reg_value;
> > +
> > +	if (enable) {
> > +		/* divide = 2^(tacho_div*2) */
> > +		priv->tacho_channel[fan_tach_ch].divide = 1 << (tacho_div << 1);
> > +
> > +		reg_value = TACHO_ENABLE |
> > +				(priv->tacho_channel[fan_tach_ch].tacho_edge << TECHIO_EDGE_BIT) |
> > +				(tacho_div << TACHO_CLK_DIV_BIT) |
> > +				(priv->tacho_channel[fan_tach_ch].tacho_debounce << 
> > TACHO_DEBOUNCE_BIT);
> > +
> > +		if (priv->tacho_channel[fan_tach_ch].limited_inverse)
> > +			reg_value |= TACHO_INVERS_LIMIT;
> > +
> > +		if (priv->tacho_channel[fan_tach_ch].threshold)
> > +			reg_value |= (TACHO_IER | 
> > priv->tacho_channel[fan_tach_ch].threshold);
> 
> I feel like this could be cleaned up a bit with:
> 
> const struct aspeed_tacho_channel_params *tacho = &priv->tacho_channel[fan_tach_ch];
> 
> and replacing the expression with tacho throughout.
> 
After replacing the expression, the code looks cleaner.

> > +
> > +		regmap_write(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch), 
> > reg_value);
> > +	} else
> > +		regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch),  
> > TACHO_ENABLE, 0);
> > +}
> > +
> > +/*
> > + * The PWM frequency = HCLK(200Mhz) / (clock division L bit *
> > + * clock division H bit * (period bit + 1))
> > + */
> > +static void aspeed_set_pwm_channel_fan_ctrl(struct device *dev,
> > +					   struct aspeed_pwm_tachometer_data *priv,
> > +					   u8 index, u8 fan_ctrl)
> > +{
> > +	u32 duty_value,	ctrl_value;
> > +	u32 target_div, div_h, div_l, cal_freq;
> > +	u32 tmp_div_h, tmp_div_l, diff, min_diff = INT_MAX;
> > +
> > +	if (fan_ctrl == 0) {
> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, false);
> > +		return;
> > +	}
> > +
> > +	cal_freq = priv->clk_freq / (DEFAULT_PWM_PERIOD + 1);
> 
> Is this always correct if we're relying on a default value? Or are we using DEFAULT_PWM_PERIOD because its value is the maximum period? Using a macro with DEFAULT in the name certainly makes me feel less sure that the code is right.
> 
I'll check again about this.

> > +	target_div = DIV_ROUND_UP(cal_freq, 
> > priv->pwm_channel[index].target_freq);
> > +
> > +	/* calculate for target frequence */
> > +	for (tmp_div_h = 0; tmp_div_h < 0x10; tmp_div_h++) {
> > +		tmp_div_l = target_div / BIT(tmp_div_h) - 1;
> > +
> > +		if (tmp_div_l < 0 || tmp_div_l > 255)
> > +			continue;
> > +
> > +		diff = priv->pwm_channel[index].target_freq - cal_freq / 
> > (BIT(tmp_div_h) * (tmp_div_l + 1));
> > +		if (abs(diff) < abs(min_diff)) {
> > +			min_diff = diff;
> > +			div_l = tmp_div_l;
> > +			div_h = tmp_div_h;
> > +
> > +			if (diff == 0)
> > +				break;
> > +		}
> > +	}
> 
> I've spent some time thinking about this and haven't come up with anything that's concretely better. It wasn't fun to read though :(
> 
Yep, me too. The intention of this segment is finding a valid pair of DIV_H and DIV_L, and it will be used as clock prescaler. 

> > +
> > +	priv->pwm_channel[index].pwm_freq = cal_freq / (BIT(div_h) * (div_l + 
> > 1));
> > +	dev_info(dev, "div h %x, l : %x pwm out clk %d\n", div_h, div_l,
> > +			priv->pwm_channel[index].pwm_freq);
> > +	dev_info(dev, "hclk %ld, target pwm freq %d, real pwm freq %d\n", 
> > priv->clk_freq,
> > +			priv->pwm_channel[index].target_freq, 
> > priv->pwm_channel[index].pwm_freq);
> 
> These should be dev_dbg()
> 
Updated.

> > +
> > +	ctrl_value = (div_h << 8) | div_l;
> > +
> > +	duty_value = (DEFAULT_PWM_PERIOD << PWM_PERIOD_BIT) |
> > +		(0 << PWM_RISING_POINT_BIT) | (fan_ctrl << PWM_FALLING_POINT_BIT);
> > +
> > +	if (priv->pwm_channel[index].load_wdt_enable) {
> > +		ctrl_value |= PWM_DUTY_LOAD_AS_WDT_EN;
> > +		ctrl_value |= priv->pwm_channel[index].load_wdt_selection << 
> > PWM_LOAD_SEL_AS_WDT_BIT;
> > +		duty_value |= (priv->pwm_channel[index].load_wdt_rising_falling_pt 
> > << PWM_RISING_FALLING_AS_WDT_BIT);
> > +	}
> > +
> > +	if (priv->pwm_channel[index].inverse_pin)
> > +		ctrl_value |= PWM_INVERSE;
> > +	if (priv->pwm_channel[index].duty_sync_disable)
> > +		ctrl_value |= PWM_DUTY_SYNC_DIS;
> 
> Similar to my comment above about tacho, I think this can be cleaned up a bit with:
> 
> const struct aspeed_pwm_channel_params *pwm = &priv->pwm_channel[index];
> 
> and replacing the expression with pwm throughout.
> 
Updated.

> > +
> > +	regmap_write(priv->regmap, ASPEED_PWM_DUTY_CYCLE_CH(index), 
> > duty_value);
> > +	regmap_write(priv->regmap, ASPEED_PWM_CTRL_CH(index), ctrl_value);
> > +
> > +	aspeed_set_pwm_channel_enable(priv->regmap, index, true);
> > +}
> > +
> > +static int aspeed_get_fan_tach_ch_rpm(struct device *dev, struct 
> > aspeed_pwm_tachometer_data *priv,
> > +				      u8 fan_tach_ch)
> > +{
> > +	u32 raw_data, tach_div, clk_source, val;
> > +	int ret;
> > +
> > +	ret = regmap_read_poll_timeout(priv->regmap,
> > +				ASPEED_TACHO_STS_CH(fan_tach_ch),
> > +				val,
> > +				(val & TACHO_FULL_MEASUREMENT),
> > +				1000,
> > +				10000);
> 
> Could just use readl_poll_timeout()?
> 
Updated accordingly.

> > +
> > +	/* return -ETIMEDOUT if we didn't get an answer. */
> > +	if (ret)
> > +		return ret;
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
> > +	tach_div = raw_data * (priv->tacho_channel[fan_tach_ch].divide) * 
> > (priv->tacho_channel[fan_tach_ch].pulse_pr);
> 
> Again, lets extract the channel pointer to clean this up a little.
> 
Updated.

> > +
> > +	dev_dbg(dev, "clk %ld, raw_data %d , tach_div %d\n", priv->clk_freq, 
> > raw_data, tach_div);
> > +	clk_source = priv->clk_freq;
> > +
> > +	return ((clk_source / tach_div) * 60);
> > +
> > +}
> > +
> > +static int set_pwm(struct device *dev, int index, long fan_ctrl)
> > +{
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +	u8 org_falling = priv->pwm_channel[index].falling;
> > +
> > +	if (fan_ctrl > DEFAULT_PWM_PERIOD || fan_ctrl < 0)
> > +		return -EINVAL;
> > +
> > +	if (priv->pwm_channel[index].falling == fan_ctrl)
> > +		return 0;
> > +
> > +	priv->pwm_channel[index].falling = fan_ctrl;
> 
> My understanding is the value of fan_ctrl is the value that userspace has written to the pwm[1-*] attribute in sysfs. The name 'falling' in struct aspeed_pwm_channel_params is not at all intuitive to me. I understand the hardware calls it something along these lines, but is there a better name? "period"? "duty"?
> 
Good suggestion, I'll update accordingly.

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
> 
> The asymmetry between these masks caught my eye, and I guess I understand what's going on a bit more with 'falling' at least. The hardware is definitely flexible :)
> 
> > +					   (fan_ctrl << PWM_FALLING_POINT_BIT));
> > +	}
> > +
> > +	if (org_falling == 0)
> 
> Do we have to assign .falling member before this point? Can we get rid of org_falling by assigning .falling after this test?
> 
Yes, good suggestion.

> > +		aspeed_set_pwm_channel_enable(priv->regmap, index, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static void aspeed_create_pwm_channel(struct device *dev, struct 
> > aspeed_pwm_tachometer_data *priv,
> > +			   u8 pwm_channel)
> > +{
> > +	priv->pwm_present[pwm_channel] = true;
> 
> Is there a reason we can't have the present state as a member of the params struct?
> 
Nope. I'll move the present into param struct.
> > +
> > +	/* use default */
> > +	aspeed_set_pwm_channel_fan_ctrl(dev,
> > +					priv,
> > +					pwm_channel,
> > +					priv->pwm_channel[pwm_channel].falling);
> > +}
> > +
> > +static void aspeed_create_fan_tach_channel(struct 
> > aspeed_pwm_tachometer_data *priv,
> > +					   u8 *fan_tach_ch, int count,
> > +					   u32 fan_pulse_pr, u32 tacho_div)
> > +{
> > +	u8 val, index;
> > +
> > +	for (val = 0; val < count; val++) {
> > +		index = fan_tach_ch[val];
> > +		priv->fan_tach_present[index] = true;
> 
> Same query as pwm_present: Can we not have this as member of the params struct?
> 
Same as pwm.
> > +		priv->tacho_channel[index].pulse_pr = fan_pulse_pr;
> > +		priv->tacho_channel[index].limited_inverse = 0;
> > +		priv->tacho_channel[index].threshold = 0;
> > +		priv->tacho_channel[index].tacho_edge = F2F_EDGES;
> > +		priv->tacho_channel[index].tacho_debounce = DEBOUNCE_3_CLK;
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
> > +	aspeed_set_pwm_channel_fan_ctrl(&tcdev->device, cdev->priv, 
> > cdev->pwm_channel,
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
> > +	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, 
> > pwm_channel);
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
> 
> I'm not super familiar with the cooling zones stuff, so I'll leave that for someone else to comment on :)
> 
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
> > +	u8 val;
> > +	int ret, count;
> > +
> > +	ret = of_property_read_u32(child, "reg", &pwm_channel);
> > +	if (ret)
> > +		return ret;
> > +	else if (pwm_channel > 0x0f)
> > +		return -EINVAL;
> > +
> > +	ret = of_property_read_u32(child, "aspeed,pwm-freq-hz", 
> > &target_pwm_freq);
> > +	if (ret)
> > +		target_pwm_freq = DEFAULT_TARGET_PWM_FREQ;
> > +
> > +	priv->pwm_channel[pwm_channel].target_freq = target_pwm_freq;
> 
> I made some comments on the binding patch, but I'll repeat some of that here.
> 
> What are your thoughts on reusing a property like 'bus-frequency' here?
> 
> > +
> > +	priv->pwm_channel[pwm_channel].load_wdt_enable = 
> > of_property_read_bool(child,
> > +			"aspeed,enable-pwm-duty-load-wdt");
> 
> This isn't documented in the binding.
> 
> > +	priv->pwm_channel[pwm_channel].load_wdt_selection = 
> > of_property_read_bool(child,
> > +			"aspeed,wdt-selection-rising");
> 
> This isn't documented in the binding.
> 
> > +	priv->pwm_channel[pwm_channel].duty_sync_disable = 
> > of_property_read_bool(child,
> > +			"aspeed,disable-duty-instant-change");
> 
> This isn't documented in the binding.
> 
> However, does slowly increase/decrease the duty instead? Might it be better to name the property in terms of the positive case (the property name doesn't have to directly reflect the name of the hardware setting), e.g. 'aspeed,ramp-pwm-duty'?
> 
I'll check about the functionaility.

> > +	priv->pwm_channel[pwm_channel].inverse_pin = 
> > of_property_read_bool(child,
> > +			"aspeed,inverse-pin");
> > +
> > +	ret = of_property_read_u8(child, "aspeed,wdt-rising-falling-point", 
> > &val);
> 
> This isn't documented in the binding.
> 
> > +	if (ret)
> > +		val = DEFAULT_WDT_RISING_FALLING_PT;
> > +	priv->pwm_channel[pwm_channel].load_wdt_rising_falling_pt = val;
> > +
> > +	ret = of_property_read_u8(child, "aspeed,falling-point", &val);
> > +	if (ret)
> > +		val = DEFAULT_FALLING_PT;
> > +	priv->pwm_channel[pwm_channel].falling = val;
> > +
> > +	aspeed_create_pwm_channel(dev, priv, (u8)pwm_channel);
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
> > +	count = of_property_count_u8_elems(child, "fan-tach-ch");
> > +	if (count < 1)
> > +		return -EINVAL;
> > +
> > +	fan_tach_ch = devm_kzalloc(dev, sizeof(*fan_tach_ch) * count,
> > +				   GFP_KERNEL);
> > +	if (!fan_tach_ch)
> > +		return -ENOMEM;
> > +	ret = of_property_read_u8_array(child, "fan-tach-ch",
> > +					fan_tach_ch, count);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = of_property_read_u32(child, "pulses-per-revolution", 
> > &fan_pulse_pr);
> > +	if (ret)
> > +		fan_pulse_pr = DEFAULT_FAN_PULSE_PR;
> > +
> > +	ret = of_property_read_u32(child, "aspeed,tacho-div", &tacho_div);
> 
> This isn't documented in the binding.
> 
Missing properties will be added in v4 document.

> > +	if (ret)
> > +		tacho_div = DEFAULT_TACHO_DIV;
> > +
> > +	aspeed_create_fan_tach_channel(priv, fan_tach_ch, count, 
> > fan_pulse_pr, tacho_div);
> > +
> > +	return 0;
> > +}
> > +
> > +static umode_t aspeed_pwm_tacho_is_visible(const void *data, enum 
> > hwmon_sensor_types type,
> > +					u32 attr, int channel)
> > +{
> > +	const struct aspeed_pwm_tachometer_data *priv = data;
> > +
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			if (!priv->pwm_present[channel])
> > +				return 0;
> > +			return 0644;
> > +		default:
> > +			return 0;
> > +		}
> > +		break;
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			if (!priv->fan_tach_present[channel])
> > +				return 0;
> > +			return 0444;
> > +		default:
> > +			return 0;
> > +		}
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static int aspeed_pwm_tacho_read(struct device *dev, enum 
> > hwmon_sensor_types type,
> > +			u32 attr, int channel, long *val)
> > +{
> > +	struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
> > +	long rpm;
> > +
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			*val = priv->pwm_channel[channel].falling;
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			rpm = aspeed_get_fan_tach_ch_rpm(dev, priv, channel);
> > +			if (rpm < 0)
> > +				return rpm;
> > +			*val = rpm;
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int aspeed_pwm_tacho_write(struct device *dev, enum 
> > hwmon_sensor_types type,
> > +			u32 attr, int channel, long val)
> > +{
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			return set_pwm(dev, channel, val);
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static const struct hwmon_ops aspeed_pwm_hwmon_ops = {
> > +	.is_visible = aspeed_pwm_tacho_is_visible,
> > +	.read = aspeed_pwm_tacho_read,
> > +	.write = aspeed_pwm_tacho_write,
> > +};
> > +
> > +static const struct hwmon_channel_info *aspeed_pwm_hwmon_info[] = {
> > +	HWMON_CHANNEL_INFO(pwm,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT),
> > +	HWMON_CHANNEL_INFO(fan,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT,
> > +			HWMON_F_INPUT),
> > +	NULL,
> > +};
> > +
> > +static const struct hwmon_chip_info aspeed_pwm_chip_info = {
> > +	.ops = &aspeed_pwm_hwmon_ops,
> > +	.info = aspeed_pwm_hwmon_info,
> > +};
> > +
> > +static int aspeed_pwm_tachometer_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np, *child;
> > +	struct aspeed_pwm_tachometer_data *priv;
> > +	void __iomem *regs;
> > +	struct device *hwmon;
> > +	struct clk *clk;
> > +	int ret;
> > +
> > +	np = dev->of_node;
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
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
> > +	/* scu init */
> > +	reset_control_assert(priv->reset);
> > +	reset_control_deassert(priv->reset);
> > +
> > +	for_each_child_of_node(np, child) {
> > +		ret = aspeed_pwm_create_fan(dev, child, priv);
> > +		if (ret) {
> > +			of_node_put(child);
> > +			return ret;
> 
> Should you reassert the reset here? Or is that handled by the devm infra?
> 
I don't think we need to reassert here. It should reset once at the
begining.

> > +		}
> > +	}
> > +
> > +	dev_info(dev, "pwm tach probe done\n");
> 
> This is a bit misleading because you're yet to register with hwmon :) I'd put it after the call below.
> 
> Anyway, I think it should probably print something more informative if we're going to keep it. Print the number of PWMs/tachos configured as well?
Good catch. I think this message can be removed. How many pwm/tacho channels configured can be found in sysfs.

> 
> > +	hwmon = devm_hwmon_device_register_with_info(dev, 
> > "aspeed_pwm_tachometer",
> > +			priv, &aspeed_pwm_chip_info, NULL);
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
> 
> Given it's AST2600-specific:
> 
> "AST2600 PWM and Fan Tachometer device driver"
> 
> I've run out of steam, so that's enough for now :)
> 
> Andrew

Thanks for reviewing, I'll update and submit a v4 patch.

Troy Lee
