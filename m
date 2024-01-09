Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46496828AB6
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 18:09:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oDVnUPUY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8cpl50Rlz3c3H
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 04:09:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oDVnUPUY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8cpC01cmz30RS
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 04:08:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E7F6614C5;
	Tue,  9 Jan 2024 17:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C14DC433F1;
	Tue,  9 Jan 2024 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704820112;
	bh=U4kYmlfjVvuQFaFjurJRQqErQEHZxXtOV/EVfh6l9Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDVnUPUY+hO8m/NE832mRMfIOiDiDHGGrXkRec40Pqq1ofrwJUQnQawFV8f8V+JS3
	 mCBAytHgBSMuG5jql7YA9PJ77DSEdduU3rQEv7S/y+DDfbCZQcPEbq0LV2+qcVfYPC
	 yqRHYq4X9cQ5O3W7VSP/B92++WeYMLWjA10O4oa9nZPbR56O48FLIWrgTWEzz50pC2
	 KxJden1uNhLtH861Whm9ALpE+fIFOlV136ui9EDqbBOC8TWXPLxzBFCKxbJk1I3pbX
	 KWJSgWFUTNyu6UGC/vVn/WMcd0y4nIabA/bOhfY9J5iMI9LfZivDdHabqSNCbIuM6a
	 Pbx0PV+QnlzbA==
Received: (nullmailer pid 2778514 invoked by uid 1000);
	Tue, 09 Jan 2024 17:08:30 -0000
Date: Tue, 9 Jan 2024 11:08:30 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m
 clock  property
Message-ID: <20240109170830.GA2772086-robh@kernel.org>
References: <20240108135421.684263-1-tmaimon77@gmail.com>
 <20240108135421.684263-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108135421.684263-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 08, 2024 at 03:54:14PM +0200, Tomer Maimon wrote:
> The NPCM8XX clock driver uses 25Mhz external clock, therefor adding

therefore

> refclk property.

'refclk' is not a property.

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/clock/nuvoton,npcm845-clk.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> index b901ca13cd25..0b642bfce292 100644
> --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -21,6 +21,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    items:
> +      - description: 25Mhz referance clock

reference

> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +
>    '#clock-cells':
>      const: 1
>      description:
> @@ -30,12 +38,20 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - clocks
> +  - clock-names

New required properties are an ABI break. That's fine if you explain why 
that's okay in the commit msg.


>    - '#clock-cells'
>  
>  additionalProperties: false
>  
>  examples:
>    - |
> +    refclk: refclk-25mhz {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <25000000>;
> +    }; 

Examples don't need to show providers.

> +  
>      ahb {
>          #address-cells = <2>;
>          #size-cells = <2>;
> -- 
> 2.34.1
> 
