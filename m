Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7382D82E9
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 00:52:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct6z16YvnzDqMF
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 10:52:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oILKR204; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct6y63NJmzDqcG
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 10:51:39 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id 15so11855053oix.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 15:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tA1fqnnr3vajfoGbWMUpasOa0HqMdTDCvorB/43zAo8=;
 b=oILKR204NyeBZpE1Btl2YFOguZlAbDaa/u5OahBeLPdAUFuldy02IYyvcYAjYdVTUd
 0wIVk4BM4jrPr/6ws1nl+HXOxvuCqktTkYhrAf1DIVnFpLs6I3Oj/8GiEYDhtNINGeLw
 haf2CoDJzQGSoUAo6AVP40xEUE07OkRuJoBCOt2OUcAGOshLY45r7A1IoYJqkjVLldW6
 TljmTd0iaOEx/YmmbBD6aj6yPB+DodeB1ecgk/NYd+Q6WfhmMxUzfdxTZskAdM8Ro/78
 fgiq5vLL3heVXpLj48d3d7I1HeTCtW2C7u2j64fSMqs3KR5DZodpBOlaektWTwmudIx7
 s0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tA1fqnnr3vajfoGbWMUpasOa0HqMdTDCvorB/43zAo8=;
 b=gZQy7CyWmiK4ntd0hsbM/KfWwHtLlSdB/EJOYLenbrKms+FqsxNCTG4YWYnQfEcEjA
 HUxt7FKiuplMOwCcT7biIMA9MwHquxD8W+MnODoVPWdLdc6ahUnPwAszwz8o7qu0aQTe
 D0+wx1YNU+PQ6L2aNl8zBfxZ28urBXNDfKEmWWG8L7A6XPm85rTJZ7QIOE7METm1dMBJ
 Ntb0MTEo0icIXPPfijHEALLIPGRayymzhFcSudQ3Rx6uxV6YEePqPyO1z+o+KHpA5Oqg
 cXSGUHJooF+y5FFp7ts74Bz8/rleIE0l98NUD2ixSl/lWp8MVetUStD5gc2c6YD+AVc5
 n6UQ==
X-Gm-Message-State: AOAM532Emmjdgl+M8zTfiv3stsOyL0/OSwOoyROsI0OyYNnXZvnUO3n+
 wq9tivwqp3QQxCYGEhZgVms=
X-Google-Smtp-Source: ABdhPJwgckDEO5BSY8l79JMx1g0jg0nMZUwO4pfhmOXoHtg8Tq9icOAu+uMM1dAmzW3CN3c0JGREcw==
X-Received: by 2002:aca:c388:: with SMTP id t130mr11116951oif.36.1607730696037; 
 Fri, 11 Dec 2020 15:51:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w6sm2300155otm.54.2020.12.11.15.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 15:51:35 -0800 (PST)
Subject: Re: [PATCH linux hwmon-next v5 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
To: Kun Yi <kunyi@google.com>, jdelvare@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, supreeth.venkatesh@amd.com
References: <20201211215427.3281681-1-kunyi@google.com>
 <20201211215427.3281681-4-kunyi@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <116ca29a-8270-9b03-520e-bc3ffcf43552@roeck-us.net>
Date: Fri, 11 Dec 2020 15:51:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211215427.3281681-4-kunyi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/11/20 1:54 PM, Kun Yi wrote:
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Any reason for dropping Rob's Reviewed-by: tag ?

Guenter

> ---
>  .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> new file mode 100644
> index 000000000000..446b09f1ce94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/amd,sbtsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: >
> +  Sideband interface Temperature Sensor Interface (SB-TSI) compliant
> +  AMD SoC temperature device
> +
> +maintainers:
> +  - Kun Yi <kunyi@google.com>
> +  - Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +
> +description: |
> +  SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> +  interface that reports AMD SoC's Ttcl (normalized temperature),
> +  and resembles a typical 8-pin remote temperature sensor's I2C interface
> +  to BMC. The emulated thermal sensor can report temperatures in increments
> +  of 0.125 degrees, ranging from 0 to 255.875.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amd,sbtsi
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C bus address of the device as specified in Section 6.3.1 of the
> +      SoC register reference. The SB-TSI address is normally 98h for socket
> +      0 and 90h for socket 1, but it could vary based on hardware address
> +      select pins.
> +      \[open source SoC register reference\]
> +        https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sbtsi@4c {
> +                compatible = "amd,sbtsi";
> +                reg = <0x4c>;
> +        };
> +    };
> +...
> 

