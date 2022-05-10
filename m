Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C3520B72
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 04:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky2Sk13C0z3bqv
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JxIV43LX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JxIV43LX; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky2SK5KyCz2xF8
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 12:44:33 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id c11so21794935wrn.8
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 19:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovwdu5qHu3aJn7I0v1EC+TyH/feI2/ur5r4Jm6RV6Bs=;
 b=JxIV43LXSCeq1mmocPlwrkqDrkThrQSEAEYAhVRuNnVWfs+YWFCx/8mlmQR5SUTBba
 CQAQ1dNRQuXcxxZBkJbBLLKuTaHZLnC2e7YIMb5cy95vkFINfCniXRn5qjjmgAwL9gY0
 s2/0xqJj6FErmBg+0mJBrA2JUvswnWmRXLjQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovwdu5qHu3aJn7I0v1EC+TyH/feI2/ur5r4Jm6RV6Bs=;
 b=SoThaCDTvfOvXmf4/amleWTm78Jh8zn5LsOUWcyjAkDXnhc50iYUmeY8c4ITibXCKK
 Jx5N/QSXAZbfnfz2fdxLPfVn3WK1CO5vGEollBLFZloF9vUyeUh0ZTN8JXt/aJtfHNyg
 w6pXmg7qDWYYZQolYEeqMJ2tHEItAQBOHNiVE06HvItumFcFlqnMuGIqgLFliUa4hA1z
 0zjbhv5Lsq/XPalap98VLEu0T2A1VSciR+8qHaCLiPcN4cmmu3fClq7J5ir+vzPSKzGT
 QngqM/gXYzWk595dT9iMnr2MXKf9PnbUZxPYFRROiHFNRAmZTQG2ljiaZRwXek7aV2EW
 +1Tg==
X-Gm-Message-State: AOAM530z7bMBtO7Mel8/hXBtWoG5539yYCvb2W7xWpY/IKVON9RV+sa/
 H/2K4rYWvX2KOCT5koYrD7TAs6mqtG3jKSWS6mU9ErHG
X-Google-Smtp-Source: ABdhPJxIjkHlePGqWTH9pun8rvw69nqS4AQ2c9l2BhPWtbHCWcw7GnjDkvGZSE2qRRGy2rqj6qiUF4D5I4xfZjrYQvc=
X-Received: by 2002:a5d:6d05:0:b0:20c:64fd:f98a with SMTP id
 e5-20020a5d6d05000000b0020c64fdf98amr16491674wrq.474.1652150669288; Mon, 09
 May 2022 19:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220505202829.31466-1-eajames@linux.ibm.com>
 <20220505202829.31466-6-eajames@linux.ibm.com>
In-Reply-To: <20220505202829.31466-6-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 May 2022 02:44:17 +0000
Message-ID: <CACPK8XdNLATDZy1fjC2b8sn+xLqJE09sRpaTjdEnAx5GBt8Y6A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 5/5] aspeed: Add
 board_late_init to write TPM
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 May 2022 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> If there is a TPM in the devicetree, use board_late_init to
> extend PCR0 with some invalid digest. The purpose of this is to
> prevent later undesired usage of the TPM.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I think we will need a board_late_init for our platform, as others may
use the TPM and not want to poison it.

> ---
>  board/aspeed/evb_ast2600/evb_ast2600.c     | 34 ++++++++++++++++++++++
>  configs/ast2600_openbmc_spl_emmc_defconfig |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/board/aspeed/evb_ast2600/evb_ast2600.c b/board/aspeed/evb_ast2600/evb_ast2600.c
> index 72ecb18c15..e11fc6973d 100644
> --- a/board/aspeed/evb_ast2600/evb_ast2600.c
> +++ b/board/aspeed/evb_ast2600/evb_ast2600.c
> @@ -3,6 +3,11 @@
>   * Copyright (C) ASPEED Technology Inc.
>   */
>  #include <common.h>
> +#if defined(CONFIG_TPM_V2)
> +#include <dm/uclass.h>
> +#include <tpm-common.h>
> +#include <tpm-v2.h>
> +#endif
>  #include <asm/io.h>
>
>  #define SCU_BASE       0x1e6e2000
> @@ -122,6 +127,35 @@ static void __maybe_unused espi_init(void)
>         writel(reg, ESPI_BASE + 0x000);
>  }
>
> +__weak int board_late_init(void)
> +{
> +#if defined(CONFIG_TPM_V2)
> +       int rc;
> +       struct udevice *dev;
> +       unsigned char digest[32] = {
> +               0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
> +               0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
> +               0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
> +               0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
> +       };

Add a comment for how this was created.

> +
> +       rc = uclass_first_device_err(UCLASS_TPM, &dev);
> +       if (rc)
> +               return 0;
> +
> +       rc = tpm_init(dev);
> +       if (rc)
> +               return 0;
> +
> +       rc = tpm2_startup(dev, TPM2_SU_CLEAR);
> +       if (rc)
> +               return 0;
> +
> +       tpm2_pcr_extend(dev, 0, digest);
> +#endif
> +       return 0;
> +}
> +
>  int board_early_init_f(void)
>  {
>  #if 0
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 3bb44280c7..b506bc5e55 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -39,6 +39,7 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
>  CONFIG_DISPLAY_BOARDINFO_LATE=y
>  CONFIG_ARCH_EARLY_INIT_R=y
>  CONFIG_BOARD_EARLY_INIT_F=y
> +CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SPL_BOARD_INIT=y
>  # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
>  CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> --
> 2.27.0
>
