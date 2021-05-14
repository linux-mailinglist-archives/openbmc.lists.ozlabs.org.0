Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3780380241
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 05:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhD045b6mz2yyj
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 13:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=jzSRoJ50;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ok6TVsPR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=jzSRoJ50; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ok6TVsPR; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhCzh62yPz2yXH
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 13:04:16 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E2A65C0073;
 Thu, 13 May 2021 23:04:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 13 May 2021 23:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=16I7r2le1KvTQp6ic2RndIrQbtT1tul
 J9J8ZfkFfXgI=; b=jzSRoJ50RGTYVpXwqcZIoW8o+U1wVJVyfIqeZdGb9Z9q5wL
 XqjD4abLprIMdwledAnjDwlSuoUQMCn7RszPoiJgJYQ/N26xwqs54OxRBiGVyNmt
 Ts0KM5sFCEQPQqibXIocjsCHY0Ly+NtGuOvfDkZFhEFa186k5MBKqAU4w84AY0LR
 2wbjaCUCXAV7S/XY7lnTZ+EptUA2mQXCyd4DUte73ETZQ4QyuwS92ONBU/Xy5sT1
 zP23PkVLGGlHk4fbjQTH5Xa5wX8gXi578cns2NnrFRUzOlHa9Mc7bkw4i/u1ZRfq
 YMZ5Zfa4hCHTYraDDbovfYLOuRGzzso24iy9yGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=16I7r2
 le1KvTQp6ic2RndIrQbtT1tulJ9J8ZfkFfXgI=; b=Ok6TVsPRlGXaMFrDjULLVQ
 kjMyUonG/aH8RqHBHDIjWctaXzg8T4nhQOmfUL+OAiT/+COnZzbuLwVXakQnz3ng
 8sLd4J92/tOs1AQ/JBBkZsTtGa7F0PZJBceBtH2DNVAie+RS2tqlFChlBgOvD8dt
 PA22Nj2x12Wzk8H2Cfel+vTcMHVvbbdxOjUo8tenBY5RsI5ndBHvIluziwPJWKNa
 6n4l+8BXFpNVxwKgHYrQZciD1Zz0no4spv+GUo/ZZTFcViMsRfGyJvMkTvSCphS1
 STmUZ3/YWIY/54uSW9vjDnRvN6/UwhQHPZUqGqdkpVR0/94WluIuSydo3vIhg77w
 ==
X-ME-Sender: <xms:rOidYLwpHF-ibtAr_P_Z2vOw6IEbxjaY5i6_s5dBlNLGg6f_Uhb8Sw>
 <xme:rOidYDTJwpUXRAraocbEtwB-SSOAlYalaEcgUWOi0OZ6N7G2zW5p2i2IeuN-yvw7K
 iyxhjCTCSaf_4qZKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:rOidYFW7BFAURmTQzlJnj2bXgV_RbfF5W_WoyDArJnfW-sazzPPWFw>
 <xmx:rOidYFiNkf-0pm3XBud373LycSpFLztIPxTghz6eYIBf2eBHUskSiw>
 <xmx:rOidYNACWm8HRinB86hyj9QmFWYWtEl8tghPmyKQO1AVtYLKjAChug>
 <xmx:reidYI9uWxlnyto4l0m9uafB8eVqq2RIhzxDcDhQkIs4TZJkyZsgsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 761F0A00079; Thu, 13 May 2021 23:04:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <1daa4a1f-ec06-472d-87e3-bab361f3cb56@www.fastmail.com>
In-Reply-To: <HK2PR03MB4371F006185ADBBF812A5892AE509@HK2PR03MB4371.apcprd03.prod.outlook.com>
References: <20210510064955.1704652-1-andrew@aj.id.au>
 <20210510064955.1704652-10-andrew@aj.id.au>
 <HK2PR03MB4371F006185ADBBF812A5892AE509@HK2PR03MB4371.apcprd03.prod.outlook.com>
Date: Fri, 14 May 2021 12:33:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "CS20 KWLiu" <KWLIU@nuvoton.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_v3_09/18]_ipmi:_kcs=5Fbmc:_Allow_cli?=
 =?UTF-8?Q?ents_to_control_KCS_IRQ_state?=
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 14 May 2021, at 12:16, CS20 KWLiu wrote:
> >-----Original Message-----
> >diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> >b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> >index 9f0b168e487c..f8b7162fb830 100644
> >--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> >+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> >@@ -38,6 +38,7 @@
> > #define KCS2CTL               0x2A
> > #define KCS3CTL               0x3C
> > #define    KCS_CTL_IBFIE      BIT(0)
> >+#define    KCS_CTL_OBEIE      BIT(0)
> 
> Hi Andrew:
> 
> Appreciate all of your hard work and effort.
> 
> There is a wrong definition of kcs_bmc_npcm7xx.c.
> The OBEIE bit offset in nuvoton BMC is 1.
> #define    KCS_CTL_OBEIE        BIT(1)
> 

Ah! Good catch. Thanks Joseph.

I'll blame a copy/paste brain-fade and a lack of hardware* :)

Andrew

* Unfortunately qemu says:

$ grep -i kcs $(git ls-files | grep npcm)
hw/arm/npcm7xx.c:    create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
