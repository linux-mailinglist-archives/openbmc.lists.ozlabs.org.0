Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460F732678
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 07:02:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=oEUXRCi8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=V5SnF3b3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj6TV2zfLz3072
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 15:02:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=oEUXRCi8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=V5SnF3b3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj6St1Q37z30fx
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 15:01:34 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1456F32008FB;
	Fri, 16 Jun 2023 01:01:32 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 01:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686891691; x=1686978091; bh=+0MvcGWinIrUYfrA0QDoOyjW5
	25zSKqjAoMBvfZs2UQ=; b=oEUXRCi8T0XPAJGKP2O0WL6wGFsXWc47tvGkDr8Ek
	pPhnp0AkuYslDkut9nIYYmLDq/8EljI237NlhMWspJvzY+QC70qGyEqnlcQfvhcV
	NDVmtEH543swCljw7aJpT7mURLCgRbbjpUinjBQEL/0iRwBoJY1elWBcRny8r9Vy
	7ky8F3iKGJc+Hvn7N/be2l3BlmSHKYUK+N2o68He8SpyC+oipR06oZEERMHos0Nd
	zcpMTtLimEuLMRrAJKQL5Z3HS1IPS0StGKALSuwV85Jwt7bxwk+NMgpxEBIQ6N0m
	e6q3EikLA3fIRcy4sud+vVDBLTiFZVpp+vZslsuowdmQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1686891691; x=1686978091; bh=+0MvcGWinIrUYfrA0QDoOyjW525zSKqjAoM
	BvfZs2UQ=; b=V5SnF3b3rmAJhfErJrxpx++VQBuC0v5FvEDk5hboPtmVwIG+jeS
	dUfPixh0rJOQQm+oXFJ8xh4wC0C8aIR81IQXH1vyBuhhC2pZXylVJNzKIL+eJNGE
	tLy3r9ruqjWrtTfJaAVc0NhAJVeiFH9usoyZjSa7gfFLbAbeenx3eX/o1pnBoFWx
	Wty02Nz8O6sJS07Ey0/NSgny7NciInubAZDDnY4CrX+Js5nsPKr/xGE0zhBWv61Q
	wX+Q6XAscZPHVSCUqh9ACP+o2UiBAvk3yTQoqE12nXhCaZRLQYBVC8cl/I/SCdLP
	VbPMMBb2cmsdHXxa7glYPElNAnmvvjIiiaw==
X-ME-Sender: <xms:q-yLZJ0E8v9SxWVS8dP7kLwMa8FR7sCbM4RZqUOdxXgEVMwd3VOdpQ>
    <xme:q-yLZAEh4xiG1ztKBkJkLTsH_9xiOLT7-1-dYFn_SnMxV9bP6I7T44YhBPjnADK5o
    DVyDBu7tajbR1Bbzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvfedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpefhkeehveegffeihfejvdekkeetvdefhedtfeeiheffvdefgefhgeeitdeu
    udetudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtthdqmh
    grihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhmuhhn
    ihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:q-yLZJ5LqOrEo0kmWGV7v2s29ON90TYec9xp7CHXXSLlw0qqUgRTNA>
    <xmx:q-yLZG2SIxxm0vhJqIiR4zBKikkmTsoLdJk5YzZmItQpFR63FZu3IA>
    <xmx:q-yLZMEKc686bX2m-sOFz2Lo6zJTw9i8V8mqyJmvxgHwogXO5nD4jA>
    <xmx:q-yLZGOen7B7ukbNdtP-tVX-5uEgahb4iu_f7mlusS-vQx_hQXeGhg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 767B81700089; Fri, 16 Jun 2023 01:01:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <dd227a06-3bc5-4fda-abb2-520fad34c026@app.fastmail.com>
Date: Fri, 16 Jun 2023 14:31:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: apparao.puli@linux.intel.com, vikram.bodireddy@linux.intel.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/pfr-manager: Notification of unresponsiveness
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

Hello AppaRao and Vikram,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/pfr-manager have not been responded to in a reasonable timeframe.

This is the first notice of a complaint of unresponsiveness.

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaint regarding openbmc/pfr-manager can be found below:

https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292

The specific patches identified by the complaint are:

1. 63270: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/pfr-manager/+/63270

If you are unable to continue with your maintenance role for openbmc/pfr-manager then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
