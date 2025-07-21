Return-Path: <openbmc+bounces-391-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B6B0BBE4
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 06:43:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blnpD62Lqz2yZ6;
	Mon, 21 Jul 2025 14:43:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753072996;
	cv=none; b=Z+Q1N4wl9SNHGLpsX/vqcsuV7/rGe+A2fLra8crRZap4b5F15gE7qVSm9aEHV7vqS417zR8TkPdm3u9pOnaLn+xIDak9EV3SxKuku6j+Uc7U3dQ4hjYUmcLS3sLkch6MiIJ2kxnosQQ549aIxjhxZWkncON4vRFImvhLLgfF7m3zL7DoGrVPh62JwnXUwe0D193XwutxLWIfhRR/9Z9X9Ic1WUcu6v/LkGSO4C0TdC8MJG5H8kRA68ftIfKiwFQ/aKLu9UKJwRmHvh4+DZiBNigRGjDSh806gKDZoREVqzu2Ke3MUgk3lKviJe28YgwfQf72vR5UQrst+IKH2gy88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753072996; c=relaxed/relaxed;
	bh=fRdZNGifouDmJ2uwnu+wXzxgWMn3TwrYZoV6l/awc38=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NS1o3oOTwuTIzY/NGgWPhPin7AcaGKL115aWra00oeVjJnjLihLi/aNgmvlTpz5IOZOklss+g2LQ5y1EjBCQkDP/u5VI6tx///nNcwX/d5cQ9D7n+P5F09CPDZTZe1lDBU00XGg+C7afPtdJbf28nW0Cy6UbqN4D0VJYzYIpvUPzEK05k2ZRr/UQ/6BpoBOKiaVBRPrXbXFKzxoh7oqK6VjUhRtErP6Xucmn/aoNdO0yP+gyIi8JIEuXAE8gVo6iM3xLdl19JnsqYNFX9xV7CP9EQL1Xp28fCcmHRuNpfZFKdQ+dVCnD4+llyd0iJiczA8VKPtbKXNH24kWcAUAhFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZjEIv7Cr; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZjEIv7Cr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blnpC51yRz2yRD
	for <openbmc@lists.ozlabs.org>; Mon, 21 Jul 2025 14:43:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753072993;
	bh=fRdZNGifouDmJ2uwnu+wXzxgWMn3TwrYZoV6l/awc38=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ZjEIv7CrUvICkPHfVi3mYNahmjzC4Wru3WGkmnpvIhw1qDmCJIPFJbktFZ+KF1Bnm
	 ApWf11mPuAUJl0QIBFz9RZP1mtuSBMZWSbGAnGOAy+PywCLMVWH3wmWRLuYGG0ZVMc
	 c4X2nTwIdcop3wpwYCGkIm2vygDZAtqbEQFoUpaEM+xsQ+NHlJ2Oalg+l9slv/2USr
	 o21MRklJZZWNt7FU1B6rQ+nFgN4CNj/SHpmniWJ1krEYWR6finfZLQMm7/0FS2RNNe
	 8vhlotz25soUYPGIrhnhskCb1jtF5stVPeCtA719RqihCmL1dodwKzJCWyAzBiaHCV
	 TZlu5k6Ia3imQ==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4D0F7640A2;
	Mon, 21 Jul 2025 12:43:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250717142301.92548-2-krzysztof.kozlowski@linaro.org>
References: <20250717142301.92548-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: nuvoton: Use generic "ethernet" as node name
Message-Id: <175307299219.1632952.11825980822005039610.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 14:13:12 +0930
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

On Thu, 17 Jul 2025 16:23:02 +0200, Krzysztof Kozlowski wrote:
> Common name for Ethernet controllers is "ethernet", not "eth", also
> recommended by Devicetree specification in "Generic Names
> Recommendation".  Verified lack of impact using dtx_diff.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


