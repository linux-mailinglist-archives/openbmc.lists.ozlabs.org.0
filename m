Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D93068D1
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2463pfyzDqBZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:52:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=N5qh9MSn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=l5LfpLkc; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR23K0bKszDqWM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:51:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2BF6B5C00B9;
 Wed, 27 Jan 2021 19:51:21 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 19:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=PRUjFSDhZrJ0eQSDtl26q9yMYX6BrvC
 Dmue47Y9eX6s=; b=N5qh9MSn+prUTl+MgLUDjptAPdjK87M4XF2p8Zpji4HgObE
 FFBGely4tON04NG1rUQrxshWlJPgDYi0TA8qEa95SeZnGFP5OIvaczEQCf09WyB4
 MXodK+U1/GJSq1d1afdnmIcyMbfjkQ5b325P530V05wKwIWi9cj5XC9OyYdJfdvC
 sk+H+KVvrY7z20t7NxKImR55YQdT1Q8ywT5OUjJJ7LOGq/gN2hmqvM5Vv8TM5+/7
 KHgz+UEO9iAwX3iozkfIoX4wijf6wltXzXExNDz+z7PgkYhQVIb7nCZ4CN2O+umB
 YafEsHE/7l196GSTC68PisNBz1GhhMxSitCn92Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PRUjFS
 DhZrJ0eQSDtl26q9yMYX6BrvCDmue47Y9eX6s=; b=l5LfpLkcRgJUviyzwiq6Eh
 0XAONGHtgfFl8L3euiPapR/tVM+JBEQLin4WLrA+rHZWTQGorawxBxhvhoKdpG9Q
 UHh+cGHRqRtAuVebOoWbLoniRnDA18C7T7iEfGeknZ7lDj5VX1xkYPg1hBGuBFkZ
 B8AK0eA5pWbiOyL1FDN6RWVURGy9INkXAoloKWpy3e3eqijaFUI+q+OOoaYqF0WT
 9plaTeNVzYpiGOwRJgCyQTp3jx6Ku75e78O+bVcb4Kwr/fF+XiB0nQaiVKyQXCOJ
 f6LEL3aHHYGcBfzwfWgoqMF7eAD6T4q4exN9cHMWsVrUi9Z3C99ZkqqiSjq2oozA
 ==
X-ME-Sender: <xms:iAoSYLHyar0N52JpaoI0a8Y9Wu6BSR8JzNy9r4-gIpn610N_VXYHrg>
 <xme:iAoSYIV3tj33Es_9PMkZ9keAztXQkUC40-GW_HGliUUYhPcGOA8yFv9d_Gaz5fkkk
 3ZAdzyJf6ACT3cgJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:iAoSYNK5DrJL4-KLI0ECo0s2n5IORTEDxFoR4b0uXjI8No-9g30mPg>
 <xmx:iAoSYJE2s7kenK3uGWkF_mUG-kAnD4scfG4mf6YYoyH8As5D9HM1ow>
 <xmx:iAoSYBVGRFxhwUV4xH9G5vevxq1B8Hykrc8NNGwO5Pl2g9JI08DdjQ>
 <xmx:iQoSYAcjSkxKJoS8vMMcIU7jWX_1E2yZ4qF6e7XoE41vLyEACcJY2A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0C840A0005D; Wed, 27 Jan 2021 19:51:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <de16ec63-f233-451c-bc7d-89bbbfc46bb6@www.fastmail.com>
In-Reply-To: <20210128001521.266883-2-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
 <20210128001521.266883-2-joel@jms.id.au>
Date: Thu, 28 Jan 2021 11:20:59 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v3_1/4]_ast2600:_All?=
 =?UTF-8?Q?ow_selection_of_SPL_boot_devices?=
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



On Thu, 28 Jan 2021, at 10:45, Joel Stanley wrote:
> The AST2600 SPL can boot from a number of sources, with or without the
> AST2600 secure boot feature. It may be desirable to disable some of
> these, so put them behind the defines for the drivers that are used.
> 
> Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ++++++++++++
>  arch/arm/mach-aspeed/ast2600/spl_boot.c |  9 +++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig 
> b/arch/arm/mach-aspeed/ast2600/Kconfig
> index dd991e87c795..518f41b558d3 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -53,6 +53,18 @@ config TARGET_SLT_AST2600
>  
>  endchoice
>  
> +config ASPEED_SECBOOT_BL2
> +	bool "ASPEED secure boot BL2 support"
> +	depends on ASPEED_AST2600
> +	help
> +	  Enable ASPEED's "secboot" secure boot support for verifying
> +	  the SPL's playload ("BL2").
> +
> +	  Enable this is if you're using secure boot support in the AST2600 
> (or similar)
> +	  to verify your u-boot proper.
> +
> +	  Disable this is if you are using u-boot's vboot to verify u-boot.
> +
>  source "board/aspeed/evb_ast2600a0/Kconfig"
>  source "board/aspeed/evb_ast2600a1/Kconfig"
>  source "board/aspeed/ncsi_ast2600a0/Kconfig"
> diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c 
> b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> index 58a22f646e08..98cf72bf440d 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> @@ -42,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct 
> spl_image_info *spl_image,
>  }
>  SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0, 
> ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);

The orthogonal groups of MMC/RAM vs secure/not makes it hard to read :( But it 
looks like your IS_ENABLED(ASPEED_SECBOOT_BL2) #ifdef-ery has missed 
aspeed_secboot_spl_ram_load_image()?

Andrew
