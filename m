Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B4306ADE
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:02:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3cy5Qh3zDqHR
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 13:02:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=RZPpZ1PR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Np2wok/N; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2WH4jYHzDqSH
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:12:11 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 11B925C0087;
 Wed, 27 Jan 2021 20:12:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 20:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=7jk3QDy4eyN4E1va6jsFhVihIfKlgnA
 6Vu1TNf5+EKc=; b=RZPpZ1PRkvZyJlfs5kQkPXDX6fIdD+0rXc0mXgiI6KF7NkD
 d7oaSz01Pt81hwNXZSR9kgdNb43ZXTmCKt+WpS+EZc0F7YcZxB0Jh18wMjKehQrk
 pRJKDdrdbOElbrXeyQEuOIZmMufAt73hg+G23orgEsBJFjG+Vkvho7+Sj+pH/Xwd
 /+eHs5OS/1CGFRNXIUFml0Q6ighf/5SyQ43Q8Jzv2e3jLsqs07LpBadbAbG41cUl
 9ONV8PQKERG3U0OrOH8Kg/KdSZsrGugJ/qZZYm1kvDnJlnuKrVw+ntWMZNLLd+bI
 eogCtmcnxEu4zsjWVMpdWDy6wLMw9xhhzO53Siw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7jk3QD
 y4eyN4E1va6jsFhVihIfKlgnA6Vu1TNf5+EKc=; b=Np2wok/NiTju0TXG1H1afl
 2NFcfG3+P5YCsO7mVGCnVoDJtLEJlSgGpGpp1m+2+uwVzFoOzD2JC5H4GlmAals6
 PTMtR/ykEhg/UQABxZXeCagISpK659UTi9hw0Yky9qjLg8hy3VEVmQ2RRcXJI0cM
 9Pz1F7lclan3Rb0u0IuHsehHEmmq8Z2k7si0hJHnrVSzs9kGoaEsZL2XL/dMjZtu
 kaLCTItHYoXEwdrL0MXUyqkK6eB0hEIXBXh/cge71OUQhHHBNoaIfvwMc7sqOkwO
 Juz0v0D76UF8z7iyFrOWqo3GsnqYXOv9arNCbBrMNGR2BRqBGAbZ2zeS41aZqznw
 ==
X-ME-Sender: <xms:Zw8SYIs5YaLKU-zf1WqGpczPp_1eBAYeDOnkLz9naZqTOSAFOxLXyg>
 <xme:Zw8SYFd-MlvK5p1ZTQyK3Zi3SUUkKEYer1D3iCdkKm6ZfvaplgNxHh_XBQsBZ8zIo
 bxq_Ow1mnXX99-5aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Zw8SYDxNlhPZ6bLRqqDul5NV2NAhVdtxp_UCeaCEo6AUwh8bhydluA>
 <xmx:Zw8SYLM2luCpACY1Jyd4lcszeusiqNtvX6OBHEfwcghVQKRYBmolMA>
 <xmx:Zw8SYI_gYXj6HUdp-7itun6-kJ8WxMBdgQqJy9vbPSVZ3ryRpMpJLA>
 <xmx:aQ8SYGlFjG8r44aCBFNUVBU8dc_C3CkPGOO7P9B8eLzj-PFB-f8QTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 78E4DA0005D; Wed, 27 Jan 2021 20:12:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <da8ba1f8-0f6c-483d-8bd6-0909da024e5b@www.fastmail.com>
In-Reply-To: <CACPK8Xex2O3XO_EnFz0KpT1mYQyP-bJ7gV+Mj3uFSXQqz=yMWA@mail.gmail.com>
References: <20210128001521.266883-1-joel@jms.id.au>
 <20210128001521.266883-2-joel@jms.id.au>
 <de16ec63-f233-451c-bc7d-89bbbfc46bb6@www.fastmail.com>
 <CACPK8Xex2O3XO_EnFz0KpT1mYQyP-bJ7gV+Mj3uFSXQqz=yMWA@mail.gmail.com>
Date: Thu, 28 Jan 2021 11:41:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 28 Jan 2021, at 11:32, Joel Stanley wrote:
> On Thu, 28 Jan 2021 at 00:51, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Thu, 28 Jan 2021, at 10:45, Joel Stanley wrote:
> > > The AST2600 SPL can boot from a number of sources, with or without the
> > > AST2600 secure boot feature. It may be desirable to disable some of
> > > these, so put them behind the defines for the drivers that are used.
> > >
> > > Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ++++++++++++
> > >  arch/arm/mach-aspeed/ast2600/spl_boot.c |  9 +++++++++
> > >  2 files changed, 21 insertions(+)
> > >
> > > diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig
> > > b/arch/arm/mach-aspeed/ast2600/Kconfig
> > > index dd991e87c795..518f41b558d3 100644
> > > --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> > > +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> > > @@ -53,6 +53,18 @@ config TARGET_SLT_AST2600
> > >
> > >  endchoice
> > >
> > > +config ASPEED_SECBOOT_BL2
> > > +     bool "ASPEED secure boot BL2 support"
> > > +     depends on ASPEED_AST2600
> > > +     help
> > > +       Enable ASPEED's "secboot" secure boot support for verifying
> > > +       the SPL's playload ("BL2").
> > > +
> > > +       Enable this is if you're using secure boot support in the AST2600
> > > (or similar)
> > > +       to verify your u-boot proper.
> > > +
> > > +       Disable this is if you are using u-boot's vboot to verify u-boot.
> > > +
> > >  source "board/aspeed/evb_ast2600a0/Kconfig"
> > >  source "board/aspeed/evb_ast2600a1/Kconfig"
> > >  source "board/aspeed/ncsi_ast2600a0/Kconfig"
> > > diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > > b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > > index 58a22f646e08..98cf72bf440d 100644
> > > --- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > > +++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > > @@ -42,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct
> > > spl_image_info *spl_image,
> > >  }
> > >  SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0,
> > > ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
> >
> > The orthogonal groups of MMC/RAM vs secure/not makes it hard to read :( But it
> > looks like your IS_ENABLED(ASPEED_SECBOOT_BL2) #ifdef-ery has missed
> > aspeed_secboot_spl_ram_load_image()?
> 
> Yeah, it could include that. I'll send a follow up once this series has gone in.
> 

Okay, well, on that basis:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
