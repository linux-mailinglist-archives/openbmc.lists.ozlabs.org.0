Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB477D1EE
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 20:36:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=evo6WoCk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=USJxa+lz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQKjc16fGz3cQ4
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 04:36:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=evo6WoCk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=USJxa+lz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 572 seconds by postgrey-1.37 at boromir; Wed, 16 Aug 2023 04:35:54 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQKhp1NVDz2yVY
	for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2023 04:35:54 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5FE2F5C010D
	for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 14:26:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 15 Aug 2023 14:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1692123974; x=1692210374; bh=wxb+XA6XWN6AIO2bVhF8CBl34
	iV549EEkRXg/q7mv50=; b=evo6WoCkriaTSQ9dZthAx9LazV6ZA8pCYo30PcQeu
	6g5JhJym6nlJSEyHpca3E3R/Gbpl/o7G5ZO/bk5YaSedxAs6W2T/eCq0pr1VQVqA
	dgCpwrY5+wuHsvjUzYjiNtAImSfIiUZV9LBSHwaS/+SVA/X8x6TWYeSDj/ik6XYx
	jiovgUuJ2kAVTokIKDAsDjbEOiyjKZQsv7gw+gGSoQ3GpH7X1xF6F9mtmFdFxt5Y
	glmVwdPri1tpHXV/7wXUKIKWkROFIGkYgExn0SN0j10n8A+boxzjThbRuGfF0MO+
	u8ZVUneuxAo4FM4MOkKiZm6/O9wEEevOgrKQ4hdu2azLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692123974; x=1692210374; bh=wxb+XA6XWN6AIO2bVhF8CBl34iV549EEkRX
	g/q7mv50=; b=USJxa+lz+NDNP7TzPiOmDy759wuQ8HP0wiWvpJHBHCMvJFyAYkG
	ofpf11DplTPY35B0jY2jPnaPyuXPGKc/t+jZafcML+O0E6FR19ftwY6SnFyRt2dK
	B977HFl9gnEKtaxniKwENPHlR5RLhA0Wj2L8Lq7LFchHIGHgd+XaOqWrUg/B9qRQ
	sfQo2HEMG4SoTlXhcaqRlNZ16ouzv7L+f36+m9QA1dIWPlg6yVgcNWPpFBMhTtMN
	XOqSVktWcAax0F7jWUl3D7L4s8xlrET4gfKENdBrCvPfSOHXxdYcL4ZYBELS1jsW
	mmOUz0iyL/EcPyEkATcqjaqoAVxws0i75Rw==
X-ME-Sender: <xms:RcPbZD-0L9undGhw713xr97OGctOyOEOjshbKPXTKssWSeTEraJAyg>
    <xme:RcPbZPt0SkPU4LJQs4292jv0G-8LmraCZeNkOKY1cfcPew5jkVZSaQUBqVsnb8KjB
    c7lmjPFAqQTfeFayJQ>
X-ME-Received: <xmr:RcPbZBCpkQT0ztaW1aDJMEpsLK9qIRNKahzmTLmjtmm-Xi5nEDEHLctFk4NOEUhnhSDsel9pSfMZE43uUvqIRETDDekc6snn1Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddujedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduueekueeuueegheduvdetgeevgfdv
    iefgfeejhfdtgeevkeevlefhffeghefftdenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:RsPbZPfHjM8OX0zVrz0ttu7KJiDDiiUkS8HIRWFtk5YjaU6B0WFPXA>
    <xmx:RsPbZIPSkKDEWWyKKyapynHKUQMJQjt7jCV_ghZhsLmQG84WCZU-xQ>
    <xmx:RsPbZBnwdaYnBmy5gOY3JTdsn-DIM_ex70bYcXy8xZtm6CDNUVZg8A>
    <xmx:RsPbZDYsTChlOhdiTo3teAuqbMcl7jo8RYKaXDkMlbA4k6nqIZUtNg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 14:26:13 -0400 (EDT)
Date: Tue, 15 Aug 2023 13:26:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2023H2
Message-ID: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bm9KuGqXOhPjqE2W"
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


--Bm9KuGqXOhPjqE2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Like last half[1], I have also run behind schedule in sending out the
data for the TOF elections this half.

The schedule will be as follows:

   * Aug 15th - Current TOF must publish a list of eligible voting
                members.
   * Sept 1st - Nominations (self or peer) for TOF seats must be sent to
                the mailing list.
   * Sept 1st - Developers disputing membership eligibility must submit
                a pettion request to the current TOF.
   * Sept 7th - Election Begins
   * Sept 15th - Election concludes
   * Sept 22nd - TOF will publish election results.

The current election roll-call is available at:
   https://github.com/openbmc/tof-election/blob/main/2023H2/rollcall.json

For this half, we have 3 seats up for election.  Currently those are
held by Brad, Ed, and Zev.

Nominations for those 3 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may be nominated.

Disagreements with the roll-call (ie. your body of contributions are not
reflected in our current score system) may be petitions for inclusion
at https://github.com/openbmc/technical-oversight-forum/issues


1. https://lore.kernel.org/openbmc/Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.ne=
t/

--=20
Patrick Williams

--Bm9KuGqXOhPjqE2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmTbw0IACgkQqwNHzC0A
wRkY2A/+Iv+b/RJn2ydfOTpGgoFzJFwnT7SRfV+lXQRDsvgqooUdJJQh7QclgqWE
OkqtjgyXJ2S+rdFMOPeHSNzdkadMpaWSf70QEaYlT7BaQv+mqqlWG0LqNXxlh0MC
U/k6g7Xc6xQtoGjYh6IcxSjOLxDSETSk10QCPz2TvdzjIcto5JFpN+l1dmFo4sQX
1BNLvqdj2RNwFYD858JwlA/zLcG522iY/Q99cpDj6TpOREk0tX05Bql9R2qI0vr6
tn2PpMBA9oY4dXkW86pE9y+BJi6wPiXKxQ3XzldIAxzdBn/mngPOIGHpV5dE1PwV
93lDXzW/rEp/Vr/XCDegkNzGVhRNCeYPOQlnGX4qRQHLcCDtp2ZLLNLsWXEvIKty
O08XiFuL88KEsmkEXqjXBlu28vHf94eQsgeRweywxIvX5hre7MyhSCL2qMVOrAGh
gjP2U7g9L0HAE3Qx0pstZAmi2plVGaipvQAe9WIVRzDNFtThdcFruv7yQ44oNZ7E
7KuFWBEl+gr20/o1HT9rFokepcGki+o7xnyVCHGKW2Ioexo3k61z+SzZgok+0StC
Qhi28SkujznIMXVoR/BxcmyFwy1bpE7InO0igsgrmxulW2HDEaL6uMVvImJEIjP3
mMlpiBl3Io3kPg5FpnNP25ap3HvrqlZCq7UaMKkOaSfwycFlDO4=
=esuQ
-----END PGP SIGNATURE-----

--Bm9KuGqXOhPjqE2W--
