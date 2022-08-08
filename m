Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C760858BE9A
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 02:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Hmp5Sdnz2xnd
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 10:55:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hezByAYP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=y/RdXypN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hezByAYP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=y/RdXypN;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1HmN6LG6z2xJ7
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 10:55:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 979CE5C00E1;
	Sun,  7 Aug 2022 20:54:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 07 Aug 2022 20:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1659920098; x=1660006498; bh=EaYs7dN3hz
	UuAprsV/dSjpDg8fY/FYaEIfkWZLKz0cQ=; b=hezByAYP5K+tQb7651m+sEO6KF
	nyF9hurg8EVeEusA9XbnApQLgXzXcp7BTZXAmbBGolNwc+d5DhVvvvkpeuCo2qsF
	jPSySHE1UjCJhays3lDOcCH/ExOF++ww1LvAigLv9YQgRlKWuBCdXMn2rX+9g0ar
	FU7wUR8GuKdzpbANzIeAVxswgh8ms2CLQlmFpPMVlH/lXHNvk9ma45+Wg3sX/TA9
	ubuITBN59fjDucer8RPYXBHRaWOCw4HkNwB7Fl8pHQXPaHDcWIvOycCiUUsT7swR
	vmtRIsBLlfCe2Y044JqK6EphV/55xZsAkEEkZI526DEnvCquTt9vRs26e68A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1659920098; x=1660006498; bh=EaYs7dN3hzUuAprsV/dSjpDg8fY/
	FYaEIfkWZLKz0cQ=; b=y/RdXypNUv/NlNbd3R/EKDCNLNezLYtuXueQzkBcf+he
	zHJNMlyk9LzmHUtaGLExKa1cFOfne/CTbJlc6hD+SQBdq/MBQYXL35eq5Ce7dEf8
	J4WURQQ8ikKOl8IqrIJLX70Uh/humNknjZkaet3rSdlt7vh++spbz2Ysbtb3f5qj
	qgNInUMdwS7hvkeRcb/B3ZaEHzs918T3vmqjOTcyWoPnyWgsNgeJm/2K6/s5YtrS
	FAi8CjgLonfUl8Aa12kQk/eXGilcS/vbAtabINL4pOfeCwOECzvuAaihidK26upX
	y+8WEAoWkBfpaocIo71e8DWIJMBo4CdCQGAH9Kf43Q==
X-ME-Sender: <xms:4l7wYp7nPR5A44fq9PspUtUODhfH0sUnrXGxFPRa-htzxin9879Xkg>
    <xme:4l7wYm6uEVC0HWXBJEiiMCRulFd6zNa4WhHZeEM4DpnZWtjFK9-IC3PnValXwwbPP
    fnKgs-mryoXbw_32DI>
X-ME-Received: <xmr:4l7wYgdxBiMqyGI8JqpzYflTzD53AZR-ccYVtTP9h4f6x_g1vStf5i2aUlVzGEgzUiupwsARmTYJsTVaFW7JU2DwexgJDhog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4l7wYiLWoTwAnSyWa9ypMpl_70xrHbTaKtcZoTQuwq7K2B6k9FrlJw>
    <xmx:4l7wYtJ85lYn5O1ZME5qOp0oTQ6AGSnkehPX5oLdl_uIVHue_kt0zQ>
    <xmx:4l7wYrxtxsKxXSQPUEBV4vH0NpdwegkW14VruNO-nz51-VvFtYJ4Xg>
    <xmx:4l7wYkWSYZASAnl2OaJdkJADT42SVJSgnGiNZcGn-gKpK5owJWSCaw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Aug 2022 20:54:58 -0400 (EDT)
Date: Sun, 7 Aug 2022 19:54:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Security Working Group meeting - Wednesday August 3 - results
Message-ID: <YvBe4f0rfWwbGtuC@heinlein.stwcx.org.github.beta.tailscale.net>
References: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
 <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
 <9922163c-3d64-48ff-a808-b4b8dcfcb32d@www.fastmail.com>
 <b090805f-0387-26dc-0274-eebf0f28c432@linux.microsoft.com>
 <d147bf3e-6140-441f-8393-9677e25d8d82@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SS57I0cIqJvKTRRG"
Content-Disposition: inline
In-Reply-To: <d147bf3e-6140-441f-8393-9677e25d8d82@www.fastmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Dhananjay Phadke <dphadke@linux.microsoft.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SS57I0cIqJvKTRRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 09:55:00AM +0930, Andrew Jeffery wrote:

> >> IMO Joseph, you should just start hosting the calls on discord. People
> >> will move to it if they wish to continue to attend.
> >
> > Another issue is current Webex setup is, messages are not accessible=20
> > after meeting ends, discord channel would solve this offline access?
> >
>=20
> Yeah I think it would based on a quick glance at Joseph having=20
> commented in the Security voice channel, though I haven't used the=20
> voice channel chat feature yet myself.

I also made a #security text-only channel.

The voice channel having a chat is a new feature and I don't think most
people know to actively look at them.  The user interface for it makes
it much more difficult to tell that there are even chats to be seen on
them.  I'd caution against relying on them for content you're expecting
people to actively read.  You could experiment with them for discussions
during the meeting and see if they're useful for that.

--=20
Patrick Williams

--SS57I0cIqJvKTRRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLwXt8ACgkQqwNHzC0A
wRlmPw/7BjyQUltwsLab2w/D456ApF3q9thn3ccyWP8sMHftH3f6/f0IBNs5L3UW
LPf1A7NKt80+7MATkkRMLPcP5hzYDwWUP5KP+Mg5EX+jJF1ULZjbHC364x/tzqzy
Y20t4xIF4oOO7nxK4Rn39Wlul3LVkVEtv2kuJWRmxtYmjykVP4/mPhc/BsRbOrmb
RcX7vkq9P02GpleoBSG6K6UDbTx2bGvon9DDZ441xGzp1xkSSe4AsCFffSOVCTg9
LN+4EGvAtxYWPMpabiK1QbHegClaKcB6jDjVtLMiiuhsSy6pdp0ou4Fbf+Nv5Ge9
QVgK7ETtE0z5FkxbG+nfvCj+ALlgAyXlpWiMUcUEWy1aPJI7brh/Uo/su4BlZNBG
ch5tjw2bCor3kZ1+l+Z4Tq8FM4rXVOUw0rVmqGBj61FknwdvqhhEG7xYN0MV8sHI
dw4ArEJP/qIi3YmUaYZpk0fPR3H1qn7+8r5dFw7/Axq958RzOQTdI3VRZDjQ8xud
j8V+YPTiU0WeTndegJgHWbY3y0Ahc1BoPwFkXqHjxlmwYo/72VgP3oOk/lCgURGe
BwcxBx9AqA8ZpR7HuT9QGM7uDq05wiudCOSD7JN9jAsHl2UXWb3tjV3Gv8GW1kWf
OLkEcFa74qsLfyBEarjCPzWKd2jwTJDzsak5ikQWWaJa1pFzAgE=
=t5MQ
-----END PGP SIGNATURE-----

--SS57I0cIqJvKTRRG--
