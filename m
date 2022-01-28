Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E624A028F
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 22:10:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jlqqf1hTVz30Ld
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 08:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=vBbIr3xW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Y3UKVF/l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=vBbIr3xW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Y3UKVF/l; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jlqq81MBdz2yJL
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 08:10:10 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CAF013201DDB;
 Fri, 28 Jan 2022 16:10:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 28 Jan 2022 16:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=GMcXRlx6hb511ML1uLc0fwp9jyX7hkUqWgyAHU
 BJWNY=; b=vBbIr3xWICZgj1KE9cUXjFRT4XlUqSFuYrJhKjj7F62y13ylKEwLAY
 hPeYVqMTxHYHTRSZjYPHhivkZUGiNQxb3GvLpQuQebTCXM6PKCNCd7Dpp5HEoZL+
 kpC5Zd94rvcb/fQ4NO6nImIqMD9n5VMCaK2FhjDjrT7ad4ntV6qn9Vx08baq0bUZ
 TIneDHjdXBKd02M0zD0r7GcC4em05uHttqwYWv6D+KA9zN6kHuFzUnyiFMLfkNNx
 4/Q/oThY2cDAVTuv43klclmzIH3iwQuwQ0a+Yw420qtazB96xTj/Me30z9qzg9sd
 1J0z4Y0BPDNeBHTbPjIIq7zhI7Q0bKBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GMcXRlx6hb511ML1u
 Lc0fwp9jyX7hkUqWgyAHUBJWNY=; b=Y3UKVF/llsoHOK9cDmZbVoIUf7mreZuR1
 H1JsPkzc4Jprj86HdoqDCfYv2Br7jfwP5B01KKq7l+YvRiHxLe6uCZgBeHGWUCdV
 Ig3h0i/e4N0OXmvsh1XFcsXchL6duy5LrpCD1/4vsow7/Ism2GK16zdYVIKw36Gn
 zXGQpsykv7FG0tn7pnRlUQlICVXwZQOiDA+Fo+k+Qaj/tlp8be4c1tHYShx+rGDY
 anKvArl3u6kKsoTyhnPoBSkmrYYs/axgRPZY/5U3rzjsljbFlUxYRK5EBEfYS7/T
 CcG+Moc4RYwU3PZCYhK9ck9tguAW7dqbjgL+F2jEYoZxwd10U1QHQ==
X-ME-Sender: <xms:rVv0YQpaKad6BrLh-Ci2B2QtdvVEiKZoxw2GYxrIMBvoiSvEdDznAw>
 <xme:rVv0YWpurkiAopgs-QGeXVvvwhB1gACRh50HAeGKUPRuWCESGSP1ooGhDtSYXzY_T
 uSpBAJpYz3mLRZx9M4>
X-ME-Received: <xmr:rVv0YVOXkFZj79DxPqYgqnLabFhnxFNypxmzJEMZe7KRlwoAQpAo-ARggq-RUPuHiaefilYrVY_efQwxSX8qzL5jL_daJawbgO72pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeehgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeevgeegffffhfdtkeefkeefudeg
 heeuleehheegvdfhtdeuteevveevgfejffeunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:rVv0YX5s7IJQVyyJKHq0fr_ZZYXrRKqydjPDI5XIYLBsa8tiSxgvYg>
 <xmx:rVv0Yf4pj6xRSapx6fMbWnMJSJ5wmlnfWH7k6xqRaaXsxLufXeVhzQ>
 <xmx:rVv0YXixvZN5JBEwxm0YqZ00wmswpnG2v1NfSC1HXnpUpOnN8n_EYQ>
 <xmx:rVv0Ycgr7IqfHs7SVvLiXjgVecu2_m1H-ZxjK0HktG9Xsab7CMtTGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Jan 2022 16:10:04 -0500 (EST)
Date: Fri, 28 Jan 2022 15:10:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: TOF Nominations
Message-ID: <YfRbq768uFr7MgsL@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
 <CAH2-KxBAxkZps=+Sy1xZCD=+D2bzMATd58tUEnzAH5ZBXPhZ3w@mail.gmail.com>
 <CAARXrtnn5yCC=PMsmPs-YxDRia4S2+-zFwNm8XYFO3TSGmTuAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j2lZIXSzoLOMwSBG"
Content-Disposition: inline
In-Reply-To: <CAARXrtnn5yCC=PMsmPs-YxDRia4S2+-zFwNm8XYFO3TSGmTuAw@mail.gmail.com>
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


--j2lZIXSzoLOMwSBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 07:10:26PM +0800, Lei YU wrote:

Hi Lei Yu,

> I would like to nominate Joel Stanley to be on the TOF.
> He has been well known as the maintainer of the OpenBMC Linux Kernel
> tree for years and I guess everyone who works in kernel/u-boot/qemu
> knows him.
> I think he would be a great member of the TOF.

Joel is currently not in the list of eligible developers as the majority of=
 his
work is not in Gerrit but with upstream development / downstream trees.  He
would need to confirm he is interested in this role and petition for inclus=
ion
per [1].

1. https://github.com/openbmc/docs/blame/master/tof/membership-and-voting.m=
d#L89

--=20
Patrick Williams

--j2lZIXSzoLOMwSBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmH0W6kACgkQqwNHzC0A
wRksaA/+ICYHfU5tKQ4uoueH3NmkbqrWyBW5KEbW/JF4s6nWk/n7qo01x2pKIVIU
vhxSCAe1C5235dFSFoRJVf0uO3+mHcSh7sHcxzzDottNGiO22/+m0dhFHnWWbkOg
V3YPxXG8DjTV9dCsYV9SbIV+eU4WA/kevvW9LYigz/WVMhiBCzQOx+EHJGEmFfBq
S1srIVMvLSGLjfVmBjw3DITwCs8f32hXlKNCx0CvEjqLTlBk6BRy7LCKPgYxgirE
IhRfeqhhye8t7472DPTbZ9ddfoYn7ABEuKRf7ZM6TA/oAROw6nxi/i3ZUrgN2Qlb
XfvqEk6a3lm/dv0WTQ5rjrPtwOSpOAl36O5vrFhzJD+Qe6TCh0etdIz9lXJoSjR/
JEginpD2JUDqhUszh1yO1tot5pl55YJvkZKAS8YCUfFnMxypCwdXRAEoCUDorO9q
SU/155xoP9f7tExc/O9hzXiShXBLmOJoqqizd3z9OL0CsmEHXcXPw05xfNfBKHXc
GAleU5PB8ZE0roJvpcMXHJCTezm+5J/0CRJWsalBr204R65vHwIm93HwXsQ9AUMi
E+8A9FuC4IdEnXX2lWZYg3F6cwU/mrVvurphc+vDU0TwH65Nb7GifiBXqAbC2uc/
0clLI71ZDUET12LOdqlVNt+3s5H+A7hNVADzFEefbLUPeSKSobg=
=vw5W
-----END PGP SIGNATURE-----

--j2lZIXSzoLOMwSBG--
