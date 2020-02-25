Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA516EAAE
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 17:00:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RkDC4lDCzDqQR
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 03:00:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=s4BI/v00; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CG/o6zCw; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RkCX2SgkzDqG8
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 02:59:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F9F97082;
 Tue, 25 Feb 2020 10:59:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 Feb 2020 10:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KPbAqw8a5F8tAehuKX9Os28+elo
 PzxEWw1kJrbDHeZU=; b=s4BI/v00UqoMP+8uxszNHCN/XCGj7g7lm/pQzF1Jod6
 r1COGJ18OtNcuwQEh8y9GBeoGXb2rtP/7BRFlRlh6j19U2mYaDNCIbfSKSgcTevD
 ES875zPFYOtVxX8p9KtVICEyMotAPkInD3FXdMc8IU4Q5ng5m79CUlQp3UeqRdXN
 uLvwXh0FFRO37hFsub2vofWSb4bphkiipOaBwEFlMfYQ+CucyQa9OAf2C7pYjaAO
 /a+U9jNcHp7pxH3T7v2WcWGWAUnsUfh2Ia3mR4e+RXuitomjKygews0krlzBDabA
 D11wDFpsS38qzL7YVArbOlOQqWwAPiNzjtQoZ9a1rTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KPbAqw
 8a5F8tAehuKX9Os28+eloPzxEWw1kJrbDHeZU=; b=CG/o6zCwTUcY//OL6mCknB
 poZFxlpETsNrbnslU0Rfu8CyZqMeuUb2MrPTqZkvx7IS1czYIR6L/xLy5VR9Qw6W
 jQ2bHBMx9WKF8GR2JDJRQvNKJd6I82wrY/o/Z3S6hZK7f+6jiOnIAISrX+27sQJM
 VplC9sR86N83gZuYzV1y1tgts9xhW3TSkQuQksZQDLOREo8XWor1F1wjBbdPucxe
 4QP9a7A4IqMeBhviUFgidBBQq3GUKnBCXbWo2OL2z6rXT4SDjM3/Apt77QudQ9pD
 rOsDkCFkR98AyDQtVXFBgJzVSBxqPNTSEcGZVmgiCYGLDGN2izx4rrvgkDKOm/Ag
 ==
X-ME-Sender: <xms:dERVXiQFQZ8vlHJ5ajHv2uJeBVSu9lvdgFjlYVIXQJV6lc20ExPj1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledvgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iienucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dERVXk-9LQIQ_XpAlLf6k_6SKZxnXwtMz7boGvyZGzIqTSnSGSFSTA>
 <xmx:dERVXobiZaEXOtt9vXnXg1v9-ZlN8mWEggDmUodOTxiV9LNN8ZVGGw>
 <xmx:dERVXtp0qQNMX3uXf8tquTgcrN0-rk2dUd2qz5Vm8DLi424t3wMbDQ>
 <xmx:dURVXl1LpqJEbR_aKYkHNFXFp2IuVztfG4dhZXd6AjdncPHND-tOvw>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 242683060FCB;
 Tue, 25 Feb 2020 10:59:48 -0500 (EST)
Date: Tue, 25 Feb 2020 09:59:47 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [sdbusplus] To generate client header (was: Re: To generate a
 common header for public information of interfaces)
Message-ID: <20200225155947.GL67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
 <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtnykCRL2EXekwb62aBie6YRQuSLBftZAg2AzheKA0vGug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iAzLNm1y1mIRgolD"
Content-Disposition: inline
In-Reply-To: <CAARXrtnykCRL2EXekwb62aBie6YRQuSLBftZAg2AzheKA0vGug@mail.gmail.com>
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


--iAzLNm1y1mIRgolD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 04:22:40PM +0800, Lei YU wrote:
> > Examples of poor code are not a use case.  Both of these examples are
> > trivially converted to convert<enum>ToString APIs.  We should do that
> > rather than facilitate unmaintainable code.
>=20
> My concern to use "convertXXX" APIs is that it requires the client
> code to link the server code, where logically all it needs is the enum
> string.

I'm not sure if you're referring to an API level issue or ABI level
issue.  Almost anything at an API level can be dealt with by headers (as
you're proposing to generate) and light-weight indirects.  Being worried
about linking at an ABI level seems like a premature optimization (we
only make libphosphor-dbus.so today anyhow).

> This is exactly why I propose to provide enum strings in by the client he=
ader.
> Currently, client code (poorly) uses "hard-coded" strings directly. If
> we provide the constexpr strings in the client header, the client code
> could be "refacted" to use the definitions from the client header.
> Then sdbusplus is freely to update the string format without breaking
> client code.

Why not just fix them to use enums properly?  There is zero reason for
applications to be dealing in string manipulation for these.

> > So maybe we call it "client" rather than "common"?  Common implies that
> > there are header files that are okay to import under any case and I
> > don't see that to be the case with what you're proposing we define.
> >
>=20
> Yeah, agreed.

:thumbsup:

> > Again, I don't have any issue with the interface names.  I do take issue
> > with the enumeration strings because they shouldn't ever be used outside
> > of sdbusplus (or a similar dbus binding).
> >
>=20
> For the interface names, the patch is updated at:
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29404
> Let's treat it as a start point of client code.

I'll take a look soon.

--=20
Patrick Williams

--iAzLNm1y1mIRgolD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5VRHMACgkQqwNHzC0A
wRnt3w//Rw46BVyl7nOF+tJ4zeQxOcMqcdh4ungWXJmAL18b0jD6AmCSZZttxoex
QaV5hp7GPW785ZPOcfRLvi1pzKjzkZ0lr2O86LjBuYyvXEYu+ocgxky5QZfTEK81
zA/1zs69MkTTJ0dB9np1J8RWTI5en9zVbFH4r8yKtHCH0whW5+Hal6bW/DchDCKN
WnLrSSCu/cvpkDEG3IPV7IdkU0Y8Ci5RX32O0QAs8cHhGFO/NwFz4yiicYkdSUxy
znQEaaHA2igUaKGH+j+/OScEs2XYwqSazDqdVF3vwb9NHnCjdtk0HV5WqcfaW6TF
JPZG46vgJSdFUPF5/ox9I/Zu+vc2R9v6DWRNWBuBvsAoU6LngcMkGPOn15CdniGX
Dr3On6yng17h8zGdMogKJg2L35kd6yrRv36WDm9wWcKidnzPhq15hWDuDuO0KUwA
WktMzKtBkgm8d9xY9UZ0vuPOG7q/t8omGGTKQ8/15/Vti45UrG2kScJfU9utz/UK
DIrTKd9ouOLd9oooDY66rRl/GIItp7Fo7C9ZyFCACnTQZyI9jNJrsnaMlBZDiPhH
jDHjfuvb/itC4Xub33ctbejkbAn71va7iGf7gqCMtivNzBqhqvl0zxB7If/3aT01
WbMej0XvweSGSKCsLniqLp/s5zsttzShYEi7DHdejwakNQCczGw=
=9lFd
-----END PGP SIGNATURE-----

--iAzLNm1y1mIRgolD--
