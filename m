Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D16152B6
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 21:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N21Hv5Td8z3cM3
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 07:06:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hdvLOOoC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sBVDViZh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hdvLOOoC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sBVDViZh;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N21HB48Drz30Ky
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 07:05:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 23A903200077;
	Tue,  1 Nov 2022 16:05:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 01 Nov 2022 16:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667333152; x=1667419552; bh=B5lQirwmDe
	M44P3p3YdmCsq69/slWcwTickED0o6StY=; b=hdvLOOoCkijWr5PoyeNHSh2g9X
	dHvARnDb5MUURO57nyPy29meK6s90BdsqfOPrCeFtTnJQiXCqa0VlzqmrEb0DTb5
	yU2gWbInndaC/sZwcyPHI5tVJyIwwlvPonstWm1TiCR7+x9uy2b/NLZ4mkpF/z4u
	rc5yllrOyD/yHuBtAC7KhITJkYmpxOkCeXe4N4FjrJpTwB7fcIi2xa2AKqiHG7hr
	JUIfvgKj9JKfJXV0d7nmt2JnbodL70WNLBWW0t9MjYlYyhchUMJj2aUIzM17NCEp
	qs/E5OWnvfdzMDejJPhb5/pStZOFpwMYgBhVV8ueLYRVE9qUoHbMLKWWNyyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667333152; x=1667419552; bh=B5lQirwmDeM44P3p3YdmCsq69/sl
	WcwTickED0o6StY=; b=sBVDViZhLNv8hXgzi/qUrAtQO+6K51lDrh4pXAD5fzZt
	qbmFqh+ld6C2thrGXTRGTTtvZq+5/HY1eix1TXSQQhZG0+geOkc6gMkIR6lcLvyg
	sZtq/KQbUev8p5hZIwizuU3sBDbsG53c+Dppemnt1CrkSUuMsY8G8fV5z2kuQbe9
	wwzjqHxInbrbcjuqD/5pt7AIUvXNdJCkYmbdN2FQGHfD0B/bcbDmBcuvik5lAN/P
	CyDW3QnvDs71E53gsB2XSPzjv0UCJcWij9pMcA8dVoPxrtXP59YUuSM8S2m2Y/MQ
	qfQhtuP8Ajsgg2HS4h3WGCUK1+VXc97hIGDuRm+53w==
X-ME-Sender: <xms:IHxhY_FFryFz3FUm82KXtdG3wNBmkEyRPMYDpncvtjX-3OpkGavfxw>
    <xme:IHxhY8VpmZBmMtxg4Bta-tv3YOiRvsbg9LB9Y66iD3kJbIST6nQ5wROOT8hn0jJY4
    ux2aL6IhiqmqENJnSE>
X-ME-Received: <xmr:IHxhYxJfVbWzUWnEjvjvyNwIt2vOq7JSp7QB46eSeEjASwqJPLfMH8zTDvGNZUPv6lI6hvUD4td9SszDgeLG1mISBzK5NYNs8Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeehfeejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:IHxhY9ESP27fRfBsosJLVT8vGdmG6LRrMgvKcmzkzQfSl4Lz1uF2cg>
    <xmx:IHxhY1WNsm4cv3TY6Tk6RbfJYcCJN_VBcmKXcfVZKc0Zp-ylEEBY6A>
    <xmx:IHxhY4MnQw73lFOQse2R0Q8mIaH6vTHaAqeA9STHpBTQPjKQfmRgFQ>
    <xmx:IHxhY2eM9HldV8tqKQJxz-iV7QLIhFdZV867kbJHEDWimAXZFq8NDQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 16:05:52 -0400 (EDT)
Date: Tue, 1 Nov 2022 15:05:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <Y2F8Hue7ngTNiDkY@heinlein.taila677.ts.net>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
 <Y2FrJf0aT92bxM6E@heinlein.taila677.ts.net>
 <20221101193927.gh4cq6qqy4qbqtwd@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TYqjEkUq+q9K82mk"
Content-Disposition: inline
In-Reply-To: <20221101193927.gh4cq6qqy4qbqtwd@cheese>
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


--TYqjEkUq+q9K82mk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 03:39:27PM -0400, Brad Bishop wrote:

> If I ignore GitHub and Gerrit project owners for a minute, I think the=20
> ideal setup would be that everyone can leave a +1.  In order for a=20
> change to be approved, all OWNERS of files touched must give a +1.  We=20
> completely do away with +2.  No special groups or per-project access=20
> rules are required for this.

I'm not sure.

a. Generally we don't want to wait for all OWNERS to give feedback.

b. We typically want every touched file to have an owner to have given
   "thumbs up".  ie, there has been a coverage by at least one reviewer.

Maybe by "all OWNERS of files touched must give a +1" you meant (b)?


I do see some value in differentiating between +1 and +2.  When I am a
maintainer of a project, I'll sometimes review a commit and give it a +1
in order to give indication that "this seems fine to me but I'd like to
see some more feedback on it".  Often I will suggest the people I'm
looking to get deeper feedback from.  I have a Gerrit query that I check
a few times a week ("status open label:Code-Review=3D+1,me") that I can
use to check back if those deeper-reviewers never get to it so that the
commit doesn't stall out.

--=20
Patrick Williams

--TYqjEkUq+q9K82mk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNhfBwACgkQqwNHzC0A
wRm0tQ/+IpwbH68ypQ1yRGhr7JB6fgJKfQEYCyv/xjK1HDFTCCMOtL85+LqV7hmW
eklqDkn9PWSJneB5ha2UjKD20AcP4RIQqgVOwOZuUzLHwMBIX1mqZujELayXRoCJ
fiGTTrIIWmtKIiMCkhw6U2OUKk7FJ+CZsdJ0fl6X0JaVrKLyc7YAJFWgvACFtWvW
FzxPUm1Z5dqbrCuHxtUHg38BztzvFTM8rNfru8nbtHBHnjkGZeo22YNhpplTPFaI
3P18IRSh5xdhCzPfCsgOXyn9HYiAXgkYuTRN/kgoZs0lyPkbPNU3dseTzZGKbKNe
zE3ddvYmuDtyGAHAapuRsvogh9BLDqHGKSVHOXTwkAiLXM0PoMJ5RpipkZ6rYayX
jlD+dv3FD9oMllPPdUE/oEODv3qF1Zf0k4VGvPo312GMOmT6y4G+aIl5dYAtFTpg
Y3K3ZKa8S8APCVzIwq3HIFzuvuKR3NQEzyJ8cUHkHBHiGREX4AjM+ECW8Vm9ZMbO
r2MWCgCjd4VjlROkCFRq1wlpWxhsQDChPeP3+WyQzkXXd2IlL+kKBfCoRdZIvPB/
BwwQgbF4rKMzZ4GjeGbK5wZGW6St5rmO/kTeWMz/W33/uF8ksoZiSs5liCeTvbxF
Ru6EcxommlHg0TgiWrbDEGelrDrbbWqDO4FqDAeTiJEWZHGHF0Q=
=Bkjl
-----END PGP SIGNATURE-----

--TYqjEkUq+q9K82mk--
