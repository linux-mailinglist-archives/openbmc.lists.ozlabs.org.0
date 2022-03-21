Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57E4E2403
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 11:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMVhN6JJ0z30hh
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 21:09:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMVh42l7Qz30GB
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 21:08:50 +1100 (AEDT)
Received: by mail-ej1-f42.google.com with SMTP id bg10so28760999ejb.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 03:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ohJbf78zjin+5q9ryuarHm9CqYHkiO/NM9/l5+6R9tY=;
 b=48d19KLC2SwxIhhJwxPLrpdmwsbZJw7JAOGz323TVP5NM/hSKCs+tB9EQ9bP3SyCHS
 qPuGEQYJ30lbqGkuQN8E9cJp33KfhqdbBmGAlTDGQIbzlRrrBzciHZFTpXER4mV83/Ab
 2FrSXjWSg3lMOPgg+fSHr+Ey1rbwyOsSDwRRm7fuXjh7TfgysSZQFkbHSsMODdO23vud
 GuOmXwGDSdsdCprgLiivaq8U3L43EG9ThW0m6mGPx7NrGB7ftv+Qkvo+4XFeg2OuQzZq
 B8CWtfE7uA9gFIScqa2DitCUm729SBlWPEnSZa9t92jtR4CGzW0h1NCoSzPU/oyD53W9
 Ntlw==
X-Gm-Message-State: AOAM531TW7NI7FsGZw/Vf3KInUuW3fyGbARM30IyIobKdZ9MpUrqaHjW
 tCiV4u3KkEAl02ucdeh4XcE=
X-Google-Smtp-Source: ABdhPJwvPvvYGWDQK30yeTZIw1qeHF3chb1y8K+jA8blsriDhstCDWKpikJ8sYoD29847pcsHJDf7A==
X-Received: by 2002:a17:906:8d8:b0:6d2:131d:be51 with SMTP id
 o24-20020a17090608d800b006d2131dbe51mr20165153eje.564.1647857326974; 
 Mon, 21 Mar 2022 03:08:46 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 b11-20020a170906728b00b006df8494d384sm6372593ejl.122.2022.03.21.03.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 03:08:46 -0700 (PDT)
Message-ID: <766931c9-6647-19c5-24d8-9b8fb3ab58d6@kernel.org>
Date: Mon, 21 Mar 2022 11:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 7/9] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro MFD driver
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-8-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321081355.6802-8-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21/03/2022 09:13, Quan Nguyen wrote:
> Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
> hardware reference platform with Ampere's Altra Processor family.
> 
> The SMpro co-processor on Ampere Altra processor family is to monitor
> and report various data included hwmon-related info, RAS errors, and
> other miscellaneous information.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v7:
>   + None
> 
> Changes in v6:
>   + None
> 
>  .../devicetree/bindings/mfd/ampere,smpro.yaml | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> new file mode 100644
> index 000000000000..c29d975c1bc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> @@ -0,0 +1,48 @@
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

Why do you need address/size cells? Is the binding not complete? The
commit description does not mention such case.



Best regards,
Krzysztof
