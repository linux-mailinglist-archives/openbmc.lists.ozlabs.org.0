Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649250E410
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 17:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn7gm3GWCz3bfL
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 01:08:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HOTPf6CK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e;
 helo=mail-oa1-x2e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HOTPf6CK; dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn7gK1bb7z2ywF
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 01:08:11 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e656032735so15083246fac.0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=za1mZHss+li0ybPEY6i/L34F8j+pk+2DumO4nFr5Nqw=;
 b=HOTPf6CKzKzNtGoZg5BVXqz56lD0FnvFQgQD/QpQp1mfRh5BLZkKlYB/4e+q1voe+D
 DvtwJpjx10q5fE3em4lCpWGNIECHmNi/ok0z7UsAjJO94VwvAmVWERtLUUF/AVyUCoEN
 bBB/TG/yuJpuEnfJyvea0qz7bVQhCfUoVb+fh/W4vL4a6B5oXDSiV/0RFgvBJHLaVs05
 K8vGTzOh2yoHv6De3UwwJoNkzCC8aDfGjjmWOCDv7ugp9P8iT2RbrboATd+nd1ltD4Cd
 pW5/ti8Yr/Jon7QRkHj4YBoClzCR3Bj+D0+CMCuVVyzlC5/g0jaUrW61hp8+6EtC9f0F
 8gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=za1mZHss+li0ybPEY6i/L34F8j+pk+2DumO4nFr5Nqw=;
 b=SC9B8sRKgBPsN56a0oCVbad84lyBWVazFVVwxV3hPILHIaFD+4sxW9Bqp//5NrNu25
 tQemFh4GCp+71Bo1Ebo7N2o64qqB+JOBBhh8Yo9kPPb+iws+7ZhTOIdUy99COliswCLN
 NQlof0bCS1X85HYmuRpBbnIBQPOizvvAqUjHr3ummERX/j9Q7sK1g1+wC4tuyL0zBQS4
 dnJ+eTM6z9VRfozEILFEpcRdwJU2EvobChNoLd/dC/0Z7RmeWA240aJ6nh+vLueMXd2z
 b1fdZz9KX59U0iuUZGCYN2WaWI4eFQQ02XjGtrDQ1llM/Atf9Dkms3hOk5xhEo8H94e5
 6CDA==
X-Gm-Message-State: AOAM530o4VjX7VdzqqshA99wuTPXu8h9vEXDiaFv/4jNtLgr7eBZuoBc
 76FqgAoRP3hsCcsQyMl4e/c=
X-Google-Smtp-Source: ABdhPJyzc6gXFrcLW8x8oJ6ozRGcsrCXhmmdRz6dFfIR7Qz8FnM7l8VZx/RvOA7UfN3sl1y6XrSwIA==
X-Received: by 2002:a05:6870:15d0:b0:e9:12ad:288c with SMTP id
 k16-20020a05687015d000b000e912ad288cmr4799481oad.223.1650899284840; 
 Mon, 25 Apr 2022 08:08:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a056820061a00b0035e46250f56sm3782576oow.13.2022.04.25.08.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 08:07:57 -0700 (PDT)
Date: Mon, 25 Apr 2022 08:07:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: Add nuvoton,nct6775
Message-ID: <20220425150748.GA4165124@roeck-us.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
 <20220309005047.5107-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309005047.5107-2-zev@bewilderbeest.net>
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
 Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 08, 2022 at 04:50:42PM -0800, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

This is still waiting for DT maintainer approval.

Do you expect to add further properties along the line ?
If not, you might consider adding the chips to trivial devices instead.

Guenter

> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> new file mode 100644
> index 000000000000..7b1054db46b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct6775.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NCT6775 and compatible Super I/O chips
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct6106
> +      - nuvoton,nct6116
> +      - nuvoton,nct6775
> +      - nuvoton,nct6776
> +      - nuvoton,nct6779
> +      - nuvoton,nct6791
> +      - nuvoton,nct6792
> +      - nuvoton,nct6793
> +      - nuvoton,nct6795
> +      - nuvoton,nct6796
> +      - nuvoton,nct6797
> +      - nuvoton,nct6798
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        superio@4d {
> +            compatible = "nuvoton,nct6779";
> +            reg = <0x4d>;
> +        };
> +    };
