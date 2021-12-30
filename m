Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E1481CA5
	for <lists+openbmc@lfdr.de>; Thu, 30 Dec 2021 14:52:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPqTm35V7z2yng
	for <lists+openbmc@lfdr.de>; Fri, 31 Dec 2021 00:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Mxn3KvZy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Ugq9yt+8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Mxn3KvZy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ugq9yt+8; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPqTG1GJzz2yMV
 for <openbmc@lists.ozlabs.org>; Fri, 31 Dec 2021 00:52:17 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 729B65C013B
 for <openbmc@lists.ozlabs.org>; Thu, 30 Dec 2021 08:52:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 30 Dec 2021 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=feBcfjHOx3vaqw6IeAIUjj3yq3CtJjTQ0bYuCGMgpv4=; b=Mxn3KvZy
 Ww8a4m7RzohinEY47FgkTtP0FMNpc58+4tSACRv13F/Bauq2g7B/+mZi1fwPv+MJ
 jqBfChoZwJBA4rOiRte6B9byUWRhN3PJE+AFFL38mmhsmsaaE5SEUrd2NbNbanz9
 1UAOC1ptEYYfD690Ah8asP3PfrZe+dBY1/q3s7cbzPwziQVVtuqEQgZzkLk+ODWx
 JPHFa8KySC7ydAF6LSRxdFqaQpVWIYh/P5Ob8hibrIkugSVub6rDG8ghueQ4btac
 dZzG63VhJk++VZpLap83PK561kxuhewW2dq+VpNIydzTL17Tk/vRfKj/rXZ1x5VA
 /725OoNN0v3A3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=feBcfjHOx3vaqw6IeAIUjj3yq3CtJ
 jTQ0bYuCGMgpv4=; b=Ugq9yt+8QxcsR+zrxTzDPeFkklNC+vvok7i4vdrkns9v7
 mfTUXfd7KZzjWn6sNy+EjKcw35vLI6+V4TG2imAdER0SrdylHJKjOWUE8Aj8kdj6
 5Ajt8rdCHDylQTtaTBWk1xnw1298+Ib+p68YgWQLmwblP0j52bnXyt/q09s41gBo
 6lz4ilKUiZhd4uN90bWu4Lb7uhK6aPtVpxsh0X9Ejn6c3a7JT5uMlc+JMolRxSOG
 RSQ1BS78dg4W3bXyzpx3Nh4abCY48W2BINXiiS8LJyrceF3zw9+lmlYb61MdpIWR
 XDWJJAPa0X9Yc8UCMo1ktwq+OEkSO2RgBIsPzCgSg==
X-ME-Sender: <xms:jLnNYWdEYuruB_TS6iRZfqShnbku3FSexky8BeoWLJVxNkG8eyFfmQ>
 <xme:jLnNYQPGNb66dPg6ZH17AaDkUe11cCCfBvjHMfC21DQvBvIkmBeIv8sZBxVB42ddI
 93ULaFaKQw37zF8unc>
X-ME-Received: <xmr:jLnNYXhZ8GivsI0dmFtsg2Jeh75F4fDeNxm61BGKqC8d9Dew05n-SU1zTNhsCgJtierCkITBSZC5ez5sHaxYi1dI1_rhw8wUehf9ECJor8JSQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvfedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudev
 jeffffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jLnNYT9UO27LZcD7ne1dH-eZJzdKCPX0y_3g1IvDKX9nPB-Ha9mG-Q>
 <xmx:jLnNYSs9S8URQSDQ1ZbBXWXGuzoaox8KMEZsOJGHSI5E_nN3s12A7w>
 <xmx:jLnNYaFJiMgZ6aEuzsNGB0uEFZe-zrDlLjq-XqcA5Natx8yZDx4SEw>
 <xmx:jLnNYT6WHdbHWbjNP6vyWokgZGrM3ipPVJJF5w3FlZh_MSdGOYPqpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 30 Dec 2021 08:52:11 -0500 (EST)
Date: Thu, 30 Dec 2021 07:52:10 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: meta-phosphor: enable `allow-root-login`?
Message-ID: <Yc25imp2cCDpyXNt@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fbA1gM+VZSHIN+iE"
Content-Disposition: inline
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


--fbA1gM+VZSHIN+iE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Looking for opinions, especially from security minded individuals...

In many of our `local.conf.sample` files we enable "debug-tweaks" but for
production builds this is probably not a good idea.  I had it turned off on=
 a
production build and ran into a case where we could not log in as root on S=
SH.
We debugged this down to missing the 'priv-admin' group for root, which is
typically enabled in `phosphor-rootfs-postcommands.bbclass` when either
"debug-tweaks" or "allow-root-login" is enabled.

I am currently enabling this IMAGE_FEATURE in meta-facebook to avoid having=
 this
happen again.  Is there any reason why we wouldn't want to enable it by def=
ault
in meta-phosphor?  There isn't really full support for non-root users in the
base systems anyhow, so is there anyone that wouldn't want "allow-root-logi=
n"
enabled by default?

I'm fine leaving this in meta-facebook, but I'm trying to prevent someone e=
lse
=66rom having the same issue for what seems like a default case presently.

1. https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/pho=
sphor-rootfs-postcommands.bbclass#L10

--=20
Patrick Williams

--fbA1gM+VZSHIN+iE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHNuYcACgkQqwNHzC0A
wRlTUQ//RD4XnmOJMF4rARPLwAmrnzXiUqvSy2S5rk/dXhj385txZO4AAmtDujwE
Xm3VZIzr+Ferc3TV74adVTtPWz/O9qjQAXOajSxdTr8vIOysVwXpiLCv5bQuWedY
oF4wRss2aV7J1bVmGkJDrveDs+TC96/3BQWQVgL4eK1v5rEydcnPm0CdW4xZB0Vd
xn6S2CahjDXJfyhZxkQywtI9Yr/g+XCTHZbTcTxWFdQfHzwtiFUTagRvH/PtVDFi
SCd+aYeYWBPIh/01knUlTAPzPrJqK8iXxe3K9Yy/rsIR8CHgvtCDxoYbzN8gIVLv
Op0jMH1rwri0jf/H3uGRPHooa+F3raXRtKX0mYVOfzzLRwy6YsRQnVCVt2C2zEyx
X3gI2SNnJhIjbvBq9wPxBUOlUgOOVOS3ZfP8HEQ/Nr7gtS40unatnRPeYIL8QnR0
I0y9GxnGNV+I9r1S7qOaziX4u/ICpmDDp08nIaCXw+e2t5AhQ8oRr9qIrapXeccr
GtUqtLwW5xY6C2+FBXU5TKPhs1nx5IxmRqeV4R0sulqp0lwfzfhpVppxoVTEqGBU
narSFaaZAGhI8PjIe7heur7bPQMx4rP8FplIPKVyY2riAjuTkb2woanZIxOBQcWn
D5nfMqsDqPRkgEy0S/YX4uMZLcqXeISUuVv7piMDI+SrWXaHDRk=
=4N2s
-----END PGP SIGNATURE-----

--fbA1gM+VZSHIN+iE--
