Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C3632351
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 14:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG7KX5rDkz3cLh
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 00:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ZIfnQmzg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gWE84Ilf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ZIfnQmzg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gWE84Ilf;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG7Jr6WMCz30JR
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 00:19:23 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3DFCC5C00A0;
	Mon, 21 Nov 2022 08:19:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 21 Nov 2022 08:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1669036757; x=1669123157; bh=hmYVzqvkr3
	7Ww0Ojq3tT+Oq89uzrMZPxgGUrOaiq9KE=; b=ZIfnQmzgdSFp1bHyNjmz4bBq/1
	hH8fssx/UKOPwHI5Lz799R8OMhTY0VY0MEyUKh2tP5HiORMWDsVMXDesjy1hg/7h
	lIlV5rSAjc1POiNhyNrDCNIcd4KkbbT1I9FhQMS5zSYLeS9qzOE10uOF1MvOw/Lt
	TFH+sE7fQ9bn+UgI/bLNIw34oicD4tN+mTxFCq0RR8BMqee82/Fz9vBR7Pcg1LCA
	Kzh/YWABrIEAL7GVhfV4yAmxbKj6Wkk+M7zvJh7sbEhsdnpvyAhwPp8TtYTVX8N5
	LohnNI9ojWoWGx7KN5PnEOOD7pWitg6m8qNizEvoYgirGe/hpjEaNpGmh+KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669036757; x=1669123157; bh=hmYVzqvkr37Ww0Ojq3tT+Oq89uzr
	MZPxgGUrOaiq9KE=; b=gWE84IlfaQUNpK4ddR5cGmcmmMI/Y9zwZXH/ourCrMFk
	xybX58RuOp6wvO2lLY6V/+8j/lHFCfPnZBklV+xNmk4PpC2LhRjDPYN+ppj2TuDw
	4W0HbdqOcB7RtT/XHJb2Ga2El0JsYGlGM8wrk6IjvRQ81d7AtT0IxYW8tHHWdywT
	0ckZVHQ5/7LcoyPERueaw3vl5sxe9zzzTOpJmc8OWRRHEhwFMl731If6+FGK/Ewz
	bKn8Pu4q7dZmzZFuqQqqPuRcbGBAJvb7MjZt0mxQ6cT47K3n7isdkB/vX/dZrT7U
	eZewOLZUEOT+uPfTuq5LcQ1PE1eSSyJLeNzxjLPRPA==
X-ME-Sender: <xms:1Hp7Y4bRY7JA_rAjlgOyG9s54w6LnQ3-gPRrdCARG-r5ZxcOvY1LrA>
    <xme:1Hp7Yza2PEa8gBcvioB7Lyt-Brq6uMpQ1KQQOdAz56VXxzILDNOjPVwFe2sOb2C98
    xGu1e4SD-QRHY5678k>
X-ME-Received: <xmr:1Hp7Yy9xtjhpnjndguNkms7-IDpjfidzkeqLupN6RjO0__FIFFOrnk2t4Lmr1Ik2TXVHQiJU9eo2-KPUgzuCLapOQKtsjetz_Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheeigdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddujedmnecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epfeegleetkeeiledthfeuhfehgfevleejvdefuedugfekhedtgeehgfeukeetieeknecu
    ffhomhgrihhnpehophgvnhgsmhgtrdhorhhgpdguihhstghorhgurdhgghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiii
X-ME-Proxy: <xmx:1Hp7YyrXlW3E8uOyOcs-cJbmFnmirBb1C-VI55Ynt8_24eF_Vch4OA>
    <xmx:1Hp7YzodGEvBInb6SRtfaSl_37-5VGwEGwmaq-kzePd6JO2CZIyvKA>
    <xmx:1Hp7YwQq5WEXAB6SK_ICoPzncmuHfJe6t0xg8Br_QJQsE2pbmsmbng>
    <xmx:1Xp7Y8DdXHtecI0TgVmVj6B9YU5oz6RF7nJ0UVTCugjF_2lCXFAWMQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Nov 2022 08:19:16 -0500 (EST)
Date: Mon, 21 Nov 2022 07:19:14 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12
Message-ID: <Y3t60rxQ/ctsd184@heinlein.taila677.ts.net>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
 <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mvano+GMQwkgiVvp"
Content-Disposition: inline
In-Reply-To: <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, jrey@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mvano+GMQwkgiVvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 08:00:25AM -0500, James Bottomley wrote:

> I thought I should note here that I can't join this meeting because I
> can't get a discord account.  I'm not sure it's a huge loss because I'm
> only advising on the TPM pieces of the current IBM Research OpenBMC
> effort, but I mention it just in case this problem is excluding anyone
> else from the meetings and because it is a discriminatory decision of a
> proprietary platform which is impeding collaboration.
>=20
> When I try to sign up for a discord account it insists on a phone
> number verification (OK, annoying, but lots of other proprietary silos
> do this as well, so not unusual).  My problem is it won't accept any of
> the phone numbers I possess because they're all VOIP ones (I switched
> to using VOIP for my phones [both mobile and land line] decades ago
> because I've got family in several countries around the world and have
> moved around as well so keeping all my numbers and in-country local
> ones for family was a trick only VOIP could do in the early days).=20
> There appears to be no basis for discord's discrimination against VOIP
> other than the company running the silo also provides VOIP services and
> presumably doesn't like the competition.  Now I could go out and buy a
> non-VOIP SIM chip for my mobile just for this, but these are hoops I
> shouldn't have to be forced to jump through to participate in an open
> source project.

Hello James,

It is unfortunate you are having issues.  It isn't our intention to
block anyone and this is the first time I've heard this complaint
(regarding phone number activation).  There is a setting our Discord
servers that can be used to block people who do not have phone
activation, but I do not have that enabled.  The anti-spam setting I
have enabled is:
   - "Medium" :
      * Require verified email address.
      * Must be registered for 5 minutes.

The only one that requires a verified phone number is "Highest".

To test out what you are describing I did the following:

   - Navigated to our invite link under Incognito (to avoid Discord
     seeing my normal login):
         https://discord.openbmc.org (or)
         https://discord.gg/69Km47zH98

   - Clicked "Register".  Filled out "myemail+burner@gmail.com", a
     username, password, and an arbitrary date of birth that is more
     than 18 years old.

   - Dealt with the captchas.

At this point I could see the OpenBMC server but not post anything.
There was a message that I needed to verify my email.  I went to gmail
and opened the email link in the same incognito session and then
refreshed the Discord tab.  Then it gave a message that I needed to wait
5 minutes after registering and proceeded with a count down.  After 5
minutes I was able to both post and join the meeting channels.

Please give this a try and feel free to reach out directly if you are
still running into issues.

--=20
Patrick Williams

--mvano+GMQwkgiVvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmN7etAACgkQqwNHzC0A
wRll/g//dyPfHZrJxM0Z+zEWbK5iuhregOzfQ+4lckKzwdCnlqRbXz4DONO81CHb
E2hPUQG1w90PZllgtxdr06DdxKBEGgNFAUK5yUEUphXp5/EBuYp2IvT/lrU4hYLW
UFsj+EWMvKTsAsXbAHs388frs9eEQ8s22vEi6ZFQIxRTrO+2zr0fxI4o5cVjeq1E
ATVJkE7CA7H1DTzy806NqXQ1BuRUDhkK635kcI6xB2yoSWd2fc9PcyEXanB+bGkR
TvYCexHUd5WGAbggpgosFBK1Zlf0K7b/rS4DUARsuYh9UtKvrR5bwFobGyzsVczA
6uFnLRIn1JShcnmjOTJ8Ro9WvR3B65SnfiiOOGs2UAstnANRf6qSLSiYdyP1y1Um
MmkFexwy0ONmtvJ4bVqWEGva8QzY7lp/uFAJzqsTAV4beRFgV+BN+HJ3e59DSQPO
/cpjNmiwclSblVCT5/oICbz5zLs5EWnDSaCDn9gdKKj8mRCNjRxG4pz+Vb9gJdPD
wbsoB77V0E0HwtusDNrfUGxH5KWk7rRbNPrx/FM8zq3FhXeC9NBW3vhki+ODZ8fk
vc6ACsiKFqjCZi4BqvThNyBCC0A1fLnl3x9D5OFDcfekfUpb0FCsZyLpC86aO4PF
iIZGV26tzww/Z8LLycR0bDgiMVMuWLNtfK4qrk12Femr6WSIF/Q=
=VAGt
-----END PGP SIGNATURE-----

--mvano+GMQwkgiVvp--
