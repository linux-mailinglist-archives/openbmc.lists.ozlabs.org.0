Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D77BA57BD6B
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 20:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp3Zg5Svhz3bnP
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:07:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXkfeYZp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXkfeYZp;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp3ZH0YRdz2yyM
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 04:07:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C90D5CE21B0;
	Wed, 20 Jul 2022 18:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946FFC3411E;
	Wed, 20 Jul 2022 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658340430;
	bh=JWV/F2msIyQc/Z1zlF2MD+qGz260XB+/zEVQWxqmxog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uXkfeYZp43MO82SDOYFRwLWvkmFoAHgV3P211bZ3qZzJai5UtdSlv+xg1NwIehJpT
	 Gb0mtHOQbP/iQ0dQ8aR90KtrFopGbwZKcWjtVGI9lXcRo/crwxx7FJVnrRmw+jm8PB
	 MIfen/dpIzvFj1KcsPdvooxvqV/xIUe2F5NE1ranFPjbxX0kMsGMoKjjrtPLY60V1E
	 dTzxy7JVw9oxI/LU7YHRPxFB3Uw4EgS+BNs0MoktWfNEHrVPEV7yt9C/XtHdCujCZN
	 3nVT6Cca5DeWs2ITNmRClzjg3p4hzNm2KZrQbfET8COtUuJHEZTl0OQoI2wzedwiB5
	 RDPvZNO87Zl0w==
From: Mark Brown <broonie@kernel.org>
To: benjaminfair@google.com, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, venture@google.com, avifishman70@gmail.com, tmaimon77@gmail.com, yuenn@google.com, joel@jms.id.au
In-Reply-To: <20220718081146.256070-1-tmaimon77@gmail.com>
References: <20220718081146.256070-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/3] spi: npcm-fiu: add Arbel NPCM8XX support
Message-Id: <165834042733.589042.2864906716831607368.b4-ty@kernel.org>
Date: Wed, 20 Jul 2022 19:07:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 18 Jul 2022 11:11:43 +0300, Tomer Maimon wrote:
> This patch set adds Arbel NPCM8XX Flash Interface Unit (FIU) support to FIU NPCM
> driver and modify direct read dummy configuration.
> 
> NPCM8XX FIU supports four controllers.
> 
> The NPCM FIU driver tested on NPCM845 evaluation board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: npcm-fiu: Modify direct read dummy configuration
      commit: 7c3193f7890a03fc1b5b979f3f8dc8750ef47b13
[2/3] dt-binding: spi: Add npcm845 compatible to npcm-fiu document
      commit: d50fef8ae939c2b50431fe6a11457e7ff85aea55
[3/3] spi: npcm-fiu: Add NPCM8XX support
      commit: 650b014facca5238e25399f28da1e59747bddb99

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
