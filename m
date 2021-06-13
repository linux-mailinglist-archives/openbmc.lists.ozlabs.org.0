Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C713A5A20
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 21:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G33z40zDdz301q
	for <lists+openbmc@lfdr.de>; Mon, 14 Jun 2021 05:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=k3fDP0+X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=k3fDP0+X; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G33yj2MrDz2xZh
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jun 2021 05:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623611313;
 bh=i0Mw312qLzd6b/+QxKnjdD1a41SqoAdt39SqpcwjESM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=k3fDP0+XpJ0mERPxpnrG1w4s1YiAnW2OJHaGqTrZFiafF61ZUc3Mb28kCXYp1dudr
 bAHXOTS7BwLWqyCvWeHRv4+1fQnkj7sy0haeBZzA9S+kntPdbnxuBvI9PS2E6hmX2I
 QmU52zd24m9W7TQc75DsALLLg7ioO3b/PewDtWNQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwbz-1m3p4C0JBp-00BNuS; Sun, 13
 Jun 2021 21:08:33 +0200
Date: Sun, 13 Jun 2021 21:08:31 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YMZXr2py6Esl6U2H@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net>
 <CAHp75Vci1DSFu-tpgwQZfuVycqHYmhGhLDDCOH_dX8HKvqpY_A@mail.gmail.com>
 <YMVBTp4VaSilFi0H@latitude>
 <CAHp75Vd9FEGuaVbRUK67uzRoeQSXQUGAhXExHgJvkDd585kxwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DDWQ4B6GayNZj/6h"
Content-Disposition: inline
In-Reply-To: <CAHp75Vd9FEGuaVbRUK67uzRoeQSXQUGAhXExHgJvkDd585kxwA@mail.gmail.com>
X-Provags-ID: V03:K1:A8u/VWr25EDlAyw608pKKSgF/NtZTMvqE/N1Z3Urcwvncdvbduf
 6eRNbWtHYlzu/P5hI5btrI5pUpLQSbi1ZvxWYSdrSghBHsazLyWZz9ook1S6+W+mod85F8F
 eQZfTco9qvnJ8qprx0Er5AAzyUO5lc6X4SA6MDwV18TTsx0tgCdETok13P7fhv+j5dbvmkg
 EF0tp9vH6FhTiSrjI67zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Pz1L6EfyZ4=:ZL9mTNEevabQLNS05PDY6H
 YxgmMcwv7IdkwzBM25O1MRvBPq5TGlgYwM2badHy1olhwMDt7QS7hJ366/0EY/5KnF4WLyLUp
 hTzxA4SzAnnzsfiMp9MHHQLtTovhYqRNp0ikih/1jW8E/Nof4Kr5BWlb4HJomiDmCcyq3ikXk
 PFLYLjcIJsmbxZh+ItSBPVJxJGQ8oob2AGizZYUpFOmDAWvVI3MHN2Wqa1ZEtg3nSY/jBBTTr
 Ab40FLZV9Pm3c+xDRBDzc061iXiOoK0aiQslCoE5WlF0MfkJizjWCu3hU4aTMuOzpn9XO6h/x
 ImrBce34AnDbKsIB0xPcRz/850LmX1poLaJ1bkHKsIpTHoSI962n1fMmRuEXtZh7c4YmkQOyI
 uEyOwNZfjLkfgQWNHEgKUa0CKTCkLBIDVnQTI+jn45aXJQ5NgSy6y+CYmBbmrRoDluhWCtYPh
 gXKlheBe5S7VCjp7DU5vekV3Ng6/6os5Z5gDrh+Sxop9moO+GyF4VgBMpXcw2VxcsZTm/l+1H
 4PuNnmM/yEca4OvqIKNYZJbNcOaoCb63jIajMwdfPwV58tSFrLZ/rVJ6bjjrOblpQHcpOLhuI
 ZyDIQHeiY+HrDho+V4w8WOM0XsoGd11yBvMIuk3kz0Uz4pJA06wX9emQ4tqI8FATAc/1phpPD
 JvgcCsPH2HBXgSlL51bzX8el7+mEvd2/r9XCrAGzdsSRNMgCa9mVGmxyX0KCPY5Orn4hA1a26
 ZmcLTa8lswkcId7GXTojDmSeUQiTRCJpW4d44uLrboguOq0lAC9K+fCDOfXetFinIILYT35eJ
 6o0NIbBAVpGgyRtgnA7QvXz7AuYghWF7M1J+JJmK4e4QcLAlSo2sVQIfbcdGG0N0RjVSfOjXb
 Gw1XCklntsN6NLH+JyExBPi90FJeeonrKHPUkrZInoL8gA/51a5AFYQRUBzywMJKB4MzXFuzO
 wDflyye5exIuhPmXKVOKo/t+GOBoMgkL7sB99UBBqSgSmCYTkIUdgZp8GFVkbNaXw9vSmOPNb
 voEaLyi30bN3MAWiJIcXu4tKy4MvcPIbY5sFLB/tvqA56LXQZEyDkcRhNF6aPpwBZ5E420Xap
 kpzHi0/f1yNPQeXVUzXQ/qU/r5jS9Z+HnQ4n/eRgIkaaA9s81BamG+DTg==
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DDWQ4B6GayNZj/6h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 13, 2021 at 01:06:15PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 13, 2021 at 2:20 AM Jonathan Neusch=C3=A4fer <j.neuschaefer@g=
mx.net> wrote:
> > On Wed, Jun 02, 2021 at 03:50:39PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 2, 2021 at 3:05 PM Jonathan Neusch=C3=A4fer <j.neuschaefe=
r@gmx.net> wrote:
[...]
> > > > +static int wpcm450_gpio_get_direction(struct gpio_chip *chip,
> > > > +                                     unsigned int offset)
> > > > +{
> > > > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > > > +       const struct wpcm450_port *port =3D to_port(offset);
> > > > +       unsigned long flags;
> > > > +       u32 cfg0;
> > > > +       int dir;
> > > > +
> > > > +       spin_lock_irqsave(&pctrl->lock, flags);
> > > > +       if (port->cfg0) {
> > > > +               cfg0 =3D ioread32(pctrl->gpio_base + port->cfg0);
> > >
> > > > +               dir =3D !(cfg0 & port_mask(port, offset));
> > > > +       } else {
> > > > +               /* If cfg0 is unavailable, the GPIO is always an in=
put */
> > > > +               dir =3D 1;
> > > > +       }
> > >
> > > Why above is under spin lock?
> > > Same question for all other similar places in different functions, if=
 any.
> >
> > My intention was to protect the ioread32. But given that it's just a
> > single MMIO read, this might be unnecessary.
>=20
> Sometimes it's necessary and I'm not talking about it. (I put blank
> lines around the code I was commenting on)
>=20
> So, What I meant above is to get something like this
>=20
> if (port->cfg0) {
>   spin lock
>   ...
>   spin unlock
> } else {
>   ...
> }
>=20
> or equivalent ideas.

Ah, in other words: Narrowing the scope of the lock as far as possible.
I'll keep it in mind for v2.


> > > What about the GPIO library API that does some additional stuff?
> >
> > I don't know which gpiolib function would be appropriate here, sorry.
>=20
> When you leave those request and release callbacks untouched the GPIO
> library will assign default ones. You may see what they do.

Ah, I see. I'll look into it.


> ...
>=20
> > > > +       if (!of_find_property(np, "gpio-controller", NULL))
> > > > +               return -ENODEV;
> > >
> > > Dead code?
> >
> > The point here was to check if the node is marked as a GPIO controller,
> > with the boolean property "gpio-controller" (so device_property_read_bo=
ol
> > would probably be more appropriate).
> >
> > However, since the gpio-controller property is already defined as
> > required in the DT binding, I'm not sure it's worth checking here.
>=20
> Exactly my point.

Alright.


Thanks,
Jonthan Neusch=C3=A4fer

--DDWQ4B6GayNZj/6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDGV4kACgkQCDBEmo7z
X9s1ew/+MOmEBq0/62YYJrwtuBhjOqWUWoye5bwkJbFzS6rYDMgNnT/xc3UOBkeV
4zL+GbDPdPwAToGEJABiz/7NdQcm95awPJP2Dif9zvNYPMrLXe19NEc+PhG33lZB
9JL2XPefl58H3Xm7qrmx4roFA85rAuKJT9lu4UwdY382J3gJFupP2EcHFXDFpqqv
lB6zGHdlrrsNRKjPsQ1C22B7hNBgcY8vKCurkeTgrPmn37QVipCkZMyrLat99FLi
AUtdYRJcg1hwQD8RhGwyp9H0jbBDlbUWBhJr4JKd53mIElmB4K2J8krBVHccED1C
iXNeRsgdjidJfz3vXLNh1vwdF0s0+4ScmtWmNvEPz2pJPx19Sh+UJFFni/P7KetC
+fQUHyLvJnEi9EBwH2F/PnSS9jJKLAoDLD6hbaE9l5d9EhxJjHrlSU2Po6nRkUt4
LTCyXqZ4sTPwUHQP0pWzi+sceflrjMTrRSY5itLr0cBCTvaqN7R9/kWuPHoaGLWO
l5T6bsIKIXsrd3jHdbf/kyT2TGjBAi+0YAJMh156vxlm/zQbiGsGPVNDgW+1ghgV
knmavClhOvzkqCKXWgUWfIMuJn9mF1bYSgQFNBvVkz5hTExzJyUAhSKXhKAqCOaA
guOUkGM3kjpE1O2Z8mKaeXM0ZJmP6Y6m9eti9pFq0nV7CKr9a/U=
=cSu3
-----END PGP SIGNATURE-----

--DDWQ4B6GayNZj/6h--
