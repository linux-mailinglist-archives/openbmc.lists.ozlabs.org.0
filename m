Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E77AE32C
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 02:58:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MQzeTH5a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvhFH16THz2yq2
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 10:58:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MQzeTH5a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvhDd3LS2z30fD;
	Tue, 26 Sep 2023 10:57:53 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-175-231.adl-adc-lon-bras34.tpg.internode.on.net [118.210.175.231])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DDB5B20075;
	Tue, 26 Sep 2023 08:57:46 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695689871;
	bh=il9pZHitpvQPocfosyxq64m7qx5tIUZKMM6PXb+s62k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MQzeTH5alD6g2hNmisWGJknBk91CflzzODcRg5LoMfyPQAMZYJu4LuTjAcjDtAOLR
	 shyC8m27Jg9jxVYShrkXV0nhIP9cx3Re+BR4kTiYh47rjO6QTuwd0WlK0qbnqP9HCH
	 RGhQSEtWrIGM5BTcmNRPvJINxUL5jF1p7Hr+b7FqVMaAyitbEBYDx19/htNdYJzb1n
	 obNcw4r/mJ72J//8KfkkycqdOLS4sjTFYVLYiKCKDnusyaBuZP3DLvGq12QlvW/6Mh
	 JC1Ay0NyAeSyCpkGmljO+HgTr1kW07AB6CenNX/wTExtaIXg7gGEIaIydNXg5zO0K+
	 QmwvbfUNLkhoQ==
Message-ID: <20e3bef8282b1dd412020ecb24d90cbd89f39756.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: aspeed-wdt: Add
 aspeed,reset-mask property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Zev Weiss <zev@bewilderbeest.net>
Date: Tue, 26 Sep 2023 10:27:45 +0930
In-Reply-To: <e6b82ec9-c19b-4210-9251-2beee30c6d90@roeck-us.net>
References: <20230922104231.1434-4-zev@bewilderbeest.net>
	 <20230922104231.1434-5-zev@bewilderbeest.net>
	 <6df088a6-75ab-42f2-ba39-3f155714ed2d@app.fastmail.com>
	 <6b0d4901-d543-4a06-a1e4-7f1558f5361f@hatter.bewilderbeest.net>
	 <e6b82ec9-c19b-4210-9251-2beee30c6d90@roeck-us.net>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, "Milton D. Miller II" <mdmii@outlook.com>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, g@hatter.bewilderbeest.net, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-09-25 at 17:35 -0700, Guenter Roeck wrote:
> On Mon, Sep 25, 2023 at 05:04:10PM -0700, Zev Weiss wrote:
> > On Sun, Sep 24, 2023 at 07:42:45PM PDT, Andrew Jeffery wrote:
> > >=20
> > >=20
> > > On Fri, 22 Sep 2023, at 20:12, Zev Weiss wrote:
> > > > This property configures the Aspeed watchdog timer's reset mask, wh=
ich
> > > > controls which peripherals are reset when the watchdog timer expire=
s.
> > > > Some platforms require that certain devices be left untouched acros=
s a
> > > > reboot; aspeed,reset-mask can now be used to express such constrain=
ts.
> > > >=20
> > > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > > ---
> > > >  .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
> > > >  include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++=
++++
> > > >  2 files changed, 109 insertions(+), 1 deletion(-)
> > > >  create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.=
txt
> > > > b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > > index a8197632d6d2..3208adb3e52e 100644
> > > > --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > > +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > > @@ -47,7 +47,15 @@ Optional properties for AST2500-compatible watch=
dogs:
> > > >  			   is configured as push-pull, then set the pulse
> > > >  			   polarity to active-high. The default is active-low.
> > > >=20
> > > > -Example:
> > > > +Optional properties for AST2500- and AST2600-compatible watchdogs:
> > > > + - aspeed,reset-mask: A bitmask indicating which peripherals will =
be reset if
> > > > +		      the watchdog timer expires.  On AST2500 this should be a
> > > > +		      single word defined using the AST2500_WDT_RESET_* macros;
> > > > +		      on AST2600 this should be a two-word array with the first
> > > > +		      word defined using the AST2600_WDT_RESET1_* macros and the
> > > > +		      second word defined using the AST2600_WDT_RESET2_* macros.
> > > > +
> > > > +Examples:
> > > >=20
> > > >  	wdt1: watchdog@1e785000 {
> > > >  		compatible =3D "aspeed,ast2400-wdt";
> > > > @@ -55,3 +63,11 @@ Example:
> > > >  		aspeed,reset-type =3D "system";
> > > >  		aspeed,external-signal;
> > > >  	};
> > > > +
> > > > +	#include <dt-bindings/watchdog/aspeed-wdt.h>
> > > > +	wdt2: watchdog@1e785040 {
> > > > +		compatible =3D "aspeed,ast2600-wdt";
> > > > +		reg =3D <0x1e785040 0x40>;
> > > > +		aspeed,reset-mask =3D <AST2600_WDT_RESET1_DEFAULT
> > > > +				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
> > > > +	};
> > >=20
> > > Rob has acked your current approach already, but I do wonder about an
> > > alternative that aligns more with the clock/reset/interrupt propertie=
s.
> > > Essentially, define a new generic watchdog property that is specified=
 on
> > > the controllers to be reset by the watchdog (or even on just the
> > > watchdog node itself, emulating what you've proposed here):
> > >=20
> > > watchdog-resets =3D <phandle index>;
> > >=20
> > > The phandle links to the watchdog of interest, and the index specifie=
s
> > > the controller associated with the configuration. It might even be
> > > useful to do:
> > >=20
> > > watchdog-resets =3D <phandle index enable>;
> > >=20
> > > "enable" could provide explicit control over whether somethings shoul=
d
> > > be reset or not (as a way to prevent reset if the controller targeted=
 by
> > > the provided index would otherwise be reset in accordance with the
> > > default reset value in the watchdog controller).
> > >=20
> > > The macros from the dt-bindings header can then use macros to name th=
e
> > > indexes rather than define a mask tied to the register layout. The in=
dex
> > > may still in some way represent the mask position. This has the benef=
it
> > > of hiding the issue of one vs two configuration registers between the
> > > AST2500 and AST2600 while also allowing other controllers to exploit =
the
> > > binding (Nuvoton BMCs? Though maybe it's generalising too early?).
> > >=20
> >=20
> > Sorry, I'm having a bit of a hard time picturing exactly what you're
> > suggesting here...to start with:
> >=20
> > > property that is specified on the controllers to be reset by the
> > > watchdog
> >=20
> > and
> >=20
> > > or even on just the watchdog node itself
> >=20
> > seem on the face of it like two fairly different approaches to me.  The
> > former sounds more like existing clock/reset/etc. stuff, where the
> > peripheral has a property describing its relationship to the "central"
> > subsystem, and various peripheral drivers are all individually responsi=
ble
> > for observing that property and calling in to the central subsystem to
> > configure things for that peripheral appropriately; if I'm understandin=
g you
> > correctly, it might look something like:
> >=20
> >   &spi1 {
> >     watchdog-resets =3D <&wdt1 WDT_INDEX_SPI1 0>;
> >   };
> >=20
> > Or maybe something more like how pinctrl works, via phandles to subnode=
s of
> > the central device?
> >=20
> >   &wdt1 {
> >     wdt1_spi1_reset: spi1_reset {
> >       reg =3D <0x1c>;
> >       bit =3D <24>;
> >     };
> >   };
> >=20
> >   &spi1 {
> >     watchdog-resets =3D <&wdt1_spi1_reset 0>;
> >   };
> >=20
> > Either way, it seems like it'd be complicated by any insufficient
> > granularity in the watchdog w.r.t. having independent control over the
> > individual devices represented by separate DT nodes (such as how the AS=
T2500
> > watchdog has a single SPI controller reset bit instead of one per SPI
> > interface, or its "misc SOC controller" bit governing all sorts of odds=
 and
> > ends).
> >=20
> > In the latter case (property on the wdt node), would it essentially jus=
t be
> > kind of an indirection layer mapping hardware-independent device indice=
s to
> > specific registers/bits?  It's not obvious to me what purpose a phandle=
 to
> > the peripheral device node would serve (would the wdt driver have a goo=
d way
> > of identifying what specific peripheral it's pointing to to know what b=
it to
> > twiddle?), but maybe I'm misunderstanding what you're suggesting...
> >=20
> >=20
> > I guess my other uncertainty is the balance between generalization and
> > applicability -- how many other watchdog devices have sufficient compar=
able
> > configurability to make use of it?  I haven't pored over all of them, b=
ut
> > from a random sampling of 20 so of the other existing wdt drivers I don=
't
> > see any obvious candidates -- the closest I saw were cpwd.c, which
> > apparently can distinguish between a CPU reset and a CPU/backplane/boar=
d
> > reset, and realtek_otto_wdt.c, which can do a CPU or a SOC reset (thoug=
h I
> > don't have any of the hardware docs to know what capabilities other dev=
ices
> > might provide that the drivers don't use).  Do the Nuvoton BMCs have
> > watchdogs with peripheral-granularity reset configuration?
> >=20
>=20
> Quite frankly, I don't like where this is going. It is getting way
> too complicated. And when something is becoming way too complicated,
> I tend to put it on my backburner list. The length of that list quickly
> approaches maxint.
>=20

No worries. I figured I should at least give the idea some air-time,
even if we did end up discounting it. I feel my description and Zev's
queries make it sound more complex than it might be in practice but I
also haven't written the patch, so never mind!

Andrew
