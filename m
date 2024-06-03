Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4A8D8763
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 18:39:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LQMwt6Qa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GdLINM3N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtKDk387Dz3cl9
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 02:39:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LQMwt6Qa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GdLINM3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.154; helo=fhigh3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtKD45xfjz3cZ0
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 02:38:26 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 2DFAA114010D;
	Mon,  3 Jun 2024 12:38:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 03 Jun 2024 12:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717432703; x=1717519103; bh=Uwc+2Evo8b
	iQkXBtWYD4ABTqAHGr+8/9MmaFQpArxBQ=; b=LQMwt6QaL6qgUMLYnwX5ug7sek
	PC9o/vL0aqWVY98wyqeQR/IzqXpXVrJfvwN8Gmb4lEIfQP+8IIf7MyHO6pnKWMif
	i9Q/s6DTLndO5OjpaVccux/Kd9CoBwCJgFx5RVJnBO0GAKShioa3VBVoslJciKUC
	E3J9OMjXlsCCmi7IPKqXvPyUCebusBkTzbGV/emLjJNYeAvQnvpWrBrFJzv+vh3/
	2xOzeobGyENRqrw06E2LT3S/fGWZSayvQo/RewhrgmFrofdu0axHTvkdVg/2ZTxP
	waBE70umdEB3ynNzVEaqGYhXulAB3L+7Ra/NcZZVXrt6H+s7tbzfRnFYZNdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717432703; x=1717519103; bh=Uwc+2Evo8biQkXBtWYD4ABTqAHGr
	+8/9MmaFQpArxBQ=; b=GdLINM3NVgd7gQuriJ4DmCPHEdCOI+pw+0OOf3eEqhFd
	kpZpKD6SHlPjOcOcQcLvU6X/uIGtKb3nT2sYezZ0NzgS3xjilMue4MidzjyKdX3i
	3CX617m8ZWgkHLWxQaPzzA+M6hKVvC0hjH2v1nmwIloD8NKsGXwU8i7llexo9t11
	/ECEISmdb6yEMJvFavf2elYKVmECEjZx3uKXS0URo41kCh+szJfHxGfjX8dbn2sC
	iLWJYyMmszwjPB8PvHVR/CBod8L9wqEzI83jiCBk4elN853Kvxj9iE9SbLnKUyV8
	d1AjmDiC8Rz5FL9lKHtXkDsoqeqe1CDSFlggL+gdUQ==
X-ME-Sender: <xms:fvFdZvBW2wc5ZFh4NwrlOflCu4iaLDCGq9meSgkYNf-XmbG9mjWaWQ>
    <xme:fvFdZljAtfVITvhATRNfpc_VYRImZmiVga4Qu4ckj4DJekMV7WCnY6DcaFyDbwESL
    qyV44J7ZJzM5ygwIbg>
X-ME-Received: <xmr:fvFdZqlNsoEXSUHkHutRuLPyoIdQxNCZRoxEDUrfaKYIThy39TACh96Q6TJneDECSOFcW-QuRcULyG6EqwtjlX9jWnXxzOR7_a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:f_FdZhxTYNV94Pw1vSfgKEsFIATfEbsKmoSjg2zs2C6sEOGCrVnUnQ>
    <xmx:f_FdZkRPwoZoJi2LeNy4gqj83HdfvptZBa86f7jp_ZNrrCugB4OqQQ>
    <xmx:f_FdZkZ0iX9RtkwmLS4NKwysG928slbohrOeLblQIeOrWqnHywsnYg>
    <xmx:f_FdZlT3IiPDGFzASFeQ1behZtXDCoTeGLXWMvUD5_b672GhunQLXA>
    <xmx:f_FdZveA5nsnLfeVr1l1Mw2RQ5sw65iw6WoJG2wN7urhbU-NEdbzjjzY>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Jun 2024 12:38:22 -0400 (EDT)
Date: Mon, 3 Jun 2024 11:38:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: aayushi chauhan <aayushi.chauhan01@gmail.com>
Subject: Re: Server unable to start after OpenBMC flash
Message-ID: <Zl3xfZkFlAqGcm4L@heinlein.vulture-banana.ts.net>
References: <CAGUjZ4EuoJFL4N3F4+Knnb+hudHtrMKpCo3UJ=LqrwgOXZxRKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/VwEVvJ3g3PI5fAa"
Content-Disposition: inline
In-Reply-To: <CAGUjZ4EuoJFL4N3F4+Knnb+hudHtrMKpCo3UJ=LqrwgOXZxRKQ@mail.gmail.com>
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


--/VwEVvJ3g3PI5fAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 06:35:42PM +0530, aayushi chauhan wrote:
> *Unexpected behavior you saw*
> After flashing the Intel GNR-based motherboard with the OpenBMC image bui=
lt
> with version 2.14.0, the BMC successfully starts but the server doesn't
> start and is stuck at LED post code 0x02.
>=20
> I tried using an image built with the older commit but it didn't work.
>=20
> *Expected behavior*
> The server is supposed to start.
>=20
> *To Reproduce*
> Steps to reproduce the behavior:
>=20
>    1. '. setup evb-ast2600'

This is image for an "evaluation board" from Aspeed.  It is not a
managed server board and isn't likely to work for this motherboard you
are referring to.

I don't know what GNR is but maybe someone from Intel knows better.

>    2. 'bitbake obmc-phosphor-image'
>    3.  Flash the image to the BMC
>    4. Power on the system
>=20
>=20
> -> BMC boot up, server stuck at LEPPostcode 0x02.

--=20
Patrick Williams

--/VwEVvJ3g3PI5fAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZd8XsACgkQqwNHzC0A
wRmQoQ/+MBYflqR4ARp01XsMeFlbuMwo1223aOuGzqdmsZuPdZDXd1t2ZdtTCjUF
s/cx4cyuFI3jdj42Pv32/kfO+Tus4kjotPgpVs5qXahpY8FOmciOGejmAesx1M8y
HQMOqqg64AEFl8EXR8PnC3zFUUeKjvonqPXsLlWhmEfenPXHtHgbU8nxft+fAgQp
RQTvb+bZVyt7/FJQ50GrXMABkH5VbGip47h5SZW2JL9St+2MD5aySNlzk2jmcxgs
E1SZCJRWX8oypKO8ExFqI1Zc1AKYB+7rhXr+3AU7D6f1K+n/16rdROFs1I6syvLh
D6row0sAKkZWm+yWiz+rYOAEh3ZClBJAeN5fDd0ouebyPTymPbEQSlfCb0MMiOGF
mbYjrbkVAxS4dn7Ghec3luBHIRTCUPY6pIVCBwkTPACOt/qYTIbh5lRNEx750asm
5RcYZnaiEFsrQFT19iagZDyenq49VN7Gku5zv2WHQIpBcFva/Qf5yJMmYo8aoPhT
9q1RJNoCl/PrGRms8YDE1eJJtfyMeDW1o9JmARuTKA1w1Ue51pWvvO0Kys3ZoSsJ
UHLMkoxZkbALZODPFJseGvViw7u6wXhLdw7IoEDnj/rhzqzza73W6L9+Glzcw0ma
m288myPp+59N2C1g1HxABPJ+E78rvQv7Ahr+KKkw0H2vl9lG8SQ=
=EOB+
-----END PGP SIGNATURE-----

--/VwEVvJ3g3PI5fAa--
