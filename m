Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53D4438BA
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 23:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkQ5M0WZ8z2yNY
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 09:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YFmHr1Ou;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HD1En9Ef;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=YFmHr1Ou; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HD1En9Ef; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkQ4s5znfz2xsh;
 Wed,  3 Nov 2021 09:46:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B980E5C0063;
 Tue,  2 Nov 2021 18:46:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=+MmfI1hZqEV2ZXk8KmjNb0iZ8aI9C1X
 wnf9lcQ3Z1uc=; b=YFmHr1Oukctfa1gHQIpggEvefuoGE4pnTJ5WbvG78Hb/MLR
 EeNus6GyzokK1Fttz8p44luYffyp0Ewlu2MD/4s1pX8Kj/i0bq6RtIFD1HfUBDhZ
 IPZ1hQei5b4JvrC74jSvh0w+2Zmt/Qeure3CpyH+2xZEvb1xzRJCsJ4lwomBUk/g
 UR6dZUrQPfyD496Uk8DRWwqHq5UneFxRdUWwjea9IQrC1+h8GYYEADBDp03PX+Bm
 JM9lKZQqtFn7Bn7DekpYBLZsD+3b3oyU3wETQH3ocgzi4lbiKadTU4Qukuxt1d0e
 U7bXc7B5h2GPGBz8NMtZJMEDKv8/ds+VOwZEggQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+MmfI1
 hZqEV2ZXk8KmjNb0iZ8aI9C1Xwnf9lcQ3Z1uc=; b=HD1En9EfpDdtNdzzDK3z1A
 qKRdQ4dEH6fT+NppFc2Tplbqnu6bZuwIZ2WlT/DM93uDNw1D26grn7xCytMSg2q2
 xrVPEbIaXrvKMldB++BRrrPcFqWeHN6VqkSC5NIs+MrZ3f9iwd6YsqzlWB+kS6Gi
 rXYaTV2LumDsuvRU9fMi7rvyhycqoSiPQP+ozimKIw9/soGC81oZZQD/hAyFwQd4
 5/7JUYV9vx2W+iHYarCV1oKTBwPMcKBcob8LNaE7z/SNwo+WWwMtHGR4ltslXJSJ
 LznpoJEZl0SuSAZuIpzUwbOxl0WyuRWfhlj/QuHwvn8dueRBVpkFnfICP3RJEgjQ
 ==
X-ME-Sender: <xms:2r-BYTq0n-5UldPg_zXq-JhZmzsp75EGAEEXvL1BEiYitN7qoaZvQA>
 <xme:2r-BYdr0Wc9-VK76am5pTrJvQQaJ8XejF3ywxGC29ODiCq_uwK3xmEdJLWgtdMLre
 m7gNkMED3mq4OWDKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddugddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2r-BYQN1odeZTH5cZ15jmB0wcHvGUAYh8uP328m5hMo8eAT5hwleBQ>
 <xmx:2r-BYW7whpwHdmUZkJUde3_3rNIV1bF_Ewxia1lVDKzUDaduCpYW-w>
 <xmx:2r-BYS73IicJx_qukKMIx6HyEDrCDFrdKZLHL6oSS_a7TxRnyUF9fA>
 <xmx:2r-BYfubquuJ1R21rpgvG3cZ8rsh6hrsZPYt3Azxa36EUuxpnL2syg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A487AC0E8C; Tue,  2 Nov 2021 18:46:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <3fc55e2b-05cb-438d-b1cb-0d62f26c5411@www.fastmail.com>
In-Reply-To: <20211029212157.14230-1-julianbraha@gmail.com>
References: <20211029212157.14230-1-julianbraha@gmail.com>
Date: Wed, 03 Nov 2021 09:16:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON for
 PINCTRL_ASPEED
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 30 Oct 2021, at 07:51, Julian Braha wrote:
> When PINCTRL_ASPEED_G* is selected,
> and MFD_SYSCON is not selected,
> Kbuild gives the following warnings:
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_SYSCON [=n]
>   Selected by [y]:
>   - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 [=n] || 
> COMPILE_TEST [=y]) && OF [=y]
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_S>
>   Selected by [y]:
>   - PINCTRL_ASPEED_G5 [=y] && PINCTRL [=y] && (MACH_ASPEED_G5 [=n] || 
> COMPILE_TEST [=y]) && O>
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_S>
>   Selected by [y]:
>   - PINCTRL_ASPEED_G6 [=y] && PINCTRL [=y] && (MACH_ASPEED_G6 [=n] || 
> COMPILE_TEST [=y]) && O>
>
> This is because PINCTRL_ASPEED_G* selects PINCTRL_ASPEED,
> without selecting or depending on MFD_SYSCON, despite
> PINCTRL_ASPEED depending on MFD_SYSCON.
>
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

From a system-level perspective MFD_SYSCON is selected by ARCH_ASPEED, 
then the MACH_ASPEED_G* symbols depend on ARCH_ASPEED.

However, that doesn't help the COMPILE_TEST case, so we need some 
solution. Since MFD_SYSCON is required by all the relevant drivers and 
the aspeed pinctrl core, maybe it would be best just to add as a select to 
PINCTRL_ASPEED? Unless there's an argument for depends instead?

Thanks for the patch and report!

Andrew

> ---
>  drivers/pinctrl/aspeed/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
> index de8b185c4fee..b0bae6144fc2 100644
> --- a/drivers/pinctrl/aspeed/Kconfig
> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -11,6 +11,7 @@ config PINCTRL_ASPEED
>  config PINCTRL_ASPEED_G4
>  	bool "Aspeed G4 SoC pin control"
>  	depends on (MACH_ASPEED_G4 || COMPILE_TEST) && OF
> +	depends on MFD_SYSCON
>  	select PINCTRL_ASPEED
>  	help
>  	  Say Y here to enable pin controller support for Aspeed's 4th
> @@ -19,6 +20,7 @@ config PINCTRL_ASPEED_G4
>  config PINCTRL_ASPEED_G5
>  	bool "Aspeed G5 SoC pin control"
>  	depends on (MACH_ASPEED_G5 || COMPILE_TEST) && OF
> +	depends on MFD_SYSCON
>  	select PINCTRL_ASPEED
>  	help
>  	  Say Y here to enable pin controller support for Aspeed's 5th
> @@ -27,6 +29,7 @@ config PINCTRL_ASPEED_G5
>  config PINCTRL_ASPEED_G6
>  	bool "Aspeed G6 SoC pin control"
>  	depends on (MACH_ASPEED_G6 || COMPILE_TEST) && OF
> +	depends on MFD_SYSCON
>  	select PINCTRL_ASPEED
>  	help
>  	  Say Y here to enable pin controller support for Aspeed's 6th
> -- 
> 2.30.2
