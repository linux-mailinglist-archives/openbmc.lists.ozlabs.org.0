Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC153587C
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 06:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8X1g65Y1z3blg
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 14:31:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nvE5m7u8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nvE5m7u8;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8X1G0kwcz305M
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 14:30:57 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id l30so4335017wrb.8
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 21:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIJj2y0dMjF7tD4Jm6/bH9TPXFb7nPYbx1R2u8VtCUY=;
        b=nvE5m7u8dzSk83d5hnI0Uj5N/o3zFeOK9Qwphu+M1nysnoy33eZsI/lhoHW1c69jrX
         sIq8ET7ABaYNCPIW6piF+GgqFLKiWWjTy1UX5maor5FxYbFANJ6fJC4IEkpMYkJBXhuK
         M7Sc3skRv6zJDBkylNNjIVQ7MSZAkxU2QMShI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIJj2y0dMjF7tD4Jm6/bH9TPXFb7nPYbx1R2u8VtCUY=;
        b=6uEzzgxmEIAePZERtHbA8OXJzuo2m6L42eWdVBanaAmI55ZE1IGcivVcUmYSjsfWBq
         Fq8Vo13OOmxbr3gxyMz3appifQO18X57S1C/BtQ0zkwdBxzPp08kt6ESRVnJYZkvGE6S
         6JtqqFjRCj3QF7/1c2OH0eqxeR+lzoAI8wKxnmHRF07+Ssn9pBF3U3EC6RTyH4LMHb5E
         NF0unZvBobXuGR6sGdv/OHngrQ/wASnKBvSiM4u7Em9tkrWCUqCJB/KLXOzypUsC6CC4
         jVfNqas4f7qcCnUPanQXv/W8zqpVCZoi4sWrF+FS4wmkFtej8kEdN02ElsfdbhzRbEQL
         cX1w==
X-Gm-Message-State: AOAM531idMNmeOkhmvMpkJWwGGU2VWvBnp0UGPsPTY6xP3BU2eOR5/yC
	1BK4Kr5031sL2L4jz74wbxKRmo2mterbcvq/Gzea5jyNMi4=
X-Google-Smtp-Source: ABdhPJyO3Fte0oVGN0HsUCgFaE1uUxwDhHWyxLxriCCTEyPHdUEowdMyt9ab/52rABgs9mTwaZkNVcWzaMOA5StaRAA=
X-Received: by 2002:adf:f889:0:b0:210:178b:8532 with SMTP id
 u9-20020adff889000000b00210178b8532mr1233202wrp.549.1653625847417; Thu, 26
 May 2022 21:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220526215945.70791-1-eajames@linux.ibm.com>
In-Reply-To: <20220526215945.70791-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 May 2022 04:30:34 +0000
Message-ID: <CACPK8Xf+nmWYRiBfAMgfMVm-62va7t9rcsCtwP588WuBT1hFAg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] board: ast2600-ibm: Add
 AST2600 BMC based POWER10+ servers
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

On Thu, 26 May 2022 at 21:59, Eddie James <eajames@linux.ibm.com> wrote:
>
> Support IBM-specific options for POWER10+ servers built on AST2600
> BMC.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Changes since v1:
>   - Drop the defconfig in favor of yocto fragment
>   - remove __weak for board init
>   - select BOARD_LATE_INIT

Thanks, I've merged this with a minor addition to the commit message
about late init.

I confirmed that setting these two in the config does what we want:

echo CONFIG_BOARD_EARLY_INIT_F=n >> .config
echo CONFIG_TARGET_AST2600_IBM=y >> .config


>
>  arch/arm/mach-aspeed/ast2600/Kconfig |  9 ++++++
>  board/aspeed/ast2600_ibm/Kconfig     | 13 +++++++++
>  board/aspeed/ast2600_ibm/Makefile    |  1 +
>  board/aspeed/ast2600_ibm/ibm.c       | 43 ++++++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 board/aspeed/ast2600_ibm/Kconfig
>  create mode 100644 board/aspeed/ast2600_ibm/Makefile
>  create mode 100644 board/aspeed/ast2600_ibm/ibm.c
>
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> index fcdc425de5..46cc1ad1db 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -31,6 +31,14 @@ config TARGET_SLT_AST2600
>         help
>           SLT-AST2600 is Aspeed SLT board for AST2600 chip.
>
> +config TARGET_AST2600_IBM
> +       bool "AST2600-IBM"
> +       select BOARD_LATE_INIT
> +       select TPM
> +       select TPM2_TIS_I2C
> +       help
> +         AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ servers
> +
>  config TARGET_AST2600_INTEL
>         bool "AST2600-INTEL"
>         depends on ASPEED_AST2600
> @@ -43,6 +51,7 @@ endchoice
>  source "board/aspeed/evb_ast2600/Kconfig"
>  source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
> +source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
>
>  endif
> diff --git a/board/aspeed/ast2600_ibm/Kconfig b/board/aspeed/ast2600_ibm/Kconfig
> new file mode 100644
> index 0000000000..38ee579ed7
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_AST2600_IBM
> +
> +config SYS_BOARD
> +       default "ast2600_ibm"
> +
> +config SYS_VENDOR
> +       default "aspeed"
> +
> +config SYS_CONFIG_NAME
> +       string "board configuration name"
> +       default "ast2600_ibm"
> +
> +endif
> diff --git a/board/aspeed/ast2600_ibm/Makefile b/board/aspeed/ast2600_ibm/Makefile
> new file mode 100644
> index 0000000000..ae1aded893
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/Makefile
> @@ -0,0 +1 @@
> +obj-y += ibm.o
> diff --git a/board/aspeed/ast2600_ibm/ibm.c b/board/aspeed/ast2600_ibm/ibm.c
> new file mode 100644
> index 0000000000..37f469435f
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/ibm.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2022 IBM Corp.
> + */
> +
> +#include <common.h>
> +#include <dm/uclass.h>
> +#include <tpm-common.h>
> +#include <tpm-v2.h>
> +
> +int board_late_init(void)
> +{
> +       int rc;
> +       struct udevice *dev;
> +       /*
> +        * The digest is just an arbitrary sequence for now to ensure that the
> +        * TPM gets "poisoned."
> +        */
> +       const unsigned char digest[32] = {
> +               0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
> +               0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
> +               0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
> +               0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
> +       };
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
> +       rc = tpm2_pcr_extend(dev, 0, digest);
> +       if (!rc)
> +               printf("TPM: PCR0 extended.\n");
> +
> +       return 0;
> +}
> --
> 2.27.0
>
