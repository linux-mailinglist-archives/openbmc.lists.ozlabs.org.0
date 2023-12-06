Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6D8063D1
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 02:01:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=E6yMlCiH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XWVCbVuM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlJxh1MYCz3cWW
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 12:01:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=E6yMlCiH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XWVCbVuM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlJwv1tNSz3bws
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 12:00:30 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9D0433200035
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 20:00:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 05 Dec 2023 20:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701824427; x=1701910827; bh=qw
	69oJdY8n4B7J/PL85EKbDZjeF9lTF+l0Lpi2L9Xfo=; b=E6yMlCiHVHomX3ub3G
	qP2FpHzYDfbBnn8qnnJEWoZtIJpv88vxYQiu8S+L174fIhPJ0Tpt9oaGaiJrpNBg
	amstJVchrw8g12ZSK4MdMXPi915L/9ZyDSHbT9GkILz035yoEtDyxLnZvybEWR73
	vO0SuTp5MvV4JsDajL6av+1w4IK8x+R38yZMXPNKrUEj9KxbxGKTkHWlmgItE7bB
	1DD95k2HKfEWsFC6h9rN1SRYF1rKMMjJRBqkwz+s3D/z1l4qpcws/w0gBWVjl3J5
	b6j+hP+XNYvnc18ZH5YdbYU3ocMeJZyeOJ4Nz1zX38ukoYvOx11mqQlIA9IPRJPV
	3+Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701824427; x=1701910827; bh=qw69oJdY8n4B7
	J/PL85EKbDZjeF9lTF+l0Lpi2L9Xfo=; b=XWVCbVuMBFn5dT51BNwj26/9tMFId
	Ixl+X1UUx/hPtvHCp96dW8tcRfigchOOWJKh91s+G9TG2L4en/hJmBKXskSPWkby
	QXkM4quWuB7k96OVCR1n0b/ocZKjQUlL5UWnYs4u/1StpXkN7Eo71ogBXe9K19Np
	CBB++K30P+V836dSx/nCsdL34K5Y9IIPqHOPOSlrhex3vJmlbHTgjiAhwAwHThlc
	dZNCdUVw5Ije4/ym9sMnDcUBWGzlFqVYtDgxDct8GquAQggSI7wWkcDVx/37Zhs8
	BshLfw6t+f0yGpVlyl8qd0+9+q1V5GRFahw9QhdpPftpSb18/UDZSlAYg==
X-ME-Sender: <xms:qsdvZbp_odQthcIFBSqrxEZW_b01IBezvsnK0sgWCFBF4N3K5cR2UQ>
    <xme:qsdvZVqa8vToO3nLrMpOLuayudi-bMZz5Dm6LTxYuMuXa3ZZ19JevC7DMhRIxCFYH
    643d9BNdHImDZNXkB8>
X-ME-Received: <xmr:qsdvZYPsUJC8PG2a5B9pAbhLa9PYlj6pLbPSsu_HVjwXfLp72NEryOQtQkmdk93jmHo5Nly-stgC6fUedVC-Jmkh26h3WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:qsdvZe7RmQ42_Q5jAOOSgZmt_M3guWjpYmlPgsDeISwH9N7I1UHO-g>
    <xmx:qsdvZa76xZEoZwRdowDE9bo4E1CQXiOMzrCPGB8uzBwTF9ts7pcWdQ>
    <xmx:qsdvZWis0m1whqnQq4hACXgY5ABiqTLSIYd4_KWo6U7hmilVxqNMcg>
    <xmx:q8dvZXX-6eVoBzuTaYtHDLutNBHzBUE2X5Jdvg4_RnpLJ5eGugg2aQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 5 Dec 2023 20:00:26 -0500 (EST)
Date: Tue, 5 Dec 2023 19:00:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-5.6 1/3] net/ncsi: Simplify Kconfig/dts control flow
Message-ID: <ZW_HqYQADoCeFvYc@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fecJhlc5oECGkGHq"
Content-Disposition: inline
In-Reply-To: <20231205234843.4013767-1-patrick@stwcx.xyz>
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


--fecJhlc5oECGkGHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 05:48:41PM -0600, Patrick Williams wrote:
> (cherry picked from commit c797ce168930ce3d62a9b7fc4d7040963ee6a01e)

These patches were cherry-picked from the net-next tree and thus are
tentatively going into the 6.8 tree.  I've applied them onto our 6.5
tree, but they should apply cleanly to 6.6 also.

--=20
Patrick Williams

--fecJhlc5oECGkGHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVvx6cACgkQqwNHzC0A
wRmJbRAAmN56zFO3/Qcqj116ELd85rr71SydHu7HJrv58MxJqn+nfajNeJZn8Rt/
ZYbeXng/zeG1/gWrfADP/wiK7IF/OQCu4iqtQ3IUSwpkNfQDVZ10GEzlM9ythyYD
9KADvnHhibH8Ts1pjIUpYMNwPv8e+6p/+LVLiOtM+4jGe64kuaREwORhLyPc9JLP
qF7GxQqM1hPdQ1AeDfIwdH98kqmkezuSh5deuNb0IzcUsvNDJwUvuy5CXbFPcGIg
rUOKKAFVrN9cEYQSlv/kKo5w56HsAQBi5c4Y7CGwrbc0FUdDRjrB4gxcDylIjHfB
dbSaK08tkYCrrzl03aY7FYM+1/p+tePwI/Jel0Fm5VELuUlRiEs849D1QOfrmx1e
JsQHus3/+poLZ046ozk9WhWKDMJJxJjcsWbweCDPzqpIQw0dvLbWwRXi+NZjgSmI
z7U2PR9cHPc15tK7NPbcWDJvsDMYMbKEwT8pB1NJwHoanV91gK+jZRfXonOPvLQo
+mivICPIzgG2On3wnZ8gw9s+VYTUFwqmO/5L4sxjYZqaFyNvZwewGlHxuqYTyTHf
xMHSNZoLMtgr1MU096+qvbHekq7ZxRa9vccq8dNZtuX/BuALwQm64bZfmVHGO/qF
OG709FgQow4JlsIHk8/mxwl3koF8d95ePyBcu/Y726uUosWA5os=
=IYT2
-----END PGP SIGNATURE-----

--fecJhlc5oECGkGHq--
