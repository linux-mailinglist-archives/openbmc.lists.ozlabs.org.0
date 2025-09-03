Return-Path: <openbmc+bounces-587-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC63B42D8E
	for <lists+openbmc@lfdr.de>; Thu,  4 Sep 2025 01:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHJzr07Tyz2yrL;
	Thu,  4 Sep 2025 09:42:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756938727;
	cv=none; b=HfySNjJByhHkB+o3MXtmDSrpJluWa3VTfDQixxaES60i+ZhgGEqmRzYfcIxAWKlJyu7lV5W56yOqB3lrsNFRVK0nCrHU59GQ6g9qMxPYoOdeuLZ3cS72bIh+uX/R4wPMxjRA/Gf0f/BTx3E0JlKzTEuwtpkIl4nY74TTwh2dAo6zlqhfmpnfEkHtkB9Fst3XKcuob/9JzyhY7me/XijgH3JcukytKP4vQuX58R5/x8WQet8m8YpcSt1p1NP5oXuS8iYzHt93rL0NopWopq8uCO7vKhfrAZ4dCUAIu1h2PEhdoSYk5lcP57KZlHdFaxqS3iPTKbOsAvKw6fRyyblMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756938727; c=relaxed/relaxed;
	bh=x3WyPe8tzcvkjPJMTuyLmMzJxuLJegDqZyREtGdOCyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f6QqxxizGEg/bEykxSjCaFU8KQJLtS7dMfuBBMozyJw8L46TgsNQMupMq68aVGCtpFju7T/xzL4IPYpPzDNvp/RXs3lJVHBMzrobUcbtsE3MXwysnRM9hQgtDMPr0lqZwZWVCR9fY+/I8f4RyKouG7wlLvsU38ZIM+vEPf3iBA0/jvWLXHu5xtGPM++KDQZhcLu1TqrkuRI1TDWQD3P+6FOn+IHsO3HMMMSU7nEWf7C9jLWQJJVVESkvD3vJaUC25mw7XUKohxoJelhguH0iNT0LdMsRbqnolbPEt5TtnxAKafHYTF0ug93B7lYd2bFTXHqi3NcxvfqNRL5hRqNkwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nrz9NKhM; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nrz9NKhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHHRC2MM7z2xQ2;
	Thu,  4 Sep 2025 08:32:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 568336024F;
	Wed,  3 Sep 2025 22:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB75C4CEE7;
	Wed,  3 Sep 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756938724;
	bh=0zNxbRiK/0aMy5wdBnW9WCgQpg46kf3uIF2gp8dwHmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nrz9NKhMC5qUarkd7J+XDkSpZDWKsfS09dlIk7Cm6jJKudqb+qGchlrAH1B3u2qBH
	 NxOy+gtbBuB6w0bqYYfEWi6QfniE4omkp5oXpUbC7VLbCjyLivl1eW2YWrxQSCgOQn
	 VgGPsYF3+fxTUZ6f1T5fgq3F9L1J6DD5DIIzMXE1D8K+S5CpeYQAtX21OXz4pK8HK3
	 ucbSC3pRXndnyQYZVRe5JXO5apjS3rw8iMp5mtKLM4kbwKatUSPZcMYOaY0aSJMEtt
	 hOUFxBzIzmltmb5JpiQmUMLEbEuVkvToIWP1FFS3F4jtQfq9Hm+T16ydICw5SgYNLz
	 oybtOg+x53FlA==
Date: Wed, 3 Sep 2025 17:32:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <20250903223202.GA1235935@bhelgaas>
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
In-Reply-To: <20250901055922.1553550-9-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 01:59:20PM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT and TYPE definition
> for TLP header.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/pci.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 34f65d69662e..45d47d6c4f53 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -81,6 +81,18 @@ struct pcie_tlp_log;
>  #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
>  #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
>  
> +/* Format of TLP; PCIe r5.0, sec 2.2.1 */

Please update to PCIe r7.0.

> +#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
> +#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
> +#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
> +#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
> +
> +/* Type of TLP; PCIe r5.0, sec 2.2.1 */
> +#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
> +#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
> +#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
> +#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> -- 
> 2.43.0
> 

