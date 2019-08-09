Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE658728A
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 08:59:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464bgz6cX3zDqyY
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 16:59:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DCwcBNNS"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464bgQ3PQgzDqxF
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 16:58:42 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id l9so94795465qtu.6
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n0zHC6YWZs+jQ6im4jII9D/hj6I9mJ+6Q11AVpglfF4=;
 b=DCwcBNNSyVbPHntkWQtb3VlXwTerIr2pyzsAnSXQkqq0V/snL1ak2EYrAcCJN5uw69
 AbnTpr9gRzVhF2OruEN/TvuCvtEmskQy5AtfdoHOCA/iI1tDFQY1/0lmlmw9w5VJXj9X
 fL5y9PJOvzVWh7CgzdkRHD9iFxetJIXMdZ6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0zHC6YWZs+jQ6im4jII9D/hj6I9mJ+6Q11AVpglfF4=;
 b=TUgGxp9zWE2T0d7aaIFEMdlqxd6L+tg/5/FMVxMtYEHkbOmRDShm/oyAg8Ajvsonqg
 6/qFbe8FlDuSmu0yrxqaMjpZUQRXDr82DE2JeZ00K4MVtdmpKi1ZHSVu++49twd21NY5
 KV07mH8r64MQATLInsmPJUjSqspha4LZVmJsAFAVqVwiJk3ekghPs3qpBM9VYz+K4+pA
 ONb1pgdJtAPVuLP7ONm5frJtclq+EHaMlmff4IIb7NYp5lHDpb4FtDID6Nf0AX5DVfRL
 Jo1DehvbCO+5QFhUkRTDbRPMcWQIYVU6iJbWa0BWiBGv/YSiJ0zs29lnlqeT2wGqePiB
 PrRQ==
X-Gm-Message-State: APjAAAVY/OIQoUsUjAngdIJWNYROMqHSA+a5xtfh2Bo8WguwvDSTJ8Xf
 TGJ+z9NjTbi+pnxPpsIemI9pem0KjBaxOnvNMg0=
X-Google-Smtp-Source: APXvYqwRQoColQ/hEJfSEr/wy0J9NftIJagP86eVzdi0QQ3Go/Z86cCOyc373/dDCy1b7QOYp0KnaYRce7nY1z7nbzU=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr16249464qtv.255.1565333918246; 
 Thu, 08 Aug 2019 23:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190807144654.23330-1-Ben_Pai@wistron.com>
In-Reply-To: <20190807144654.23330-1-Ben_Pai@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Aug 2019 06:58:23 +0000
Message-ID: <CACPK8XeTwyp_yt0fLL6DP=7nsHLjGXcT5N8tr5RJg1QYyx5Sfw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: Add Mihawk BMC platform
To: Ben Pai <Ben_Pai@wistron.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

On Wed, 7 Aug 2019 at 14:47, Ben Pai <Ben_Pai@wistron.com> wrote:
>
> The Mihawk BMC is an ASPEED ast2500 based BMC that is part of an
> OpenPower Power9 server.
>
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
> ---
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 918 ++++++++++++++++++++
>  2 files changed, 919 insertions(+)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index eb6de52c1936..cdfe0f43ffd3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1275,6 +1275,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
> +       aspeed-bmc-opp-mihawk.dtb \
>         aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-romulus.dtb \
>         aspeed-bmc-opp-swift.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> new file mode 100755
> index 000000000000..bbf4a4671421
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -0,0 +1,918 @@
> +/dts-v1/;

You need to add a SPDX copyright tag, and optionally a copyright line.

When applying this patch a number of whitespace warnings showed up.
Please delete trailing whitespace. You can check this with
scripts/checkpatch.pl

Is this patch intended for the openbmc tree? If so, we have rules
about tagging it for inclusion. You should put the branch name in the
subject:

git format-patch --subject-prefix="PATCH linux dev-5.2"

Please see this documentation for guidelines:
https://github.com/openbmc/linux/wiki/SubmittingPatches

The subject is confusing, it says 4/4 but the first three patches are
missing. Are there others you intended to send?

> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "Mihawk BMC";
> +       compatible = "ibm,mihawk-bmc", "aspeed,ast2500";
> +
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>; /* address and size of RAM(512MB) */

This comment is unnecessary. If you want to put /* 512 MB */ that is fine.

> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32MM */

MM?

> +&fmc {
> +       status = "okay";
> +       flash@0 {

There is no reg property so I think the @0 is incorrect.

> +               status = "okay";
> +               label = "bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
> +               partitions {
> +                       #address-cells = < 1 >;
> +                       #size-cells = < 1 >;
> +                       compatible = "fixed-partitions";
> +                       u-boot@0 {
> +                               reg = < 0 0x60000 >;
> +                               label = "u-boot";
> +                       };
> +                       u-boot-env@60000 {
> +                               reg = < 0x60000 0x20000 >;
> +                               label = "u-boot-env";
> +                       };
> +                       obmc-ubi@80000 {
> +                               reg = < 0x80000 0x1F80000 >;
> +                               label = "obmc-ubi";
> +                       };
> +               };
> +       };
> +       flash@1 {

as above.

> +               status = "okay";
> +               label = "alt-bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
> +               partitions {
> +                       #address-cells = < 1 >;
> +                       #size-cells = < 1 >;
> +                       compatible = "fixed-partitions";
> +                       u-boot@0 {
> +                               reg = < 0 0x60000 >;
> +                               label = "alt-u-boot";
> +                       };
> +                       u-boot-env@60000 {
> +                               reg = < 0x60000 0x20000 >;
> +                               label = "alt-u-boot-env";
> +                       };
> +                       obmc-ubi@80000 {
> +                               reg = < 0x80000 0x1F80000 >;
> +                               label = "alt-obmc-ubi";
> +                       };
> +               };
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {

as above.

> +               status = "okay";
> +               label = "pnor";
> +               m25p,fast-read;
> +               spi-max-frequency = <100000000>;
> +       };
> +};

>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------

Please submit without this message.
