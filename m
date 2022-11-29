Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4F63C0AD
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 14:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM2nV6JSdz3bT1
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 00:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nLzHw6Ql;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nLzHw6Ql;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM2lt59mGz30QS
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 00:11:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D0375B811AF;
	Tue, 29 Nov 2022 13:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D726C433D7;
	Tue, 29 Nov 2022 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669727478;
	bh=5lmvDsmsyFbaLrpBJTOOttHj9ErxrCruwDhDE5HknY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nLzHw6QlX7GQonYLknKI3X1LCTagDu62bMgPXVRKWEYrIKTtJTVa/LHNzq60xegha
	 m9DqFjy+VikUCxqdz5UqLPCjJsaeLgyM4NvZZnNWl9YiSjFpYlFUomw9nQnCF28XMW
	 OnKT/NlboNKrVjAd/tWg9kFIKhpkU3UHSHQhVWBY36oL2aYYlWqUolnq97+dEVj7zj
	 XJVnKExc4ObJPVxS+tvXkRWl0lquboN6TFG6yRThulTbwRFN4RVRolck2nES2W6p7Z
	 i+cF1EY5IOr7UMT2eaUycAcXPau+E8XCgZNpRysBq/Ii3fiHbpITDt606gP9x4zW/f
	 GUQ+aGtyziclA==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>, linux-spi@vger.kernel.org
In-Reply-To: <20221129102225.3598044-1-j.neuschaefer@gmx.net>
References: <20221129102225.3598044-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 0/2] nuvoton,wpcm450-fiu binding example fixes
Message-Id: <166972747677.90686.3189705665042127861.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 13:11:16 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 29 Nov 2022 11:22:23 +0100, Jonathan Neuschäfer wrote:
> My recently merged nuvoton,wpcm450-fiu DT binding caused some
> dt_binding_check issues in linux-next. This series attempts to fix them
> before the breakage spreads any further.
> 
> Thanks to Rob Herring for running his dt_binding_check bot, and Conor
> Dooley who notified me that the issue has reached linux-next.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Fix error in example (bogus include)
      commit: 1e2872f5912fbc87a00d00d49af98e428f4ff8b7
[2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Fix warning in example (missing reg property)
      commit: c771b4eabd6a52afff0b6f01c361a9d04fa8cd9d

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
