Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2EE377A2B
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 04:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdlVm1Fpdz2yqC
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 12:34:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdlVT3qQ9z2yXs;
 Mon, 10 May 2021 12:33:51 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14A2KSJh015471;
 Mon, 10 May 2021 10:20:28 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 May
 2021 10:32:31 +0800
Date: Mon, 10 May 2021 10:32:28 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: mmc: sdhci-of-aspeed: Add an example
 for AST2600-A2 EVB
Message-ID: <20210510023228.GA6883@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-2-steven_lee@aspeedtech.com>
 <20210507011324.GA1119409@robh.at.kernel.org>
 <20210507031348.GA23749@aspeedtech.com>
 <CAL_JsqLywL6J_uVVquhOMevb6Geed-A2o7fzHQPKvVQxe4gscA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLywL6J_uVVquhOMevb6Geed-A2o7fzHQPKvVQxe4gscA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14A2KSJh015471
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
 Ulf Hansson <ulf.hansson@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Hongweiz@ami.com" <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/08/2021 01:21, Rob Herring wrote:
> On Thu, May 6, 2021 at 10:14 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > The 05/07/2021 09:13, Rob Herring wrote:
> > > On Thu, May 06, 2021 at 06:03:08PM +0800, Steven Lee wrote:
> > > > AST2600-A2 EVB has the reference design for enabling SD bus
> > > > power and toggling SD bus signal voltage by GPIO pins.
> > > >
> > > > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> > > > power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> > > > connected to a 1.8v and a 3.3v power load switch that providing
> > > > signal voltage to
> > > > SD1 bus.
> > > >
> > > > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > > > disabled.
> > > > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> > > > signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> > > > enabled, SD1 signal voltage becomes 1.8v.
> > > >
> > > > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > > > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > > > GPIOV3 as power-switch-gpio.
> > > >
> > > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > > ---
> > > >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 101 +++++++++++++++++-
> > > >  1 file changed, 97 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > index 987b287f3bff..de7e61b3d37a 100644
> > > > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > @@ -45,10 +45,16 @@ patternProperties:
> > > >
> > > >      properties:
> > > >        compatible:
> > > > -        enum:
> > > > -          - aspeed,ast2400-sdhci
> > > > -          - aspeed,ast2500-sdhci
> > > > -          - aspeed,ast2600-sdhci
> > > > +        oneOf:
> > > > +          - items:
> > > > +              - enum:
> > > > +                  - aspeed,ast2400-sdhci
> > > > +                  - aspeed,ast2500-sdhci
> > > > +                  - aspeed,ast2600-sdhci
> > > > +          - items:
> > > > +              - enum:
> > > > +                  - aspeed,ast2600-sdhci
> > > > +              - const: sdhci
> > >
> > > Why are you adding 'sdhci'. That's not useful as a compatible given how
> > > many quirks different implementations have.
> > >
> > >
> >
> > It is for passing the dtbs_check of the second example.
> > Without this definition, many device trees have the following
> > error:
> >
> > ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> > Additional items are not allowed ('sdhci' was unexpected)
> 
> I would probably fix the dts files then. Does anything depend on 'sdhci'?
> 

The build error is caused by my second example.
My example is refer to the aspeed-g6.dtsi to append "sdhci" after
"aspeed,ast2600-sdhci"
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-g6.dtsi?h=v5.12#n561

As long as the second example is removed, the following error won't show in the dtbs_check result.

```
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC     arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml
  CHECK   arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml
  DTC     arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
  CHECK   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
/home/slee/aspeed/patch_up/linux/arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
        From schema: /home/slee/aspeed/patch_up/linux/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
/home/slee/aspeed/patch_up/linux/arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: sdc@1e740000: sdhci@1e740100:compatible: Additional items are not allowed ('sdhci' was unexpected)
        From schema: /home/slee/aspeed/patch_up/linux/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
/home/slee/aspeed/patch_up/linux/arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
        From schema: /home/slee/aspeed/patch_up/linux/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
/home/slee/aspeed/patch_up/linux/arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: sdc@1e740000: sdhci@1e740200:compatible: Additional items are not allowed ('sdhci' was unexpected)
        From schema: /home/slee/aspeed/patch_up/linux/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml

```

> Rob
