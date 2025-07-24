Return-Path: <openbmc+bounces-400-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77629B10264
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 09:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnjvD6n3zz30T9;
	Thu, 24 Jul 2025 17:54:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753343656;
	cv=none; b=RBpk5tiexNKeCZUOpPtC0dTdytP6zYfhy1tmSwQR0ze2FbgrxBEJ3YZCTn95pzSzYXHVyCPSii6FLiiNae89OaUGe2XZInxGoiyhNHBV+JEHgMQ1M1ePbYFM0bsjyR8LKdp1JhLLH+7Yogr/LrJRjlGuh22npYNmMT5g/0RPaDRa4eUZg5+HDeR7dBPQ8dKOwm//L8MAf96XT0X//mMsIx/IbZDQ6jY/rbeaJI/kKvJyji4A/nzzuZQthsvBeyKU3Esnx/GeXH4WDMeNIGw7bggn1dyGEqvRJTyDrvqpu3E+RBt1uWrOnF5k9OIUNc0gTYyjQq4rELS5rKP8oNserw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753343656; c=relaxed/relaxed;
	bh=NcK8EQ5jSkSiQo7JEF4TFVnhp8XGL+W/Tmlg+cdUQs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/ooO7luXybJypkWNvbW+oOcLOTB3/R81TlbzG6/8sV4ooJjRBFb0dqMoPLaylas670ZatjYIG2nrn7kwpsFaWlhITS4hfrdBAhzEf95Yf0pZ6v/OmJ0evWQIKLjFt3mkQEFAQHFRznCh0qDsrBxl91EIdThJcmJkYSy51+jiFwA9bcGmuLExrBMW5626dyApWZzVWvODssVcamrjaOl3Ji4SXUXuCqUJQMIvYrsgKyQkEUH0WYWoScAEyy2TxY+sio2fTGiyvjFoNNXsZGlmPoY7DXe+L23MviiL7FgyW7OR7Qfa/XvxibME72SUal9OQa94ER9clAZv57++UCSaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVQbuari; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVQbuari;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnjvC5hYXz30T0;
	Thu, 24 Jul 2025 17:54:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38D916111F;
	Thu, 24 Jul 2025 07:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CD5C4CEED;
	Thu, 24 Jul 2025 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343652;
	bh=fedaKSVKoXWJCia4hWOYvIVKJSIrOlYT8OjCgkSiOmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVQbuariQMeGlvpf5+/GWEx713YyM9MPKM5KQ601HdQVS5vhpB7/mKfwKY9waABvc
	 lzeAJ1a0wBQp4pTGKr8KwYrOnQTeuhl9ljDXfw0lR2Pxlh95HcFNqp5xw1T+85fonQ
	 Ws6dM8jr82IALG7HD+9jqaZDVQGpiFvDdI3tCrzQsudEpLWWFL76MBQDKdoKh3oN4m
	 wIIm8GY6DEcPdii55F3mTnj5Gl2cNmMB5Y9hUK3fAqUdOiFhYp0tnkFxI5uonCfEQP
	 CEXOpMkaUb1kKbyE/V1g/dppXzYaws8KcRDiSDciHZzGefQkMYs46ntPJF2rQ2g5k4
	 sF/nDAWvXTKeQ==
Date: Thu, 24 Jul 2025 09:54:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA
 GB200-UT3.0b
Message-ID: <20250724-affable-gorgeous-dragon-130ac6@kuoka>
References: <20250723222350.200094-1-donalds@nvidia.com>
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
In-Reply-To: <20250723222350.200094-1-donalds@nvidia.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 03:23:48PM -0700, Donald Shannon wrote:
> Patch 1 adds the binding for the NVIDIA GB200-UT3.0b platform.
> Patch 2 adds the device tree for the NVIDIA GB200-UT3.0b platform.
> 
> This is an Aspeed AST2600 based unit testing platform for GB200.
> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> differences, additional gpio expanders, and voltage regulator gating
> some devices.
> 
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
> 
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
> Signed-off-by: Donald Shannon <donalds@nvidia.com>
> ---
> Changes v1 -> v2:
>   - Changed phy-mode to rgmii-id [Lunn]
>   - Removed redundant max-speed for mac0 [Lunn]
>   - Fixed typo from gb200nvl to gb200 in Makefile
> Changes v2 -> v3:
>  - Fixed whitespace issues [Krzysztof]
>  - Fixed schema validation issues from my end ( there are still issues
>  with the aspeed dtsi file that are not related to this new dts)
>  [Herring]
>  - Reordered to follow style guide [Krzysztof]
>  - Removed redundant status okays
>  - Changed vcc to vdd for the power gating on the gpio expanders
> Changes v3 -> v4:
>   - Added changelog [Krzysztof]
>   - Added nvidia,gb200-ut30b board binding [Krzysztof]
>   - Removed unused imports
>   - Reordered a couple other style guide violations
>   - Added back in a couple needed "status okay"s
> Changes v4 -> v5:
>  - Resumed my patch after a pause
>  - Don't plan to make this include of nvidia-gb200nvl-bmc due to some
>  platform differences
>  - Fixed io expanders that weren't gated by the 3.3V standby regulator
>  - Fixed incorrect interrupt pin for one IO expander
>  - Removed some IO expanders and I2C busses
> Changes v5 -> v6:
>  - Fixed subject line
>  - Added missing gpio-key compatible type to buttons
> Changes v6 -> v7:
>   - Removed Acked-by Krzysztof

Why? You did not even give me chance to respond to your reply.

Best regards,
Krzysztof


