Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6E507F9C
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 05:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjmXL5Sb2z3bWR
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 13:35:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=NYgW5wxG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YSbPriUD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=NYgW5wxG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YSbPriUD; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjmWr0MFdz2x9J
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 13:35:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B423A3201FDA;
 Tue, 19 Apr 2022 23:34:57 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 23:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650425697; x=1650512097; bh=a2yy3hkoDL
 WJKcrHg1bh1bpteQLVST/PyKqXUqvRCeo=; b=NYgW5wxGwr4UI+Ige200ZfdmRb
 K3zPYLApWVK18J1c9akOGB8Z2YNOoJOD/r0uh03c5IKTDglT5r5BsiwcCaIFmGo2
 WP2+0Erx5KFvxeYyk0Ca/lOVkTTb8VYNKwwXq/blVjB+Y6sozEQXE8xDaxaraRu/
 ankMEJzipXZ6TCZZKNoxyqXWz9waySsmFg5P6P+Bv3UDoRTKL9L+HRRoBUjFaXpk
 r5l0XGi/2x9OV+H7RjgNy0T6gXaXu97IZ6L18gh8zUQGcXtnoESHUt1wWWOWg1Rl
 Zjc35ml3ALxU0q2CD5bBxqEO6ZlsQKCZF2VSP89GpjuZW1VjVYlMJkxWAJuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650425697; x=
 1650512097; bh=a2yy3hkoDLWJKcrHg1bh1bpteQLVST/PyKqXUqvRCeo=; b=Y
 SbPriUDrbcxiMfODyxUzToZvtXrg3Xm29Kv1WTXk4THHKfdxIwiUFV27kGZjwha4
 v4J3nm11ks3VrO5HwuGhmy5zbWOaFUgiq+naJlbGMle4OnmJE7A05n2pyQvrygX0
 vr0wh3geKDrlx4/8+/OYirG+9uTKrsDdf7A5VEPDf1LqS8ebklh21p9fU75EyF09
 oKHqbb3IJmeCVASEwZ2Xp+cL6Oez0GbRCaWiGVO13pUkeknCVpgfNqkuurf7XuEm
 eHqmByCUGCBJJmJizO5p4GpvH/7V3wpb9RYmxAJfzJ7RMTkIb4eiSDpBmxMx+9CK
 g5naI16Pj1PfpV9M2eiAg==
X-ME-Sender: <xms:YH9fYj0jXJ3s8QuebuJUSiLBPTrdWVwxsCdkXGPeUvOtL9gM4AAA0Q>
 <xme:YH9fYiHrFXKqopyn_AjlXhpj4LeLXlW_g1Nrh108hW5Kbknsgt3DVJGjsoxQRSBpf
 EIp0IGH4lDXCYtkgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:YH9fYj4bYZyzrrwRfkJWSYuqJxeDy-AnpOsfDbJIj73pmuiB-imrWA>
 <xmx:YH9fYo253flU27DV7AJRnGA4VpwnSEDCgm807fRb5DHhMDiBcuVWlQ>
 <xmx:YH9fYmFzXCgiq8ASTk2SXY5NFvlI6KYRTbvWF-gTa3MGhsayBKjGZA>
 <xmx:YX9fYiBd2UI4DGIby433wnMr_KYDPSuJe5h1tgpYRHbdfOdbI1psDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CECBC15A0069; Tue, 19 Apr 2022 23:34:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-568-g521196dd5d-fm-20220414.001-g521196dd
Mime-Version: 1.0
Message-Id: <2df6747e-068d-4488-be65-4b76715ed5f4@www.fastmail.com>
In-Reply-To: <HK0PR06MB3380C8FDEE1588E4BAE945B3F2F59@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20220419234202.8895-1-zev@bewilderbeest.net>
 <HK0PR06MB3380C8FDEE1588E4BAE945B3F2F59@HK0PR06MB3380.apcprd06.prod.outlook.com>
Date: Wed, 20 Apr 2022 13:04:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable backdoor
 interfaces
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 20 Apr 2022, at 12:36, Ryan Chen wrote:
>> -----Original Message-----
>> From: Zev Weiss <zev@bewilderbeest.net>
>> Sent: Wednesday, April 20, 2022 7:42 AM
>> To: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org
>> Cc: Zev Weiss <zev@bewilderbeest.net>; Andrew Jeffery <andrew@aj.id.au>;
>> Ryan Chen <ryan_chen@aspeedtech.com>; Ian Woloschin
>> <ian.woloschin@akamai.com>; Lei Yu <yulei.sh@bytedance.com>
>> Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
>> backdoor interfaces
>> 
>> On ast2400 and ast2500 we now disable the various hardware backdoor
>> interfaces as is done on ast2600.  Two Kconfig options can selectively
>> re-enable some of these interfaces: CONFIG_ASPEED_ENABLE_SUPERIO leaves
>> the ast2x00 built-in Super I/O device enabled, as it is required for some
>> systems, and CONFIG_ASPEED_ENABLE_DEBUG_UART leaves the hardware
>> debug UART enabled, since it provides a relatively high ratio of utility to
>> security risk during development.
>> 
>> This patch is based on a patch by Andrew Jeffery for an older u-boot branch in
>> the OpenBMC tree for the df-isolate-bmc distro feature flag.
>> 
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>> 
>> Tested on ast2500 and (hostless, BMC-only) ast2400.
>> 
>> Ryan, are you OK with having an option (off by default) to leave the debug
>> UART enabled as in this version of the patch?
>> 
> Thanks your submit.
> Again, my opinion still keep the direct patch to disable it.
> Not have config to enable it.
>

Ideally yes, but as Ian mentioned he has at least one system where the 
SuperIO AHB bridge must be enabled to allow their BIOS to configure the 
UARTs. So we need an option to cater to that.

I don't want people to have to patch the code to allow use of the 
backdoors, that will just lead to other problems (e.g. reverting this 
patch is the simplest thing, and opens up all the backdoors instead of 
a targeted one).

Andrew
