Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EA730B0F
	for <lists+openbmc@lfdr.de>; Thu, 15 Jun 2023 00:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhLSM3yPwz3bfm
	for <lists+openbmc@lfdr.de>; Thu, 15 Jun 2023 08:58:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.179; helo=mail-il1-f179.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhLRy5j0Mz30LM
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2023 08:58:04 +1000 (AEST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-33d0b7114a9so39903355ab.2
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2023 15:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686783482; x=1689375482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLGM39FLWeHazKbyQ5qG1ef0mVobIExKkf/G6dZDYYk=;
        b=URpMwu6eK5IoXDGOgME32epu7mfNon6lWc+Jw6apyIAaL04DS2f8Vd7FY+itJ4oFA2
         09sS+4vmNhK1D3epwo8VFuANzaT6TMuCdRtH1QfBM3pJXvvhkATUD0D2BCf+bZywSojD
         2t44K3vuVLWUjnTFqTmj7KdC4NBx46WvOxyaKbz2Um6CnYr+5MtYKEEyEu6Uw9xgjYb2
         Z2IpGYWgakwlaEyp0KuCmYNnPEsFzG7IUpDaD9tMx29L/0HbTNQ/AsFduS5XFeI7NejE
         /qVsC5/R52jhH43nfUTZ3q0HTLdBlZzpcXjcMLnjIvcC10BaGnIxUrHxP+CqSmM6b5Xs
         Vepg==
X-Gm-Message-State: AC+VfDztMPiCVgtRfcoD7K6WdRs1V5ljq/ZLKUEMCnun5hR0QgTESeJB
	OGdLQxVinBtgpnQTl36kmA==
X-Google-Smtp-Source: ACHHUZ4k17CCU/Cdgkvy8zZd1iBM9okPT7i/UNDIJhF1Nh6e59EfqO7f9Vf5PDbEGaNZhJDBaJyQ1w==
X-Received: by 2002:a92:c992:0:b0:337:a0d8:cdf9 with SMTP id y18-20020a92c992000000b00337a0d8cdf9mr16280943iln.28.1686783482112;
        Wed, 14 Jun 2023 15:58:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k11-20020a02cccb000000b004065707eb2bsm5292604jaq.42.2023.06.14.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:58:01 -0700 (PDT)
Received: (nullmailer pid 3018539 invoked by uid 1000);
	Wed, 14 Jun 2023 22:57:59 -0000
Date: Wed, 14 Jun 2023 16:57:59 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Nuvoton NCT7362Y binding
Message-ID: <20230614225759.GA3003701-robh@kernel.org>
References: <20230607101827.8544-4-zev@bewilderbeest.net>
 <20230607101827.8544-5-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607101827.8544-5-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 07, 2023 at 03:18:29AM -0700, Zev Weiss wrote:
> This binding describes the NCT7362Y, a 16-channel fan/GPIO controller.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct7362.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> new file mode 100644
> index 000000000000..630dcce7a14c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7362.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NCT7362Y fan controller
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +description: |
> +  The Nuvoton NCT7362Y is an I2C fan controller with 16 pins that can
> +  be independently configured for PWM, fan tach, or GPIO
> +  functionality.  Each pin's functionality is represented by a child
> +  node.
> +
> +  The datasheet is not publicly available but can be requested from
> +  Nuvoton via their web site.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7362
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 16
> +
> +patternProperties:
> +  "^tach@([1-8]|1[0-7])$":

Unit-addresses are hex typically.

Why do you need a child node for tach. Is that a separate h/w block.

> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: The pin number.
> +
> +      nuvoton,pulses-per-revolution:

This is a property of the fan attached and belongs in a fan node 
describing the fan(s) properties. Until a common binding exists, further 
fan controller bindings are going to be rejected.

The furthest attempt was here[1]. And there's the Aspeed effort[2] which 
keeps ignoring our feedback. Please work together on these.

Rob

[1] https://lore.kernel.org/all/20221121122932.2493174-2-Naresh.Solanki@9elements.com/ 
[2] https://lore.kernel.org/all/20230608021839.12769-1-billy_tsai@aspeedtech.com/
