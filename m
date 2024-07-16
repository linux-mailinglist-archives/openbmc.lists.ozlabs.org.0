Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A5931F11
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:00:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RxfCsLt6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNP1r0YbRz3d9s
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:00:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RxfCsLt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNP1J2mNBz30Wg
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 12:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721098768;
	bh=e8cHyS0Svz6J2vfTVcsGje2tU3Hck/CzXg2bVEIH+Ik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RxfCsLt6Pde7gvJU31gceNlEAJlwb1+F7HyuO8XLPyFutyNkyCeKjKBLsJeygr5ep
	 i5wEqC84JqNT7w4cXcX6qKzAQWukAbxjoBpgmGvt4pJ4nDjLkodbgvuya2pKSUd+hh
	 Vg54ZN0VeW4+vCbKQDT+dFdPAxrW3mjGTRseSZGcqaz+Kn+YYKUUAEUiVfRTFS4WNs
	 CRXPtKXppYw27KdJe7b2i/8dy6ilEGd2yEfuFkG/Q9K8OYoaZ75nWekFoBbypxkTJF
	 vgX65nYQHHTZwS6b/BKFoJ0aFlcPEp7pNzSqgL5LYaiDJtVRC/3zO6KFPs87/JH4Pq
	 ooumg+GMGN5oA==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 18140655AC;
	Tue, 16 Jul 2024 10:59:28 +0800 (AWST)
Message-ID: <7560fe7cb0945c54339826a2db1f50c8cf5ca500.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 1/3] arm64: dts: nuvoton: npcm8xx: add
 reference 25m clock property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 10:59:27 +0800
In-Reply-To: <CAP6Zq1iGhQRUZx2j3nF0cYArAhXH_uqv7T8ztNEN3j1wePJGAw@mail.gmail.com>
References: <20240714152617.3055768-1-tmaimon77@gmail.com>
	 <1c0d0b77405bbc5a2ddb5893405cc816a30a18cb.camel@codeconstruct.com.au>
	 <CAP6Zq1iGhQRUZx2j3nF0cYArAhXH_uqv7T8ztNEN3j1wePJGAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-15 at 12:16 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> Thanks for your comments.
>=20
> On Mon, 15 Jul 2024 at 09:05, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Tomer,
> >=20
> > In the future, can you please send your series with a cover letter with
> > the patches threaded under it?
> Sure!
> >=20
> > If you're not already using it, b4 is a helpful tool for sending
> > patches:
> I wasn't aware to B$, I will try it, thanks :-)
> >=20
> > https://b4.docs.kernel.org/en/latest/
> >=20
> > I ask because it's not clear to me what the relationship of this series
> > is with respect to what's going on upstream. A cover letter is a great
> > place to explain whether the patches are:
> >=20
> > 1. A backport of those under review upstream
> > 2. A backport of patches already merged upstream
> > 3. Specific to the openbmc/linux tree and have no upstream equivalent
> >=20
> > In the case of 1 and 2 (which are the ideal cases), I really prefer you
> > include a link to the upstream equivalents. The link makes it easier
> > for me to gauge how mature the patches are.
> If I am sending one patch only do you like me to add under --- in the
> patch explanation as well?

Yeah, that would be great, if you're just sending the one patch rather
than a series. Thanks.

> >=20
> > Regarding the patch content (rather than process), while the patches
> > all touch the NPCM8XX devicetree, they don't seem to have a coherent
> > feel otherwise :(
> >=20
> > On Sun, 2024-07-14 at 18:26 +0300, Tomer Maimon wrote:
> > > The NPCM8XX clock driver uses a 25Mhz external clock, therefore addin=
g
> > > clock property.
> > >=20
> > > The new required clock property does not break the NPCM8XX clock ABI
> > > since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla=
.
> >=20
> > This is a statement with respect to upstream, but it seems we've
> > already applied some of the patches here, and so there's possibly a
> > concern?
> Unfortunately, the NPCM8XX clock driver has been removed in dev-6.6,
> so the OpenBMC Linux kernel is dev-6.6 is in the same state as the
> Linux kernel vanilla.
> BTW, I don't see any concern with the reference clock patch, but the
> DT maintainers asked me to mention it not cause any ABI issue.

Okay. I guess I should have poked at the (absence) of the driver.

> >=20
> > >=20
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++---=
-
> > >  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++
> > >  2 files changed, 12 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi =
b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > index 91c1b5c4d635..9bd22f7d43f4 100644
> > > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > @@ -58,6 +58,7 @@ clk: clock-controller@f0801000 {
> > >                       compatible =3D "nuvoton,npcm845-clk";
> > >                       #clock-cells =3D <1>;
> > >                       reg =3D <0x0 0xf0801000 0x0 0x1000>;
> > > +                     clocks =3D <&refclk>;
> > >               };
> > >=20
> > >               apb {
> > > @@ -81,7 +82,7 @@ timer0: timer@8000 {
> > >                               compatible =3D "nuvoton,npcm845-timer";
> > >                               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0x8000 0x1C>;
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> > >                               clock-names =3D "refclk";
> > >                       };
> > >=20
> > > @@ -153,7 +154,7 @@ watchdog0: watchdog@801c {
> > >                               interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0x801c 0x4>;
> > >                               status =3D "disabled";
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> > >                               syscon =3D <&gcr>;
> > >                       };
> > >=20
> > > @@ -162,7 +163,7 @@ watchdog1: watchdog@901c {
> > >                               interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0x901c 0x4>;
> > >                               status =3D "disabled";
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> > >                               syscon =3D <&gcr>;
> > >                       };
> > >=20
> > > @@ -171,7 +172,7 @@ watchdog2: watchdog@a01c {
> > >                               interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0xa01c 0x4>;
> > >                               status =3D "disabled";
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> > >                               syscon =3D <&gcr>;
> > >                       };
> > >               };
> > > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > > index a5ab2bc0f835..83c2f4e138e5 100644
> > > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > > @@ -19,6 +19,13 @@ chosen {
> > >       memory {
> > >               reg =3D <0x0 0x0 0x0 0x40000000>;
> > >       };
> > > +
> > > +     refclk: refclk-25mhz {
> >=20
> > The node name should probably just be 'clock' according to the generic
> > node names recommendation?
> What do you mean? refclock? I am not sure, for example:
> https://elixir.bootlin.com/linux/v6.10-rc7/source/arch/arm64/boot/dts/fre=
escale/imx8mq-evk.dts#L24

I meant the node name (refclk-25mhz), not the label (refclk), but
plenty of other devicetrees call it random things, so don't worry about
it.

> >=20
> > > +             compatible =3D "fixed-clock";
> > > +             clock-output-names =3D "ref";
> > > +             clock-frequency =3D <25000000>;
> > > +             #clock-cells =3D <0>;
> > > +     };
> >=20
> > Defining this in the .dts but referencing the label inside the .dtsi
> > feels a bit off to me (as the .dtsi is no-longer self-contained). How
> > about we define the node in the .dtsi but override it in the .dts?
> I had a dissection about it with Krzysztof :-) I was told that since
> it is a reference clock on the board and not inside the SoC it should
> be defined in the DTS.

Hah, okay, I guess do whatever Krysztof recommends. If that's what
you've got, then it is what it is.

Andrew
