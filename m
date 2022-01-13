Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C048D0C4
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 04:18:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ8kz456Cz2yfr
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 14:18:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gOpr/UNr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gOpr/UNr; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ8kS15CHz2ymb;
 Thu, 13 Jan 2022 14:17:35 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id hu2so5267692qvb.8;
 Wed, 12 Jan 2022 19:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uG3pQtxj+kQP2KxNRSNQ4XEjcKAyEOlbmdPqDMlp97U=;
 b=gOpr/UNr5eV3u2bPC4IcBiiUqwRwQ+WMuDmso5ArSWRxh6g20AOMev/7Lb9F0ziqTQ
 J/G66KrzrY9GXZdT1Jtir1odGWcuStmjrttmUvxvLB7VUH8RX29xDQqRXj3TRWIGhWqw
 gBWO8bHq/0Ru4Ygd2K1ZYA4yi41H/CoI5VCKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uG3pQtxj+kQP2KxNRSNQ4XEjcKAyEOlbmdPqDMlp97U=;
 b=Vn/fblnfsrHOZrWSeT8wgkQdN76FUF3Xo/JhPo+7BM5paQH4mU4S3ExXkoyn31uhEP
 u0tcUQrG3w4Kejvt8hlGdZMPQl5CES7Da7Rt/fNSBhvpbSLWaMG7+jy7/XOx95FEoo+e
 0U+1mhvptyl2yEOKpK5mwDOLaaI/jWNzJR1AnEbykmoRdQ+Eh71Ngw7nLw1e0aolEq7g
 DweQNaWRPjBNeZkM/G7nKSKpPd5tt0TQVY4BLcFa/LZROmaBuHCFTJS5aaPf2gIlfpxU
 jnBgNUDMP8qYJS0j6F67CvGulRb3Jvj7ZZuQvuCbSQwsMafYds7O5kzUM+1q0bS/NcMy
 v1cw==
X-Gm-Message-State: AOAM531hJHvUSULut0tkPieJkCdGLI+lyknZklu2tIXptNKUNaGDnzIt
 MQzau2mEIOr2QAri6Oq9ywZoeP9VOjPoRcCznMA=
X-Google-Smtp-Source: ABdhPJyYGgH51sQaqThiK/5CYNiJpMX4YiNmqrsx1jEIHvc0haWlE/tgAVrGGTbvfB3C4t16ThzTXF+ogb1+jCesuiE=
X-Received: by 2002:ad4:5e87:: with SMTP id jl7mr1404945qvb.130.1642043853106; 
 Wed, 12 Jan 2022 19:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
 <20220112230247.982212-3-iwona.winiarska@intel.com>
In-Reply-To: <20220112230247.982212-3-iwona.winiarska@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 03:17:20 +0000
Message-ID: <CACPK8XcO5Z0f2bU6=+o2q7caGnoBdzQ5Dm8AVt-BNs3d_xmOJg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: Add bindings for peci-aspeed
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 23:04, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Add device tree bindings for the peci-aspeed controller driver.
>
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> new file mode 100644
> index 000000000000..1e68a801a92a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed PECI Bus Device Tree Bindings
> +
> +maintainers:
> +  - Iwona Winiarska <iwona.winiarska@intel.com>
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +allOf:
> +  - $ref: peci-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-peci
> +      - aspeed,ast2500-peci
> +      - aspeed,ast2600-peci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Clock source for PECI controller. Should reference the external
> +      oscillator clock.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  cmd-timeout-ms:
> +    minimum: 1
> +    maximum: 1000
> +    default: 1000
> +
> +  clock-frequency:
> +    description:
> +      The desired operation frequency of PECI controller in Hz.
> +    minimum: 2000
> +    maximum: 2000000
> +    default: 1000000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    peci-controller@1e78b000 {
> +      compatible = "aspeed,ast2600-peci";
> +      reg = <0x1e78b000 0x100>;
> +      interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +      resets = <&syscon ASPEED_RESET_PECI>;
> +      cmd-timeout-ms = <1000>;
> +      clock-frequency = <1000000>;
> +    };
> +...
> --
> 2.31.1
>
