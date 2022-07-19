Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0D57A8C5
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 23:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnWhf2mSgz2xkn
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 07:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=f6wx3/gG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OlwrWEin;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=f6wx3/gG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OlwrWEin;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnWh90VlYz2xkn
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 07:10:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D1BFE5C0165
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 17:10:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 19 Jul 2022 17:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1658265025; x=1658351425; bh=vTVTjZulZ265awoIoxPKECAy5tTGrnRwigV
	aqlRyQNg=; b=f6wx3/gG0o7ASHafpAnMJYdHpgwXLi5zunzszqIOOs/zQ7NMRcQ
	euTXOOyCCeR/bOsiRSJCbEIQtDARpSoU3BsYpjBVw33ku9fbhATL9uZ6zW4Uj0EL
	R+WOhUGCmZ9mtrXqKRlhMLsnLBbUu1dJK32x13ghPHSdgd2btX9gVBpDnpqQJH9S
	3hTDHOWEz0fkHRt2BaZjTuTDwslq2KJL/543Won/g8Ft7p7pvaovaP5MXsMudjYA
	hwrjlW0WWI7gIdDJ52kiGCEypa+70cfPdkhsqwf+1A0Ih6Zogrt7j14hz4G3P6lS
	Tl1guLpLzHOsSMGNLzVouFrbOJrarCY6b9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658265025; x=
	1658351425; bh=vTVTjZulZ265awoIoxPKECAy5tTGrnRwigVaqlRyQNg=; b=O
	lwrWEin71KaBTqsD+HH7UNm09N+TcqqhnX52x9WKavSWSE6KYyZDNcBZE83gGrhM
	CDRKpBprzD0J+NAfahWEG0p7gP6UU1O8DSG+0OHoA9xEi8D3qpx1Qmd1jyRCaJUE
	G7dXtJe+PTlsbgSe840DSJ+k43ewJezXvoWwj6GpsU1JPwb7jVzRKgI4e0OzoQAt
	Ly+CDGxRrc6tlPdA/sws3U3qkAM2jPoK/4aSLKP6asUyItkA4wO0hi5sJJ+A3AO3
	MTFf35jaAPC/q//6NLJRQ4RtsuXsxOpofBgWioBfmKMCuLyuj2THGTyeIo2cXj66
	GTXK3VKKLfxkAl5wA2E7A==
X-ME-Sender: <xms:wR3XYtpO6zSIdpT--ikVKyngZnvb-UcOFeo8rjD0mZV1oDSPYMMx6w>
    <xme:wR3XYvqK9vXfLu1Y94WPgbOXIiCslg_F72u_shsLOd-VEid_b62OrNtR4gnCsTZo_
    QrnWMyYcm0SW4UfuAY>
X-ME-Received: <xmr:wR3XYqMgrhyIfFQcfPKmbrZdg3GGZgwQWVQzPvNMCOXg-ljLzOyKyZpOdWxtnTkLdwUtuObprafykv4KBT8lWPzlue62zGfu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeltddgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhteelgffhledtgfejgfdtkeeiheel
    ffetfeejffffhfevgfehteevvedvudehveenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhmvghmsggvrhhshhhiphdqrghnugdqvhhothhinhhgrdhmugenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiii
X-ME-Proxy: <xmx:wR3XYo7DnVxma5jVdAVup_YEut5kbzRBK6jSNJ9ZxjDG7XghLLcvQg>
    <xmx:wR3XYs6bCdSMIcqijosQXWwymKthrXRYA6SzwSZKcj0JIkiZkhiE7w>
    <xmx:wR3XYggH4bCUvgVVYNJ-t_VVhxmV8OMcWjpOmiPrURFAzBZuFdjL-g>
    <xmx:wR3XYhVj_6DQwBth0DcPGopAbTQTSgfUHhnhw-PrOBONLWYDmghZqw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 17:10:25 -0400 (EDT)
Date: Tue, 19 Jul 2022 16:10:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: 2022H2 TOF Elections
Message-ID: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ge1rq4wwPkHnJO+8"
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


--Ge1rq4wwPkHnJO+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Developers,

Since we are into July, the 2nd half TOF cycle starts.  See this
document for a reminder on the process:

   https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md=
#terms-and-elections

There are 3 important points:

   1. The current TOF publishes a list of eligible developers for the
      next TOF election (that is the primary purpose of this email).

   2. Nominations are open for TOF members and run through the end of
      July.

   3. The election, if necessary, is to begin September 1st.

Now for the details...

## Eligible developers.

Contributions made from January through June qualified for this TOF
cycle.  We have 82 developers [currently] qualified for voting in this
cycle and they are listed here:

    https://github.com/openbmc/tof-election/blob/main/2022H2/rollcall.json

Anyone who feels they made contributions to the project which did not
show up in our metrics may request to be added to this roll-call by
opening an issue by July 31st to the current TOF at:

    https://github.com/openbmc/technical-oversight-forum/issues

## Nominations for TOF membership

We currently have 2 TOF members who's term is completed and 1 open seat,
for a total of 3 seats available during this cycle.  Nominations, either
self-nominations or of others, should be sent to the mailing list by
July 31st.  Remember that only those qualified to vote may be nominated,
but anyone may nominate someone from the roll-call list.

Brad and Ed are the two members who will have their term concluded and
the open seat is due to a resignation.  If we have 3 or less developers
nominated for the TOF then the election will not be necessary.

--=20
Patrick Williams

--Ge1rq4wwPkHnJO+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLXHb4ACgkQqwNHzC0A
wRn0NRAAoLRtb+7uXJC2iT1j0Kpf1mJr+5RjcEJOzFmR8XZsW48q7FsvNazoG8dP
GBKmWWY24/hKxBZhhgb4FUtc3LWdoNtDIC3DkGZlML3BH+nVObEi97snqUA2ayYO
Wr7BNdkrsN2Z1f+wSaah6MaT/88rKd89z3K4eWXhC2QKepIlrQpgRlk9wASv+9Tc
BTvB3x4fCluYEX7s4aQTx6o/F8EXaSjQiFpZsx+rr/0YgZoX9+hJ3uLxJd1pR/Xt
gNg7HDDOUyS54ib6Ct+5QUV+ww26mGqa1uysy0lskFPry+tOCTgbQyBsIGwCo0rm
RUhJOifIuY+RTegcuCxj2wQDlX7mCQ/3I17jlR1FbCYJY/8WDGsVm9eax/CKpany
7hzOoHJ78L4Hflx47T+Sp/yEHV0VGYe8Pmzo8Uu2DpdDevI9tstDkHMkwEs2lvuv
hPuT9zOwCv2oBnhSmYgzFBLoG/g0qb0AIFzcf2UXJxwJ0BfgOIJVSdJzRfqysMeb
5nIdvBShs2p4QKR6ULSGlgLeBybgym4torFM9c7W/Cbw2rGbzOBPO09/wqsr9+x9
edov7xwBamiztCtbTrCD8/BvouZ7tSxvQbFneka/T+EAH/XjEOCLhYAQR9eQRnBp
BBUutGZI6wEhj/JU/KmtCZxENDGKGdDi+Eftp5oWxu1Ufp3Nqj4=
=k8md
-----END PGP SIGNATURE-----

--Ge1rq4wwPkHnJO+8--
