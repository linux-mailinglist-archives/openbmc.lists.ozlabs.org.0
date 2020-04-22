Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE81B4410
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:13:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496fTX3hH8zDqWJ
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 22:13:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Vp5rYK0w; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=cikpqh7Z; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496fRr4xq8zDqSD
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 22:11:36 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 03DDF5C018E;
 Wed, 22 Apr 2020 08:11:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 22 Apr 2020 08:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Xjl4/puTwO9FngZ7lFvpamIMdv3
 X4gGrhfiWLr5BDpw=; b=Vp5rYK0wtoreFe+3DLVWpRmHULaiLiuQdCJufxah/Mq
 bbYRmpcy5zJRg7l+H4zC8Ev6ICKlfyVVYJ/l48m5+9ucpwb2jxbEjcAtAGLnip09
 OIgJpdyrm4SU8gheEqTRloaOcYN6YpfQ3Lxz7tSBJOx4cKOaaOV+Kd0cj57C6MvC
 0qNe26IV9LWHTEE8YH2o2WWYvsS4z4vsZ4VB9EVJxVDeHCBZsZKFX++IHNr38nIl
 WvVM1ASEpsIPrdqz9M0OKsTprCKhvJZDGLtIgIOufjwmtTQwIWE5NRD0tIH7VUWk
 60dBBAsBFN6Ha+HSr7IDE2LhBsGeZ7M9tnWPva2EYAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Xjl4/p
 uTwO9FngZ7lFvpamIMdv3X4gGrhfiWLr5BDpw=; b=cikpqh7Z+TG2itfZo+x45N
 gZ2sJl/eqvQqyZAqKk/U+dyY2s/yr1XA9dyow6zCDbZkt5xPP3XqwVGT6TIRCkUe
 jZvu9Ne7pcf+Wugt+QUXMmimAswfRepodMKjjm6hhP5k3Jb2rn638y0uc2xSiLK+
 OnEYEBGOcL8G//TkBx2NDVfdPaghTZHhTlMGEfBehPTADMuiaF6KZpIlbQr1pCEZ
 fiX6ampiBcglfNr6OmRcc66EJmp07phr8KEzr8fpeJphK+V72gfu+Se+Ix9QKn66
 JG/dgw/jAClejeYaR9yo25tJmmEqK2tIQmnTbYIvJxjNO7Dq5ng8j2LRRJdnZ3pA
 ==
X-ME-Sender: <xms:dTSgXq9DmSVKOhvUOze3JTxotKmaQ3KHylgiTH7Xy9NqtAgCn6ntgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeejgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:dTSgXrLS0ffuX5Rw8ZDh8TbcMp5PIP7FzSW2mU5_Bd9bXZGnXksgMQ>
 <xmx:dTSgXlfleHQJcubItwd2-C8P-x-D5ySJo4uW6jAahrQ85mzsxlg_OA>
 <xmx:dTSgXgYn8ikrBbjkVGGU0xFWTsD1a0Adv0JXonVcUAdJu4aTg_x0fw>
 <xmx:dTSgXj2enSD-WOb4gPTZvaYpPfb-65AM_EMH9jTj1grq6_1T1BnmHA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC6AF3280067;
 Wed, 22 Apr 2020 08:11:32 -0400 (EDT)
Date: Wed, 22 Apr 2020 07:11:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: dbus-sensors
Message-ID: <20200422121131.GE196148@heinlein.lan.stwcx.xyz>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline
In-Reply-To: <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 07:56:14AM -0400, Brad Bishop wrote:
> at 5:54 PM, James Feist <james.feist@linux.intel.com> wrote:
> >> 3. After creating this event log, make sure not to do it again until
> >>    main power is cycled.
> >
> > I'd rather this be until the status goes OK again.
>=20
> We have user-experience requirements that the server administrator must b=
e =20
> =E2=80=9Cnagged=E2=80=9D in this fashion when something is broken like th=
is.  Could the =20
> behavior be selectable via build switch?  Any other ideas on how to =20
> accommodate both behaviors?

This sounds like a form of error filtering.  Shouldn't that decision be
done at a much higher level in the stack than down in the entity that
reads the hardware sensor?
--=20
Patrick Williams

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6gNHEACgkQqwNHzC0A
wRnidg/+LqAzxosroIytfHtzxY0dzEf2tUYOwcHvLUMUxE94V4R69T+xohONhJh2
Fe4bclgun/+8ErPE/71h4Qla3+vF7nY5awPR6LMCXkQ7EgF6xxk9zrRq4rS9F/og
vsgX89lqH2iJ8fLL//EQ/lwhQ9JrF112a9z3feEkyNj6c9e1/R8s6TJbyx0hNI1p
Y9l6Gq7benajSBL9aZovYzv4l9gAUA9Gr50HBjDYNcpnIab98jsuE4hU8mlkNnPf
IjVnB07M3GzwhWiWccQnaoOkNgNHyMkULf0ZYtdRPIarBIyeXAIQvuDBmrjm/oFm
Yf9K1pRsX08mHWDW3cv0/bPfXJMiq6nDSfs0jb615eUuxIlpeUknpDehHbZLh9J1
YgUecnoC1Tw/ZTq08J/tyt0ZzF2FP0RPt/21H0Or0yEvw76CJwywHSsqgMBrFLiT
vSKqeOQS8JqpLnq4qf44Aq+9G9PNkn5hz/VoAVo6ZiKc0c7ck0FMF6hVDdcaZ51I
d9zNRzPzgsw+vBZ9TcgjOfZwWl2HyZRRPYtnRN+Hi1ubge18CG2dPxGdUupkOeHq
03wXqfc6HObnK0/6UWnBPMch1QKMwdZTlyUHzJ4ehB7nFDzwT3w3vg2KqZLqeNVp
ETJfeXEwclUNjSON/8/hlJl+9+/U4Yc7RsYXlyPQGf+PAFY5ZRU=
=qY9/
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--
