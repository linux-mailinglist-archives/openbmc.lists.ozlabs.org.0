Return-Path: <openbmc+bounces-566-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D338B40F09
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 23:07:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGdcV1PNwz307q;
	Wed,  3 Sep 2025 07:07:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756847274;
	cv=none; b=VklOgFbhHdsRGGPYkXvhSc3I33q0BBt9xNb72nOc6o8epRYDZMGkqfK0gvFgCiJoOCFkQiu+QJIIZiurrVgDYlf8twKAuYfCIfZnUmBxYI12LtfQBU4BNWE9oe7xNWlrp5VFYO+168Y+eS/hJN8kHkqWKKMjO4aXl78JyMa7LjqRPhUdCA4mlzAkUFeQhbwQA6vPhH0JaH/RKlwoseY1CfUeyfsyD3NQf9ROgTJrcNtlncTawAMH9NICnkf7Hd5P/dzMu0NmzxFh8AjyVEC6rzUkAI02pMQv1SaPsgGdKnSWLFceDZNFJUPcGkCRGCtV5OGiKrp+LkEjvWLb2F50ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756847274; c=relaxed/relaxed;
	bh=sUBfwYxW1nvvuYNEneDVf7LTWstMzBFY9pFFojOedXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APD1NSBH1Sd1cRg4K2nnYz8yThc7ipOjDyyt53RMzDpYwoICzW8RLsseVUjwa2T2anrXR+LjUJrC4cpWMVSjHzhrwHK8q5we95Hc+UqLtftQrw8q7sL3m4bdZeVjFs5NHNpRaIWjUVBNsNFZ/wU9jHXCQenFv9uJCGD8G4FJ+X3t618aYfYhwjotu77J1X1Y2ZqU22LAV0NfXrQyu3KZgywq6SYP1X8XmNRCR621veaHJ/CQU8QQm6EjaOBDfctDwXKMFj0occDYCwweBrl/iYlt5p9bndCAY7gnNdxmZA+jcbJ3QK61sq5gYO6P1fePEkldnHXF433X9ERSdp2peQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JxnXewTT; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JxnXewTT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGdcT3kyjz2yrt;
	Wed,  3 Sep 2025 07:07:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3996600AA;
	Tue,  2 Sep 2025 21:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7E9C4CEED;
	Tue,  2 Sep 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756847270;
	bh=9luCV5wJ7yhlC3yg/FU3fC2wBmgdOhCw1dNsvVhR9Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxnXewTTWw6LCguvMQAYfSS+fRbXyCatwmElT4fUFOzGF9/BkV1YqpVOHxT39Zudo
	 WaQV5PYFVZk9ZEs82zoBxj0Cj82h3+QEKCineK7pc2x4k/WzfPeNazBLRPoUv+EmXH
	 aWzxTAcZ1mR67eAFwippzDSsDhT3ylhGLa8naxoD22lYW/xW9hWt1i4p6l5tulTvZS
	 ugBXu9ZYIBH04U+RSzsJNFz/m7L01NueVWKbq+8Um5eDhtvJlBRAWEScWr8QYgkCfR
	 LTu161GIoOH+wtN06Tn0z1zoYEqWEXjwRHTflkCH5c3oAaSz7GtYZ5ukXvVpBVXuXd
	 wsYCz+LwBo3/w==
Date: Tue, 2 Sep 2025 16:07:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
	linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, mani@kernel.org, kishon@kernel.org,
	lpieralisi@kernel.org, openbmc@lists.ozlabs.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	kwilczynski@kernel.org, vkoul@kernel.org, linus.walleij@linaro.org,
	andrew@codeconstruct.com.au, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/10] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <175684726867.1179507.1325689582067833868.robh@kernel.org>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-3-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250901055922.1553550-3-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 01 Sep 2025 13:59:14 +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PCIe PHY is used for PCIe RC to configure as RC mode.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


