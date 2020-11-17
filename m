Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78192B71E4
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 23:59:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbLx80FLVzDqYX
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 09:59:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=nl+6Td3L; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aoMYRj2Y; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbLwC0143zDqVr
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 09:58:50 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E05AD367;
 Tue, 17 Nov 2020 17:58:46 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 17 Nov 2020 17:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=WjsOzqaGEh4fc5BRWriEYG0PCtam0o4
 ULaF8KiKBYuQ=; b=nl+6Td3Lx5O+t4iX5W2T1VKNujkse3eoeM+TVN0dS4MjTrE
 DiN63yNjLgd8/lrDw1ihjad72pxYO7nOf4p7Xubv61INje2uqLWhZ20x2xCbkHV2
 864f4hqisLuUvlYMHGpFeJ5FZT0Nusk8hswZoLMM21nn3UKpLpvXqw84kOFhlQet
 ATtTm6F8n2SUjU63+h0Spumh8pIndWeIBBNjGLStgl8ksNBCWzGhsb9U9Fylfbp2
 s0dj1QOJoO0Vl2cMkZ8GFQwtKyHSoHaBRW4xGnomqdaeLIJgFi5Ob62ToTtVtXku
 K/jvfZPxMX7xoR7cwsYH4/4StayHz4z/HPfxPPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WjsOzq
 aGEh4fc5BRWriEYG0PCtam0o4ULaF8KiKBYuQ=; b=aoMYRj2Y7BRCIQ0Lw6PmJT
 kDW8YHEYpEnGX8bQtP7qlGUIisJjBHgCS8rKIXlEoOgc4z68dktKr4z+END/CA35
 wKaZHq46Sa7LxkE+juqO7RziLZ70kg3fF3wlHxOaED1G6s/iTPiJ2p7uTboqSwy9
 dQnY/dXNJBw7mCtu9x7x4HhU3fP8i0bQCXRbZzhxGnZB2WDIkwPEn1Tt/OA51vGH
 wETWu5aD5w+TbxRqG99aa2Hr4GAiX3LLKGNWhNh3N5X+S1/KcqjOj/SiLWc6XRW+
 ppKwoBO49TL1pLRi0ZnWH/+ZhCSP2kkUAWhzfw3UVFw5rG2QeTzMCqUqE0DzxHKA
 ==
X-ME-Sender: <xms:pVW0X-73bC-vrCK0NtCDBslqU_JOv7VZ993gY9Xp9aGql5Axn95OGQ>
 <xme:pVW0X36Ag1Os7iqj49ciCz7cucIYcVklwl_ScwEdnxY5rkjp-GzXSnXxdBb53eLqb
 pgnnNsJats_GedeSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefgedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:pVW0X9dB92O5svotOiGtQ2lc4RMDk-sGlJQnesAWOQwQdbu3xoVtuw>
 <xmx:pVW0X7KehR7bxx02SV9BbcYbmRLplv0Kg41W7xdabXIFiUwTrEGCnA>
 <xmx:pVW0XyJC1O_RD0c1ywjVyrla4VjAkKqMRITq419J41yrEx3RH86KaA>
 <xmx:plW0XxkFvLT6HgA_QVwuXuc4XMzO7i9GBoA48gLADrTFyOWBT_wEcg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C0416E00AF; Tue, 17 Nov 2020 17:58:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <3f2a20a7-c294-4838-bb8b-9ec21d651997@www.fastmail.com>
In-Reply-To: <20201117052349.1222669-1-joel@jms.id.au>
References: <20201117052349.1222669-1-joel@jms.id.au>
Date: Wed, 18 Nov 2020 09:28:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.8]_soc:_aspeed:_Remove_misc_control_int?=
 =?UTF-8?Q?erface_driver?=
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



On Tue, 17 Nov 2020, at 15:53, Joel Stanley wrote:
> This driver is no longer in use. There were two consumers in OpenBMC
> userspace:
> 
>  - hb_settings
> 
>     This was used to set the ASPEED LPC scratch registers.
> 
>     The scratch registers are no longer used after the SuperIO controller
>     was disabled to mitigate the pantsdown issues.
> 
>  - uart-render-controller
> 
>    This was used for controlling the ASPEED VGA mux, to switch between
>    the internal graphics device and the VGA device.
> 
>    The mux now has an upstream sysfs control as part of the DRM driver
>    and userspace has been updated to use that.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Party-parrotted-by: Andrew Jeffery <andrew@aj.id.au>
