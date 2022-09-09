Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F535B413F
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 23:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPT7m72zPz3bsy
	for <lists+openbmc@lfdr.de>; Sat, 10 Sep 2022 07:06:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=K5PWynNu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=K5PWynNu;
	dkim-atps=neutral
X-Greylist: delayed 323 seconds by postgrey-1.36 at boromir; Sat, 10 Sep 2022 07:06:19 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPT7H2w38z2xJ2
	for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2022 07:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1662757574;
	bh=JLntwPoctWAoCyoxRVHbtaxMdOR9afywA5kpPqKGx+Q=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5PWynNu+N1d5ILTFWqPekIMYAtT4vNxWvMt3UwLW89vL4K8wbwjOut1FA2EYoEoB
	 lCAF6sThd/xkVY0Xo0+DCwgZFCR8ZSUYFLezJ0UKwMfjmLqik4dKFstrZw2VvDSSop
	 dPHavz7qicPuYPdmYzvjt3405MrjJtcx7DbKJgyQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([87.78.200.132]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1pDTqL1i4C-00lR5z; Fri, 09
 Sep 2022 23:00:21 +0200
Date: Fri, 9 Sep 2022 23:00:19 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get()
 return value check
Message-ID: <YxupY5MGWddiY2mq@probook>
References: <20220905191408.73794-1-andriy.shevchenko@linux.intel.com>
 <YxkHaBKtiO9zVuKM@probook>
 <Yxm9fB/5IJS3MXGu@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4S0blP9/51qK21U"
Content-Disposition: inline
In-Reply-To: <Yxm9fB/5IJS3MXGu@smile.fi.intel.com>
X-Provags-ID: V03:K1:r0wpIjMElmEi0hqV8F0RnUamSKCv8L6GjZxaIVBmve/tIxeyEb6
 f3uFy7LBihUBoL1b59/bEm5igYVc+pPV3r746gI4FXNZQPBfYiGC/1JVM2t0DGqiyHPlcvF
 tlqWEDCuEqV+AuOWwBUClSr4xvChsWpcjWWcCGBjS2F8XNaN/Uh68Es1eQBw2fNsJ4ouUpx
 2iOfzmpJXFdcsop/93O8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SjX9vNNbYWI=:XgOI8cvfkQqLqrHHYBy8/T
 O17h+tGY6nyGGvNcUmciaoIjfV3KLr1rSznQv4zG6cmwbJ8iJguRGIpattiVCsIcW7Q/YJzPq
 6DOtXT3NUS5B1ov5ve8g7uKQ914Dy8QUheLv3dUaWactUpf7aTVuHvIuwIWPNQFVNZtf/Qyc/
 +UD0wdsYVmrvED9UfnxsOtosvaD7NgRUbyjmEy3G0hcVGOLmIsT27PhZ1QDt4fqHU39JNmvUs
 AXssZcfJsaJbEe/90H0L9i8jPs4e+/YYFirZTg4s8G0SlJzt+1nfhRfgTiocgQmYC9M+egey9
 +Mz/+b0rbR2w/fqMIIEMJRgPwQ3COIt9pAjxXZ1xE3b8505cULkIEYd5oJoKewLZO+eZ7tgN+
 FGB31TtGjy4JzIcSUU8sl3BmxGPMblwKIM8sXkX4QGlZeUxPWevoQDBI+2PBIQQWOwz/mOcpQ
 Pg6WhxPqTAeaInYPJbJU7eVVo/MQ8ra7KtaQCtGP6HiKwl3zjYfCzKGPkaDOzgBsHV2Wb0Znp
 W9MgSG2JY9JfdA2idb9Ul7Y4e1FVCYRUq6W313TFYsDAPa8Sb46CIn8Ffghc8Sd0AdNz6bAK4
 nka8rVTcxg+EjAHINDJCYFze7sc46r11RJEXc9Z06ycqASISp0hX5MycHYjHodPfw+wDszopw
 E8kXKEwqWk6hbXYCk4UiovdIduDIUYCjYG94WxVlQTxmmRVteT0jycvukDvJ3b2A9pz8ducF0
 m9kFfxqGObCUk1PuEZ1d+MVus4fACnR0B4THsGibqcdyWFvAagZUt3yK/6V1BZYK5xr4L+P6h
 XNoQQYD+C5mNKZyai60bDI/H3S1s2lTpKMSdjtrnvXvgIzOdd29BC36JkvTKHSvbkYmHRej82
 RuStbnQCl/2Yjhj2vgldDny/+y2W/8+G1F48tmpMIhpbFHpz1QhQccDmQuUvvDWlskTOperzy
 yqxcI9LqMZc0yfsVcOGqXu+m3TzKd5YVb5vB5wiBV1qiqD8Dmkw/TyqoT9EVU0CupfZruQ3Qe
 isfRiFLGmJnl0uURHqGWIiFDs4x9DnXVqh0HGCAnl7t0jsA7QW7G36Q+KOcOU8D7SwnAYKpZA
 Bfl/9YIvosw+53A6OhU1ZkV0bywUGJkNX1zL9EgraRBgGjNJnsJO5dF3dIFQJQkGo64opO67+
 6iVO76z+5aa680PuW804l0CSIl
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--T4S0blP9/51qK21U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,


On Thu, Sep 08, 2022 at 01:01:32PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 07, 2022 at 11:04:40PM +0200, Jonathan Neusch=C3=A4fer wrote:
> > On Mon, Sep 05, 2022 at 10:14:08PM +0300, Andy Shevchenko wrote:
> > > fwnode_irq_get() may return all possible signed values, such as Linux
> > > error code. Fix the code to handle this properly.
> >=20
> > It would be good to note explicitly here what a return value of zero
> > means, i.e., as the documentation of of_irq_get says, "IRQ mapping
> > failure", and why it should result in skipping this IRQ.
>=20
> Not that I'm fun of duplicating documentation in the commit message,
> but it won't take much in this case.

My problem with the description is that handling "all possible signed
values" is fairly meaningless: The code arguably did that already, it
did *something* for every possible value. The significant change of
your patch is that the value zero is handled differently.

IOW, what I miss is something along the lines of: "fwnode_irq_get can
return zero to indicate some errors. Handle this case like other errors."

> ...
>=20
> > >  		for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
> > > -			int irq =3D fwnode_irq_get(child, i);
> > > +			int irq;
> > > =20
> > > +			irq =3D fwnode_irq_get(child, i);
>=20
> > (Unneccesary churn, but I'll allow it)
>=20
> The point here is to see that we actually check something that we just got
> from somewhere else. It's slightly better for reading and maintaining the
> code as I explained in [1].
>=20
> And there is a difference to the cases like
>=20
> static int foo(struct platform_device *pdev, ...)
> {
> 	struct device *dev =3D &pdev->dev;
> 	...
> }
>=20
> when we know ahead that if pdev is NULL, something is _so_ wrong that
> it's not even our issue.
>=20
> [1]: https://lore.kernel.org/lkml/CAHp75Vda5KX5pVrNeueQEODoEy405eTb9SYJtt=
s-Lm9jMNocHQ@mail.gmail.com/

Ok, fair enough.


>=20
> > >  			if (irq < 0)
> > >  				break;
> > > +			if (!irq)
> > > +				continue;
> >=20
> > Since irq =3D=3D 0 seems to be an error condition, the following seems =
fine
> > to me, and simpler:
> >=20
> > -			if (irq < 0)
> > +			if (irq <=3D 0)
> >  				break;
>=20
> Not sure it's the same by two reasons:
>  1) break !=3D continue;

Right, hence why I asked for reasoning why zero should be handled
the way you propose to handle it.

>  2) we might need to convert 0 to error if we ever go to report this

Good point.

>=20
> So, to me mapping error shouldn't be fatal to continue, but I would
> like to hear your interpretation since you know this case much better
> than me.

However: In wpcm450_gpio_register, there is currently no reporting for
mapping errors in this loop.

I'm fine with either break or continue.


Thanks,
Jonathan

--T4S0blP9/51qK21U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmMbqUMACgkQCDBEmo7z
X9vPTg//W68gSOfDJBQZ2/UeuyNZ5V9lnHuvyi6tBr+qM77qU9qZoqss1lcSbVq9
vhtvGEPdFIvPKb61wU0qYM70Kr3TXHpsFHK9lUo25WZybUq32OJMFZYY0go0IQ2X
FZ8VpUlb7lMOy0jwPu6ARQhyuVN1I5Cr6EnzWs8bhxAIJANqAMeqD85hsXmel3O8
4IM+oa+26i5otyGZLeLQPAJO1ABWAExemevWsmfsghTcbSt1fTc34dbnyCCXrAE7
d09YYaIu9SVHt584aIDMMdGwpXDxF1a4ObaRXvv6atMC07Ezs4zU12hATe+GVGx7
0MCD+bh4RxjSCrAAKRDItN1nJqMFhZTTB0ugmneDAKzORoiV3iDCxCsABxsH1ds4
u+yI+JAulbWdHsUOXfuns/qQqaTDPbLYdXE3asunOIRNlvTw+DwzuyJ5sIJfBclJ
6FuIyv+DjjcEt9YRlKtZzkgMxGw0Z13ZvlVlZb9RS9A176xFO04J1m22Vy2Kj+TF
5UouBkVh0OU9zkLHa+KRmcT88uvVgzK6YqvATSFBvcYGSV2r1Y3v2HlRWCrNxygy
vqsgWN/d9dqeVLyj5vVUz3ksveKlFEJ8mhPAwHGxSiQUyOLQ/s6YS88GiMioBlFG
hRoetTp8LXl9SbQyqmuuVzJsaFocIQ271MtXjOIWJou5+k8YN+o=
=HFeK
-----END PGP SIGNATURE-----

--T4S0blP9/51qK21U--
