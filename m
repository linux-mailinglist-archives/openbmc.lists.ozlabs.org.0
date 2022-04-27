Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9B5148F0
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:13:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWbY0T59z3bc5
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y+ClKEHd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y+ClKEHd; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp7W96yrfz2xy3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 16:04:36 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id dk23so1266334ejb.8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=27SXQOPVAdANNQCQJ4C3V7A5t8g68xh0r46tyDVmRxQ=;
 b=Y+ClKEHd1wAog5IoYY3pf0agZCvamFvLJJRWh+63FD3Va4L/gV5bKPrXggA6CVBuc0
 CUQpuZ36BefavI40ZgfscqtRl/Os2+FhhjeQVYA7NnKj5xae7sGtbcehw/F6Tw8T4lL6
 6CBOoOB+cjLA8LFuMLUB+jhkY9WedHACo5PHIo71xio/tehD9/sqYoT+SlSgHkPGoNo0
 gAhj4jX0hbwalsFgWOtuyo3tMCG9qAqZ/BDKH2bWApnpvHMqShdaET0Pa91yiPbIGEQQ
 J95OijOLMO/iV+v1ne9spHnUForaXEpWnY/U6XoLH3DV1IYtXkJClbCiYZS9NHVt+sbK
 STww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=27SXQOPVAdANNQCQJ4C3V7A5t8g68xh0r46tyDVmRxQ=;
 b=4VlpLhouGAZRWHg4BQ9Xm5FbbuhHJw5HJftEI3F9GeoXmKwUc8RozFwwKkFuYk798P
 huvyYOuyWG9B1adhmz2to36hEA2aFkXxi6RTVVhA/AX1O89qF09jr+M1/07Ry1LENWGC
 UIVPw/3W8WKBuGpYDO+H4WH3to5JFxY80MK1tk6nXrqvlmT0jI592b2O9dWxFlYSba/D
 yoOCpLVHFVN49ArbelQV/SgqBVHNEB4+kFEO6W/sSoMuEfAR0cAV8KOskoE/Q2LGM4OQ
 2Cwi1xQ+fAjZcJYs4AtlOf1TGO3A41jfSm2HgpY9DLf6xVS32UgmTvU6slsZG6nfI5Q8
 QSzg==
X-Gm-Message-State: AOAM531pk1fGlsU5CQJ6srhm/CmkxTIs/1mbsKiRgiw6HKUGPK39I0Br
 CXDzOBSTKDEGOp5ApB5MGYtyZA==
X-Google-Smtp-Source: ABdhPJwWDR9IhrmVQfKp1JkwSdivR59TpiJ9LC3ukLWrvDIX/tdF3PY94O0nR9+ygi9bDJsFjar41A==
X-Received: by 2002:a17:907:8a0b:b0:6f3:bbab:4ad1 with SMTP id
 sc11-20020a1709078a0b00b006f3bbab4ad1mr4453194ejc.135.1651039471996; 
 Tue, 26 Apr 2022 23:04:31 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l3-20020aa7cac3000000b00422c961c8c9sm7564792edt.78.2022.04.26.23.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 23:04:31 -0700 (PDT)
Message-ID: <178b9310-a854-dfa6-a4f3-f971b608abe3@linaro.org>
Date: Wed, 27 Apr 2022 08:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <20220427010154.29749-2-zev@bewilderbeest.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427010154.29749-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 29 Apr 2022 22:12:55 +1000
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27/04/2022 03:01, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I already reviewed it so I guess you did not include the tag because of
significant changes?

> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> new file mode 100644
> index 000000000000..418477374fdb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> @@ -0,0 +1,56 @@
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
> +  nuvoton,tsi-channel-mask:
> +    description:
> +      Bitmask indicating which TSI temperature sensor channels are
> +      active.  LSB is TSI0, bit 1 is TSI1, etc.

Need a type/ref.

> +    maximum: 0xff
> +    default: 0

Since by default it is disabled, doesn't it make a required property?
IOW, if you add a node without this mask, will the device operate
properly and usefully?




Best regards,
Krzysztof
