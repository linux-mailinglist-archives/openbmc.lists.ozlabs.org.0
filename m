Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E003E0C26
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 03:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgB7w2Dg0z3bVw
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 11:38:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AZMTagmV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AZMTagmV; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgB7X5Tvtz3019;
 Thu,  5 Aug 2021 11:37:44 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id h10so2818305qth.5;
 Wed, 04 Aug 2021 18:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrUoo33QzEJCzngHbzWb8s99OZ12IEF2BT6Mt/7njNs=;
 b=AZMTagmVx5eejByIyQys2K/49jkyGBhQzkLw/QFB6IgxGy60S7upUAzkbgW6FEtYKy
 Cyq/Qlkpswvq++QE9aqwpXfmhBWkHDE+BpH5YudP4jfe2LGZYxC0LCLWoKuNCmF6nndn
 +vf2lReDlCNnTQXnKBSbpRbbP974F1vDQwCaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrUoo33QzEJCzngHbzWb8s99OZ12IEF2BT6Mt/7njNs=;
 b=cli2fdqvBhvR/NnYWjTDFXWjEQWxHPlGFp8bgkN5FXVXdZBzGQXH4yQRBWSNEPK+c+
 NJo+QF4HdOM821ikhQKgtAkivrX48IG5GUGlUOQ6wkIPphn4uQmnioOSecGmvxa6cUjg
 OLjWEgvcCB+lhJrWqBeKLqZdSlEGHs78+/w0lydKY3yy4sKsDI8VXpDolY20b/HWi2AQ
 c+VCTbAizg65fX4L05TMtJt9iFaS+Aa/YlSTtcNHitngKyo2kLL14xl1JzuchSRuroOC
 PoDGZmYie7CAKQ8ULHzbTqhwg+r2nHyfTnDUZgJVeVm+Ocf7zxpmjSHs46++kHrtHEgG
 rJ8g==
X-Gm-Message-State: AOAM5325+fdpu2Qb0I5IxIzVrM2sbGO2Yh7xx+HlKM78lhs8p6PtWHBk
 PQiDtaomqmkphuQkCexJYdT79qJPiQtnl4rW4+s=
X-Google-Smtp-Source: ABdhPJzkNflBi0/hcQs0RygNLaYq4Ikw4O/RVE49w7ODSfujoVNMCs0z8N9Deen1yHKjIc+T8utXCWILRUPuESZlWKo=
X-Received: by 2002:ac8:7454:: with SMTP id h20mr1967482qtr.263.1628127461174; 
 Wed, 04 Aug 2021 18:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
 <20210728233755.17963-7-rentao.bupt@gmail.com>
 <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
 <20210805011951.GA28444@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210805011951.GA28444@taoren-ubuntu-R90MNF91>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Aug 2021 01:37:29 +0000
Message-ID: <CACPK8XcwsOa5NzsUZeiv5qdWV5H6HBa7WK+cwbnqayP4zhoNkg@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 at 01:20, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> On Thu, Aug 05, 2021 at 12:28:02AM +0000, Joel Stanley wrote:
> > On Wed, 28 Jul 2021 at 23:38, <rentao.bupt@gmail.com> wrote:
> > >
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > >
> > > Add initial version of device tree for Facebook Fuji (AST2600) BMC.
> >
> > I like to read what kind of platform the BMC is going into if you can
> > add that detail, but it's not essential.
>
> Sure. I will add more details in v2.
>
> > > +&spi1 {
> > > +       status = "okay";
> > > +
> > > +       /*
> > > +        * Customize spi1 flash memory size to 32MB (maximum flash size on
> > > +        * the bus) to save vmalloc space.
> > > +        */
> > > +       reg = < 0x1e630000 0xc4
> > > +               0x30000000 0x2000000 >;
> >
> > Which driver supports this?
> >
> > It would be great to see Facebook work to get the SPI NOR driver for
> > the ast2600 merged to mainline.
> >
> > I doubt the IBM team will get to this, as we are using eMMC instead.
>
> Ah, I just checked aspeed-g6.dtsi (ast2600-spi) in mainline and I thought
> the driver patches were also upstreamed. Let me remove the entry for now,
> and will add it back when the driver is ready.

If it helps you, I don't mind it staying in your dts. I would like to
see some effort on the driver though.

>
> >
> > > +
> > > +       flash@0 {
> > > +               status = "okay";
> > > +               m25p,fast-read;
> > > +               label = "spi1.0";
> > > +               spi-max-frequency = <5000000>;
> > > +
> > > +               partitions {
> > > +                       compatible = "fixed-partitions";
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <1>;
> > > +
> > > +                       flash1@0 {
> > > +                               reg = <0x0 0x2000000>;
> > > +                               label = "system-flash";
> > > +                       };
> > > +               };
> > > +       };
> > > +};
> >
> > > +&ehci1 {
> > > +       status = "okay";
> > > +};
> >
> > Have you verified that USB works with mainline? I've had reports of it
> > working on 5.8 but it seems to have regressed as of v5.10.
>
> It stopped working on ASPEED since commit 280a9045bb18 ("ehci: fix EHCI
> host controller initialization sequence"): ehci_handshake() returns
> error because HCHalted bit EHCI24[12] stays at 1.
>
> I have a dirty hack in my tree (ignoring the halt bit) and it "works" on
> AST2500 and AST2600. Let me send an email to openbmc and aspeed email
> groups to see if anyone has more context.

We discovered the same, except in my testing it wasn't actually
"working" on my EVB. I have a A3 EVB on my desk and when plugging in a
USB key nothing happened.

>
> Meanwhile, should I delete the entry until the fix is ready in driver?

Again, leave it in I think.

>
> > > +&mdio1 {
> > > +       status = "okay";
> > > +
> > > +       ethphy3: ethernet-phy@13 {
> > > +               compatible = "ethernet-phy-ieee802.3-c22";
> > > +               reg = <0x0d>;
> > > +       };
> > > +};
> > > +
> > > +&mac3 {
> > > +       phy-handle = <&ethphy3>;
> >
> > status = okay?
> >
> > You should specify the pinmux too I think, even if the default happens
> > to work, so that other devices cannot claim the pins.
>
> status is set in ast2600 common dtsi, but let me set it here to avoid
> confusion. Will update pinmux in v2. Thanks.

Are you looking at mainline? I think it's disabled by default there:

https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/aspeed-g6.dtsi#L246

>
> >
> > Cheers,
> >
> > Joel
>
> Cheers,
>
> Tao
