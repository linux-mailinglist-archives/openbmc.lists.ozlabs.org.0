Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBC63C9FA
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 22:02:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMFC56pBjz3bVF
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 08:02:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UVsyr07V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jyzWhIZ1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UVsyr07V;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jyzWhIZ1;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMFBS2Rw1z2x9d
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 08:01:35 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9C4D25C0064;
	Tue, 29 Nov 2022 16:01:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 29 Nov 2022 16:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1669755691; x=1669842091; bh=Ld5DMLEY4v
	Hx3uakWo4ZbA7NLDelEsG+WOYyy+djawU=; b=UVsyr07VzMaG/LhIQYxlI3TQxA
	bz3bDTKHFjex3muJPNd+2igp9V8CwNllB2MItlzXP5cvTm0GrGBa/LgkUaDXWzWs
	uGpNEc54uN8mMaNV2vTFR8Kyd2sJRJQ3FwLNrsNcoiQq/v8H3Fg4YokL23WQyT+s
	erSi7VEjwzih7yC4g3ZFrCOAD04k9bD+iWqxILY2mp83Fq0sjrAkTOhDb9uONfru
	guCa0cZpMfM6tQXr+wY3QnNivDVZhiO+O0PNCBxdJH/hAwcTvw3IYhw+PSaKm4TC
	2nUf1QhRhG50pnGAhm20OOHILgKzEweQSDkrdt64xvWGtVbTEoUvlQ/ZI18w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669755691; x=1669842091; bh=Ld5DMLEY4vHx3uakWo4ZbA7NLDel
	EsG+WOYyy+djawU=; b=jyzWhIZ1vFDoYsqBB7jwlknuFpqtlte4cu+dv4epszRl
	PinbMHyUCEG0IlTY+rHPeQiL4QSpheEMBmyyrTwjE1yt0u6DgoHLbEuvIckNbBqO
	6yWs9C9b25M+IumavBrBRrkPL/vsWUfZ782Mf7URwn7Ro/3cQdmV9t+MlhNZO7F7
	4UQ+kX8XxUgJtFDEEf4lnCqx11DGE5g9l4PjyY084tk2Ua9vjZey1M2opU1BQTRY
	/cXlSx9Gx93FTttuxSUK1ziR8rZjc0qggO6KjkKWjwocRMoxcm/xow4w7bJBwnYG
	wY6zN9WeDKNdVkY/Df47VGvVNeBUb1BC3AEeg9LA/A==
X-ME-Sender: <xms:KnOGY31yk1e3uTeYCCeSKJYB6oK9Sx2ZUfzcV85Mo4bITBicr1Zs-w>
    <xme:KnOGY2Ep1vu2iR3yqdfN-1sT5tlZQHufSFKGkcVOYSZdf86G2zA0z9jQ0imbPRcrB
    KCoZwX3CkOtp3R495s>
X-ME-Received: <xmr:KnOGY34cKd7VdnTslMHgvh93QzftTm4ScsoBXOLaWboR1KnV5fc-uB2aQgegdhJkqvmcKRuCtfjjYD-EZsxbmkfIicXvkhHgOT0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddugddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:K3OGY83BJVSn4r2Gl2jaPJ4JLc1pvQewpoRSxxmkLZo6DWGZETMryA>
    <xmx:K3OGY6F2cWv7j-ZjLdUHiYBZkFeua0hY1L1l3TiB6s3wIvt-lazYVw>
    <xmx:K3OGY9_ENisfXIxTQ0-GQTlplKUijzrdZDohH-oGT7gu7xtUoUaQ2w>
    <xmx:K3OGY1MLgrTKwY1kLPVRfsSUz4ejvqYaG8rdSGXqVnJMTzCYuXs2Zg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 16:01:30 -0500 (EST)
Date: Tue, 29 Nov 2022 15:01:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Francine Sauvage <francine.sauvage@atos.net>
Subject: Re: How to declare the default value of a dict in yaml setting ?
Message-ID: <Y4ZzKRk+DvC4+9Fw@heinlein.taila677.ts.net>
References: <PAXPR02MB768073FA27508BD2B28EC72FE40D9@PAXPR02MB7680.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ol+Wlfi90Q3URdVQ"
Content-Disposition: inline
In-Reply-To: <PAXPR02MB768073FA27508BD2B28EC72FE40D9@PAXPR02MB7680.eurprd02.prod.outlook.com>
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


--Ol+Wlfi90Q3URdVQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 02:19:48PM +0000, Francine Sauvage wrote:
> Hi all,
>=20
> I would like to serialize a persistent data in the settings (phosphor-set=
tings-manager) ?
> I need a default value, what could it be ?
>=20
> - name: MyData
>           type: dict[int16, array[byte]]
>           description: >
>             A dictionary of DIMM SPD Data.
>             default: ???

Take a look at the phosphor-settings-defaults-native.bb recipe and any
of the .bbappend files that are in the various meta-layers.

--=20
Patrick Williams

--Ol+Wlfi90Q3URdVQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmOGcycACgkQqwNHzC0A
wRmWLA//ezo9s5g/F670CZgZLABZ1nwOWLoVSwzFlaEo1I7Y8NNOuClsf7ccXRBB
+IAgczMOq2/8nrLN+lio6seQDxVNotsSkBZENLjt/5YjzA60NssgZyBbJLJWanYh
FxoXilWxXXjjHdO5XzPrdYvCgPMI11gepPa8lwaTLX/BBRRIPZug11kKkoE4Tkj5
lRbhVlKnmwy9bpLbvdJoGT7gXpLM5VNTmaMWU9SK8vxTx0/LB42yLLXiTE/ytDXt
Dw+e34LlSDgwxXB4t7hsUBXKN7SR0LZF61/awreANT6A4tImdIgMKbvcHjQul1Nm
tUl0dry1Y0WlrPvjWVZSsa7HO2JZFTsWrQ5e7HGhAQJr7Vm16erOXQObSpQsPDkm
OATRtqxE82BHQH1sJogc5KY3GsoIbchPqyA3IL9272m/2Ld6DVoWMS1vRzjQEVMl
13zcdCdutZ0+Ve6kkZDsbmtmVpyCSaJNbHrPqP/3t0UGMNZM52iZp8MeKP6btuCd
NH46N6QqyPkZbisEyZPdX0GNm8O/WZt27DNAbavpy37xoI/IvlrAJ8eOMQ4h7W1P
0TPsopx7IhII2/7DwRLbvEfYL6kr30Ff8wyY/wApnsSEaBLbj8/xfbTcqrRb2x1Z
Wcc83d6HXHhX8cd2FNwiYApMW+uTlmJWT79ValswZeSV+rpnU9A=
=tbWT
-----END PGP SIGNATURE-----

--Ol+Wlfi90Q3URdVQ--
