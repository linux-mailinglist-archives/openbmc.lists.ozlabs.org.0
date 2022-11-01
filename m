Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975D6151D0
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 19:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1zhK24QRz3cM3
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 05:54:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZUZlWdqQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Co9Auefl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZUZlWdqQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Co9Auefl;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1zgf6xmcz3cH6
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 05:53:33 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2303A3200985;
	Tue,  1 Nov 2022 14:53:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 01 Nov 2022 14:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667328807; x=1667415207; bh=w9GjBJdJSn
	X/ChHDJTwRry7XsJCUG5H7opw8hgm3R7I=; b=ZUZlWdqQLbAYol5JCfwuAiQAS6
	biq/Crx4556VYPobuDGS6Zx+IvDv1p9ORQmtFXDr/EIKA4lQTxDhnVP9TIxdD6eD
	UYmk1tjl3OS2wQHHU629M/tFaiF9mtsAVjBSUaHT7PKhukqCxvQZBVIE+/gi13Hn
	vhYFLBEuZi3yJKS9Yj/RrnOcSWCS29Yep0//mqLH2DBaav7/5mNG38jdnU7ARZsS
	Z0+IHv4uS+1HxWXzDDgU3uwAHQnVz0hHW55NEDagxJksGv5ifKWBpTWRgl5ZYMLA
	CJp1bGa8SUa1Zx2o1wJtnTeZpGn6VoNX92Ve1hg5DTg+mxJqS33XOc7nSCEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667328807; x=1667415207; bh=w9GjBJdJSnX/ChHDJTwRry7XsJCU
	G5H7opw8hgm3R7I=; b=Co9AueflYktAcL5LAhxN7HZ9fllMDSpuGa2bo3+Rb4Bf
	3hRyUxiAPv2SNT/OL75PIhTSePvJubjwupql9YDAidvLCMWbXQs5pr5JWjfvtDus
	eEUWyfEFNtw8N7nZyszA9ftNGWWJwVstNT46fryupMhYdUtt51Ypa6Jf6Bl9Az7h
	Na1JOVJi2gyOyEeWt6p72SADhvN7/AuZdWiv8B+88YqzJwnUBT+Usly7zB5qicTx
	li1oYpOqh2SZnaHMAcEykqjwoRvAI/OZ8Y9TVUgv4+EKzEwdxAiw8lUULodcfz64
	fJLYjm6uPekmxAZZfZLT+xs21mKjC0PYaB5jFuZLdg==
X-ME-Sender: <xms:J2thY324AKg_loQYibMPvjijqM_MS9QHgGuliaIv_wDMkazCVdt27A>
    <xme:J2thY2H3QO9UfFnRELyl19q9QYpvmF67ao4xgssIxd0oHges3oxfZX2Wf5DrvFsL4
    kzeyQ1w1EeTAe2GyKI>
X-ME-Received: <xmr:J2thY37Stl_FisDiset2r3EquNZC5mUazbjJKcZ8kXprA_qEq2XPQzZVWxo5kiYGcRSL18jKSBryfJFy5nblk_wTdchPpG1bD6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeeijeehteetgefffefgheejheffveeuleejledutdehieduhfeggfduvefhuefgveen
    ucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmpdgtohhnfhhighdrmhgune
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhr
    ihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:J2thY80_AJe0eyacXHP2N-p7q48MHqQA97cJoQ6f-PtC1TWZR7iIOg>
    <xmx:J2thY6EcrVdDKnf-st7l-FbeD7I0kBdmHHG4y0Q4nxt4s1D0eHe49g>
    <xmx:J2thY99ywF8DUUi5u6_D0rwPb87qDwNfvCUfO0zp6GnswnyDS9vvvw>
    <xmx:J2thY1OB0LmidgHqehzZ7WO0PJqsEML_fcQW3MNwrzl6uYZO2ZGqbw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 14:53:27 -0400 (EDT)
Date: Tue, 1 Nov 2022 13:53:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <Y2FrJf0aT92bxM6E@heinlein.taila677.ts.net>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BvfAYTWttSoXN+Qs"
Content-Disposition: inline
In-Reply-To: <20221031230552.5ssc33v2xnghooqy@cheese>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BvfAYTWttSoXN+Qs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 07:05:52PM -0400, Brad Bishop wrote:
> OpenBMC maintainers
>=20
> This coming Sunday, November 6th, absent any feedback here I am planning=
=20
> on:
>=20
> 1 - Removing admin repository access by <xyz>-maintainers groups from=20
> all projects on Github that use the OpenBMC Gerrit instance for peer=20
> review (no change for projects that do not use the Gerrit instance like=
=20
> the kernel, u-boot, or qemu).
> 2 - Copying the submit prolog rules from the openbmc/openbmc Gerrit=20
> project to the openbmc-all-repos Gerrit project.
>=20
> Impacts to maintainers are:
>=20
> 1 - Members of <xyz-maintainers> groups will no longer have any special=
=20
> access to the GitHub repository (such as push, force-push).  If anyone=20
> requires such access, please respond to this email.
>=20
> 2 - You may now delegate the Gerrit OWNER role via the OWNERS file in=20
> your project, as supported by the OWNERS plugin documented here:
> https://gerrit.googlesource.com/plugins/owners/+/refs/heads/master/config=
=2Emd

In order to accomplish #2, I thought previously investigations yielded
that everyone needed to be added to have +2 (even thought it was
meaningless unless also confirmed by the OWNER plugin).  Has this been
resolved?  Are we going to move everyone to have this?  Or are we going
to have a global "maintainers group" with +2 abilities?

--=20
Patrick Williams

--BvfAYTWttSoXN+Qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNhayQACgkQqwNHzC0A
wRmR+A/7BI22Ul5WEWM5cuifIbJ3vnh9/oHlDtn7TcD9TwndjvQhOA8qWRv1RPN+
1zfoCAGRHTfLckgw2nNoEso85DyOkCTyKYI12qyQOuUUbna4P8Ci1/Wn/WYY3FRQ
kiGnukPnAi/IHzcpybwNYp5Q54a0EP/z+BJ2SQdBRj0j1ReVfiZpd9/40LhGgmHf
i4cxaSR5XnArpwUfGmU2PDRRjsgNTwvgztU7v4CTQsXU3hzW9YbuRwyL4R5zlQli
fCO2e9GyHnVXBmFZwr9phUVwDlce7Kh7iGaE4BvBErKBrqK0v1Wmu7qhZ+4hY4GO
bJEIbHP9xcLd9B4df3G0y2DZx1mGokMMN81s/IYSxskvLRFNjyPX9wp8YRF+MN3s
HkPpZ//FflajAw9QQrnN3GzTWxKcIOzeQRaXf9rMAKAcRsBzRCWy7gtmZER0SzBK
uY8toCs8exLPAysWO16JFR6rV/3Uw0rD9FjNNpfN4+s0LtmRC8j1v+1wUd/aWIXq
z/NNkZh00FHkjw3JsqZFVbArkoqQSSWTux7MEXXcuyOXuY+Nz4u9/GvaBHJJvSXH
siLPAMqGtqK5Lb74f1wLp5vIdpht+bECH/nw6vb7MQP3TTX5kv/si7h7a9Ry5JjO
bsTzJViepV7dtrcbKIlEDFVD+YjS9VxHqtm6WrJDnmYO1baVvS0=
=MrSX
-----END PGP SIGNATURE-----

--BvfAYTWttSoXN+Qs--
