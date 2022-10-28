Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF296610FF2
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 13:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLKg3xzGz3cDv
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 22:43:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KcjpvhO/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hcQjC5H0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KcjpvhO/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hcQjC5H0;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLK65wF8z3cDv
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 22:43:22 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C7915320030E;
	Fri, 28 Oct 2022 07:43:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 28 Oct 2022 07:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666957400; x=1667043800; bh=sBztaFADHI
	+pHwIkbcUvtjQbPIYN57/6MDxJMp3xQx0=; b=KcjpvhO/DAWM5lTOkVMhW11a0c
	aCTY3gjutkbcHv4aUUKShyFiOTS7T1jm39zQDbwdI/4a7P8VqhuPNqsmMBGqwbMg
	weDIMpck54J9tGaEw/AlSIg7iTvxPkspO7WfYhqr1I7ma900dOskGzyvEVntXy5z
	kiT8ZnOrgbHwwCFLkmVAlyTC+AAvgUHReDIfuBRKnDvoUgsRsix4eXeMM16TxNRG
	UmC8KM91gw1FmLzae2awHxV77hvu524OQi2CfZP2X+UK8Aw/lnZ0+ZAo6+GFAdqk
	WsYU6CoPa/PUEkJRbBPAIFHOeSlJr6183YC3YHW7n5u8SaY7iPdjYQbBFLXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666957400; x=1667043800; bh=sBztaFADHI+pHwIkbcUvtjQbPIYN
	57/6MDxJMp3xQx0=; b=hcQjC5H040kKZW6aXVQgtV7zH0u9TpJTq/WFmqyQHg3G
	N7Is5DwSPUSxcf1yQaOwTg6LBl05RtOyyjWtQGcA3XJcdsj8A85yzegnD9PHrc8W
	igbo2XpadJ1Aw3aXREjJeNPLhWO2m64Dlco4MPIAbOGFA6tSL2wNNdsBrQ3aQTwS
	gJ7P5aO1vlpmdmmRN+4TnWLcn8gvQqawVNUJQEB8Vnf/24EMZI2bY41LPhL1f6eI
	gh7XvsJ6ePryu4Dz9xFRW7GoK6L1u7u4FDsiSRttTCjArhrdsT8nP1iMsrKg8Aqs
	0xvGTnGd3oagtXWO7zJ8oyqK2Fkz3FN+ImDUaYnbqA==
X-ME-Sender: <xms:WMBbY2kKR5E61Bpr1PwkU2uNtaIRod0s0oAANNjj7Qw8K2w9sWZpLQ>
    <xme:WMBbY93gW51_5oWP1UopLaQUqVi5Fke_cJIykVgcOWkl38quo2UdUlv5SGLZ0DICz
    4TeU63JEyKz_8u_NXU>
X-ME-Received: <xmr:WMBbY0qkQXU2K63DNV2TV3bxJOEJyrpzsAngIsEs8nAZIs5D73L7J3tRdHazr4sWfQ5mtFIZwNBGC2nheF_QUGY01SvpN2N0Uyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    eptdejjefgudeghfetvddugffhjeefjeefhffffeefleegudevjeellefffedvffelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:WMBbY6nbqMvRb0XOs7Ev9JByaOE5MG4PCk539aY3cLfeJWiU68hzAg>
    <xmx:WMBbY00hT7YTqd6hrw0CJK7ST9y8uW2E0he74-m0UoFF4jDkr75dTQ>
    <xmx:WMBbYxv4frE-GPqWY-OMmwXTwLONn4MrlcrEwszDoifRZzhUJbefGg>
    <xmx:WMBbY59Af7_dpJqFFzblKlpQzPxih642Gn4-2bkhd6-ZCl4gBs2cgQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:43:19 -0400 (EDT)
Date: Fri, 28 Oct 2022 06:43:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nikhil V <nikhil.vu@zohocorp.com>
Subject: Re: openbmc booting from external QSPI NOR Flash
Message-ID: <Y1vAVwy6lgej/WEC@heinlein.stwcx.org.github.beta.tailscale.net>
References: <1841e00f475.fd648575116781.6157445050168975217@zohocorp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGaujOGBj/fZ85j1"
Content-Disposition: inline
In-Reply-To: <1841e00f475.fd648575116781.6157445050168975217@zohocorp.com>
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


--ZGaujOGBj/fZ85j1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 03:21:29PM +0530, Nikhil V wrote:
=20
> =A0=A0=A0=A0=A0=A0=A0 I am unable to identify how create image for SPI Fl=
ash, or what are the steps to carried out to load image in external qspi fl=
ash.

Most systems use a SPI-NOR, so this should not be difficult.  What kind
of trouble are you running into?

--=20
Patrick Williams

--ZGaujOGBj/fZ85j1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNbwFcACgkQqwNHzC0A
wRmPNw//ZnoiJUYw/TZl+tf4X6jF1RIva68SLjT9s3hzxusTEf3LJwlubzMIbpAt
dX/wFMyiUQ0LOKB4dXwn/yTpEJOdEGFd1notck+t1+54DxTucX1WV18bkPEG3/1U
sRcy4PCA4SAUhZgOPuDtm44JkMHPc7SL2VMfXz8baDgVfCFMwBvfyxsZ+7d1ovQq
j81kXMD+8TbRJHoAPZ/IHo8UMnu18rHbmHal7OWktTUbfS/sJmKg3aPJPBwI0Shn
Bgpwotxg1naaN6i3AcjfLSJKAhBbVse3FMZWNvTfcvpm/BqFM9QnSwzIunhMBC4a
EqNjekuaTdNtfOlKDf9iLvqXsZFN70b2E1x/KlhGIOISLjrP3sU2Z3B4f7rgMiP+
9n2Dqib1eNQYKSrO0J73OoAKMCYUPeiRFeT4XxtFVDr6zCAFrrmF5aCd4J9tCG4M
4kjJZJSNqR5EWVJ23kuLzwezKSUJU26zZayYDBLnPur1wgkp4zQ76W1EGIEQL46/
lq9FUPLa3CK+68pGQVmKQ2F8thD9CuLaEISrPje4mfQUaDqYY7lHjzUIy9v+ETln
Mkojx5GegRLjWRMdIhOEsGufkL3eLGwAMYxl6js/f+60DCxh3EC7eT0O0LETN45y
GE5IBASQcJd280k4wWSCF4pRgdTmcUTVc9J7I2zUKQIdluUgHVc=
=iaMZ
-----END PGP SIGNATURE-----

--ZGaujOGBj/fZ85j1--
