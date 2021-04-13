Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694035D5F2
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 05:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKB5P2tkKz30KF
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 13:33:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKB5B5hwxz2xy3;
 Tue, 13 Apr 2021 13:33:00 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 13D3LYpM091103;
 Tue, 13 Apr 2021 11:21:34 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr
 2021 11:31:58 +0800
Date: Tue, 13 Apr 2021 11:31:56 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: sdhci-of-aspeed: Add power-gpio
 and power-switch-gpio
Message-ID: <20210413033155.GA3522@aspeedtech.com>
References: <20210408015218.20560-1-steven_lee@aspeedtech.com>
 <20210408015218.20560-2-steven_lee@aspeedtech.com>
 <CAPDyKFr=Gtwu4v22FBaax5EjRbXTNez1N2ZQxP=v0LKGFTCovw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAPDyKFr=Gtwu4v22FBaax5EjRbXTNez1N2ZQxP=v0LKGFTCovw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 13D3LYpM091103
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 04/12/2021 15:38, Ulf Hansson wrote:
> On Thu, 8 Apr 2021 at 03:52, Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST2600-A2 EVB provides the reference design for enabling SD bus power
> > and toggling SD bus signal voltage by GPIO pins.
> > Add the definition and example for power-gpio and power-switch-gpio
> > properties.
> >
> > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to power
> > load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is connected to
> > a 1.8v and a 3.3v power load switch that providing signal voltage to
> > SD1 bus.
> > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > disabled.
> > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1 signal
> > voltage is 3.3v. Otherwise, 1.8v power load switch will be enabled, SD1
> > signal voltage becomes 1.8v.
> >
> > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and GPIOV3
> > as power-switch-gpio.
> 
> Thanks for sharing the details, it certainly helps while reviewing.
> 
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > index 987b287f3bff..515a74614f3c 100644
> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -37,6 +37,14 @@ properties:
> >    clocks:
> >      maxItems: 1
> >      description: The SD/SDIO controller clock gate
> > +  power-gpio:
> > +    description:
> > +      The GPIO for enabling/disabling SD bus power.
> > +    maxItems: 1
> > +  power-switch-gpio:
> > +    description:
> > +      The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> > +    maxItems: 1
> 
> 
> >
> >  patternProperties:
> >    "^sdhci@[0-9a-f]+$":
> > @@ -61,6 +69,14 @@ patternProperties:
> >        sdhci,auto-cmd12:
> >          type: boolean
> >          description: Specifies that controller should use auto CMD12
> > +      power-gpio:
> > +        description:
> > +          The GPIO for enabling/disabling SD bus power.
> > +        maxItems: 1
> > +      power-switch-gpio:
> > +        description:
> > +          The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> > +        maxItems: 1
> >      required:
> 
> Please do not model these as GPIO pins like this. Instead, it's better
> to model them as gpio regulators, since the mmc core manages them as
> regulators.
> 
> We have a vmmc regulator (corresponding to vdd) and a vqmmc regulator
> (corresponding the signal-voltage level). These are also described in
> the common mmc DT bindings, see
> Documentation/devicetree/bindings/mmc/mmc-controller.yaml.
> 

Thanks for the information. I will modify it.

> >        - compatible
> >        - reg
> > @@ -80,6 +96,7 @@ required:
> >  examples:
> >    - |
> >      #include <dt-bindings/clock/aspeed-clock.h>
> > +    #include <dt-bindings/gpio/aspeed-gpio.h>
> >      sdc@1e740000 {
> >              compatible = "aspeed,ast2500-sd-controller";
> >              reg = <0x1e740000 0x100>;
> > @@ -94,6 +111,10 @@ examples:
> >                      interrupts = <26>;
> >                      sdhci,auto-cmd12;
> >                      clocks = <&syscon ASPEED_CLK_SDIO>;
> > +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 0)
> > +                                     GPIO_ACTIVE_HIGH>;
> > +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 1)
> > +                                     GPIO_ACTIVE_HIGH>;
> >              };
> >
> >              sdhci1: sdhci@200 {
> > @@ -102,5 +123,9 @@ examples:
> >                      interrupts = <26>;
> >                      sdhci,auto-cmd12;
> >                      clocks = <&syscon ASPEED_CLK_SDIO>;
> > +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 2)
> > +                                     GPIO_ACTIVE_HIGH>;
> > +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 3)
> > +                                     GPIO_ACTIVE_HIGH>;
> >              };
> >      };
> 
> Kind regards
> Uffe
