Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D187B1CA8
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:39:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sA45jKqq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X0tZTxt3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxChy3SSLz3cF1
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:39:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sA45jKqq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X0tZTxt3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxChF5tRYz2ytJ
	for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 22:38:37 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 74FF45C0559
	for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 08:38:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 28 Sep 2023 08:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695904713; x=1695991113; bh=7g
	ndytL+WRPcqAgk0LC9/mTBEdLX7qMCH5umebRe6cc=; b=sA45jKqqeEB8dwKn7q
	XoCU+TvVM/iHC7bOTiVrTeFKC5LoCArshCjqf+mvZXXvY738UJrnSK1xeBNAsWmh
	EA73bNQkfGThFW9sgkrix+5qyODGVxhPKypGjWTt6SFZkrRXac9MxEXdx421z0Xe
	63OrDJHuuiAVOuk1ocg+0+mbleNj/JsIL8VmYS63Tv6GfUB5VmBvkCJNa+Tf9KBZ
	XCqU2ClC3g5zOjnRhBhn54JoO+2zqdxiOpzJw9zqftQXlKA7rD/2JYDAojN1hKtm
	BQSOqrwfsv+r1Lz0tsbMYRSNS6FGyIKI+CJeIAFTfxBtM8pz4HGDVP6hq5GdqgtG
	7MyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695904713; x=1695991113; bh=7gndytL+WRPcq
	Agk0LC9/mTBEdLX7qMCH5umebRe6cc=; b=X0tZTxt3DMQOe2w3ATx3Z+lG/VnIA
	Xv6jYm5LfFiaqg9TAGvqCMXxz4T6hXFYu0PObDPdVBGhuw1rfHDBpFVuMNXhVohJ
	2uG4+FWC9kON7AK75cqlEhCy4TzXihuWgbUXltUBSj8v/i5yNTuEHZ/YXNI1ZRkt
	+1YEzGa+U4g9BzBQpyIGfRht0TR+bGEnjldXz/M+5drApcWHN3Sv5n63SQZ7qRyk
	P4TZRgfs7cor6ielJcQR2O99+VONepEs2NBdfZd68WPV1d1DI60a2TwhfuNhAh4S
	Fn49hVsLauF3CS9cdMWfn9AzJhgZKEpCCCKY7P78Yh9BwVUusB+cl88Kw==
X-ME-Sender: <xms:yXMVZVmXsVq8liPPyPmQBVWrjL1nfYWEqHxI58lnBxYMVUjOGMmv0A>
    <xme:yXMVZQ2DmSf-a3ybdGbEpnvJzhNABRF2d950AjHGdZcP8o_rGtIhe1H0h91qIYiv2
    GLp1NuiW-Wv5Mw7R_Y>
X-ME-Received: <xmr:yXMVZbrSdtXXiPzxsTs0m1B3yC-PO_k2WdaskMsmczdxzSX7nhzKvDtsODQN3iLZ57u6M8_SXb66Ymu25cEKLFE56QGk6-OMi3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrtddtgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculddvfedmnecujfgu
    rhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkuc
    ghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrght
    thgvrhhnpedttdehjeeiheevudffgedtgfduiefhieehhffgvdejvedvhfeugfeufeffvd
    evvdenucffohhmrghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yXMVZVlBRnnH83P6Y7hS23o_mD6h_2KCcI4czwb10XSQvOKId42Q9g>
    <xmx:yXMVZT2N72k5fAxbW4VPRn-hMDfxB6DIp1znIY5Y93JMXaR7GScpJw>
    <xmx:yXMVZUuNBu86dYdlDVuPgUHs-TX_myekj-DSs2YyXgLmBU6Ei5-xJw>
    <xmx:yXMVZYgq1ObldLKBbbrrVr9Pc5-q5Ze3SyeidMTDIONvmE9uFCTJ9Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 08:38:32 -0400 (EDT)
Date: Thu, 28 Sep 2023 07:38:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Developers Conference - Oct 13th, 2023
Message-ID: <ZRVzxzqbuIUGp7Yp@heinlein.vulture-banana.ts.net>
References: <ZO-eDB4m3fHMMt_b@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KrA++CvuAKz+gqcb"
Content-Disposition: inline
In-Reply-To: <ZO-eDB4m3fHMMt_b@heinlein.vulture-banana.ts.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KrA++CvuAKz+gqcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 02:52:44PM -0500, Patrick Williams wrote:
> Hello Developers,
>=20
> I'm pleased to announce that we will be holding an OpenBMC Developers
> conference this year in conjunction with OSFC and hosted by HPE.  The
> event will take place on Oct 13th, 2023 from 9am to 4pm in San Jose, CA.
>=20
> This event will be free and attendance at OSFC is not required (but
> encouraged since there are a number of OpenBMC-oriented talks at OSFC).
> As the name implies, this event is intended to be attended by active
> developers foremost and if the event facility fills up, we will give
> priority to active developers.
>=20
> The format of the event is yet to be determined, but I'm expected we
> will have many face-to-face discussions on design and development topics
> which have been difficult to get consensus and forward-momentum on
> through our normal discussion forums (mailing list, Discord, design
> proposals, etc.).
>=20
>=20
> To reserve your spot at the event, please fill out the form at:
>     https://docs.google.com/forms/d/e/1FAIpQLScqIU-JGIZIrrgbDpkjLjaXi4QgV=
_seQ9LL9Ps1DNpxyUMgLQ/viewform?usp=3Dsf_link
>=20
> Responses are required by Sept 30th, 2023.
>=20
> [[Some of the information is personal but required by site security.  The
>   data will only be shared with me and necessary HPE employees.  Feel
>   free to send me an email or Discord message if you have concerns.]]
>=20
> --=20
> Patrick Williams

Last call for sign-ups.  I'll leave the form open until sometime on
Sunday Oct 1st.

--=20
Patrick Williams

--KrA++CvuAKz+gqcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUVc8UACgkQqwNHzC0A
wRlPsRAAgMf9Ka2bzt6+tGtxDV44hTFRaFnJ0DgDv2aeKj0NXaQWMIKhDMnAC+zo
xBBUbL+xH901xPD99gJQ3hPwZrnt90H9hxK+Y0YPgjn+vothbYO1I3clkj9U7Rfu
QW5onO6uFGCW1SP/wvBEf66u8bphzVDMWjR2L5050h67c++f6gk8EtZ0XzlI6IZr
As34ZJWhOqB54BAS8a0OlOCx9+KPwE1yP04dYwALx2g0NP37Xk3bBiEtfp2H0OMH
cMn6wbvjkjOSZisAvI+y/zp7pNjq5NvTwpCO9CGsGCVuW9vK3r41Kwzg2XpPTcOw
+pVu+hZDiqnb0PhEzDbiPTyZqOEkVwpiHLH2lk6eYCfqXIr8ieKdOrRjFzBlY44o
6wttdVdNKfUAADIP3TdvQhpgZcrqioLMDzZcam5nIGP5Cwolp1pXk4R5URVW5+gu
cxd6iIBUOvt1rJLXOy9JXjTCCggzJyFD5McObMLWuzPZcDBNLPUF9tQRqPvy9MYQ
98J6BwxalVY0qMaUlljsXewPjXAYSeovIiqyI3mPrwiDyAQMUAEL486si87ZQAJE
8kVP6CJGJ1W4oLwQgLvS/KhJT38/jC4j+mmwo7Px/I98WERsBpsoQ5P3qqXx4TWV
cLBSz3ylt2GaKPYW2fSqsbkL61KGOOhTR7H+51TEOOEZL+eqiRo=
=5Y6v
-----END PGP SIGNATURE-----

--KrA++CvuAKz+gqcb--
