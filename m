Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB79228390
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 17:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB2Q75Vy9zDqjx
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 01:22:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Cvy09nCz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pHphytQZ; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB2Jc4FtbzDqZ3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 01:17:19 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C94ACA8F;
 Tue, 21 Jul 2020 11:17:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jul 2020 11:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CJZmhLjM7foHSYSBw5UZedEWBJe
 kyv88QF1reqv665s=; b=Cvy09nCzI/rwykWml4A42y0PANs28qfGIx8osgwW2yC
 dGRFX4QDEKyBse+kd27BQuu6f/4VlVkTnircOHLNxmQGg4S4/A9nAxnuGolyFj6M
 aP16gSf6icX3cB/C2l+/u0gZerKWoJQYKcckEiP7lyLmUpDoE2Xjt4A0Ljk2gKa+
 ufkwLvY4ueKrqo3vKenyme3Lx3erTrHZinp4YNfcLf7yJSdFVYd6pW8qCKdBdwxO
 RsJma7fHFJcWIXfqkFd+uBkDSjc4E9NaNdxHFlz82VFRYPVOsnJXq3J+F8BrcRuX
 IZS9BZeeV+CUKjWohxyTUNCKavbU3EUGjT2vmYN4XCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CJZmhL
 jM7foHSYSBw5UZedEWBJekyv88QF1reqv665s=; b=pHphytQZHWdEPprQdw+jOv
 Q4/viQc/qzJfg8cQZF7fO1X78zm97/Rej5TDtG/PQuX9Yu2RTiaei5bauPy6Q+WY
 +wk1xXXjAK+v8t+113lh5OIzdYjXPvdrxgyz2cTlkRstvoP2vwP95ZJbJC16vLSJ
 GG9Dlaii7L9uuOH0K/9794MSmnzelz9QERmqTvOTeI5XJIIgnPBKkc0nvmRZXGlX
 5ZgYnfWZ4I/h2TYLaXtP3IJQbfLsKlBaNvWEbY9f0H56PJoPGfVlqroKjALQpgJb
 kcOqOtqBhIqhGE/55bDjpSc+dMnyjpgPbGGdX8YZQHoU1EATrIwvk6L21DsijxAQ
 ==
X-ME-Sender: <xms:-AYXX8E7GDXDVIaPAjQRMJ3-5z8Z7Wz33LesQYkRawOSwJcBuaO-2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeigdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-AYXX1Xz4hx_m9_WJea3q3QgveJyEEJd9nTx8s5iJnPEggfeApI1pQ>
 <xmx:-AYXX2JR_DJPdVbKWsLR63EGTVlgv538zEjMMXxfhflBJcc5StREmA>
 <xmx:-AYXX-EeyK3cG47xSV_U7Ii9F-Z_hsTAy2y-DkwK3jr8cQQAYnNSWg>
 <xmx:-QYXX6j9cfMJ-ACKIhJ37z4cuV7G3UzUSDkEJ0mU6KG1ysDk3g20gA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AD613280065;
 Tue, 21 Jul 2020 11:17:12 -0400 (EDT)
Date: Tue, 21 Jul 2020 10:17:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nancy Yuen <yuenn@google.com>
Subject: Re: What do you want in a package manager?
Message-ID: <20200721151711.GK3922@heinlein>
References: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sU4rRG038CsJurvk"
Content-Disposition: inline
In-Reply-To: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--sU4rRG038CsJurvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 12:57:00AM -0700, Nancy Yuen wrote:
> I'm looking into package management for BMCs in our fleet.  I'm wondering
> who else is interested in this, does it make sense for OpenBMC.  What kind
> of features are important?  What kind of package format (rpm, deb,
> something else)?

We've similarly started playing with package management at Facebook.
One of the reasons for us doing it is that we still have Python
installed in the image and are running out of space, so we're moving
some of the debug tools into packages that can be side-loaded as needed.
We've also implemented 'ptest', which allows you to create packages
containing your unit tests and run them on a real machine.

We found that we had to switch to ipkg instead of rpm because the extra
things rpm needed were too big to fit.  I recall it was on the order of
5MB of content needed to make rpm work and ipkg was almost free. [1]

One issue you'll want to be aware of, that many of our recipes have, is
that they often are missing:

    PACKAGE_ARCH =3D "${MACHINE_ARCH}"

This causes the package to be specified as relevant for a generic ARM
system, matching the architecture revision of your underlying AST2xxx
chip, rather than your particular machine.  Any package which can be
customized for a particular machine (such as by machine-specific compile
flags, or YAML/JSON files) should have the above variable set so that a
package compiled for Witherspoon cannot be installed onto a Zaius.

If you look under your Yocto build tree under `tmp/work` you'll see
`arm1176jzs-openbmc-linux-gnueabi` and
`witherspoon-openbmc-linux-gnueabi`.  I suspect at least most of the
phosphor-* packages under the arm1176jzs subdirectory are likely candidates
for having this PACKAGE_ARCH fixed.  We might want to simply add it to
any '.bbappend' we do in a machine layer.

1. https://github.com/facebook/openbmc/commit/43430d38dfd0e5557f96940547594=
e01373f863e

--=20
Patrick Williams

--sU4rRG038CsJurvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8XBvQACgkQqwNHzC0A
wRkK9A/+KATab5A5F4g0RQOzxo+s/wuCScZlxptv7WYVa+SF+BoY8NJ0xpSPdRxB
eOb+gelzXXItAT+VtHZk6AgGgJ4i63yYSriR4as6H5YSfWzo6dQHWIQDPRUdvIKM
//fN47TjXKVi9i52/6WkXeDkeXh9+e3S0jCgoP585YA2q0UL3RRzxr2JhBk4yeFY
0SPYd88Oja2X+7QJMwWwOiSfu63LyRbIEeFD2d0reUaAyHXPiVgh3MMcEPapAb8F
Q6oYN2L4RgQoCrGvtgXtr18VnCOfEoQk3rrSE5Nm/ZD4qmMrb+/tRj5t014S8GSB
mTPcKOaNX8Zcptr5+zBMBnTjmH2TkBV4YnpDzVrn8t5GHbdAaykN7y9RvuT3fVMJ
z5qGNUlskbQQllF0ixULpG6anTWX31fIKuCJqiKMF8ArWyBgsv/JvbU6xAcpXspC
tXh9cq7zWFLTG3b3EYPYbHMdYZkL0Hrx4BI6HKtSQveHkQDMjHC/imhdjhdCoNBo
MFduk+cJCrqqmzdzMMytkYTCa0GQ6PMwfZRCP0EZP5aj1y8u9lLRmeGhCxnayN9P
C2uR3nOSxiS4Izrh5JCDzvIrPbTr359+u1Td/ApGRuW8ZnsGijLVxkUGV8/9ogaG
NJP9/4sBaDRCmr3x9i9tX/PZg7klQNlpMaOdRpSORrU9m0Jr2Tc=
=fMvs
-----END PGP SIGNATURE-----

--sU4rRG038CsJurvk--
