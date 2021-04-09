Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 996853592F2
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjzK41kgz3bV1
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:19:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JtXchGW/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JtXchGW/; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjz43xVHz2xgN;
 Fri,  9 Apr 2021 13:19:11 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id u8so3188875qtq.12;
 Thu, 08 Apr 2021 20:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tlsotF4H+AmLvxNjD/snhIqz+CJm5ffNylMiriBTrI=;
 b=JtXchGW/69XHEdWjps7WnhWcSL4QJKiCa+XoD9A9oJ5iGzSPpM8sJ9LgZt8xOTiyxq
 p/as1e9vX72qXH3SNByu502tI5MFomxlGMI3KtPNyxcZrVcDVjqt+pqwNAZJyMsok57/
 wu0/XWL/CNfYhAPGDbWWrgs7ZxvAeX2WAZmJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tlsotF4H+AmLvxNjD/snhIqz+CJm5ffNylMiriBTrI=;
 b=bFIX3h1ktqjrLYvBF3DgIZ0KKV+YGatMBIuOt8RoQbkoDls8T2B1XWGb+afx/lcFVm
 eFf2T3QoCdBM7QbApU4mWbPZiX5IBsw7BoDBuaLAgBJcvpsm6NYNzlsmRwBWiWkjRp6U
 n4DIPoIB4t/AyLi2ovLxU2bltu59YySaKaGiJAMkw3pGXWfC3aU3JKUbP5Lw4ycGm4nN
 JYEQ0ltYYujDq/2EtwW7Or8O4j0rjYauqkE1vjv8RYsBmOKAc44B4qiI2QXmOYhw24Qk
 dnS++0WGkazIGh9GlHIvosT1dIqsU6GO3e3uyQakEJChvGWzLXHiWBhK2ZKbOVuwQx9Z
 CvPw==
X-Gm-Message-State: AOAM5307hb+jx7rAXy70d/raKQTPN3/TFjiVmdPOd8ol1bBbLsYHTwBv
 xWEIY5nQLeE8JOhUPKTYe4HYKos6qxNeVvSEg5U=
X-Google-Smtp-Source: ABdhPJz4xEUAC6m97NKz1UjwDx/kiYVvZRBIBprh3OJLwWO9Waj9drc7EI7fMCOOoJmw7S4anNcOgjtvJOf2NrXgzpA=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr10453274qta.135.1617938348141; 
 Thu, 08 Apr 2021 20:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 03:18:55 +0000
Message-ID: <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: aspeed-lpc: Remove LPC partitioning
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.

Is this accurate:

 The node examples change their reg address to be an offset from the
LPC HC to be an offset from the base of the LPC region.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
>  1 file changed, 25 insertions(+), 75 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index d0a38ba8b9ce..936aa108eab4 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a slave on the bus
>  conditions it can also take the role of bus master.
>
>  The LPC controller is represented as a multi-function device to account for the
> -mix of functionality it provides. The principle split is between the register
> -layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> -"basically compatible with the [LPC registers from the] popular BMC controller
> -H8S/2168[1]", and everything else, where everything else is an eclectic
> -collection of functions with a esoteric register layout. "Everything else",
> -here labeled the "host" portion of the controller, includes, but is not limited
> -to:
> +mix of functionality, which includes, but is not limited to:
>
>  * An IPMI Block Transfer[2] Controller
>
> @@ -44,80 +38,36 @@ Required properties
>  ===================
>
>  - compatible:  One of:
> -               "aspeed,ast2400-lpc", "simple-mfd"
> -               "aspeed,ast2500-lpc", "simple-mfd"
> -               "aspeed,ast2600-lpc", "simple-mfd"
> +               "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> +               "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> +               "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
>
>  - reg:         contains the physical address and length values of the Aspeed
>                  LPC memory region.
>
>  - #address-cells: <1>
>  - #size-cells: <1>
> -- ranges:      Maps 0 to the physical address and length of the LPC memory
> -                region
> -
> -Required LPC Child nodes
> -========================
> -
> -BMC Node
> ---------
> -
> -- compatible:  One of:
> -               "aspeed,ast2400-lpc-bmc"
> -               "aspeed,ast2500-lpc-bmc"
> -               "aspeed,ast2600-lpc-bmc"
> -
> -- reg:         contains the physical address and length values of the
> -                H8S/2168-compatible LPC controller memory region
> -
> -Host Node
> ----------
> -
> -- compatible:   One of:
> -               "aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> -               "aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> -               "aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
> -
> -- reg:         contains the address and length values of the host-related
> -                register space for the Aspeed LPC controller
> -
> -- #address-cells: <1>
> -- #size-cells: <1>
> -- ranges:      Maps 0 to the address and length of the host-related LPC memory
> +- ranges:      Maps 0 to the physical address and length of the LPC memory
>                  region
>
>  Example:
>
>  lpc: lpc@1e789000 {
> -       compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +       compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
>         reg = <0x1e789000 0x1000>;
>
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x0 0x1e789000 0x1000>;
>
> -       lpc_bmc: lpc-bmc@0 {
> -               compatible = "aspeed,ast2500-lpc-bmc";
> +       lpc_snoop: lpc-snoop@0 {
> +               compatible = "aspeed,ast2600-lpc-snoop";
>                 reg = <0x0 0x80>;
> -       };
> -
> -       lpc_host: lpc-host@80 {
> -               compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> -               reg = <0x80 0x1e0>;
> -               reg-io-width = <4>;
> -
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -               ranges = <0x0 0x80 0x1e0>;
> +               interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +               snoop-ports = <0x80>;
>         };
>  };
>
> -BMC Node Children
> -==================
> -
> -
> -Host Node Children
> -==================
>
>  LPC Host Interface Controller
>  -------------------
> @@ -149,14 +99,12 @@ Optional properties:
>
>  Example:
>
> -lpc-host@80 {
> -       lpc_ctrl: lpc-ctrl@0 {
> -               compatible = "aspeed,ast2500-lpc-ctrl";
> -               reg = <0x0 0x80>;
> -               clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -               memory-region = <&flash_memory>;
> -               flash = <&spi>;
> -       };
> +lpc_ctrl: lpc-ctrl@80 {
> +       compatible = "aspeed,ast2500-lpc-ctrl";
> +       reg = <0x80 0x80>;
> +       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +       memory-region = <&flash_memory>;
> +       flash = <&spi>;
>  };
>
>  LPC Host Controller
> @@ -179,9 +127,9 @@ Required properties:
>
>  Example:
>
> -lhc: lhc@20 {
> +lhc: lhc@a0 {
>         compatible = "aspeed,ast2500-lhc";
> -       reg = <0x20 0x24 0x48 0x8>;
> +       reg = <0xa0 0x24 0xc8 0x8>;
>  };
>
>  LPC reset control
> @@ -192,16 +140,18 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>
>  Required properties:
>
> - - compatible:         "aspeed,ast2600-lpc-reset" or
> -                       "aspeed,ast2500-lpc-reset"
> -                       "aspeed,ast2400-lpc-reset"
> + - compatible:         One of:
> +                       "aspeed,ast2600-lpc-reset";
> +                       "aspeed,ast2500-lpc-reset";
> +                       "aspeed,ast2400-lpc-reset";
> +
>   - reg:                        offset and length of the IP in the LHC memory region
>   - #reset-controller   indicates the number of reset cells expected
>
>  Example:
>
> -lpc_reset: reset-controller@18 {
> +lpc_reset: reset-controller@98 {
>          compatible = "aspeed,ast2500-lpc-reset";
> -        reg = <0x18 0x4>;
> +        reg = <0x98 0x4>;
>          #reset-cells = <1>;
>  };
> --
> 2.27.0
>
