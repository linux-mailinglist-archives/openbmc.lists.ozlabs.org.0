Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4AA5DCE7
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 13:42:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCVd25Bd9z3cnv
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 23:41:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741783314;
	cv=none; b=GG5HDCEgXVx1+LpD98km7TV23zn7bpuGT3vR4AzyjbmPi1vORUV0ewkg/QMs4vdYtRtUINtXjay+fC3H2+Qo6X5REpj+F0Xf0RYHvFt6VFMh7l6HyvsbIhcdeAbD5LB/reU/IaiatHEpPmo3UK5CaUSKLM10fGIp8+hhqaL3Xxe9c+6vUewXWqpya5/xz53PaeqyGfiMHNEsEshITNjBQ4mecfqitYrDf4jg9empkdiX2F2xIuAX8P4YEHn0Bbw+/yUhLoLbI/OCj8I+l2eqqg6Ooky5e6RfR409WIDnJT4vf2twIJCsRVg0gXBQV6XOsU67x5RuIDCqoyZeP+DM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741783314; c=relaxed/relaxed;
	bh=YuyUiiI7ZFuPPHGTzB32+a5/wwkD8Jfy7CZVbltjHtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1GdiUpptKlxPUV9GMgSPohLQCjuWErrF6DFFOiS1CKV3ulvSuxq84ogzQlREN/5z9NUlLt6VARhLlqnRmEJ2CafBh0OPeJEQtws7BhpzuNhIF/kOOKFwjxmiXPH6if8CqT6bFo+ZZQD1NzKQCWcEa6YBhyXM0p11Zy52MCU2ODAmppwZe41Swcc0M17lPMsR8zxQF2Ofr/G1/rD1YfM2YB1zWaVYGsF0jav1TTRWanDcsI6jEji05JQoufTgGi7mffIwoG20z5ylL1WzniHOEStNkJrz6FqaQuMnuEVEf6evTL7Ak8oO8dz6kNp/uBd9DiywoN6gfsmr2V/vMe0sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=eMKAcuAn; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=eMKAcuAn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 1780 seconds by postgrey-1.37 at boromir; Wed, 12 Mar 2025 23:41:53 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCVcx6F2xz3bmf
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 23:41:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YuyUiiI7ZFuPPHGTzB32+a5/wwkD8Jfy7CZVbltjHtA=; b=eMKAcuAn2Tef46O2sREbd5JusY
	LdZ7uMoXii7OgFq2XCG/PvANlVkUthXXopVpdbVF4KS1LzveZh1HFUpIPonEMVHBAg344Ko/Mq8We
	I1yJauwZk1lslPLU35cn7dyV4rPgR19UmaU5x8cvODdxJrSF4CQFX4jok7x3mDI8j0u4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsKw8-004ebX-Q4; Wed, 12 Mar 2025 13:11:48 +0100
Date: Wed, 12 Mar 2025 13:11:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
Message-ID: <9ccc845b-9392-4a37-8bca-4f54997126ce@lunn.ch>
References: <20250312045802.4115029-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312045802.4115029-1-wthai@nvidia.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, tony.luck@intel.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, pmenzel@molgen.mpg.de, dkodihalli@nvidia.com, gpiccoli@igalia.com, maryang@nvidia.com, joel@jms.id.au, tingkaic@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy3>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

Please read the discussion again. "rgmii" is probably equally wrong as
"rgmii-rxid" you had in v1.

Please talk with Aspeed and ask them the clean up the mess they made
with RGMII delays. Until that happens, adding this node should wait.

     Andrew
