Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780F471EB3
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 00:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0wy10NSz3f1m
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 10:20:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=aNoV0nm3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=aNoV0nm3; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC0XG6lVVz3bjD
 for <openbmc@lists.ozlabs.org>; Mon, 13 Dec 2021 10:02:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639350129;
 bh=pGlgCazVp8nQl5psPTq5BoguCoJqXSVkwS4YQtUO2Qk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aNoV0nm3MR+wa1YjB+hXPLMjVwuNE578mJY6SGCHBfMHcIappqtIGqATiBJK2ayNJ
 2Evtiys5bdECP+jM+/2iiltqB4AsYOaFlix3+shbyre8SvabuwvaWbfxDTFkx5fO7z
 LdI1hklCBL4ANFRkdLscunzh0t15AHiWHGCv3qnE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLiCu-1nE4hs3a7M-00HjIl; Mon, 13
 Dec 2021 00:02:08 +0100
Date: Mon, 13 Dec 2021 00:02:07 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YbZ/byE4Sj/fxUrj@latitude>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
 <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
 <YbC6Bv2teZ5CFhFQ@latitude>
 <CAHp75VdYtLbCLi7iD0UT7MrPi9oxJLWA9ZCBo7uGbWxNCBdGyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t24WkmUQOwokeUNJ"
Content-Disposition: inline
In-Reply-To: <CAHp75VdYtLbCLi7iD0UT7MrPi9oxJLWA9ZCBo7uGbWxNCBdGyw@mail.gmail.com>
X-Provags-ID: V03:K1:yVb59m40aoo/YNSlVRYLEyk2zd8aBC3T0OVDCEh1lZ8U322m9/z
 29azbAowmCnvdVlo8413N504Fr2VNkIUEel040iCBouJNb/Nziz55dQNQT4zoju4iJrlug2
 1TwTD8leILU/N91SDCOIbLy7XjHmTpKm5lwHNLkrs9ECoWKoKSKANHwiNNQz3ziP3RLw2y7
 IJfJNhDQO8f4POfBmh6eQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4vW4Yo80IFk=:19Gq3SwuUqJiQ5Z7eD1paq
 oUIpJ3J2IfH4HzXTR2nevThZn/npmI+ZSdbqSicl39PHNZjHYCeh0yqKkKIsl0tjjFTs+OVPD
 brbwBncLbofy73Z3X6IPWLLWxd03IZZIqPH0mUmWlSPgRdJkgHaLn4me6WxgFVS5cM0ameVn2
 b+cszw91kPEbKIrH+RWtO7YyrM+2d4yX3eHOEw+l5mLFJ/t8lZAlJVNdeQV7GNqQVzYIXbHiv
 PVKHrVA5LB82oOWnq55DeZQFBt1aP9LBEyiHrrNH1ItvQp+za2VSlHViqmlBS/d9Xmkff2OfM
 ACeFuUlBuCSb7fm7qBJiLdr2RAsVbaWNbAAIgUoFbNvBfMm2o8jbnqOwWD342dZV+tBDF27Vg
 tGD4bsY+N6WTxGl7lcL2UTdEUo9v3N31k3RlcPf9k6GPNe18JZKp9pyACnx99UBVI5PIi1kLK
 845kUvSK9qVRTGxAK6W3VYISzQZDH42szBRHo8KPWw4awsMVpw5UJjtbvVho+dC6xTaaUBoqQ
 5k6RbXcaY7N5/n9RDxJ/mIii95+xBrUh+xLmvf+cMiZkzOBgYEYt6sbNfvy4Iu2O8FgHVEYgo
 CmfWdTic3envNvZiquAHsyLi/XrTq1uiKzv8vFaHjPobjE17r5o39Lm2UV9ebon12yLc4REk6
 tG7QGXaB/jYudKzeYKw28T4YwjmIKI4MFBnOId76/5F4zymqpfobiR4ZNnBHTcDPSzwTyaOq1
 BrfZPUPrYANsCHAmfvKGQ9Qq/xtGHnQY2Gdw6iw/kbWDDlgPKjjwGpFyUPOTFlyzRkd3kxKQk
 JUWzKt3XiK8jR4rTKUVlx9Q7JhFM+HXSQWPAdismKdo7EiwBT8hiq1hMYFA1Eooeoq/QdIwdB
 Ns5MsOZGZcEmFguNJamadNb3g2bk73JxvMRwIY64UZ6+jnn7AFJY0FkvMYxuEgskKRvhQzhnO
 Khq19aIiYB5uz+jy37BchSeGYr9K6k8iKiJS8ScB8+UVpSgEV3+8K/FthVlSbQcEi2URxyBxB
 3ABS3p1z/OfhlYySeIdogRC0IGCYAc+Xh1k1lenydNUjl56BBeMMKRlnfNGfCntivga9oDSz5
 3ZOwvhbohm4SSU=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--t24WkmUQOwokeUNJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 04:14:38PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 8, 2021 at 3:58 PM Jonathan Neusch=C3=A4fer <j.neuschaefer@gm=
x.net> wrote:
> > On Wed, Dec 08, 2021 at 01:24:18PM +0200, Andy Shevchenko wrote:
> > > On Tuesday, December 7, 2021, Jonathan Neusch=C3=A4fer <j.neuschaefer=
@gmx.net>
> > > wrote:
>=20
> ...
>=20
> > > > +       ours =3D ((1UL << gpio->num_irqs) - 1) << gpio->first_irq_b=
it;
> > >
> > > BIT()
> >
> > I'll use it, but in this case, I think it doesn't simplify much the
> > whole expression all that much.
>=20
> It is still better to use in my opinion.

Ok.

>=20
> > Is there perhaps a macro that
> > constructs a continuous bitmask of N bits, perhaps additionally
> > left-shifted by M bits?
>=20
> > Maybe somewhere in the bitmap_* API...
>=20
> Maybe, I dunno since I haven't clearly got this code anyway, so up to
> you to check and see what to do about it.

Right, I'll evaluate my options and come up with something.

> ...
>=20
> > > > +       struct fwnode_handle *np;
> > >
> > >  Either be fully OF, or don=E2=80=99t name =E2=80=98np' here. We usua=
lly use fwnode or
> > > =E2=80=98child=E2=80=99 in this case.
> >
> > Ah, I thought "np" (=3D node pointer) was still appropriate because I'm
> > dealing with firmware _nodes_. My intention was indeed to switch fully
> > to the fwnode API.
>=20
> Just a convention "de facto".

Ok, I'll change it.


> > > > +               ret =3D gpiochip_add_pin_range(&gpio->gc, dev_name(=
pctrl->dev),
> > > > +                                            0, bank->base, bank->l=
ength);
> > > > +               if (ret) {
> > > > +                       dev_err(pctrl->dev, "Failed to add pin rang=
e for GPIO bank %u\n", reg);
> > > > +                       return ret;
> > > > +               }
> > >
> > > Please move it to the corresponding callback.
> >
> > What's the corresponding callback?
>=20
> https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/driver.=
h#L400

Thanks.


Best regards,
Jonathan Neusch=C3=A4fer

--t24WkmUQOwokeUNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmG2f0MACgkQCDBEmo7z
X9sYXA//SjVBvUSq+Vp4V6n3Mf8tpNS+Lo6WnaDVN1MdPICwlAu8ael1mV2LXLR8
bl4LhyvW/Z4LejKiJP+ha0ex/9QH2AfmzPIzhcMPIMw7P4mKG9b62MG5Ny3Oh1x/
6IlnwwNIg1Sl3RZVMqLStf8kFHzMRAsmtmWCWLEwI8fCrdgzJC4wJsMQ0Ersswig
NIZ4+pnwIrNuE0nZ9fVZp5YMbV0revnIyuFOcQ6AJuKjstzeZkOf68apcEwafOU9
ytEO9hybxRTJ5u0UFpwzvqb1oXWmoXx9dilWithnFFPbS1PZmWT5l9sAMuCyYoy4
XpOpNvH6nyaaQDWbQ21fLNzRFZDmB8jEs2SSluFHPwWYQiKjf6c+dwtauKktw/Mb
v4idD4xqvYK9LimE28vq+N5EuJZCXi4BXQ3GLiG2GTePrHp09+yGRrNowscta5+u
dDAqt6PCuAMj1BZoaIZ4tczq6sE0p052Agarqt0Gk+IgZ6FIACnGL7OynU+GO0Ls
PihSquVF09O5V9L2SktaFXvz0vZv7ab9tbQWD/qwjBj2+XJAo2xWpHnJwNF4S8r7
wGQ1QNNO5AM+3mC8B28bCv13+bY3tfi4+PlPnPib3XZMiGOwOusgap8RargJS1x5
9+PLYnHSkO9TvVEPwMm4qDvOFG/KR7VpHsfsYAG0HLYMoH0ZNzM=
=4g/M
-----END PGP SIGNATURE-----

--t24WkmUQOwokeUNJ--
