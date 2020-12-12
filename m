Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3F2D8864
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 17:48:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtYVr1YcbzDqdd
	for <lists+openbmc@lfdr.de>; Sun, 13 Dec 2020 03:48:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NB6hS8Zr; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtYT00V9dzDqd0
 for <openbmc@lists.ozlabs.org>; Sun, 13 Dec 2020 03:46:27 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id l200so13818572oig.9
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ymG4jEHUUvXvwINChPOK8vrT9NJD/wpkg/b1KPrA2ME=;
 b=NB6hS8ZrMm+6EUZA2VCLg1RxPrmeSFn05858jt6Ge8cD/q02rHb9SfK91iBUEiFAhU
 hCkmWNd5TR3PSC8J7jCfQrFIxssdMx9D2jJQKPjyoyyEMRaNMMZ7L1nJ8ewqp88ft+1d
 MoPtPW3sdk2NDI5z0HmeGgwTkMRog76ZlFkn6RObH4NUZTHQo2x1TA4l2U+sbISsGOCB
 Ho5ySzekxPBPqsiORJFyVFF3yk7rkO2N3z4k+2ObW48YbXwldmkcOlewxWddadXZZL1+
 eBhFtnxZbxr/NBorMXaUhgvOKEQhE06Q3Kv2W4FEY0dq9l75MVOJHxSD1UgtGW16j4IP
 gF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ymG4jEHUUvXvwINChPOK8vrT9NJD/wpkg/b1KPrA2ME=;
 b=ConbedgoZ5wvctp70DxfYCYx6QCIKUV35/WzYpADCfTMW/wldHp6Qdb2FY2h9dHnRx
 O27+U7RJtbmKZcEyJZfgeJEZn8SO1vxEyc3t+xDL8O7DK8yd4WFHrd/EXadHQJoja5rj
 l2fa4AtvEh3eYzd9eOc7eccejwylfdfHlFoSDPjFJKEiwGUS807TIdgXeAYDBqGE5S8U
 Ff7O+t5Gd9DdPufgU+l7LA39wc38NEcE6ZMBruN5Y+KTbJIEwO/uc2nL5hU3NkjGW658
 LhdWvd9znLTVw+W9uG7csQVZwsJVQSPGwiow14E+tlPZHqESpXTOYJc5e+Ka6d94vrFe
 ubaQ==
X-Gm-Message-State: AOAM533E/tn2mHGjuGgBNb0ReyMpOxRxEwJ0Om+yEaqykuumFBNtrL6i
 C6O0bdB0nF2w0/sy9AadhbQ=
X-Google-Smtp-Source: ABdhPJzY4CcqiSHA/j8rLYR6wVjUUREvl9Yx2emWlvX3UmOLenWAz5r/ylh7hyu/TImUaFeCCcAaPg==
X-Received: by 2002:a05:6808:6c2:: with SMTP id
 m2mr13131024oih.123.1607791584720; 
 Sat, 12 Dec 2020 08:46:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c18sm2733642oib.31.2020.12.12.08.46.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 12 Dec 2020 08:46:24 -0800 (PST)
Date: Sat, 12 Dec 2020 08:46:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v5 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
Message-ID: <20201212164623.GA29335@roeck-us.net>
References: <20201211215427.3281681-1-kunyi@google.com>
 <20201211215427.3281681-4-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211215427.3281681-4-kunyi@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, supreeth.venkatesh@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 01:54:27PM -0800, Kun Yi wrote:
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Applied, after fixing the subject line.
I also added Rob's Reviewed-by: tag from v2.

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
