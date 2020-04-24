Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D01B7949
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 17:18:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497yV60BJtzDr2P
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 01:18:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=aeqkrth2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wTWVwNpb; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497yR40C9BzDqLR
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 01:15:27 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 5B758E24;
 Fri, 24 Apr 2020 11:15:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 24 Apr 2020 11:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fzaUEfDGd6dufLeg3k/GA7+vgx0
 Ed/KunrF2N47zx00=; b=aeqkrth2cOCMmSdeBdtfL9VYvf82WzW8eDKIv7I7YW4
 Og3o+T/WJjsz/MvT485CU41YoPLzrqmdzxkB9TDzWdv2FK6ulLPqctU3xj18L5TL
 oVu8JsvayGHydfBXDPdLPyw+sxIc0lspkgsoYf8/XcTN7UgVnXL20PFLyopIOVym
 KOClnQNVUu+MfUdpzo5ljVtZvyAiCRHU2wJcULAzJXK/jR11UH/2z9v9/QWvfdV/
 pJcrzgv2T+RZDVlwmOQBbExb4TwrwVjRskDVLx0XCYD0xKzM8DgIimaJxqzr5Tgi
 J1jd5sfbOND83JivSGND22iCFRuyPsvKkm/SyHaC7Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fzaUEf
 DGd6dufLeg3k/GA7+vgx0Ed/KunrF2N47zx00=; b=wTWVwNpbsrgUwB3O7rsvWg
 r9xLXCD748QprI/PH84iYXLMeDtMg1EKfstDi7lscNm7M1+LKIrXscKSTjSs6VQP
 S88zrj+cmIyV3A2coX8pM11BCtU70V1dc5BE3MVlpTQ+Dqt9SeoukgE2Q+D1llD2
 fYHiJqJF4ooYGeXDBZjS0GB1/9kcyRFXbE72baWls3hViM4DvZM8YBIV9UgoPoD+
 7uBkmaQpcSHSxCrZqRM7zMxtIxvCvibPM3Cmum6BbOdk0GsqSINvPHEHe1BO5zFF
 xlqOIg9Ui1ceuRi+NoxQ38DFKzub1EViJCCfR6Pp6envlm4R0zyMAngXL9zbmnsA
 ==
X-ME-Sender: <xms:jAKjXofVzAPzII6MxO9QuHqDjlaX1wNoITulhzf3dsu7pi2wahuqeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeiiedrudejiedruddvuddruddvfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:jAKjXsO77o_iP5Es8L8s4tzQ27s_zmf0d8ahdGWF04ba_OZtgUGNkg>
 <xmx:jAKjXt3YVakouISm-Z8rwWlCbwlMVzVaMbGfiRzgrmo9Oh7l22XiAQ>
 <xmx:jAKjXmIABO6BMpP7kEdvLBNGj6JgaJZ5kUEm-0zU_lArI9Zy-s_f0w>
 <xmx:jAKjXtshRxVbh0HPu80H1dCgQvWYb2imIgpBlJia1PiihRln1pyrKg>
Received: from localhost (mobile-166-176-121-123.mycingular.net
 [166.176.121.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1559B3065D9A;
 Fri, 24 Apr 2020 11:15:24 -0400 (EDT)
Date: Fri, 24 Apr 2020 10:15:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: ipmi password storage
Message-ID: <20200424151522.GC26818@heinlein.lan.stwcx.xyz>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <20200422113857.GC196148@heinlein.lan.stwcx.xyz>
 <20200422221943.GJ9295@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline
In-Reply-To: <20200422221943.GJ9295@mauery.jf.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 03:19:43PM -0700, Vernon Mauery wrote:
> Pros and cons of this new solution:
> Pros:
> 1) Obfuscates passwords more than currently. A hash is even harder to=20
> deal with than an encrypted file that has the key sitting right next to=
=20
> it.
> 2) Item one is a very strong plus
>=20
> Cons:
> 1) Would require us to write or hack up an HMAC that would work for us.=
=20
> This is not ideal; writing crypto stuff is generally best left to the=20
> experts. OpenSSL is trying harder and harder to hide its internal=20
> workings from its API, so extracting the hash state is hard. libTomCrypt=
=20
> allows you to do this easier, but still does not have an HMAC function=20
> that takes two partial hash states as inputs.

I don't think that the interfaces we'd be needing to use here will ever
be deprecated.  The "hash-resume" functions are needed in order to hash
very large files that cannot be fit in memory.  They're just too useful
to deprecate.

You are correct that we would be effectively implementing HMAC ourselves
using the SHA hash functions though.  It _seems_ straight-forward enough
though on the surface.

> 2) Is not backwards compatible with any of our current password storage=
=20
> mechanisms. This is workable, but would likely take some time to stage=20
> things so that they would work better without breaking everything.

Agreed, but it isn't any less backwards compatible than the obfuscation
proposal.  This could certainly be staged in with a compile flag that
keeps the old file around.  If a vendor is concerned about backwards
compatiblity they could enable that flag for a period of time until
their customers upgrade through the new support version.  (Disabled by
default in meta-phosphor).

> 3) We would need to store two hashes of each password for both SHA1 and=
=20
> SHA256, for a total of 4 states per password. This greatly reduces the=20
> effectiveness of the solution in the first place. Not that we are=20
> planning on adding MD5- or MD2-based cipher suites, but those would=20
> break the value of this completely.

Agree on keeping anything like MD5/MD2 out of it.

I'm not a cryptographic expert, but I'm not sure it "greatly reduces"
the effectiveness.  The addition of the SHA-2 state probably doesn't
help you reverse or collide the SHA-1 much at all, so this is only
slightly weaker than SHA-1 itself.

My reading on the SHA-1 algorithm would lead me to believe that SHA-1 state
is the same as SHA-1(password) itself.  Meaning, by doing this partial
hash we're not weaking the algorithm at all.

--=20
Patrick Williams

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6jAogACgkQqwNHzC0A
wRn4hg/+OYp8bLeQxb9T+IuPC4FLXvLMKdzNqX0V8QSO9bVCVZfghQJMojQ2bJNC
Jjom/6xo/mA2/mrEDA/Fb8hYnArhk75AWzVfF9UfY4iTNF1Y71RbjKxo1tICf9ip
bl+0cIurVyXveM4xJLi/dTKjnXI9FPh6gBBCXzN5Ll7W69lnOBn3hhiFD6ryHlTy
2yHkYCvIBhZuodpytuWrpcFIeOaigU9IVoPy4Q13zl5OOZ7BBPyUTKwfKBvQrDVV
Oqd4DLKciVhWteJOfkk0idJ2YKWY58hXEGhPhJoLYmUw7fsgTbO6/GW+gbKvsmZh
9x6S821efnqIFvlck10gaeeftbNpuN5joBjqqtb999a0kwWRY8Td4ctXFPqUuHpP
P1WOFq7cUEM6UpbRunedgAHRuoBQuUVuJhR5fE2u/JGe1cdTlXTCjvD2HHKJdfos
8mpfqlWP3NIOTsuF+P1wCy3B6wOHwz+5DmQYhZ20Og5YhPMxGpOTdMfBjrjGBDkp
xGPqiVIS5tJXJEw8bIF85uets9XvjkBXTdfgCYL6xxg4cjG8RfG19SJf50+iArsH
bp6tCyjchKcnTMchNYJtcy3ApBg0TeXtqjkYjrUhxNO8jtZHE9/RwrXjxsK3UbXR
1Fz4US5Lb2fYAp4kxjdmQrBvtCtSkGP171iE4h8yWEc8L2slBbE=
=MW1q
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
