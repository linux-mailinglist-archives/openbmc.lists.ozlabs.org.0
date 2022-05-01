Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A15168B0
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 00:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ks1Lx2Gm3z2yZd
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 08:37:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRJ3Ud1Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NRJ3Ud1Z; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Krg6n4yqgz2x9v
 for <openbmc@lists.ozlabs.org>; Sun,  1 May 2022 18:55:43 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id y21so13575746edo.2
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2022 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9Q4D7i4GL8KP5hpGHA7/56lmG9H5Z77KSqaGV3uZPeM=;
 b=NRJ3Ud1Z3YxwLrFLtiUGSHKmaQQ/gEWMH1cpmTU5i/RMSE/lYjldRIEJfnx80xzGwF
 nB76PATx5V0L7aI82BrU+nvAqKp6dzYp6rwMKLigl1qoE1/aXy7GJSSypGa531b5On+N
 5raduwLXLRuYiPE2pwiFe3kB4NMa2pB1GxJcsPELuxbxAreDlahDphEKPIKGikeAwZ08
 uQKSsFe/dIr0c6xTCn4up4K1mAAGxLL1P4dJPRWtzAiKMLL/t52qk4yfYuponzXYK3Da
 nG41j1svssmDZ1WcSHXBsXzmDlC3ihEYTADFOTpAcG901AZmeXkdSkf0JZ+Z3A+vUyj3
 DH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Q4D7i4GL8KP5hpGHA7/56lmG9H5Z77KSqaGV3uZPeM=;
 b=4yaOt8WZtaj/W8aN+0+mPIWRYoQl8hsUsojngP0Zi0f0ba1E2ZrhllyTDWRwVJAkQG
 LO6LL+HgU4teLw8HUqlqzpt8PMwyzGiEGMFcfZ5EvQ1/pOMu/GV2y0cXfdsduVIbojp8
 wg6eX1PosBQSJi9RiLJdlzqIQ876hEOFQVjCndsmadWdDCRXRUEgjyv3xXDmxGjKWrkN
 rwGPzl3FJq8ng9Jp2rhul2Q1FXqdUZkY12t0RqaYuwhCeF77iOakLn9IJo1JGRWnT2nz
 NyP8oZKpfJHN7eAXFxuZuQULWEQjuEAf/WeqqKMEVHj1h0XwlJyP9aRLBQuEbU6lIK9K
 NouA==
X-Gm-Message-State: AOAM531/oy/Cm93ywyF1g3hbAOqH4Oid2js8Q95RzFwQVbl+IVK2uDs+
 DdbNx3zeWZJHlq52TfjYUTqTdw==
X-Google-Smtp-Source: ABdhPJzRoUbN7p6a+QsrfdXpuNxUvP73pFrp/NOoq9oxKzcPe6GgKQtTMh5zIkfqEiGB5tCEKhuhTQ==
X-Received: by 2002:a05:6402:288a:b0:425:c5b2:59d9 with SMTP id
 eg10-20020a056402288a00b00425c5b259d9mr7923496edb.412.1651395338995; 
 Sun, 01 May 2022 01:55:38 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv49-20020a1709072bf100b006f3ef214e35sm2374240ejc.155.2022.05.01.01.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 01:55:38 -0700 (PDT)
Message-ID: <3c2f2e75-153b-05bf-9878-70fc1c1a81b1@linaro.org>
Date: Sun, 1 May 2022 10:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
 <20220429172030.398011-5-j.neuschaefer@gmx.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429172030.398011-5-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 May 2022 08:36:31 +1000
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/04/2022 19:20, Jonathan Neuschäfer wrote:
> The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> Add a devicetree binding for it, as well as definitions for the bit
> numbers used by it.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - Various improvements, suggested by Krzysztof Kozlowski
> 
> v1:
> - https://lore.kernel.org/lkml/20220422183012.444674-5-j.neuschaefer@gmx.net/
> ---
>  .../bindings/clock/nuvoton,wpcm450-clk.yaml   | 66 ++++++++++++++++++
>  .../dt-bindings/clock/nuvoton,wpcm450-clk.h   | 67 +++++++++++++++++++
>  2 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
>  create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
> new file mode 100644
> index 0000000000000..3ed3e40e39637
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nuvoton,wpcm450-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton WPCM450 clock controller
> +
> +maintainers:
> +  - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> +
> +description:
> +  The clock controller of the Nuvoton WPCM450 SoC supplies clocks and resets to
> +  the rest of the chip.
> +
> +properties:
> +  compatible:
> +    const: nuvoton,wpcm450-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference clock oscillator (should be 48 MHz)
> +
> +  clock-names:
> +    items:
> +      - const: refclk

Sorry for not bringing it up earlier - this should be just "ref". Names
in values should not have suffixes (so no "tx-dma", "wake-gpio",
"ref-clk" etc).

Best regards,
Krzysztof
