Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E245EFF00
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 23:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdmCW6zJCz3c6s
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 07:07:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdmCD5Ycyz30JR
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 07:07:20 +1000 (AEST)
Received: by mail-oi1-f169.google.com with SMTP id g130so2831150oia.13
        for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 14:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=u3B4AXMno9nb8iZf5zQNwk767aQTUKKU1v3oIRo2uIY=;
        b=sjjqLgYlmF7n6MkwKGgGxmoknc8BR1q01InXR3ZGEIn7qltuQjImjEiemKost89Oli
         kiE6WLA+dCs0OgXdyTSJ+3xw4jhhYu36oYyoPdjpw72nfWtl76FwRrRQfS/WRKRcUgbQ
         yp16lD2neKmkXkdpk8KkjiwLRpQWJ9einNTg4h9eRpkd5VaJVbo/useGzmC54STf7dfP
         7txFp6dH1frKj74kC7HASN/DV/lRjgxGpfTFBkkiDPg2z1PS1//cN+v26df4iSlpjzh4
         i0OMixKhpQnKVTsDuhJAnr6Yo5Bo/SXApDzD024TS2oPkPCGKAVwmtLRiqnbXZS9AAbn
         /94w==
X-Gm-Message-State: ACrzQf2JakUCVSFCNEkyqmI3GL6hFNZLsAeN2SUXvLC2NVVhgyrMVnjt
	uUvYYGpw9LXCjjCT79Zv5Q==
X-Google-Smtp-Source: AMsMyM6TwJd0hAEFLH56WIO6Yzur03lHZly+x+08QITWC4ObpNv661/Odx7T56khaPygTvhv1Bdp5w==
X-Received: by 2002:a05:6808:bd3:b0:350:e312:9abf with SMTP id o19-20020a0568080bd300b00350e3129abfmr8019360oik.78.1664485635979;
        Thu, 29 Sep 2022 14:07:15 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bx21-20020a056830601500b0065689e13f52sm165192otb.71.2022.09.29.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:07:15 -0700 (PDT)
Received: (nullmailer pid 2721310 invoked by uid 1000);
	Thu, 29 Sep 2022 21:07:14 -0000
Date: Thu, 29 Sep 2022 16:07:14 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output binding
Message-ID: <20220929210714.GA2684335-robh@kernel.org>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925220319.12572-3-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Naresh Solanki <naresh.solanki@9elements.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 25, 2022 at 03:03:18PM -0700, Zev Weiss wrote:
> This describes a power output supplied by a regulator, such as a
> power outlet on a power distribution unit (PDU).
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/regulator/regulator-output.yaml  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
> new file mode 100644
> index 000000000000..40953ec48e9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/regulator/regulator-output.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Regulator output connector
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +description: |
> +  This describes a power output connector supplied by a regulator,
> +  such as a power outlet on a power distribution unit (PDU).  The
> +  connector may be standalone or merely one channel or set of pins
> +  within a ganged physical connector carrying multiple independent
> +  power outputs.
> +
> +properties:
> +  compatible:
> +    const: regulator-output
> +
> +  vout-supply:
> +    description:
> +      Phandle of the regulator supplying the output.
> +
> +  regulator-leave-on:
> +    description: |
> +      If the regulator is enabled when software relinquishes control
> +      of it (such as when shutting down) it should be left enabled
> +      instead of being turned off.
> +    type: boolean

I'm not too sure about this one as there could be various times when 
control is relinquished. It is userspace closing its access? 
driver unbind? module unload? Does a bootloader pay attention to this?

Rob
