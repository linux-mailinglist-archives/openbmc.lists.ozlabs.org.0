Return-Path: <openbmc+bounces-457-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57AB2719F
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 00:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c30M454Z5z2xS2;
	Fri, 15 Aug 2025 08:30:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755210656;
	cv=none; b=YYPI473tluVj3wBu8ydWE9J2FGowv+xmCE0Z0U3W3imKf0yBYVeemOVA5q2Cr2W8+xVA9s7qDFpAJxo8O8azBaeXgc4xHM/RcFREP2+IOer+DhgPYp6OJuLUstDn2PDTkGE9Q/pCIjaPX06IiKHz4uXyNO9xNd8Q+gCRyfVssMYe9IyxyAXU97usOXrkmOFW/bQ1gMPIKOwAwF0+BqxaoZmwrNg2Dwu1ODgdQ2PnQSRNnbdKp9kldB72jNps23VDFsYh6AMH/S+UNjfBb5szRlOMcSpCe615HWXi1LeE69JpOO+RQGv15OTOB2Ok9vEeuSkb8Z7Yynwnd6qRZrb0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755210656; c=relaxed/relaxed;
	bh=vIFp7ebVwT9oleEhOGII0IqB6tGpNR9cpd6TYV5Jql0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0A0AJyXv8fXswooOOS6t2Z37m2tWUHvt1A3IwADeQpsBHZEFWTZopaUN8AEaOq/ZpMUWmtGwhjjb9sz0Z/nfJXesOs/pCk3V+0azzbmSdhA9RSyhYaRV65MtADsYx67Gb1xoA3v6BfA2IieEjFc99wc/HNiKHY5oxAecRneFxbsvFNQzFaNKfeBr42wjv0pXQ5eZG+YfqWQKvRu1Nj0gJ3mXJIuzlEJT5DIjeVoTVdc4VfsNuZM6qvfR6Bqlr4/2gBLxIgcnGAjZBKFO9KXtJ9pjK3l7pWOhQo6TImQZZZJ9nu/xqscrPEFSoObO70ZM7AsNdbiJFEFNIHJa8szwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8NZu8Q2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8NZu8Q2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c30M36WcVz2xQ6;
	Fri, 15 Aug 2025 08:30:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D4D945C0A;
	Thu, 14 Aug 2025 22:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FBC4CEED;
	Thu, 14 Aug 2025 22:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210653;
	bh=N5VWGitysz6JFmoe9n2FhghAKkO8HINQCHJY2U2kRIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8NZu8Q23AcSpDXYfCjfS+nijpycYbRazO8ud7muK7v/NQSmnieFRpVKZ9HpE+Se3
	 ihK/DheTyy0oiRrb1M1422BzweCx9GFLH23gWJEy8hhRFRngUNMiGhj74MtotNPhtF
	 yqrUOurUhDDUC58YxblyH88j6+KNNTcK/igm+HoklMSc/qyxQ5KQz0I5OYmUnqEyQb
	 hSHC3P59PHrQpHRwdNhYBEJf+FY2XgcEMPuuTzqg6Z4f866bnKk9VJKWj+onG9pmFj
	 gWnmU3joyDUmkrHXStOUAiu75Y3Os4fO4BMRMQVIFbAidL1DN8rkqKZOMOECpHF6et
	 Ltq0O6AyGRRpQ==
Date: Thu, 14 Aug 2025 17:30:52 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250814223052.GA4004307-robh@kernel.org>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
 <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 04:41:54PM +0800, Ryan Chen wrote:
> - Add property "aspeed,global-regs" to get phandle set global
> register, for register mode selection and clock divider control.
> - Add an optional property "aspeed,transfer-mode" to
> allow device tree to specify the desired transfer method used
> by each I2C controller instance.
> - Update example to demonstrate usage of 'aspeed,global-regs' and
> 'aspeed,transfer-mode' for AST2600 I2C controller.

All of this is evident reading the patch. Explain here why you need this 
change.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..2a9f7d1d2ea1 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,6 +44,34 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
>  
> +  aspeed,transfer-mode:
> +    description: |
> +      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
> +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
> +      share a DMA engine.
> +      Select I2C transfer mode for this controller. Supported values are:
> +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
> +                    Better performance then byte mode.

If no 'aspeed,transfer-mode' property defaults to buffer mode, you never 
need 'aspeed,transfer-mode = "buffer"'.

When would you ever use "byte" mode? Sometimes you want worse 
performance? That makes no sense.

I feel like we already discussed this, but I'm not going to dig thru 17 
versions to see.

> +        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
> +                 provides a single DMA engine shared for 16 I2C controllers,
> +                 so only a limited number of controllers can use DMA simultaneously.
> +                 Therefore, the DTS must explicitly assign which controllers are
> +                 configured to use DMA.
> +      Only one mode can be selected per controller.

The only thing that really makes sense is dma, and you need 1 boolean 
property for that. IOW, what you had on v10 which we gave reviewed-by 2+ 
years ago.

Do you have any actual test results or usecase that show DMA is useful 
here? Typical I2C xfers are not streaming large amounts of data to 
justify the setup costs of DMA. It wouldn't surprise me if DMA was 
actually slower.

> +      On AST2600, each controller supports all three modes.
> +      If not specified, buffer mode is used by default.
> +    enum:
> +      - byte
> +      - buffer
> +      - dma
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|'. Read the documentation about when it is needed or not 
needed.

> +      The phandle of i2c global register node, For control the i2c register
> +      define selection, clock divider mode selection and clock divider control.
> +
>  required:
>    - reg
>    - compatible
> @@ -66,3 +94,14 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,transfer-mode = "buffer";
> +    };
> -- 
> 2.34.1
> 

