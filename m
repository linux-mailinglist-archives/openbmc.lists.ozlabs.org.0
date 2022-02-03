Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B34A9026
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 22:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqXJK3w30z2xtv
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 08:44:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=r0VnLpnN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SDoFTofV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=r0VnLpnN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SDoFTofV; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqXHs4y5lz3bZb
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 08:44:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C29755C020D;
 Thu,  3 Feb 2022 16:44:23 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 16:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=YUMZpQlAEGmgqKs9d7mZecYBnVAR/dSwe5ycXg
 ht5l0=; b=r0VnLpnN0cX5ksHAMkueUPxtuC0e1C+SS0wnGXzl90UxI82W7Mhq/i
 Mech7zdBzffItAgfbU+e5j4iqywZoB75y7kAJnp08sEBa9D50rCZWRMxWyfT6F5w
 MThJEKQG3n3BX0Q3qyDAC+dWTosDLuqn1WLczlRzE+S7lsphiaxoQhhfbXmyJgct
 4Dc+z2a7LvgtPygDCe77BweulFdxxv6WsSl3JO5Hj+SVQ4kQWPXvH+tzMRm1vZih
 Tm3Jq3Lev8mFL1W/accUzslj/m/7xRX2lQOFKAuNp9FeAAc0nrwivPYGu+yH9qYe
 LWpR51yrRWC4r7ReXfQi2Kx71114I9Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YUMZpQlAEGmgqKs9d
 7mZecYBnVAR/dSwe5ycXght5l0=; b=SDoFTofVN93Gh3KGz9A+xNgv+xxCBoiKG
 /AFkBNTK6k8D31XPQM6cpqt6+EWJ4k5vLDFWMko7ytHSEiWNSTN/2Nn/s0Sb1Uwt
 COvEdFqN4XueqqprdXp4hmR/XT/IOn63sIJ4I+/366UM3A0ZrhOfqc1Ja0OXMrnx
 7u8Y351hHXATrV5sqFZRxIOoEbvCjnp3kgb/ERxh1Gv3G141cZvJ+Zk/D9O+KRFv
 WlSeLApMNJvbQy9BvWOopvE7JsSwdobkVc0pVrQ8gnUpz/TakdRQuANEIvCixdTE
 +QtzPQUFEx9F102h871vdDRTs7k3Y9jYxOaTeqafqdsHX5vMDE/7A==
X-ME-Sender: <xms:t0z8YWwsf2buxCqnT50QfIP6x7YC-tSJTqoDAlDRmIEsIozvOWiEoA>
 <xme:t0z8YSQOlcnymfNr5qB7Z6k6w-IEHt95ED1NKccPnLfDkVgG7snqoPhET-RWideEI
 zFSU1LjR-UUijaUBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdduheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:t0z8YYW1u_ecoya3sf0zGCU42BWPZMk_FEHPBt3B3_k0tASR4gErNg>
 <xmx:t0z8YcgzgRG4k_FsEirox_goV4o0SQPKdcBB5pQNM27uUGAorE7F8Q>
 <xmx:t0z8YYCALPEeyWT67QkSy_EtXIc_gOYwwgOHBMvKKWmFkMfQNxI4IQ>
 <xmx:t0z8YX9h92ZVDpgHsOlRw1ygM8T6z0J0R7eOonuswROzsXvvVMiE-A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9F3B9AC0E99; Thu,  3 Feb 2022 16:44:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <807573dd-5b8c-4a4b-a014-e6badd7ad775@www.fastmail.com>
In-Reply-To: <44d92066-775d-64a7-c1e7-711b89868be3@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-6-eajames@linux.ibm.com>
 <68e65de2-0047-4e81-8c97-67e9982f71d4@www.fastmail.com>
 <44d92066-775d-64a7-c1e7-711b89868be3@linux.ibm.com>
Date: Fri, 04 Feb 2022 08:14:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 5/6] Add GPIO hogging
 support for AST2600 openbmc config
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



On Fri, 4 Feb 2022, at 02:29, Eddie James wrote:
> On 2/2/22 20:13, Andrew Jeffery wrote:
>>
>> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>>> Enable GPIO support in the SPL and hog the GPIOs in the SPL only. Also
>>> increase the size of the malloc size in the SPL to get the GPIO driver
>>> loaded.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   configs/ast2600_openbmc_spl_emmc_defconfig | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig
>>> b/configs/ast2600_openbmc_spl_emmc_defconfig
>>> index 344a4d8f9c..5f50298a58 100644
>>> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
>>> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
>>> @@ -11,6 +11,7 @@ CONFIG_SYS_TEXT_BASE=0x81000000
>>>   CONFIG_ASPEED_AST2600=y
>>>   # CONFIG_ASPEED_LOADERS is not set
>>>   CONFIG_TARGET_EVB_AST2600A1=y
>>> +CONFIG_SPL_GPIO_SUPPORT=y
>>>   CONFIG_SPL_LIBCOMMON_SUPPORT=y
>>>   CONFIG_SPL_LIBGENERIC_SUPPORT=y
>>>   CONFIG_SYS_MALLOC_F_LEN=0x2000
>>> @@ -19,7 +20,7 @@ CONFIG_SPL_SERIAL_SUPPORT=y
>>>   CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>>>   CONFIG_ENV_SIZE=0x10000
>>>   CONFIG_ENV_OFFSET=0x5000
>>> -CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
>>> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000
>> How much capacity does this leave us with? Have you looked at the
>> memory layout for the SPL (I haven't, so any legwork you do here is
>> appreciated ;) )?
>
>
> I'm not sure, I haven't looked into it that much. When I was debugging, 
> trying to figure out why my SPL wouldn't load, we were right at capacity 
> without the GPIO stuff - allocating like 0x7c0 or so. We should have 
> plenty more room now. I guess I'm not sure where that memory comes from 
> anyway.

Okay. Might be something for another day.
