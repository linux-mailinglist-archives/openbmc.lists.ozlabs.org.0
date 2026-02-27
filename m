Return-Path: <openbmc+bounces-1415-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GSUKMl9DoWkirwQAu9opvQ
	(envelope-from <openbmc+bounces-1415-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 27 Feb 2026 08:10:23 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FB1B3A87
	for <lists+openbmc@lfdr.de>; Fri, 27 Feb 2026 08:10:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfbv4Yz1z2yFQ;
	Fri, 27 Feb 2026 18:10:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772176219;
	cv=none; b=Q7m0bIRJElNVE/vILy4ahEyCMSQXvmMvv/LMihzDmBkAsIEwqhjEYhJvogIHzC5wSf1Rxqeu70OFGfsBy8zrNPTRaZeRWyfyZdogOmUYzfdrsPJUEShScgALNBTv+BEwdKzLaxJ/Z/m01TA6LocOoGnq7MW0FiP4/0RDz/rKjsdGPGwTe5iw13SkWSTYyJzBOdIz28Ug/BRSlz3kbmnORGMD7Re32i6I1gsl8HOGbwNcTMdXk03jUQnkiJPSujfAQDlc6hPq+p90dJozAEPyB557/sGDfEFxRPSesfcM+ZbY12YyykUL9K3ivN1jflCUZ4pypUpTDBpjEeknp0tU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772176219; c=relaxed/relaxed;
	bh=0Vpg5MT/uJia7N5MMZ/7BXUU57HnV5goJapelioLMeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBBM4D+LYt0k1wTmeXS4ffe/kk3A6E7vq/bam/+vHrauLFn6e5uVkN6Fiti1L+sCc8kPxB1CzgmKzCzLb8ag6+Dx645yG0YwXop0z10qSMqLyBwrpgE6YP+wu4pHBEY4RrMrKlQUO70VpRi1vo1yyUy9KRODCWAkfGPMHjtbGRP/daDJ9snX6zXfw2jfhESSCpLZpfstfes8zy0I1qUWpGyern4iTcBncnrdmlz5/8WOixlpl0RRh+bX+GHsvd65ed2J22qlLeJ2Z4HWLS3xhXC0fWFCMdQWBXmZ3zGEx9HOoTead0CAvazR5ZBF/tJFr6h09Cv3dSIq2gSGp1Z0NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOqvjHTI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOqvjHTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfbt2tQYz2xKh;
	Fri, 27 Feb 2026 18:10:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB7E343BD8;
	Fri, 27 Feb 2026 07:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB63C116C6;
	Fri, 27 Feb 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176215;
	bh=93SPmf8E1jF/TUfDZS9PtOn4hN3P8OgjiQA0WaPpkyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOqvjHTIbBmGaLmKo7MKt67M5+Af+GJ86NRwN2OlqEJLzdbtTezhxOjbSjJZP+xAs
	 SOZErT7krFSIlClMQH0xvETYKDJOpapuDbdCtTZSTSWGC8nt8nqpJNkgapfjQQDACw
	 d1Lx7lLoAcgJOYBlHEMNH0OU7AKP/WTMdKXZyYZzcx0ytP6la3SlCiXC3fH9WOEbJw
	 oFi2oLFSaoUuE+grq3S68v8jO7xA6iCmPBD5ny1o2eGrcvZhBJXjb3t3YxumCGQIAg
	 CTL5f2NtnpBhwgj1RoEpk/UyD1mf0sMQWtZJ6As3q0P8c3K8caAMYahDY0HMawDNcv
	 EuQGP1TFrpOyw==
Date: Fri, 27 Feb 2026 08:10:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rayn Chen <rayn_chen@aspeedtech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v25 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20260227-fragrant-industrious-aardwark-bdb63b@quoll>
References: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
 <20260225-upstream_i2c-v25-1-9f4bdd954f3f@aspeedtech.com>
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
In-Reply-To: <20260225-upstream_i2c-v25-1-9f4bdd954f3f@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1415-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.0.0.80:email];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 230FB1B3A87
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 05:19:38PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register layout
> with separate controller and target register blocks, unlike the mixed
> register layout used by AST2400/AST2500.
> 
> To describe this properly, split out the AST2600 I2C binding into its
> own YAML file. The compatible string remains unchanged.

But you made other changes in the binding. You must list them, because
otherwise it sounds like you only SPLIT. It's not true. You actually
changed the binding in at least two places, maybe more.

> 
> The example section is updated to reflect the actual AST2600 SoC
> register layout and interrupt configuration (aspeed-g6.dtsi,
> lines 885-897):
> 
> - I2C bus and buffer register offsets
>   - AST2600 I2C controller register base starts at 0x80, and the
>     buffer region is located at 0xc00, per the AST2600 SoC register map.
> 
> - Interrupt configuration
>   - AST2600 I2C controllers are connected to the ARM GIC, not the legacy
>     internal interrupt controller.

Example is irrelevant, don't mention it. We discuss here binding.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 62 ++++++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml        |  3 +-
>  2 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..077be85137c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs

s/26XX/2600/ probably

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
> +    items:
> +      - description: controller registers
> +      - description: controller buffer space
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Desired operating frequency of the I2C bus in Hz.
> +    minimum: 500
> +    maximum: 4000000
> +    default: 100000
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Please follow DTS coding style.

Best regards,
Krzysztof


