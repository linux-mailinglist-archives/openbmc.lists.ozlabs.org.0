Return-Path: <openbmc+bounces-289-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDDBAE72C1
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 01:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRgRV3HbYz30Ff;
	Wed, 25 Jun 2025 09:01:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750778899;
	cv=none; b=C/xC5Y9PpLE+YtTdZK42fR5kE66IFCtglFoN3qxaZy/WkpdkeSHWBiX8W1fi7NtQ2UrmLUHJUZHW2tfA3z/z+N4PErANOWsiKQ+tIt8nXOIXSpJ7VtooQZWoTjMrfzWbreVnYbdj9+4MfNgMRnJ7r1i2vAiRiaUsNaQrdg84hv02zHvdXXQn77jA5rLMZXgCkJlOh1hROGQTkNvrvW1eDy3iV0zRiz85TxZ+LmsMNM0hD+h8FG3Rrk50V4PdwSeO7+V20KwJG+b9mfKmyPUBhE4KPS9d5HJ/vY0tSFakgxEhsAKFV6lm1rBsVhk4W44DhemH6YCVFY0JDcRccuVgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750778899; c=relaxed/relaxed;
	bh=XsNdAHj/TeTWbS97LIusJoIJAQIBgxjV5yCRWn4yiOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OiEuTwK3s9dhjQ/jKPKfTNL0E+w8vd4nD2kSGNJaBh5v+Ij9InkXN2Z4W1vnWmdm8oWanCZNdrB6bhsVK0RV8Xcnu9GRSEkHV+w3cB4qfU1rAA/zmE9s/4wczC/bJe5gi27z0T3fJurFDNevjAHh+syUgp7NHW6Of3F3pZazTahkp8wptqU1joWGafWoBcgGtPymZE8eKQ/Fz1aRy3+zcN3mgRks6Mdj0XIG+VXFHBJVEf4hMVzME/RJUkvffSO5Aesg8FF+t2kN+UPsFQC/TdjQasYnsc5t4RcIWSyBTRmSDiQYSq3CsYM7xwL/a5riOzTIEGqq9kJk2yyDHtd2og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aX667HMm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aX667HMm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRTNy6hytz2xk5;
	Wed, 25 Jun 2025 01:28:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85429445D4;
	Tue, 24 Jun 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF9FC4CEE3;
	Tue, 24 Jun 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750778896;
	bh=Pl3NFZyhrvklSpvN1eF/J9iEI8F8auASAYz/1jCX/eI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aX667HMmD7Y51beRdU5f4Hd584kRCoEk7KvoexSEew+t+eRh1pj1fR9UYQkqZHZfh
	 fWZBuBKFpWbUuR18ZgET27bcKTR21VWtudD2h/MiJg6xbrWNzJmKi4wWdNJxp8UTpF
	 cLfLjNx7iOPtPZpUkfu58+hbZmJ888pu5bFPuQLLNe3jewq+aBRDEgJjvD7ycC26mJ
	 gerZK14v2YkZRrVmf2+j4+xZpI9yO8HqO8Rg7b5p731cuNj3lCL5h1fcWXBFxZrqNF
	 KCL0s7tmxxejQDhFnb583lC+8Fm9OWcJ3n4gkCCspwZLuTbTLsDNKxeUPWTTXNkXBe
	 /ynLZbIg6aNbg==
Date: Tue, 24 Jun 2025 10:28:14 -0500
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
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH 5/7] ARM: dts:
 aspeed-g6: Add PCIe RC node
Message-ID: <20250624152814.GA1477818@bhelgaas>
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
In-Reply-To: <SEYPR06MB51343F38D4F9C130A4CE3FED9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 20, 2025 at 05:24:39AM +0000, Jacky Chou wrote:
> > > +				resets = <&syscon ASPEED_RESET_H2X>,
> > > +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> > > +				reset-names = "h2x", "perst";
> > 
> > PERST# is clearly a per-Root Port item since it's a signal on the
> > PCIe connector.  Can you separate this and any other per-Root Port
> > things into a Root Port stanza to leave open the possibility of
> > future hardware that supports multiple Root Ports in the RC?
> 
> The PCIe RC that designed by us is only one root port.

Yes.  But this driver may be used in the future for other RCs that
include more than one Root Port, and it would be good if that didn't
require structural changes to the DT.  Also, there are RCs from other
vendors that include more than one Root Port, and I'd like all the DTs
and drivers to have similar structure.

Bjorn

