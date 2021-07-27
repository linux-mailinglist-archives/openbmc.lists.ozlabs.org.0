Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6753D6BEA
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 04:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYgZ36r4vz30DR
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 12:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EO2pEbvA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EO2pEbvA; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYgYm4ffXz2ymS
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 12:22:51 +1000 (AEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 h7-20020a4ab4470000b0290263c143bcb2so2742875ooo.7
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 19:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JxdWaRrIXnMrkVtGFeOTacCATVx/vii++9LdFXeVvKk=;
 b=EO2pEbvALZLfzwEhTaoml6+neI3gximuUQvJ4evdLorQxlv4YJ/YWlTPOWRJP+gq6d
 bi0d2vJuzCTwD6alGxutu5DAKn2eC0hN5Q+3q+F6wrDRhR3ei7l99uGHZ1PxNMcci8CD
 f1lIhnrxvlJnF6vh1weNuKLdHrWbiBJFqWVZvyvh1ENKI3Uvgo27oupzTAXmhevlZUOA
 m7+AAJ5EBrno/EtYIq3+22VRgHWQu0GE+/69wHc8v5mA75qqrU9tBKc06Obojhw6TCG/
 oz+uj7iVrAXqBb8aG2PhMTnn9AbSK3i4MH87ANMgYPky81n39G2/BYlJ11P/H0ovRLbU
 vH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JxdWaRrIXnMrkVtGFeOTacCATVx/vii++9LdFXeVvKk=;
 b=QKGyhkSXPiv+rp2QEk1/pdiUdMyCjka4kLbWhCd6VvEqaw0WuhztNs1yWuOqdpMATA
 F4xbUYqPnmes1D7VkDM/fryO5tfzjk4nOlJwn6Jkw80YEqeDUuSH3iYGGt0z/GJI+Egw
 fgbDgT6gFh50S529lep9LlifyIIU1p693Vzk6B2EQfjbB3Xb84S27XVfXkLiNEnr3UuC
 uiGpDcCmTE9xqCRc0tOyD5+r04e2lXpebCAV5Mo3qfauDher8GP0QpmSgcmjIvpBsGG4
 miWS1iTRCkDj4UeTO/qrxhi5CVHiL5w1OeYYY07SZqL9j9bWcWqNronxh0YSBVmlMQr+
 hAmw==
X-Gm-Message-State: AOAM530DKpDHL2AhKYvfY7Z6G3at+LFmFYPRSUprT2SOW3SBapp7crys
 bjEgTDt31Vy6b/Y/PkZ7Y+iHVl2irQs1CuP+Ud0=
X-Google-Smtp-Source: ABdhPJw6owOwTnKtkAyFVZfgKk+G0oTDRJRbHcZIh9xqEaJATCkRFTn5U+73z1VCdgBG2FTaiqU6TL5B2U4Utqd4m5k=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr12125412ooi.80.1627352568368; 
 Mon, 26 Jul 2021 19:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210623060742.22158-1-troy_lee@aspeedtech.com>
 <OF021B0527.BA142969-ON0025871E.005B6D39-0025871E.0062427C@ibm.com>
In-Reply-To: <OF021B0527.BA142969-ON0025871E.005B6D39-0025871E.0062427C@ibm.com>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 27 Jul 2021 10:22:39 +0800
Message-ID: <CAN9Jwz3_oPzCsCXRCM+YfrJ_N79dG1UwdEsGac9hAMS53j3-Bg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes
 boot from RAM device
To: Sandhya Koteshwara <Sandhya.Koteshwara@ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sandhya,

The AST2600 hardware hash and crypto engine (HACE) can only exame data
in DRAM, please make sure you copy the kernel fit-image into dram
first.

Thanks,
Troy Lee
--
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

On Tue, Jul 27, 2021 at 1:53 AM Sandhya Koteshwara
<Sandhya.Koteshwara@ibm.com> wrote:
>
> Hi Troy, Joel,
>
> I am looking to use these patches to secure boot OpenBMC from flash on the AST2600 evaluation board. Is there a relevant UBOOT_MACHINE configuration file I can use?
>
> I am currently porting configuration for secure boot from the ast2600_openbmc_spl_emmc_defconfig to the ast2600_openbmc_spl_defconfig. I was only able to get the u-boot-spl to verify u-boot but kernel verification fails.
>
> Thanks,
> Sandhya
>
> ----- Original message -----
> From: Troy Lee <troy_lee@aspeedtech.com>
> Sent by: "openbmc" <openbmc-bounces+sandhya.koteshwara=ibm.com@lists.ozlabs.org>
> To: <leetroy@gmail.com>, <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
> Cc:
> Subject: [EXTERNAL] [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes boot from RAM device
> Date: Wed, Jun 23, 2021 2:08 AM
>
> Reporting a BOOT_DEVICE_RAM can leverage common/spl/spl_ram.c
> to bring up u-boot.bin by memory offset 0x00010000.
>
> Fixes: 13dd0b0f7273 ("ast2600: spl: Support common boot loader features")
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  arch/arm/mach-aspeed/ast2600/spl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
> index 778b326755..c759a7575d 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl.c
> @@ -66,7 +66,7 @@ u32 spl_boot_device(void)
>   case AST_BOOTMODE_EMMC:
>   return BOOT_DEVICE_MMC1;
>   case AST_BOOTMODE_SPI:
> - return BOOT_DEVICE_SPI;
> + return BOOT_DEVICE_RAM;
>   case AST_BOOTMODE_UART:
>   return BOOT_DEVICE_UART;
>   }
> --
> 2.17.1
>
>
>
>
>
