Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA793D9BEF
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 04:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZw8J1cf3z3cKs
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 12:53:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=qekAq3h9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IRAoWMup;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=qekAq3h9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IRAoWMup; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZw7y4l93z2yy3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 12:53:18 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 3FD8F320084E;
 Wed, 28 Jul 2021 22:53:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 28 Jul 2021 22:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+eabnmVyukOvPmsgJIAbs+/t4UA
 vERS8uSAuTcgDKoU=; b=qekAq3h9vHbOlsan983P9EnvtqCiHnCJKjZvSK6uZPe
 khSdtWCNy+Vk5/xW+RShEhbjoJIdAcBPlNxsDXfhETA39U4SEnwP60eVa3O1MQqb
 K750TNBxkhnSKo2dzUriMUsxNSN856/cQxBsI/OuKDgKcRKlYTXOP9BW9IDFm1Za
 T95n8xc53ZbSRn27p105FpKgy/tr0fPtcmV2tj6M2F/LuBErMrFHI/I5nI9B5sli
 egjGqJiDv0ibDqd0VuuEpMFLRhLOh2zCAJKnOYGgquhw0z20JM+P+gVBP6IY/Z8/
 H+0O5SukQveXU0Z4+Tl8nzuYNGtfxIj2Qjzg4ueT87A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+eabnm
 VyukOvPmsgJIAbs+/t4UAvERS8uSAuTcgDKoU=; b=IRAoWMupMcJo8KSD/Y7bE0
 bCZa6rnoJyGb5Qv0ZFRCXE7Kaey9LXySWvzhwTptWr/Y50/KrVmlwWbuKMtEyCuj
 jzi0fl506X+xk+dWgchz3JUQocY6ySVgoeetbODnTAlAyJSQ+1fjoFZV/LB+ZXPc
 AWWdZEvtkGM3HhVtAf1fHQwjeimweGYXJEbEkMUNRGYYbDq41EwQrNhmvTJy48LJ
 fG5xpWfZNgI/Ea0Dq/f5IHykDXi5n0k+fcTHfDU+GYW58PkB8elo54o1vZEDZ9kJ
 JP4W+exKpeVhTLRIAyLSo/J2NlObeCcRJ5HawBemB6HvC3n8BSoZJrfDCV0SsXBw
 ==
X-ME-Sender: <xms:FRgCYUD9XWgxYLIlAQ6R5pv2dBqQ_FBYwXN1ZBC3C_fORqgRha7FAA>
 <xme:FRgCYWhwgiD16TEJWyJaUT3QsXbs5rbWwG9jo4XkoIpMng_eowQKYubKB68RfTot0
 MS2vlwwCP8jNaY3ld4>
X-ME-Received: <xmr:FRgCYXmkx8_dSy5Rkpz7sjUGDjcPmQLBdXsDD_jj49txQKXcn9UxDsX8PNYchTEEvM8JnASIuZKX37S5BjvB0kruCO6VG8jgcUhffxuFGmd0Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehgfduffeugfehuedvgeekkeetheek
 jeejudegueevgedvuddtieekteefgefhheenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpshhtrhhutghtuhhrvgguqdhlohhgghhinhhgrdhmugenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:FRgCYawpNai7qB1-QRqIZzZeoFjI-LHu3BuFZXdo_c42teJT1nVk5Q>
 <xmx:FRgCYZQK5zCWc-A_CfcHeiLpUnuF-lVqj1CvaE1B5ubyyXMYRc7lXw>
 <xmx:FRgCYVYVN_-q5yKSZq75tH_lzgODh0WeLRsLvZ-jlafKjRYyLpf2wQ>
 <xmx:FRgCYa53rdxgij8ejy9YyhnE7eKe8pg-lZfWUgXDwyikKO5YRWz2AA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 22:53:09 -0400 (EDT)
Date: Wed, 28 Jul 2021 21:53:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: `phosphor-logging` APIs (RFC)
Message-ID: <YQIYE4yH7IcGIrjd@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
 <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
 <YQD4TWus75QQjH3U@heinlein>
 <e1b41c2e-bcad-4282-a3b9-8f5344cab056@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IrO7M27xFVThdUCe"
Content-Disposition: inline
In-Reply-To: <e1b41c2e-bcad-4282-a3b9-8f5344cab056@www.fastmail.com>
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


--IrO7M27xFVThdUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 09:04:14AM +0930, Andrew Jeffery wrote:
> I've left a comment on the patch:
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45310/1/d=
ocs/structured-logging.md#60
>=20
> But duplicating that here, how I'd like to use the API and what I'd=20
> like to see in the resulting journal message is:
>=20
> ```
> value =3D "xyz.openbmc_project.EntityManager";
> lg2::error("Error talking to {ENTITY} error code is {ERRNO}", "ENTITY", v=
alue, "ERRNO", 2);
> ```

Thanks for the description.  What you've proposed is at least able to be
compiled and wouldn't increase the call-site code footprint at all.  It wou=
ld
have more work in the [common] code that translates from the lg2 API format=
 to
systemd, but it isn't outrageous and is fairly straight-forward to implement
at this point.

So far there are 3 approaches on the table:

```

a. Yours.

  error("Hit {ERROR} during {STAGE}.", "ERROR", "bad foobar", "STAGE",
        "baz-grae", "EXTRA", 123);

->

  MESSAGE=3D"Hit bad foobar during baz-grae."
  ERROR=3D"bad foobar"
  STAGE=3D"baz-grae"
  EXTRA=3D123

b. opt-in processing

  error("Hit error during processing.", "ERROR", primary, "bad foobar",
        "STAGE", primary, "baz-grae", "EXTRA", 123);

->

  MESSAGE=3D"Hit error during processing. ERROR=3Dbad foobar STAGE=3Dbaz-gr=
ae"
  ERROR=3D"bad foobar"
  STAGE=3D"baz-grae"
  EXTRA=3D123

c. opt-out processing

  error("Hit error during processing.", "ERROR", "bad foobar", "STAGE",
        "baz-grae", "EXTRA", quiet, 123);

->

  MESSAGE=3D"Hit error during processing. ERROR=3Dbad foobar STAGE=3Dbaz-gr=
ae"           =20
  ERROR=3D"bad foobar"                                                     =
           =20
  STAGE=3D"baz-grae"                                                       =
      =20
  EXTRA=3D123=20

```

Based on my experience trying to apply lg2 to a reasonable sample[1], (b)
seems rather verbose.  We're going to end up with most developers just
adding a `primary` on each data entry anyhow, so it is kind of pointless.

Both (a) and (c) are relatively succinct.  (a) has the advantage of being
slightly more human-friendly, but at a disadvantage of worse performance and
redundant tag identification (which cannot be checked at compile time eithe=
r).
(c) is faster, has no redundancy, and is consistently structured, but is
slightly less human readable.

My question would be is if (a) is really that much better from a human
perspective to warrant the extra processing and redundancy (and thus potent=
ial
programming errors introduced by tag mismatches)?  To me, (c) provides all =
the
same information with only minimal readability impact and certainly better
performing.

> Better yet would be if we could just forward the format string and=20
> journalctl renders this at invocation time, but we'd need to work with=20
> upstream on that.

I kind of doubt they'd be interesting in absorbing this kind of string
formatting into the library, but maybe I'm wrong.

1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-virtual-sensor/+/4=
5353/1/virtualSensor.cpp=20

--=20
Patrick Williams

--IrO7M27xFVThdUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmECGBEACgkQqwNHzC0A
wRkzWQ//V6aGLPY0aPJplKs5DZBpq9SiI4CT7PGfGQcuVyP6Z8GMOX4rU9u4WogR
FRkBK8mAeasQ1zxP31RGiwGQ3T6slU1D+UGeKW5pOdtxwN6fJTW1j8v+vNFCi/Fg
Xr3XSIKGH8iBo+YaW+b1G8Bzob8js521guZlhDUu2rTeB2LnKTdmIDYq1qTg/O25
+l3GEslAaEl7B736qlanlaKSHuObiEkkQf5K9VFtvVMM591z7zM5OwF356Tp/5Go
AsNXKP6VplDz0nJkAaOIqQZOFueO4R/IrvZZaUGm/UWZukMBA/nQSmTfzi/5XseG
9QkWcu0qWs7dQAcvlq1L2g7HSm/UKr2GjOpPSEszVCbT4Tgj+gCoTd+8zhMYhT4c
WKUJhH83pCwOonSAiuRixm9A9OP7d+s5m2oEHeM7ZXyqh/am5znLY7dxDHHQJk1T
vVdiu0tyPFvsofeVHTUmTYczALrlUckOGvhb8Fc5bA1OjN+m4vfcPAkPKGXMXBFT
ctfIq1tQLXGl+QnQOiS2yD4oLQ3g45BTYWgz9F82TGNZ4jFBd1NfbjTWsycFYK6L
Pvfir+sN+nuzk0bliGhIedyAQY7KnZ6XEeb/rim1xcfDfW43/c7qszIp+wiybw+l
vWYLDrdA/LLcTWPC+YWPxI9lyFBEC/SoI5l7JKOT8mj9zR5hp7c=
=3enG
-----END PGP SIGNATURE-----

--IrO7M27xFVThdUCe--
