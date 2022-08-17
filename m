Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3890597615
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 20:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7HLp4hvGz3c3W
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 04:57:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=evR7JtUQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a5vweFX4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=evR7JtUQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a5vweFX4;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7HLH50P5z3052
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 04:56:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 062A45C0127;
	Wed, 17 Aug 2022 14:56:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 17 Aug 2022 14:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660762594; x=1660848994; bh=mPkaRby/cZ
	qVSl7YUqz3SsNLUxdtwVwfz2CBaA0lzMo=; b=evR7JtUQBjBs5fAUO9UA1Bpc8b
	kNrR1dyhNTtAF8Wz+xfBz1ylahWqCGb82QDZiQpUZi5CqOrnBTl/3Q6w9yWoTYyc
	Owh7H3iLznM7SlavANP94OUjRJmP8VZ1dsuWzOtsGOAI3tranRfFFiljgRGY912A
	LRfUMtnrlJdfMkNuAkjcNAoThYwxQGOu4hzrSPGiLrq3bX7b2A/O5JSpvBJb9R3z
	J3iZDe0iiw42TvB0ToiERNZO/AVN7RuNEqpQfey3ZCMbpJXq2R4QSy2odJwp67eo
	JkST5EjM9EOWN2VpcYBm0UMeF6/tUtZiBs49yT1bRzt9cz2cdLwA6UL1bmGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660762594; x=1660848994; bh=mPkaRby/cZqVSl7YUqz3SsNLUxdt
	wVwfz2CBaA0lzMo=; b=a5vweFX4QtQrkncJjCiRgCM9LClcvbG02O3Gq1b7dxH9
	ZYew7Lf7zx7xpYKDY9tMmFWI7MOkCr9FfJONpals4okRJHxOgqTv8riqdFz4it5B
	vMT+D29pCbxyZa41pnsz49BPvBKjkgrWeiE16LB56RmeZZ8bXjFetbZAMYKMsdrc
	2mFB69kOZ+xpgq7prPSUaths/fe6MJGpEQgrB79jDOpLx6wGmR1KKAfcZB9arR/6
	4nMktYP7Z83+RTLU8LCrHesX1kJDY5FCJpa9vhjZeiSm2KTqzfbFtgukITVmS3C6
	xmRVvJtaj82s98eX31obGNpxomGdSs05C5r0wswfWQ==
X-ME-Sender: <xms:4Tn9YlnBWQhjlUvmIeuiloYzXSEr0CmHz8G8B33pjjN05d2oybuASw>
    <xme:4Tn9Yg1l7-U4mZ2to2b1JRF2JnH-TPeYKBzYiNnnPhQQ5vV0Qdaz9ZfZtwB2GjX38
    WNYtpiqggVH4EUDXc4>
X-ME-Received: <xmr:4Tn9YroMFGFBUeALFa05vnJkWg5WDTBzuENFaA4615r3DZeFQpEBw0r04M3yPxO-3YB575zxjCVFF_hqUiKn7wIUNd5QrQ7V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepffekudelvdffffelieevgfej
    jeffgeektdffgfejuddujeejjeffieehfeduvdeinecuffhomhgrihhnpeguihhstghorh
    gurdhgghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4Tn9YlnzU6Wum9KAFbZwqxzy3G54aTOQY6wUg7uf7cucV3TQkKTa3A>
    <xmx:4Tn9Yj1XsJEVIW0cIMOCO9RiFL0SdDpiZQiUB2nSR-KGLplQvi77GA>
    <xmx:4Tn9YkuPmEli1adEDy7bjY7vkufiLTfyCntRJPB2q28_4wXH5e4aQA>
    <xmx:4jn9Yg9HrHyt3YOuwHqwi72scjZteoogh9f9pg8dEMCp7jw6CLBTzg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 14:56:33 -0400 (EDT)
Date: Wed, 17 Aug 2022 13:56:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nick Rivers <nicholas.rivers1984@gmail.com>
Subject: Re: Why do Discord accounts that have sat idle for a while get
 removed from Discord: https://discord.gg/69Km47zH98?
Message-ID: <Yv053wgSmCsLmUpm@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAHzptbK3Aq=O9Frf9rRKJp2czqB=wg3D0d1yAq1ps85KGV=sZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TPx0VvI2lHnb5YOD"
Content-Disposition: inline
In-Reply-To: <CAHzptbK3Aq=O9Frf9rRKJp2czqB=wg3D0d1yAq1ps85KGV=sZA@mail.gmail.com>
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


--TPx0VvI2lHnb5YOD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 10:57:23AM -0700, Nick Rivers wrote:
> Why do Discord accounts that have sat idle for a while get removed from
> Discord: https://discord.gg/69Km47zH98 ?
>=20
> This doesn't seem in alignment with other community forums.

I'll copy what I wrote on Discord about this earlier today as well:
---
Those accounts are =E2=80=9Cremoved=E2=80=9D in the sense that they don=E2=
=80=99t show up on the
active members list but nobody is kicked/banned.  You should be able to fol=
low
the permanent invite we have and reactivate.

We=E2=80=99ve had a problem with people [accidentally] creating multiple ac=
counts
with the same name, which can make it difficult to @ the right person.  Dis=
cord
has an easy way to have the server prune anyone which hasn=E2=80=99t used D=
iscord in
the last 30 days and I enabled that option, primarily as a way to prune tho=
se
duplicate accounts.
---

So, if you haven't opened the Discord application on any device in the
last 30 days, there is a chance you will get pruned.  Just follow the
link and you will get re-added.

--=20
Patrick Williams

--TPx0VvI2lHnb5YOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmL9Od4ACgkQqwNHzC0A
wRnehxAAiGgJtOJrsMzQSlEpAp9JS5MT01BOv/nCY2X0/SJ+uJDAifVQDRp0+MDN
+SoBIgEKde/ULcnUUIp8cWP95g1GMcwdDDwWWKOgaL8GGoUB3mdeeGiTTmUuuWUD
+1PUv2EuuWFQFVEnRqVUKSN5ny6OK3wbEnndp1wIF0h55bj9gQIZhaMbH3InPZqH
uA0Qz0NSSwwzHoNhmGWdhUVSB7ErA8acT3qPbvUe5eD23DGdITWXhxKs4KUowsIj
5C4eeG+MLQ0hGo+bCCUqmaAlxtCzj4MmNBIrOIDIpFWPFJQrYnhKyHAUUGv9GkYW
85PYRCdrmnZVDU/P8erUU8cTLPduY39zq3/pIoE6uy3n4r/g6qIxzUzDEoXBFsMr
s0y7Rp5z9KB5R9hrHkyxVtYIv5hLPnKRMDumjpP/07whZaG3U3XxZq51lEndjT+q
jdXJi39SBuYVefLI6h/3JSOB3R2xlrOFZkzMFgU+ALXQdONVssf84p8GRQmu7xfT
UOOPiFmG6woIIu/fVnHdrqqPK1e86imEeKLSboGN1UJCc080e0IusMa0aUW8Eh+0
3sFxcXLErAJZxTe1gh/oBck0Uz5FzXOx8L7c1+3Cf57Qvq/4g+ED51w4KWzumL1y
9F+kAqgzYsw1U9tZvzIpjV0QEZcBcCvbEKenIZweFrd+at6VRjo=
=0eIv
-----END PGP SIGNATURE-----

--TPx0VvI2lHnb5YOD--
