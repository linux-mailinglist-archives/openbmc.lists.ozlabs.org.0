Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F2520A34
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 02:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxzWy6wSVz3brn
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 10:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BSrhzxAF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2a;
 helo=mail-oa1-x2a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BSrhzxAF; dkim-atps=neutral
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxzWW1QPVz2ymg
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 10:32:04 +1000 (AEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so16581233fac.12
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 17:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XtS/P9SmLyk3QKWLF6JMOAV4b0xIsdiYHPObF4LauGQ=;
 b=BSrhzxAFg7vDoEAPdmxTC8b0yvX+6eIwJS56/qBvt4E/7YteelJ39f3uaU1h+irl8b
 ESQGYmYixD9vuUqsyx/heCdeCpMFaUzpjkTMN5+rOI3+V741UInfr4UjTURRj+A8dbfZ
 qnJdOX//nsKTILx+LQJNrepr0D1xnlZGZJN+s6fsqRhk1bmsnipSgnC75kYCs+GIlBY+
 eYSybBLKHYBZMXWpIYNRxDsoTb8TWNZncYA2dUNcyLYHjQpSUqSavXO6HT1oKWNDgLdm
 JxPWEMnvgdr4LFgx4ASFDtFGzeS2DZJqEl88jHtvm+S/myRHPG7428A+gmvvX0SjKpv9
 xvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=XtS/P9SmLyk3QKWLF6JMOAV4b0xIsdiYHPObF4LauGQ=;
 b=dJ0UDdfvbg4iDjIh3mY4m2VRmU8OYAnMOCvym3NeKAWCqmkdxtznuAQRtO0V6Qz5Pe
 Q5JJQN1CHNxt5M1mJQ+aNg2SowryudyuTERuYgPAkq42HBBFoQsaD69f4Dt7xcGhs2iX
 PFmzLRUl3VqNwVzGTaw3zfAK2d2IMyWE4/YZLW4KCDNZWgw0oFcTgBI19U7LoasMeFrR
 3OtLmRP82iBns5bwdvMEjuKNYArac89GzSPyFS6w6N37daoFjokPYK7YBGnxjbIrMN1L
 0vqKHG2LHjswf1XLUS66cHqVvdmSoB50sKeIXUVRzWozMKrl9aWV6gKNLFSxBoDvE0fj
 Z0gg==
X-Gm-Message-State: AOAM532H+gZu3YV/5iv2VTof2lp9vNyA3UO7kupvYoE3XrPfwCrkuhEK
 QSgzUP82iLMKYvagMza9nqQ=
X-Google-Smtp-Source: ABdhPJxQubDMBuGGFGcBGtQ05uHQ5cLejrRVo9CQ00xyhkTOd/6FYn7yVWlRvW8lJ7+aTn/5BuMQ/A==
X-Received: by 2002:a05:6870:15d0:b0:e9:8787:60c2 with SMTP id
 k16-20020a05687015d000b000e9878760c2mr11629759oad.294.1652142717960; 
 Mon, 09 May 2022 17:31:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a4aac8e000000b0035eb4e5a6bcsm5622339oon.18.2022.05.09.17.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:31:57 -0700 (PDT)
Date: Mon, 9 May 2022 17:31:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add nuvoton,nct6775
Message-ID: <20220510003156.GA1561729@roeck-us.net>
References: <20220428012707.24921-1-zev@bewilderbeest.net>
 <20220428012707.24921-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428012707.24921-2-zev@bewilderbeest.net>
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
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Krzysztof Kozlowski <krzk@kernel.org>, Renze Nicolai <renze@rnplus.nl>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 06:27:06PM -0700, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> new file mode 100644
> index 000000000000..358b262431fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> @@ -0,0 +1,57 @@
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
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 0xff
> +    default: 0
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
> +            nuvoton,tsi-channel-mask = <0x03>;
> +        };
> +    };
