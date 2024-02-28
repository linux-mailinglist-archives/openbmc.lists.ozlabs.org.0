Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938486A8FD
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 08:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl5dJ54Mvz3dWb
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 18:31:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl5d05LLzz2yk8
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 18:31:16 +1100 (AEDT)
Received: from [192.168.0.224] (ip5f5aedb1.dynamic.kabel-deutschland.de [95.90.237.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A509361E5FE04;
	Wed, 28 Feb 2024 08:30:42 +0100 (CET)
Message-ID: <93d67381-34fc-423c-868a-565378c63e09@molgen.mpg.de>
Date: Wed, 28 Feb 2024 08:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: hwmon: Add NCT7363Y documentation
Content-Language: en-US
To: Ban Feng <baneric926@gmail.com>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-3-kcfeng0@nuvoton.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240227005606.1107203-3-kcfeng0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Ban,


Thank you for your patch.


Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> Adding bindings for the Nuvoton NCT7363Y Fan Controller

s/Adding/Add/ or even Document bindings …

Do you have an URL to the datasheet?

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---
>   .../bindings/hwmon/nuvoton,nct7363.yaml       | 63 +++++++++++++++++++
>   MAINTAINERS                                   |  6 ++
>   2 files changed, 69 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> new file mode 100644
> index 000000000000..1a9d9a5d614e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NCT7363Y Hardware Monitoring IC
> +
> +maintainers:
> +  - Ban Feng <kcfeng0@nuvoton.com>
> +
> +description: |
> +  The NCT7363Y is a Fan controller which provides up to 16 independent

lowecase: fan controller?

> +  FAN input monitors, and up to 16 independent PWM output with SMBus interface.

output*s*?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7363
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +patternProperties:
> +  "^fan-[0-9]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    required:
> +      - pwms
> +      - tach-ch
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#pwm-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hwmon: hwmon@22 {
> +            compatible = "nuvoton,nct7363";
> +            reg = <0x22>;
> +            #pwm-cells = <2>;
> +
> +            fan-0 {
> +                pwms = <&hwmon 0 50000>;
> +                tach-ch = /bits/ 8 <0x00>;
> +            };
> +            fan-1 {
> +                pwms = <&hwmon 1 50000>;
> +                tach-ch = /bits/ 8 <0x01>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2ecaaec6a6bf..7b1efefed7c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15084,6 +15084,12 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>   F:	drivers/hwmon/nct6775-i2c.c
>   
> +NCT7363 HARDWARE MONITOR DRIVER
> +M:	Ban Feng <kcfeng0@nuvoton.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> +
>   NETDEVSIM
>   M:	Jakub Kicinski <kuba@kernel.org>
>   S:	Maintained

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
