Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6985A9B36
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 17:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJPYl6Q38z2yHc
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 01:08:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GtRcSE6V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ekCHLpJd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GtRcSE6V;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ekCHLpJd;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJPYD3P7mz2xHZ
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 01:07:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 67F635C00EB;
	Thu,  1 Sep 2022 11:07:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 01 Sep 2022 11:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1662044857; x=1662131257; bh=NtRVU7Xuj/
	fkudduBkypYu2ApOMXOyMh/yomstqsD6Y=; b=GtRcSE6V+GFLtSS31pbFSr/e7f
	ZVhQCEOHiW/tocoC1XJYMPIVetD3/5dh6FqhtwOoEHDoAXX01uYo1qhrwdE8QXIn
	EKP/+kx0OaAgjQIfzkmj0xTUbH8pXRSZA4WWnhRU/WZhVn0VCrxDatHIxUR/Y0RI
	lWTjcbN2mv/BE2c4fyglMc6Su5Tm141j+Gvk9Iy0wET0RuBsCREERep8zB4X0O00
	q6nCKNMBWC2Z7tw1gzsYIXr0TYjdHfn83aAKTl8ljM/vOKFSmCBMIb/DKdV7bqou
	UvdHpt4EztS26k/zntYuXjz53TwPv1bZjzPMHj9LglIw9FLtT82KDunu1VBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662044857; x=1662131257; bh=NtRVU7Xuj/fkudduBkypYu2ApOMX
	OyMh/yomstqsD6Y=; b=ekCHLpJdB4fxBXhbs6wxwe5y5IL9dgeQFjxTL4IBWFoc
	dwJOBLin/yv4YM1vn3C4rJewAd7TziMThBnu9LT1WWIckVF3R2R9ZuMqrIlCk27q
	dBAX5rwxHmiqcvZSsv+ttxNZ5HCQQPY19CkD3wdH8zm1atb4w1bZBXqSUL/M1zzA
	vfUXmGiQ+jc7w+i+rBuVESYJCGUqd0RVTVPLpdvVCsp0Kbw+NUVk1juBJokOd/yA
	88AzZw6UAriqcPpokCsPyY9AZPCmapSvk1/H6ML/ET6IdUHHHwtsqykOfV26YN3U
	DjnoZqV3tLuBobnJa7AthSYXX38iAFEzWc5k1f+jeg==
X-ME-Sender: <xms:uMoQY9dmFxPoU9LSL3quq-cG7f1t5umGteZTmZqlIaVqdHzEggwgGg>
    <xme:uMoQY7MPhq9SAlzPqGohre1Yev7dkVChG1kfaH3jzUwSOiLpwaj2AUdeVzwBNndzo
    F1Dw4SrqErraoNC0FE>
X-ME-Received: <xmr:uMoQY2jZk9ivc7UUbTdoVjHH6bXPkvtn1rf_yQ91spVpwkA_ZSLBASpD-hPFWd0AozZExNawcEIIJtkSr6qnqYlLmvGgqt-P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uMoQY29tCu07-uLX6GDcJ89t7bLbrpbuQdzVy_-MfikubKW9SZcx8w>
    <xmx:uMoQY5sWWqwsQHEh51mfOfr_i5Z6MRCIcL1kl8oDLZgd4j4S966Z7Q>
    <xmx:uMoQY1F-dRQKcOrUpiT0ov-s3mz-qbuxAPXvLan_aD6pScLqyXoofQ>
    <xmx:ucoQY6UXsuXizo-1KK7DjnaQ6O0L5EySQbB8rlJ0Sh-meQsGcnl9jg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 11:07:36 -0400 (EDT)
Date: Thu, 1 Sep 2022 10:07:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxDKt2nl4codbEFL@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <20220901124153.ofhmyymhcra34akr@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cKaupFZP+uI2kIrE"
Content-Disposition: inline
In-Reply-To: <20220901124153.ofhmyymhcra34akr@cheese>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cKaupFZP+uI2kIrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 08:41:53AM -0400, Brad Bishop wrote:
> On Thu, Sep 01, 2022 at 06:25:24AM -0500, Patrick Williams wrote:
>=20
> >written entirely in Python, which makes it very difficult for us to supp=
ort
> >on any of the NOR-based systems (all of them except IBM's latest).
>=20
> Is the suggestion that they rewrite it in C++ and contribute that?  If=20
> it is, why would they invest in building a project and community from=20
> scratch as opposed to using an existing one just because all the other=20
> in-tree servers are hyper-cost optimized?

I'm not suggesting anything at this point.  I don't really understand
what Keylime achieves.  I'm just pointing out that it is Python which is
another negative for it.

--=20
Patrick Williams

--cKaupFZP+uI2kIrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMQyrUACgkQqwNHzC0A
wRny0RAAiOcqcxQSEl6RHB4XE+9U704AyLeBTAkEGjTQDEQIjsz3Mu1g6Ye/szn0
6rDukanASAILt27VGkuCxuihzaHeZ6mG8wuf7e5zhR3f0FIct9ymRiYjk/SY/0J9
xHvneEkt2kZzfnGc2yyVeQzu2+ZgubqJfSOnpybc8d3RAboI4W8dCcPFR5COZ3+N
Lm80tOdzAxCilE9W8xoYMVucv3NgUfLzKPPTxh13eLrENxIVE7RGG5vCXEL6nVTU
swZvHYLL3weHCiCNVqu0gPMYHhSC/1vZ9StC9xajvEZLwyglK16TZUB36NzD9ZbP
ODP30Mx1oziCyc4yOP+ar2T3ifStwjNOJZQwrx1CYkvG+g2GIK5Nx0qoyGp9eCe1
judmkVWs+HCzkSkmsc22ejVLzCZF1efJJCBPHP3b2lsiWEQNXcMFNlykIrxVQIjp
0hfhqCZmbmssMSec6ODSHSGQvVsSshJicpBpaWLN2hJivsShq9SRK+Zyi6p0TBd4
9DHTLqYJw03G89dgeZTzHZ4eeo9rJM8WnFACQ80PFq3Et5Q2W+MMeVe8SKk4OxAc
HmtYU5VrRZwg9meLOW/1Z036uf6DDB1JUVjg06FImns11/5jdnvQeBqupvzhhaAZ
BZMrMcgJOEF8kE2sGzNH/KDoR5Ijf01QkUlE2KYy6d1ndRJMRRE=
=NqBn
-----END PGP SIGNATURE-----

--cKaupFZP+uI2kIrE--
