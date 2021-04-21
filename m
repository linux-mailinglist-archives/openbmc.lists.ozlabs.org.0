Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DD366383
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 04:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ3k609lbz2yyK
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 12:03:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JeHwfPnV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JeHwfPnV; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ3jt3NHpz2xYg
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 12:03:13 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id q136so20552044qka.7
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 19:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vK+vXInSnRMiNOUbW3031HxG+vD/VULRQVlvhAhYGLc=;
 b=JeHwfPnV3ZPT0XRhFQ2r+yts7VhEHEvTEI/tBT1pS8/7joM39hNJwrx7WgY9xo/H2z
 apjG1wmwOdbeDt1NOXQAqqpuwHrn8oZ/wIFkU8vRVICF+p+01T9fsf5O3uw9NaMjjqOL
 lj1AJv9WzK0/3Wgay4mK/hxlQQ1wJW8HcApfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vK+vXInSnRMiNOUbW3031HxG+vD/VULRQVlvhAhYGLc=;
 b=demuZFf35WsaOHaQ/UwL4TuzVCXPs8Qk3/t3GA0335WZRaO3soWJNhxb9f0DEncD/I
 xXLcsc2T3Enu8FAc9C/FjkYXw06JkGuofL94h6s5Hk93KzCB0xQK6LsT99wUFYdiB67M
 weFa+g6KamZglzjS6t3vNClwqNaaEVHpLb9MjDj59xFBFVHjcpHRVQLBawgsAYL49+ar
 uRyqLTVLrjNOiPLy9sqMHVXP2J5l9cJ2jOOCnP4oxLyeHFHXRDHfStxBg+XW2OLr6mwQ
 FhpXvOf1Qn525878VCdXGVc888Vvg9jz8CEnr9Cbwddl5cfmCYYYHhyTeTN7R0tPfQu0
 XWpg==
X-Gm-Message-State: AOAM533rD/VRY0EiYr82X1HUfKiFxbkJNeIV6nDg+uuEibgCmDw8KmD4
 MLmVT8ZDbL/ACcQg6EkjeXeMAL2cb4PcxdUDjCOZAiWK
X-Google-Smtp-Source: ABdhPJxOnLketOP/gFJycWfDZBytrmGJq/UR8GkM2yYgIlCxMLlg7uSZkFDfVePsdWRetMj1FxQW2S2BnwuqmSsDgOs=
X-Received: by 2002:a37:c41:: with SMTP id 62mr18676512qkm.66.1618970588280;
 Tue, 20 Apr 2021 19:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210420064648.994075-1-joel@jms.id.au>
 <OF2C524D29.DA2BBB20-ON002586BD.00695579-002586BD.006F66D8@notes.na.collabserv.com>
In-Reply-To: <OF2C524D29.DA2BBB20-ON002586BD.00695579-002586BD.006F66D8@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Apr 2021 02:02:56 +0000
Message-ID: <CACPK8XenOTqEs96mOpEsH2rvs=1Fn88d8ATSR6Tjio2Bmj1N9w@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use HACE to
 accelerate sha512
To: Sandhya Koteshwara <Sandhya.Koteshwara@ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 20 Apr 2021 at 20:16, Sandhya Koteshwara
<Sandhya.Koteshwara@ibm.com> wrote:
>
> Hi Joel,
>
> I am looking at the patches and confused by this: This is only applicable=
 for MMC booting, as the HACE cannot be used to hash directly from the memo=
ry mapped SPI NOR.
>
> From my understanding, when secure boot is enabled in AST2600, the secure=
 boot microprocessor & ROM code copy the RoT image (either from SPI or eMMC=
) to SRAM before integrity check is performed. Subsequent CoT images are co=
pied to DRAM before integrity check. Why is the same process not applicable=
 here and why is there a need to hash directly from SPI?

Your understanding is correct, for Aspeed's secure boot solution.
However we are not using that in this case (except for the initial
image; the SPL). Once we have the SPL loaded we instead use the
verification features in u-boot. This means we use the generic FIT
loader code in common/.

If someone has a use case where they want to use the u-boot boot
infrastructure to boot from NOR, then they could submit patches to
modify the infrastructure to first copy the FIT to DRAM, and then
perform verification.

Cheers,

Joel

>
> Thanks,
> Sandhya
>
>
> ----- Original message -----
> From: Joel Stanley <joel@jms.id.au>
> Sent by: "openbmc" <openbmc-bounces+sandhya.koteshwara=3Dibm.com@lists.oz=
labs.org>
> To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.c=
om>, Andrew Jeffery <andrew@aj.id.au>
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Subject: [EXTERNAL] [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use H=
ACE to accelerate sha512
> Date: Tue, Apr 20, 2021 2:47 AM
>
> This series adds support to u-boot to using the HACE hardware in the
> AST2600 to perform SHA hashing during boot, and enable the SPL features
> to load u-boot as a signed FIT.
>
> This is only applicable for MMC booting, as the HACE cannot be used to
> hash directly from the memory mapped SPI NOR.
>
> These have been tested with C=C3=A9dric's aspeed-6.0 Qemu tree. You can
> reproduce using the script in this repository:
>
>  https://github.com/shenki/qemu-boot-test
>
> Joel Stanley (10):
>   configs/ast2600: Make early malloc pool larger
>   crypto: Add driver for Aspeed HACE
>   ast2600: Enable HACE probing in SPL
>   ast2600: Add HACE to device tree
>   ast2600: spl: Remove SECBOOT BL2 kconfig option
>   ast2600: spl: Add ASPEED_LOADERS option
>   ast2600: spl: Support common boot loader features
>   config: ast2600: Configure common MMC SPL loader
>   configs: ast2600: Enable FIT SHA512 support
>   config: ast2600: Disable SPL raw image support
>
>  arch/arm/dts/ast2600-rainier.dts           |   5 +
>  arch/arm/dts/ast2600-tacoma.dts            |   5 +
>  arch/arm/dts/ast2600.dtsi                  |   9 +
>  arch/arm/dts/ast2600a1-evb.dts             |   4 +
>  arch/arm/mach-aspeed/Kconfig               |  15 ++
>  arch/arm/mach-aspeed/ast2600/Kconfig       |  12 -
>  arch/arm/mach-aspeed/ast2600/Makefile      |   6 +-
>  arch/arm/mach-aspeed/ast2600/spl.c         |  30 +++
>  arch/arm/mach-aspeed/ast2600/spl_boot.c    |  17 +-
>  configs/ast2600_openbmc_spl_emmc_defconfig |  24 +-
>  drivers/crypto/Kconfig                     |  19 ++
>  drivers/crypto/Makefile                    |   1 +
>  drivers/crypto/aspeed_hace.c               | 266 +++++++++++++++++++++
>  13 files changed, 375 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/crypto/aspeed_hace.c
>
> --
> 2.30.2
>
>
>
>
