Return-Path: <openbmc+bounces-297-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D893AE93BF
	for <lists+openbmc@lfdr.de>; Thu, 26 Jun 2025 03:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSLkJ5m6rz30Pg;
	Thu, 26 Jun 2025 11:31:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750889819;
	cv=none; b=kqDM9zKzSASMzXgU0/qkT+aa3e9Lx4n14qW2gA1VekDhjXWS5G0n60qQX1EBWh0f+8pyVK6TOkhsd83dkkOHe8eavj30/g56AUGjIXGiMiwGl9llQtuhGumoO3667tscZoUgJWzco72fgZvd4pGWpWVRCbRyxTCydsEHltiuMqt+Skz5u3P+eLfkqAO5CetQeE5kg480vQcJokyFeoTKbu2O7HQkmlA8P3kI1a4sHTbtS+hwBqij5n+nPcWoGmTfPNUYsdlRu1SDMDnB03oKgjGpHeIDt5v/LbiBa+myfrLjgZtKMEcpBjYHYt2qDvpZqFk97opc70qu0CNS+6S32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750889819; c=relaxed/relaxed;
	bh=i1zJX2EY1qjHmK7uncq6ApGkaGV0L3csaXUWzoaHMvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SwQKyRyXoqgY5N3gXMvxMe0+Clkt+I4dLqseuoD5QJRpiQju1rd2k8ZidY/2HLgPSeT5cYJ6ROzwnQ7gzdPS8+9iEQAIiMEIAulic3qX0mbBcLw25PpDWefq7LvOBcaxpTKCXVxJABeHvjkq0N+km5+hVQGd9s9Qq/8GT+2oYqRqMZjQ7EoZ06rSW1LJiuzNwCJj7WyLk6wiMGvesYMSQxiWuGKu0aXsTzhXNjT0Yik7AHBsIMC5bzwHMKkaFQbr8rppHeuD/IQ6FY/BtDGPSK+Upw5LoWzU47OzhZiswnZs8UCpA3LgzrdCzNIXWME0b18XrgE+9sRwj3gTabTkeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRgvI8Ki; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRgvI8Ki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSGQ21XF1z2xKh;
	Thu, 26 Jun 2025 08:16:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A20CB615F0;
	Wed, 25 Jun 2025 22:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2720CC4CEEA;
	Wed, 25 Jun 2025 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889815;
	bh=JPCUTE7k+d+bV0g/ym3IuJKj3lnwuQfByYVszEgGuWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FRgvI8Ki3o+8iAvZxOIOLv4YJj2pE/da5dKHPk4INdG0jov6rqfxyEemaXfjw7Gch
	 7/EpZGNRiorCi7p4OgarRC8qCQ/dx0UQ9I2J3SoVMztSbhHzrqfQSuT5BuAZWrnCwa
	 0Gf4FPtA2UdyAGdoY7lWk0pnZG+LvElbmEFkd4erB8Ioo259Q2nrKXZ55Hh9EC0oXK
	 /Q4N+vlPGYoJ5/LWKa3MzpD9yjxG6/yfB+QoaWFgwrx9j4i7mUTYPOOdtxwcB+6NlK
	 o14doDX3YsC5c5DLWuPCeGWr/HKA5g9BOUlP184kbOtrpIE2lKxBg1GnhPxjAbEP3Y
	 Vwjm1PXyLnUZg==
Date: Wed, 25 Jun 2025 17:16:53 -0500
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
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY=?= =?utf-8?Q?=3A?= [PATCH 5/7]
 ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250625221653.GA1590146@bhelgaas>
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
In-Reply-To: <SEYPR06MB51346BC9292066243CB845699D7BA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 08:27:26AM +0000, Jacky Chou wrote:
> > > > > +				resets = <&syscon ASPEED_RESET_H2X>,
> > > > > +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> > > > > +				reset-names = "h2x", "perst";
> > > >
> > > > PERST# is clearly a per-Root Port item since it's a signal on the
> > > > PCIe connector.  Can you separate this and any other per-Root Port
> > > > things into a Root Port stanza to leave open the possibility of
> > > > future hardware that supports multiple Root Ports in the RC?
> > >
> > > The PCIe RC that designed by us is only one root port.
> > 
> > Yes.  But this driver may be used in the future for other RCs that include more
> > than one Root Port, and it would be good if that didn't require structural
> > changes to the DT.  Also, there are RCs from other vendors that include more
> > than one Root Port, and I'd like all the DTs and drivers to have similar
> > structure.
> 
> Thanks.
> Is the "pciec" node in arch/arm/boot/dts/marvell/armada-385.dtsi
> what you said?  Or could you provide some examples for us to modify
> our pcie rc node?

Here are some examples of DT bindings and corresponding driver code:

* drivers/pci/controller/dwc/pcie-kirin.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml?id=v6.16-rc1#n108

    kirin_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-kirin.c?id=v6.16-rc1#n399

* drivers/pci/controller/pci-mvebu.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml?id=v6.16-rc1#n125

    mvebu_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pci-mvebu.c?id=v6.16-rc1#n1252

* drivers/pci/controller/pcie-mt7621.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.16-rc1#n111

    mt7621_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mt7621.c.c?id=v6.16-rc1#n198

* drivers/pci/controller/pcie-mediatek.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek-pcie.txt?id=v6.16-rc1#n85

    mtk_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mediatek.c.c?id=v6.16-rc1#n909


