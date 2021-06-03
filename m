Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92F3997A5
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 03:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwTKs2kFXz2yyC
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 11:47:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwTKZ4M53z2xvP;
 Thu,  3 Jun 2021 11:47:11 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1531X0kq099798;
 Thu, 3 Jun 2021 09:33:00 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 09:46:28 +0800
Date: Thu, 3 Jun 2021 09:46:26 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: aspeed-i2c: Convert txt to yaml format
Message-ID: <20210603014625.GA1759@aspeedtech.com>
References: <20210527102512.20684-1-jamin_lin@aspeedtech.com>
 <20210527102512.20684-2-jamin_lin@aspeedtech.com>
 <20210602201720.GA3910963@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210602201720.GA3910963@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1531X0kq099798
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
 Troy Lee <troy_lee@aspeedtech.com>, Brendan
 Higgins <brendanhiggins@google.com>, open list <linux-kernel@vger.kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 06/02/2021 20:17, Rob Herring wrote:
> On Thu, May 27, 2021 at 06:25:05PM +0800, Jamin Lin wrote:
> > Convert aspeed i2c to yaml.
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 86 +++++++++++++++++++
> >  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 -----------
> >  2 files changed, 86 insertions(+), 49 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > new file mode 100644
> > index 000000000000..1f7064d77708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
> > +
> > +maintainers:
> > +  - Rayn Chen <rayn_chen@aspeedtech.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-i2c-bus
> > +      - aspeed,ast2500-i2c-bus
> > +      - aspeed,ast2600-i2c-bus
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  "#address-cells":
> > +    const: 1
> 
> These 2 are covered by i2c-controller.yaml.
>
Will remove them.
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - description: address offset and range of bus
> > +      - description: address offset and range of bus buffer
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: interrupt number
> 
> Drop. Not a useful description.
> 
Will remove it.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      root clock of bus, should reference the APB
> > +      clock in the second cell
> > +
> > +  reset:
> 
> resets
> 
Thanks to find the typo.
> > +    maxItems: 1
> > +    description: phandle to reset controller with the reset number in
> > +      the second cell
> 
> No need to describe the format of 'resets'.
> 
> > +
> > +  bus-frequency:
> > +    minimum: 500
> > +    maximum: 4000000
> > +    default: 100000
> > +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> > +      specified
> > +
> > +  multi-master:
> > +    type: boolean
> > +    description:
> > +      states that there is another master active on this bus
> > +
> > +required:
> > +  - reg
> > +  - compatible
> > +  - clocks
> > +  - resets
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/aspeed-clock.h>
> > +    i2c0: i2c-bus@40 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      #interrupt-cells = <1>;
> > +      reg = <0x40 0x40>;
> > +      compatible = "aspeed,ast2500-i2c-bus";
> 
> Convention is compatible first in the list of properties.
>
Will move compatible first in the list of properties.
> > +      clocks = <&syscon ASPEED_CLK_APB>;
> > +      resets = <&syscon ASPEED_RESET_I2C>;
> > +      bus-frequency = <100000>;
> > +      interrupts = <0>;
> > +      interrupt-parent = <&i2c_ic>;
> > +      status = "disabled";
> 
> Don't show status in examples especially when disabling disables some 
> validation...
> 
Will remove it.
> > +      /* Does not need pinctrl properties */
> > +    };
Thanks for your suggestion. I will send v3 patch.

