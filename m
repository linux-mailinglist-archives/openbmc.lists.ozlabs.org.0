Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09986517BBA
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 03:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsjYr66Drz3bdk
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 11:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=o6OzovZP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jQtGcc7g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=o6OzovZP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jQtGcc7g; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsjYN47ncz2yn2
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 11:48:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4FD1C320099F;
 Mon,  2 May 2022 21:48:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 02 May 2022 21:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1651542530; x=
 1651628930; bh=T6QlA7xVzgb9eJpWQuCWIWNtQjo0pOtMsJpl7Vpknms=; b=o
 6OzovZPAtihMHrTcPP/bMGLXI7i8Ar9PbUYnolshOwhkECjmJy8gTKjD+mGuTQrQ
 PwmvyW99FPK77AEqIIRPDiRg0OHYYipIws7+OvzS3r6amuKGmIyQKklfZfsDJPeW
 FJbv43sCtvKMhBDPSJVYw6EGFm4ugQ5Did9AOyLxzZtWbJH7WDRoEBBQa9Q2i0QQ
 /y0fNgb2GpYCIMaU9Utk0CUPifrrA8+Oo+9p65Ejns7wOgmi/adMvx4VWTsYLzUL
 NUbyaCek2keSle6X5QZgH4MqtwZzunWbq/AJpAxKsBGKopSTxi0XwuTi/G5iLprk
 zhz8E2L0MRhTML1EaOLjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651542530; x=
 1651628930; bh=T6QlA7xVzgb9eJpWQuCWIWNtQjo0pOtMsJpl7Vpknms=; b=j
 QtGcc7gOk4skdXxvuqlEUu7hA8TSdLMF0oD1FObXsEOFsfeQKUlFv8kZKQv0aOJq
 y4RIG4TZ/qn/XVZ+Lw2psLUbJfF91WOl9ZXky2ZWJkPqE3J4hPsJ03ZhAmj6riD9
 aeRsyfjcpLHrch0oQgG75vzbB6nyb1rw7cNManWdwdPVbalARGKNpTMxdjOfJab3
 osl0RbiKde+WYseaBEL7yeZjB5HVpSb/zPtLqsDRYxcl/cEtbSd9ZvD1YyjOyvLQ
 +Q23rhVhvzLZXWEdTxrR3HxZ+KIxgOqWRDUyD/0xDHgLpwLcfD7a0yAihoYXxdQd
 gjLg5m+SOc/aQYC9K0/2w==
X-ME-Sender: <xms:AopwYuUJ8KI9ZUJhmtbn8ywweqDP73tVokXdIUolZJZwwlNOEopR-Q>
 <xme:AopwYqkQKgZsjqMCP_HtbSGZdu0F9UL8Qf8RSOWMuduBwO-HwsuRe1KakQmz3w5do
 6wTRjkqPV2hxP5Z5Ts>
X-ME-Received: <xmr:AopwYiZGDUxlbrJZXCNBEGLyM_vI1IK2yw-VkZVkXBAkgTOV21eKuM1oPZ1Lt1UBkEoWBeNI9JJcc35ZCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedvudeiffdvtdekveei
 iefffedvffdvleelkedvvefhkeffgeejjeekgeetudduveenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvg
 hlrdgtohhm
X-ME-Proxy: <xmx:AopwYlVumDKtSXzdVJtfbs_1590enus7pTB75yFajOmyrzyJuKCdRg>
 <xmx:AopwYokcpyaQaOFDT8NFkAGNKpy2Ay5REyTjSODng7HgW0-Dv2P0tQ>
 <xmx:AopwYqfY_DXwWnOxnsIlJqzXDAWu6g8jm5qMHkks0HznDf5q44Ca6g>
 <xmx:AopwYvvBEvL8lnkJSL13OebkPMoXAX9kRXwRnYfXTsO9yHxzn-h2TA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 21:48:49 -0400 (EDT)
Date: Mon, 2 May 2022 21:48:47 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Bitbake recipes requiring configuration
Message-ID: <20220503014847.xpjm66eyxbyimyub@cheese.fuzziesquirrel.com>
References: <CACPK8XdtoHQj8z0wM2+xAYNfsH62UHdO4qLJWSJF8-WXRb1r1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XdtoHQj8z0wM2+xAYNfsH62UHdO4qLJWSJF8-WXRb1r1g@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 02, 2022 at 05:54:20AM +0000, Joel Stanley wrote:
>Hi Brad,
>
>I'm after some general direction for bitbake recipes that require a
>machine to provide configuration or script. eg:
>
>SRC_URI += "file://whiz-bang.sh"
>
>whiz-app/
>  whiz-app.bb
>  amachine/whiz-bang.sh
>  theothermachine/whiz-bang.sh
>
>If my layer supports three machines: amachine, theothermachine, and
>bestmachine, bitbake will emit a warning for bestmachine, because
>there's no whiz-bang.sh specified.
>
>We could change the SRC_URI to be conditional on :append:<machine>, or
>provide an whiz-bang.sh next to the .bb. Or another option I haven't
>thought of.
>
>Is there a (better) pattern we should be following here?
>
>For a concrete case, I have put this change up for review:
>
>  https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/53432
>
>There are several apps in meta-ibm that currently warn depending on
>the machine you're targeting, so would benefit from cleaning this up.

I think you've listed/discovered all the options I'm aware of.  The 
approach taken in the patch seems reasonable.  A variation of it might 
be to identify an abstraction if there is one and add it to 
MACHINEOVERRIDES.  For example if a bunch of systems are P9 systems add 
something like:

MACHINEOVERRIDES := "ibm-power9-cpu"

to the <machine>.conf and do this in the recipes:

SRC_URI:append:ibm-power9-cpu = " file://foo.sh"

-brad
