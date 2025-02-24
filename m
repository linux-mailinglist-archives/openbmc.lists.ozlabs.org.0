Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA69A4186B
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:11:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ZjJ6KZ3z3c3n
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 20:11:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740388273;
	cv=none; b=m0bV9ZkLKzZGX37s1TzEy4Cf88HnFnKIHFfjNSglasUURt02Y6XfIaHb73E7zhEu5328xbQqALMlKfgCyDcjRx9DmEFEzZVOsUOFsChbdQKr/Olt4V0bpCdyiFYcbQpTwvRlQrlCZdae00tRhCGHf3D93AeMVbvXAgxYB0mLtekTeEB92HHLhsQpG4epcdAdqenR9X/zw/mndD0tagSifqwJjOTzMOXQ/YWvQdCBmwF56u3lIzXOLCE2d39Yhc4Av99V/XgvsSCqxkjeh+VetelZ712CRjCdTRF2M2lx4/xGfnSBQgptYuFLBlWhAWPPsAoyAinlEFlHV/GkBEXYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740388273; c=relaxed/relaxed;
	bh=Jm/8ruoAO9qULThvArgpJHnnXXQmdGEmsF1uURgFquw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpPPNIC+AJyzwbyjmoGHewemzAjCaeFD2XqmduSXmP/bE0oNZc+oQeoM/nJxPgIwWgnaVYXRVgspwXB6TxAv1Dy/MM4oVjueEvX1r09z8QZTOrc2iuja1HRJ1NMmeOoaCKTsSELSn6wNHrVBpiimAPUXHzAc7R9Ke/7LM30ydOgzQRCz6gzYowW7uWHrWfGFImN7Xyl3L2CWKlJkh10wmFT6mhYE5EYOsDvxb9nOxFepPrH2UHBJPk4kPvvNRYy9DfSiaB5tigsTFj2UBA66g5WbxKcTx9p5anxVySgG+wTUHksOQ3YQOOaPej+UZSWmSr6deejnycbkY3OST7QRHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVDyb9A6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVDyb9A6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1Zj95zWBz2yXs;
	Mon, 24 Feb 2025 20:11:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B895A61183;
	Mon, 24 Feb 2025 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571D5C4CED6;
	Mon, 24 Feb 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740388264;
	bh=paqcVaN+9js9H2BBnIzPb/KQmMraUhcTcdEAOrrYxGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVDyb9A6iSFEZR+LjdELpEgVGyTrHax22CwW4kimVb/iLXTObfEsv95EuplSKgtBc
	 5oUowBkfia/PWtbiRSow61VRZSQVmbFYD6RuAi+aQDfk5QP5t3a5vTE1HHtVr+B9CK
	 myk1UQDUe+goU/zFwEjgPNeMwTMX64NNYwl34jsmeunRzgU+oexHDv6r+OlHpWtxyt
	 TzfKctNBcaeHe1aHUHgRjNE+k5yxN2tN4eH9gAfY5kzqN7cN0P4vy0gQFGtG/5nylJ
	 p1CFFYYDurj9gQex5jiwi5Ba5lGwPbayQsy2BFTfJ4wzexIHkq5cC4FjIqPAZZz+Rd
	 260/jfeD3TjfQ==
Date: Mon, 24 Feb 2025 10:11:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, andriy.shevchenko@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2025 at 01:59:34PM +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..356033d18f90 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,12 +44,60 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
>  
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus

Except that this wasn't ever tested...

Don't duplicate properties. i2c-controller schema has it already.

> +
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
> +      single DMA engine. DTS files can specify the data transfer mode to/from
> +      the device, either DMA or programmed I/O. However, hardware limitations

so what is byte mode?

> +      may require a DTS to manually allocate which controller can use DMA mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,enable-byte:
> +    type: boolean
> +    description: |
> +      I2C bus enable byte mode transfer.

No, either this is expressed as lack of dma mode property or if you have
three modes, then rather some enum (aspeed,transfer-mode ?)



> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.

For what? Same question as usual: do not repeat property name, but say
what is this used for and what exactly it points to.

s/i2c/I2C/ but then what is "I2C global register node"? This is how you
call your device in datasheet?


> +
>  required:
>    - reg
>    - compatible
>    - clocks
>    - resets
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2

NAK, undocumented compatible.

> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2


Best regards,
Krzysztof

