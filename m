Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F43DD4F
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 10:00:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxsz3g6szDqMC
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 18:00:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lrbJ75iD"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxs86pglzDqLY
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 17:59:56 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id g4so10865915qtq.10
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RoK1ZBErv4tXCOjcbOfTP1Qbso/n8vc/7Tdo8oEka7w=;
 b=lrbJ75iDRbwN+Pz5bg3tQ/V/ft81s0glDA61TDYXIPKlDlM6blybnUjrX5e/G549OC
 nQmsB5BBfQlOT6Jo/9m9YJXwTtRw2s6Sm5P4S/JTex29Z9ok2ox5/qXOzQIf5R3ynS56
 HGunPfHn6YTEtb0hHj+rU/Q/mKPPtickCLBdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoK1ZBErv4tXCOjcbOfTP1Qbso/n8vc/7Tdo8oEka7w=;
 b=Cvt6kIap1W2mfngUqXrTmtPvlgw3Jt0WrUyCRLBlbNhiIeg1cKN4v4I31cRXOspIju
 QznNk6diY4P4EIiCqSOgNlpwXdZXwmf4tEqr/yf3c5SaFMyZ6opL5h9XzQ2wbxxNA0tJ
 1ODqW+1OaI6y8xC4BPfLT6LMaML1j+q8ztGhgqIXtatRtT4QdUbB9wjS7jL1dI8pgVQL
 G1Z6dT1MVrh8u4uypjyEtaOyXLgjq/Z2EcRWKKxsJGitKGF9Led2olypN0jY38L9KtRW
 hlS68ccCmGRie3VtiMhD4xWWm88GqNEVeMuYmYCgZwNQSVPh4J/a+UfMUq1a/aRNN6bt
 xe/A==
X-Gm-Message-State: APjAAAUlPzXvzmoXfVUseIHu/SWtt3m8WyEqx3xwWuNwy5jcpg1yTxFe
 fUBEFQMjR6sZAjIAQkBY/ntAFSJ27mBqJ1djR3E=
X-Google-Smtp-Source: APXvYqy0mLGA5zOQQZGhS5C0vqUP9tzMIta+E4ODxuMLwu7WOGncja02ipRsM5db6okhuFql2MwdKS9RIhlSWd2lkXM=
X-Received: by 2002:ac8:2565:: with SMTP id 34mr49131132qtn.37.1556524794154; 
 Mon, 29 Apr 2019 00:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <1556174916-137177-1-git-send-email-pengms1@lenovo.com>
In-Reply-To: <1556174916-137177-1-git-send-email-pengms1@lenovo.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:59:42 +0000
Message-ID: <CACPK8XfZy3znvy1pk0KL1ggrgamaSMHUBj7Na7bN_sq5Th64EA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0] [PATCH v5] ARM: dts: aspeed: Adding Lenovo
 Hr630 BMC
To: Andrew Peng <pengms1@lenovo.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, dukh@lenovo.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, hsung1@lenovo.com,
 liuyh21@lenovo.com, liuyj19@lenovo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 25 Apr 2019 at 06:48, Andrew Peng <pengms1@lenovo.com> wrote:
>
> Initial introduction of Lenovo Hr630 family equipped with
> Aspeed 2500 BMC SoC. Hr630 is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Lenovo.
> Specifically, This adds the Hr630 platform device tree file
> used by the Hr630 BMC machines.

Thanks for your patch. I'll wait for acks from Benjamin and Patrick
before applying. I've got a a few questions of my own below.


>
> This also adds an entry of Hr630 device tree file in Makefile
>
> Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
> ---
> Changes in v5:
>  - revise pca9545 and pca9546 switch aliases name.
> Changes in v4:
>  - add pca9546 switch aliases name.
> Changes in v3:
>  - revise i2c switch aliases name.
> Changes in v2:
>  - add i2c switch aliases name.
>  - remove the unused eeprom device from DT file.
>  - remove "Licensed under..." sentence.
>
>  arch/arm/boot/dts/Makefile                    |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 890 ++++++++++++++++++++++++++
>  2 files changed, 892 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148..b5d32a0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
> -       aspeed-bmc-quanta-q71l.dtb
> +       aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-lenovo-hr630.dtb

Sort alphabetically.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> new file mode 100644
> index 0000000..4f18f4d
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> @@ -0,0 +1,890 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Device Tree file for Lenovo Hr630 platform
> + *
> + * Copyright (C) 2019-present Lenovo
> + */
> +
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "HR630 BMC";
> +       compatible = "lenovo,hr630-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               i2c14 = &i2c_rbp;
> +               i2c15 = &i2c_fbp1;
> +               i2c16 = &i2c_fbp2;
> +               i2c17 = &i2c_fbp3;
> +               i2c18 = &i2c_riser2;
> +               i2c19 = &i2c_pcie4;
> +               i2c20 = &i2c_riser1;
> +               i2c21 = &i2c_ocp;
> +       };

> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x00100000>; /* 1M */

Do you use this feature of the driver? If it was there as a
workaround, note that the driver no longer requires a memory region if
you're just using it to turn the clocks on, or point to the flash
device.

> +               };
> +

> +/*
> + * Enable port A as device (via the virtual hub) and port B as
> + * host by default on the eval board. This can be easily changed
> + * by replacing the override below with &ehci0 { ... } to enable
> + * host on both ports.
> + */

This message is cut and pasted from the aspeed-ast2500-evb.dts. Does
it also apply to your system?
