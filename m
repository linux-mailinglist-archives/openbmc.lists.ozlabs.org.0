Return-Path: <openbmc+bounces-825-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F26C1360B
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 08:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwjKd00Ztz3f8m;
	Tue, 28 Oct 2025 18:53:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761637988;
	cv=none; b=QOV43f4UnydzXOEY0L7ZiwlgEhjwejHvyRXksDEtxhXcqjFKjtEzfTUO0qVnbD5Skc2ANYit8uv/5ZWandwvxwj0kIzgN7TuPZd+tOqD0GnIan8SNjD7P6q2qIDBI7mdOKM/3CkZM4M7BDYPqn6zeLNTArcGCvG6RwxsVMbTwinunGGF42TbKVX7L4kFgIBicc65Jw5bM5hepNnRL5v5nlYhOekiywRpUs7YvF91M9T8EDaPPzbITSAAwRyB5Lv8fim4yRWPPNWp1Taa6u3I6vAa7hVmn99bY0RGO6pXFTC2ldcEyHSBjWulnbk8YSqn8WwlEiSt/1KPBV2sI0OlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761637988; c=relaxed/relaxed;
	bh=yCeW08scrr2ACBo1vbxVy1YcULpnUDlueJqIMQ2qt7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfdk7D621wOMRyCUUAfrSEMw6ph11zPba0g0XazfHWUA9fCgrp0WCxHES0dyjcYe2ufwtn809qXA5PglSR9e3SJ7wMw8tx1OAwJmCJwTHcr5RmpRznaIebp8qnE/DMkKiwONH9x+Klxu0inmCn56gjxT/vkGP9w5H1abVZO/jRamwUgji/ctT7Gs+37J1bKPHaJzR2pFRSb8svx5PXaW+Y3cPNSBQcG1I8ffplZ+ZtU2AD/hPHWEmxyp1iJA13KY9TKPqyksh9jWk+bfrcthOAbXEZQ7dG4ZUzanvsVSpbDVLagtk8OAukOJ/s8xNkX+1gGJTsu3VhbW0F4lWcR4JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KJ9GAhwG; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KJ9GAhwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwjKc1Ft3z3f62;
	Tue, 28 Oct 2025 18:53:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 980F145037;
	Tue, 28 Oct 2025 07:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAB9C113D0;
	Tue, 28 Oct 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637984;
	bh=yCeW08scrr2ACBo1vbxVy1YcULpnUDlueJqIMQ2qt7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJ9GAhwGQiUOpcjuOp1NuWsZ3BZtwb4Eri9cttZxeRuZUm14FV9fzvpPkqAD/YJ4R
	 2YsxmfjFSooPJ8j/dKdWTQp9CEysFOjZruputzlsYvAdBjwOi+lJWEIiz+GI8fTmze
	 T8gOxlLywka3cT/6t1L/5aAu3EL+FsjmPEVXF80Y2eZcEdZYK9bTI+UgQmBRwe/RSC
	 p3Sm/0khowvPb07B5bgjZSydbQnzzhWG252l2CkCmzXu6NXTv814h5FfLwhF7lZXbv
	 e0zs3EsjocEpcO7ND3rFjhfG51I/1I7EgOtDRN3NbM4QPCNbT4BTKGaLmISZHWak+p
	 XhqHrydapfx2g==
Date: Tue, 28 Oct 2025 08:53:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 4/9] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
Message-ID: <20251028-witty-nickel-pig-5bd4bc@kuoka>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
 <20251027095825.181161-5-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20251027095825.181161-5-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 05:58:20PM +0800, Jacky Chou wrote:
> Add pinctrl support for PCIe RC PERST#.

This is part of PCI commit. Makes no sense on its own.

Best regards,
Krzysztof


