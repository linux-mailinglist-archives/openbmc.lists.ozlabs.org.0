Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B105A5911
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 04:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGr9y60nkz3blV
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 12:00:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=q8aiSip/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WhHXa2lG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=q8aiSip/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WhHXa2lG;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGr9R4Rp9z2xJS
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 12:00:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 675D65C01C2;
	Mon, 29 Aug 2022 22:00:07 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 29 Aug 2022 22:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1661824807; x=1661911207; bh=hEUVUsywtM
	4qaut7Q3BOECTAVGDw7CNRH6+xVCi1iTw=; b=q8aiSip/YMY/sLBwCQKO1H1VMS
	NJKj0XlVLccaxPQMRU8+moFPKwNV9DcaEQUqY6gt4sHBi93ucuAK351Htwt5iPCP
	2oilii4YkVtDc9Sff02ApHmhCjaH8Eqy40ThkKAwAxlOPWA8TQqh7jT6S3rYjQVK
	nxDfdy0V18RuR6et3yQ0S6CbzV0pzaJNIFbR3oOntBiqup5MDI+zvLNWq6PvcM7E
	X7EA4ErdS2H/xXcUfVCw8+bCWBoJPpJ52bRzr/lvLFZTkQ9k/ST5M9eL1CS93DpG
	jGIRLDIgO5TeE4Aml8Nge9VRKkRx8dvX5Or+DJVTeiSAjZtktsT87DtAcbsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661824807; x=1661911207; bh=hEUVUsywtM4qaut7Q3BOECTAVGDw
	7CNRH6+xVCi1iTw=; b=WhHXa2lG8JLTmcVCHffxwBwekOaRnCuqJbVUiRaRdB6C
	PzENW3F8y5q+Jyg3NlYYBsByhdhvBPyPD0LurVIrp1My6GM4frBhWp98eWIXfVQ0
	u8CvuwzIfgyAr0sdHuanBKBPCwIpLdN14+QNFxD0QDBV4VsUhbt3/9fX9CeGxbcT
	m+RRewM/fnX3N9Aur56AjNHSuEM2y1daoZNElSA1gdB9y8YA34+zNJ1hEA154aSe
	FbCjOXiNbNyFIH4sVqbH328GwxaIl995LX4WFDYI/n2Ujh6m5LfVI9mG1goAxvim
	6WLeXmqDNYcg68+dVHvYm1tIpNsFXZ6Mv5YLE5ZaXQ==
X-ME-Sender: <xms:J28NY3j5l3kGmm6HwYqlAQJ0CT-IUdw66zx8tQZiXmKBVNDfVUtBFQ>
    <xme:J28NY0AkbaLxcB9b2mf7cp0tavpYhUX5c_AtP5HLPMJucRYyp1si0ck_3jXJktI_I
    sy35ySYYUSLLYJcww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekvddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepofgfggfkjghffffhvffu
    tgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorg
    hnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepfeevtdekkeevgffg
    hfeghfelveevtdeuudehfedvuefgkeffffevvedvlefhtdfgnecuffhomhgrihhnpehgih
    hthhhusgdrihhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:J28NY3FHahnDdeAeXzEoYpfFX-caPT1Rwt9O9u23mgB096B5BxN6Uw>
    <xmx:J28NY0Rdf23maxIektq3eWeNrr6VU8l5_vXM0ucFu8ahMRENqI7lUQ>
    <xmx:J28NY0yS-TsW0fO0NvOPv8s64kGmdn9IG4d1TJMUNEeHhUTUcboi6g>
    <xmx:J28NYxufmSYjK8J7zfRg1Il1R0kzuYtXfpEWEcW9_VaDS74e7e60fg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 358CA1700082; Mon, 29 Aug 2022 22:00:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <317d91c1-870a-4370-8ce4-12fc1a531486@www.fastmail.com>
In-Reply-To: <66a2cce533124f56b60f68f9f0b807af@ti.com>
References: <66a2cce533124f56b60f68f9f0b807af@ti.com>
Date: Tue, 30 Aug 2022 11:29:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patton, Schuyler" <spatton@ti.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: new port seeing ipmid exiting with seg fault
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Schuyler,

On Tue, 30 Aug 2022, at 00:45, Patton, Schuyler wrote:
> Hi all,
>
> In our port the ipmid is exiting with a seg fault.  Does anyone have 
> any suggestions on what to look at or what the problem might be? I have 
> included some info I collected from systemctl and journalctl. Thanks in 
> advance for any pointers, suggestions.

You might find some useful tricks for debugging the segfault in my blog 
post here:

https://amboar.github.io/notes/2022/01/13/openbmc-development-workflow.html

Broadly, the idea is to get gdb hooked up to debug either the process 
or the core dump. If you can extract the core dump from the system then 
you can use the bbdbg script in concert with your local OpenBMC build 
tree to generate a rootfs context to debug the core using 
gdb-multiarch. The other way to go is to get gdbserver onto the BMC and 
then use remote gdb (again using e.g. bbdbg to generate the context in 
which gdb runs).

Hope that helps,

Andrew
