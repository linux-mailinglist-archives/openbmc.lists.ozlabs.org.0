Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15571375F2D
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 05:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbwwT0pt4z2yY9
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 13:31:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbwwF4XXPz2xv2;
 Fri,  7 May 2021 13:31:22 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1473IbOq021620;
 Fri, 7 May 2021 11:18:37 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 11:30:28 +0800
Date: Fri, 7 May 2021 11:30:21 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 2/5] ARM: dts: aspeed: ast2600evb: Add comment for
 gpio regulator of sdhci
Message-ID: <20210507033021.GB23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-3-steven_lee@aspeedtech.com>
 <8611c4a7-8c65-4d7d-90d5-37c80faa3142@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8611c4a7-8c65-4d7d-90d5-37c80faa3142@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1473IbOq021620
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongwei Zhang <Hongweiz@ami.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/07/2021 09:40, Andrew Jeffery wrote:
> 
> 
> On Thu, 6 May 2021, at 19:33, Steven Lee wrote:
> > Add the description for describing the AST2600-A2 EVB reference design of
> > GPIO regulators.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> > b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > index 2772796e215e..1ae0facc3d5f 100644
> > --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > @@ -104,6 +104,21 @@
> >  	status = "okay";
> >  };
> >  
> > +/*
> > + * The signal voltage of sdhci0 and sdhci1 on AST2600-A2 EVB is able to be
> > + * toggled by GPIO pins.
> > + * In the reference design, GPIOV0 of AST2600-A2 EVB is connected to the
> > + * power load switch that providing 3.3v to sdhci0 vdd, GPIOV1 is connected to
> > + * a 1.8v and a 3.3v power load switch that providing signal voltage to
> > + * sdhci0 bus.
> > + * If GPIOV0 is active high, sdhci0 is enabled, otherwise, sdhci0 is disabled.
> > + * If GPIOV1 is active high, 3.3v power load switch is enabled, sdhci0 signal
> > + * voltage is 3.3v, otherwise, 1.8v power load switch will be enabled,
> > + * sdhci0 signal voltage becomes 1.8v.
> > + * AST2600-A2 EVB also support toggling signal voltage for sdhci1.
> > + * The design is the same as sdhci0, it uses GPIOV2 as power-gpio and GPIOV3
> > + * as power-switch-gpio.
> > + */
> 
> Okay, I think the comment is in the right place, but I feel this patch 
> should also add the regulator nodes and hook them up to the SDHCIs.
> 
> Given Rob isn't super keen on a second example in the binding document 
> I think you can just cut the example out and paste it in here.
> 

Hi Andrew,

Since AST2600-A0 and AST2600-A1 don't have regulators, do you mean cut
the example from dt-binding and paste it to aspeed-ast2600-evb.dts but
comment out the example?

> Andrew
