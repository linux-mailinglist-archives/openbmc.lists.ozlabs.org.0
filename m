Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61888732650
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 06:47:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=LbekpPLg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ra6mHB+z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj68Z1Svtz30Ns
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 14:47:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=LbekpPLg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ra6mHB+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj67x1RPrz306B
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 14:46:53 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 22970320093F;
	Fri, 16 Jun 2023 00:46:51 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 00:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686890810; x=1686977210; bh=2kdfuEmyHD3TE6H8qs37jqe+G
	9vqs+MGU7cUzry3KSs=; b=LbekpPLg9lpC7/nrC2VRI/TQNCHlEgh2xU7q+939t
	nVMHoQs7d58cIR2ozHC15V8+8Kk2c9T9GKU7QWg29vSZBRDy0LcWlwmpgeXXQPrl
	Zh3Y/0MhmHXYD+uXqI6Mxl7s8hibOjmyLTUZMJDWJ2rYhLQXxiDcZjOAb2MO0ZXt
	qY2Rl6aVqLDrq0QQDXwlSLIUQkDv2PdjCu/fV2ZcXKqLs6+a4kTpFfO49uLD1aW5
	usS4HZEga+SLosZxTgs38gVQ+uxWjUIEGBC6GWSEyRBViYQjxUmPdbEpAympbjDe
	BneoO5CuJ5jJu8DL1o2tRt+578OQXxbtiGUn2/5iRASjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1686890810; x=1686977210; bh=2kdfuEmyHD3TE6H8qs37jqe+G9vqs+MGU7c
	Uzry3KSs=; b=Ra6mHB+zbPnKaaJG4uzfJ/G63JyRNup+PdUnrqNaGOR+93zF0lc
	l3o1GzJBm7mn1WMsgv5vkml23xVUsP6j8VkWt7IyvEfI79+SYx++4SRzKJ3YtQeL
	js77KP56El964+nDIVmKZ7hhjaP2eDuyvvVjFd+ajiFadzvkCs9vWRyNNqCnvmsb
	VHlC3ZI/xhWtuXmQO1EdsSUKxYSkDI7j6KBXDpNvPTVfsCUN6VDKlcieHhEV/Syo
	GoSZ8FjGO4aHrVOLQp0grrE5fGn0F+gD4ryZAe/YGCuiwHCrvVc8O+rdY9n88mke
	41OGo0ZIWvICMfqqls2DZJaq0OrGT5nb9IQ==
X-ME-Sender: <xms:OumLZMwrE79waWWpj0IbM6tACZ5FIPjTWZuS-7rOugW0wpWJZM6F_g>
    <xme:OumLZAQKiSRWf2grwXbK9OOuj3NQr3wryN6yrEB1dqgil8vJrmRXY8GZOGBuFPsOi
    l49uKvfahkAKuqfSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvfedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpefhkeehveegffeihfejvdekkeetvdefhedtfeeiheffvdefgefhgeeitdeu
    udetudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtthdqmh
    grihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhmuhhn
    ihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OumLZOUzaVj1cN9408RMTSGRdkvppSkl4eBQUiJOAp2hidofkt_6mg>
    <xmx:OumLZKhCatufkPqdnCyto7IOwr18xZZlhqM0CrxLSGfrdlu4F7QB5A>
    <xmx:OumLZOAVRUM39AN8ppZgirbY_CilJtRLVUmo_onvs5z07MQ3dU56lg>
    <xmx:OumLZP76t10x3aR2_CicNaUv17du7MGBcOtFlxHw4Gt31OKzfKlZJQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 81CEA1700090; Fri, 16 Jun 2023 00:46:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <f086d7a4-7363-4e90-b070-af7ab65a6475@app.fastmail.com>
Date: Fri, 16 Jun 2023 14:16:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: ratankgupta31@gmail.com, vernon.mauery@linux.intel.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/ipmi-fru-parser: Notification of unresponsiveness
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

Hello Ratan and Vernon,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/ipmi-fru-parser have not been responded to in a reasonable timeframe.

This is the first notice of a complaint of unresponsiveness.

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaint regarding openbmc/ipmi-fru-parser can be found below:

https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292

The specific patches identified by the complaint are:

1. 63228: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/ipmi-fru-parser/+/63228

If you are unable to continue with your maintenance role for openbmc/ipmi-fru-parser then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
