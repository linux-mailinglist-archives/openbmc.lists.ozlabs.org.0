Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02C3DE390
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 02:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdwhG33xmz30Dd
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 10:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=bZewiS8S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EXf/UiqT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=bZewiS8S; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EXf/UiqT; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gdwgt6JQdz2ydS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 10:27:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 23C8B5C0056;
 Mon,  2 Aug 2021 20:27:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 02 Aug 2021 20:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=kAS7Zjo76WfE/8vJss3ydl4N+Qa
 lx0eUBUhMQgPGlxs=; b=bZewiS8SvMWoarsjg+6BfH/TxwIWwkyJueY8HmfpocM
 28oRXa2G5APe0ePbF+HJtgvJZm+HYQyPKRynwe5/FRSguk8aS3xba3rQh3aLmh6K
 8SFCKWjGnSwqLGJQRZaU5GeYA59YBPDuD+bM1m2py5Vbu5IJWePBpE/0G6gwTIhd
 udPMAqYjf5wrQoo+QGfjwX0gmkALl10y8x0eELtGpPWyzfRO7lgnOInpOG08l8D7
 If55b1uYOyrNNi6TbCPmBJyK1HiH+P/niQqkqUfmvwWCIcgP3sXIHEFqYiZXu8z3
 iCMa45fGYyhijkh1w7Bwkp4AneSDca5J8EkkhB+KLjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kAS7Zj
 o76WfE/8vJss3ydl4N+Qalx0eUBUhMQgPGlxs=; b=EXf/UiqTOrMR26tsF/+kHY
 zY9rBfHLmx5mbNruaTzN0iQ5GVg/AoiHd7IxspOhE1dxZeTE957PUfepINee0/G/
 5adfllVffUgl4gCHPbHFFbDL+2sGPfxd+W6iIpWabRQ2QXOmsNNr7FZP4SQ8a5fW
 lL88OyOKvA1mad9rU4YOUtOQFgsnVo6Zi6G2CX/D7A7KDgeIeuHo3/agpP5LW8YV
 AKK79oOP612rSkJlFXcHK899GOHDSbFyiKIpj5HJ3wm14ZYdNBOmRfzuq5AR4v3y
 A4ea3C3SXRiT/sN/eV2S8LIZMKmAdTtUrC3Bs9rf+NvLUjBX/lElTUH1NzkUEIDg
 ==
X-ME-Sender: <xms:hY0IYYTEvLtJoRuwaKn7ytcD0TIuFM_FxI-OnrscekaMzvIrPuE8lA>
 <xme:hY0IYVxglHG1o3KklkCQtOZaCp2ZmhO00-v_jx7ok_3iLVFBTfRmGqwIx-A0Oz7fH
 9vLNmmbpMsm-J79Qbw>
X-ME-Received: <xmr:hY0IYV0H8D7EBTgn_95uUfwCyQKZ0hy8yguH4o4062o2KuMD-h9Tby6dZyD1u30Oi9eJqvxVhpky22A2G2W5vNyoCYGufmllEuGBp-FgFQRgjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:hY0IYcAccCeMBccqX-7_iC0Z-Sv9LhDPWsn-_dLOS4rwSfdXvnejEQ>
 <xmx:hY0IYRiC1MHcasKGqdtJIuuTR8exacIzSlLWq0frlT6jpAdZRgFepQ>
 <xmx:hY0IYYqQY7PfTKlXyrvurZ5KCmiudNxgyeOZ8wATkFqmBHBu8UH_vA>
 <xmx:ho0IYRLTQS2ZUrX4hkdVlGNJ2rglJaS_boJX5P0ss1qLhvi6F0vbzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Aug 2021 20:27:49 -0400 (EDT)
Date: Mon, 2 Aug 2021 19:27:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: `phosphor-logging` APIs (RFC)
Message-ID: <YQiNg9cxRgNe4sFV@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
 <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
 <YQD4TWus75QQjH3U@heinlein>
 <e1b41c2e-bcad-4282-a3b9-8f5344cab056@www.fastmail.com>
 <YQIYE4yH7IcGIrjd@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ziiCildB6JiLxD+m"
Content-Disposition: inline
In-Reply-To: <YQIYE4yH7IcGIrjd@heinlein>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ziiCildB6JiLxD+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 09:53:07PM -0500, Patrick Williams wrote:
>=20
>   error("Hit {ERROR} during {STAGE}.", "ERROR", "bad foobar", "STAGE",
>         "baz-grae", "EXTRA", 123);
>=20

I have implemented this formatting handling, since more people seemed to wa=
nt
it, and also added compile-time confirmation that the keys match
systemd-journald requirements.  Patch sequence is all updated to resolve any
outstanding review comments.

--=20
Patrick Williams

--ziiCildB6JiLxD+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEIjYIACgkQqwNHzC0A
wRm1tA//YRIRYXKrKmfTJJlSy2mkcWa2X8L7XuzSUz2UTuCzgolBp890v39lONOb
QZod50G8stpTZRUhTPsj24XJE+rYvFWiamRns7auk0GNddUhqGAdePaQzEiEeMI5
HijCQY56/Ltu05jtNXm4Nj/NFyU+pPifldECJc9Dp6SFzn8ydzMlFB+m+pivp8n/
zcNJr0kTjW9vZ33xqdwwnRFtea9ZnphvUzhhDzka7t9liXywArQX6WiS2wDLg+Iu
TB0TIG0zojE4ofie2AUnE8e2IyBB7YHxSkU6FdrSVz5DhRHFUy6Wc3TDjycvkRQ4
4aJ3VSHJpQetnLzL4O8k/bsG7cEKIhLBcsoayXjX3xCXjnm0rUWNipauaFF4lJYU
fg3nkb9Tx72flarZDXZWh6GmoZFv0/2zHJeqeQj+vxeCsQ4vhgNGbN2/48Ptzpju
Js9wzfIVHLchYb6fnrE7qCLgSlIMKUvdWX5KAE6vKzizOpJKmFsGND1Ud9kwmWwK
WsTyPuwL7BSLF5oulDnrFfHVHC+2SrtpgWeTvbEq9rhnx415EHsDDJmyqYg+Tj1V
D5Y13w9gyrqZKfySwSUBgR2uTK/49RNbKVyySVNmYmZEpbAWgnSf5VJ6Vr5Z0lqU
zWxl5+FEoL9FXm5TrUqC/9256D3qA55cPLrQm3uAtUZUg8OsU8g=
=z4g8
-----END PGP SIGNATURE-----

--ziiCildB6JiLxD+m--
