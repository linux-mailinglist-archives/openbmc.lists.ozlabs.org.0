Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3E350EB66
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 00:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnJwV3rnSz3bqZ
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 08:05:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnJwH1h7lz2xWg
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 08:05:02 +1000 (AEST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-d39f741ba0so17537955fac.13
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 15:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4/357n4d4PC5YAq5NidvohooacKB5fUdQBW6Hucbgps=;
 b=d2H+qn0PkNsq8tMkvoJllDS2eeUjoZZ7gKwJ56Zq2FzDvJagXqpDQ2zUN228v+Lehu
 rCI0Cm00uVi1JPQFOAXcBZFL1fgyT5b2ft61lEZhCeEuPVvqODY3utZbuKSk7h0mLopd
 VDr1X1tHsAiJ/2ptrwBgFYJ0laaHJ6IqOZyo7kx8UUrQV3IVa+tYsD8nsz8Bl04Utfsd
 Z65syuFpVKi0fy3fW5Odz2NqX5wcIJcLmJTFgv/+OAi0AxOo5tfQTO1jE7kQh0qNWz/o
 d+Tmw/9z2H8qsJGgIrIEZQyqCyhtcBcf7nadGwZIA/2ORuPOKO9IDnrRXm7UIE2zs0lA
 v8LQ==
X-Gm-Message-State: AOAM530OuQvhubUd1XR8IUsMVMWKSA98+XA/3UjS43jzWM13moxc5WEv
 D+CbzEIREIwbxo74NvYaYg==
X-Google-Smtp-Source: ABdhPJw+13gRwqKTE4KCf4uh5v9udRaFyOju2a4GrnrwgI4sxoE14O7swvkeJZIz+clMKl759cYWfQ==
X-Received: by 2002:a05:6870:e3d1:b0:e9:25a0:f5d8 with SMTP id
 y17-20020a056870e3d100b000e925a0f5d8mr4284283oad.132.1650924299987; 
 Mon, 25 Apr 2022 15:04:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u7-20020a056870440700b000e686d1387asm165030oah.20.2022.04.25.15.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 15:04:59 -0700 (PDT)
Received: (nullmailer pid 377536 invoked by uid 1000);
 Mon, 25 Apr 2022 22:04:58 -0000
Date: Mon, 25 Apr 2022 17:04:58 -0500
From: Rob Herring <robh@kernel.org>
To: nick.hawkins@hpe.com
Subject: Re: [PATCH v5 06/11] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Message-ID: <YmcbCgjD85lIRMSf@robh.at.kernel.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-7-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421192132.109954-7-nick.hawkins@hpe.com>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 verdun@hpe.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 02:21:27PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the hpe gxp watchdog timer binding hpe,gxp-wdt.
> This will enable support for the HPE GXP Watchdog.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> v5:
> * Fixed version log
> v4:
> * Made watchdog a child of timer because of same register
>   area based on review feedback
> * Simplified the watchdog yaml as it will get information
>   from parent device
> v3:
> * Used proper patchset format.
> v2:
> * Converted from txt to yaml
> ---
>  .../bindings/watchdog/hpe,gxp-wdt.yaml        | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> new file mode 100644
> index 000000000000..c20da146352f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/hpe,gxp-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP Controlled Watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +  - Jean-Marie Verdun <verdun@hpe.com>
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-wdt
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog0:  watchdog {
> +      compatible = "hpe,gxp-wdt";

How is this h/w controlled? I'm guessing it's part of the timer? If so, 
you don't need this node. A single node can implement multiple 
functions.

Rob
