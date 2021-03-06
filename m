Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81A32FD47
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 21:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtH5w00gmz3ck8
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 07:59:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.170;
 helo=mail-qt1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtH5k6Sn5z30Kp;
 Sun,  7 Mar 2021 07:59:05 +1100 (AEDT)
Received: by mail-qt1-f170.google.com with SMTP id w6so4691174qti.6;
 Sat, 06 Mar 2021 12:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SFEqSSwSe/KzR9VZCsRqchghKKejji8suG50GSay0+M=;
 b=QjnhGFmrUGtrxzM3U7DKVENb3QsuYdjGzPMeG2vut72TFO2ZwDmrK0WIPT25U3GAwZ
 ycXG1fWw7dqascnaLGcPVJgLn943VaTUR/6c018G3XmsY7z7RCt0LD/4iPt5G2AsELYu
 n0qvoqM0gq60OzKIfNIj+uQdCO5iKshdbpkcuwU6OrThjHIPATjUizU8DGUsKDLEpC/k
 L1uLrFR+0A1ZZCxPjWgFPzSb8vRBPISXioZ/Qi7ZAkm0Ga59wQsxTAu2Sl6tbOhfl1Zp
 W8LHOcDZWYPexV5oQ0PB6XayiHaM284XpGPYm0h1D1wP8wA4rRDyAaSsYMU+i/cXDlbx
 zt3w==
X-Gm-Message-State: AOAM531GrwPG7nEhWO7ve5sctZnVZb8GJF0RqvBRaMlhwFaJxNR3NquM
 0O+fvxtnf477EEuT1adddHc/sq+Lx5NWsIs=
X-Google-Smtp-Source: ABdhPJzrYbstCQbyHTs+LKACy+Q3EGh7gYXWL5eAQ6ICuGWnppDHWTdn2sYJwbL2bRd21rCJqClYwA==
X-Received: by 2002:ac8:7359:: with SMTP id q25mr15066984qtp.202.1615064343319; 
 Sat, 06 Mar 2021 12:59:03 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id v187sm4551721qkd.50.2021.03.06.12.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:59:02 -0800 (PST)
Received: (nullmailer pid 1202783 invoked by uid 1000);
 Sat, 06 Mar 2021 20:58:55 -0000
Date: Sat, 6 Mar 2021 13:58:55 -0700
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
Message-ID: <20210306205855.GA1195877@robh.at.kernel.org>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225101854.13896-2-quan@os.amperecomputing.com>
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

On Thu, Feb 25, 2021 at 05:18:51PM +0700, Quan Nguyen wrote:
> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
> reference platform with Ampere's Altra Processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/hwmon/ampere,ac01-hwmon.yaml     | 27 ++++++
>  .../bindings/mfd/ampere,ac01-smpro.yaml       | 82 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
> new file mode 100644
> index 000000000000..d13862ba646b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
> @@ -0,0 +1,27 @@
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
> +  details see ../mfd/ampere,ac01-smpro.yaml.
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
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
> new file mode 100644
> index 000000000000..06b0239413ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ampere,ac01-smpro.yaml#
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
> +    const: ampere,ac01-smpro
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
> +    type: object
> +    description: Ampere Altra SMPro Misc driver
> +    properties:
> +      compatible:
> +        const: "ampere,ac01-misc"
> +
> +  "^errmon(@[0-9a-f]+)?$":
> +    type: object
> +    description: Ampere Altra SMPro Error Monitor driver
> +    properties:
> +      compatible:
> +        const: "ampere,ac01-errmon"
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
> +            compatible = "ampere,ac01-smpro";
> +            reg = <0x4f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            hwmon {
> +                compatible = "ampere,ac01-hwmon";
> +            };
> +
> +            misc {
> +                compatible = "ampere,ac01-misc";
> +            };
> +
> +            errmon {
> +                compatible = "ampere,ac01-errmon";
> +            };

No of these have any properties or resources, why do you need them? DT 
is not the only way to instantiate drivers...

Rob
