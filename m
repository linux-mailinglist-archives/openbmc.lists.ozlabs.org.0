Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B76038F6
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 06:53:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Msdfj63GHz3bsK
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 15:53:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GGBK4cIC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AdN7OPdj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GGBK4cIC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AdN7OPdj;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msdf523TFz3bjH
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 15:53:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5E0815C0170;
	Wed, 19 Oct 2022 00:53:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 19 Oct 2022 00:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666155195; x=1666241595; bh=ogcM+uYIH4
	/a0U9zHfabPBBAnWcgXPmEFG3OjiHvjzI=; b=GGBK4cICxU5oyCGxACkOY0fExH
	3qwHPAOhVrCh7R6D3pR60adO4EE4XKUlvW1YMe4aEVBinJb039wvDCjU4xU3jWpJ
	TYPvmN8qZDH29mabTDBjNRSjTv6Ki71iWr51BjXINM288rKu1GzXEb+iB5lGpvid
	G6c8o6p/Dl4HiLdq/k21UYlIPZv2KKVo14p45y8ZgftAbLYIZJZ6BcsGJAMPf3Df
	3N30TvDzSTT0f+UtfKBxtWA7LnswTWC0iJ49shJRhQXYZ0A2gP8mC6zaWgPQlJGI
	444yUo+qbZTIwjo8NvqiBpAJ3dWh8miq3RhtO9hNEi6zz/ftuM+Jdn9Dcbpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666155195; x=1666241595; bh=ogcM+uYIH4/a0U9zHfabPBBAnWcg
	XPmEFG3OjiHvjzI=; b=AdN7OPdjADhoqNi3u2ww5IaXNdPlQgSalBAL5V/xRBxO
	IOzB2lqZo2B1nWSobFfuYjPRNAf8kygWco7Z5VNcdr9vaZHj2RY3SB5lz3UIkakN
	ScDh5TvNz56em6FzDmPDLV6g+IRa8uI43uSAL+P/ar5IYA4x41vAIVauFoISEXLB
	6Zt/Us82xJ1mRl+blHhlC/mM5OHDuW13evLDBBJRmV/TU/yHq4djzer9K8O6fK14
	KhVFz2CXDVGNBIsEo+AmudLS6SkebbXGAX7UsXuUObyc+VkM8WK4EaNR59I5A1SO
	CpngCHAQ8nkl7k+a1dOTFo7NVeKo3dJBlvoK0pwfvQ==
X-ME-Sender: <xms:u4JPY96ryTseMdHc55ui9h4YGPS_rBDv2P6wdfqX6svdbz8mjy35tw>
    <xme:u4JPY6695eGOGIwx7XDkvnNWze0Ytsv9RZ8Br3owe2nv2nNdO4BBETppUTCMpDA6d
    CxNMQLXjz328Q7GIh0>
X-ME-Received: <xmr:u4JPY0dvBE91cHdP_khMAl-teOsZdizINTkvL98ArhomCckQPFUF9CwvdBZ-X1OdIlxZC7-cZ-cwY_nBRTSKDPMBGOuT6_-t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeehfeejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:u4JPY2KXNA0r9aOKL2hMYOA5J_etHLTHPEmgAlWsXx4ayPNiq-WG_w>
    <xmx:u4JPYxJFAqYOpPCY8W1OiCDiTUKOZKsPM59FJeEUp4KQVxhl8VCwTw>
    <xmx:u4JPY_wwhILhANk-PZ-p-id3D1tZRGft-u-cantUXXW4iU4MQlhl-A>
    <xmx:u4JPYzyOP0fLtSdeD_5NpjL71bJr_4M75WBLPX9o7ojGktsF_4bgkA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 00:53:14 -0400 (EDT)
Date: Tue, 18 Oct 2022 23:53:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Blocking call in phosphor-networkd
Message-ID: <Y0+CuVkotsGxecxW@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Qhm1Lwlh+JwHilk"
Content-Disposition: inline
In-Reply-To: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2Qhm1Lwlh+JwHilk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 11:40:17AM +0800, Lei Yu wrote:

> An alternative is to make async calls, but phosphor-networkd is
> written in "sync" way so it may require more effort to change it
> async.

Does systemd-networkd emit any signals on this property?  Should we
match/cache the property instead of calling over to the other daemon?

If it doesn't emit signals, can we modify systemd-networkd so that it
does?

--=20
Patrick Williams

--2Qhm1Lwlh+JwHilk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNPgrkACgkQqwNHzC0A
wRmvMxAAjp8VEG9KeG3WkS9cOcmNG/sjakxuZTZg/GrPCeohGJpGk+dDxdiLTTR+
qeGGz26IkC1Fi+XT0kH2AIq0/uol0aUf3Akzx3jF2IGfvdBhl0OGQ3NXhqXZjtwu
HPfmSoGIZvw6J/ZbAYY15SXrxTcr80g0AOqnhJkJP3RcNOg6Y+czcJpB2ynCYW9g
f03E5qpVZDjcnMSoltoKoF0G0164oYD8l3ciYkkZpS0IcEQfVQdpyahgeYBMBuUc
0jWbL0eVIFrZEEh0BbzztFiM/j2Ky102QAVBahXtdxwg8S0mMPORtxK6mzzENUK+
2p0Lrcoc6S+bL/TNu6XDCr3GR4q8N9iWUsiWqM40K7+nAvzMQkz5J6synqMQ/Unv
S1SZ6348EiWu/Ss678vriTQJrAd8sQiccshy5LAhYETdTR9Nq/5okI9J4ThFuBRb
oRns6X4OeFEN9Mr2MxQ8NWpMH5iG10C61gJ1BiKcM+9YSCM50O4WMzprk4pRvmL5
OFozYbN3WQDsZG1oUA/xovE6HFmWn+Rj/s1IBxecOBlxdfFGtUTGtuYaZ/R+gtyh
fehiNqzSZIPh93SB7o7T9JO5mQNv3lNmCx+a7WhjvxZYG3enqBe3xDtSBdV54mue
hVHkmoC9tD6+woES1XmUjSr5Wwo+hrfts9ZjmoYYoZeb7h3DreY=
=x7qL
-----END PGP SIGNATURE-----

--2Qhm1Lwlh+JwHilk--
