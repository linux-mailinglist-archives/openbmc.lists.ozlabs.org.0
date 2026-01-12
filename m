Return-Path: <openbmc+bounces-1164-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED8D1393D
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 16:18:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqbbx3p03z2xKx;
	Tue, 13 Jan 2026 02:18:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768231085;
	cv=none; b=MgQIGafprpkvuQ7i52oys5RpF64t4o84MaC90RxXJ2gREvSdWJ0h+vU+ukYz8V//HGaVuQATponBQyakop5QgaeSefIzZdm05QOCUXxhGyjPtjaXGRCR4OA0ezJCVC7P7xUW3knUWH0Pi8o9G/DFopKxNFvi8993n1DTIYiu1u3nPdWxEJmlkSca6G7X94J4bfwusJqyF4YrOIcQN/5gc1GBLCCZvcD9d7yVbiQAVylVIRQHUYEDcQz3KQCWzSZqQwzQ1dy8UCKj7OraHAYxFhPnGI1vahFL22/CFEjulmXMfwv7sJcib7blg4wgtF6YX/IQ5LySiI5htrEp5QsFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768231085; c=relaxed/relaxed;
	bh=Fq2c9XCdhmDNHEtVguthHgPbf/NaarWlGDrScQBVJRA=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UmGnTSuveagxuwZqD858w+V1pcZjgUEGMFTyClIxF2bo7hujQto0/uibpXlhg85iXV8FakH+7TL5yjHOBSmOyS9gOELDxKZ0eiYdJwUgTQnPoKOPA8ytTCpuo4QKAXLYRU2EzLhox7MOqC/pcyfxHh2OGGzHhZD0rk8hDotfRDV0QcLwGNBRCrQMHpTuqtnaMQuuS7f5OaVCKSbVBFR0lCFd6wQ3Gdshc5FO7hRiwLAglNKAeM7/7KbYpXjUuv3LxLVs+JaTJq5vV3c9R9eVSAuNU4zP8yiIf/Ma0r0c6IYGLoT+xGLGwitOfS+lEKIAQJsb6pdx2fGaOFMu/LM1kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A9TJGe1f; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A9TJGe1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqbbw3BRbz2xKh
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 02:18:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 356B0600C3;
	Mon, 12 Jan 2026 15:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB475C16AAE;
	Mon, 12 Jan 2026 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768231050;
	bh=oeljyyib6Pl18XuDgLYw+CXyCHm8RbZngF2pGgWjgN4=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=A9TJGe1fGfegv9iMpzDCpYR4GWh065Wv2k8Bx/crHdrnbPIHBRZwNtb6Ex8WEcz69
	 Pz3gxY7LjZIvModEiUTFk8ZSjPAXs4wsh8KcM5UT7gJ1nqSCCZ008yKwHJWhniE65F
	 XRO951zA7/h2jUwXmO9JKdt6r6kyxTXWq+Fvt2PIUDoU9ahQxtae6i5DiWSoQgabNp
	 Jx+/E+MbHIBF8KFbcIT1Rzz2zPJuA27D29HmNTRwV1bPPDc5fWmU5tkqZMPL8Co6A/
	 Fpld+yXzyECkRlP3klOyY4IaFcEgws5SNkZt2E8NWTeJVOKUk3QaQs/xkoosOGFFd4
	 Q8mSL0DVL21BA==
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 09:17:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 SriNavmani A <srinavmani@axiado.com>, openbmc@lists.ozlabs.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
Message-Id: <176822994353.7723.17700786956910310022.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add eMMC PHY support for Axiado AX3000 SoC
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 09 Jan 2026 17:43:28 +0800, Tzu-Hao Wei wrote:
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC controller.
> 
> This series includes:
> 1. Add bindings for Axiado AX3000 eMMC PHY
> 2. Add Axiado AX3000 eMMC phy driver
> 3. Update MAINTAINERS for the new driver
> 4. Update Axiado AX3000 device tree
> 
> Changes: (The previous version was mixed with Host driver, so I separate
> the PHY driver as a new thread)
> - Fix property order in required section to match properties section
> - Fixed example to use lowercase hex and proper node naming
> - Removed wrapper functions, use readl/writel directly
> - Replaced manual polling loops with read_poll_timeout macro
> - Used devm_platform_ioremap_resource instead of separate calls
> - Removed unnecessary of_match_node check
> - Used dev_err_probe for error reporting
> - Added proper Kconfig dependencies (ARCH_AXIADO || COMPILE_TEST)
> - Fixed various coding style issues
> - Link to previous patches: https://lore.kernel.org/all/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com/
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
> SriNavmani A (3):
>       dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
>       phy: axiado: add Axiado eMMC PHY driver
>       arm64: dts: axiado: Add eMMC PHY node
> 
> Tzu-Hao Wei (1):
>       MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
> 
>  .../bindings/phy/axiado,ax3000-emmc-phy.yaml       |  38 ++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/axiado/ax3000.dtsi             |   7 +
>  drivers/phy/Kconfig                                |   1 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/axiado/Kconfig                         |  11 ++
>  drivers/phy/axiado/Makefile                        |   1 +
>  drivers/phy/axiado/phy-axiado-emmc.c               | 220 +++++++++++++++++++++
>  8 files changed, 289 insertions(+)
> ---
> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622
> 
> Best regards,
> --
> Tzu-Hao Wei <twei@axiado.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Deps: looking for dependencies matching 4 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
 Deps: Applying prerequisite patch: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
 Deps: Applying prerequisite patch: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
 Deps: Applying prerequisite patch: [PATCH 4/4] arm64: dts: axiado: Add eMMC PHY node
 Base: f10c325a345fef0a688a2bcdfab1540d1c924148 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/axiado/' for 20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com:

arch/arm64/boot/dts/axiado/ax3000-evk.dtb: /soc/phy@80801c00: failed to match any schema with compatible: ['axiado,ax3000-emmc-phy']






