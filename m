Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 659574B33E1
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 09:41:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwkVG02HWz3cC5
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 19:41:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=ECsMFeCK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ECsMFeCK; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwkTr4yCwz3bTT
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 19:41:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644655247;
 bh=6yeoDgDJPy6Mv0rvAeCcJ+cV6rpBoVqlTD6BL6nGPBA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ECsMFeCK10kEQy3vbM9SlWqvEBXVpIb+kEL310FW9HTi3XaktD/N3qlGeNb11HQn1
 dLcf++lYoAUcthwIAk0zz+LAN6GgpMU+xYbomhYFNvmTsdqaD+ilXbFHoyBv5Xzmm8
 jXucMoJq9Sb5zEpy3Otb7VAJ3pWZix6JwAZat8hk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1na3rS2BsH-00Hyov; Sat, 12
 Feb 2022 09:40:47 +0100
Date: Sat, 12 Feb 2022 09:40:45 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <YgdyjUbb4lnrVHmJ@latitude>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
 <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zAZgCYGBplb8VEfC"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
X-Provags-ID: V03:K1:hJPvO5vHcOttZM1wfVcuMJQGsgrEjDcKwOkTeT64bNtzFABDEGK
 WIamoNhFYPIJHSOMwXV0YQfcg3M4errYW7wm5rOzvzRkWqMDpmhLL04tZCTAsKolznmxDEH
 phmVnU7DTvxszphcydPY+LPpRINwC5jVWzlk5OGTGRtEXG7YLZAd2GCetPFrbrQw1At0n4X
 nqekm7hvvtg4RUJUdg8HQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m2XNOyAVX7w=:s0wxwPeA9HvMlq2eNhUmBQ
 YnTuICPMq5UsHNHC5Xa5U0FlgVBZIBn4D9GIa/bhgvvI1dP8Jg9zJOi64TOWmMFa3mTeW1cJR
 oANWnW5BPC87zf5727tPIKYgQpEtk30o4RVJbbf/LKXzdD/jxdHrEZTRHX56YvNjv9H0yXK7k
 RPvyYbRYCBA1isASYbQfU51gvgP4bq2q1JlUjocLr2GA3ZfrYyhGJ39VxrOniZFyrr6Ph3lPy
 0uGTB0YB9vEXollfRTCk3wtZqgGUO/YaQcS4X30SdX9N6YG8U8RQwQyJuniI0sWWP1zxUm5ZZ
 vt344G6IR9U7mmrfmrZk9ePes8Ec6cR37hvpotm94pD1YH1FS4smHA//xhBpOmdgDdBWGBHJF
 c+54oo1DKmcgFJY4BCzr4bk1W1CEJSg45jaVdC/Pgn8OGXwTesZVH/QCgWNfZQKEkgzhoxVF2
 o4UZnAxQZ7t1hsZUMMFh0UBEplloQvZNwySlX4Xe6cXc6fChoYdGMyoTfQ0+g9Yfg/pXDbnvL
 rLmvg/wg7peJ1aIKWczNnZ88QlV8xRwJ++rZM2aXkqdd62RJcupYTPoRyDuYAJ5MJ38mcc9o1
 53cQeMQD7RPXXYqhWL6hZpDGsmjWP258ovGjZNjO/25uVlsUcyBG79JkhuXsEWuxbOPjKikCd
 rjtOZPAD38MFanB4kGS7127Nhz3yulktAB+aG7ZUusXUE5kV0JMpwS6rrSj+j71JK/JKjPM6Y
 uBt+u3XfHRzkaV1zWYSCSd9dM75n6Duzj0WX/jWsW8pDFIq7z/59D0zn9GGKk5nc/nuIRfvQr
 YjEVYxAsDit4uVyRAfut/wojaqtA8XbZe5WV2KkkpxZnnYTBdxY10x4F7jbxsgjlbp71yBY8A
 8Rp2K08sB5seh24kdJnoV9Xi4sdmwdbK44Mz1l7bQGBY5p8GHU1jLN7qCkjSpBd4Ay6jqwkuc
 6T12h008PmhZtSCE/9LeVR0OdIaWvZ3ItPAztVon95bjlfwWmCCeA4KFIYfn4NpNBsBKMy3li
 TgYCLZrYfc3v+digCqTQbdQfkScxHa3dVT96D8riDMX7/eAXnwQAgnBQmp/wFJ21OxBL0tMzq
 1ksURp/xrWAjIM=
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
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zAZgCYGBplb8VEfC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 02:10:44PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@=
gmx.net> wrote:
>=20
> ...
>=20
> > > I assume you're sending a v6 to fix some of the warnings?
> >
> > No, the warnings are fairly independent of this patchset, it's just that
> > the adjacent pinctrl-npcm7xx driver started to be built by the bot, due
> > to my Kconfig change. I'll fix them in a separate patchset.
>=20
> I guess you need to fix that first.
>=20
> Because now and then all CIs will complain to your patch and confuse peop=
le.

FWIW, Linus has applied the npcm7xx fixes to for-next in the pinctrl tree,
which means that they are not blocking this patchset anymore, AFAICS.


Jonathan

--zAZgCYGBplb8VEfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIHcmkACgkQCDBEmo7z
X9uckRAAoi/mjUjwvtfOFTsTH/PH/r6DDSOiFTU+ycxhILZmK9lMk3c33cNUu1ib
9eJY87Mg8UpRJvvNST2usUdrxKV1eUi/lEI0idiu9+Q9HMFo84s0Wv37NhfwCGDR
mgTW0IbUsLvRegIP6Rl75XSAn6+GTIIYyhMA0Ohw9T37JOa1YI2ysV+dkqPkSala
WUe1CmWQ6yFSyLslMp6ZqZtg2rpTMCR0vat54Ykbfrity9fxd67OZE/561bvGKht
qpCEXrfWk1N35pQH/2VUfVBerwLWfW+Dq6ddq5qGMyTXr4hnGyQiidGQb16aPugT
ZGzq1S7TdnJ3r3k+HwMOpbARR4sn5i4LWkPkvAv2WvGScHfUwOfS4ttM0Q6H6/2T
lLt7jnYuosmvFtArXbc/PllfNWRfQeMylBzRoh8GOHCNSHhgewMZYB+SBqGrMqb7
lue4pyfWONnC85aWCYZyBbM1Bmh9E0LAs/8KxievUS/nWbDOe/Qz09m+XanUq1CF
5QzMKcaJekmiVVxDquzj/17c9V7ZZrb9dT6mTSYSoG0I77rKsPNHMkIccRVHm9ez
J10PVtMUNLYUdc5r62fn9HBo+x/aNtEHdnd/CTx3jZ2CFVPmAW2gGz9fQMwlWLyJ
LAKCGXBxxFoEO/bcZevsri26S8yvt7Lw+mIpupglsw/luJwHNUQ=
=Yhe6
-----END PGP SIGNATURE-----

--zAZgCYGBplb8VEfC--
