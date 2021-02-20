Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46C32064F
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 17:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjZMw4rN3z3cK3
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 03:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=aF3Wm+d+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sf4z2Lk7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=aF3Wm+d+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=sf4z2Lk7; 
 dkim-atps=neutral
X-Greylist: delayed 318 seconds by postgrey-1.36 at boromir;
 Sun, 21 Feb 2021 03:55:57 AEDT
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjZMd48Kgz30NC
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2021 03:55:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DB9FB5C00D9;
 Sat, 20 Feb 2021 11:50:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 20 Feb 2021 11:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=LkQ181ijEnNjBkUNSMXPmf9x1qe
 ycPpgIwZ6sIpLVUw=; b=aF3Wm+d+aSAv8o9bT2faaTntqOVxVms0njhvtX8dlzZ
 EOjOYFZFZNewrlUMkgY0zi68e7mseFmIqX3D/s5vhxti4gHWegW69APpN29cP3cW
 t6ioazLstmiKxeVhpK/FLDV+93pQigoRItVjriUdbGARS/RyB3kQuHxQ6GTJYRE4
 8t2riTuMvadscww78W7MTzCxmSXL5521zg4tBmslH8nRt4ajqYILrTQGY9QGdUtZ
 QyygN377A7rQLPoW1SP51Dc134tCWlWiUqBSzeNBW9SuwQmcwA4vt9CyJ2QPKVkQ
 fL0BFfz0qhI2cx0mYi7voQIwQGlKG0bC//o8FodqN0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LkQ181
 ijEnNjBkUNSMXPmf9x1qeycPpgIwZ6sIpLVUw=; b=sf4z2Lk7JK0PEUCGhFURvg
 17mtmciNp38OAHc6dupgZS+xuemqYkfZRjOX1zf/BzUMVk90IFUbhxaUQy6EhSSB
 6stBz8mmfL41hXq1pFrkCwKF5Uyb+AfNrG/45pzp4iCucbBy6LtCNhG+1UnuJCP+
 3zfxaeGMmUEdyTuyVnCb3tlVknXFtgpAWKoshqaB/DZIw43m9a6Qmxa9+rfBB81S
 50+0p3fQmcEtHvHVae1GfjyYwJqQ1wcQv137aWj9fCRtRxLrERPQ+0Q5pTPSFLoy
 5+yMcA3XMWvMSAMlehlHliPRjl0eQOQLpJsYwnxK8+M5hLopdWlOq+B+zBDBjJDQ
 ==
X-ME-Sender: <xms:2D0xYPJd8a-R1Gk503vriWUieaD3OsulUI8MHVijv0wgPbZIv8Seqg>
 <xme:2D0xYDKIOoNZH3XYPHcQ_QrSEXY-pV9AJ4UbOQbtZXTc5vJFMZUX23WKFonkQmoU6
 Fw58uwIL8idDLz9jR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeekgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdejueej
 ieektdetheelvdfhleehkeegvdeiveekhfenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:2D0xYHtBwVdsR7Qu1pjObzRp4TifMCFnvHr6Kvhf9mzvjY3B1QA6BA>
 <xmx:2D0xYIbPZEo1OqMQoNnkj1_1mcZ76KjsAlWdVDLDOnEGgZmd09wtTw>
 <xmx:2D0xYGaEKv86L-Ja4qmNZ0L4FdqyJs-Bn0_iw2Lj41GN08CHNRQ8dA>
 <xmx:2T0xYPDyqFu81GKXo19FjOfZv7LMjNwZlDs7t9WLWZ3OiaZWTCz34w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ED2D240062;
 Sat, 20 Feb 2021 11:50:30 -0500 (EST)
Date: Sat, 20 Feb 2021 10:50:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: overlayFS security concern
Message-ID: <YDE90CWoSXCHjgYK@heinlein>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWji+b4YDzBsQKFB"
Content-Disposition: inline
In-Reply-To: <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kun Zhao <zkxz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pWji+b4YDzBsQKFB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 11:46:08AM +1030, Andrew Jeffery wrote:
> On Sat, 20 Feb 2021, at 11:01, Kun Zhao wrote:
> > 2. don=E2=80=99t use overlayFS (but it=E2=80=99s really useful for debu=
gging during=20
> > develop, and configuration management)
>=20
> Possibly, but it's probably worth looking at IMA instead:

IMA (or similar) is likely a good option.

There is also work going on to remove 'root' from many users and
daemons so it should be harder to overwrite executables.  If you
have root I'm pretty sure you can always subvert even something like
IMA.

A protection we could do which would make attacks slightly harder
than they are today would be to change how we mount OverlayFS.  Right
now we mount it on top of root, but we could be more explicit about
mounting it only on top of places we expect to be read-write. `/etc`
and `/var` are the two that come to mind but I'm sure there are others.
This shouldn't be very difficult to implement for someone wanting to
take the initiative.

--=20
Patrick Williams

--pWji+b4YDzBsQKFB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAxPc4ACgkQqwNHzC0A
wRlTtg/+PRtqg0YDG9OCzlajOP2czomP1D0m2n8yUjrvyvAiIv0kdTMSbVZYjZ8/
DPlub3hvrK5jFwhKMsIq/xnTXdh8owtu/wyWPuE39K6jycWEin3Jqp+x6sUPE/hS
+YeyA1lc4EsghkpqXU8wevPzVgYE5Na9HYLOK8UgQpxwHb3FzCmluqXPeAYTCd20
j6LzaIAiBvxSJeogyVQivkRcD1oDbK6h+QMVMgrV6O+GtDjXS3JWplHVeyJmlKHe
cgPYY9+ORVT86lQ0FowoYsoRRtaJt6OIk8vU5HFGY6C6IQJ5R93IbvskEjsDYcf8
rxbIY8+kaQx/mPscmPcmSqZ0Lnhqd0qqhwx3M1UxH0ZSjSBFa/kLKTG1qan5518K
UqL4oEGVotfNVZundWVq1f6JBLIDPmohdInTAPNXV1+r9N61d1BqlKygHTSLkq+d
ieiNvdIEnTFUjIHV/jGJWd/IvUcF3F+HjPFPkVAE1G9km8XoQb8nhW149uK1mqGv
wogY0SMqZf5n9SH08Efs2VkHEbHauj9Wruua/83I1wnwAOPoG/ZF8XJLIo2230CM
zmLJghBhLbcC39EnCJhJlR1KgFGZBCkJEJBTZFJ+HgzevQMTkSHaPej8LTtq90yh
obml46jNMysF5NDx9HRFJCaA2IvfD72u8ugxT36dXk54thCxO9s=
=UpcO
-----END PGP SIGNATURE-----

--pWji+b4YDzBsQKFB--
