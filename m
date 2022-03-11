Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB34D6481
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 16:25:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFV9T6Q4Cz30Fw
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 02:25:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.176;
 helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFV9B64h2z2yn9
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 02:24:46 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id o83so2225486oif.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 07:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wj8G09tyyau5yMZxls0yIJBXoGqCQIhnO/G1icNodFU=;
 b=hajTvJPaZsvpLeXDL/rJ3VLorIa9CVIVMKOfFU63MN1EXmhkfEpZCAvSHlcrXr6MbO
 8Xn4/6Y2fWEJ7WJAG0SndLPlpDyZgUB3+ZJ38tODjvIv76ticdoUh2Hd+Bv8uh845wQV
 MApb0U9CaP3h6nhH//92ZbfsFeGlaBDRwoXHe5eYagPFeLDO80rcc6jnKbJz5MgmR7H9
 WWMdYyV1VoNEzaguZGo+X1Qh8NmglOtnDX5wT8f6/LFhaPX/z/O3OB+hJukpyszaAGbf
 L61S76gMpEYZb3EvWT56GHl9ETc3duxuoqKq/Lkj9oZAniZVOjI9PDFaiLieoSggUOOl
 7iuQ==
X-Gm-Message-State: AOAM531mItD4lVOzyD2MGL3Ug5tEWuwP023slA7KwpNrryeclRxbo6Ls
 Q8StfOFnYuBJbA4YEXM9lA==
X-Google-Smtp-Source: ABdhPJzzQzQLbkCyppMXDo/APn8Hm72RdGKl9lKuHngLjJNbvlPq/mreKAsrBqheGl31MgPNNCLJMA==
X-Received: by 2002:a05:6808:2122:b0:2da:3444:9908 with SMTP id
 r34-20020a056808212200b002da34449908mr7203108oiw.207.1647012283302; 
 Fri, 11 Mar 2022 07:24:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p21-20020a4a2f15000000b00320fca09b74sm3765248oop.1.2022.03.11.07.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:24:42 -0800 (PST)
Received: (nullmailer pid 3824535 invoked by uid 1000);
 Fri, 11 Mar 2022 15:24:41 -0000
Date: Fri, 11 Mar 2022 09:24:41 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add power-efuse binding
Message-ID: <YitpuR+SlDiKh4eq@robh.at.kernel.org>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308011811.10353-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 07, 2022 at 05:18:09PM -0800, Zev Weiss wrote:
> This can be used to describe a power output supplied by a regulator
> device that the system controls.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../devicetree/bindings/misc/power-efuse.yaml | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> new file mode 100644
> index 000000000000..5f8f0b21af0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic power efuse device
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +description: |
> +  This binding describes a physical power output supplied by a
> +  regulator providing efuse functionality (manual on/off control, and
> +  auto-shutoff if current, voltage, or thermal limits are exceeded).
> +
> +  These may be found on systems such as "smart" network PDUs, and
> +  typically supply power to devices entirely separate from the system
> +  described by the device-tree by way of an external connector such as
> +  an Open19 power cable:
> +
> +  https://www.open19.org/marketplace/coolpower-cable-assembly-8ru/

Not really a helpful link...

I still don't understand what the h/w looks like here. At least I now 
understand we're talking a fuse on power rail, not efuses in an SoC 
used as OTP bits or feature disables.

> +
> +properties:
> +  compatible:
> +    const: power-efuse
> +
> +  vout-supply:
> +    description:
> +      phandle to the regulator providing power for the efuse

Vout is a supply to the efuse and not the rail being fused? 

Sorry, I know nothing about how an efuse is implemented so you are going 
to have to explain or draw it.

> +
> +  error-flags-cache-ttl-ms:
> +    description:
> +      The number of milliseconds the vout-supply regulator's error
> +      flags should be cached before re-fetching them.

How does one fetch/read? the error flags?

> +
> +required:
> +  - compatible
> +  - vout-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    efuse {
> +        compatible = "power-efuse";
> +        vout-supply = <&efuse_reg>;
> +        error-flags-cache-ttl-ms = <500>;
> +    };
> -- 
> 2.35.1
> 
> 
