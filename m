Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE57A0769
	for <lists+openbmc@lfdr.de>; Thu, 14 Sep 2023 16:33:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=S1W7GJBd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BWq3miQO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmfvg3vL3z3cG5
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 00:33:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=S1W7GJBd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BWq3miQO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 390 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 00:33:14 AEST
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmfty4nQVz3c2D
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 00:33:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C16A5C07A2;
	Thu, 14 Sep 2023 10:33:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 14 Sep 2023 10:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1694701992; x=1694788392; bh=SDYIgomlY8
	swh7y93pUH/uABEEJeOXYqPLVgkNDVhgI=; b=S1W7GJBdNcqqstuDueWoA6k/b+
	FZowgDkOMRoQNIltgjW8sApNpOOwvttFR8oHldw6uzFQTjSTUFHg6U0AtXxqb+ZU
	xa+kprNZevmNXbPur+ai9Z/ZFqthax/mmrw8iHWT5p9uk3Jd1ymyjOl6Wfgos7Y7
	/xGTR8xEMjg6UewhMxNaU4iWnEtjkOrqV3PVj087c5KmNireawqMKyugeQHdvajV
	kh2nxgbKP3krqpFYUbtmWXbsGRa6JlDGeGg/frON87w/J06DYFymnztDUX39XnWk
	tl6z2SGq4hbU6ZakAd5UC+YMPQT9w34ZcQLdgaTAujFD45Wbz9kaWCSLe5eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1694701992; x=
	1694788392; bh=SDYIgomlY8swh7y93pUH/uABEEJeOXYqPLVgkNDVhgI=; b=B
	Wq3miQO0WpGymYHh//cDSn6vUE7am/qbdvSwJ4aPaaj+XvplU2KAkrd6jTtfOtQU
	iDjQrAHQX2IZh6016pAksMIRUe60VBzDqSytutW78+pj6LT+4n3lySRHPUiY5TRI
	Xqn3EwpUFjDOT6VC51IRejqasixYnPFk2ZiNrstVQyszbkuqjCzXq1NI4zVIBQLI
	Z90H2O8ltp/8cNRIW3u8VGD+acOY5eGVYeTn+o/iK+6qvazrnC+J2RvPGS4QPp9i
	dbXTgRMH0gv9rFipFuzo+vXqY93HjX0l+NdaklOJZpR9tU3Y78aRWdTs0PLKygao
	D7BEB1DPoFouC2YH81PWA==
X-ME-Sender: <xms:qBkDZbfd-aRaqQ2BRjlVUm150YhGqyI7IYGRVu31RTGIAFtsKZs4Ug>
    <xme:qBkDZRPtPxrRURIN8hq-lyEEoqWSQQxhkC1Wfo_5sevyBJJ3tVfHauLS2d1CPoZFK
    DvF0RVaOg6N7IAWRCE>
X-ME-Received: <xmr:qBkDZUhbG5seG_k5tt-wHaqzpHuJWzYJKFCYgf3t9FDgf68ZWjfDCNevBpF5yPsiXy-mbNhVy-9rSgLMuD6smEj61JA0FNTd6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejtddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefheffkeekgeegvefgfffhkeefgeevfeevudfghfdu
    keevudeuhfejkeelhfeifeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:qBkDZc_563n1q0vvi38eb6moYN3VxymMw9YbfzM0-VUInFJpQZ6jyA>
    <xmx:qBkDZXsbAfXneGiYc6q53D_Ouk0tLaf3k6gm90R93VTzPudKqDugAQ>
    <xmx:qBkDZbHRc9CPy2LJhfwxr4HCPKhZr_UeO4en_fio7HFesnqVN6EFNw>
    <xmx:qBkDZV2Z7Q0xkLZcsdclTBR5U60JFGIVrCj5MHROFI6r6vatsfCY_g>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Sep 2023 10:33:11 -0400 (EDT)
Message-ID: <89fe1392f0a35c6c2ed14d222d2d324730dc4b44.camel@fuzziesquirrel.com>
Subject: Re: Towards less magic strings.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Thu, 14 Sep 2023 10:33:10 -0400
In-Reply-To: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
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

On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
>=20
> ## Service Names
>=20
> I think it should be rare that you need a hard-coded service name in
> your code, since typically you'll want to do some kind of mapper=20

I would actually propose the opposite - we should use mapper lookups as
a last resort and prefer hard-coded service names.  Mapper lookups add
latency, and require developers to have OpenBMC specific domain
knowledge to do something that should otherwise be simple and well
documented.  Mapper indirection also prevents the use of dbus
activation, which drastically simplifies service dependencies.

Thanks,
Brad
