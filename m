Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDE5E809B
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 19:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYzVK57Jqz3c70
	for <lists+openbmc@lfdr.de>; Sat, 24 Sep 2022 03:22:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aB+p8r1C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aB+p8r1C;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYzTr4Dj3z2xDN;
	Sat, 24 Sep 2022 03:21:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AFB53CE256F;
	Fri, 23 Sep 2022 17:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB988C433D7;
	Fri, 23 Sep 2022 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663953705;
	bh=stMfFnVH/juCurSRTNCRk0c423DHo1u24Crm6CU1vz0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aB+p8r1CVsvPoo2lVwqArrrdiibKUjyAlj/wAgl+Q2WFLrSQyPfdtE+KLPquENasv
	 niZ31sKEEp4CTZ6Vo/foIeirjcAUYcmVH3PUej6yCrXt610wOgHFc0PrVSRs5xvzmL
	 afhJ6WCnzuakPfRpvC3Bym1mjp09VXpis8VJB+/9WLyEaCqltf83FbXqOGImvPGowh
	 ObGWMFcHTeMjOwHLi6Taze6wgxOQ5QqzY3ifq6R2AZOSEWvqgQLvIdT5I3P/BcTyOg
	 FXjRA2BeYDSqOQIWx2X0pOy9wbN+Ptq+d5ETTAV2LzQ5S1vmJuvyS6pyFlZLbxLuHF
	 gDU56aF0GF4jA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, clg@kaod.org, andrew@aj.id.au, chin-ting_kuo@aspeedtech.com
In-Reply-To: <20220923101632.19170-1-shangxiaojing@huawei.com>
References: <20220923101632.19170-1-shangxiaojing@huawei.com>
Subject: Re: [PATCH -next] spi: aspeed: Remove redundant dev_err call
Message-Id: <166395370362.637404.4217222260781909886.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:21:43 +0100
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

On Fri, 23 Sep 2022 18:16:32 +0800, Shang XiaoJing wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Remove redundant dev_err call
      commit: 04e0456f778de550a14d222d1a9ae0625511244d

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
