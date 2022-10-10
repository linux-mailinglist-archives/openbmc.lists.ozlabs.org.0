Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4605F9FF9
	for <lists+openbmc@lfdr.de>; Mon, 10 Oct 2022 16:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmLVZ4bhSz3dqp
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 01:13:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rS+ol3nl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rS+ol3nl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmLTy03rcz3bjp;
	Tue, 11 Oct 2022 01:12:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F305260F5E;
	Mon, 10 Oct 2022 14:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F16C433D7;
	Mon, 10 Oct 2022 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665411170;
	bh=i+nTuecqo88xOxtIonJejeCxD46J/wAXbJ3XX3wP5tw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rS+ol3nlPgDNrGzZR/PNfnMdXZvGHsaHmgOA1Gz93bGvDnK2IhTxXPVHnLnqDMUE9
	 o3/AC4GtBt9o1NJGSx4URHMVdqxp45kb0Ts2HUSv6v9J2UC5ZH/BTwnx3jJ8hjjAOG
	 +7lITAlCddVy7QUyGqcJ62avRFPaI2Ou3ftEyKoCUBWarFM3c4+Bo1U5lxkUzDYVRQ
	 2Hd05bSUnsor230vY1GU7p/eMlUiVRbLpT2+ftdoKumEnRv+u3jBcOq25Djgd7iVCj
	 yDkZhLDnD4XDs8gdt65kMgMkSH9cP9HkzwBdz1mLpXGITPL1rGoVOjFudiqGbUvsJK
	 YfK5xEFuNf1rg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, clg@kaod.org, joel@jms.id.au, steven_lee@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20221005083209.222272-1-chin-ting_kuo@aspeedtech.com>
References: <20221005083209.222272-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [v2] spi: aspeed: Fix typo in mode_bits field for AST2600 platform
Message-Id: <166541116820.121778.9566592036880610465.b4-ty@kernel.org>
Date: Mon, 10 Oct 2022 15:12:48 +0100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 5 Oct 2022 16:32:09 +0800, Chin-Ting Kuo wrote:
> Both quad SPI TX and RX modes can be supported on AST2600.
> Correct typo in mode_bits field in both ast2600_fmc_data
> and ast2600_spi_data structs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix typo in mode_bits field for AST2600 platform
      commit: 5302e1ff315b40dfc9bb3f08911f5a788cc1de01

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
