Return-Path: <openbmc+bounces-345-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42934B06A18
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:55:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbf55gHBz30VZ;
	Wed, 16 Jul 2025 09:55:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752594110;
	cv=none; b=L+fKyFT76deFCp39/sJ26LGhsRNUFsozH/M2mmPj158do5j06JM6r4PGyqmm/zZTtLSHLkFYshJOSB07Tlme399s3NTfF5A7t/Q6urKGa060dHuiTEbpt9hnPy3W9zO9Bry9Ldj1qvgYSsIM9tzf0wG1MM3E6K5xKqO5hL5NnKNNjTl4Dko9kY/PiUmRVafodGOIdWMOpjJZ2uH6CFDFll+Ck08Nd6lwZIDVTnAkiN8HjBfX3TNu8yA7WrZ64OrI0IQOyVeNenJ0VJNVinzGFloE3azmet6rrE0wL2yZozn0fyCiv+hJt2fC0zpHUhY/Shy1oGzzFz6tMjA2ffqKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752594110; c=relaxed/relaxed;
	bh=0PiieK9xPE7f7RvZwq8oYFH6QE+456GzBNIaRwrnIaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=atgDAfNkRYE1/vhTVfPxBH5hQjSi/oo6nDcUBeJl77TUO+wvJEDGzgI+nISx3DTW1WDgisqLAVHZArPD+zBNFnUjI/NMFPx/WBwxOm66Qn8wCVpEhMFzybZKGmt/0AxHFqff0zlCHL6zyf12OhyRFMJKFlGLDlRXMGWCY7jtKmMEgZoHfqBSgGgiZIHp4jUMqSLFal8RlCxXuZ2fdSlF64ShsNe8HPHi0pCg5JT99ygxKRhLfommIpPhALT2zWMHKCPmHHCFMdQPpo87fxti4aDS7WraF3aH/8gw9Fp49QAVwm8PTeMqyit8CLatvEz1/PNiDB+IM2UlH7UJMTkv8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=em5tJsih; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=em5tJsih;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhNhs50Y0z2xS9;
	Wed, 16 Jul 2025 01:41:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B35261465;
	Tue, 15 Jul 2025 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9445C4CEE3;
	Tue, 15 Jul 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752594107;
	bh=5b56qrNXj/OfNJ271j1G/qJdm0poMtreLVVNIaR5qWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=em5tJsihWZBOan5zIsQ+cSPCgN/Rzp4PaCrte3ake8mi3AWxsjrrCK82IG5RHPyd3
	 QNuI2jxfMyfWMgyviwYRD5CjVdfWzVtyF9fUoMjIPN4q8876pn6mtbVehydcJoUA4B
	 WUwoUbvxn6ip1JsTZTzJce5dAE+IYh9+ZgOBl3XzUfOlprqkrzlFDRLdGyINL/cJX1
	 KmGccngAWOPzR+MRfSAvKVgFTFM2L8FUVYtxkYAEds6vLp3H7gliyxIIQIfpYv8WY5
	 J/mLGzM5se86kFo2Q8RqS4AxPDLGe37gOLscWUJNDFq1gzFiNI0OhvEEEohYvd6R73
	 CSVVVH/eWhvNQ==
Date: Tue, 15 Jul 2025 10:41:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <20250715154145.GA2461632@bhelgaas>
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
In-Reply-To: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 11:43:18AM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT and TYPE definition
> for TLP header. And also add macro to combine FMT and TYPE to
> 1 byte.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  include/uapi/linux/pci_regs.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I don't think these definitions are relevant to uapi users, so they
could go in drivers/pci/pci.h, similar to the existing PCIE_MSG_*
definitions.

Please follow the style of PCIE_MSG_*, including the brief spec
citations and /* */ comments.

Not sure we need *all* of these; it looks like you only use:

  PCI_TLP_TYPE_CFG0_RD
  PCI_TLP_TYPE_CFG0_WR
  PCI_TLP_TYPE_CFG1_RD
  PCI_TLP_TYPE_CFG1_WR
  PCI_TLP_FMT_3DW_NO_DATA
  PCI_TLP_FMT_3DW_DATA

> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index a3a3e942dedf..700b915e00f5 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -1230,4 +1230,36 @@
>  #define PCI_DVSEC_CXL_PORT_CTL				0x0c
>  #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
>  
> +/* Fmt[2:0] encoding for TLP Header */
> +#define PCI_TLP_FMT_3DW_NO_DATA		0x0  // 3DW header, no data
> +#define PCI_TLP_FMT_4DW_NO_DATA		0x1  // 4DW header, no data
> +#define PCI_TLP_FMT_3DW_DATA		0x2  // 3DW header, with data
> +#define PCI_TLP_FMT_4DW_DATA		0x3  // 4DW header, with data
> +#define PCI_TLP_FMT_PREFIX		0x4  // Prefix header
> +
> +/* Type[4:0] encoding for TLP Header */
> +#define PCI_TLP_TYPE_MEM_RD		0x00 // Memory Read Request
> +#define PCI_TLP_TYPE_MEM_RDLK		0x01 // Memory Read Lock Request
> +#define PCI_TLP_TYPE_MEM_WR		0x00 // Memory Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_IO_RD		0x02 // IO Read Request
> +#define PCI_TLP_TYPE_IO_WR		0x02 // IO Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_CFG0_RD		0x04 // Config Type 0 Read Request
> +#define PCI_TLP_TYPE_CFG0_WR		0x04 // Config Type 0 Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_CFG1_RD		0x05 // Config Type 1 Read Request
> +#define PCI_TLP_TYPE_CFG1_WR		0x05 // Config Type 1 Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_MSG		0x10 // Message Request (see routing field)
> +#define PCI_TLP_TYPE_MSGD		0x11 // Message Request with Data (see routing field)
> +#define PCI_TLP_TYPE_CPL		0x0A // Completion without Data
> +#define PCI_TLP_TYPE_CPLD		0x0A // Completion with Data (Fmt must be with data)
> +#define PCI_TLP_TYPE_CPLLCK		0x0B // Completion Locked
> +#define PCI_TLP_TYPE_CPLDLCK		0x0B // Completion with Data Locked (Fmt must be with data)
> +#define PCI_TLP_TYPE_FETCH_ADD		0x0C // Fetch and Add AtomicOp Request
> +#define PCI_TLP_TYPE_SWAP		0x0D // Unconditional Swap AtomicOp Request
> +#define PCI_TLP_TYPE_CMP_SWAP		0x0E // Compare and Swap AtomicOp Request
> +#define PCI_TLP_TYPE_LOCAL_PREFIX	0x00 // Local TLP Prefix (Fmt = 0x4)
> +#define PCI_TLP_TYPE_E2E_PREFIX		0x10 // End-to-End TLP Prefix (Fmt = 0x4)
> +
> +/* Macro to combine Fmt and Type into the 8-bit field */
> +#define PCIE_TLP_FMT_TYPE(fmt, type)   (((fmt) << 5) | ((type) & 0x1F))

This looks like it might be controller-specific and could go in
pcie-aspeed.c.

