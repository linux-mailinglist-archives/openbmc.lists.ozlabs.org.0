Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BC6EE217
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 14:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5MDf0Bd3z3cd6
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 22:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=en8cmqwn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZsC5CGFe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=en8cmqwn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZsC5CGFe;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5MD52rRkz2xKS
	for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2023 22:45:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6F8965C0198;
	Tue, 25 Apr 2023 08:45:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Apr 2023 08:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682426723; x=1682513123; bh=9i
	lD7rtXS/Z3T8ECZjx/vthNJE6BarC3gPm4khDo3Ms=; b=en8cmqwnVkjzWHhHLp
	wY64oQC57QBFKkvm0p66/aK6ntNr588975PETfnwxW2gsdvAMzENev4gkwrR5hqJ
	xDa//7ltgQRcXkmLeREiMUdnVxs+v4HMzkz0SvgUO8t7Bl54et5qbxVX3s+9eWn7
	iprGKxuWCtEC2+zz8wZ1/WP8jKWmj6Ik4S39fsR7OBlzreVczHXpG7/B1IYYNcRk
	2/xrgdKv2G458YTQ5ypOMQi5bEh98O0yzieqNOFkjqISML2g2wg33ssh+hp2wJCg
	SEJ3N2+3dUND0G0+Wgkq6itIZFjxdRyUPkp2w3tOe233GWdr6IkKNSXklMnF7PbY
	1fUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682426723; x=1682513123; bh=9ilD7rtXS/Z3T
	8ECZjx/vthNJE6BarC3gPm4khDo3Ms=; b=ZsC5CGFesCtyxyF+rovkG2G0HdvKY
	4oTRAXS76Rnvp4OQY3p9WrbpN2wbTaovs8zNhysh6vY1yJ/x1WseC5h48vbfQGkO
	GBJCjVB9FsLgqx9OlMNlb8UK0pmMMuIy+3VfKGTkKPs9g/M86YqAjNSev0ggkYR3
	q1fUcdzT8yJVyiA557fcxaVWxgqV3vePuxeSrKkviyjIYqORrOW/VBkyb9FGXRo5
	GACfLDfGK+stEQQdkHO/LvaPeM1f5NUDTncPiC8Z/lpbLNS7q6UUJ9Kh8YhbO6CG
	KaSznYDS9AbZlAFPEavjNAXI1p714JH4Z80Pg6OJTbCIH5AxPpMh7yWYw==
X-ME-Sender: <xms:Y8tHZAYNQPC5alcfU3QxdJl1yO2QxQFFWZIGOoPIwUGlnLp6z3cwDQ>
    <xme:Y8tHZLYLd1RjUNdCuZxa4dxSDVnqmhPWClFM_fSUZIbpAnKqvPBKl2r9Msietefpb
    6-wm8ezUKlJrNpuaaU>
X-ME-Received: <xmr:Y8tHZK_YXYJ5hFjYxMInm7sx1-n0utnhT2l4Pa4PYncea3OAdbhIxIESwtN4sZUKH5biJjNxTUl0vN8rONwScdxuJQW4hcxCcLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Y8tHZKro2Zpwj28lxK_TkdYvMCcnZ3VzO4DRc5IQzlcIYfp39_t2jg>
    <xmx:Y8tHZLqQzNpJdv_Kbl1xfedFrzN-EIA1N6OwB4fyTUSkNETkfPZUmQ>
    <xmx:Y8tHZIRXfysLe0qYxSfVqj-0BhXcbcfwbOuPXzPVQ7a9Atppsa40Fw>
    <xmx:Y8tHZKS8RULRz7GBAczpONwbW1MzWUl08hnU2oi8tT5ftXISG_3woA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 08:45:22 -0400 (EDT)
Date: Tue, 25 Apr 2023 07:45:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Francine Sauvage <francine.sauvage@atos.net>
Subject: Re: return error on property changes
Message-ID: <ZEfLYnpMUO_owCVx@heinlein.vulture-banana.ts.net>
References: <PAXPR02MB7680989DB7CF5B5C47627599E4669@PAXPR02MB7680.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uHo0oRsPhLoTTUry"
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7680989DB7CF5B5C47627599E4669@PAXPR02MB7680.eurprd02.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--uHo0oRsPhLoTTUry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2023 at 08:29:03AM +0000, Francine Sauvage wrote:
> Hi,
> I cannot implement the following use case:
>=20
> From bmcweb code, I set RequestedPowerTransition.
> From requestedPowerTransition (phosphor-state-manager) code , I have a ba=
d condition and I reject the transition.
>=20
> =3D=3D> How can I throw something (error code, exception ?) back to bmcwe=
b in order to know what happened exactly ?
>=20
> I was not able to add a "exceptions:" part in yaml around a property to c=
reate and throw a specific exception while getting / setting a property, li=
ke I did with methods.
>=20
> I need to declare (and return) an exception while a property is changing,=
 especially when the transition is not accepted.
>=20
> I have an old version of openbmc, it may be solved in the new version, bu=
t please tell me how to help me eventually patching the needed parts,
>=20

I think you used the wrong YAML keyword.

```
$ git grep "exceptions:" | wc -l      =20
0
$ git grep "errors:" | wc -l      =20
161
```

--=20
Patrick Williams

--uHo0oRsPhLoTTUry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRHy2IACgkQqwNHzC0A
wRkrcA/9G9XOTzvKOn6p8IlRgtwmwZGbHEf6ZFeKCOlgej9V59zG9NhZMiUG9dSh
ZqSPrZFh8bKs4LEWRugNfC5lOzcdP+iVliGR2wkssxb1oVQfcoxPs0/yH7QcUkhC
ymjRtuM0cFBv7MnqG84Rn3Vf2DdQ3TwlODOBoI1UA+2u5ZxB6FzvELfrjCVGdMqt
YQbbn4Sg+plFaR0gPVxkarqL3LHo/rYQBcyBDHuRhRFPRHkalQ8hethvFqMiMkN+
YicfrqkA8ShrNRQcAGIVzzvlrl96Xr6lZWXnhnhtriKaUHHZNkm8hnFw8MxF6VXf
dTbf6aYdz5d2NBb1gsed/vHRSFioZajJpyxSiJ9sPwbgubu0DF/KC9JqibEl4K6v
ySMiFpaBTs/5XAkvCYOJ+mwA/ITE7Bk7j+CBXHuK3GHMIP8qrbaZc/3r1cLBFkqT
mSnzXm/u7QXwR2v7jE5QvrRoF5ay/Tvmglodc7byLJ09qtWIQukXPNoFKpDs4TRQ
D62UAaE0gYt95KJntNCyZyA3kRO5C3PTF9Ivh0PSgrux+ivE9cmiG0Et30WQE/O0
lJ69S0hOrxY8lXZ0hvUfVkuTQcPm3O5qlHZTph+0bNTHAhlA/0oGt+yLrsWgmItz
xSSZwxSJTyCs1K2Q8gPsSABEWeU24Vt5qtiiDNVbX1ZbEiPxR4Y=
=eJ3d
-----END PGP SIGNATURE-----

--uHo0oRsPhLoTTUry--
