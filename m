Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA94B7408
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 18:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jynrv2f91z3cBl
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 04:19:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FEvtmI8o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FEvtmI8o; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JynrW70CHz30Ld
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 04:19:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644945545;
 bh=FTRaQZEhcQHE3D6iMKxlWyuUw3TDc4VB3gHJh1I0RhM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FEvtmI8ovHWgdCHsVqY8UkXxveuRoUoaN2mnIeYRYWyCh5pH9ZDEGQ33Ea7LguYfI
 2eM0MX57verzTfxdJLrkrqQ4iSSGbhlbwiY8Xgi/1vORd8ko9cooMDgvQIvh2M6WYW
 +Lq1Vp6vnWzzDnidbYX6Li6TIS062BREM+z9cCGU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1nhZyt2TT0-00TH5q; Tue, 15
 Feb 2022 18:19:05 +0100
Date: Tue, 15 Feb 2022 18:19:04 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <Ygvf3COuzZ9bTXuy@latitude>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
 <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
 <YgdyjUbb4lnrVHmJ@latitude>
 <CACPK8Xe-t8Qso_AX+q08OxrgmUPbEayhnHXH5xiLr7M6rDxjuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UHIAxUhFauf14s9F"
Content-Disposition: inline
In-Reply-To: <CACPK8Xe-t8Qso_AX+q08OxrgmUPbEayhnHXH5xiLr7M6rDxjuw@mail.gmail.com>
X-Provags-ID: V03:K1:c1cqtZLz7Mg2BLdDxmXoFqJl53D7wRN7wbycXFZiU0+GIgC08IU
 8CEMhMS0O8QjQ4TO8yCfgeM1QAyNJA4faQGEzXHAmCFeDquzpIwRsvHcD5F/LIHr7ofT4NF
 iH3LABJcrT6QqURzbtpYi21Vqd9GEZc8lcJCcBh8M5Gnl8Mto4FMRRAdYiyrtRKcwVRDOZf
 E4xpDfashLDaUm+T0HBbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xB1RnmaMPC0=:9dGoAvV1W0XTvwGMz27dkn
 JRjiKQGBbeJRe1KdQxY3bGtt4Z0aXYBZGp3dt27nA5swetlfQg73eJYCKL1M+yo9kQNjlhIpl
 TcN1irGX8l043UlSzT5H5VjdmtPUdeVyafrH3+h8fJsqp2kcUcORrkH9ho3Uo2wcsy3qDX8qJ
 XA+w0j3e3ClpPdlzNG1G5h3F5W1FSeMTCxvSa3rHkTMwTLDYk48spCcB/7IadVVfzNZuyp2z+
 7QzxA+2V4Dk9dzbSWFbGWIiCZBTz26WUpZ2ZRU87LgA6H39ExMw++vPO4ZVTkzNsplmduZFhj
 ut+cRgYom/UeQjIRUQO2mqvQA8upoxa2+NLh4D6ekp81P+NeXhmpQReIfNRIVOJL/duqWjYnX
 Gy9iNXqBvafWwh0N1vokOdpwQuqkI5TcFBH0/cRJx0NBGGnLTE2X06XOVacaIHgXQ9p2euIN0
 9Vd1r1TMQI/CcyAIwuA/uFdN8GhmG75JkUPZk0Qz4jQFuv5wy3yzzKzGK3Lb24raXqmd3vLNy
 /p63aI7RFIFer+uWreAgBZhIljaZWDdhQ0+SMW3SztHhZJTG+FtjytMflrnXjVPDTVjxfXMyK
 LvnXdR4yJKDxTJa6w98OMwz8uko63xTOvI6li2DT2pPq0S1qWzqmxx7p7vVwA3NYrS9pY5YSF
 9dR+UE/nYmVeAIYXbEmH4GmAspTusRQW9nz/lBvfRPouqgJ3Dhu+MHvEEsdvhaUzxQUgO+v1V
 KuZLfK9hLawh1EFjmzX+E1SHw88SyuxqrHoSMR1qk6QcwaT4zIs4kfpzxzufCZmOYGH3FR1AY
 M0801yvqfVLNVfW2jsh8u5e/QYJ/YPfnBleaiepBGOCkjvEeS7D6p+Iy/TM/4ZWGyNARSFD9F
 Z0b9NHlGYEuUOEzRJ0KlF0V0MWjiQ3WDZhBahteKFiK2d9CX2htaU7PF6qD47GNcE0+a0O5lc
 I5iDuTBbOo4L1x5SgaU7AVOy0AGqiMrCx5eObd5NXnD2zrlLFIRmfy+8Dot6u0xSUhhbPLHXH
 wiQTDdU0vQjaWzN9+F4zxgKoXzxsJM9OagakYvArSYcy9Nxli8E0p9R4h25UXK4uEeMOWGL4c
 uBdx7nTHAAYu70=
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UHIAxUhFauf14s9F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 05:56:17AM +0000, Joel Stanley wrote:
> On Mon, 14 Feb 2022 at 12:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
=2Enet> wrote:
> >
> > On Wed, Feb 02, 2022 at 02:10:44PM +0200, Andy Shevchenko wrote:
> > > On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
> > > <j.neuschaefer@gmx.net> wrote:
> > > > On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > > > > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschae=
fer@gmx.net> wrote:
> > >
> > > ...
> > >
> > > > > I assume you're sending a v6 to fix some of the warnings?
> > > >
> > > > No, the warnings are fairly independent of this patchset, it's just=
 that
> > > > the adjacent pinctrl-npcm7xx driver started to be built by the bot,=
 due
> > > > to my Kconfig change. I'll fix them in a separate patchset.
> > >
> > > I guess you need to fix that first.
> > >
> > > Because now and then all CIs will complain to your patch and confuse =
people.
> >
> > FWIW, Linus has applied the npcm7xx fixes to for-next in the pinctrl tr=
ee,
> > which means that they are not blocking this patchset anymore, AFAICS.
>=20
> I've applied the device tree changes, and I will send a pull request
> for v5.18 with those.

Thanks!


> I assume you want Linus to merge the pinctrl bindings and driver
> through his tree.

Yes, that sounds alright.


Jonathan

--UHIAxUhFauf14s9F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIL4IgACgkQCDBEmo7z
X9tgPg/9GbVJ8o9ImxZI9vUt8PXnJrwRertT1KoqTqsDH0QH7OV/DHkhwAcy/yqr
wTOVb4U1JTAyfLDUkBBmWOBsM/qKxxzS98YHYbeQSKgUfHNgw1eHdbdizk2nkJoZ
YlKICyy7iwVLDo9DEk3//vlV5FxEwzSpcWi0ezc1uTHK9UWRB0Y6UCrEIbfpWEy1
twd2mvUi5T93F09L50diwPevgLFtDyoF+CfyyKwX1bwLrf5W0V9hDS1kGvLsZHc6
fIy5e/ojgOBkU5nUU1lhagDtL0dw1GCLpRy7RlA3c2iJsQMtDx/8K/SDOxluKPJ0
SJD/a7s/yX1ylEG9//H17URcD8aRfbegodOa2W2+U+kBUpIta2NzA5cdaEwbsT4R
iTKasMt4FMeegas6Hn/+BT81Uv/2GnE1wZ90TWXBFZR+0MYLaL/LGU0vVOpkLVb0
EMDppg9IS0evPiKe5yeaYRV0jF4LM5/TTRiWJ8sdvRlnmgISUl2n6X0xXwgLMiIi
Wcv0NpUtOQd+BBQT8UFGf7cb1pSDKj/r8qWMBR0pUFSNghwcIttSoO09USMELKLm
ZW5eKL3V5UBiowKK+a2A6cmrzXAILwk72onoHIulxXnAQIba9QwlLHofOzxNwHxG
4mPpbjk8UMgbhqphCfIYFimIAIIDc9sAjsMc1zG4pAP/Z7vldOQ=
=WIma
-----END PGP SIGNATURE-----

--UHIAxUhFauf14s9F--
