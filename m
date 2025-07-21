Return-Path: <openbmc+bounces-385-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20EB0BB0C
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 04:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bllQh1VRvz2yRD;
	Mon, 21 Jul 2025 12:56:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753066572;
	cv=none; b=Zt8v0g7acjdw3oh7j682reIbxFvZRqFP1WzGOZeOyJsmg9x4f1nBwTnS2uOsl6ymn6qYC2RMF3Q2XK4FNkIP+vOz0Qg11Lich3hFFsS3nXXNY1tzrq8kZM3RFgLhPzYJ08lYOEjOQhNfk2KyzdFRm9/4v9enV/+9VlQm+LB5KqjXVLIgWKtRuVA/mnTRfT7MkGOilqIduYbYjIXG2YQUiIwhg8KKUKkUCvYoo/nYiRNWFftcvDJxRP0gEBwpy7M7b50LR0nS/585G8ZiEh2u49oyn9804Kf9Lueg0ZND4K6fC6f/f1UqWnFMHN0KzQbT9OYAxVm8O6qjewMIf1lGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753066572; c=relaxed/relaxed;
	bh=W87XvFsGffB8xGXVZpZqbL392kTL9i9u0J60EHG2ppg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EyEnWfpJi3J9IdP+9SNjtqHFRLFqQ4dhh2jRS25SrsC29UrBq829pRUskgbU+VZ7z/H3OE+xHhYAc8h1OLCscST9tktK2KG2OtClHpTYEr7yk30ktJNfzJP7ToOGV8kiEn7LvPrUuqU7PbbN9GwQzIORM1gjZ9UO4Ot5PyK75GQnricd3gY+818+eexAPyLoCVLkhbOJ1m70EMYloSuIAnacK6RYIFtzsaYV+F2sfTqnFqGQ1NsLvvIBv/e7+rmsQhyNIAiSxoDGBt9/XxvN1S0TOFWWjaRWnPzkuytvBjBB2rjD5x0rZS3vUrSvx9yuibtCFXb6MhZTEONI9xwRMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YbNCu/Po; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YbNCu/Po;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bllQc0kRyz2yFQ
	for <openbmc@lists.ozlabs.org>; Mon, 21 Jul 2025 12:56:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753066567;
	bh=W87XvFsGffB8xGXVZpZqbL392kTL9i9u0J60EHG2ppg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YbNCu/PoNpFniR4YxOHYt4NjifP22P+A9DT730H05t4UKv1cctexlK91Q4ujsAeZ1
	 +PxxKnlv2m3QXa+RJXE3KLHbJr2vqKaRuaElcDQXvGFjENL4NGDoNSuKEz5fsqYF9U
	 AyNaXwUEXGv1UIkM1cZlMylaYwgYlk96Qsv5g+irUkv8hB/hWZ0CgcvX3pWDcUzCe+
	 sjwz5jlo4q3+k6JpjvKIQdyDCU6vkSoSUrytfGnx1doExXqW4rEKmv96/ZS0aGig5p
	 JaG14Uyn6L9IO6kzT4K654SFKQml9BENfSIcsusobPph0dkf6Hx7M2i3UTwNlV5Nra
	 nH5V9H6Xv1f2w==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AA297640A2;
	Mon, 21 Jul 2025 10:56:06 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
 joel@jms.id.au, venture@google.com, yuenn@google.com, 
 benjaminfair@google.com, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250706134207.2168184-1-tmaimon77@gmail.com>
References: <20250706134207.2168184-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/2] NPCM845 reset and clock device tree updates
Message-Id: <175306656659.1278425.12587512480138536293.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 12:26:06 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 06 Jul 2025 16:42:05 +0300, Tomer Maimon wrote:
> This series updates the NPCM845 device tree for the integrated reset and
> clock controller using the auxiliary device framework.
> Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
> Patch 2 adds a 25 MHz refclk and updates peripherals to use it.
> 
> Tested on NPCM845 evaluation board.
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


