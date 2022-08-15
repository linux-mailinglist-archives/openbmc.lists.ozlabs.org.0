Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53D593253
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 17:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5zBR2Nw7z3bl4
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 01:45:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ETeBHPMc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ETeBHPMc;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5zB404N2z2xG8
	for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 01:44:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6400F61132;
	Mon, 15 Aug 2022 15:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BECC433C1;
	Mon, 15 Aug 2022 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660578297;
	bh=OkFapyn4xOtZLGADcDAUVjgBIurU3qGxIAY1Mkf6qoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ETeBHPMcFW3ZDtXQq936zJ20nAAFxeqmLmaRBQ78pLjnmCtE+wKyAxpr/vEsbTF32
	 U6alnnwfxlxSjV0KG/bUUB+PkFp5Hyjc1sEmQZhTZ+YaEwrcsqJMQwAcI/A+b8j8dN
	 CwzmcDtCRPQCzHSdBEqd2FloiDNc6hjuTt3fgCxCYHjAw7ZdEutqYvWFOoxpTzmqTC
	 +NV2Szgwgp47qSg477gWDW05sQV0bYufwwxhc7I70kLH6cFPOV1u6AGN346hRU7WTL
	 6f57hy60QsKe4PF2JAVwnWRAADqEgrqMGd0QE+t3O0TLVjFnw0/sE/v7A1G3dfgZRB
	 wSREOaVjJMj5Q==
From: Mark Brown <broonie@kernel.org>
To: venture@google.com, avifishman70@gmail.com, krzysztof.kozlowski+dt@linaro.org, Tomer Maimon <tmaimon77@gmail.com>,
 yuenn@google.com, benjaminfair@google.com, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au
In-Reply-To: <20220722114136.251415-1-tmaimon77@gmail.com>
References: <20220722114136.251415-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v2 0/2] spi: npcm-pspi: add Arbel NPCM8XX support
Message-Id: <166057829444.697678.15497743196363589755.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 16:44:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jul 2022 14:41:34 +0300, Tomer Maimon wrote:
> This patch set adds Arbel NPCM8XX Peripheral SPI (PSPI) support to PSPI NPCM
> driver.
> 
> This patch set was separated from the full duplex patch.
> https://lore.kernel.org/lkml/YtlES7MX6nJr8l+L@sirena.org.uk/
> 
> Addressed comments from:
>  - Mark Brown : https://www.spinics.net/lists/kernel/msg4447178.html
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-binding: spi: npcm-pspi: Add npcm845 compatible
      commit: ac2c55e2260e0ae019119e1b2a52dda138039841
[2/2] spi: npcm-pspi: Add NPCM845 peripheral SPI support
      commit: 6db8595a3e1996654a130760d363912cdd28706d

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
