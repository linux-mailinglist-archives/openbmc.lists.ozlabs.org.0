Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B538FBD1F
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 22:14:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Xp/aNesP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WuC8j8B3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv1yj6VYDz3d4H
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 06:14:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Xp/aNesP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WuC8j8B3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.155; helo=wfhigh4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv1y64nbDz3cYC
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 06:13:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id E959818000EA;
	Tue,  4 Jun 2024 16:13:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Jun 2024 16:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717532023; x=1717618423; bh=m5k1XWLmXI
	dhcuBvv55fRDApxMMOxGYnLUSDUkA+ejU=; b=Xp/aNesPNYEPWeuc9vsIvFIvuo
	hCy0qQWn44y/zBqxTjKwUc5+mm2+FKRY1890Ywzqf4bQ9gqNeFcrDNddp36i048i
	ipnFgLoHFI0AP7oID852SB1EC8UCko+MIUMfV/3rnA/ZGbAfON90rP5UYWeFkRaX
	zp8/d5vTyycvm16f9MWpwpPBMjgbDhQf5clATT1RDJlFRIoqzGiVAuHolqJB86+W
	UdEyLuqaluavLwQkW7HLaQe+zduwZAgpXesHiXCpOXum3SlqCavbibs2cv4hQwdR
	QRXHV+fKthLG/7UtpB9Wz3Vgu6bpyXKSXKfpklxlgrfo64VoaFRhUgnqmRCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717532023; x=1717618423; bh=m5k1XWLmXIdhcuBvv55fRDApxMMO
	xGYnLUSDUkA+ejU=; b=WuC8j8B3FK1D/vqx+gUsy6m9NrNJMou0bsL30WW6VKcL
	C3VfihubImt+evq0jbWp4liEixXMquolSKyurqSnIgiJ1FUNyLoqA37jsldWrcw1
	Pi7uWXHG7wKDPtAuyvJAjijtimGgddWzD9TzLct+Y8KP94VQWE5uP4TfI29p0VOq
	CUC/XwT5THLxswKTO3y3MV35QqKU9bpxAQDt/6wRdTJyx8KCy6PozVtRJyUUH6i2
	W69BNC+HMx+EjHfp9nS6wHu+CwBlNGiwo4h9171BHW+Zx968y2brWba7CQJ8doe0
	DAbGbLLd9ekzszL6zP8anSxaas4xeTR84lcVfqz1TQ==
X-ME-Sender: <xms:dnVfZiCMhKlm6GgPtc40pJkF4LOtFJYCOnAaBNA3ojA7JbDKQQVOeA>
    <xme:dnVfZsiFynjVj-7BArw3oZsE4C0RiOBCWgDimzmzofADHnr1KDWC5QRiP1YDr01u2
    WzlavcNudEAgMeXh7E>
X-ME-Received: <xmr:dnVfZln-LB6Z4xg2f_PWBhq_-pQqw1FFy9tsin8Yq7r8GBjN4ydmJLH6ksNTXee0HiPY3vw8k5IsvP576pBl54-3nxZmHPMQ0VM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepff
    fhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghi
    lhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvg
    hrnhepheefjeehfedtjeeivdefkeffheeludekudelleffkefgtdeludelvddtgedtheek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrth
    hrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dnVfZgyumzJLnLIafOyizKkqP1JJ9jlspXCmRMLwJ6SSC7eCJTw6nw>
    <xmx:dnVfZnSn-4H-ZMDcAmSd5BHf25xsS0XlaM7aUkqFICOpIdW7d4LkPw>
    <xmx:dnVfZrYgb-gUM_gEg8uW98ncXVy59gYR_L63xo1GeFVhDtxXX6seTQ>
    <xmx:dnVfZgQDGj2hu4DMaYLU1YXHNdl9Ev8THomJ-sG-6Fc4elLNi3ak0Q>
    <xmx:d3VfZmE5rT2JjunWJuPYnjTcZbXXo542jpZIw0izvRroQqTPhEl6_S9w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jun 2024 16:13:41 -0400 (EDT)
Date: Tue, 4 Jun 2024 15:13:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v1] ARM: dts: Aspeed: Add Facebook Minerva DTS
Message-ID: <Zl91dAo6NXDSQA3E@heinlein.vulture-banana.ts.net>
References: <20240604095720.2902647-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RmQStJzM3Y7mf0ES"
Content-Disposition: inline
In-Reply-To: <20240604095720.2902647-1-peteryin.openbmc@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, peter.yin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--RmQStJzM3Y7mf0ES
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 05:57:20PM +0800, Peter Yin wrote:
> Initial introduction of Facebook Minerva
> equipped with Aspeed 2600 BMC SoC.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  arch/arm/dts/Makefile            |  1 +
>  arch/arm/dts/ast2600-minerva.dts | 66 ++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-minerva.dts

Is this targeting u-boot?

--=20
Patrick Williams

--RmQStJzM3Y7mf0ES
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZfdXIACgkQqwNHzC0A
wRmLHg//SqpBJYit4NfriL/DEWzXlEvBQWKmSsFU64VqJS19rqo8HyyhUJMFRB8N
R3B/0H7nt3xRRMzcj4wlQIpOXT9umBoAnxxSd69pA1L3puRsundaETC9Ug3Gy+IL
EKP3FrAU2c9XPzBBB/a8xg3f7l7EI/Oi0ItaAN+DEjcM+tnf5V9dd0MZHe9DIt3m
u5350LmK+9BhX1u2YCpPsYVbrE82aXmGXnioijOMLr2v1D5gWzeQu9QXWZhEIcKv
+nzfbTMYDCYnz8wVaqyHfFjM5rKKaDFeq8QUIupB6PZtkR8rnRJbPzSxjC31LehX
ynNNdOBSdMmgMTwFeiLuWnI6ZTyGV66QpJQFgSKKZACygUIukkOVcSuuJzSIIL9w
ANUFyDgHyZqbLLqItyzr92ghPClPui0nyNmj+Q8DxhzDIqD2/TnWziquM6ncw2aD
yzD0n94kAnlcW0x8m17jTfbMqFCXZuiTB6lLXDMFzkt18QiXyXQGnJHUAdnpC6Of
M2FODh4/Sg6HHq6bZoUECXZOe8PXSn4+1b71rVYncVhBKu8tH6+DcEMRSvT1rPve
31tW+D2Vfaq6p40ibUrhHLrdqb4hOqLOXkmViKV0pjthfmol8oGvwo5lKfjO9dc2
XXsHYFGEjh187Q/lzh/oySXj18k/3jVv/JEjzBHPjmmP67B4lrc=
=zSt7
-----END PGP SIGNATURE-----

--RmQStJzM3Y7mf0ES--
