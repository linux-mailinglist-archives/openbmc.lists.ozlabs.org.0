Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691357A4C
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:56:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5g76q2qzDqcm
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 13:56:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GTt/F9Qa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EK8E0SUG"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z5fF2h3FzDqck;
 Thu, 27 Jun 2019 13:55:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C23C4FE1;
 Wed, 26 Jun 2019 23:55:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 23:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=tMjKr
 iNycNOWkPKVYEQBH1iIP1LssSXBssZD2VGtolQ=; b=GTt/F9Qa6bfIu3QOnOpxY
 Uv5bHNcOzYTEPNdjXk7gXE5NTjWBYEfKhC8+ecFsY/Xstnur01IzqMHvTLXoJDSX
 oxMJPT4RforoAXFoFbFnT6Lug/oOn4JvgC7neJvYOWuMosbT+dy1LiAHlF0HzTtn
 sp7oXsPMLMTCZw/K2PQjqJByQ9vdNIQt9CNxEc2g+Eyv3L2tFmfQcSCDEICSyjKG
 T2gifMxPKDmsnqGMwVVVieD0v8+8mx+cx89yO+HlEzVqvz67xThMiNxcZmu8pIQj
 o1EuHXMSKL7hkduHR/YTXK3w9q8qSZx5DRtNlf4e1hVDVpSoEzQBIucyfb1ZJiDa
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=tMjKriNycNOWkPKVYEQBH1iIP1LssSXBssZD2VGto
 lQ=; b=EK8E0SUG+AhD5hGbawX4rZsr8eBONtMImKCWFrm0mCjZ64Z6CdybCcdaE
 C/xNGHwDh2P+RdZGeafGS4/VB/PTCzsxbWjihNV9Vl/Bk6rKEVeganc6iqMmGSPE
 e+76aFA9ucOBZ5g09R6VCClNwy1C/IqVbyMHRHnRl2PDlNTKyqh9G71XF0WPPFWM
 0aEaIyIuoEZX4JpltGpwEk68JZGXAx+LfCOvFCj6Pyuv1fE/oWAFexMebdEc7y52
 wAAdpxOPxgMCQfsPDB6JBBdlzqhkqdtpSDo4ZK/wFG4OcpN4JS2fEVS0BUvGNQDz
 LDtu0/jg9l9T6gfAVrupQUG7vbRzQ==
X-ME-Sender: <xms:Pz4UXW8o9fzgPtOAqJO6SJ3Xuku4yGCtRb-1zTmQiKVXuUWs3alKjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpeguvghvihgtvghtrhgvvgdrohhrghdpkhgvrhhnvghlrdhorhhgnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrh
 fuihiivgeptd
X-ME-Proxy: <xmx:Pz4UXdA0yFPWEhSAHAbLxDmG8n0GPLyIH3Y_AruW_aug9NgSZx9iIQ>
 <xmx:Pz4UXYuzqbFBGFnN8KjhiG-1KMAWv8z4Jykv8xIuhfjQUn7eHpB52g>
 <xmx:Pz4UXdHMayJBqUUBd93X0A19lr5aDWjm-6p95WEXdx5tgvWuGty14w>
 <xmx:QD4UXSo3CXxzmQP7A3KBP2n9US2PkaDx_zy3mziznJ7Ll57gJIvvcA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E3CD1E00A2; Wed, 26 Jun 2019 23:55:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <30d5585b-7591-4149-87c4-816e4c18fb9d@www.fastmail.com>
In-Reply-To: <CAL_JsqKXPzFYTHos-uvCUtBj-bcsNfrzt5GjxQ=PmgeXpp5J-A@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-3-andrew@aj.id.au>
 <CAL_JsqKXPzFYTHos-uvCUtBj-bcsNfrzt5GjxQ=PmgeXpp5J-A@mail.gmail.com>
Date: Thu, 27 Jun 2019 13:25:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh+dt@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_2/8]_dt-bindings:_pinctrl:_aspeed:_Convert_AST2400_?=
 =?UTF-8?Q?bindings_to_json-schema?=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 26 Jun 2019, at 23:17, Rob Herring wrote:
> On Wed, Jun 26, 2019 at 1:21 AM Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > +  The pin controller node should be the child of a syscon node with=
 the
> > +  required property:
> > +
> > +  - compatible:     Should be one of the following:
> > +                    "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > +                    "aspeed,g4-scu", "syscon", "simple-mfd"
> > +
> > +  Refer to the the bindings described in
> > +  Documentation/devicetree/bindings/mfd/syscon.txt
> > +
> > +  For the AST2400 pinmux, each mux function has only one associated=
 pin group.
> > +  Each group is named by its function. The following values for the=
 function
> > +  and groups properties are supported:
> > +
> > +  ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4=
 ADC5 ADC6
> > +  ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID=
 GPID0 GPID2
> > +  GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14=
 I2C3 I2C4
> > +  I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2=
LINK MDIO1
> > +  MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2=
 NDSR3 NDSR4
> > +  NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRT=
S3 OSCCLK
> > +  PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2=
 ROM16 ROM8
> > +  ROMCS1 ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3=
 SALT4 SD1
> > +  SD2 SGPMCK SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCT=
RL SIOPBI
> > +  SIOPBO SIOPWREQ SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PA=
SSTHRU
> > +  SPICS1 TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 T=
XD4 UART6
> > +  USB11D1 USB11H2 USB2D1 USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI1=
8 VPI24
> > +  VPI30 VPO12 VPO24 WDTRST1 WDTRST2
>=20
> This should be a schema. You need to define child nodes and list these=

> as values for 'function' and 'group'. Ideally, the child nodes would
> have some sort of pattern, but if not, you can just match on '^.*$'
> under patternProperties.

The children don't have any pattern in their node name, which drives
me towards the '^.*$' pattern match, however, what I've found is that
I get the following errors for some of the relevant dts files:

```
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.=
dt.yaml: compatible: ['aspeed,g4-pinctrl'] is not of type 'object'      =
                                                                        =
                                                       =20
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.=
dt.yaml: pinctrl-names: ['default'] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.=
dt.yaml: pinctrl-0: [[7, 8, 9, 10, 11, 12]] is not of type 'object'     =
                                                                        =
                                                       =20
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.=
dt.yaml: phandle: [[13]] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.=
dt.yaml: $nodename: ['pinctrl'] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: compatible: ['aspeed,g4-pinctrl'] is not of type 'object'       =
                                                                        =
                                                       =20
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: pinctrl-names: ['default'] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: pinctrl-0: [[9, 10, 11, 12]] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: phandle: [[13]] is not of type 'object'
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: $nodename: ['pinctrl'] is not of type 'object'
```

We shouldn't be expecting these properties in the child nodes, so
something is busted. Looking at processed-schema.yaml, we have:

```
- $filename: /home/andrew/src/linux/aspeed/Documentation/devicetree/bind=
ings/pinctrl/aspeed,ast2400-pinctrl.yaml
  $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2400-pinctrl.yaml=
#
  $schema: http://devicetree.org/meta-schemas/core.yaml#
  patternProperties:
    ^.*$:
      patternProperties:
        ^function|groups$:
          allOf:
          - {$ref: /schemas/types.yaml#/definitions/string}
          - additionalItems: false
            items:
              enum: [ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14=
, ADC15, ADC2,
                ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK=
, DDCDAT,
                EXTRST, FLACK, FLBUSY, FLWP, GPID, GPID0, GPID2, GPID4, =
GPID6, GPIE0,
                GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, =
I2C3, I2C4,
                I2C5, I2C6, I2C7, I2C8, I2C9, LPCPD, LPCPME, LPCRST, LPC=
SMI, MAC1LINK,
                MAC2LINK, MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD=
1, NDCD2,
                NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, =
NDTR3, NDTR4,
                NDTS4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, OSCC=
LK, PWM0,
                PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2=
, RMII1, RMII2,
                ROM16, ROM8, ROMCS1, ROMCS2, ROMCS3, ROMCS4, RXD1, RXD2,=
 RXD3, RXD4,
                SALT1, SALT2, SALT3, SALT4, SD1, SD2, SGPMCK, SGPMI, SGP=
MLD, SGPMO,
                SGPSCK, SGPSI0, SGPSI1, SGPSLD, SIOONCTRL, SIOPBI, SIOPB=
O, SIOPWREQ,
                SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1DEBUG, SPI1PAS=
STHRU, SPICS1,
                TIMER3, TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TX=
D2, TXD3,
                TXD4, UART6, USB11D1, USB11H2, USB2D1, USB2H1, USBCKI, V=
GABIOS_ROM,
                VGAHS, VGAVS, VPI18, VPI24, VPI30, VPO12, VPO24, WDTRST1=
, WDTRST2]
            maxItems: 1
            minItems: 1
            type: array
        pinctrl-[0-9]+: true
      properties: {phandle: true, pinctrl-names: true, status: true}
      type: object
    pinctrl-[0-9]+: true
  properties:
    $nodename: true
    compatible:
      additionalItems: false
      items:
      - enum: ['aspeed,ast2400-pinctrl', 'aspeed,g4-pinctrl']
      maxItems: 1
      minItems: 1
      type: array
    phandle: true
    pinctrl-names: true
    status: true
  required: [compatible]
  select:
    properties:
      compatible:
        contains:
          enum: ['aspeed,ast2400-pinctrl', 'aspeed,g4-pinctrl']
    required: [compatible]
  title: ASPEED AST2400 Pin Controller
```

`properties: {phandle: true, pinctrl-names: true, status: true}` has bee=
n
merged into my '^.*$' patternProperty, presumably partly from
pinctrl-consumer.yaml, and this seems to be the source of the bad
output. If as a hack I change my pattern to '^.*_default$' the problem
goes away as we no longer try to enforce the constraints on properties
provided by other bindings, but the problem is the node names are
largely freeform[1] (unless I enforce a naming constraint as part of my
bindings?).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt?h=3Dv=
5.2-rc6#n112

>=20
> BTW, You can put the names under a 'definitions' key and then use
> '$ref' to reference them from function and group to avoid duplicating
> the names. Or use patternProperties with '^(function|group)$'.

I've used the patternProperties approach above as I couldn't get the
definitions/$ref approach to work. I did the following:

```
definitions:
  pinctrl-value:
    allOf:
      - $ref: "/schemas/types.yaml#/definitions/string"
      - enum: [ "ACPI", "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC1=
3",
        "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7"=
,
        "ADC8", "ADC9", "BMCINT", "DDCCLK", "DDCDAT", "EXTRST", "FLACK",=

        "FLBUSY", "FLWP", "GPID", "GPID0", "GPID2", "GPID4", "GPID6", "G=
PIE0",
        "GPIE2", "GPIE4", "GPIE6", "I2C10", "I2C11", "I2C12", "I2C13", "=
I2C14",
        "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8", "I2C9", "LPCPD",=

        "LPCPME", "LPCRST", "LPCSMI", "MAC1LINK", "MAC2LINK", "MDIO1", "=
MDIO2",
        "NCTS1", "NCTS2", "NCTS3", "NCTS4", "NDCD1", "NDCD2", "NDCD3", "=
NDCD4",
        "NDSR1", "NDSR2", "NDSR3", "NDSR4", "NDTR1", "NDTR2", "NDTR3", "=
NDTR4",
        "NDTS4", "NRI1", "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS=
3",
        "OSCCLK", "PWM0", "PWM1", "PWM2", "PWM3", "PWM4", "PWM5", "PWM6"=
,
        "PWM7", "RGMII1", "RGMII2", "RMII1", "RMII2", "ROM16", "ROM8",
        "ROMCS1", "ROMCS2", "ROMCS3", "ROMCS4", "RXD1", "RXD2", "RXD3", =
"RXD4",
        "SALT1", "SALT2", "SALT3", "SALT4", "SD1", "SD2", "SGPMCK", "SGP=
MI",
        "SGPMLD", "SGPMO", "SGPSCK", "SGPSI0", "SGPSI1", "SGPSLD", "SIOO=
NCTRL",
        "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3", "SIOS5", "S=
IOSCI",
        "SPI1", "SPI1DEBUG", "SPI1PASSTHRU", "SPICS1", "TIMER3", "TIMER4=
",
        "TIMER5", "TIMER6", "TIMER7", "TIMER8", "TXD1", "TXD2", "TXD3", =
"TXD4",
        "UART6", "USB11D1", "USB11H2", "USB2D1", "USB2H1", "USBCKI",
        "VGABIOS_ROM", "VGAHS", "VGAVS", "VPI18", "VPI24", "VPI30", "VPO=
12",
        "VPO24", "WDTRST1", "WDTRST2" ]

patternProperties:
  '^.*_default$':
    type: object
    properties:
      function:
        $ref: "#/definitions/pinctrl-value"
      groups:
        $ref: "#/definitions/pinctrl-value"
```

But it gave me output like:

```
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: wdtrst2_default:function: ['WDTRST2'] is not one of ['ACPI', 'AD=
C0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2=
', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'DD=
CCLK', 'DDCDAT', 'EXTRST', 'FLACK', 'FLBUSY', 'FLWP', 'GPID', 'GPID0', '=
GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE4', 'GPIE6', 'I2C10', '=
I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7=
', 'I2C8', 'I2C9', 'LPCPD', 'LPCPME', 'LPCRST', 'LPCSMI', 'MAC1LINK', 'M=
AC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1',=
 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1',=
 'NDTR2', 'NDTR3', 'NDTR4', 'NDTS4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NR=
TS1', 'NRTS2', 'NRTS3', 'OSCCLK', 'PWM0', 'PWM1', 'PWM2', 'PWM3', 'PWM4'=
, 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'ROM16',=
 'ROM8', 'ROMCS1', 'ROMCS2', 'ROMCS3', 'ROMCS4', 'RXD1', 'RXD2', 'RXD3',=
 'RXD4', 'SALT1', 'SALT2', 'SALT3', 'SALT4', 'SD1', 'SD2', 'SGPMCK', 'SG=
PMI', 'SGPMLD', 'SGPMO', 'SGPSCK', 'SGPSI0', 'SGPSI1', 'SGPSLD', 'SIOONC=
TRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIO=
SCI', 'SPI1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPICS1', 'TIMER3', 'TIMER4',=
 'TIMER5', 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4',=
 'UART6', 'USB11D1', 'USB11H2', 'USB2D1', 'USB2H1', 'USBCKI', 'VGABIOS_R=
OM', 'VGAHS', 'VGAVS', 'VPI18', 'VPI24', 'VPI30', 'VPO12', 'VPO24', 'WDT=
RST1', 'WDTRST2']
/home/andrew/src/linux/aspeed/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.d=
t.yaml: wdtrst2_default:groups: ['WDTRST2'] is not one of ['ACPI', 'ADC0=
', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2',=
 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'DDCC=
LK', 'DDCDAT', 'EXTRST', 'FLACK', 'FLBUSY', 'FLWP', 'GPID', 'GPID0', 'GP=
ID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE4', 'GPIE6', 'I2C10', 'I2=
C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7',=
 'I2C8', 'I2C9', 'LPCPD', 'LPCPME', 'LPCRST', 'LPCSMI', 'MAC1LINK', 'MAC=
2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', '=
NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', '=
NDTR2', 'NDTR3', 'NDTR4', 'NDTS4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS=
1', 'NRTS2', 'NRTS3', 'OSCCLK', 'PWM0', 'PWM1', 'PWM2', 'PWM3', 'PWM4', =
'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'ROM16', '=
ROM8', 'ROMCS1', 'ROMCS2', 'ROMCS3', 'ROMCS4', 'RXD1', 'RXD2', 'RXD3', '=
RXD4', 'SALT1', 'SALT2', 'SALT3', 'SALT4', 'SD1', 'SD2', 'SGPMCK', 'SGPM=
I', 'SGPMLD', 'SGPMO', 'SGPSCK', 'SGPSI0', 'SGPSI1', 'SGPSLD', 'SIOONCTR=
L', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSC=
I', 'SPI1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPICS1', 'TIMER3', 'TIMER4', '=
TIMER5', 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', '=
UART6', 'USB11D1', 'USB11H2', 'USB2D1', 'USB2H1', 'USBCKI', 'VGABIOS_ROM=
', 'VGAHS', 'VGAVS', 'VPI18', 'VPI24', 'VPI30', 'VPO12', 'VPO24', 'WDTRS=
T1', 'WDTRST2']
```

Clearly I haven't got it quite right, but I'm not sure what's wrong with=
 my approach. Can you tell me? It looks like the property is interpreted=
 as a string-array rather than a string, but I'm not sure why.

Cheers,

Andrew
