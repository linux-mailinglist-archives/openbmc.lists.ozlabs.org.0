Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B058F32
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 02:49:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZdSQ5RWrzDqgX
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 10:49:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BAelTGQd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VAghNPWM"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZdRZ0wykzDqDm;
 Fri, 28 Jun 2019 10:48:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B66A1A78;
 Thu, 27 Jun 2019 20:48:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 20:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=M2zdMuVXrO3RS7mphjNsozbVtL93heO
 H6wA/NOHeb+0=; b=BAelTGQdCOAoWnKgT4nPGmV09/oxDSrIMYG0yGTKzPDLRdS
 A1kF29+nQO+5Bht8vmcJseivJ5+K5NcDr34J6KEjOKASvwWZ3HA8bYKC4J+YtFBj
 m5FeOGOFRnH5lJuOEOgaCe/lLG9Tj+HSmWrFB8w0HrgQ9y+TtoCmTtybNXL6GiGs
 2sGHl8u5r26oweibUscllP04sLPqo3Tap/iTrdnLojETEj1wd0b4NKNcFC/8tjrP
 SUnjrRS3lGPYs/EMzxpKI46V/hagG6eMJCu1433IMiUj4RV4r0zesKg/1VIsEnkn
 7w0g+cPJ5Pfzj0ewIqfUMM+6UoxssWuYC4t7vXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=M2zdMu
 VXrO3RS7mphjNsozbVtL93heOH6wA/NOHeb+0=; b=VAghNPWMpfYQAih/+t1B7h
 TM5h0Cmp8xF2l6IqUzaLabOyXKQVDwa1nMKBDsm40TdCJ17oYOn26qWAeM0Zmn4b
 mIpgoD8dzm3+/2O/5R/THItQC1+T4Ohw3MaAYpx32znHpCAsEituY8MuC8GmMA++
 +BhtO0/vYfgRgvXqQrBB8M2Bg19OoYstd87+4qB8m+k4BLi+1gup1urE/2KlQHEC
 8ER4CaNxbxDIhrBhYQnqf+FMhfp4FZjwg/90rArk+1UMKRa5tUyiMkgMkedykTmX
 xlpSmhRCvC647fo4tsN/psw7GQadIyvQTBG1t+qUhtx+grivSwAXQr60zzRslnuA
 ==
X-ME-Sender: <xms:02MVXWNEEvUvgCmT9Rp_U7WUCE_s-OHhIqirMRNhk4vacMdYbvuOJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:02MVXb5tX7wtiQ9Nn8tlbvYa4tHLKwcSlmUFTTMN-utY_5oDvGhNmw>
 <xmx:02MVXSXAUZLXEP5_EeyTtNY0fzpaWNMTsXy6QK2Y21TeqAKNwbbmsw>
 <xmx:02MVXd1FQhyP2jlBRPc9TZQc8LupomSHtV1nM2mtOTJJo_FTD4Wdxw>
 <xmx:1WMVXe3pXluupymUHxOiZzcWvVaASLutrERE5TF2c17qhyUFV12FSw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BA943E00A2; Thu, 27 Jun 2019 20:48:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <d3291d9d-241b-40dc-b645-21f49f98da28@www.fastmail.com>
In-Reply-To: <CAL_JsqLiZzkJZ+CeaMDer=Arm9vFdG1Y_6F0M=AZV=82EqORFg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-3-andrew@aj.id.au>
 <CAL_JsqKXPzFYTHos-uvCUtBj-bcsNfrzt5GjxQ=PmgeXpp5J-A@mail.gmail.com>
 <ee0cac9e-4b39-4900-87a8-3dabb58ed883@www.fastmail.com>
 <CAL_JsqLiZzkJZ+CeaMDer=Arm9vFdG1Y_6F0M=AZV=82EqORFg@mail.gmail.com>
Date: Fri, 28 Jun 2019 10:17:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh+dt@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_2/8]_dt-bindings:_pinctrl:_aspeed:_Convert_AST2400_?=
 =?UTF-8?Q?bindings_to_json-schema?=
Content-Type: text/plain
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



On Thu, 27 Jun 2019, at 23:40, Rob Herring wrote:
> On Wed, Jun 26, 2019 at 6:44 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Wed, 26 Jun 2019, at 23:17, Rob Herring wrote:
> > > On Wed, Jun 26, 2019 at 1:21 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >
> > > > Convert ASPEED pinctrl bindings to DT schema format using json-schema
> > >
> > > BTW, ASPEED is one of the remaining platforms needing the top-level
> > > board bindings converted.
> >
> > Okay, I'll put together patches to fix that.
> >
> > >
> > > >
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > ---
> > > >  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 -------------------
> > > >  .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 73 +++++++++++++++++
> > > >  2 files changed, 73 insertions(+), 80 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..3b8cf3e51506
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> > > > @@ -0,0 +1,73 @@
> > > > +# SPDX-License-Identifier: GPL-2.0+
> > >
> > > Do you have rights to change the license?
> >
> > Where are you coming from with this question? The bindings previously didn't list a
> > license, is there some implicit license for them? I would have thought it was GPL-2.0?
> 
> Yes, it is implicitly GPL-2.0 since it is in the kernel tree and has
> no other license text.
> 
> > IBM's (my employer's) preferred contribution license is GPL 2.0-or-later, so I was just
> > adding the SPDX marker to clarify.
> 
> Adding 'or-later' is a licensing change. If IBM is the copyright
> holder on all this file, then that is fine.

I authored the file for IBM and they hold the copyright, so the change is permitted.

> 
> > > If so, the preference is to
> > > dual license with (GPL-2.0 OR BSD-2-Clause).
> >
> > You're asking if I have the power to relicense so I can dual license it this way?
> 
> It would probably be up to your company. If that's an issue, then not
> dual licensing is fine. I don't want to hold things up on that.

Okay. I've asked and the query is being resolved internally. I'm not sure when
that will occur though, so I'll relicense it in a future patch if the request gets
the go ahead. Just for the record, what's the motivation for the dual license?
Understanding why will likely help resolve the request.

> 
> [...]
> 
> > > > +required:
> > > > +  - compatible
> > > > +
> > > > +description: |+
> > >
> > > description goes before properties.
> >
> > Okay. I wouldn't have thought the ordering mattered. Is this just a preference?
> 
> Yes, just a preference.
> 
> > The tools seemed to run fine as is.
> >
> > I'll re-order it regardless.
> >
> > >
> > > > +  The pin controller node should be the child of a syscon node with the
> > > > +  required property:
> > > > +
> > > > +  - compatible:     Should be one of the following:
> > > > +                    "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > > > +                    "aspeed,g4-scu", "syscon", "simple-mfd"
> > > > +
> > > > +  Refer to the the bindings described in
> > > > +  Documentation/devicetree/bindings/mfd/syscon.txt
> > > > +
> > > > +  For the AST2400 pinmux, each mux function has only one associated pin group.
> > > > +  Each group is named by its function. The following values for the function
> > > > +  and groups properties are supported:
> > > > +
> > > > +  ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
> > > > +  ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID GPID0 GPID2
> > > > +  GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4
> > > > +  I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2LINK MDIO1
> > > > +  MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4
> > > > +  NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRTS3 OSCCLK
> > > > +  PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8
> > > > +  ROMCS1 ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1
> > > > +  SD2 SGPMCK SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI
> > > > +  SIOPBO SIOPWREQ SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU
> > > > +  SPICS1 TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6
> > > > +  USB11D1 USB11H2 USB2D1 USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24
> > > > +  VPI30 VPO12 VPO24 WDTRST1 WDTRST2
> > >
> > > This should be a schema.
> >
> > Yeah, I covered this in my cover letter. I was hoping to get away without
> > that for the moment as this seems like the first pinctrl binding to be
> > converted, however if you insist...
> 
> That generally doesn't matter. You can assume common properties will
> have a schema and you don't need to define common constraints (like
> 'function' is a string array). You only need what is specific to this
> binding which is possible values.

Right, it just wasn't clear to me how much effort was involved. Having
hacked around a bit now I've found it's not so much.

Thanks for your feedback.

Andrew
