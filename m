Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6B5B8FA4
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 22:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSWw24Fmxz3bl6
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 06:22:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bzxhN2XH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XqAe/MvI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bzxhN2XH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XqAe/MvI;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSWvX0Rlzz2yy0
	for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 06:21:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id EFD8C32009B5
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 16:21:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 14 Sep 2022 16:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663186897; x=1663273297; bh=3OgApKEoYx
	K88mxBbzLdbbzAvELEsemfUzg6PKgmEUc=; b=bzxhN2XHX3Gh94xNqHCCurYDmp
	eJ5MGrGyk2YTgAuHge4qLiMRPWZIgd40NtDVZiOGzjtpvyaZHJ0wHM40DI7MovWi
	wRb5reWnEA1X9n49TZsA/yxUepozbNEzRen6jpcK6G/Jm2YaPMar3mxXmTRVlkNC
	T5mVpLlU0MnhM9Qy6eMW01v9D4zDGBzhXBET6sCpGIYB7bkbhhfpDkPw88CJ1iJx
	P4MGxJqYixNlzuwYISAbO71MMgZk9gEIuqXEQcTGULmh2groUtLSph4DXRjLzwmP
	YcjA99DVg+Vr1IvmQpy476qkoRnWMet7shf1ZZ0Gbmvh0K0YWe+vEk8GyPJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663186897; x=1663273297; bh=3OgApKEoYxK88mxBbzLdbbzAvELE
	semfUzg6PKgmEUc=; b=XqAe/MvIk6j5wQnNNozmpAYRHXzKAOvqF5YRfrmW9T7+
	fCPIE4XrfA1Kh0HmL3idftQ5y/U9jf2BXZe2iIlEGZeJW42wQxRvAqmg1WORGDji
	GgP/pkM7PfhkLyLg9/Dg45dJJxMK9Png42OB1m60pCJJnTBVLsE8/aSQDOKu9gOu
	JWtAMAjX0dMtELJkUcdTs04FPiUYnmuNn1G9Xc4P7Ceen0LbQmbA3XE2S97xf2NN
	xLnd1ZAzRX6Nje+8AZvLPb420SksglL5Qa06BiRj8uFWR5rEbPMEJDY9BFbWGB6s
	BUvLKOZ323xvhLXS4TlIvVbVDJ/o5qiEbDHH6wm0zw==
X-ME-Sender: <xms:0DciY5FubEinZRYJtmePoace84HcOzsnky1NLNDmT4SdJipsRP73gA>
    <xme:0DciY-V1IzVym9kjtR-XGEmDUaCIkqEBIqKiRv7hqogF9xL-HcW9QLimtrhCsfmyt
    g7NDFbCoRPnuNau6hw>
X-ME-Received: <xmr:0DciY7JIgbhVe6WLELJL6T2ckX09AS0pLe72u-m8p5vHbu10V0y6YEfJiUyMrfzXSCOzq3Z84Tnb17AtvPJJ3LVYFiei8MEO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
    hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:0TciY_FLV1spGj_nozK04Xo1louSCrqb4fwI4Xul9Od_aWYIIuXEIw>
    <xmx:0TciY_Wf1Y5KabyIFPbOZCBOZXw-YaHXw9Z77C4hiyLpiwlbV7hAbQ>
    <xmx:0TciY6PVbSuAeptxsmAgR3o6sj4hFhuxlgqkVt6LF1i7f9bIZhBfvg>
    <xmx:0TciY2CgqJTxwIeyFoyHLhYWhHSOG0mhaLbKCtaxc2sCyRW4gtuQJw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 16:21:36 -0400 (EDT)
Date: Wed, 14 Sep 2022 15:21:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: 2022H2 TOF Elections
Message-ID: <YyI3z5lBYs3+3spx@heinlein.stwcx.org.github.beta.tailscale.net>
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uYHjuAzmbNay5QJm"
Content-Disposition: inline
In-Reply-To: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
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


--uYHjuAzmbNay5QJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 04:10:24PM -0500, Patrick Williams wrote:
> Hello Developers,

>    2. Nominations are open for TOF members and run through the end of
>       July.
>=20
>    3. The election, if necessary, is to begin September 1st.

I'm slightly late in sending this out.  We had only 3 people who were
nominated: Brad, Ed, and Zev.  This is the same number of seats which
were open so the election was unnecessary.  The term for these three
will begin on Oct 1st.

--=20
Patrick Williams

--uYHjuAzmbNay5QJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMiN80ACgkQqwNHzC0A
wRmgpA/9HgD9QF9xWRqrcBJ5YTgu++jAwCMuYXAdpQ+bOWBMkk2ReiciWB1QIjU0
2dUkv2EkKi7WLSrKPKNdTcqXrkxRLcQrIAiSxEAmxXtwE0tdk8+C0ArAbUTiHJB6
hQvq0445yU33vYSIYkICVleTe4pGzMkS96oGu/ys3E6sfqgMhiCrO6M4wTAv2TX6
+xM6xAKBUbCwo77dyqyXDotOwJC3u/Bm0WgmiFqNKHiuC8ab7SRhnrKye8YcQ5M3
8UB+lXaK0nnrZ8JUIfpbFPLHbvfCLTIU1nh6uBw2SIVcFE0zFv/j2kf4V0DL6F/Q
wlmWB0AZ1p/YN3uE9Q2wq8irnwbjj70xofiuAGN6oPWB+VggaWCccoGBD8/9fFwl
Tse/cWwmdkIRLNeh4iLUjvN6vNFQNsWqeqN6xRR/zkXdw52sw1VVQNz6zFy9eZMJ
INdGEWrhu+X93yrs0jyDpfBY3+0y4OIa5fTgcqwaxWT4z3t2Eeq2yrC+5nU1ra+R
OHYyZVTO0jL6PND1vpNy1FzdNgQoZzbP2dUt1nbdg6FPHr8X/OlR86huHGpP+022
sMFtErQUGXc1VQgApQnHqFjM4Kq/fAzvbDWN1eTR3GSofgqrn+MOHD7eP72p10lF
4GC5/NnBoAC3T64MO5Y+snoHqTIIbGaoQcWULbjBsEnkv0dzfd0=
=uL44
-----END PGP SIGNATURE-----

--uYHjuAzmbNay5QJm--
