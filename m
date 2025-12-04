Return-Path: <openbmc+bounces-968-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB423CA52FD
	for <lists+openbmc@lfdr.de>; Thu, 04 Dec 2025 20:54:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMlZK3Ld4z2xJ8;
	Fri, 05 Dec 2025 06:54:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764878041;
	cv=none; b=jPOW6Q49tyXH2+I/JcF93dqRRSJDTXJVOs5R83Qine4K+5z5pZRG6dOVjA/vuGsw5Ta3kzQTiwuq7SUka/FUgvsqDyiIRHQd6PXYRsvSplyV2kXx9EiZKplim2s9GPRLqbd67KxCngEONeOFilKogm/uw4yWO4wSl38bj1H6NreX6kgx9JPxoMifNGt0izH3ouwKrYw2wk+FfISR8ZJZeA8x/k8qLDVmx6kd4+yxO1SBcAn6pR0XeO8H/ktAawUCLumlsfPF/5eiWKkOFrPxUEJKGQ6kL+4qAKIcot126nAg5iaxOGmMUtz6rNGahQGFT58OBRmTdXMarJMQN5v8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764878041; c=relaxed/relaxed;
	bh=tfLeaYGnm95JDHxmkiQakLNLT4+nwhYzN9RzEnSdSpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY48ATp8+3NMzGx9PT/DXyUkvDrJluepAK/5QTAuWfXVA9hW2DlaqPcJeY4stbzkBUQgOhw1qzIiWLkLfYGWFy4ITjaxZbhBL0Ut7bq4Mjbf0Q3GxvfDS1Kxa44Xj1ar3KPi4wX7znhvDPBn1JFm+TX4AEUwfDso4sdbWZkDKqhsljiMbs43n8Edgt4W44fJcRMlESW9Sz4l33K7gyU1O4kKgaL1BtP50sQhBXqO/Qf16KFHoXLDiHNphj7jl05zIEBRlhBuahI0/cNW3YVQ1A+8y8j5p8PiKmZi1uHhAa7m6ZbHSoE00m3nOZXiRgtqATOVBHxv+yFFmfcPC1YWNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRDyqcy+; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRDyqcy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMlZJ5Rybz2xHt;
	Fri, 05 Dec 2025 06:54:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E5D06017F;
	Thu,  4 Dec 2025 19:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC75C4CEFB;
	Thu,  4 Dec 2025 19:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764878038;
	bh=IlWhPGE3xUkVs9noGqN8k3YfY0Ubf/0Tz/7YbiNoNOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRDyqcy+7t1NqBpjwfvt6EVa8fBQkxIXQGm3UhSM6pF/wQO2GB/GsLsPVU/5x5GEi
	 ISuzg0kUbHZykMWfUetqINwESVLOMc5Fmkby09hgB/u7SERCzYnp0wawyGV2PlT7/n
	 5l87bi2MeH9BDcFb4RYVZv5QJbaJ1y96IceT5JXqsVQb4D3G9VqtQmvZmKYyR8TlJc
	 Kvw7JWiTUYPVYuFB9UIihbWz7Pzyesd0xuz9ohN9oj0Fd4ZSSgOfGwZqBkdh2dU7D4
	 SjUBhWCsYAnJLC6nKdnqRUem9TAlPRZT3hfEV3yMJUy6kE89pMlaWtQcaBAKjIyVu9
	 WVBxr11PatfhA==
Date: Thu, 4 Dec 2025 13:53:55 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Message-ID: <20251204195355.GA1975043-robh@kernel.org>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
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
In-Reply-To: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 01, 2025 at 02:29:10PM +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> Currently, the ASPEED PCIe Root Complex only supports a single port.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Add PCIe RC node and PERST control pin to aspeed-g6 device tree
> - Implement ASPEED PCIe PHY driver
> - Implement ASPEED PCIe Root Complex host controller driver
> 
> This series has been tested on AST2600/AST2700 platforms and enables PCIe device
> enumeration and operation.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> Changes in v6:
> - Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
>   the pcie node of aspeed-g6.dtsi.

Where is this? You don't describe the root port and its properties at 
all now.

> - 'dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST#
>   group' have applied, remove it from this version.
> - Adjust the defnitions in pci.h. 
> - Link to v5: https://lore.kernel.org/r/20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com

