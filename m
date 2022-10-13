Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA35FD7CE
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 12:33:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp5TJ4hLrz3c6N
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 21:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kGdaMr4P;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=A7/VD+zA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kGdaMr4P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=A7/VD+zA;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp5Sf0TQhz2yfg
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 21:32:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 522923200564
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 06:32:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 13 Oct 2022 06:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1665657162; x=1665743562; bh=J6tisFkE94Wcuy+ODPGwZLz1NTy6iguDMZL
	czEZYBMY=; b=kGdaMr4PB7eUIXSggn8GxKHlINqf+3rZDbln8GcV65UU3K6gZHh
	jfyGhLBBTKJaw2sDmXdkI3W+RnT3gvKtAMt9Kq4+jLo+27tQnZZju8+IucI3SmxX
	lqDPwvKP0t08sUHvfFMh8YgukqirJ0dwuXfCBDgsUfaG2cl9ltzBZBDBe6BAvnQn
	xEyxlue25YeaonB01p419tTYUTeG1mwRRXEBG8r36Fykvu/luAArD1jAFZOQnNf0
	QEG8Kd5KSiXccCho97J+zBWKDiGs1a6/Kv4EpUEEj0roUmJ3IBQTuY4b3kguWkRF
	K4Wn2WI/ldFcZP7Nd41PLhDurywWrKsfFMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665657162; x=
	1665743562; bh=J6tisFkE94Wcuy+ODPGwZLz1NTy6iguDMZLczEZYBMY=; b=A
	7/VD+zABNFQgMYA9sj/2VKWlTQsDOKmeFbqhXlXQl03c4eZKw7jxGHsxm/P1784X
	tGQu+6YIaAsLjZN/Uj6shsHh8PiDOGhhkY4nPvyDwNOlrqocJNkc6IbrflmMUUAc
	0IDsyETJ7E/wYw5DvwhVBbf6B7e2WOmHOLfcYVvWZvV6qNOo/bD2T3Hurq2I+P5D
	YEBcBrEDfevVMljjasup5Gg9GnmLgF3Cv61WLngly6J+xZ/A+jnie0ewm1Thjovq
	CYO5S+SHOZTy94cMvPJboobQ6u/GM8N1w4TIqQR229cE5uj7QmwD7s7eiJ7JLpOi
	vHKNPN0YH86IhbxDKTwVw==
X-ME-Sender: <xms:SulHYy4viu9RA9Qt1Fioryys_w5_KMEjIdwRfTQekstXFReWf0BRxw>
    <xme:SulHY76Gl87h2mklLHam09uTjjw2qFcAiHRuUUI7gu3DMh5t1yIGJu6oQFDWiK74T
    ib6EkHChdp4i5LZBOM>
X-ME-Received: <xmr:SulHYxdrGwwEaGsFr8sMbyc0fmE2ZFgIQWWE02MCIGxMh8ntsMfvF89i9RwO_hwvZg0fWGMSitbaTRKmVSxkbb25Kwqd5KLf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeetkeetgedujeduveeifeeutedvgfef
    hfeijeehtedtgffgleevkedvveeiheffnecuffhomhgrihhnpegtrgguvghntggvrdhnvg
    htpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:SulHY_Ku-rmv7Z1A8a74RDqX2Sjcu6KUhIUD--0rnXU9t44KE61v0Q>
    <xmx:SulHY2KtRcgBHY-9PVTDDYM4bNDsvqnru07L17bL7O9zMBPoZAFgaQ>
    <xmx:SulHYwx7rzJ1UmP0i82_Q5eLra-prbcEnpzu85uPcz8K0VKIKTLCVg>
    <xmx:SulHY1mTcqnyCFN8qNtJJ1Pf64sqmDYOtkOokrqSVA6fTdMTWx9O1A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 06:32:42 -0400 (EDT)
Date: Thu, 13 Oct 2022 05:32:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: OpenBMC Docs repo
Message-ID: <Y0fpSXZRBqtluIw9@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t5nEvsk3x1i3TXnF"
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


--t5nEvsk3x1i3TXnF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I recognize that the design document process could use some improvement
in order to get faster forward progress on design proposals.  Right now
I am the only maintainer of that repository.

There are a number of reasons documents stall out and I'm not going to
attempt to enumerate them now.  One thing that has been discussed is
having the TOF weigh in on contentious designs.  We did a dry run of
this with a recent inventory design[1], which seemed rather successful.

Right now the number of outstanding designs is well over 100 but of
those only ~20 have been touched in the last 6 weeks, which is a much
more manageable set.

What I am going to do is close any design that is older than 6 weeks
and marked WIP and then go through the remainder and come up with a
disposition on what the next steps are with them.  Hopefully this will
lead towards a process for handling designs at a faster cadence.

Net: If you see a design closed that you are still planning to work on,
re-open it and mark it WIP.  If you think that someone else in the
community is suppose to take next steps, please comment to that effect.

1. https://gerrit.openbmc.org/c/openbmc/docs/+/41468

--=20
Patrick Williams

--t5nEvsk3x1i3TXnF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNH6UcACgkQqwNHzC0A
wRnJIRAApUy0JpsDceyX4UsMc39ytSlbErFyz0hhJ2/bzOWQLXj74FdIf9Z1TyDD
3u+cFF22qvp7Hxs1LsyZ6XB8uURVYYI2LIgb8TOUcGlnyPvC8hN9idyaLPkQckjK
y4SluF7Hy0QQbj0n1rdhDsJWm/Oer3TQXXkp/MRe7/Wh07abKgb3ksuB/lZJxwbk
rYpx+b0OlLpV2sMcQcHM0hBzOm9HcxCsKTX+gsoKhzXZytrtmWB53en6ngoKW0HP
YweKw0m5S6sm4B00IzTq+QzTmqwyKFocm9mRsBCzbBLbq7Oc9TDexU0RdfTYloof
ie9Kt/l5r0u+gRN4l+uKWZO7r+3K4ZgoZgfFwTk2bJbprXkrf7w6qzvRuMchS1Ck
xNdKSTf4jHYgPH2FMIH8II0odHCuo/SLiZYk11w9R+cRRj9WfhEun2a1YAQaG+9H
6CSvL+4rYfDiDqxlRDX6JqAq7wlykhldbRKu6LIAcs4a3hr/qt5b+6QinKeKp0Rm
98bSq+yxjSQ9HvXF1dFU160+oxXF9lKHShjrSneDZKJOM+Q37ZIIsBmgORxc1CT+
2O5tc4IFuaWgNTExsCCZbg5eE7mxvbm9dQkcGLvu+qOKZ9w7tt3QN2qM68aKXKdM
oSDWBaMpvBCpSNtS1aVrWIchTM9W6Z3kjYKLxKxSxgdxwGf+fPI=
=8oSe
-----END PGP SIGNATURE-----

--t5nEvsk3x1i3TXnF--
