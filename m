Return-Path: <openbmc+bounces-39-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092ECAB260E
	for <lists+openbmc@lfdr.de>; Sun, 11 May 2025 03:55:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw5Qy1SYzz2yFJ;
	Sun, 11 May 2025 11:55:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746928506;
	cv=none; b=UYf/OcYERPtak+A5+FcAsud02Hw6+0GUfJkWsqHCA0281db3OGAHDs3Gas1vBj0a37Fe7GdcEeOSCVeWcCyC6ZgzSRMDCLiB0VeW1enz/iKZLBmqpyXTLbi5YbYmfW+XeMjcj7JINapHF8uYp49zQovlnLu75j2nPdqq6HQG2/mJOWCkpveH46/WC9ZAIrv4+I5MS8zXel9kRuPQEtHKfPWqWCTzTPibapg4hRylXvJXjf3aLwLiu8A8tzLzsHb7x3zYC88do+fCjaLktaAmv+QlUgRHW7Fwec43jZBXYUjokoI5hAlt6CKxBb+WV+C5p5WWcLabs7rsWuk6uvNl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746928506; c=relaxed/relaxed;
	bh=DPJaUVF3ktatP0WgwPhdhHKGsbmthC5RlrEgc3XybLI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZSOIyUSVsxt5F9WXmOvl7QNnCXgckp0kd+RuOpx6U8k18OdQtjIXqhquQwlPZOiw+/j+rkZCEQep0BBGe96qxcHHwDeGrZF3ThVa1sB2KJXl7nmwkSKj+c9vVr4mrWvJJCz8AiZ4ebk3GkBFTd2Vs7NES0T4s7hef2v28VLvVj77erb874LYBgcWOOEPi4JoZnITx5H7sGPDfbYF7B7keFRlLD6Lr7gofb1IbbENuozwdarOGbampz7nFOjPOxKO5DbKfgdeAMoNiK4HC5vyl1RuJh6FL7KGFuPmmmltUERdmcM+Okub1nQxLJxfc08qZkaNQrAf3PdjDvHt5aY6mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7dVw8nG; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7dVw8nG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zw5Qx3ZVbz2yDr
	for <openbmc@lists.ozlabs.org>; Sun, 11 May 2025 11:55:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F04ABA417FC;
	Sun, 11 May 2025 01:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B011C4CEE2;
	Sun, 11 May 2025 01:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746928501;
	bh=ig4DYJ3RXrVpEeq3aerEl+Ap4/cbUODtqNdrvm1zJko=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=O7dVw8nGOAjKUBvvPSiCXB25ADmuwKNiprixu+5FFh04GZ2ucVCvxN8jFlQtEHjeY
	 ImxJlGApNuSuCtgpPcorxA+7CoZbJo6J8RF9JzivuA2wstZQ9u/gngjZH0/JR9OQni
	 NuIbGRShNPb/deGAzgu8zTrvA06yHiAAZVwOCwmQ8/4wL3Ui2RFpJEXanFKDkQ6nK/
	 XP1e12gz8+AdtJghb/wfFNlryapmHqAQbBA8DRyscCRk7coru9UYkZ0GTLlfpLAsd5
	 iX2LV4Vf/e9o4wyclhxLzZ+c93b5lWOALqlCUcfAlxmJymj60l6ewr87wcT8kXrma+
	 yNbTpHKoV8yEA==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Frank Li <Frank.Li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
References: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: fsl,dspi: Fix example
 indentation
Message-Id: <174692849876.61256.337596049686049621.b4-ty@kernel.org>
Date: Sun, 11 May 2025 10:54:58 +0900
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 09 May 2025 13:21:31 +0200, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: fsl,dspi: Fix example indentation
      commit: 846656f278e803cb60161f0cba4ee90a058440cc
[2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Drop unrelated nodes from DTS example
      commit: a4ca02454821cbc411e0bf16e527d392f188c218

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


