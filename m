Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047756151DC
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 20:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1zrn6Y8pz3cH6
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 06:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IKGfAkRC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SCOCtVj1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IKGfAkRC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SCOCtVj1;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1zrC0jgRz3bcY
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 06:00:59 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id E14903200495;
	Tue,  1 Nov 2022 15:00:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 01 Nov 2022 15:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667329256; x=1667415656; bh=/PxGY72RCg
	j8T3o8LJp8j2WJQP9u4jOL3onZSuECQHU=; b=IKGfAkRCPBSWd6iMtw9UkxML4y
	fBNolKMl9N+Tp9YVuHgR4PBXxxPaNw19yCdY8i/GV/oavJlSRelnYfDAMm6fE+O9
	yKZ/ayZ37S4GlYF8tI26ImRBGbw3NgFq8Yz/h218c76qyzwc7hcfOifnL/yJDjGQ
	C+ip0d+CxWaHZvLYx/4t6eCzG1YhkHSHV2bDsdN0k4u4peZqLh2dNI9dKPxKRf33
	+NjGUSK5Om/+uRoPanYjSovpdPH1OfhWgNClbYagLUVbQ3Ed5OM8Uow+FYBX/5hw
	HgGT0hxuchmt37rrQeOL33rCogWvX9rvJI5zGfO+NZ11oPpNAm/m4CjpoxYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667329256; x=1667415656; bh=/PxGY72RCgj8T3o8LJp8j2WJQP9u
	4jOL3onZSuECQHU=; b=SCOCtVj15yF9K3sVR726uundWCVLYJoXiMXDVRuWCflD
	zuFVL3xHwUYa/jJ4N5jP1byYPAzmHJ5pB9z3BgBvGA6gk5UHl8+h+WRyT9SZJHpV
	wTUEEyiXAEN0iLQW4yA4nhSAdNAzW7ZOOMPp6BPrutqRqV9QT6hgkHm4Ew9u7nFd
	zWaJN8SrXWlUf8JZkfxMhZP84kiaGs7qjxyRRdwETQVIULf2rXbiOgR/UdxsgEaN
	fCcZLWYOhGsWWVnpSqA/lcpbosm0jq2g0ytdXngy5jXosULmxU2XtxP8BySJQtcs
	Yn/+5sqL+KQAgPMU3YWGkWWageTDlU9HcEX7JruljA==
X-ME-Sender: <xms:6GxhYyhhw70DT-3J1mpuE9t-9j7OiKaMehpeRIhdkdhz6Ln0jDQ_oQ>
    <xme:6GxhYzBqUN7DI4agEYeVkJ2b8qyjjydF9NuVyWjMxJFA5-QqMOVcSA5vN6xrPotkf
    vMFxlFSf7jZx1XgRiE>
X-ME-Received: <xmr:6GxhY6GuRGPJsmLcINEmxioUKCpvX6XRHA9RtDp-pBAH50Bwvx1LwtwdEEimtjPUX7m7Ir5WiGEaw_zhf2vtVj58SrFEXpBTPyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpedtjeejgfdugefhtedvudfghfejfeejfefhffeffeelgeduveejleelffefvdffleen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:6GxhY7RsctjG9fnsmHrLMre5A7Da22jUWlcqrVmYQlHDvz1wi9Piiw>
    <xmx:6GxhY_zElYBUBHA_yGKHaOztqfReW7inEa4hzkUUEtqEG3l-sTBBDQ>
    <xmx:6GxhY57j9e8ZSi0m-y-LVlfJQ3VTp3AWukTsiDhtUpWcW2X_b5HC2Q>
    <xmx:6GxhY9ae4tgRq_px9gJ_aiaqGKQuKIMIlqe4lTw_7HxzCLMM8-XTpQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 15:00:55 -0400 (EDT)
Date: Tue, 1 Nov 2022 14:00:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nikhil V <nikhil.vu@zohocorp.com>
Subject: Re: openbmc booting from external QSPI NOR Flash
Message-ID: <Y2Fs5gq8XUR7V6sj@heinlein.taila677.ts.net>
References: <1841e00f475.fd648575116781.6157445050168975217@zohocorp.com>
 <Y1vAVwy6lgej/WEC@heinlein.stwcx.org.github.beta.tailscale.net>
 <1841e8ad3c0.118df0b2e118974.5930685302191553052@zohocorp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ir0d8CbOJRT9B1I2"
Content-Disposition: inline
In-Reply-To: <1841e8ad3c0.118df0b2e118974.5930685302191553052@zohocorp.com>
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


--Ir0d8CbOJRT9B1I2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 05:52:05PM +0530, Nikhil V wrote:

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 As in beaglebone black it has =
onboard emmc. I donot want to use onboard flash or sdcard. I want that it s=
hould boot from external spi flash (I have also set sysboot for same).
>=20
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 My openbmc image is in ".wic" =
format which i flashed into sdcard through dd command. now i have connected=
 external SPI NOR flash .

Generally, bitbake has the variable "IMAGE_FSTYPES" that controls which
image types are built.  I don't know much about 'wic' format but my
understanding is that it is for "normal" block devices, like SD / eMMC.

Many of the OpenBMC systems, which are Aspeed chip based, use
"mtd-static" or "mtd-ubi" to generate an MTD format image, which is
appropriate for a SPI-NOR.  Unfortunately, I don't know how much of the
MTD generation code is tied to Aspeed / Nuvoton hardware and how much
will carry forward for your Beaglebone Black experiment.

--=20
Patrick Williams

--Ir0d8CbOJRT9B1I2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNhbOYACgkQqwNHzC0A
wRnOAw//dq2kE/Gb58UZrJW3N4FoHokBV7udGWTvc9G73DFIKY1S7DNtLIRyT4Gm
C+OpAw9wMponaHok7qvX3DcbQLEEypGDI26xXJttakc4A+fB+JtElcPCgDrgpmyU
JrLH3LGMsGiR8ze4K2j4O84S5W0HKR5ymAZl6hPBE9BkKQ5JojlG0mDJOSB0LQk6
F0pToF58NhI/zCZoSQsRx3vRFx/qqfW4dq4iV4Nys4QzX7sdlzXUbJZWZl1BVrDs
Zd7uPdIUEBkaUFIdAM7ogRuqQNbtHSLG/ojqkr+WJHtJfLCWylXhW+Wg6foA+4nG
FVlKlrZvEGt+cOztG837JjHSeu94XxcKk6qKBwbi3ARxu1R2OxsQCrc155EAB0in
vTbT1WyzNliT+rODoUNX4MWfEj496KEHY3w1bKQhg9LwI+hNAIwHuvsySiSt/Y+e
wYy/2T707epzcBs9urpfVRTQuqaZVxCqi4v2zeetVox6e+yTD9R9SY/ECLoWMMDb
R+LMQL41b/mvsW3DnMu/RZw/AseNs5DsrNVEdVci7DAPSWudnPxMyIxUM65g63/M
EuXr5U8boL0J1jLu3UBWYL0U3GGUU6lU7J7WG5x197VUk+QCLh5nGdAFanT5jrM8
nu/ymgTR3VWMhqqbeMWzASZ3tb/6ajB+mjkq6jLEG9xMm+aPRzI=
=MIdY
-----END PGP SIGNATURE-----

--Ir0d8CbOJRT9B1I2--
