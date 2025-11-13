Return-Path: <openbmc+bounces-878-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C19C565C6
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 09:51:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Yt16pyjz2yvX;
	Thu, 13 Nov 2025 19:51:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763023913;
	cv=none; b=LQ+U39fZX/aOi2vP0FEYZb5NaYNYEhLGRp9sCJ33uA7PGvOcG1bJgVlo5Et/kJprja1eqgt4vS/cowNz2g1q/5N5FQcVyc9UZqGz9yUtHxo1ICgf3G+kuVKm/1vFIkVFNv1/iPkKwcmDRVgBeL8LWwsaNl4Uqye5vmwKfio6qnJ6vrBdCCnZsQjdv2fhMRgR2OP/e2mKxZqnRHvfvlvsZ5K5Wp+kHHi5RIO/+NU+VLlRiSgW9uZcCb7kxbLLgzLsUNxXIcp1EpJh8aAWhx/e0lN0YHRQYZzMsktqK80352YxzO6SgtesJyZ+dnmxxBXSANaBnjd+ISKUfvvFcuJiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763023913; c=relaxed/relaxed;
	bh=2egg647O9hnq8APmAfG9jZBlSAZbjxRzQoJpaVNzZKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwcKAujAAbkQOpXB6pk1pwJ51t/NeNZSj0Gi8sQKRJKmWAPzoNdWswhy4rdPPcwilRdAgB+GWJLUwZd69dvojCz9n7MVaPQ4mnDjybYhQM86Brt3ZZQb4gqx+tGuLzd/yZpeQf9xqfW7Vac2onF/ie/eB1oaMUjzYz1pIuCtlAUV2UqnC63g479Xa8oUvYrkZnNHItAY6nXrJ+hCbw7+ixeSkqQrmIo84g+XX7NsTX6SzGkpUrKbWi1h+38FJ8VO9C4IOLZIV5l9ttfgmuZy12bYM4gF2JC4b1M0hQydojviccPBBT3v0m5L6FiDXadIdDbRTd7+zAfHaYOJ+fogqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdjP1K45; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdjP1K45;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Yt10Nwpz2yvW
	for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 19:51:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AEAA601BB;
	Thu, 13 Nov 2025 08:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F8AC19421;
	Thu, 13 Nov 2025 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763023909;
	bh=H63NxSppjTvEdhpkW2ZiNbrZQD1ZYTG2LKogPmLbgA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdjP1K45hZnYy5oVOE7A7c4o4krZZYGjqaYWY8PAj7tKXA73VCTJii4c+ikFsxoil
	 H1m9eBcwkj/V9dePKQS6i+KgP13IhewOOY3uNjOqH/M7gtD/ygVI3TRB6b9d/XgKE4
	 u+T55S8TQXTIoWU8dritCJRc6Ycj60zno7dVcavHtSH1CD6tVcm0Zqb2JeQnQbkwKk
	 YT6IVtZQOzteb88pZBu0iGtWRZUIHN/EYseP9zRTBFY2hVFxEyZVZcipF3/X2KKnZO
	 7oEMIqqMyAGWSlf2WdEYFL3KIBAA4nYqgWokYotdyl+3uYPFi6tCq15ZRewai4TqG+
	 ofR6CRrHk/lng==
Date: Thu, 13 Nov 2025 09:51:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	broonie@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT
 schema
Message-ID: <20251113-loose-seahorse-of-endeavor-5d216e@kuoka>
References: <20251112173314.1751671-1-tmaimon77@gmail.com>
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
In-Reply-To: <20251112173314.1751671-1-tmaimon77@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 07:33:14PM +0200, Tomer Maimon wrote:
> +  The NPCM7XX supports three FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU3 supports four chip selects.
> +
> +  The NPCM8XX supports four FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU1 and FIU3 support four chip selects.
> +
> +  Alias convention:
> +    The '/aliases' node should define:
> +      For NPCM7xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux;
> +      For NPCM8xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux; fiu3=&fiu1;
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-fiu # Poleg NPCM7XX
> +      - nuvoton,npcm845-fiu # Arbel NPCM8XX
> +
> +  reg:
> +    minItems: 1

It wasn't flexible in the original binding. Your DTS being absolute mess
and defining one 'reg' entry but two 'reg-names' (!!!) does not help at
all.

Anyway, address space is rarely optional, so I have doubts you would
have proper justification for this change.

> +    items:
> +      - description: FIU registers
> +      - description: Memory-mapped flash contents (optional)
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: control
> +      - const: memory
> +
> +  interrupts:

Wasn't in the old binding. I asked last time - you need to explain each
changen done to the binding from pure conversion.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  nuvoton,spix-mode:
> +    type: boolean
> +    description: Enable SPIX mode for an expansion bus to an ASIC or CPLD.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    fiu3: spi@c0000000 {

Drop unused label.

> +        compatible = "nuvoton,npcm750-fiu";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0xfb000000 0x1000>,
> +              <0x80000000 0x10000000>;

Keep reg as the second property, followed by reg-names.

> +        reg-names = "control", "memory";
> +        clocks = <&clk NPCM7XX_CLK_AHB>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&spi3_pins>;

Best regards,
Krzysztof


