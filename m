Return-Path: <openbmc+bounces-509-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D724B3263B
	for <lists+openbmc@lfdr.de>; Sat, 23 Aug 2025 03:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c80Bw2jVcz3d9s;
	Sat, 23 Aug 2025 11:41:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755876977;
	cv=none; b=a3qvjADSyXRkJvQZEuJfXbvQoXCBSFHQq24wnrbCBcjaDF4mkIKjZ/YrRwUOSRO8s9HB/JJpSD0YcJ8raJGvQ8BiCgDtUDK7GGHc8FTBDiIjrQ8zNCPNTdHm0gzKJo5DGaVXeHXtasHMSXYKXAZLree6im/nx51X9aXH0JzT7Ofkwx2hWDTBUJRKOtKjuvbYo4wNPiPj4tt3dYtbNCqA9GwvYrlBxfhok+zYorVFrl1yhDeearrgrqvjfxoik6wZarDT95bf2iKeCZta0wesn6ua1NsFjXnJaOtA9W+DfL7E1kqX0LLEHm2TFJUoRoJ5/X8mj/0wmWZuA9vqCyL+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755876977; c=relaxed/relaxed;
	bh=wdeejnjgmwcBIRs7F/fNBtVj8QKR4gAxEw8aPn/gFWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U/jnMMW4AGEAXvNDzI7rWPS2TIAu3j1+z8tGcFiwxWe5RCAHjFofbPP0Q0+5CfZi3Y1kUKIedWL7ZLvEnCkfwYT81sYElvsbMQM/vjVPd2PjuRTg3lEVIPcX9UAzD98iBv+iJixVthDiQTVyuSp1uij+0PlhiUYHUEdgkG0crOwTZPX0arIYTQtV1hVV36diiabfM5bF3b1LpH5NRdrly372Ds8rQHb93ylsUn+FekgyzpGAsFRzqQEMPV3uCg6LDGqvx9KTkExtFN9o7k3CeTwp+d67bk/brQXpSJCIlKvy48r6ehyfwAA4zqFjce3ASf1tM5ZAuuWVqlnuLlsxlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gkm3JskI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gkm3JskI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7kmx0h5fz3cmK;
	Sat, 23 Aug 2025 01:36:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A80D44618;
	Fri, 22 Aug 2025 15:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AE6C4CEED;
	Fri, 22 Aug 2025 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755876974;
	bh=M4axMQs8H13c09qWo6K3CitPMFiulFvZkPJOaBof5qk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gkm3JskIl9AEISSDTxGOPEQ5Ekw+yO/AvQdomznGVF8QhL2AKSjB9ug0fr1l8cDAC
	 R5sn0gLRNWsiAEXDV/8IqKrKhmFhfaIV0eZ2Ifeh4tLF63tK6IWjZnREefRXi/M03D
	 sonYkEFxAHk5WnTO9vZYeGm/kLZ++fqGgDYfTihFHvZFAojKUxRz39rTZqvajG+zmS
	 C5cdC9xRurIk0OtWquWGUHHvSsQMbdCi9wn8LX+sUhjGWTlzoGERhtdVdDoJXui0e5
	 RMD+nlwye1ZCE/pFkHY1ti7fjopPKBrl36OGkQOSbkQ95P59TCZ58RYnkJ70Qa5E+H
	 M8+0Xh8w08Hdg==
Date: Fri, 22 Aug 2025 10:36:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH v2 09/10] PCI:
 aspeed: Add ASPEED PCIe RC driver
Message-ID: <20250822153611.GA684739@bhelgaas>
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
In-Reply-To: <SEYPR06MB5134692DCCFD55F5ABD812F39D3DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 22, 2025 at 07:00:25AM +0000, Jacky Chou wrote:
> > v1 posting was
> > https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech
> > .com
> > Links to previous postings are helpful in the cover letter.
> > 
> > On Tue, Jul 15, 2025 at 11:43:19AM +0800, Jacky Chou wrote:
> > > Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> > > initialization, reset, clock, IRQ domain, and MSI domain setup.
> > > Implement platform-specific setup and register configuration for
> > > ASPEED. And provide PCI config space read/write and INTx/MSI interrupt
> > > handling.

> > > +#define MAX_MSI_HOST_IRQS	64
> > > +#define PCIE_RESET_CONFIG_DEVICE_WAIT_MS	500
> > 
> > Where does this value come from?  Is there a generic value from
> > drivers/pci/pci.h you can use?
> 
> We check the PCIe specification to find these contents.
>
> "With a Downstream Port that supports Link speeds greater than 5.0
> GT/s, software must wait a minimum of 100 ms after Link training
> completes before sending a Configuration Request to the device
> immediately below that Port."
>
> So, we think delay 500ms to let kernel issue the first configuration
> command is enough after deassert PERST.

Isn't this PCIE_RESET_CONFIG_WAIT_MS?

I prefer to use #defines from the PCI core whenever possible because
it makes it easier to ensure that all drivers include the required
delays.

> > > +#define PCIE_RESET_CONFIG_RC_WAIT_MS		10
> > 
> > Ditto.  If it's an Aspeed-specific value, can you point to the
> > source in the Aspeed datasheet?
> 
> This delay is set to ensure that the RC internal settings are
> completely reset.  We do not put its usage in our datasheet.

The "PCIE_" prefix suggests something required by the PCIe base spec.
If this is an Aspeed-specific value, perhaps remove the "PCIE_"
prefix?

> > > +static int aspeed_ast2700_child_config(struct pci_bus *bus, unsigned int
> > devfn,
> > > +				       int where, int size, u32 *val,
> > > +				       bool write)
> > > +{
> > > +	struct aspeed_pcie *pcie = bus->sysdata;
> > > +	u32 bdf_offset, status, cfg_val;
> > > +	int ret;
> > > +
> > > +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> > > +
> > > +	cfg_val = CRG_PAYLOAD_SIZE;
> > > +	if (write)
> > > +		cfg_val |= (bus->number == 1) ? CRG0_WRITE_FMTTYPE :
> > CRG1_WRITE_FMTTYPE;
> > > +	else
> > > +		cfg_val |= (bus->number == 1) ? CRG0_READ_FMTTYPE :
> > > +CRG1_READ_FMTTYPE;
> > 
> > I don't think you should assume that bus 0 is the root bus.  The root bus
> > number should come from the DT bus-range.

Just making sure you saw this part since you didn't mention it.

Bjorn

