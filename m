Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9F1710A5
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 06:53:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ShfZ6TfJzDqrT
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 16:53:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lShIY13V; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Shdp45lszDqpM;
 Thu, 27 Feb 2020 16:52:28 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id s7so1009899qvn.8;
 Wed, 26 Feb 2020 21:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZQu+WBBvLP640mqKaU+qwV+X4smFrhhy0xX3FBTYWc=;
 b=lShIY13VzpvHtTzPD6VrWaYV6473ZNIIuGmSg6PtSGvQ+II/6GxiDCcX538DTWsUgQ
 sK0OOHwsYSLXqHQKkImNQ0CS09g2Pg2VezCrhHNnqEMZkoOLtV/p30D+MDGZeivvop1b
 cRvcb+He1yh0TWeC3qySOQ0/O3n7jsDvRiZAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZQu+WBBvLP640mqKaU+qwV+X4smFrhhy0xX3FBTYWc=;
 b=FWNjjb9VDxzH+8u+EsO/lzK+B2+KVpLbZCagARcNwe9LgvMMJr15ikGvxNX2BqxO+5
 YeaeoBeZGnRbaneqzT/3GTAhdRw9/UBcf3Eikjc29bslbFxnpRljjl9Oa9GftKZ9M9eB
 LkV4f3w4jdQjrFyZf0qfSjJVRcBlwaDBEV47JQ8FkT8+4nh1ad9KOwhoU0kvUg3LZxyc
 CAgeuOs7JYD9f3GVKUxl58ejJy4OOXGNhQ4b2Q/LYiOklyyoemr4aeYR4fEbK6r0SYlN
 T9g1+yBZ6voBIHUpDR4s4hvwT2kjGgAPcFmTuROY63JWzR+pigCWzRubVUsg3aqsC6qx
 grPg==
X-Gm-Message-State: APjAAAVVINDxNcGJJUrf7lcPP3chJhOmZtE9S+7h0LCuY5btJ5h32Lbu
 f+3AYOklqSMOtZAr1haziqLNPrSHvlssMuKTs3w=
X-Google-Smtp-Source: APXvYqwy3wpzuLJo5yRO455kyQWeqLzrSaqVEDmh4g+F+ElnODT6EPqMVWP/Za8h8FVesx/hSV479+TkYYh+x6B/Hhk=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr3059012qvo.20.1582782744480; 
 Wed, 26 Feb 2020 21:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-8-rentao.bupt@gmail.com>
In-Reply-To: <20200226230346.672-8-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Feb 2020 05:52:12 +0000
Message-ID: <CACPK8XfSHSFG2vkHnosDvBUw-FvVFvGuTCiA_HwAzor-LJ-YhQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Tao Ren <taoren@fb.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 Feb 2020 at 23:04, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add device tree binding documentation for aspeed usb-vhub driver.

A nitpick: the bindings are supposed to describe hardware, so we would
say this patch adds documentation for the hardware

>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  No change in v2/v3/v4:
>    - the patch is added to the patch series since v4.
>
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> new file mode 100644
> index 000000000000..6ebae46641e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Facebook Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/aspeed,usb-vhub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED USB 2.0 Virtual Hub Controller
> +
> +maintainers:
> +  - Felipe Balbi <balbi@kernel.org>
> +
> +description: |+
> +  The ASPEED USB 2.0 Virtual Hub Controller implements 1 set of USB Hub
> +  register and several sets of Device and Endpoint registers to support
> +  the Virtual Hub's downstream USB devices.
> +
> +  Supported number of devices and endpoints vary depending on hardware
> +  revisions. AST2400 and AST2500 Virtual Hub supports 5 downstream devices
> +  and 15 generic endpoints, while AST2600 Virtual Hub supports 7 downstream
> +  devices and 21 generic endpoints.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-usb-vhub
> +      - aspeed,ast2500-usb-vhub
> +      - aspeed,ast2600-usb-vhub
> +
> +  reg:
> +    maxItems: 1
> +    description: Common configuration registers
> +
> +  clocks:
> +    maxItems: 1
> +    description: The Virtual Hub Controller clock gate
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  aspeed,vhub-downstream-ports:
> +    description: Number of downstream ports supported by the Virtual Hub
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  aspeed,vhub-generic-endpoints:
> +    description: Number of generic endpoints supported by the Virtual Hub
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - aspeed,vhub-downstream-ports
> +  - aspeed,vhub-generic-endpoints
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    vhub: usb-vhub@1e6a0000 {
> +            compatible = "aspeed,ast2500-usb-vhub";
> +            reg = <0x1e6a0000 0x300>;
> +            interrupts = <5>;
> +            clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_usb2ad_default>;
> +    };
> --
> 2.17.1
>
