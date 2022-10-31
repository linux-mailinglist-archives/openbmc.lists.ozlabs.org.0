Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B824613D79
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 19:38:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1MNg3C9zz3cK8
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 05:38:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SkV5Wr/C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SkV5Wr/C;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1MN30hTFz3cG8
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 05:37:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A98876134E;
	Mon, 31 Oct 2022 18:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC48FC433C1;
	Mon, 31 Oct 2022 18:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667241472;
	bh=k6N38e70/PPX6NSRdBrUX8Bzwq8mIT6o35ZKD786iR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SkV5Wr/CIw5qdIkzVXHHGMNDEYK6AF3A4+9G8FNv2BL0f6tvVUzS+Og4VRTVFTHG3
	 4kLQ3LzO4QztxK1vubOEUvdcWI03YJKkBuh1EHqjgb7wxsSp7rijUY11KxIacjCuBD
	 kks/8F8mEaD8dojMbJeBi58ORTJ7q6t+yO1CM8iLz7msr/wMPUb8WsXRiSda6NBoRt
	 c6ftjDScW2mwuM/eO8iHhg6ysrzaSqwHDg5kpMuZdITN7lD67XmNQrOteuFJGIcHKL
	 POSbFh2b0jvLhDyDsqjYCh8IX3vz2uB3Jbm76i4IBObBsGklnRFJ5F1rQ5lGjSQyIl
	 HXhjDHrfZPctA==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org
In-Reply-To: <20221029071529.3019626-1-yangyingliang@huawei.com>
References: <20221029071529.3019626-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] spi: npcm-fiu: Use devm_platform_ioremap_resource_byname()
Message-Id: <166724147061.755330.5013073524228405509.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 18:37:50 +0000
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
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 29 Oct 2022 15:15:29 +0800, Yang Yingliang wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: npcm-fiu: Use devm_platform_ioremap_resource_byname()
      commit: 1793d36672eb8d86fb319cd28e056a154945506f

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
