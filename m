Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23EC4BACA9
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 23:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K08mS2SvNz3cVw
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 09:35:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.46; helo=mail-io1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K08m76Dkmz30KZ
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 09:35:17 +1100 (AEDT)
Received: by mail-io1-f46.google.com with SMTP id v19so526838iom.7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 14:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QJCJJkJqtOsQ/CSbeUuObYQcThTPRTm035a09VI6ZJ4=;
 b=VCTVAtHfmkDccpf+1g7QipBdO0JblpmN7bCh1YE+9D8UqMU2ebQOVh07pPK8a5Df6L
 sPrYFpmMob9jRh7QvYR69kORZUT0rUkuIZ2kzYJgOOAMIb5EQ/Lb8rrt+1DJh4nRdaja
 Hg7Q45tcixq7wjGLiB0uoCPeoNP62Q8yv8svW1YMAJYHvixK/Ca2MwVDNXqlbooOA7QO
 gnLC+aaCgmJZFfrz2LRM5GeVcCOJi1fhN+zxgVuaA2FJToe3IJ8gxv0O96/FT/mTISCh
 Vt1i8m75PJJoi6xh1dzTpcpJMTzIVHI55rMa5bLbMKIjgzJCAdFdWWpfdHvVFNN2wtIO
 q6iw==
X-Gm-Message-State: AOAM533HdM/D/INZu3BWeKAjL86Z0pxy62Tpgs1Eglfv7esuz4vY1KqS
 q/UxvNA5M1mIQ7/LeiyswA==
X-Google-Smtp-Source: ABdhPJy0BMvl0r/0X5Zc06+9xSfxyHJxRc8f8yEbFq5HYdWl/tpmNswA1NCuOnIwtqi5NIlgpfhMVw==
X-Received: by 2002:a02:7a16:0:b0:313:f2f9:2ebc with SMTP id
 a22-20020a027a16000000b00313f2f92ebcmr3370002jac.136.1645137315031; 
 Thu, 17 Feb 2022 14:35:15 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id u15sm2891106ill.75.2022.02.17.14.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:35:14 -0800 (PST)
Received: (nullmailer pid 3892127 invoked by uid 1000);
 Thu, 17 Feb 2022 22:35:12 -0000
Date: Thu, 17 Feb 2022 16:35:12 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 3/4] dt-bindings: Add power-efuse binding
Message-ID: <Yg7NoLzC7zt2oihV@robh.at.kernel.org>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
 <20220217104444.7695-4-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217104444.7695-4-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 17, 2022 at 02:44:43AM -0800, Zev Weiss wrote:
> This can be used to describe a power output supplied by a regulator
> device that the system controls.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../devicetree/bindings/misc/power-efuse.yaml | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> new file mode 100644
> index 000000000000..cadce15d2ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic power efuse device

No idea what this is, but I doubt any such generic device exists. This 
needs sufficient description to be convincing that it is indeed generic.

> +
> +maintainers:
> + - Zev Weiss <zev@bewilderbeest.net>
> +
> +properties:
> +  compatible:
> +    const: power-efuse
> +
> +  vout-supply:
> +    description:
> +      phandle to the regulator providing power for the efuse
> +
> +  error-flags-cache-ttl-ms:
> +    description:
> +      The number of milliseconds the vout-supply regulator's error
> +      flags should be cached before re-fetching them.

What are 'error flags'? Not something I've heard with respect to 
regulators.

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
