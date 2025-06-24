Return-Path: <openbmc+bounces-290-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F0AE72C3
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 01:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRgRW3GV8z30LS;
	Wed, 25 Jun 2025 09:01:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750779203;
	cv=none; b=NGhSHAmORPdjFUWpTahcHz9byxL7TStOdCthaEUC3zIanCMWY3GISEj4xtPyXElZz9D8Ys0mBBU5BFGhHEYQ9jtc7p8cEMqBkih4bg/fphVWQskLoaVXxcgvHV1uOiiwSPcfht8vZXuF4Bt3vjLI8MwKpexNc+/Ggig6QpuGLTQdxzTmyODFql6bhoINS+grGg0IA5iFXC/Jslkc0Z9ZiF/Od/B/fzllmDuejP/itvUOUHlCrd5vQfFnhUZDN111jDfOmkJ5elhUfwHpC6WnZc69pVfd1OXe/RXP7+iv7ISMGGpfHaEnZ2J0wKTcUuhoX0EAH0MN16qO4LRbquGM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750779203; c=relaxed/relaxed;
	bh=/6BuoMibyCX0ZAj9j6+6EpEVU7rjsW9gMBrhQSp+y5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Lx61cNodN5T+Eg9HAyZ56ErBNZv3y1BtSdk83XVl5g09Z/rSN7Xor6lpdm1FORwLA8ztlXhr99Bmi36C6i7n2pmWwe7efnGHH4gE0TSZMj8bxqSL7bytjYAz09YqnZRWV/5c9EqwKXYgkGMQ074qYMGcjzXo+uPRMa9N259uUxPwENaSBbRc9Ikx3burhFGqDenTI6Y52LXmUFj9hO3lNgY8FhXSW2VhJfoaiHhiyoy1C2hkN8mvf6/mJz0J4ZyruP+9n2KCWCXVcxCFwbwJ+9rDaBI48W5S1WBii2YH0qyx3gm/Yd4gydPx64Ka4mEU2S8y8zpAu3wNMW7N7rlw3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAdJn0S2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAdJn0S2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRTVq0C3Rz2xk5;
	Wed, 25 Jun 2025 01:33:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7389B5C6764;
	Tue, 24 Jun 2025 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61216C4CEE3;
	Tue, 24 Jun 2025 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779199;
	bh=q6zc5t1ffrY54UuAj9wfKtHgj2vJk8nzvm5t/rgZlJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tAdJn0S2KFY7K9z1dPx1SBSRAXjgZzFEpuX9Cz8uE2gOzckJHxm7jz+0gdwzWO+ex
	 CwT0ZhtL3tH9wwwdwjZBylW6D+MQ0M2HcWcRC2oWuS9rz02Rbu4tw8KGNnF3XJ80hQ
	 iNmEoquScWaakp/njFSojt3F09lCIqgde2eukZOpgCGkqxK8JMJ4CbFm4/h2AGuVwS
	 ITwBL8mhY6G4yj+CNxqP8lp9R651VyBgDXFGPM+uwbPELKLg4tpfsbFb2UGECQ8kOP
	 v4pAFDhjBxAWCSbz34wWUDKlhtjtMzRHLkBhFjVhGsk0f9wG0bP/QpPAl++srzrNwW
	 oQSp5ec0EoFFA==
Date: Tue, 24 Jun 2025 10:33:18 -0500
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
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= 7/7] pci: aspeed:
 Add ASPEED PCIe host controller driver
Message-ID: <20250624153318.GA1477975@bhelgaas>
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
In-Reply-To: <SEYPR06MB51342E52B3C4A7AFD42485039D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 20, 2025 at 06:05:20AM +0000, Jacky Chou wrote:
> > > Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> > > initialization, reset, clock, IRQ domain, and MSI domain setup.
> > > Implement platform-specific setup and register configuration for
> > > ASPEED. And provide PCI config space read/write and INTx/MSI interrupt
> > > handling.

> > > +static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int devfn,
> > > +				  int where, int size, u32 *val)
> > > +{
> > > +	struct aspeed_pcie *pcie = bus->sysdata;
> > > +	u32 bdf_offset;
> > > +	int rx_done_fail = 0, slot = PCI_SLOT(devfn);
> > > +	u32 cfg_val, isr, type = 0;
> > > +	u32 link_sts = 0;
> > > +	int ret;
> > > +
> > > +	/* Driver may set unlock RX buffere before triggering next TX config
> > > +*/
> > > +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> > > +	       pcie->reg + H2X_DEV_CTRL);
> > > +
> > > +	if (bus->number == 128 && slot != 0 && slot != 8)
> > > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > > +	type = (bus->number > 128);
> > 
> > Weird.  What's all this?  Some kind of device you want to hide?
> > Deserves a hint about what's special.
> 
> The bus range in our AST2600 design is just starting from 128.
> There is no something special.  I will use the child_ops that is in
> struct pci_host_bridge to distinguish the rc bridge and the other
> bus.

Is the 128 root bus number hardwired into the RC?  Maybe it should be
described in DT?

