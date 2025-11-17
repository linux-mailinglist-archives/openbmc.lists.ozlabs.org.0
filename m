Return-Path: <openbmc+bounces-916-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC6C667F9
	for <lists+openbmc@lfdr.de>; Mon, 17 Nov 2025 23:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9NQP5PbXz30Vy;
	Tue, 18 Nov 2025 09:56:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763400546;
	cv=none; b=k4/yiPdn0kjBbAsHXi9x331J713r086otw4vgyZ13MSyr/owFRRJrNtFE0S5Opq6Lt/lTZ4fWdaGFN0Z5ncFhxZpQbqXKHrlW9151B9euh/nnELgfk61OlQBAlknBLhe+L5d2bYG4jcNFLVLl02wJ0oqU6CR493/FBGcD/iJww+Yd7GvolSmacsEzRnpyir3tmo9OVd/8u0wGte1RXbJDSKgd5+QwVWocJ8AJF0OCX+99Lxs+DldZFid2gaWWRgnyHx4ShiTp1+UmnZVaPwudFUPTkgDhT1ZFgS3dAwjTKDfS3nBvnGcfzOu0EjYu1LqKOYhoD2po1aa8yxdKLIsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763400546; c=relaxed/relaxed;
	bh=gooMhowPOuyHbixsfPYvirfY5GzfuVPNuYdGKL2Yh4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TqVfyX13NOUZ4dkpn3DGtaOtXy+E6b5L5rDRJZdMXp6nd7Ezs3yA6US548FiCVWgjpBMEKTZ58PgOnYjru71zZ2CK7uFy0xbD2y1Lf/gGH55gCrtZdmaiJkMjS4w3BZ1Fx2Gi55ibfRSVjBCiSDckTFOyBO0sGGxOPI70VJkIia/9mECStPOSa2ZMbReP0pNJYflwKuukAqKAJ+qyTfXVIu0hpsFNesYuVYd/jgcI3xNhw+LtvEt/D1plkqJL5KsUL/wsiaRxTHEeNLVlt8uoGVTrUTRMpsaCjcUZq4VbokoJEC5LGBOTofydr+Nb6MLa08ob04CIIj8IpLYACmZIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NGeQ9Bjj; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NGeQ9Bjj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9F8x2pt9z2ynC;
	Tue, 18 Nov 2025 04:29:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB7160051;
	Mon, 17 Nov 2025 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57FC4AF0D;
	Mon, 17 Nov 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763400542;
	bh=JlsE1lph8w0DMhM6j2h7RraWGmZuAIqFU+0dI5wpwmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NGeQ9BjjDPbIlXZTF48buPSkHU3BW+jHvClesoPVMotHRkTEX5YtTu2a4msnQHZBn
	 U7+pR30mHcb3+UrpiDas9215oPGJDwBDcwbWPL9rayhMjRgkLfRovzamI0WxDZAmWR
	 ERy4qFZxO16ofbIotyielscmaIVagOGGr4gXZK9qOnwFjcl7pRvEoghMoB5ZRxqzEo
	 KaMY5tymug/UgzZtrTnzZfJuxHOUJaI+h75Vv5r7TOD6KKsgJKWNXgGbVWhS92/2sz
	 hEyDaM3YBYj6yZytFqOpmNVPPvtFzBthWMlEjsQCppWZ9fafXclCiQTZfztFwdfa9s
	 bv8t2f5tJFjGA==
Date: Mon, 17 Nov 2025 11:28:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v5 6/8] PCI: Add FMT, TYPE and CPL status definition for
 TLP header
Message-ID: <20251117172859.GA2466937@bhelgaas>
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
In-Reply-To: <20251117-upstream_pcie_rc-v5-6-b4a198576acf@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 17, 2025 at 08:37:53PM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT, TYPE and CPL status
> definition for TLP header.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

OK by me, but it'd be nice to move up a few lines so this is with the
other TLP-related items and the unrelated PCI_BUS_BRIDGE_*_WINDOW
values aren't in the middle.

Might even consider moving these to be just above the Message Routing
constants so things are generally in the order they appear in the
spec.

> ---
>  drivers/pci/pci.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 36f8c0985430..3a075f77cf4a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -88,6 +88,21 @@ struct pcie_tlp_log;
>  #define PCI_BUS_BRIDGE_MEM_WINDOW	1
>  #define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2
>  
> +/* Format of TLP; PCIe r7.0, sec 2.2.1 */
> +#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
> +#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
> +#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
> +#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
> +
> +/* Type of TLP; PCIe r7.0, sec 2.2.1 */
> +#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
> +#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
> +#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
> +#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
> +
> +/* Cpl. status of Complete; PCIe r7.0, sec 2.2.9.1 */
> +#define PCIE_CPL_STS_SUCCESS		0x00 /* Successful Completion */
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> 
> -- 
> 2.34.1
> 

