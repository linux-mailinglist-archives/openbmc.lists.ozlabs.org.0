Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E584A7DBA
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 03:14:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq2Kw6hgLz3bTn
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 13:14:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=o/+JZeNh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HZYC/RQf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=o/+JZeNh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HZYC/RQf; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq2KX5FYQz2xsS
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 13:14:08 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EF5953202221;
 Wed,  2 Feb 2022 21:14:06 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 21:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=Qu8bhZALRpGl9BsoXv2jKAow5OolnjDaQTP9L0
 qj9VQ=; b=o/+JZeNhoWtrV7YSd7kSZOsaxGQOl525h2UT9VGjNTZg4PEZaknapE
 cF8/fMH0WjyoaWzTo8mJmHKoM1PdUinYFnhnurobrFBMURiq7AgdIZT21EbvBV7m
 pFkpMhHmrdgRtpP9U7YFYebMgA4GHljYC/XRSr+WLM6sebXU9fc01LkjsufofsYC
 YRQxkcZJ1sRZXdHsU7+L2PZbYPQK4S7ieIjTRzoY2VomMCvKUugIVvAy/YxcvuIB
 0UG1AL/wHDeMnAOfzB6MzvVcuxga5mED6F0hKdVWl2hNsf+K48X5y+uCEGV8J2Lm
 y+gNnjfcH2Qh7t5X7Ml212wSPTBQF79w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Qu8bhZALRpGl9BsoX
 v2jKAow5OolnjDaQTP9L0qj9VQ=; b=HZYC/RQfDJC3Bwqgk20wzYhTYZRmLh8Tr
 g3Lo0H5o5FJxb52urVGQbE3fcjT6hFsMqEQ0Bj3pxDcZGhcTNeCkSc5xd2mbi+Ll
 pc7QXfENJaZ3/9vuxnLMXiyc2vXukxokWFGpXpE2IH6Gi7Eq68FyK2A4sjMa9AQ0
 0Jm3I00iDLUDaO6vaEHeygAwioehZLgrV/bpMiIu+FVxt3RZF66NpzlFR6/xlwzg
 +KItq7Gopc4w6AFB8Lqu4BrQm5iI4T5m4CEkBRcwQlx4fefpJCh4/G8r0Gnh1mFr
 B/86/mN5LoJK5umcHf6aLN7yhkaaytq8tOqt3V8P+qxPqKn1goKfw==
X-ME-Sender: <xms:bjr7YXhFqcykGHX1e88AcrXKhT110ip5i-KddFLd4g8W0FIFEV_86w>
 <xme:bjr7YUCAEpvSQd3teCr1fTSB0-z00ee119PH5B-orj5tOgb4yfmy-vd3RhCOQo1Sk
 NvRd_G6c3ihiwgiXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:bjr7YXFzelj-9XkkUkJzZlPDkD96YVbADzkkrufoPJZwydw1KRsTPQ>
 <xmx:bjr7YUQZ6l7bwaPOHBe3vvjJY7t_29SM4ZUA8AjS1iwgVkO_oYxlXQ>
 <xmx:bjr7YUyeUztVZxf2NbZj6c76f6J4K6o7o1zGsuk3ZgK8Gm8rS7_wNw>
 <xmx:bjr7YRt7DjSq87NxCUA5rJ2ym245PxD5kVQQ2r_mEZxZeRjBTt9zwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5401EAC0E9A; Wed,  2 Feb 2022 21:14:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <68e65de2-0047-4e81-8c97-67e9982f71d4@www.fastmail.com>
In-Reply-To: <20220124191503.88452-6-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-6-eajames@linux.ibm.com>
Date: Thu, 03 Feb 2022 12:43:45 +1030
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



On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
> Enable GPIO support in the SPL and hog the GPIOs in the SPL only. Also
> increase the size of the malloc size in the SPL to get the GPIO driver
> loaded.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  configs/ast2600_openbmc_spl_emmc_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig 
> b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 344a4d8f9c..5f50298a58 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -11,6 +11,7 @@ CONFIG_SYS_TEXT_BASE=0x81000000
>  CONFIG_ASPEED_AST2600=y
>  # CONFIG_ASPEED_LOADERS is not set
>  CONFIG_TARGET_EVB_AST2600A1=y
> +CONFIG_SPL_GPIO_SUPPORT=y
>  CONFIG_SPL_LIBCOMMON_SUPPORT=y
>  CONFIG_SPL_LIBGENERIC_SUPPORT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x2000
> @@ -19,7 +20,7 @@ CONFIG_SPL_SERIAL_SUPPORT=y
>  CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>  CONFIG_ENV_SIZE=0x10000
>  CONFIG_ENV_OFFSET=0x5000
> -CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000

How much capacity does this leave us with? Have you looked at the 
memory layout for the SPL (I haven't, so any legwork you do here is 
appreciated ;) )?

>  CONFIG_SPL=y
>  CONFIG_SPL_STACK_R_ADDR=0x90300000
>  CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> @@ -94,6 +95,7 @@ CONFIG_CLK=y
>  CONFIG_SPL_CLK=y
>  CONFIG_ASPEED_HACE=y
>  CONFIG_DM_GPIO=y
> +CONFIG_SPL_GPIO_HOG=y
>  CONFIG_ASPEED_GPIO=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_ASPEED=y
> -- 
> 2.27.0
