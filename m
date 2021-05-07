Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72401375F11
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 05:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbwYq39qmz2yXY
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 13:15:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbwYT4ZCHz2yXQ;
 Fri,  7 May 2021 13:15:06 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14731xV2019977;
 Fri, 7 May 2021 11:01:59 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 11:13:50 +0800
Date: Fri, 7 May 2021 11:13:48 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: mmc: sdhci-of-aspeed: Add an example
 for AST2600-A2 EVB
Message-ID: <20210507031348.GA23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-2-steven_lee@aspeedtech.com>
 <20210507011324.GA1119409@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210507011324.GA1119409@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14731xV2019977
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

The 05/07/2021 09:13, Rob Herring wrote:
> On Thu, May 06, 2021 at 06:03:08PM +0800, Steven Lee wrote:
> > AST2600-A2 EVB has the reference design for enabling SD bus
> > power and toggling SD bus signal voltage by GPIO pins.
> > 
> > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> > power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> > connected to a 1.8v and a 3.3v power load switch that providing
> > signal voltage to
> > SD1 bus.
> > 
> > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > disabled.
> > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> > signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> > enabled, SD1 signal voltage becomes 1.8v.
> > 
> > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > GPIOV3 as power-switch-gpio.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 101 +++++++++++++++++-
> >  1 file changed, 97 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > index 987b287f3bff..de7e61b3d37a 100644
> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -45,10 +45,16 @@ patternProperties:
> >  
> >      properties:
> >        compatible:
> > -        enum:
> > -          - aspeed,ast2400-sdhci
> > -          - aspeed,ast2500-sdhci
> > -          - aspeed,ast2600-sdhci
> > +        oneOf:
> > +          - items:
> > +              - enum:
> > +                  - aspeed,ast2400-sdhci
> > +                  - aspeed,ast2500-sdhci
> > +                  - aspeed,ast2600-sdhci
> > +          - items:
> > +              - enum:
> > +                  - aspeed,ast2600-sdhci
> > +              - const: sdhci
> 
> Why are you adding 'sdhci'. That's not useful as a compatible given how 
> many quirks different implementations have.
> 
> 

It is for passing the dtbs_check of the second example.
Without this definition, many device trees have the following
error:

['aspeed,ast2600-sdhci', 'sdhci'] is too long
Additional items are not allowed ('sdhci' was unexpected)

Regardless, I will remove it, and move the new example to device
tree.

Thanks.

> >        reg:
> >          maxItems: 1
> >          description: The SDHCI registers
> > @@ -104,3 +110,90 @@ examples:
> >                      clocks = <&syscon ASPEED_CLK_SDIO>;
> >              };
> >      };
> > +
> > +  - |
> 
> Why do we need another example?
> 

The original example is for AST2500 which doesn't support UHS mode.
The new example teaches users how to enable sdhci with UHS mode, add
gpio regulators, and adjust clock phase for AST2600-A2.

I will move the new example to ast2600 device tree per the
review comment.
https://lkml.org/lkml/2021/5/6/968

> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/clock/aspeed-clock.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    vcc_sdhci0: regulator-vcc-sdhci0 {
> > +            compatible = "regulator-fixed";
> > +            regulator-name = "SDHCI0 Vcc";
> > +            regulator-min-microvolt = <3300000>;
> > +            regulator-max-microvolt = <3300000>;
> > +            gpios = <&gpio0 168
> > +                            GPIO_ACTIVE_HIGH>;
> > +            enable-active-high;
> > +    };
> > +
> > +    vccq_sdhci0: regulator-vccq-sdhci0 {
> > +            compatible = "regulator-gpio";
> > +
> > +            regulator-name = "SDHCI0 VccQ";
> > +            regulator-min-microvolt = <1800000>;
> > +            regulator-max-microvolt = <3300000>;
> > +            gpios = <&gpio0 169
> > +                            GPIO_ACTIVE_HIGH>;
> > +            gpios-states = <1>;
> > +            states = <3300000 1>,
> > +                     <1800000 0>;
> > +    };
> > +
> > +    vcc_sdhci1: regulator-vcc-sdhci1 {
> > +            compatible = "regulator-fixed";
> > +
> > +            regulator-name = "SDHCI1 Vcc";
> > +            regulator-min-microvolt = <3300000>;
> > +            regulator-max-microvolt = <3300000>;
> > +            gpios = <&gpio0 170
> > +                            GPIO_ACTIVE_HIGH>;
> > +            enable-active-high;
> > +    };
> > +
> > +    vccq_sdhci1: regulator-vccq-sdhci1 {
> > +            compatible = "regulator-gpio";
> > +
> > +            regulator-name = "SDHCI1 VccQ";
> > +            regulator-min-microvolt = <1800000>;
> > +            regulator-max-microvolt = <3300000>;
> > +            gpios = <&gpio0 171
> > +                            GPIO_ACTIVE_HIGH>;
> > +            gpios-states = <1>;
> > +            states = <3300000 1>,
> > +                     <1800000 0>;
> > +    };
> > +
> > +    sdc@1e740000 {
> > +            compatible = "aspeed,ast2600-sd-controller";
> > +            reg = <0x1e740000 0x100>;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            ranges = <0 0x1e740000 0x20000>;
> > +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> > +
> > +            sdhci@1e740100 {
> > +                    compatible = "aspeed,ast2600-sdhci","sdhci";
> > +                    reg = <0x100 0x100>;
> > +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > +                    sdhci,auto-cmd12;
> > +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> > +                    vmmc-supply = <&vcc_sdhci0>;
> > +                    vqmmc-supply = <&vccq_sdhci0>;
> > +                    sd-uhs-sdr104;
> > +                    clk-phase-uhs-sdr104 = <180>, <180>;
> > +            };
> > +
> > +            sdhci@1e740200 {
> > +                    compatible = "aspeed,ast2600-sdhci","sdhci";
> > +                    reg = <0x200 0x100>;
> > +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > +                    sdhci,auto-cmd12;
> > +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> > +                    vmmc-supply = <&vcc_sdhci1>;
> > +                    vqmmc-supply = <&vccq_sdhci1>;
> > +                    sd-uhs-sdr104;
> > +                    clk-phase-uhs-sdr104 = <0>, <0>;
> > +            };
> > +    };
> > +
> > +...
> > -- 
> > 2.17.1
> > 
