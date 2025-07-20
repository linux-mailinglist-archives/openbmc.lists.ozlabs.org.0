Return-Path: <openbmc+bounces-383-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F94B0B881
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 00:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bldLz1WjGz2xWc;
	Mon, 21 Jul 2025 08:22:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753050155;
	cv=none; b=b4PRVgKLxgDMrmu3iw1jUsb1UjjCQTEcRvshjhxRoOwTbCktSPNZk0lVBDgpLAfZFBfPYmmz01AdGzXMapRUQ7fjf7LXzfol1XUi0RXZnnxDoJbqS0iG15Ud9AQ6+SmsH4s4qX72dfvK3aUwaDDn0a1Z31PVq0/DZzXthsZBpG+G8HUqb3vER/rJpCXJkFHGO60P86DQ8tIBKfHC82GS6EHPNTPsBqeHdKQb2M1F6JeyCURtS9CyMpQBNwbCDZbuW6aPx8Abi/GwJSd+SljMGz8UlAcM4sUivF8dOf5LaYelAfbGTAORqB6Qt68vL39TzMbIQ/IKz1LrhjSGji1uaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753050155; c=relaxed/relaxed;
	bh=Dy3ph5LeZ3K3tRPIlbLysXDL6/dfRRaBQzPEoQMbemU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iC10Ar8hpBscmKYk3p1iIrpohIfRB5FRCf69xdgQL/ntMrqxxCYeNlExe/96dHxf7K5Sx3qEMokp0KSkPFkbsJlr4J4uSJjfYmvccM9nnHBcRC+l3h+as9gTTG0PqbDZ6Q5nWw1qjnPmcOYN48jtNj96SKfdxbWLQQ2nNSHV8bkoxBlYZ9DsacEjs0JJfgUJgv9Xcpd2bjq+f0rNiTHPR0RxPM9hNZ1PIwNQaoMARqnGNcKKefaAU3iOI+uTOVW00lArIIm68BsxogIXp55X+RQGUdtDjv9jp4ObD8RmVbS02z2UmyKEFRLFh53SrOGasPn/GXFW2YSH7Qv87UhUHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X4vBWyG5; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X4vBWyG5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bldLy2g9zz2xRw;
	Mon, 21 Jul 2025 08:22:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAC12A5276C;
	Sun, 20 Jul 2025 22:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49802C4CEE7;
	Sun, 20 Jul 2025 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753050151;
	bh=bM5zL7tOJogVkxC/dBJDYgKh+3nVk9kFwkbmG9c9IYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4vBWyG5vYZwDD4v2i65ZI4jQq15qc+dO83q2BtBhpT8khyJea2edi80gvwCjdceK
	 rVvzMuoo5dguYkK7l33e59cKcnmQnmwC3cLPs8NEx/EwhpPwlGjhlHU1f49uuSuaGw
	 Y9zyAoOUeZ4oruAML2zbIcz1nQwCmW530rt0I/Y7bZkT3y6/I8Q4Gw8Ax7SzTf2nRD
	 uoltJpkQZcGDywtPuKMPvKQZaryHCNXQNy1siQfPmiEypjDkTSFZna8idcQLfh64Wl
	 w7th2aSsgrAX6dzEtrww2rquC1AaugyP6S2V6tHsuk5SPMlPY1TBdVwom3UQ67WxNi
	 6p+5Yv/wbVEMA==
Date: Sun, 20 Jul 2025 17:22:30 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250720222230.GA2842356-robh@kernel.org>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
 <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
 <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 16, 2025 at 03:51:11AM +0000, Jacky Chou wrote:
> Hi Rob,
> 
> Thank you for your reply.
> 
> > >                                 quality = <100>;
> > >                         };
> > >
> > > +                       pcie_phy1: syscon@1e6ed200 {
> > > +                               compatible = "aspeed,pcie-phy",
> > "syscon";
> > > +                               reg = <0x1e6ed200 0x100>;
> > 
> > This looks like part of something else? It should be a child of that.
> > 
> > If this is the controls for the PCIe PHY, then use the PHY binding instead of your
> > own custom phandle property.
> > 
> 
> Our PCIe design has multiple functions. And the series of patches are submitted for
> PCIe RC. The other PCIe functions also use this phy node.
> I traced the PHY driver interface, it cannot meet our usage.

Why not?

There is also no requirement that using the DT PHY binding means you 
have to use the Linux PHY subsystem.

> Therefore, the RC driver uses the phandle property to configure.
> And this syscon also is used by the other PCIe functions.

Like what?

> > > +                       };
> > > +
> > > +                       pcie_cfg: syscon@1e770000 {
> > > +                               compatible = "aspeed,pcie-cfg",
> > "syscon";
> > > +                               reg = <0x1e770000 0x80>;
> > 
> > Looks like this is really part of the PCIe block as a h/w block isn't going to start
> > at offset 0xc0.
> > 
> > 
> 
> Actually.
> There are two PCIe bus in AST2600
> We use the other one PCIe to EP mode, here I call PCIe A.
> I call the pcie0 node as PCIe B.
> We do not provide PCIe A to RC mode for usage, just EP mode.
> But, when PCIe A is used as RC, it reg mapping is starting from 0x1e770080.
> I list there mapping.
> 
> 0x1e77_0000 ~ 0x1e77_007f : common usage
> 0x1e77_0080 ~ 0x1e77_00bf : PCIE A
> 0x1e77_00C0 ~ 0x1e77_00ff : PCIE B
> 
> So, it is why we create one node to describe common usage for PCIe A and B.
> And, why the pcie0 reg mapping is starting from 0x1e77_00c0.

In that case, maybe you need a common parent node with 2 child nodes for 
each bus.

Rob

> 
> > > +                       };
> > > +
> > > +                       pcie0: pcie@1e7700c0 {
> > > +                               compatible = "aspeed,ast2600-pcie";
> > > +                               device_type = "pci";
> > > +                               reg = <0x1e7700c0 0x40>;
> > > +                               linux,pci-domain = <0>;
> > 
> > No need for this. You only have 1 PCI host.
> > 
> 
> Agreed.
> We only provide one RC.
> 
> > > +                               #address-cells = <3>;
> > > +                               #size-cells = <2>;
> > > +                               interrupts = <GIC_SPI 168
> > IRQ_TYPE_LEVEL_HIGH>;
> > > +                               bus-range = <0x80 0xff>;
> > 
> > Does this h/w not support bus 0-0x7f for some reason?
> > 
> 
> List:
> PCIE A: 0-0x7f
> PCIE B: 0x80-0xff
> 
> It is our design on PCIe B to use bus-range 0x80-0xff.

That's a policy or h/w limitation?

Rob

