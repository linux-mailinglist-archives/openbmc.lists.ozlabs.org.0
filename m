Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9991B4366
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:40:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496dlS0fGDzDqlp
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 21:40:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=FMYH+Vzc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=beX0/pVX; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496dkN6r7HzDqjW
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 21:39:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D08B5C0124;
 Wed, 22 Apr 2020 07:39:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 22 Apr 2020 07:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3lxzHHHJwjF3BPE355e8NXosejV
 X3C0TfRYM4s4MdSs=; b=FMYH+VzccRfQJ5en/JBh1TsRVm6onxG0s7LyObuka/l
 F2vGN/hGS6Qq6JAgZeDgt76p7GBfyaKgLphDATNU39Mnbx4IGZekcWKZ9Cu4EF9L
 QvHsZke0KKlrF6XCMctB+QUFhtrPdrTOPLRmMPAl3RaDlOFUUQPNJbD9AP5F6i7X
 tJDm8epzr1QxEY7BT9qBJNx7BMECAOVU1JW5VE//DhYeSU4AJLj8AdtpelISfiq0
 x8+Ih/o8IW4tmnNJRsOCvjvzfO/FSdnxGn1C73YGs4RcVP/0v0HSfil2Kn5oaBpi
 AR57jhxFPctx/Kso3P+6lLxEBIlTbBrcjWdp0F2bPsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3lxzHH
 HJwjF3BPE355e8NXosejVX3C0TfRYM4s4MdSs=; b=beX0/pVX2oRFfcKyM74Wnx
 fyFVaebYWguDFbJOu56Xys4TAghV3MOJWJh8WWcdL4m3EeiY07aC2hk8CEimjl+m
 4sn3ngvEp6twhgCrp8G9t4RDd4A8lPwq85lcKQ+Ciim5J6O5janrQcP1VY5wwmiF
 EXoRndXSHqemx1NcFPTJE/pWwZndxG5jBzkZ15EjEo95KehhLTQARgbyHYIo32Kw
 VVFUbLrDTSrI//Ls5LwGV3uqH3H6s+3HKvkmNKuzmKhRKbKWLXGYu4fdKfdfOnTP
 OMnpaXSqou/nfVxNHD6tqt2CcaVrm/IGmXwGGkHs1SS7lDVpQQqJHWWNoyuiLHHQ
 ==
X-ME-Sender: <xms:1CygXqg8c5_lgMLVE--pjavkGgQuKefi66WTdnflzqoPAcOPeP4UZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeejgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:1CygXmr6kARrjMkXMTeien-TDwj8pyepWKBz90N5uNlyr089z91bdA>
 <xmx:1CygXshRUJNQsTHmCFvODNMWBGffCTiE4VnDKDuEYam5bkhjAGvsyA>
 <xmx:1CygXhKbexrdTrEd3ZWxi-CtVu7Y2wyvsleLQTWUZgPs_k1ydHBYNw>
 <xmx:1SygXutu4kuhW2Epl_7T5an-7x9Xv1666J0l9gf29dQXeQkOysLhEQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2B9B3280069;
 Wed, 22 Apr 2020 07:38:59 -0400 (EDT)
Date: Wed, 22 Apr 2020 06:38:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: ipmi password storage
Message-ID: <20200422113857.GC196148@heinlein.lan.stwcx.xyz>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <20200414164610.GC9295@mauery.jf.intel.com>
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


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Vernon,

Thanks for the info.  It's taken a few days before I could find a time
slot to think about this in detail.

On Tue, Apr 14, 2020 at 09:46:10AM -0700, Vernon Mauery wrote:
> On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
> >On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
> Specifically, the RAKP3 message (User->BMC) contains an HMAC of the=20
> various parts of the exchanged session (User random number, session ID, R=
ole,=20
> Username) using the password as the key for the HMAC. The BMC needs to=20
> compute this same HMAC to compare (this is the main authentication=20
> challenge).
>=20
> Then, the session key is generated using an HMAC of similar=20
> data (BMC random number, user random number, role, username) using=20
> either the user password or the channel password. Almost nobody uses the=
=20
> channel password, which is good because it allows for simple privilege=20
> escalation and session hijacking.

If I understand this right, the algorithm uses this to create a symetric
key for the session:
    HMAC(password, hash(pseudo_random_session_data))

The client gives some data to seed the session-data and the server gives
some data to seed the session-data, so that part is unique per
connection.  The part that is constant, and that they both have, is the
key to the HMAC.  Do I have that right?

The HMAC algorithm, at least for SHA-1/2, is a two-phase hash call, but
the key is always used at the front of the first hash phase.  The SHA
hash algorithms allow you to do a partial hash, extract the hash state,
and then resume the hash (See SHA1_Init / SHA1_Update functions in
openssl/sha1.h as example).  Rather than calling the OpenSSL HMAC
directly, can't we rewrite it such that it uses the partial hash on the
key as the starting point rather than the raw password?

This approach would allow us to save a SHA-1 + SHA-2 hash'd version of
the password rather than the raw (or even obfuscated) password.  It
isn't as secure as the normal crypt methods because we cannot salt them,
but we could certainly obfuscate the hash-state in a similar method to
what you already proposed.

--=20
Patrick Williams

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6gLM8ACgkQqwNHzC0A
wRklEQ/+N3abqy+PIVMIbNbJO5W6Py2AwfEcM1MhlMKh7Tv3T3f7MJJNwhBKHESa
rr6Li60sGypLSwQjE73e+h/WLjkcmXQFmSl9vNQaTN1e2dWF3cKK//YGa5eCE6/c
3dxFMTVXIp8ADWFyeTSwKofgtVIIA5Xq4l+xznV5SMPY2v1Al11zIp2TrHNJWaBn
G4wsC4z3mCA5TKFCm+NKhi20sb8n6+9Aa7Wxc9E8zi8A4FGUXyG9MCRcNJrd+e98
upr1EhkMukSns4Ql4rXlqrVj/70Nu70hnK29C8l5n3eZUxR1InIOyT7Ed8VMmMQY
M/NYEJkxJzouX7dnjc+p9/870Qtp+bVVrozUMCo6tP9CGd5MYfKaOCCW3peEG3v9
YgvsvxJDwEpJUfAflEKnlYhNJe35sjm8zbXa+wm3zi9/orwwh+PE2JC1g5QxO4sP
SSjnWnQbI5jhJo9P+BZ4O1YMm6c9Q6dWWbIu0YsrDy8QvwY3yA1IQgCTCtOOjEPS
CO1jJ+duBSZJ8hMQE4UqDT8h0dc7EvDv78nmX8CRFSG6f27hW7t+VpfT+AqFugg7
eRBxrGqpQbN4uO8xZNUA5XNeFyHamc3da59RsmiKY2dI64UqmBtpsP2V/kytmejz
z4fRrcjAv1xwkExyiSq0t/WB41YyvXxerM4Zpvj/WoBhWlaroh8=
=wJk7
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
