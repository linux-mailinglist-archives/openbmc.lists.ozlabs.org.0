Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C885F35E093
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 15:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKRmQ53qnz3bV9
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 23:49:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.48; helo=mail-oo1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKRmC5LJCz309r;
 Tue, 13 Apr 2021 23:49:13 +1000 (AEST)
Received: by mail-oo1-f48.google.com with SMTP id
 h2-20020a4ad7420000b02901e5901169a5so3602393oot.8; 
 Tue, 13 Apr 2021 06:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BPp8f1sOttmW9qE2ykHdzJcGKB/6rMwTRWEU3ycTH2A=;
 b=kVbXhNagDw3GKXlXHvEwHhnkCIf3EEj3HxtUL90CMM9UtTQXAVUnnfRq9FQ388o5QE
 PnxVO9M2wetKi6qpnD046heaxWOpLffWy9F1o7wGZrAuBlU40ErkoDmhW2jKK3mXu+Q7
 46Ya0GOowsPZvVoDhGToEHS2d5wLtT5v5UvkY1AyZPti/weI/rsqyKVuifrKo8/gt4YJ
 xAdLJVf+hjtRVboDof808yTlUegERD70E/EsN0nAcABAegGeFm21qHF/DQgqIAm4o6N5
 4z9U1QW+Y57qT0Q7YsgNcAPrAZ8A2EGEbNUu8GkN1LKE82EnT3mt3Y5a41+geeHql8iT
 7TVw==
X-Gm-Message-State: AOAM532HfV1QKCsZeEE5uzoBKcegyILUJlJJFSjo4Wgkbr6Zk8p680NI
 LW+uDh3pMXJa6vVOhuZG0g==
X-Google-Smtp-Source: ABdhPJw0Vw8Z1kQ1jPM5GwBfySUTY++fjq8ZEMWc4yQCjwQPjrABcVI5iL8Xk2kVddqjw9QIhLswdg==
X-Received: by 2002:a4a:bc92:: with SMTP id m18mr3988186oop.55.1618321748787; 
 Tue, 13 Apr 2021 06:49:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f129sm2904769oia.9.2021.04.13.06.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:49:07 -0700 (PDT)
Received: (nullmailer pid 1550857 invoked by uid 1000);
 Tue, 13 Apr 2021 13:49:06 -0000
Date: Tue, 13 Apr 2021 08:49:06 -0500
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
Message-ID: <20210413134906.GA1538655@robh.at.kernel.org>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409031332.21919-2-quan@os.amperecomputing.com>
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
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 10:13:29AM +0700, Quan Nguyen wrote:
> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
> reference platform with Ampere's Altra Processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +++++
>  .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++++++++++++++++
>  2 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
> new file mode 100644
> index 000000000000..fbf7ec754160
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ampere,ac01-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hardware monitoring driver for the Ampere Altra SMPro
> +
> +maintainers:
> +  - Quan Nguyen <quan@os.amperecomputing.com>
> +
> +description: |
> +  This module is part of the Ampere Altra SMPro multi-function device. For more
> +  details see ../mfd/ampere,smpro.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ampere,ac01-hwmon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> new file mode 100644
> index 000000000000..5613c420869e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ampere Altra SMPro firmware driver
> +
> +maintainers:
> +  - Quan Nguyen <quan@os.amperecomputing.com>
> +
> +description: |
> +  Ampere Altra SMPro firmware may contain different blocks like hardware
> +  monitoring, error monitoring and other miscellaneous features.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ampere,smpro

Again, not very specific. There's only 1 version of 'smpro' h/w or 
firmware? Are the firmware version and features discoverable? If not, 
you need to be more specific (or better yet, make them discoverable).

> +
> +  reg:
> +    description:
> +      I2C device address.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^hwmon(@[0-9a-f]+)?$":
> +    $ref: ../hwmon/ampere,ac01-hwmon.yaml
> +
> +  "^misc(@[0-9a-f]+)?$":

You don't need these child nodes in DT if there are no resources 
associated with them. The parent driver can instantiate all the 
sub-functions.

> +    type: object
> +    description: |
> +      This module is part of the Ampere Altra SMPro multi-function device
> +      to support miscellaneous features
> +    properties:
> +      compatible:
> +        enum:
> +          - ampere,ac01-misc
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +  "^errmon(@[0-9a-f]+)?$":
> +    type: object
> +    description: |
> +      This module is part of the Ampere Altra SMPro multi-function device
> +      that supports error monitoring feature.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - ampere,ac01-errmon
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
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
> +        smpro@4f {
> +            compatible = "ampere,smpro";
> +            reg = <0x4f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            hwmon@10 {
> +                compatible = "ampere,ac01-hwmon";
> +                reg = <0x10>;
> +            };
> +
> +            misc@b0 {
> +                compatible = "ampere,ac01-misc";
> +                reg = <0xb0>;
> +            };
> +
> +            errmon@80 {
> +                compatible = "ampere,ac01-errmon";
> +                reg = <0x80>;
> +            };
> +
> +        };
> +    };
> -- 
> 2.28.0
> 
