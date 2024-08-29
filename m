Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E7963DCA
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 09:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvYVp5NHpz30WD
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 17:55:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724918143;
	cv=none; b=cNAi7kOxumfuWnAVBkGehLNOMfSkvTyksbJ0Fcw4libMMS9PiGFYIKUC3JcGuy0OWr+W9UPdivAzyzpbWt9loEN9q7tk5dbjNQ1sUXFWbys+onL9P+jD0TXwg7j7jv1MzgqqjdjPMcQFuDmXhuG0k3r0i4bIOScSbB0te8DwQmxnrPG/E2YHoIt633932rV011lqkpBviAenW27ws7v4Kx5/m9Egf/9HZt6292gYfmH3ZU9Hii+aM+lIFQRVOxlbTvkqwpemiV544oSrVJZDFkryqtMrhnQ8dCXwqiX0wSjMCNPyBgHgEu+ztdCawNIbUH9vE5UE7Pe4BscASAGsow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724918143; c=relaxed/relaxed;
	bh=pvAeXM7K5Qqn25SzkYIHfirqQIehtXnvX8OG92iEb0w=;
	h=Received:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=dIjNLF2rmgnk2Azb8TqBmJ5IrANOgwXi2X0vlAvuQn0hXJYRpm7856HJKw4GCsSAQ/Hce0RoTuO6/EQbDTD52aEUZMSPVLQZjH5ZnOdgSJFxe6pM1zSwVJFH9fNImAR5VG3NxTnzcjjpMz0H+IFHL2eKoKDcaATNVdoyQpOBnDZeZT3vCHZ0cM2NjACn6Nylszwjd3y/oDzZdXa3nicM9DCAwx+VOxSV4E1qdz52uB3bNLCI6ww/FLZGphtB7qv3bzTDep4F1U3HDTy8gVL6Dnm50BfHSjKWMokSX8BomnjAT5hfueRSs9tp2nCOKbYMBbSYi4Z/GJnkbrmK1+hi0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OciKxiMe; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OciKxiMe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvYVl1Qw5z2ysf;
	Thu, 29 Aug 2024 17:55:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51822A41B61;
	Thu, 29 Aug 2024 07:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22735C4CEC1;
	Thu, 29 Aug 2024 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724918138;
	bh=gfwdGkshrn41f6ZPGzSwIbOrEfaOncX7XjVktdIoKMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OciKxiMeWeucX59OyqP9P1woa59CF909KQAk9RW4bWF437Xo5fk36WARTd9cWfkSs
	 Q1/nYuTsdjijVVRQd4vCuD7cRbt0zplTslUD25VUBtPrUSYDd1j1c+ok0k7X/AmFG6
	 CM81Oqh8JAsugp79kv04NeAr4vWe3wHZQ/BdAh7/d3cFlT+30xmB09Jg1jA+FnKApe
	 MwWL5V6/WbQd5kBjhKtTSLYbbNJCmlMZW5ev5UWdPyLcsssQxliGw/8xOgxDturACN
	 rR2+R4Tve7AjmG83nBDKLa3ZfXyZdvGuNlZoFFtDY3sjOf3FXzAFX90tKqiGBedjUj
	 R2fq25LQsCG5A==
Message-ID: <8ce757a9-ea4c-4dd2-8aaa-e04f21eb3f63@kernel.org>
Date: Thu, 29 Aug 2024 09:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
To: Jammy Huang <jammy_huang@aspeedtech.com>, robh@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, mchehab@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, hverkuil@xs4all.nl, pmenzel@molgen.mpg.de,
 krzk+dt@kernel.org
References: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
 <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/08/2024 08:45, Jammy Huang wrote:
> Convert the ASPEED SoCs video txt bindings to dt-schema.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 78 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  2 files changed, 78 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt

Fix the paths in kernel (git grep).

...

> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  memory-region:
> +    description: |
> +      Phandle to a memory region to allocate from, as defined in
> +      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

Useless description, completely redundant. Please say something useful
about this particular memory region and its usage.

Missing maxItems.

> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the scu node that is needed if video wants to capture
> +      from sources other than Host VGA.
> +
> +  aspeed,gfx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the Soc Display(gfx) node that needs to be queried to get
> +      related information if video wants to use gfx as capture source.

These two were not in the binding. Mention in the commit msg any changes
from pure conversion with rationale WHY you are changing the binding.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
Best regards,
Krzysztof

