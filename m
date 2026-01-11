Return-Path: <openbmc+bounces-1147-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36ED0E9DC
	for <lists+openbmc@lfdr.de>; Sun, 11 Jan 2026 11:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpsVp3TNYz2xrC;
	Sun, 11 Jan 2026 21:41:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768128066;
	cv=none; b=iMP6UaZa1VGpW+bnGVrJDT9eyBXZ8nTf55XG4uEM4FaCQWTDOIH6mESS+9/TS06t7LFXmvhXln7nKIBEH6ex3dcoicFHe4YPZHeSWNior/Wx1bvRJEfglYQtq2EkyCHrnVnFdvo4NTkiUNgUbcOfgPzNoiwPYzP88wQUH4ce0miMGoYFE4Gd1EVSz5vxtrEk5TkuHYsB0rwHQU4qch031xc2kict6Tj6WvJUz6rS7s6F9Pcf3HoS11lN7rKe3Op4Dostk1zgp4Nnr2mreK1Kh8bKDuofjI3RaVrpWLxAuR1atRuKMMBimz2F6kau6wnWTuhDRtJrRubwlG7ffNxlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768128066; c=relaxed/relaxed;
	bh=QxNZNklVrEMXLNQqOVDX0u6frYhqRRN/CqreVHI4oEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsJXnVZGVXKyuREkcHacTDNc5h3YtWTtzzbYPThhLkbhYUKnud2LcxdtlxOhoeHXc9D2EL5VTZ5rmboUNmdQ4KvS7bz5mte3oGY0/Gw15GI2Zik7Q+zdj4QW0EocQ872B9MO1w1hpgFfLKo8V2i/PeveLzgu9MdFNBvtcJVVGZrV4m5bZRizvIxY3zJ6HChtbKBxRk1nfti3s/ah3KxW7mIyHTpYKEGfNlvJ80IIfK/Jh4Ecg6XeCuDjiXitQiyEIGzCYWOT4D+7U+6qMvb95uYm6r9iUBOTJc3GSClt91YPrtk2t4f7opt8D3FCQ+JYdXK7xby6BXYO2b6E1BK9IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEpqqfbT; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEpqqfbT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpsVn3Ptpz2xdY
	for <openbmc@lists.ozlabs.org>; Sun, 11 Jan 2026 21:41:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ABD560121;
	Sun, 11 Jan 2026 10:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849A4C4CEF7;
	Sun, 11 Jan 2026 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768128033;
	bh=jNXP3T+QGdDwl9VpGDdEjw5Gc/3zONZuRVJyjdi8Pkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEpqqfbTdpthCVE6J0syaQoiZT2GHX1BJ0Vi6SGyDNQPjuBqWFhDD7Fhln71NRRhL
	 vZAKijff4tkh2P/A7H0F0C2A9iCldzCSkBc+q0I3JGFhbqYDb8EMELwOxJE61Q+Nqh
	 153M5K85RLeQSY2/3iPPKDWSfZiNPzuW99J5ba/rGBwJhIWK2XpXvgjqkolYfEvRRo
	 uPML9sqLEL3uzznP9whlcMWiW5b5VMvr3SWc+ZJacbQvMjbObiTC5hDIGTpvdEk9I5
	 u/rUfkCDl1rys1yiHWfSZ+ZL6ehammbuff6iFUUxFRa0LK5R04Z1BnbEda1jnR1UmF
	 aQs09toTbrGjg==
Date: Sun, 11 Jan 2026 11:40:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Message-ID: <20260111-watchful-pigeon-of-brotherhood-6ada05@quoll>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
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
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 05:43:31PM +0800, Tzu-Hao Wei wrote:
> Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
> driver
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648b7e4e6fc62560662e43720422e01..6d1af11eb289ffb7c0d8634ac7d8f903aed1799c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4250,6 +4250,16 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
>  F:	drivers/hwmon/axi-fan-control.c
>  
> +AXIADO EMMC PHY DRIVER
> +M:	SriNavmani A <srinavmani@axiado.com>

No activity:
https://lore.kernel.org/all/?q=f%3Asrinavmani%40axiado.com

> +M:	Tzu-Hao Wei <twei@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>

No reviews:
https://lore.kernel.org/all/?q=f%3Apbolisetty%40axiado.com

Are these maintainers going to actually maintain code? At least Prasad
should provide proper review now.

> +L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml

> +F:	drivers/phy/axiado/Kconfig
> +F:	drivers/phy/axiado/phy-axiado-emmc.c

If you are a maintainer of Kconfig you imply you maintain everything, so
simply entire directory...


Best regards,
Krzysztof


