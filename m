Return-Path: <openbmc+bounces-288-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6696AE72C0
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 01:01:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRgRT6BxXz2ydj;
	Wed, 25 Jun 2025 09:01:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750779663;
	cv=none; b=Rjwj/P8esesBtjKWHL3AWcZoq/eEEVg4vRD3m8Ea1twtcp/I1in/nq/eOXP73Rj+V1B0hLk0970cDu3+fmz4mXVXZ88/54O0K6KjazidioQyeeKmzQWcM5D29izeA+aBhv7BvIcbUyUUA+QiY/DldHe+3pmhFPFQG3TdyXdUW4skO3mziK2C43yj2ZDQ8Qpji5x/80gA01CFDwzjxsZLh4otYxQtg5UYxEZtoi+G0McVAv2sYSaEugExbbOjOESBSgbUZZ1mGZFMTGyc6X13iUh2JHvcv9oMSy3EY5lCBu3GjbuOwAxPCYzxUz2IzkNIpaY684y81MJNMuMyYCV1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750779663; c=relaxed/relaxed;
	bh=yVl1jBXeKOOdiSgdx9SxjkRUmmR2uIB4d7AOMUyCXoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FGkwEWzwaMfuaAMip5MqDe6MNAvFBsVxZ1AmBti42+yN45tTct3GBmx2KH/9tPQuytu324hwBscZtDXwQfcZohFvZnbVrKVZbGK3NWRlKdfpn5xFhoBTCVgBxmxoC7OVCnpkYGhnf/5wPCiRyIyvhZaLifxQ5YVPXcI7fuaQgQi3KeRMFhd9WhFPNsy18JpuhDKa1qKpL5miJ144NDKLbkfwLBuWdCZ5c3XgAMZTt0X2NNrhCjp/2bTVECXBtGoAYfgyB6vsenh8KvLPCh9/BfbtTCOJKjqpwjIAet+slChf+qJY5dSpZdO+XXLehdpMML9Eq3D6XKjbfpc1mDJEJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpBF33O5; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpBF33O5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRTgg0SwCz2xk5;
	Wed, 25 Jun 2025 01:41:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2C905C67CB;
	Tue, 24 Jun 2025 15:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D022AC4CEE3;
	Tue, 24 Jun 2025 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779660;
	bh=V4cFT1hqRldsR5zu8HOg3Q2LTneYk9DIMbOYJXD5/V0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SpBF33O5DmWK2ju99YB+4lma9jKXpW06Qy7WaO72fUGRR1bwapxUreARlC7ACWT6K
	 d7vv4X3sGIn9LGbgcTNo3m5HJIra8v37CKiK8VkCbUNooIqlcYyh8VByADcphLjB9W
	 hYlSLlPFnIJKGwnFPitY38ytqBnIwNYFchiWpKgQFsRDQMDIhi5yhHtaKUrJqUIfhI
	 M+utXRuCz03/g3TIw4+WeJGu3yf5PFgqTBHYBduyJ+DgVZQ5TroV2E01VPGEMlzJrk
	 LU61+IsoQyxe1V5snMuI1Aeg04lidkunp9VMazrO8DDzUHZSLfluTSyWQAZA4nsWG6
	 Cps8jR3ACfGjQ==
Date: Tue, 24 Jun 2025 10:40:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
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
	LKML <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Message-ID: <20250624154058.GA1478094@bhelgaas>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 23, 2025 at 05:41:13AM +0000, Jacky Chou wrote:

[Apparently you trimmed out some of the lines that show who said what;
there should be more lines here like:

  > On Fri, Jun 13, 2025 at 03:03:55PM +0300, Ilpo Järvinen wrote:
  > > On Fri, 13 Jun 2025, Jacky Chou wrote:
]

> > > +#include <linux/irqchip/chained_irq.h> #include <linux/irqdomain.h>

> > > +/* TLP configuration type 0 and type 1 */
> > > +#define CRG_READ_FMTTYPE(type)		(0x04000000 | (type << 24))
> > > +#define CRG_WRITE_FMTTYPE(type)		(0x44000000 | (type << 24))
> > 
> > These are straight from PCIe spec, right?
> > 
> > I think those should come from defines inside
> > include/uapi/linux/pci_regs.h, there might not be one already, so
> > you might have to add them.
> > 
> > I also think you should actually use the type as boolean, and
> > return one of the two defines based on it. A helper to do that
> > might be generic PCI header material as well.
> > 
> 
> Agreed.  This definition is used on TLP header.  Maybe I will try to
> add some definitions to pci_regs.h or pci.h

This values might come from the PCIe spec, but unless they are needed
outside drivers/pci, any #defines should probably go in
drivers/pci/pci.h.

