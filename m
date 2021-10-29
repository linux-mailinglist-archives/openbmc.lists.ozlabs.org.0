Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818F44022F
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 20:40:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgrpc2xMzz3bP6
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 05:40:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=m4/yuo/5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KqdT7Mvy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=m4/yuo/5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KqdT7Mvy; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgrp84WXvz2yWR
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 05:40:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E7BA3201F09;
 Fri, 29 Oct 2021 14:40:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 14:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0ic0/1CkXxTjWAtZyqLqe98Bp+Q
 upMHO90LUQljzu2w=; b=m4/yuo/5rZLrbJCXBCSRpVERkU9q1YryckMwbmIuJJz
 F87o2RMuAJ9DS7B0M6adfY3aIt+IzGHr/vjCKOEmFcnb5WvT4Pm3MoVhUTTVCdCQ
 gI0J//04AOnb3/ctYpb/OAR1C2JoBR6krDP+QakX8caCDsIX40F6Qr19hif+1J43
 5EKXsmkiIp7oO4OkXhXFfJQ5pG035KHb8ep/qir4+V9KdvfW3v+/1M9n5ksxB9pN
 dfEnG+PFJabjCfUKNm9w4mFB/qAUCY+pr/TooYbTMmiNi7pFn0k+ve9/eW04dAO6
 YrBHN4X0ZLs55oHmWnTotLG5WDPN+yvmZjmsPym5EEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0ic0/1
 CkXxTjWAtZyqLqe98Bp+QupMHO90LUQljzu2w=; b=KqdT7Mvycek3oYgzFtwaDc
 onh7UDnUUhGhZNV7gOJqV17A2McCg49CeTlSAs8nkydvoXSqSCa5CZlyVCKTAOWV
 Sn6Xjd5mEeJ2XzYefzOWrqQIzSeB5umUHngBQXOFPwXTeBQSM0LhPy4LU22yQHFt
 /8mdcKinMa3nLIUQMESXceTMK11DTPM+fVD0nTO5nJAuwrDAsCXWv56ZJc6i9sKQ
 LiPU0BIOy2o/LuBaS+LCMgCYp3T/uD9s3+hFJu6dZrMrgO9qX42h6Sve5zh8cdl4
 2s7aJaCCbaTR7O0MaD+LXxf435n3EuL7plOPjSKPkqQ/0Hpeu9sMZ0tUHM4DjXkA
 ==
X-ME-Sender: <xms:CkB8YbrovyXFPvmQXRFcogzyFCTZGDjVPW3hUx0ecn97yPMo6EST2Q>
 <xme:CkB8YVpPO50IUIICrObn7V8zK5g-wJQTpdzZyp5XZpuLxFBgsZJBWu5go0FIAkIkL
 RGinAf2mUhZIzquxhQ>
X-ME-Received: <xmr:CkB8YYP942UpQ8AeGaYVv46TDnXERGUaUXiKWML3NvCSulHNBEQq79pKS8hmRuOV-ddqKGVz_Is1wDiKEaV6uKCscbL_9MV0VZKJavg5mb8EDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:CkB8Ye4OfsspF6_r71bXLVXXX8bbOa0N7Hh6pykT3XjZYY9FRsvnGg>
 <xmx:CkB8Ya7zwUlMVRCGZNyiOmaMvqAAGSIWLSJlSHG7_BecZL0fMnlOyQ>
 <xmx:CkB8YWix0bFNmoRD2A4BXEk44-le3ImZsEOUgUitJi3l2LbSqLeFbg>
 <xmx:C0B8YfgnFObdONjBgTCT0ksw8jJZIEUHAmwWwZ5eh_ZGuVQ4z8tDEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 14:40:10 -0400 (EDT)
Date: Fri, 29 Oct 2021 13:40:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <YXxACfWFxZ9MFbSv@heinlein>
References: <YXDtrwHhUcxwtlij@heinlein>
 <20211029162954.nkwfhzineypitwu5@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fYohpz2XAN5EpnJz"
Content-Disposition: inline
In-Reply-To: <20211029162954.nkwfhzineypitwu5@cheese>
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


--fYohpz2XAN5EpnJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 12:29:54PM -0400, Brad Bishop wrote:
> On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:
> >Any member of the OpenBMC community may give feedback by:
> >
> >1. Expressing a vote to the top post of the Github issue.
> >2. Providing grammatical suggestions to the Gerrit commit.
> >3. Responding on the mailing list with opinions on non-grammatical OTP c=
ontent.
>=20
> I think I would just like to see the entire conversation happen on the=20
> list.  What would be the difficult parts with that?

I listed voting in Github to avoid emails like "+1", but to allow the TOF t=
o get
a general sentiment.

I put "grammatical suggestions" elsewhere because:
    1. Again, reducing clutter.
    2. The post here is mostly a 'draft' anyhow, which needs a follow-up in
       Gerrit later on for documentation purposes.
    3. I've previously heard sentiment along the lines that "Gerrit is good=
 for
       code review but not for discussions".  Grammar is 'code review'.

The purpose of having proposals on the mailing list, I think, was to give
broader awareness and because it is easier to follow discussions in email.
Having minor comments on the mailing list means others have to sift through
those uninteresting emails which may reduce the visibility into the primary
discussion(s).

If we want to combine 2+3 together to have all community comments on the ma=
iling
list, I don't think it drastically changes the proposal and seems just as f=
ine
an approach.

>=20
> >4. (Least desirable) Providing off-line feedback to a TOF member(s).
>=20
> If it is undesirable why do we have it?  Maybe we could list that=20
> rationale to make sure this option is only used for those special cases?

Even if we don't spell it out it is still going to happen.  You can't stop =
two
people from talking to each other.  Some people are not going to be comfort=
able
expressing their opinion in public but they might have an individual on the=
 TOF
they are comfortable confiding in.  The "least desirable" is to spell out t=
hat
the preference is for opinions to be expressed in public.

I can certainly drop this or reword it if the consensus is as such.

>=20
> >Community members should refrain from:
> >
> >1. Voting on any comment in the Github issues beyond the top post.
> >2. Cluttering the mailing list discussion with grammatical suggestions.
>=20
> I would agree this would be a minor annoyance but is it worth splitting=
=20
> the review process across both Gerrit and the list?  My opinion?  no.

I understand.  See above.

--=20
Patrick Williams

--fYohpz2XAN5EpnJz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF8QAcACgkQqwNHzC0A
wRm33Q//cCTqIc+ofyU49kzefTTHbk7t9Tf6Gmn/W9VCdJjDDAy9paQLjgfNAp9I
jPKwvq5cDt5EV6xh6MIlOTU7SRb4Rh6M2EZVgCMmy+/ggUOmeKIjfw5VoWpLpdfo
SYuadP2fmIK+4UOb6ae1Oli3SsnqpeO3gidahnhQl8HTndO1B2aT64fYWfutGN1u
FSEh/asOHuQ55CIXH5mdUj7d1bPKSwRkzDD2ihQURnYo+H4fEWFMjEWvzjizZ4Ay
ngra6dQnwzfokSYz8jBXTASfAUJAMq8XUZYy9vX3fbC/pGvjkzpQ/7/Hd45k6x2T
vtwNkjAR4L7vpAMP3XmddsqyBn2zmY53pUJwKa3wpm6FqF7qRDRl7gSKJh8uysx4
qQSmt/6eyOoy+hwKWeK6by0gxijkwlDbc0UgKgCeV2su34LHgNZ/qev9dPtBqYOW
7XqW2cKJry3qBoxiHYuLAPv4OYjk5DJ31IX6gMdmn08AH10hgXIm4p/XMB4aL1HJ
XgzVT/0JgKn69Mr/CcbdKudz7A1MAJMUBGy2uqR1nixy7dHUfgllipegS3v8dIWZ
S7sZVVAwsbHb8/NMlF9OiD2MHojppPwjzknb82JUjZ1hum1Q1FMS7NF+JildehdW
jXPFusf0CyeyGP0OIGTcSd6YR0O9q3KeerKt6Ysi6AnmyRGoZqw=
=u4jf
-----END PGP SIGNATURE-----

--fYohpz2XAN5EpnJz--
