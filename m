Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C044494161
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 21:00:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfGhz3DP4z30R0
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 07:00:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=HGI7jUu5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B8mu3RqE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=HGI7jUu5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=B8mu3RqE; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfGhX2TZ3z2ynM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 07:00:11 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CFC105C02B2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 15:00:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 19 Jan 2022 15:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+oNR5c1tw/r3dngqXEAwXINDvj8
 yubzSvpaiX+RY5sc=; b=HGI7jUu5qRb4nyuojYMDJ+ZlZ4FB6clYsC09R4VynvE
 XYUBH84QCdm6CiEtuwX9NMjymxNCfyTT1idLk9sSYUe6KfCHMiyNNKhqS6ZMBjpj
 97wU2FD0gKHqq6lhUnV3uHq81vvs1AnW5W7bko0+BwOXP3aYp7JT++x/q2OeFSmc
 ETOxrCvuaReTWHObpkfU38zCnF1wVnwK66G11zFMpoF+cuzM6aFmWW2yH1svnmej
 u6KIEHSVk2Hoj/pfYyerX258P6mH0i6xeJ+8FvI0PgJW8Gb7Wvsx9w6xGhcz5WOr
 z8msfC1t0nAi4N+03mKoCTxnQg48DV5dFPXqWFiFRjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+oNR5c
 1tw/r3dngqXEAwXINDvj8yubzSvpaiX+RY5sc=; b=B8mu3RqEf5isfq6wzfwYAL
 QWRvJeTYca4bEgLkJcRU+Xq/Joj9VAcCe/211FFToQ8KfdGLneS4aP4a0EA2+YVS
 gCb9fdQnZeO/huDAkVAf2PAqCZ+xZ/8ag8IO6NRcHH+it488Ox/E5FKwWZbPts0X
 lvhzMQcjD/LOYZk3/MQ1HHis6LKTRPxsbNNmrxW8fb1Q5mVsEIkKP9Rm7NKLXzob
 etYMPabARrJIzsM6Z0Hi2kR/jf019SKK6cZJb/Vm0W/5IQ2IZJKjMIjUv/ji5Ye+
 6PKJxgFVRVi4ygXFq8uTrpqXl1sc5kNtPZisHM0ZUjHSR7uDOi0SyJStcV6ehsiw
 ==
X-ME-Sender: <xms:yG3oYWT10u11bAogI-53XWkwkrQNP7BgBXdSHxWFnAAnxXOp7FPbZQ>
 <xme:yG3oYbxvcAMswUO85pFKHah9S3RVmx625lr6CZo2dTOu0QHL4z6uc2KQvO2dni00f
 _IH78z4scK_Bx368E8>
X-ME-Received: <xmr:yG3oYT3T8nsxr8qjv3bcBJKnJX57fNIEE1G683IXwAulJi8CSdJuEM--h4vV4lf-HtyWg1xd0jcIJUPHkh5Vpwhu87hb--0NSdJCj9gFgkOw9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:yG3oYSArTNd7YUntb4gSaIsVVseBTvsEhVD4jZOJpLcP7ZIKAOT63w>
 <xmx:yG3oYfjg8Ndjf6yHdTfAO_KkBNLb978y4Cw5WzG7mNUsfbINNnFU1A>
 <xmx:yG3oYeo1NVGmB7Ok3AFxaR9JTMP0sDZAyQbq7U_tYCxDRMj0U1HyeQ>
 <xmx:yG3oYRde1KA3dokyK6TxKPuwlsKUpRMKkOlDdJ8cdDiKf2tUztPWkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 15:00:08 -0500 (EST)
Date: Wed, 19 Jan 2022 14:00:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming OpenBMC release 2.11
Message-ID: <YehtxgLG3KlzKFAk@heinlein>
References: <YbposjOPwc1puNvR@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="laRRm6GtiD1wKuox"
Content-Disposition: inline
In-Reply-To: <YbposjOPwc1puNvR@heinlein>
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


--laRRm6GtiD1wKuox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reminder...

On Wed, Dec 15, 2021 at 04:14:10PM -0600, Patrick Williams wrote:
> What I'd like to do is target January 14th, 2022 for our 2.11 release.  I=
f you
> are interested in your systems working on that release branch, please tes=
t the
> 'honister' branch and let me know of any issues you see either here or in
> #release-planning.

I have not heard from anyone on interest in a 2.11 release.

--=20
Patrick Williams

--laRRm6GtiD1wKuox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHobcQACgkQqwNHzC0A
wRmDBQ/8CDTFXIKQlxOZCWuHOz80vuqrPPGtqRvqSiQm4Nhqkchg02RGkDgX7LUM
UYFPEE1ViTlHvBuvX7JZwJ1ppujNnkG3JcaCbB3p0ySdbRsQRPbI6J9n063pe8lu
EsjdtoA6LD7g3U8h+QsXL1rfsp7uZ7Ztx9p/Z+9vG8xy714TppwM0PegnDGGfSUi
gfctl425dYMt5WahelxjjgD3o0Rt69qc8BvQ0CUBQUg14/8yGx7af/p4S09kFFQA
Yf6qzB4kzc1mTZ0en3eZ4pfxrFSFW3Ppkfkl3B+k6ZHKVHc0MQViUmRCsELTK0b4
TkBrwGioEbd4qMmHNXwC2Dcu/+PfjqE35zoz3ElZsN7swvEOkDtoNrnqH0dgXWKs
UhoA84vVgqqjiv2MFQNqHpfik1Rn/59JUAE+1A/ZTAE76AcM/GxRh/XQG3BeQw3y
91470DOzcXdE3aJfq4Yzo5vIZahLVUAXqw+77yVFSYpBaWZrBJW4SwMB+nMnNBz5
Pq48zW5Ma016x9OOC9FWW3hlrC5WkAa740vEePDdE94KtrWlwv84eVeWwWbEl2xW
IKjaHwwWsr4s3go09pB1vcrdnLkBnYxYHjvvntaNr2JHI2TXdvE8UNNLzvDkWkEp
mF3e+ssFB41J2rhWBVMofL7k/bosuI4vU12ucCA5wd05yYkpk0U=
=wsCw
-----END PGP SIGNATURE-----

--laRRm6GtiD1wKuox--
