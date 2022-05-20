Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30552E512
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 08:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4H2q1Bkkz3blX
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 16:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ee+GBWhL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ee+GBWhL; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4H2Q5LXDz2yxT
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 16:32:14 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id u3so10113932wrg.3
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xOvFCtIE0zQL+phEOCuRnJnrNTTjlXVcMi2y7WRhquo=;
 b=ee+GBWhLkS40qn7CYxtgJY6/Pt3t5gi2cxmIJ6CGmltnzV6dDw4zCCIxCNm4KVak5u
 kTcjqvuc7tL1+EzCdJptxLf2zuVtlZrgJqoRqmTAVvADOo7yBx/VP0o8Q5SXw+Yc0XQ3
 zLN0Kicric9qkWw3/OOOvoTeVf1AqTXAwASig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOvFCtIE0zQL+phEOCuRnJnrNTTjlXVcMi2y7WRhquo=;
 b=dIXmxM6SvmVuL7js0M1kwioZSk5rAknI4H68lfKMhnYK/4vEmWiHWuNT+DFQhCg8Rz
 O9+T//PnhImUD/w6W9KNProDz/52DTGAx/mtqiXoAtTS1EoxJdl2/PfI5vKRRNoSYRDi
 EbPxUXmLTTcx2YMyOjnPlIBpE7EbJdjzF0OppHfTk2D9evvWOyBnhcnxp9eE1HyXBEOd
 SxF+uxuBtCNdy4cCZZgt9AcQFb4qPpOTyyL3QwBjb7PaPjmAZ4T8dzFKhhhiGtwrODP8
 +SXl8+iWRdJ68B/d/abVDOe/Io1NqghC9q1R37BM5jVpXpG9lON/uWWah/oZC0WEjdAL
 6h+Q==
X-Gm-Message-State: AOAM530XWNzgFZpFUPim/kY7HtzevpxiVsMTinTqNaQsmHbQy3p+9zGW
 K8BeSuAMMJdME7Zgi0l8H9YOrtwhPoEDlfxidWEgPYFH
X-Google-Smtp-Source: ABdhPJwd7pnfcTfrZXEF7VmaPzQR7bd9Zfy70UO/Mh/UPlYTv78ECamwtLxVLwN5m8oYeUHKVtxAua6Q8ddYC1yfEns=
X-Received: by 2002:adf:f1c8:0:b0:20d:d4e:3742 with SMTP id
 z8-20020adff1c8000000b0020d0d4e3742mr6570543wro.3.1653028330634; Thu, 19 May
 2022 23:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220513170715.43475-1-eajames@linux.ibm.com>
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 May 2022 06:31:58 +0000
Message-ID: <CACPK8XdscoJ5SpeaOP+bgPSVG6DFNn-SsaQ19fEQACQATjn6xw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/9] ast2600: Add I2C
 TPMv2 driver
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
Cc: cjengel@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 May 2022 at 17:07, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series backports the addition of a TPM TIS core driver from
> mainline u-boot. Then, add an I2C driver to talk to the NPCT75X
> chip using the TPM TIS core.
> Add the TPM to the Rainier/Everest devicetree.
> Also, add new board code for IBM's systems that need to "poison"
> the TPM during u-boot initialization.
>
> I tested this on Everest hardware and verified in Linux that the TPM PCR0
> was extended. I also tested with the TPM at the wrong bus address to
> verify that the code can handle a missing TPM, and I saw no errors.
>
> Changes since v1:
>  - Use upstream core for I2C tpm driver. I initially couldn't get the
>    core driver to work at all, but found a small bug in the ordering
>    of operations in the core init. I also needed to force the locality
>    to 0, like in the Linux NPCT75X driver.
>  - Use new board init code for IBM's systems that need the TPM poisoning

I've merged patches 1-8.

Patch 9 needs a little more discussion. If you repost, start a new
series with just those changes (separating out the defconfig and
device tree change).

>
> Eddie James (5):
>   tpm: core: Set timeouts before requesting locality
>   i2c: ast_i2c: Remove SCL direct drive mode
>   tpm: add support for TPMv2.x I2C chips
>   arm: dts: ast2600-rainier: Add NPCT75X TPM
>   board: ast2600-ibm: Add AST2600 BMC based POWER10+ servers
>
> Heinrich Schuchardt (1):
>   tis: fix tpm_tis_remove()
>
> Ilias Apalodimas (1):
>   tpm2: Introduce TIS tpm core
>
> Johannes Holland (1):
>   tpm: add #ifndef to fix redeclaration build errors
>
> Simon Glass (1):
>   tpm: Add more TPM2 definitions
>
>  arch/arm/dts/ast2600-rainier.dts     |  12 +-
>  arch/arm/mach-aspeed/ast2600/Kconfig |   7 +
>  board/aspeed/ast2600_ibm/Kconfig     |  13 +
>  board/aspeed/ast2600_ibm/Makefile    |   1 +
>  board/aspeed/ast2600_ibm/ibm.c       |  46 +++
>  configs/ast2600_ibm_defconfig        | 137 ++++++++
>  drivers/i2c/ast_i2c.c                |   2 +-
>  drivers/tpm/Kconfig                  |   9 +
>  drivers/tpm/Makefile                 |   1 +
>  drivers/tpm/tpm2_tis_core.c          | 470 +++++++++++++++++++++++++++
>  drivers/tpm/tpm2_tis_i2c.c           | 171 ++++++++++
>  drivers/tpm/tpm_tis.h                | 138 ++++++++
>  include/tpm-v2.h                     |  32 ++
>  13 files changed, 1033 insertions(+), 6 deletions(-)
>  create mode 100644 board/aspeed/ast2600_ibm/Kconfig
>  create mode 100644 board/aspeed/ast2600_ibm/Makefile
>  create mode 100644 board/aspeed/ast2600_ibm/ibm.c
>  create mode 100644 configs/ast2600_ibm_defconfig
>  create mode 100644 drivers/tpm/tpm2_tis_core.c
>  create mode 100644 drivers/tpm/tpm2_tis_i2c.c
>
> --
> 2.27.0
>
