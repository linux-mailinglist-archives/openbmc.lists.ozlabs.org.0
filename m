Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC188A678C
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 11:56:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=EF2vSz/h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJfYn6xkyz3vX2
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 19:55:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=EF2vSz/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJfYB3XmNz3dLl
	for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2024 19:55:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713261301; x=1713866101; i=j.neuschaefer@gmx.net;
	bh=8VCPRF0Vi4vNnqUQWVncBOVnCYeatzGZKVzuabhLX+s=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EF2vSz/hH2dfmb22obzz/aifo+GrF6I9VZadrZtCJqQDB4p8FWRV36dq2aTp4Dsb
	 eVBDPQ8Jb8VguliZdqtgeC9I4v9sfefz6kuOfgQ5MKsszJxVqXW2L6EHr/7/7Zgrt
	 PCo7RySPIMzg4lZNpsPndMCtCOyC3BgjA1t2l/k7a/RokiUsHj6q4UeFUOeYKBRG3
	 8M26XuL0UqfAi4iFvRhZFVYZiLgcgP+iILkoBQOdDnbhQMyG2Uyn1/9YQmZ4gYIQ2
	 PHSVWe+Rg92dH28OUCRAD9iF2JhseI2Ww/KeRm8bOLgzRoh5+QJSjKsq+Z9PMwT7U
	 MM0uOi2lwAXlz3vWKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.226.147.226]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1sZMJd1W56-00ne89; Tue, 16
 Apr 2024 11:55:01 +0200
Date: Tue, 16 Apr 2024 11:54:59 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v11 3/4] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <Zh5K8_FuUtPq7Pqj@probook>
References: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
 <20240401-wpcm-clk-v11-3-379472961244@gmx.net>
 <9be144291cda6d9714252c9cd83649c2.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WXvGHi2mgeFMSsi1"
Content-Disposition: inline
In-Reply-To: <9be144291cda6d9714252c9cd83649c2.sboyd@kernel.org>
X-Provags-ID: V03:K1:8gvjSYTbOrJ8fToEjyuFJf3piXDlv7j1XoNQPn/z0zjfW3S9ii/
 AbXWqO5laHqjLXgSi2ovXuHD8lcJpKZacUrHKJ0EwXhbyPIVxSLD0CkTxBGVCs5SQGEl4Dv
 pAlNH3+UU55RVFOouCg10LcqK9o2lgET3zDa4E3XXPSeyKR8dXZNRoycy8hmgl87N5bKZW4
 Sa9+Bp6LoLq6Mj4t9vPGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UhqP2+Ik+Xo=;kbab+yCYAiyFtXldN06Ow8ypsUN
 4o0jeI2HJYKOcan0gge7tswtUJbeQYWuosKkrI0P253EuSTIHjVXW1/6SRu47SmPIvV3FiVth
 tpXCQdJC+y7Jakv36eQwkN5wnQQLIEstQGzWqRWtV+IGkvxOmD+YrBV0sjh7ipiRUg+e164NM
 PSs+NT1H2VBSUyam4v9V2oN4GII3kGkZ2z9+sXEth8FmuZ1F8CDB4Z/mc3A0xad+LrmIfI6Fc
 cIqrDtUDA8FhFOMBtnjGY+DBoZrTaOLR4uGQEW+ST5g3nMdQAZS71L2chW5P1TsA5acDUA5GF
 PzcwLa2X/pIC+3XsstMiE2iDPlMSZz5Z/y/aN74/Xjpsr0yfq1j8gL+1xYR2XqcI/1mkY2icG
 bK5LI0uGTPo9MfL+DioQYXTpuEwuxxKAqQSrsHn4QlBmfqVoAWs5D1YCoAtDSgs//dANB/jl/
 RdxyFvoKDoan0nxI3/kddECMBjRC59YfJO5aGqBuqcoM+j1llIRbo4nZEYbXDGJoooz1JYX0h
 Nr5aEI+DNd99DYvIk4fFa3pqVmv4NDOrE0suRaCKkKgyQlFROyeKOCMSjC6whB9LqT0LZR+Ey
 gswGo0sMu/d5bi2YI8aOfYxRY5qf0GWn5BMusWowdZnh6uxoqovz+zAKfMh3tihyLLi2CSNJP
 MeaLjeitfv2Uwt+6cTsw+sPLL8sLbhm3ROaafwUW0P11I16ZJ5tHFEXWYVNVI0Prbck4Cmz8w
 d+m+JvdO0lHoTaYqlGPOzi0tCtHvzt5iptnrWRj+ZCzqULykOFMqmaDlg6FeTVy5j3ujChHhQ
 9NRx5t4iorFDXB3PJU34wxwOnTqCjSfrADywnsTClUr8Q=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-clk@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WXvGHi2mgeFMSsi1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 12, 2024 at 12:25:05AM -0700, Stephen Boyd wrote:
> Quoting Jonathan Neusch=C3=A4fer (2024-04-01 07:06:32)
> > This driver implements the following features w.r.t. the clock and reset
> > controller in the WPCM450 SoC:
> >=20
> > - It calculates the rates for all clocks managed by the clock controller
> > - It leaves the clock tree mostly unchanged, except that it enables/
> >   disables clock gates based on usage.
> > - It exposes the reset lines managed by the controller using the
> >   Generic Reset Controller subsystem
> >=20
> > NOTE: If the driver and the corresponding devicetree node are present,
> >       the driver will disable "unused" clocks. This is problem until
> >       the clock relations are properly declared in the devicetree (in a
> >       later patch). Until then, the clk_ignore_unused kernel parameter
> >       can be used as a workaround.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >=20
> > I have considered converting this driver to a platform driver instead of
> > using CLK_OF_DECLARE, because platform drivers are generally the way
> > forward. However, the timer-npcm7xx driver used on the same platform
> > requires is initialized with TIMER_OF_DECLARE and thus requires the
> > clocks to be available earlier than a platform driver can provide them.
>=20
> In that case you can use CLK_OF_DECLARE_DRIVER(), register the clks
> needed for the timer driver to probe, and then put the rest of the clk
> registration in a normal platform driver.

I'll give it a try. I'm not sure how to make it work correctly without
calling (devm_)of_clk_add_hw_provider twice, though (once for the early
clock, timer0; once for the rest).

Another (probably simpler) approach seems be to declare a fixed-clock or
fixed-factor-clock in the DT, and use that in the timer:

	refclk_div2: clock-div2 {
		compatible =3D "fixed-factor-clock";
		clocks =3D <&refclk>;
		#clock-cells =3D <0>;
		clock-mult =3D <1>;
		clock-div =3D <2>;
	};

	timer0: timer@b8001000 {
		compatible =3D "nuvoton,wpcm450-timer";
		interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
		reg =3D <0xb8001000 0x1c>;
		clocks =3D <&refclk_div2>;
	};

=2E.. and additionally to mark the timer clocks as critical in
clk-wpcm450.c, so they don't get disabled for being "unused".


> > diff --git a/drivers/clk/nuvoton/clk-wpcm450.c b/drivers/clk/nuvoton/cl=
k-wpcm450.c
> > new file mode 100644
> > index 00000000000000..9100c4b8a56483
> > --- /dev/null
> > +++ b/drivers/clk/nuvoton/clk-wpcm450.c
> > @@ -0,0 +1,372 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Nuvoton WPCM450 clock and reset controller driver.
> > + *
> > + * Copyright (C) 2022 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>=20
> Isn't KBUILD_MODNAME an option already for dynamic debug?

Indeed, it's the +m option.

My motivation for setting pr_fmt in the first place should become
obsolete with the move towards a platform driver anyway, because then I
can use dev_err() etc. I'll remove the #define.

>=20
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/reset/reset-simple.h>
> > +#include <linux/slab.h>
> > +
> [...]
> > +
> > +static const struct clk_parent_data default_parents[] =3D {
> > +       { .name =3D "pll0" },
> > +       { .name =3D "pll1" },
> > +       { .name =3D "ref" },
> > +};
> > +
> > +static const struct clk_parent_data huart_parents[] =3D {
> > +       { .fw_name =3D "ref" },
> > +       { .name =3D "refdiv2" },
>=20
> Please remove all .name elements and use indexes or direct pointers.

Will do.

What I'm not yet sure about, is which of these is better:

 1. Having two kinds of indexes, 1. for internal use in the driver,
    identifying all clocks, 2. public as part of the devicetree binding
    ABI (defined in include/dt-bindings/clock/nuvoton,wpcm450-clk.h)
 2. Unifying the two and giving every clock a public index
 3. Using the same number space, but only providing public definitions
    (in the binding) for clocks that can be used outside the clock
    controller.

Option 3 sounds fairly reasonable.

> > +static const struct wpcm450_clken_data clken_data[] =3D {
> > +       { "fiu", { .name =3D "ahb3" }, WPCM450_CLK_FIU, 0 },
>=20
> This actually is  { .index =3D 0, .name =3D "ahb3" } and that is a bad
> combination. struct clk_parent_data should only have .name as a fallback
> when there's an old binding out there that doesn't have the 'clocks'
> property for the clk provider node. There shouldn't be any .name
> property because this is new code and a new binding.

I'll try switching to .index or .hw instead for the references to
internal clocks.


[...]
> > +/*
> > + * NOTE: Error handling is very rudimentary here. If the clock driver =
initial-
> > + * ization fails, the system is probably in bigger trouble than what i=
s caused
>=20
> Don't break words across lines with hyphens.

Good point.

(Due to the switch to a platform driver, this comment will probably
become obsolete anyway.)

> > + * by a few leaked resources.
> > + */
> > +
> > +static void __init wpcm450_clk_init(struct device_node *np)
> > +{
> > +       struct clk_hw_onecell_data *clk_data;
> > +       static struct clk_hw **hws;
> > +       static struct clk_hw *hw;
> > +       void __iomem *clk_base;
> > +       int i, ret;
> > +       struct reset_simple_data *reset;
> > +
> > +       clk_base =3D of_iomap(np, 0);
> > +       if (!clk_base) {
> > +               pr_err("%pOFP: failed to map registers\n", np);
> > +               of_node_put(np);
> > +               return;
> > +       }
> > +       of_node_put(np);
>=20
> The 'np' is used later when registering PLLs. You can only put the node
> after it's no longer used. Also, you never got the node with
> of_node_get(), so putting it here actually causes an underflow on the
> refcount. Just remove all the get/puts instead.

That simplifies it, thanks for the hint!

> > +
> > +       clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLK=
S), GFP_KERNEL);
> > +       if (!clk_data)
> > +               return;
> > +
> > +       clk_data->num =3D WPCM450_NUM_CLKS;
> [...]
> > +       /* Reset controller */
> > +       reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
> > +       if (!reset)
> > +               return;
> > +       reset->rcdev.owner =3D THIS_MODULE;
> > +       reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
> > +       reset->rcdev.ops =3D &reset_simple_ops;
> > +       reset->rcdev.of_node =3D np;
> > +       reset->membase =3D clk_base + REG_IPSRST;
> > +       ret =3D reset_controller_register(&reset->rcdev);
> > +       if (ret)
> > +               pr_err("Failed to register reset controller: %pe\n", ER=
R_PTR(ret));
>=20
> It would be nicer to register this device as an auxiliary device with a
> single API call and then have all the resets exist in that file
> instead of this file. The driver would be put in drivers/reset/ as well.

Not sure I'd move ten lines to a whole new file, but moving them to a
separate function definitely makes sense, I'll do that.

>=20
> > +
> > +       of_node_put(np);
>=20
> Drop this of_node_put()

Ok.


Thanks for your detailed review!

I'll send the next revision after testing my changes on the relevant
hardware (which I currently don't have with me).

-jn

--WXvGHi2mgeFMSsi1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmYeSscACgkQCDBEmo7z
X9v2Tw/+OlPtGnFxff1/A/65NMHgzu86TjFdCRf3hxLcDRlAcW/QKbbFIzrLimmf
1Fqx7I1qjUNBbQ67QDDgRPm1lebJRE9zVjWJIjXFC6LC1juGXPTts/GSHNJYcUpR
ueDuLC4+qql/oQbLr5L3yye1uljuFc/LTA80iUl6figpSkRLxVdyfMBqdVuDMQSH
7B0hWc/fwsU5/OLQR01vYtPzFrWCBQ9/gM8dHITdemGD8bJEvEzDxi6LJb4+yijd
kdnIDhQmVhLU9OCWaUO6SoXiyN3pAFbydCSi3z2sY21/8Ic+HiPttsMeqycThlKV
fHPFr4Ra4pFDbRuQwgSbVejseZukrnfVAAew6VgLCJLSUr+sw2Ub3iA2v87vnID6
Ur3FG0W+QB2W8O8NJ82NXJO3UTRLVejuTrcmaemyBPXK3qkWIWYLkDBhcd5++QAw
e/d0KkKHhxKgqe7f1oEcZv3el2f8daslpew+9SARp6OMXf61YqI7FihXjpsWXTNv
u7TyPBrfFlBw9mOMxr3WbNGzPJJc2wBokiAvGJWmbaQvdT2SNFadQM2fczS8oIdG
S0LTPzd5Vg0Gy288r1jUQiN8sedUeY2Ya+hipCYxzA1ftF0+VjoaQUv+BzH3P1F5
UtBnZEcs7UiRxStFPJdyHqmIZVQ5NTfoDvwDAXgH5riSqKlLRRk=
=6Ug7
-----END PGP SIGNATURE-----

--WXvGHi2mgeFMSsi1--
