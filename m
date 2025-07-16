Return-Path: <openbmc+bounces-358-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B7B07069
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 10:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhpxt1b17z3bVW;
	Wed, 16 Jul 2025 18:24:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752654274;
	cv=none; b=OvnF+K1A3462Hrs4vJc8d/ybyQAEIVoH3Qp/3Ou8a+sg+HTUNqw1J8coGlyXA+kbQbDSK8ej9NBTbz92S5xZ9t/ocUPYdnqZgHnl+gmkqBpyPrHDWEyWW+V+E+BoRMBYZcBOWtwHMBSc2/oVQMrdzW4ZkdKbNAONbLDirHw+4J9s3RZG0N72qHPRaKoe+XvNXQKOsITgw82uuDV6jO2BG4/8o5NU9SEv6L1VN/AEBFyH8fYFMBKEkRcoakSxcMMLABSJWMU6g/UOouGRyFuMwsF4APmGLl4CfNf1Z+XS1UsnKAJH84zPDj3R7p0qkqJe24WM5VYlGv7352GRu0HF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752654274; c=relaxed/relaxed;
	bh=dBYw5oog6yO0VQIk58vTdpBz6vwF0hjlDU5vofNWgIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKePGBwX6PgDH5rCByPhdhHyncAQLTs88v6XPx5gV7S0a3nVk58H6rpiWyfWdG34LTcPww5hBSvdJPgn5KWiW7IjLXdp1HuirLmaSyX0miY00UuFGBOgtttVTo0eb7IIkEyvv6gtDekSI0ElJN+q6ZP9o8SWt31sxbeyNGMHsHbZstBDBLAmYmNao+9YY5ySBigQkJCOSvzuuLyv3G3ztYAa+aQrW+omhO27e0RWeqKO3haPyeJW8QV7kqcD3oVJRPk8cPwTwiZacVP/6N9i9PpdA2V0a8onEdjNXmYCqlVxdB3gOWvmHCKp97ELf80TAb46nIgSeKN9I7AnIjIOKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iiu//ig0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iiu//ig0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhpxs0dwVz2ySY;
	Wed, 16 Jul 2025 18:24:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 846F943FF3;
	Wed, 16 Jul 2025 08:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFDEC4CEF0;
	Wed, 16 Jul 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654270;
	bh=Sx6GtXQhUUHM3FrpmZ+GaCxjq7UxqdGBPOXm9TRFxoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iiu//ig0tvsYWLj3RYhibc9P+zvAzAbb29UT0vX3qk8p/xgxwKLdf3zW7fwGYc1Oj
	 AjEzWR0K269SObv38lNZWA5KeWYZ/Wv1szxIR7/2VkY64vkA3AXs+op48eVXtKkXCr
	 Rf5f2m7eVMdB4efgBFeU+ydDBGGB2kkZEilBlSb36zDBslg2cOU5mprxqHxhCXPSWL
	 jCOs/zzWzvSsfcyHaG7AJwtVPbQpy1VuNCV7y5zNqCOAD0y7XMJ4N6DUDGoa0eMaT6
	 N1ZW3ORoGmddFRSF1oL2BQu0Y2TrfHglL1GyLHzrmTcSLym1gc186GnN1KeSWs2wNt
	 87f12ZxVIRozQ==
Date: Wed, 16 Jul 2025 10:24:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe
 Config support
Message-ID: <20250716-wine-partridge-of-wonder-af10a6@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 11:43:11AM +0800, Jacky Chou wrote:
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description: |

Drop |

> +  The ASPEED PCIe configuration syscon block provides a set of registers shared
> +  by multiple PCIe-related devices within the SoC. This node represents the
> +  common configuration space that allows these devices to coordinate and manage
> +  shared PCIe settings, including address mapping, control, and status
> +  registers. The syscon interface enables for various PCIe devices to access
> +  and modify these shared registers in a consistent and centralized manner.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,pcie-cfg

NAK, see writing bindings. You already received comments about generic
compatible in the past.

Best regards,
Krzysztof


