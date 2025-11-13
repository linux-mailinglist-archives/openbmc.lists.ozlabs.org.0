Return-Path: <openbmc+bounces-877-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89148C56248
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 09:00:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6XlC5PGLz2yvZ;
	Thu, 13 Nov 2025 19:00:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763020855;
	cv=none; b=HKPpIpMNIpajbFu6Sy9Ke2RQDohAEY/Aw/0lmGWUjVtjDbTRUOEpJXYRiBvGXvItn1mZPkoQpaSNgZg2l9VhE5wJIS8Ny4J0gyGWE5hQXzgoPt7vEnIFkZ0NteyJX879zTyURyI7yGOIKHIzEe9dD0brre6Wj6Cyr+fAe9hsbfebIxeFpmlPj6vhp3ElnLvT51bthEwBgec6hKzlpN5ZWsuUdIxyLk/LPuRBSU96TM7MvrRW0wx8a4sjx4DMDhykWkIBLni4I8EGw/xUmdTsDC6F9JUqmjPiarflZXYlBlxvFbdYSxzlRwJoNev+nhbHB/RANr+1qm0rdJQAW8sgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763020855; c=relaxed/relaxed;
	bh=OGzk/NRGfq8NtTrbMxnWq8fnT7IBrxgexYVyf86wUgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEXQstXqfyZ2MVqWqEhwh2UAUuVVqhqJj0Xo0dKmpUsoEzbV4V0An3yZn26hut+fr0Jl6ghLw32z3j8RUckXTNt8+v35MXaj7w+udPG2EER+KTUyPGRgpqaXE6hfPcuO3yao24Zhfh+tU2xGEtjGzXkr2J8biZSwAhVQO4PzmNqXvCtXvdNkGCg14tFxXxQVb9PdHUqKgVcbzwpgvVuaqVGXOkc+HxnSOdYhXnC2hblwuIC+a/oql+vwKkwxsCBsEtwXbgi6tdsAiRKBP+q3pyQfda6LQ24S+ZeZTRRgVM9oOncn9rzZVwdPjsZnSdmdDiZ3njlSg4EEHLpnt0rMDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MvngG+gP; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MvngG+gP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6XlB5hdwz2yjq;
	Thu, 13 Nov 2025 19:00:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0058644050;
	Thu, 13 Nov 2025 08:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D933C4CEF8;
	Thu, 13 Nov 2025 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763020851;
	bh=WmqkW3UkMPxJ2hqmmHl3aY1fYJJukh2KzhzojgxvCVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvngG+gP69SHM63Z5iI4/xBcHcRs5CX3CfTI4J8cHRSjueLzf1e79gBMCBFR16cDe
	 pW0tfxhuQ9L76KNMppP5d6rV1Vl5AjD1q2qhwkSoLbHEqj6OC3R27NLlZEqXJzyV0X
	 yc4nRv7c4ySqJKX4+z/EVNbxvMlPHMZerq8edYClXV1ka6zr7npFiBQWJGaIFmGiQr
	 YK62ZoCZu9cXjNk6cUzPSKAUh9nJQ65kNcp7PgOslvJDq0oYMKh5nYXJLizxnxrhxH
	 5Wk1hoq7bTIePtEoeYN6Mzy1J0YbKpIN9KOo+ZMScmRR2K9DYCkXrpPZDYPrHpDscU
	 VF5xF+BI5UbOg==
Date: Thu, 13 Nov 2025 09:00:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: bmc-sw@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v22 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251113-waxbill-of-awesome-fame-8a84d1@kuoka>
References: <20251112085649.1903631-1-ryan_chen@aspeedtech.com>
 <20251112085649.1903631-2-ryan_chen@aspeedtech.com>
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
In-Reply-To: <20251112085649.1903631-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 04:56:46PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register
> map and Separate control/target register sets, unlike the mixed
> layout used in AST2400/AST2500.
> 
> In addition, at new AST2600 configuration registers and transfer
> modes require new DT properties, which are incompatible with
> existing bindings. Therefore, this creates a dedicated binding
> file for AST2600 to properly describe these new hardware
> capabilities.
> 
> A subsequent change will modify this new binding to properly
> describe the AST2600 hardware.
> 
> The example section updated to reflect the actual AST2600 SoC
> register layout and interrupt configuration.
> Reference: aspeed-g6.dtsi (lines 885-897)
> 
> -I2C bus and buffeset address offsets
>  - AST2600 I2C controller register base starts from 0x80, and the
>    buffer region is located at 0xc00, as defined in AST2600 SOC
>    register map.
> 
> -Interrupt configuration
>  - AST2600 U2C controller are connected to ARM GIC interrupt
>    controller rather than the legacy internal interrupt controller.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 67 +++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..e6ed84c53639
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      The first region covers the controller registers.
> +      The optional second region covers the controller's buffer space.

1. List the items instead. We discussed this already and this had
correct format in the past and now it is getting to some odd style. Why?

2. How region can be optional? Device either has it or does not have it.
Please explain me how one, same SoC has optional IO address space? I
asked to explain WHY this is flexible.

You never replied.

NAK, we are discussing same over and over again. I am not reviewing the
rest. Go to previous versions and read the feedback again.

Best regards,
Krzysztof


