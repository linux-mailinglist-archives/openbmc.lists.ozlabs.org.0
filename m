Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA14A7B46
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 23:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpxp569Fyz3bbm
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 09:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YJ5enYcH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F4hgDj7w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=YJ5enYcH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=F4hgDj7w; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpxnc3KLxz30Lt
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 09:49:40 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A7A5932020E4;
 Wed,  2 Feb 2022 17:49:35 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 17:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=+/KTKCV+YCc75Q0i6XOnmAxZLnhKFu+s7r2xs9
 7wE/A=; b=YJ5enYcHxDs/uWIjG4sqZwOWQ1Wlz4UUMlNbCof2zT1qVkesi/dUBB
 OqfagjXgw5yE9o3h1aRYj/xganSW3a4FqC5pnByGq30A1R0zzEwvxv4DxAhg2xHW
 iuqLxaMhmUdXd+fm1x6Gunfa1EiH/8/cNoXPEJvkrYOOHdMOv3nWkfBhECiF4gnw
 xOjSNilxR6Bx3GEfpUaFHCECSYQ3kKrIp+QSMl/BbcRIjv4kxPEQ2xveF6wVgsWi
 U2Gxr4sbjF96FLgvisqiLocYlHUIUiyq1GF70uAp8+lC31i1udlM/fizT+lt/zeR
 H6T2ewIdaG8kQ7HCFrqsyGSsnfDiJlgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+/KTKCV+YCc75Q0i6
 XOnmAxZLnhKFu+s7r2xs97wE/A=; b=F4hgDj7wrLdEwWtIdat/JtOlPJpgHlXqn
 0CHN+j393buy/dJhU1UxsBaCqIUCS3Mf1y2ZZOSTsn/5nho4lmKXA7kCScyKO7MI
 F3EtpOUpKNZ/54H3mRmPbJtCSIhUMDPDAOPott8GqmudetZGTdjYgZMm8rltU+GM
 c6wKe0rCnTQPdDMXcwP+RuSzB3Hk7Ojw+Q5Y5ddyg+b5iOv6p2Hr/qhBgmOttKvx
 MB0f4PrxzT+3nSMvWEG4hoMyzCv9aG3rbFOb0PacXHha0oHERLhTT1wiPr/Gl1e1
 VrzYjLBFgqcTL+BOGWMS7yvQWQ8cQi2MQIdMLfrPxuhsBHwrX14zA==
X-ME-Sender: <xms:fgr7YRDgiPwga0YYbRPiffkVwuTblEILltfX9HLPjTMjbXoiEnXq0w>
 <xme:fgr7YfjiSzYNlL_3lJvIiNxpzbaxt379qbPjsq02HP-HTKx2r5yGr9KI4w7UsiEnp
 nMaTMAx4yhQMtZ9xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:fgr7YcnLOpAIfyMYtICMKoCKb3g2cKt0hMJ_FEPs39Szh60vRBuWRw>
 <xmx:fgr7YbzGTqw4lfilLAGfGjebuf1Zfs7FcZaATM5PmVrx3jq48Px7aw>
 <xmx:fgr7YWRKq53I4mgDZdGl7CafQlOrUQsqwl-RIrPhOMkLJ1nHV4ybEw>
 <xmx:fwr7YdN8XGeuUuYzTI2rm2tHWM8KYp7YGl0UVbZdGXu3l7WxetNCJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9C811AC0E99; Wed,  2 Feb 2022 17:49:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
In-Reply-To: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
Date: Thu, 03 Feb 2022 09:19:13 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
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



On Thu, 3 Feb 2022, at 06:29, Bills, Jason M wrote:
> This change adds a gpio_disable_free() implementation that checks
> if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will
> re-enable the pass-through mux.

Okay. So trying to pull back from the implementation for a moment:

Perhaps we can view pass-through as a property on a pair of GPIOs, rather than a mux state? I think it would be better if we could, for instance, annotate this in the devicetree?

If we did that I don't think we're require this awkward and pin-specific implementation of the free callback for GPIOs.

If pass-through is enabled it puts constraints on how the pins are used if they're requested as GPIOs, but we can add those dynamic checks in the GPIO driver.

Let me think about it some more.

Thanks for surfacing the patch.

Andrew
