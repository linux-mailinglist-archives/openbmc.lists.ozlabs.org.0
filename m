Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F215A38F7EE
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 04:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpyF26TZMz301N
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 12:09:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpyDn5rZvz2yXd;
 Tue, 25 May 2021 12:08:56 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14P1tNUP007863;
 Tue, 25 May 2021 09:55:23 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 10:08:20 +0800
Date: Tue, 25 May 2021 10:08:18 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Message-ID: <20210525020817.GB2489@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <YKVg2Kfbex3DYbNI@packtop> <20210524020846.GB2591@aspeedtech.com>
 <YKwXnPH0XyYLRtfa@packtop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YKwXnPH0XyYLRtfa@packtop>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P1tNUP007863
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "moderated list:ARM/ASPEED I2C
 DRIVER" <openbmc@lists.ozlabs.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/24/2021 21:16, Zev Weiss wrote:
> On Sun, May 23, 2021 at 09:08:47PM CDT, Jamin Lin wrote:
> >The 05/19/2021 19:02, Zev Weiss wrote:
> >> On Wed, May 19, 2021 at 03:04:27AM CDT, Jamin Lin wrote:
> >> >The register definition between AST2600 A2 and A3 is different.
> >> >This patch avoid new registers definition of AST2600 to use
> >> >this driver. We will submit the path for the new registers
> >> >definition of AST2600.
> >> >
> >> >Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> >> >---
> >> > drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
> >> > 1 file changed, 22 insertions(+)
> >> >
> >> >diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> >> >index 724bf30600d6..007309077d9f 100644
> >> >--- a/drivers/i2c/busses/i2c-aspeed.c
> >> >+++ b/drivers/i2c/busses/i2c-aspeed.c
> >> >@@ -19,14 +19,20 @@
> >> > #include <linux/irqchip/chained_irq.h>
> >> > #include <linux/irqdomain.h>
> >> > #include <linux/kernel.h>
> >> >+#include <linux/mfd/syscon.h>
> >> > #include <linux/module.h>
> >> > #include <linux/of_address.h>
> >> > #include <linux/of_irq.h>
> >> > #include <linux/of_platform.h>
> >> > #include <linux/platform_device.h>
> >> >+#include <linux/regmap.h>
> >> > #include <linux/reset.h>
> >> > #include <linux/slab.h>
> >> >
> >> >+/* I2C Global Registers */
> >> >+/* 0x0c : I2CG Global Control Register (AST2500)  */
> >> >+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
> >> >+
> >> > /* I2C Register */
> >> > #define ASPEED_I2C_FUN_CTRL_REG				0x00
> >> > #define ASPEED_I2C_AC_TIMING_REG1			0x04
> >> >@@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >> > 	struct resource *res;
> >> > 	int irq, ret;
> >> >
> >> >+	if (of_device_is_compatible(pdev->dev.of_node,
> >> >+				    "aspeed,ast2600-i2c-bus")) {
> >> >+		u32 global_ctrl;
> >> >+		struct regmap *gr_regmap;
> >> >+
> >> >+		gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-global");
> >> >+
> >> >+		if (IS_ERR(gr_regmap)) {
> >> >+			ret = PTR_ERR(gr_regmap);
> >> >+		} else {
> >> >+			regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
> >> >+			if (global_ctrl & BIT(2))
> >> >+				return -EIO;
> >>
> >> A macro definition might be a bit nicer than a raw BIT(2) here I'd
> >> think.
> >Will modify
> >>
> >> Also, it seems a bit unfortunate to just bail on the device entirely if
> >> we find this bit set (seems like a good way for a bootloader to
> >> inadvertently DoS the kernel), though I guess poking global syscon bits
> >> in the bus probe function might not be ideal.  Could/should we consider
> >> some module-level init code to ensure that bit is cleared?
> >>
> >>
> >We use syscon API to get the global register of i2c not the specific i2c
> >bus.
> >Can you describe it more detail?
> 
> Sure -- I just meant that if for whatever reason the kernel is booting
> on a system that's had that syscon bit set to enable the new register
> access mode (e.g. by a newer bootloader or something), it seems like
> we'd just give up entirely on enabling any i2c busses, when as far as I
> know there shouldn't be anything stopping us from resetting the bit back
> to be in the state this driver needs it to be in (old register mode) and
> then continuing along normally.
> 
> 
> Zev

Thanks for your suggestion. I will submit the new i2c driver for
AST2600.
Jamin
