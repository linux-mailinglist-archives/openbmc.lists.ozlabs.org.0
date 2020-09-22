Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0AD273712
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 02:08:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwM8V6MZ7zDqyP
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 10:08:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=EhjjpEYW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwM7V5gDZzDqrN
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 10:07:18 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C0A3207C4;
 Tue, 22 Sep 2020 00:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733235;
 bh=jTcLwk2meC5XIRV3w91joYvcB3r3fu8MLecHbdXctwM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EhjjpEYWVdPCF5KrCkF1W7Jduw/uUEdmwjlmXRMHe5Lp1S5FeSr7UFBOwx4UUe0GH
 qFqAnIC9cbcOe26gofFAxwsvprIJOtfn9SrShbMwiilcuupscjY84Y04poZSIVtaa/
 6FUlybf9xygrcM7rs/CJP+tU4/KE078ffrG7gYJ0=
Date: Tue, 22 Sep 2020 01:06:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>
In-Reply-To: <20200921131106.93228-1-miaoqinglang@huawei.com>
References: <20200921131106.93228-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] spi: npcm-fiu: simplify the return expression of
 npcm_fiu_probe()
Message-Id: <160073317818.6418.1783401283377039582.b4-ty@kernel.org>
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Sep 2020 21:11:06 +0800, Qinglang Miao wrote:
> Simplify the return expression.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: npcm-fiu: simplify the return expression of npcm_fiu_probe()
      commit: 4c3a14fbc05a09fc369fb68a86cdbf6f441a29f2

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
