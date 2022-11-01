Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24B614C26
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 15:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1sC72t73z3cLg
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 01:01:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d3YYLAN0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d3YYLAN0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1sBX0M3Zz2xHT
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 01:01:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA06D61180;
	Tue,  1 Nov 2022 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2EFC433D6;
	Tue,  1 Nov 2022 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667311280;
	bh=RD3zDXZORzadwG4reIR2SnRJBDaVpJJ17YfcdVGD0Bg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d3YYLAN0M1oRva3/mj4K8WCUh1ynJ9yImsa+JIx6xjy/1UZsDWXD+l7RWnftf3R0v
	 1LLCnef0fOKPIUS6I6/q3PUIVPhgRg+alZ161WyN+5xbvMZCgD6YuwVG4Fa+4TyOaE
	 KiAuG6IOC3IqeoGMgh9AOKbIBBWWvpN2uY/BMzR5lNEiO0KdCS1yqLHbJiN+ylrzpM
	 CJh/C0hR0oYtM9/HrV6uS2PoKFyEL31ouSPEExufWI9Jgq34US6fS5VIe3XGXbzAFN
	 PPsIUSESZiaj4uy0zVlv7YD7P2VQ7eIkqge+TvsQZtAttl7+ZM+c/dTg2rRkPHcVrF
	 2WGEi6SFXko5g==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org
In-Reply-To: <20221031222559.199509-1-j.neuschaefer@gmx.net>
References: <20221031222559.199509-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,npcm-fiu: Change spi-nor@0 name to flash@0
Message-Id: <166731127749.225279.17257134462674801102.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 14:01:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Oct 2022 23:25:59 +0100, Jonathan Neuschäfer wrote:
> The node name for flash memories has been standardized to "flash@...".
> Fix the example in nuvoton,npcm-fiu.txt accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] dt-bindings: spi: nuvoton,npcm-fiu: Change spi-nor@0 name to flash@0
      commit: e8d6e1dd609696128e646a8c747b0f3fb1e02545

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
