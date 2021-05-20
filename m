Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F860389BED
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 05:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlwNv39D2z303y
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 13:35:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlwNf6JV8z2xvG;
 Thu, 20 May 2021 13:35:13 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14K3JA4S041222;
 Thu, 20 May 2021 11:19:11 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 May
 2021 11:31:48 +0800
Date: Thu, 20 May 2021 11:31:41 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Message-ID: <20210520033140.GA3656@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14K3JA4S041222
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
Cc: "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>, ChiaWei
 Wang <chiawei_wang@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/19/2021 22:59, Joel Stanley wrote:
> On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> >
> > The register definition between AST2600 A2 and A3 is different.
> > This patch avoid new registers definition of AST2600 to use
> > this driver. We will submit the path for the new registers
> > definition of AST2600.
> 
> The AST2600 v9 datasheet says that bit 2 selects between old and new
> register sets, and that the old register set is the default.
> 
> Has the default changed for the A3?, and the datasheet is incorrect?
> 
> Does the A3 still support the old register set?
> 
We suggest user to use the new i2c driver for AST2600 and we will sumbit
it. This driver is used to AST2500 and AST2400 SOCs. Change this
driver to check global register of i2c to avoid user build the wrong driver. 

> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> > index 724bf30600d6..007309077d9f 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -19,14 +19,20 @@
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> >
> > +/* I2C Global Registers */
> > +/* 0x0c : I2CG Global Control Register (AST2500)  */
> > +#define ASPEED_I2CG_GLOBAL_CTRL_REG                    0x0c
> > +
> >  /* I2C Register */
> >  #define ASPEED_I2C_FUN_CTRL_REG                                0x00
> >  #define ASPEED_I2C_AC_TIMING_REG1                      0x04
> > @@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >         struct resource *res;
> >         int irq, ret;
> >
> > +       if (of_device_is_compatible(pdev->dev.of_node,
> > +                                   "aspeed,ast2600-i2c-bus")) {
> > +               u32 global_ctrl;
> > +               struct regmap *gr_regmap;
> > +
> > +               gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-global");
> > +
> > +               if (IS_ERR(gr_regmap)) {
> > +                       ret = PTR_ERR(gr_regmap);
> > +               } else {
> > +                       regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
> > +                       if (global_ctrl & BIT(2))
> > +                               return -EIO;
> > +               }
> > +       }
> > +
> >         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> >         if (!bus)
> >                 return -ENOMEM;
> > --
> > 2.17.1
> >
