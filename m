Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6634F2EE
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 23:16:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F92LB2PvWz3c1d
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 08:16:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F92Kz52nPz2yYn;
 Wed, 31 Mar 2021 08:15:51 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so16922681otk.5; 
 Tue, 30 Mar 2021 14:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4vChBJJ6EYanz1jBGjgMMr+PeNDASuUg2ns+WfjA4bE=;
 b=FIl/c///aldC/runDZnPL538vHYizg02POyZhFjdPRN94ycsdV/zlfQ7vecQjTcFxJ
 0LBXHCfY7kuacW+af7GAUte2n42BqmQSFTDqfcuFY9c1w6Vh+Fw29W9XDGTv+I99rseK
 gM1SP8a4+xhhRofidQs5hY20VP1U7xYsx/qdBCOFRS8j/qP5XOiYoPReLqZe75i2xTLt
 42/AugW2rgRKJZqeK1/xBu7XCkEtQPcw0DgBQbdy2UVQIDpGa2mawoHS4Ez5gT6cCmo3
 YnCnMJAdBlfLjmN9+KchltI9Og+03Z9YIuNCB4yPGb+tBXhA4/qVfhwolxCRhGLHZEJ8
 BAHw==
X-Gm-Message-State: AOAM532VFzCx3buojutdm309wYdOAAm6P7Ui8thzfyoEy5iRttKBIK1T
 0Fb1oXczE6I3Ij+gbHQlAQ==
X-Google-Smtp-Source: ABdhPJz0LTLMITQ7Y8/X5B6FbMkC38+yfV0Tx1qBMnvJjdAy8X4mInt+GzTPko2+l4MglZX/rGRzRA==
X-Received: by 2002:a9d:171d:: with SMTP id i29mr28517424ota.294.1617138948168; 
 Tue, 30 Mar 2021 14:15:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j4sm15914oom.11.2021.03.30.14.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:14:51 -0700 (PDT)
Received: (nullmailer pid 729378 invoked by uid 1000);
 Tue, 30 Mar 2021 21:14:44 -0000
Date: Tue, 30 Mar 2021 16:14:44 -0500
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
Message-ID: <20210330211443.GA326528@robh.at.kernel.org>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329015238.19474-2-quan@os.amperecomputing.com>
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

On Mon, Mar 29, 2021 at 08:52:35AM +0700, Quan Nguyen wrote:
> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
> reference platform with Ampere's Altra Processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/hwmon/ampere,ac01-hwmon.yaml     | 27 ++++++
>  .../devicetree/bindings/mfd/ampere,smpro.yaml | 82 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
> new file mode 100644
> index 000000000000..015130a281f4
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
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> new file mode 100644
> index 000000000000..bf789c8a3d7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> @@ -0,0 +1,82 @@
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
> +    const: ampere,smpro

Only 1 version of SMPro? Needs to be more specific or provide details on 
how the exact version of firmware/hardware is discovered.

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

Bindings describe h/w, not drivers.

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
> +            compatible = "ampere,smpro";
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

None of the child nodes have any resources in DT, so you don't need 
them in DT.

Rob
