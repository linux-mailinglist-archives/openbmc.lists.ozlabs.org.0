Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EC606145
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 15:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtSkg2D0kz3c7q
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 00:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KgUr76UY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Igss3TNz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KgUr76UY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Igss3TNz;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtSk042Jdz3bjL
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 00:14:31 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 23C915C012A;
	Thu, 20 Oct 2022 09:14:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 20 Oct 2022 09:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666271667; x=1666358067; bh=sNDBWHq7z+
	YfFh3T2eDDQrmZDHIwBqC2yu9XR//kfVQ=; b=KgUr76UY9BZrc5ZYAswSRr8plm
	52kfEXLha5zaOUfFsRbCXZNYab+fFRRDBE6dNBXJfwr6lZG0HV0A/6H1MAXNPHBj
	rFeuMjG6YDSTnhLLCZiQr//snQh7jIBL+5fMOCFn+RW9tk6slxycWjXiGe+Cktjr
	sa9qO9BKwVBTTuQXCLYG1wvgKP3r5VXRQe7SrGu6iiDFmA8rIFbr2YX/RJjXWnIe
	+NR0md2VDMSklQhWZT9NMWgGF8FA6v8sUCrNi5Tb1iBtv9JJuxquqpGQIkX2PtBS
	Q3+F2891Nc74EhW8yne+eZVwpxR+3GjdcSy2WMPGwuZM0+W7c275aOwYBDHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666271667; x=1666358067; bh=sNDBWHq7z+YfFh3T2eDDQrmZDHIw
	BqC2yu9XR//kfVQ=; b=Igss3TNz3u8oxCp1LKzA4JVg1V/fDtvKui/xU0DhTRww
	cPRYlO5HKsagcJRmb8h9tzPxQ3b+eMmqN3Q+xA6YgarcRNO+KSdAu0gPnmlIJnFl
	0B9v28lycj895QhSxsNP95/H52MD5wqcaiZM/N95J+LFD73lsOvLJ3ZEewuw1/mO
	uFzmzmkkahHuKdHA5Lf4ogj9V3HnNf33R9vloLNmXU+qnTkylZuMJmH4H0Asv/B2
	9yEZUxnASl30aLazApC6Da7hkAbyMfNyXe4RDkTOMaQyChbW1XAmJWkPBOKHYweJ
	P32ubNBRYa5RQSiGvYnzsptbv7+bQ42uUQ8RJ4Xs5Q==
X-ME-Sender: <xms:sklRY5uv1o1Hnx7CobKsClSE1zAo90WFYCIjPRqNrR3mjSbI9fdFIg>
    <xme:sklRYycjCNsuIhf4-rrwHb9Xwc1nsJt0oLZWHjxBcsn8qUzxycxMw4ZhwgAteWNH7
    yaCzHiI0cQ4PXx4Bls>
X-ME-Received: <xmr:sklRY8xZYMP1-yR9rxUcayVMM-tL8IGjlVeJu_mIgvwoPrcSEQmNjgRreM7W0RCGLbL6r9u1Yabw8jj7ZuJ-fQUhaVRXraAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:sklRYwPwprUxwgnve9BirhivYeg6w6XAzWD8ZZshdjP4UjeaMQKFzg>
    <xmx:sklRY5-nvmw2O8xEDt1Bd-Jkskpdh6BCEZvRJ32itoS7tfOI38ZMZA>
    <xmx:sklRYwXVQIH42hwzkXQHo-AP7vPfbxdm5l9QiQMzHduJ44bqUR5XsA>
    <xmx:s0lRY7nYXMIIwnwZ66aPwnLWEtn7OxXrP76eaYS-vq6iQPmwDX5nrg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 09:14:26 -0400 (EDT)
Date: Thu, 20 Oct 2022 08:14:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deng Tyler <tyler.sabdon@gmail.com>
Subject: Re: Are there plans to merge up to Honister 3.4.4?
Message-ID: <Y1FJsc/N2c9YEuOO@heinlein.taila677.ts.net>
References: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
 <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
 <Y07lMANd/vVL9ph6@heinlein.stwcx.org.github.beta.tailscale.net>
 <acf64248-8ba1-56fb-66a6-9c07d6d9112d@hpe.com>
 <CAO9PYRKLNFg+0zQMGrbNcX3nQPGfPPrmUJ_hmW3N2kukPK9N4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1bwdDel059O7AFmc"
Content-Disposition: inline
In-Reply-To: <CAO9PYRKLNFg+0zQMGrbNcX3nQPGfPPrmUJ_hmW3N2kukPK9N4g@mail.gmail.com>
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
Cc: "Miller, Troy" <troy.miller@hpe.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1bwdDel059O7AFmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 01:01:25PM +0800, Deng Tyler wrote:
> Hi All:
>     Do we have schedule to pull Landale 4.1 branch?

It appears that Landale is scheduled to be released on Oct 28th.
Shortly after that happens, and the meta-layers we depend on similarly
branch, we will also make a branch for the Landale stream.

Right now 'master' is 'landale'.  Whatever is in 'master' at the time
we do the branch and subtree-update is what will become our landale-based
release.  That is to say you can start development and testing today
even though it isn't named 'landale' yet.

--=20
Patrick Williams

--1bwdDel059O7AFmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNRSa8ACgkQqwNHzC0A
wRlByxAAmVh7m/teJcPqF2/5K+OaPZ8AT/reoLmmKvl7Tq4bf+YjueYY3uKvoj22
1p8Oda3eC2aMbZtOECyzoQUHOHesummN/cmyQfrTyUn6InlCaZlYZxyznLMAFtl2
Xb75Kfx+Yx2itqIWfS/OzYBQ85Ic+4JX6i19U778GuPMHfbKPg9GE08NH7S+jL9F
WJKoC8M97rhlPbk8i7mTeKUVvoC7MYPTFPL5IvE7tg1+frzWOVs96a3rPfgXSUan
u4SKt3diCttvV2T6/Si77vD9plCJKljSLGIn2tH9jNIZ4OxWKdvAV/xMgCMQNiRl
MLHqC/wtcygD/XPl0hILq60+/XHIx6SqvKwnrhNA/I7O3hsjXK5s4H7lgwfyZMB7
lNkCgEETwaW1Q4fHFOCuN3L7+rUzNBYa0EYxvRknBu6aCTZl476pllRVYW5Xvjpb
fqOh2IvaBoZJJMQoQCZIhgejpDVNnbAzNWuX/9Gk6fWYSICDG0lzpiqA5U29U0Zh
yGT1Ou6/oVTkHCv9zHAR47MH+ozjfwCY1kQgWgcHEe9sv7BzaY3cYB0oGo3g0Htq
UZoeMAiATFNfh5I/6f0BN+cfxYRThyN0x9remy3a3HiVngq2W/Cpc99zbyr4KHZ6
48hGbCFQIjl/50auQGzdyhJag2ODYu1twMsUod5qIJ1PsJCEkCQ=
=CnAE
-----END PGP SIGNATURE-----

--1bwdDel059O7AFmc--
