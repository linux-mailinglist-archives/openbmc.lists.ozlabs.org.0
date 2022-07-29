Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C25849D9
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 04:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvBXL05Rqz2xjw
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 12:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mImxyGLE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=q/prQ8ep;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mImxyGLE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=q/prQ8ep;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvBWt71Q4z2xHZ;
	Fri, 29 Jul 2022 12:38:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 210843200947;
	Thu, 28 Jul 2022 22:38:00 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 28 Jul 2022 22:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1659062279; x=1659148679; bh=aaUG1mcxXt
	LJd6pJT4Mmr22bhPN8UW3nBoduqUAhorI=; b=mImxyGLELzdD7jJHUUBF3Gj4qh
	rlz5Fhm0uibFRRSfzHRTQ/FaY2LhJOcl5WMYVDlApzE6hDzSxn3GIISPHcZLN47b
	s8JNtNip7qccGKCFznnQuP1W6fGnefsD/gcrRH8OqPZsj/6gUI/6LWB090LOOXj1
	ElFvtCpqzDcFAJl1E2I1NFglXACoyviYzJj1WCFwpcPCz/9fqaiZ9AMfTfRpYayD
	+bG38jRDEzHgcpCtc98Qs9t9oS8HjbMS1fEpYfuUFWNU74osX02UHZXtg4f/R75Y
	NJoZvKou2GfSpytooovJTBIze4mb5c7tLzqeRTetg3/IAv+S9jsj4JF16E3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659062279; x=1659148679; bh=aaUG1mcxXtLJd6pJT4Mmr22bhPN8
	UW3nBoduqUAhorI=; b=q/prQ8epZ9Qewn+WWlYrl+kyFsw0agNBcIPxZFs7u1zy
	u//U1XrLIGJ9cG6h22PBoiqPjGC8uGR6WJvu7ERfvk/0YoxpXtvxxY72OLHycfnf
	uMIgVyT/Hyx2O/gKTUQZievzR4BMTHqt/VtD5ck0hMianwxs9Gx+j/R6g3RGYPSJ
	SgcDnGzN9vIuCfxk0MXHW5R6wjwwMESI4es5swRsCTgVhoLUvTQ2lVsmsQ+RQL8b
	CbAkJ201vq28wSZmp9MNuZI/DzYvQQplhIJpM5zHCSD9nQShRm/Fja1VtdPZNCOw
	Hmiwj8MIp+9qwbP2LlQvDiTkyc39wyQmDAq6c3DsAQ==
X-ME-Sender: <xms:B0jjYgOrJycyyjnFZ_TTROgwG23dByHtixnqgOpiI8ASobf3FpWRiQ>
    <xme:B0jjYm-eQtjiu5dt3aHZ7a6QYsNpy0-c9z6ZDvQGK6WLdZOY3yAMpEZJi9sEDr0dw
    Qe8J0cQwI_3CzaTLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:B0jjYnSHaTZbMHBPNqDww-5R_DvrFx8qxjPSIAe19rgGzCM_vx652Q>
    <xmx:B0jjYotQdLac_0ijgykjgG14Z7LXmDWDRb5PxitBO3We8F0yaoQ92Q>
    <xmx:B0jjYofxSjZrzSfq-iWb7SZwZiM91VECDoyNKvULkHxQwQPsM8Yg8w>
    <xmx:B0jjYmui3MpcCVacr6fDqnUO71MaaMQOiNRD2Iy_5z5kk-9Fpj9bHw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 647541700083; Thu, 28 Jul 2022 22:37:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <62143648-8a90-4ff4-bfe1-f311b40cd50c@www.fastmail.com>
In-Reply-To: <20220501105644.355062-1-zhangjian.3032@bytedance.com>
References: <20220501105644.355062-1-zhangjian.3032@bytedance.com>
Date: Fri, 29 Jul 2022 12:07:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jian Zhang" <zhangjian.3032@bytedance.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH linux dev-5.15] soc: aspeed: abr: Add sysfs attrs for flash toggle
Content-Type: text/plain
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
Cc: zhangjian_linux@163.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jian Zhang,

On Sun, 1 May 2022, at 20:26, Jian Zhang wrote:
> Implement the flash toggle function in soc ast2600.
> Add two sysfs attrs named "access_primary" and "access_backup"

If you're proposing this patch for upstream then it needs to be based on
an upstream kernel tree, not the OpenBMC kernel tree. You also should
not use e.g. `linux dev-5.15` in the patch subject prefix, as that would
be inappropriate for an upstream patch.

As you're adding sysfs attributes you'll also need to add the
corresponding ABI documentation.

Cheers,

Andrew
