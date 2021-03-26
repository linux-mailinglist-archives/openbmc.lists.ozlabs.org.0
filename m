Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68534AECC
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 19:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6WM11tzSz3c1X
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 05:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=SCa92GsM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=SCa92GsM; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6WLk4v8Dz3bsL
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 05:52:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616784732;
 bh=vouNfrqvwnj2jRCoiDlj0eW2eBcDSogKLdODonG/KnI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SCa92GsM3XsF4UQmE99IdhJFZvJ4vT+nzMpycsh58J/K78gRssvq5TiqbCxLzHDXb
 nMe8MIcb6Oy/U+sVQyJ33qZbHYK+s1RuCNVT8Bqxz8uV6s9dZ09DSmPNQg3mTpB3cx
 c2cXP9UKnKBe8iSHnBN4a5HkXvtbxPb+2PVlU6VA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1lssib042D-00gK0m; Fri, 26
 Mar 2021 19:52:12 +0100
Date: Fri, 26 Mar 2021 19:52:07 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 08/14] irqchip: Add driver for WPCM450 interrupt controller
Message-ID: <YF4tV+L71Lso94kT@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-9-j.neuschaefer@gmx.net>
 <87sg4kiia4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/vCPRjWtsUq/JNe6"
Content-Disposition: inline
In-Reply-To: <87sg4kiia4.wl-maz@kernel.org>
X-Provags-ID: V03:K1:OkGnUsBmuQYhTqJmp/2lqe1nQZt9b9czacZw6IjmkhZkAOOmhC/
 OIE+fyEAMzy9BuK7JUXvO8+6j/iHH0/c5fXydAZXWKEh8bbgN2q9KozHbG9Dqq3sEy30qf0
 LZUf/aQtWH7PjPRaeAdCONwDIXcfVB3jV8vm7S4I+H4ICbhlcVQHR5JVv5zAhstnEm9dmBo
 ylB6JaG3zVsZo8ONIx0xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUEWgO+SBWg=:4rJ3YB5GY+AMLWGZ8QnMTy
 mhq+izkM6FfkE4QxSh4efHDJZraFL/STrZQ1L31IUx8A4ZPv/qBPCrYSslLcBVSQJy8xlhJ2/
 8Ka9hm63QukTVkNMeKEhbUquunSAcJOq7kI5hkBxqmLiLdqs0rnfAKi46TcmmQRKn3xm6Lcq3
 KzPw99DIUIll8w4OM/1yIRBy4cxTHxkjLWZeuKpjx42eR5zPrEK6s/7EGCa9m1FfV4Or2rbqX
 JPcyMjE5hy+8650ontqA8yjJPrq87n7lmmgARQNOQW47xr7PAvZGXsHt1KSC5GQF3eRG0j/eM
 vEXlPQZnDZOX5kd5/wXIYegqWZfBwiErOHYB1w7llg39gYJpqVf7XkcNGl7dYhulKjeXPU25b
 wGZTsPl8boSpLIKWjvUsmojnefjlL9qiUOcuuJocKHyu1c0DCrmpT7SZDMEXqLWTr6ASuaVXZ
 AoW2ON9bInM2IRjPct0Yn3sfGMtkOgmHknyaoCSzw15JEJ8tGxXu9zYScJZI6rmVmlwvikus2
 qXAl2m1VT3ecSfoyc5E9Sp/1/8pkI39zaWSwsm9jY8bKIiuaINAEFtHh8vTT1SQp/YX9ALhBo
 wKwkaTkvIufTNjVfP9TiE+jh6fNbRwPqvbDtSu0VtBVupbGvYTTSwRWJrhnFJ9VgQMrfK9Jlm
 Vl+4qhPKVH6dBzIlZzR78bARH5B4n7b08ASJ1GxV4qtAnNTo+VaNZrmlWdUte+doEgGoS0cN7
 yltQ53irHxno2zcRavgW0xezWugBp4CZO8DRsEI2c7XpvlUeqDEeJguqRa1NW+nbwiDfeUA0A
 Awderu5gB3cIqTEB2oZIH7axB+yj8Q7SsfqG/QCp36NfKDGEB7/A/jWKCQAykgy+VkqQY92r9
 FkhAO6HT+DQhOQsbygOjEYMyh1VvwiDo2EWt0YiVN+5utzcMjoY6rB/HP35ZHUpPJutEQse6/
 EdhaYBVDLi5X8FLWGVQ5MPljimL29+qYj2tSDadd5ZI1KTM+eFzBq9LLM7reFjsZqsHG9687X
 TSB5Ku6NnHPrx87bFHhaIjBOXZhRZcw02BYnspSI+8shIbJ1DXNqnV9+24gO/94hQQ9zMz1RY
 d8n7zdr3s285SDE/EzKLcwOp+1A7fhlbgMZ6+vg4ShLUb7mhRlFiSA7DlTFKN62XpvmuMwwHE
 9PM+nZtoVZnkJbqidg/sZ6PqjjmOJuWOl/XOT4x/Vm8kHHjwXNOY0BY6tLkVlriKGvhvlpyaW
 A56515AYTmKdNIxaS
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/vCPRjWtsUq/JNe6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 05:16:35PM +0000, Marc Zyngier wrote:
> On Sat, 20 Mar 2021 18:16:04 +0000,
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
> >=20
> > The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
> > controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
> > SoCs.
> >=20
> > The list of registers if based on the AMI vendor kernel and the
> > Nuvoton W90N745 datasheet.
> >=20
> > Although the hardware supports other interrupt modes, the driver only
> > supports high-level interrupts at the moment, because other modes could
> > not be tested so far.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
[...]
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright 2021 Jonathan Neusch=C3=A4fer
> > +
> > +#include <linux/console.h>
>=20
> That's unexpected. Why do you need this?

I forgot about linux/printk.h.

> > +#define AIC_SCR_SRCTYPE_LOW_LEVEL	(0 << 6)
> > +#define AIC_SCR_SRCTYPE_HIGH_LEVEL	(1 << 6)
> > +#define AIC_SCR_SRCTYPE_NEG_EDGE	(2 << 6)
> > +#define AIC_SCR_SRCTYPE_POS_EDGE	(3 << 6)
> > +#define AIC_SCR_PRIORITY(x)		(x)
>=20
> A mask would be welcomed for this field.

Ok, I'll add

+#define AIC_SCR_PRIORITY_MASK           0x7

Should I apply it in AIC_SCR_PRIORITY(x), too?

> > +
> > +#define IRQS		32
>=20
> Please use something a bit less generic.

Ok, I'll rename it to AIC_NUM_IRQS.

> > +static void wpcm450_aic_init_hw(void)
> > +{
> > +	int i;
> > +
> > +	/* Disable (mask) all interrupts */
> > +	writel(0xffffffff, aic->regs + AIC_MDCR);
>=20
> Consider using relaxed accessors throughout this driver.

I'll read up on how to use them correctly.

> > +static void __exception_irq_entry wpcm450_aic_handle_irq(struct pt_reg=
s *regs)
> > +{
> > +	int hwirq;
> > +
> > +	/* Determine the interrupt source */
> > +	/* Read IPER to signal that nIRQ can be de-asserted */
> > +	hwirq =3D readl(aic->regs + AIC_IPER) / 4;
> > +
> > +	handle_domain_irq(aic->domain, hwirq, regs);
> > +}
> > +
> > +static void wpcm450_aic_ack(struct irq_data *d)
> > +{
> > +	/* Signal end-of-service */
> > +	writel(0, aic->regs + AIC_EOSCR);
>=20
> Is that an Ack or an EOI? My gut feeling is that the above read is the
> Ack, and that this write should actually be an EOI callback.

I agree that EOSCR (End of Service Command Register) matches the
description of EOI.

The reading IPER serves a dual purpose, as indicated above. I could
move the IPER read to a separate irq_ack function and use ISNR
(Interrupt source number register) in the IRQ handler instead. This
should work (haven't tested it yet), but I'm not sure it's strictly
better.

> > +static void wpcm450_aic_mask(struct irq_data *d)
> > +{
> > +	unsigned int mask =3D 1U << d->hwirq;
>=20
> Consider using BIT().

Will do.

> > +static int wpcm450_aic_set_type(struct irq_data *d, unsigned int flow_=
type)
> > +{
> > +	/*
> > +	 * The hardware supports high/low level, as well as rising/falling ed=
ge
> > +	 * modes, and the DT binding accommodates for that, but as long as
> > +	 * other modes than high level mode are not used and can't be tested,
> > +	 * they are rejected in this driver.
> > +	 */
> > +	if ((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_LEVEL_HIGH) {
> > +		pr_err("IRQ mode %#x is not supported\n", flow_type);
>=20
> The core kernel shouts loudly enough, no need for extra messages.

Ok.

> Otherwise, looks good.
>=20
> 	M.


Thanks for your review!
Jonathan Neusch=C3=A4fer

--/vCPRjWtsUq/JNe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBeLU8ACgkQCDBEmo7z
X9tr6RAAwD+HGPSKLsoLr4AXFAWH1Zpa5j10/AATwVFzpwyJiClqMKu1rEPtHlm2
2A6PD/y5X9Jl0IlmzKx6aWigahjx6qbkh3JZgnJR65kVKVlJsuyr+PvsC9ZOF0WU
Tkc8ABVHaa3ZogBBQdIqcwOokDMv8C1vAxf1Fe7+p7XnzUz04HiDb9/sJmFO+rI5
rItvh3KsrlBLrhdH++mlMVaNFA1FcdvMdZrajdDDVe02znZYUpW3pQ20A2FFgU6M
NqDRc6x10sX62g8cZyt9HunlFOyykR6v9miVJG+t0SudErpq0twwa8VrseZPUGIU
hmRb1tsi3Qj1MqTn0F6C4LovCxcqCG8Ew4O5BpF8A07ilRffMqq2Ux4tqzaylNyu
kM/T+2+FTtj4c/ofVBU5q2js+Hywg8BkwlA0FmegMmfQdbwc91zLt28wRZ/Bq7A2
lEfFdscPGKg34UP7ZImVa2/OZewchNkdLH4fovnqJj64SV+qb96Se+nmqIz1P8cw
xVyOuSrKzmI3hosvPOOHbo94u41ltjgEiEBKIn6GXnS/7EYOd0kDjHJYPDavVMbN
ZTBczNSLmLU7C2Kz2Tk/b3xpEnWPVLSaIrFV3X7INb495agu8r2oOzH60+4psVce
sZdcnytva7c0Rwmsqhe3rarut05I6HNeOl06yeZv0loxtqz6hyw=
=A8O7
-----END PGP SIGNATURE-----

--/vCPRjWtsUq/JNe6--
