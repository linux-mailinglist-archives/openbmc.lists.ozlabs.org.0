Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17C8A075D
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 06:51:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b8VqGLgX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFS3K3PvXz3vZN
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 14:51:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b8VqGLgX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFS2p550Lz3d42
	for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2024 14:51:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD7F3CE2B4F;
	Thu, 11 Apr 2024 04:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D200CC433F1;
	Thu, 11 Apr 2024 04:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712811087;
	bh=GUxfCzNobyGC5VcWk513iZKVan8O3e+IeiUp4CdtYLk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b8VqGLgXa2uRDbIsxmNSEsx4zA5+/iDwI6SOLu+w8zQTw9+WewG6kT3Q75D7WGJL/
	 TH/ZWHffaBZf4TtPtv063/KFMtcvgZG+zRgt4S9EHP/z8mF6xOevdRvqaB0Dvzb5Sx
	 2TeQAGrZmAsDBwBe1ADEe2PfHgCnzfEN4WtUPnuXuq7ofvL8OUsF1KI6v6P07OnxdH
	 1XeIa0f/M/DewCvnAEw9IRTlhadSmiTamZ/CAYaWmSDeOODc3WnZLJDNqkERYTUG3q
	 dU2v27sDWR+WL0pbWeNlq35Mtmvn69p+WMi74N16r86r0FP+NsHHLJpM5RJZVg2PwT
	 /VjcZIxQSymYA==
Message-ID: <6709fe217cfbd78543e7dfe7c3acec6e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1htKQ5v0tH9HGRejnKwJ5ZauUWG_CzYUKegkVL4Ek8UxA@mail.gmail.com>
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-4-tmaimon77@gmail.com> <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org> <CAP6Zq1g5gwXvYzO5fnHxG-6__gSCpNBY7VeEPyr4Qtijya6EfQ@mail.gmail.com> <8acf846e767884978f3bb98646433551.sboyd@kernel.org> <CAP6Zq1htKQ5v0tH9HGRejnKwJ5ZauUWG_CzYUKegkVL4Ek8UxA@mail.gmail.com>
Subject: Re: [PATCH v23 3/3] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Apr 2024 21:51:24 -0700
User-Agent: alot/0.10
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-02-29 13:29:46)
> Hi Stephen,
>=20
> Thanks for your reply.
>=20
> On Thu, 29 Feb 2024 at 00:48, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2024-02-25 10:00:35)
> > > Hi Stephen,
> > >
> > > On Thu, 22 Feb 2024 at 07:58, Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Tomer Maimon (2024-01-31 10:26:53)
> > > > > +
> > > > > +static unsigned long npcm8xx_clk_div_get_parent(struct clk_hw *h=
w,
> > > > > +                                               unsigned long par=
ent_rate)
> > > > > +{
> > > > > +       struct npcm8xx_clk *div =3D to_npcm8xx_clk(hw);
> > > > > +       unsigned int val;
> > > > > +
> > > > > +       regmap_read(div->clk_regmap, div->offset, &val);
> > > > > +       val =3D val >> div->shift;
> > > > > +       val &=3D clk_div_mask(div->width);
> > > > > +
> > > > > +       return divider_recalc_rate(hw, parent_rate, val, NULL, di=
v->flags,
> > > > > +                                  div->width);
> > > > > +}
> > > > > +
> > > > > +static const struct clk_ops npcm8xx_clk_div_ops =3D {
> > > > > +       .recalc_rate =3D npcm8xx_clk_div_get_parent,
> > > > > +};
> > > > > +
> > > > > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +       struct device_node *parent_np =3D of_get_parent(pdev->dev=
.of_node);
> > > >
> > > > The parent of this device is not a syscon.
> > > Once I have registered the map that handles both reset and the clock
> > > in general is syscon, this is why we will modify the DTS so the clock
> > > and the reset will be under syscon father node
> > >                 sysctrl: system-controller@f0801000 {
> > >                         compatible =3D "syscon", "simple-mfd";
> > >                         reg =3D <0x0 0xf0801000 0x0 0x1000>;
> > >
> > >                         rstc: reset-controller {
> > >                                 compatible =3D "nuvoton,npcm845-reset=
";
> > >                                 reg =3D <0x0 0xf0801000 0x0 0xC4>;
> > >                                 #reset-cells =3D <2>;
> > >                                 nuvoton,sysgcr =3D <&gcr>;
> > >                         };
> > >
> > >                         clk: clock-controller {
> > >                                 compatible =3D "nuvoton,npcm845-clk";
> > >                                 #clock-cells =3D <1>;
> > >                                 clocks =3D <&refclk>;
> > >                                 clock-names =3D "refclk";
> > >                         };
> > >                 };
> > > You can see other drivers that using the same method like
> > > https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/device=
tree/bindings/clock/socionext,uniphier-clock.yaml
> >
> > You will need a similar file like
> > Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-peri=
ctrl.yaml
> > then to describe the child nodes.
> I can do it.
> >
> > Socionext may not be the best example to follow. I generally try to
> > avoid syscon and simply put #reset-cells and #clock-cells in the node
> If I remove syscon I can't use syscon_node_to_regmap function, What
> should I use If I remove syscon? auxiliary bus? something else?

You should use auxiliary bus. You can make a regmap in the parent
driver and pass that to the child auxiliary devices still.

> > for the device. You can use the auxiliary bus to register drivers for
> > clk and reset and put them into the resepective driver directories.
> I little bit confused, what is an auxiliary bus to register drivers,
> can you provide me an example?

$ git grep -l auxiliary_ -- drivers/clk/
drivers/clk/microchip/clk-mpfs.c
drivers/clk/starfive/clk-starfive-jh7110-sys.c

You can decide to make either the clk or the reset driver the "main"
driver that registers the other auxiliary devices. Either way the DT
binding has a single node instead of one per logical driver in the
kernel.

> > Avoid syscon means random drivers can't reach into the device with a
> > regmap handle and read/write registers that they're not supposed to.
> Indeed, but the drivers could use the reset and clock memory map only
> if the module is also a child node.
>=20
> Please let me know what is your preferred way to handle it:
> 1. stick with syscon and upstream-defined documentation for the rst clk s=
yscon.
> 2. avoid syscon and use an auxiliary bus, appreciate if you could give
> me an example of how it should be done.
> 3. Avoid sycon and handle it differently.

I prefer 2
