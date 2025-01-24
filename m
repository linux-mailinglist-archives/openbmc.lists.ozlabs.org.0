Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4FA1B83F
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2025 15:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfgrL6DfZz3by2
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2025 01:56:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737730607;
	cv=none; b=Qt5nHeE7+0mS4QKZsPcvPo71A/dRh+Lnz1F20xZpIlKaUUle5X3+2P2peYZdb4BZElvWsmRpHADFRKUp37F8puuQwD0t2YLqiYseXrT6roiJwAmPL7iG/jI7WchlB4clI4HXvOTSShPNI9lso5U9eeFEKlTW7Oia5cpJEhseESrE6Qhv+40lCuM4duxUJfVxPxY45RR7XGxbuP2qOzjmWBWzGEZRjW1NS1xf77WOUg1nitGHPfBwKIqShN2NTCER4HUwrWEGU0koropRpZA0b+xPD17HL1jY8MqAtBof5gpTLHughjATcvsg6Np0WjPBa18F/wrKVygUbCx3vk/7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737730607; c=relaxed/relaxed;
	bh=J5kjHkJnOHEQs5ufwKsC59GIKFl8SpG5yJzGjmGDr5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd6hqZxZ7PZoA3yTEm59svoFU/l9eTlbcA0SzlEeGmAYyyVY7ONhmYkhbjJDFnwW/DpHxg8ObwTR9ZH2le7dsirmC1R1nG6mflrOe6g7dFsv5XEVmfW2qUOFhcqa66zc5MJEc4qGpe0Ectk0jfHIJcYdI29uhGI1w7gqEwIerdZwQgbiapKLhe9r7RgffckTt0Q4SkNFKuHXZYwBpmZC6w3bGkOCj6vfe30euY243hTSyb/lcP5kOzOr/TGMWl8qJnvdCtIHsidJjDeQYKUbe1GJTzlRxA/zyHtu5EP6FlTbu+OQxWZYtc6PVDKnmJdHI4LxjLSdvQ1skHTfRndgNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=4gfHYnQe; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=4gfHYnQe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfgrF2y2bz2yZ6;
	Sat, 25 Jan 2025 01:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J5kjHkJnOHEQs5ufwKsC59GIKFl8SpG5yJzGjmGDr5w=; b=4gfHYnQetFNudQQ+w0vRAFchfg
	Y4EJjpeJ/W5BT2yO0YcIuG4oKRxO0hO6s3EWVekqKFoQ89SXc6yD20w6pJZxVGHBhEjdVLJLt3/cv
	Fi/9fQU0C5QsxoPygdVzEqlZx+xOAqg9qkI9e8HomDOlVKUbQkCBD0bGSdx/h+8x1k3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tbL6Y-007cTY-5X; Fri, 24 Jan 2025 15:56:18 +0100
Date: Fri, 24 Jan 2025 15:56:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL
 BMC
Message-ID: <7b47725f-fb57-454c-82f6-859202060243@lunn.ch>
References: <20250124051819.7714-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124051819.7714-1-wthai@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: robh@kernel.org, conor+dt@kernel.org, tony.luck@intel.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, dkodihalli@nvidia.com, gpiccoli@igalia.com, joel@jms.id.au, tingkaic@nvidia.com, krzk+dt@kernel.org, wthai <wthai@willie-obmc-builder.nvidia.com>, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 24, 2025 at 05:18:19AM +0000, Willie Thai wrote:
> From: wthai <wthai@willie-obmc-builder.nvidia.com>
> 
> The GB200NVL BMC is an Aspeed Ast2600 based BMC
> for Nvidia Blackwell GB200NVL platform.
> 
> Signed-off-by: wthai <wthai@nvidia.com>

I'm not sure that is a valid name for a Signed-off-by. I would expect
something like:

Signed-off-by: Willie Thai <wthai@nvidia.com>

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";
> +	max-speed = <1000>;
> +	phy-handle = <&ethphy3>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

This phy-mode is wrong. There is a long discussion about this, started
from a BMC submitted by IBM. Please wait until Aspeed fix the MAC
driver before adding support for RGMII based ethernet. You are
probably innocent here, apart from failing to sanity check vendor
advise, which happens to be wrong.

https://lore.kernel.org/netdev/20250107162350.1281165-10-ninad@linux.ibm.com/T/
https://lore.kernel.org/linux-arm-kernel/bebbba7b-f86e-4dc4-8253-65d34cb84804@linux.ibm.com/T/

The max-speed parameter should also be unneeded. Unless you have a
real need for it. Does this MAC/PHY combination support higher speeds,
but they are broken for some reason, so you need to avoid them?

	Andrew
