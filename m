Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90486C2F42
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 11:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgp7K56HPz3cTC
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 21:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=OYa8UmAW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QJpc2vs8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=OYa8UmAW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QJpc2vs8;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgp6Y2pDfz2ypJ
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 21:40:52 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 811033200C46;
	Tue, 21 Mar 2023 06:40:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 06:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679395242; x=1679481642; bh=3y
	OXalLRxPQ3EFxu2fWMBeaOlADZvQt15Ot7ayH1cYg=; b=OYa8UmAWNfyQ2uZkZr
	sTiy4ip+TyGIOpBk4RthwitZRXiNaFsVt55I56VXTFjDD+1ufWppxOwyzE5OJIZl
	mJAM1mKfFho5fkslnUdbB5/ZqKvxLjKnCj/Na/64sfQCeAmHcphpTcJ5DyLEpO1y
	nn37w70gzQzYcXIlt8VMoGYJGn9vD+kj/KmdOzjkZrdj8tcPkdWYkjAT6HMIfG1U
	6eYuHVBwDHCwRy1IKpocDvMqxrl50Tdy3+jugM9/4mq9t6qwnbXvSWbY+G2tp3Ee
	Sd/B9u0ZMeAfPCkMb9PVo6v/KjhjYQ7Xoky5TAwBJK0F4IzwvMipwiTes5Td8Pob
	kmUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679395242; x=1679481642; bh=3yOXalLRxPQ3E
	Fxu2fWMBeaOlADZvQt15Ot7ayH1cYg=; b=QJpc2vs8fBkzJf/ACsgqTvpO7W+As
	tgUyJHTY/QedfylJ37RXt7AD52xb+I2UFxZIKZPG0X0vuUBgxpfVCTSsMsPl/4YY
	t78HTKR/XsFErJLt3MjGrTehYv4dEEue7uL3TbtxjJJlKAZJFg3HNcXHRVIcr8bV
	le7+Z3PGsqaHKPuUDaaQ+Qxc+/zgS11FneW4+nc1WZCS0JM9TN/WvAXXcxfHuiSR
	6ycMLA7rJ1MftmOJlA0JO3hSclhPzpit+W2kvGct7v6mh5tFmeo71puwHxzQ8o4j
	8ZV6SU7SLzYkhjySmAjgB335IiY0AkXZAhG9T6NZWe4MEZqwj7xS9q92A==
X-ME-Sender: <xms:qYkZZHCPiZWclVk_vP2keiPWxAcoDCbn6e1FlNI96OvqipDU56A2vQ>
    <xme:qYkZZNjOpuVYFrjc9eBWSG9eivUOB_jOqZv1Jqw2w3OhxJ5PEUnROoWvAaqlJmf5R
    ULZZ6AkHvt7C_m5EUI>
X-ME-Received: <xmr:qYkZZCl6XJwxeSlIoNOON0cJ9ysJ02224T4Bq8IdjsBr6Bn4u3_oM9IC57i_YXvrSHqRaa16s78qzpLhK4UybX9yI3oPDiXp_Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:qYkZZJxF0BlGZrfk9WG0Rg6I87IVhA08iteNGGLQZ9lro_wMfAQDNA>
    <xmx:qYkZZMSPS8wXKte6zTngw7Mce07yWHZD8iwt68JQl4rQhcKAEYw2Rg>
    <xmx:qYkZZMbq7OC0bQ7EvaN7c9M3COlY8S_rXvxamvDz_6xDpsEONHQS0w>
    <xmx:qokZZCMh75mcJiwq9mnBl1l-HgxDGdZYzGJnHqYtPvCQBX-f-uA2GA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:40:41 -0400 (EDT)
Date: Tue, 21 Mar 2023 05:40:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [RFC] BMC RAS Feature
Message-ID: <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zc8VgI/bUVJFwLWl"
Content-Disposition: inline
In-Reply-To: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
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
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com, Abinaya.Dhandapani@amd.com, Michael Shen <gpgpgp@google.com>, ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zc8VgI/bUVJFwLWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:

> #### Alternatives Considered
>=20
> In-band mechanisms using System Management Mode (SMM) exists.
>=20
> However, out of band method to gather RAS data is processor specific.
>=20

How does this compare with existing implementations in
phosphor-debug-collector.  I believe there was some attempt to extend
P-D-C previously to handle Intel's crashdump behavior.  The repository
currently handles IBM's processors, I think, or maybe that is covered by
openpower-debug-collector.

In any case, I think you should look at the existing D-Bus interfaces
(and associated Redfish implementation) of these repositories and
determine if you can use those approaches (or document why now).

--=20
Patrick Williams

--zc8VgI/bUVJFwLWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQZiaUACgkQqwNHzC0A
wRn/Nw//bit1z7wU9SIGR4CagG94ygxbRcFwNHNr92Jdz5LH/jlQrQDTWV/ElwWW
4uxDKPkOnMI8wssegNaYcyA3AbxtKS1sYnsvnS46uGTw8kxnbKFBVtESzW6kLHBU
cBIfpynhpJ8xrzkz5PRpg0Hm1O7VLE3Qxp7Wj+oqmKxeaRI6bmWLrPR5cOEORFFe
aVRwsFD9JZUlULfled90US943pjwW0iJsijKlJgVoZBuyxFWiGOBRMSff3Z87x7r
vkY/d6CwY1/APXGGZznqrywQpx/6n8nhz0ReFMGdWuYF0hoFqgyOzK58LYIzIr6r
rXqJH5bwPxDMcnOmk/NlMuqu+Bw/ywdCIyvBdJ94O2S3OqExPj2dqh2wsdEoWhF5
En14PaRk7iqG5UUWwn+nx+9/xqekzL4pLQHCQGrtdRiMhgcQcCP1O2D0gSowgg7M
aB3uAGEW9xy1ERkUWTvjmbbW6lp9bfxW1eHXb/jO28S0cuD0N3pI5eF5mc5Ud/u6
zwVw0HkN4GhDbJAH/L6EGK0n5uniNoIh76UzJYq39HFNqVOPCcyVVoelVsiXWwlc
Xc58eIlaQA77gP8IzUGFsY2KXP3NDXloqvAlfx59jH8ZcjTJIVvDHgtyo0AT1FFL
umk9CTD2VzhBy0xu8YeD6vS0r5yHl2j0i4DqUASoWp/LoBhVyqo=
=Y2aa
-----END PGP SIGNATURE-----

--zc8VgI/bUVJFwLWl--
