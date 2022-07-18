Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC15786C4
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 17:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmmhP3602z3bd4
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 01:53:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=gYSp4gpq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PUe+WLRj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=gYSp4gpq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PUe+WLRj;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmmh06k0Hz2y8Q
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 01:52:48 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0BDBC5C016D;
	Mon, 18 Jul 2022 11:52:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 18 Jul 2022 11:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658159567; x=1658245967; bh=RDrk5aHU+L
	71Nf7RbGIbgK6v4WPrwMJhQAG2Q58Hwck=; b=gYSp4gpqvJFuiAU0fQcZCt1m4w
	7UrE4SbKXv5vkgVa9adZh2T7LU5C+pCHX+NjXz8ezPWQbpiXptanrRjen2usBspR
	8+v2jWa5iZw0iIkFm6r7z9SMepFukz6/WdP8vHCa2ZilcxVF4czNRhsDcRPH54xJ
	Xdi2ouXBV8pM1kxvgw5FY6FCrAq6HHGFRjGArAU6sAdJ940dTcLHgWKA411Ml47m
	gYa0W+4Rj7xVnWCNZONTnt7qIpELnIkd4wdH3/sxY2R69l6iAZvh8lDRCM9oo8jx
	giYMMNob+v7BMcX5FkrrwKHLjF/567bzPhiOD5HcKWSrcDxc5QscT1a/fdZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658159567; x=1658245967; bh=RDrk5aHU+L71Nf7RbGIbgK6v4WPr
	wMJhQAG2Q58Hwck=; b=PUe+WLRjbIeJJPdtrrtokmcQKF9FqOoXqtKaqXNTXQxF
	KSnRiHGvsq51ZrPdfdpbFPdXyta158MUfHtpyUZbrr/xDx9hStmGuhXBW8LXRQ6R
	7pc0JuijPn3l9SMQp88evINETniDtD00zuAojFyG9CquKAw/RvyCzZJv2Dey2o32
	K3yx68Tz53BrP0TkR8PL8FAxyd5vmVcnSEb60SKxHbDWbBTspmsGs+sLqYguOzNf
	NnGx93bX2aaSzIqohT6ANczbVQwMjejVsOaVSHmhoHNixcGlxLijGfsi2ZiHk87q
	DdtX9nLsr31yclv++1FAPy4vCjp8p2IWm8da148fYA==
X-ME-Sender: <xms:zoHVYjOMyLvtqiWcztF2vAiIs8KM5Jbx-wprDY0xShKNLclJdBvcCg>
    <xme:zoHVYt-fU-MJQREu7E5SNMLFdlfSpbly3bR4FOvIBqDSR2hiy37AFF_xXmiQPGJHu
    G1Qqmjf_tPzbC4TmWU>
X-ME-Received: <xmr:zoHVYiTEMafiAJG4JreEw1-lZTyaIRCKVd-tsWao2o4rvRV3-7UhDtWIR58HW9ctDQ_zlqOR41c6V-TQm3De_jm3bWEF-A9f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeffhfdvfffgvdfftdehkeejuefg
    hfevvdegtefgueeugedugfekueeilefgteelgeenucffohhmrghinhepohiilhgrsghsrd
    horhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:zoHVYntHfDQc93aHI7uiSzYHvhG7PTiyIyfmBrdGzTHvm-eHAKvsNA>
    <xmx:zoHVYre1yszV3wXSLsejOz3px9bh0-vXTyhzbv71En3uLAdLl42BdQ>
    <xmx:zoHVYj1lLAk58pzZmt6lsvIoeXYDNgplMAVAykJ77e71rcMsQaV_GQ>
    <xmx:z4HVYrnBvVOTSwYg_N-GMgpxrLivt90JQukOIZsheY_THjQgH6ehhA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 11:52:46 -0400 (EDT)
Date: Mon, 18 Jul 2022 10:52:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Tomer Mizrahi <tmizrahi@nvidia.com>
Subject: Re: Join BMC community
Message-ID: <YtWBzZVirH43uqrc@heinlein.stwcx.org.github.beta.tailscale.net>
References: <BYAPR12MB2597603C2E7B346CCB06DE40B0B69@BYAPR12MB2597.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gDa3iGZz43KDzl9R"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2597603C2E7B346CCB06DE40B0B69@BYAPR12MB2597.namprd12.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gDa3iGZz43KDzl9R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2022 at 12:51:46PM +0000, Tomer Mizrahi wrote:
=20
> I am in charge of product marketing of BMC for network business unit in n=
vidia,
> and I would like please to join the openBMC community.

I can't tell if you've already joined the mailing list, but you can join
it via the lists.ozlabs.org link here:

https://github.com/openbmc/docs#contact

You might also want to join the Discord server.

--=20
Patrick Williams

--gDa3iGZz43KDzl9R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLVgc0ACgkQqwNHzC0A
wRmHGA/+JLFjuzi2MgynNo05iYkcQdSWNlfcXEagrnGV3aBMMo+kapyjK5uf+Mft
iTYPH/qTVMljO4uOR+Dogy0fbAWNzm2644RFJ1PLmLcRjl1xGVpnyldkXwh9SS1d
KVnLcN4pfSHj+xT843rSBSwziyEM1GC1gJT5jeqjpKBZeznkxZxnAChaNwtFHwam
FO2b76LgfVFltN/7hgfLOZxGiNl+/s9kBq19iRynPeXR+JxLb1xSXNEB6D+y3RmS
3afK1KiQUTBt5c3NZPvH5KyPxR6h5YRDeI6QXh0x0DHj4KnrGNoR9E1LAIa2Y6ov
8dh0y96nRzUsXi9vjgTuxm1zhLH2mRT/qaTNw88GsrX28ru8w87feL3SY28p2GVp
8JPp8f5Ng/+Nn6nDivrRWbrN2hA2yHCqs7uxhGE1qY9M+H+yerO0FROZHsZR3bAk
cG7YR5Jpnwf3eq4XTsLybVE5OwWF4dZDss8rSWMcM0B7odIVyDJxMRQPjuJu9RyY
MNYNlYyWqXrzj1RMJAfRS4tP6rbTY5jFVoRXcM2FpqbMGzigaKWEGkkDEMGQQg4o
it6TExONE/CRZX/QXhrZZxVyVLdX7jaXNvzAQ8fDjGUitcRhjyfK1i3dWbQ0fHm3
syLR+I6UePMXEjoUofK8vR0lGj8r8uxVh9RZvXuVwHj5mYWfVDw=
=gnWP
-----END PGP SIGNATURE-----

--gDa3iGZz43KDzl9R--
