Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F851604CB2
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 18:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MswXn33b8z3c6d
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 03:04:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWb3o2OI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWb3o2OI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MswX71p02z2xCj;
	Thu, 20 Oct 2022 03:04:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A27F61932;
	Wed, 19 Oct 2022 16:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EEEC433B5;
	Wed, 19 Oct 2022 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666195443;
	bh=sBuvsKT0Hga4qtGfb+HfhGkrZ5WzS5DVM2fOjV7e6Uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rWb3o2OI2gQbGXRkGVTyundK95t26nvtt5VZxbZkaz7TJOa7aAUuv9vhNyHrn4dNL
	 NAA4pQ/yuWV4m/rIUKAYO/UwuzyUZZbZqj8b8AELvL1Ns6HZZ7a31YFOXp0sFSH9g3
	 NGKplUUM+oiNX8xQj6fcPrsDitt6cK/fpYFmUHc6vUqJmNpbBqxiokH0ui/i7ECArJ
	 hVe2f8uJAYWDy1ZCirliEv2sclwEAWZH2UlSwN8fnsVu0YuzMYbt4RAQrBtNKhLV1E
	 VwQwhS6mjoP7HZpRBKXJJXvPK6A/XqxobxhWrU7Dgf9chal16PqaVUg+RTMWCH8cKB
	 2Ld8uSzUtWXfw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20221016155722.3520802-1-clg@kaod.org>
References: <20221016155722.3520802-1-clg@kaod.org>
Subject: Re: [PATCH] spi: aspeed: Fix window offset of CE1
Message-Id: <166619544147.915751.17829368293456984572.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 17:04:01 +0100
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 16 Oct 2022 17:57:22 +0200, Cédric Le Goater wrote:
> The offset value of the mapping window in the kernel structure is
> calculated using the value of the previous window offset. This doesn't
> reflect how the HW is configured and can lead to erroneous setting of
> the second flash device (CE1).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix window offset of CE1
      commit: f8aa6c895d482847c9b799dcdac8bbdb56cb8e04

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
