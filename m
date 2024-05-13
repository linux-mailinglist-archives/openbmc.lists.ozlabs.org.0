Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 467398C449B
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2024 17:52:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K+xo1SsW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdPBg66sNz3cP3
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 01:52:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K+xo1SsW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdPB767z8z2yvp
	for <openbmc@lists.ozlabs.org>; Tue, 14 May 2024 01:51:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 762B760EAD;
	Mon, 13 May 2024 15:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99A7C32782;
	Mon, 13 May 2024 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715615516;
	bh=8dI/ebZzuVSd46EGsZIVX9qJ10BBglNLC/rRfmEYLmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+xo1SsWE/bSPQ0qhDZl3DvC1o7yOyMUTU4WGKMMw/FO3pnCWbrlZFDwuuSn/ixji
	 6O3XNwURKgOK0PBto6YvTInxCrvKfGp/2xLQDW+v1GAGT1xKCaq65/rwV8Uz7sTeLa
	 Vs5Dpq9IL4kJzdber7Jfw8Sac8q/QVcTlGfy6n187TxwvfueliPoI8iEU6UjKTmN46
	 4gcrFZ+OdtkjKShI5LVXWQq/kWVUSp2bDJhbLv4QW27GaeLo5MRskrNd4f4plkFS58
	 z19rNBamJbmlCiwWn/MCfEgCxSB97G08ctY6DbU9wiLPCnL1qetM+/+/nxU8YTGYZg
	 js9ynnN9rBvNQ==
Date: Mon, 13 May 2024 10:51:54 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v24 1/4] dt-bindings: reset: npcm: add clock properties
Message-ID: <20240513155154.GA2595523-robh@kernel.org>
References: <20240509192411.2432066-1-tmaimon77@gmail.com>
 <20240509192411.2432066-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509192411.2432066-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 09, 2024 at 10:24:08PM +0300, Tomer Maimon wrote:
> Adding 25MHz reference clock and clock-cell properties to NPCM reset
> document due to the registration of the npcm8xx clock auxiliary bus device
> in the NPCM reset driver
> 
> The NPCM8xx clock auxiliary bus device has been registered in the NPCM
> reset driver because the reset and the clock share the same register
> region.

auxiliary bus is a Linux concept. The reasoning for this should be the 
reset block also provides clocks.


> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/reset/nuvoton,npcm750-reset.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> index d82e65e37cc0..18db4de13098 100644
> --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> @@ -21,6 +21,13 @@ properties:
>    '#reset-cells':
>      const: 2
>  
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: specify external 25MHz referance clock.

s/referance/reference/

> +
>    nuvoton,sysgcr:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: a phandle to access GCR registers.
> @@ -39,6 +46,17 @@ required:
>    - '#reset-cells'
>    - nuvoton,sysgcr
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - nuvoton,npcm845-reset
> +then:
> +  required:
> +    - '#clock-cells'
> +    - clocks

New required properties are an ABI break. Please justify why that's okay 
for this platform in the commit message (assuming that it is).

Rob
