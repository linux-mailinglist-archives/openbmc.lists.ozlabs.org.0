Return-Path: <openbmc+bounces-970-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE575CA9ACE
	for <lists+openbmc@lfdr.de>; Sat, 06 Dec 2025 01:08:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNT984BHbz2xjN;
	Sat, 06 Dec 2025 11:08:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764979692;
	cv=none; b=K1vgHTm6b1Bv7EJuWcv+POTB0QVZR3sybtL5wyv2/UZELksfpQzgSymqT9UTqV2QPCd6VfKcOxidkSmKgA+IwTLT3+4PD5InIUiLEa6sy3SDr3UDCrtzqlRYAC7pF7ihP1XIgag+fxEdR5rZ7HSiwOi7Ib7H+F+NtQHZOx4PBwhjxJr9/wdi6BaofSLsOMgO7EUbkllTy1FQglVE+Rjn1QqmPgl+MFXh7rx2loPAyjeKc2W60wk0blYOE9BxKyZtrDzfYik9xz2XAKw+60tvrQhAof8Uo0EaJpBD7hVaMM9hcJRwiQ/T8Ha8x+EahQvJURDFsDwwzAtrEtd0vBpWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764979692; c=relaxed/relaxed;
	bh=VKJK/1vbn3UQHCzqMMe9+PhGMGn7Zr6PCz5ytRZ8gfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/k3RZfHpXfv9vuLXK+qsI5lmfoJdgtl9Kgp4uN7/kJbA2PrYcgoyKpH2kPJ2SJP6gKFbmSQjAx8N7tAp0DDVMyE9ZHtAZ4rCL/thyiTB48y5rHgaXaK2bt5dJlKu2/DcSjSSPd+Ohi5hoVkPVGZR3CuEAlrUFeHw1dEFfe8w6av9rSSEP3znD1if12WOKI+sj4Ntc58QAgdWnQP+vrp64aRqN9kCmqY27uD4bvHeYxJiq04ZjGmjk/073KADLidNJXlvEtT/iwMJ/5XrC7DpouELIACKx8XMlG/KuvTRuHoP+QSGtb7eyf2lgkXMgaC8n9+904vgeTbahxXfoC6+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMarMEwP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMarMEwP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNT971bC7z2xGg;
	Sat, 06 Dec 2025 11:08:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06D2A40229;
	Sat,  6 Dec 2025 00:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97FAC4CEF1;
	Sat,  6 Dec 2025 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764979688;
	bh=R7HsQDGBjcjXJ81DGGnBQnRnfKReTGHiJmsZwWhTh6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMarMEwPMDpFmOeAE6CeeAxtIrqgmlAO3jdHip31Ld+9XQox+jFZKJmkWBNUFYhOY
	 J7S6GEyYhVsXristA3lxrwkN/2idujDP6kV1nOLtAPb/yVsXB+hI7ec0g2XB08s9HP
	 61xlxNiWckbr4jPP0TM7nN3xlBE0ccvt6NqM548uJdtzfUzxt4sC+lYJzO+Plmk3tr
	 cbS1t+wmnVO6UKA+13SyT//0y2nxOD0zykoPZHAz8bDGvix8dC/AWUMJKbXLkPUMJG
	 qBMq3HaR7ezCM9BRmfIFxBKSnzNziHti3mhlf0Yv2u8M0IRsIym/CMdG+GKtb+9VS8
	 h2IQo5Tgu0UdQ==
Date: Fri, 5 Dec 2025 18:08:06 -0600
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
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Message-ID: <20251206000806.GA969079-robh@kernel.org>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
 <20251204195355.GA1975043-robh@kernel.org>
 <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
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
In-Reply-To: <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 05, 2025 at 12:12:35AM +0000, Jacky Chou wrote:
> Hi Rob,
> 
> Thanks for your comments.
> 
> > > Changes in v6:
> > > - Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
> > >   the pcie node of aspeed-g6.dtsi.
> > 
> > Where is this? You don't describe the root port and its properties at all now.
> > 
> 
> May I confirm whether the pcie@8,0 in aspeed-g6.dtsi is not considered the 
> root port? From my understanding, that node represents the root port, so I 
> want to make sure I'm aligning with your expectation before updating the binding.

I believe you told me it was the root port.

> Could you help clarify how you would like the root port and its properties to 
> be described in the schema?

properties:
  pcie@8,0:
    $ref: /schemas/pci/pci-pci-bridge.yaml#
    unevaluatedProperties: false

    properties:

And then add all the properties you have which are not defined in 
pci-pci-bridge.yaml (and pci-device.yaml by reference) (i.e. clocks, 
resets, phys, etc.).

Rob

