Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA73E092B
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 22:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg2sp0NrXz3cKk
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 06:10:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=M5HqCw8Y;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=v0thZ9lo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=M5HqCw8Y; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=v0thZ9lo; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg2sR54LHz30Gr
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 06:10:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 31B095C0167;
 Wed,  4 Aug 2021 16:09:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 04 Aug 2021 16:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7ffii1HwqfEZOzOOcqks8kAaHbC
 qE9fF25XPP5Q3ETk=; b=M5HqCw8YXNsN3Iv/85TSaS+UZQeS63DEadEShgRkpx1
 yd7GjOl/cFVRBA25IeN2SX2TNft1+j2MmOXkudVG5JN0gGaicWkAZMqPGlmhIC5a
 HQ6zAaeAG+DNw7UL349cOmbejRkzCVAI+POOLfCCwRpsu8bxFuwxgBaonLXyAitq
 cYx/CgFeoyxsJyK8b2XR+TBLanSHnU0OWTBYGWLiMHOyzZ446fHm2w2QH98dsbss
 +/AzZzNJRdmtkVuAw55zknL0Snyc+cru/h4ffAqIIbLbVNnl84W8UaVJ6uu7s+JO
 ZYjezb4MhcNf4oU0zJNmU2+Rsz7kw3FNmmyWFDTmGUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7ffii1
 HwqfEZOzOOcqks8kAaHbCqE9fF25XPP5Q3ETk=; b=v0thZ9lopR6U76Ei0VhwTU
 iucpuycJBTKDEcNjK8P55KLmC6FNqyQj+ZaUb9c8PlG+T21nKFqCZsYhm4zRFixV
 WJVn5J+5eC1bIe9KWCwn3sS3h3Lw3zJc6byNHKlPg4CQsFQAP3RNGkqDI3JOc4oZ
 djOyxTPGriRDlRo/GIZ0Bs/h6vsvsECwOJV1a3/HSk9BM6VZfnmI3mz97w0QHtVz
 1HaMhODZ69CkEQqU/y59MtdBYOOPQXDDXZy5Eosz66JmywVTuORf1iy1s8G7WCZ5
 ScwHrN3G4L5dFnDpGqzOFYIDrBwpVCWh1Zlhbt1XS+e/SLMWpQlp15dHStjdWo/A
 ==
X-ME-Sender: <xms:FfQKYUvrjMFZ7sasOuSdEq9nEaEAJO6Av134WCGC4Jzp8e4Ax3mtRA>
 <xme:FfQKYRetfz-63on7tKZGIMtn2dc3oWq9WoBuLCeCrzaosGOzBhry2GEw-hZyKOGjh
 T9g8N98JKburPBn7GE>
X-ME-Received: <xmr:FfQKYfy0czlBAeqmy6C5VPG8TTkdc3QkoEo9qwHWwHtLsdq-dXtXJFBmhjf6EVzl6PYRqgIwrSRnz4I-Of4flMQDbsGMyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieejgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdejleeuveehfffgieekjefhvdfh
 tdelkedvtdfgfeduheeukedtvdettdfgieetnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:FfQKYXPjERDxQhnwdpKFEHQFWoTa0LeN1afoXBwKFU00g_QWtR2L9g>
 <xmx:FfQKYU_uPo475WTViEXa0NC7hycRf9DOowMbxdQoX73WZdGz5Ja5lQ>
 <xmx:FfQKYfUNoc5rlZgr5ORLQCLLMQ6d696xuC09TCpKyYgKGfVBkA67mA>
 <xmx:FvQKYSnKiJbctd9BNT48MohOVvCaA5fWYmpZ9s23DC3DlsafE26vNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Aug 2021 16:09:56 -0400 (EDT)
Date: Wed, 4 Aug 2021 15:09:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
Message-ID: <YQr0E+NP+7QKIrf1@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZQrOXo3h9oaW+u6E"
Content-Disposition: inline
In-Reply-To: <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ZQrOXo3h9oaW+u6E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
=20
> 4 Surya set up a bugzilla within Intel and will administer it.=C2=A0 Demo=
=E2=80=99d=20
> the database. We briefly examined the database fields and agreed it=20
> looks like a good start.
>=20

Once again I'll ask ***WHY***??!?

https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/

Can we please create a private Github repository and be done with this topi=
c?

--=20
Patrick Williams

--ZQrOXo3h9oaW+u6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEK9BEACgkQqwNHzC0A
wRl7gw//RUjobLZamyijaTSh61tk3cUUFmw6jeixV9fLdx7bzrPD0it8DQH4kwmA
wn6r38RqiEzHhWZ8TfCjNhy9/5oDs4GGtjpskz+jE1EsaGw2XOptE/f9hdRHVIld
LCxIVaPCfkw4et832soKIdTpVIG58GuQQVYLtwMKleHQ8tWdwDU+RIVN23qyPTEB
JpKkAtmk0z7GBkIwuN4Gij281Ax/mla0ohINUIUasdxpj7PtS97VYeE7WGxabHtK
ZJUjS64Gtq6GEGBEKZAbOgbkXrz+W8DEOfMq2eoaVwGl3I5/1ijDtUa08BzozMJK
wwHsKu8QBNOCBKMJDKJi9K77m0V70oW/NVz13dXUCmIkWG/gxoERWsBVBfX+qOfV
jWnsrW5+xfZ4TfO/nnfUcOxbqZ5w0q5duSPE0amD+GU8gE+bPcWVP0JHvu7u58bn
OhYa1M1AopwkSkKwNC94QSHMnIkwYqHLUeFVttFjuGKTEpNrdLeyfMB6XsFJKafh
Fy1TkEryyuDysWxljSxcQWsvEYxnX6uSBp/yIjKE88oOTs6ztjb5DjLJWo37KnZf
555+yf1HLj90ytevFFLIevLlJq2K0E1HfErcZotYVqkGw/ZfHDvjtRwxcmYdxQ4w
mnn6etVyw6JBsO0tgbFIAtEgHD3hBsj05/6TWwOjCPfSRW4xNAU=
=PUft
-----END PGP SIGNATURE-----

--ZQrOXo3h9oaW+u6E--
