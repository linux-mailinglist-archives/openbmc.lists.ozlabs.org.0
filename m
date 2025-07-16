Return-Path: <openbmc+bounces-360-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15096B07081
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 10:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhq1t5gTFz3bh0;
	Wed, 16 Jul 2025 18:28:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752654482;
	cv=none; b=Glo43JvAyz2DV42V29bD9I/GiMj5W39qNFy6Cm2LTMH0jtTLBCgcmea00kJvrf11MWFsYs/Zw4UC4DCjhW6IhAnuD/XSpoIge0jLzQEQmFm9HkmRuqUMW2euTG9tQDNsfn5xAspqtwGHf8NW7ypA1u+uZZXlgqDKYDB54z22lyyU2HPOLF6RoP1a8BU8yWzD7Q7mlyer14qpEk+z4LGVg9hL3ATuUS54KMItje5SDBNBQ0DLuyMYIYVzhvoUtye7husu44q6UcUDWR6GgCTIJj3KxMRPWBIPSwEpByMTqGQFWtpJ7YcCPunb+tXAGAEIjcE4kc62f+qMgWWzs36DZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752654482; c=relaxed/relaxed;
	bh=0/W2VNJ7Z270wnanJbkwMOnat+PSp1Se1ASZo6lM7wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrfRuS4q4xXP2mmuaR1EwRp8M8RZNj2gQSXIhqmRivqW5RcmQFW5jB87JJyY8M5wlW7c4Aj2tQoaJ0vayigILGDWg0NYzuOCA9NmW8kyixdRK/f7LBfr0g1xst5vVlIXxI9W/8MzO7PNq0oO+IbT0vfjWLk9fGrP/lRMLUZgTnZJEB2y0EXNdzB95LDqwnKrQIAop+TQkXz2VfOenGvEjWhdsc1fpyH4jXYpU3PyQZfbbfQ19J7ey8BIPa4Z/VtkoreGt2jhkjLDyruiQEC6jYatMnEU4l/z4yjRTZW8nvHCqwW72NORwbDlIPMAwgE6F4GYdve7GJjPsqwpRZaHXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hAsqApLd; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hAsqApLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhq1t0QKLz30VV;
	Wed, 16 Jul 2025 18:28:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1E16115E;
	Wed, 16 Jul 2025 08:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C2CC4CEF6;
	Wed, 16 Jul 2025 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654479;
	bh=AuNQsZ23rKXcpc01jPxb/MFPAjRIiFTOghWtUQwr16M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAsqApLd7YMtfpyh7q9HBWLtpv59a+BdExG5ZbkY1W4xOPV2fgVn9Nnwmnh4o7VCh
	 wPurbQEYAmtPOoq/q0MzcifYKKUL4O7GC5HGXwSOrxAL66QQtsdM2iFdT2LB067sO3
	 jXO5zitGSt+jlv9t61SLlmqTGIbjQGjBMYdkLRhiR77iHuawbsKrRIOyCB2h4HwtnJ
	 C971yf7A03FuFngrET2q6LV/rG+uJ3AIBeoVsXtEgu73cdDexNVsl45vsyvY1cm1Cx
	 1hOETZh0jp4qnoKgGPnhlDVHT0yKDI8YTB3aqvLXIe1ULwV8jeygwnLlEB3PRFLDg2
	 adhk41lQTL0VQ==
Date: Wed, 16 Jul 2025 10:27:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 Add PCIe RC PERST# group
Message-ID: <20250716-provocative-worm-of-gallantry-3797f8@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-5-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-5-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 11:43:14AM +0800, Jacky Chou wrote:
> Add PCIe PERST# group to support for PCIe RC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> index 80974c46f3ef..5d7fbb1c72b7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> @@ -254,6 +254,7 @@ additionalProperties:
>          - WDTRST2
>          - WDTRST3
>          - WDTRST4
> +        - PCIERC1

What feedback Aspeed received about ordering lists? More than once?

Best regards,
Krzysztof


