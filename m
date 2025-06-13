Return-Path: <openbmc+bounces-218-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F6AD992F
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB53YVRz30Wg;
	Sat, 14 Jun 2025 10:41:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749825624;
	cv=none; b=i1E2bfk2wig5+2eD1aVFzbB+AhkzUdi3jYzf6TMUMfVG/xa34c9+hrxm770J+0Z9UkfxmmvNpCFXgv6D9mnxxZM66dMXBj4oeIrEDgOzu0HHTAntu/NLiG4Hvhm9me26aL24FfTNssc5ngza3IFbwf7iCbqyhfc1jRgxbeJTQx6CQ9c+2mtnmxgeMuqKhYqYhO+BKwgGltHvGCQDigIoXp/d07PkhfWq673zqQzyWTt+2SF0FHloIR1nroME/Iiv3gDibHcoWgn6fgPZIfAgqCWHdUgvsHiXC3+lrUPlosy6cpP1S0ybmO2etnI4+AYQbGZsaWjfQjCzmImbT9sV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749825624; c=relaxed/relaxed;
	bh=VuR6btE3I4WqOsfrktVz2YWBBB1Rx35WzY0bJtV429E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQxutlk4Ib27Prq2aWbze0dZDbXxqS1SS0aT5chZv2zkmY73JlV0Ymdl8+JUhS1h0dVzP7yI0S2sEoSsJ/aJgtHx6m+XqGXHsHJAkWGYbmxAnWYGhMZ0PfDMbB74OwLyAIsAwe5M3ekd4jldRoEaNEtAv1fd6EtSgamI+Cvv1FZXjdvyo/NPwSoMUICqlhUZ017bopTfudFI/rupdVIl7B5wcoL0H8fIf3NUUN42f7wVvahKBl9b3OOOHMFiS6MAoVXdRPSUBfxrriogMDOc8TWs9ocTSV0xBc3NdtUZ2EWaG3ky42NaX2fvUMwvcPwwypQTCASujiZYUo8LHQAJHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d5+6qd3P; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d5+6qd3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJhrk6Yhdz2xKN
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 00:40:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85A744AA49;
	Fri, 13 Jun 2025 14:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4BC4CEE3;
	Fri, 13 Jun 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825620;
	bh=ITZFyS21U+zCOStvhgK2RHhgm5QwQidWMeeety/ts8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5+6qd3P1WztJuri2EhMxUbC311PrDjV6+k7vmYn5h9vsxp9hWZmJ3UByPxlb6DIx
	 rheKtGV6B0v7/rTXW1cEwu2QwD0ggEKqEje7dGOcyg/chHtMvq0rRhoaljeztbANlz
	 LGocFuU0OX5ovZ9PJ20vb4mbdA71niDR2s4I6RonOo9tVOClMTh8k3LYSLbqPIkQ2p
	 /4Smqm/74Jc73703K3dngeLNzy9mTCQ2c8ClYWV9wuGZ9+g0MdOZf6PuVnnYbdzWt6
	 o6JnIrM0lkPjg27vCTy5W1Cmx3M6Xe6eu2fEKnD7WElgytQV/Gp1gTvR+DUd1EhXMV
	 s3SA2Iysdr5PQ==
Date: Fri, 13 Jun 2025 16:40:11 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Message-ID: <lekcp6p4s5hbkrul2aq4ukmc722qajitvpxs7mtrqg5nlmfxd5@b5c7zzh2lb5u>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 02:33:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Marek Behún <kabel@kernel.org>

