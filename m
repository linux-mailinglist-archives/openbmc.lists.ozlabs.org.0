Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C96183E2
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 17:13:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N381T5tCxz3cLJ
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 03:13:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YC0IJl6K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YC0IJl6K;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N380w4hlzz2xJ7
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 03:12:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0B722B828DD;
	Thu,  3 Nov 2022 16:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ABEC433C1;
	Thu,  3 Nov 2022 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667491946;
	bh=rxJ+PEuX4lEDxQLdMP5WnH8IwPUpq7Xc+dBWHGFGPoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YC0IJl6Kz+an28MXCqym+l2SQHVzJZ8Fonizg2bqJ0/0YzcAKZ2BYFgZ3VRA1NWKq
	 INQTFPEauhFCx79o/y6Cf8g59EeWsc6VykrbiNWlESu7JjtljKWvaS+mA6KzldSUkN
	 t3glByYfEETLGdLxH5FJiHaECJeHqLQJcg3UKkeZ8uIBPtRN7ZeRPszCUMszOdgiYP
	 MNSF4dmKIyg9bSfGfl14mSvLn0rDIwlmUG4c4s/fRc3vgdcAxxYP6/oKSBhsvVB5sg
	 kqYgh7WGzgHxkI2adwUG1PrL5a3B9PWIlaQAsDY/GYUUgDPVK9nxVVUahh/2a3lO+L
	 Igv0FqX0oQ6uA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221031233704.22575-1-zev@bewilderbeest.net>
References: <20221031233704.22575-1-zev@bewilderbeest.net>
Subject: Re: [PATCH v2 0/3] regulator: Add DT support for regulator-output connectors
Message-Id: <166749194409.389017.2951606632954136901.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 16:12:24 +0000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naresh Solanki <naresh.solanki@9elements.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mike Rapoport <rppt@kernel.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Oct 2022 16:37:01 -0700, Zev Weiss wrote:
> This is v2 of my recent series adding support for userspace-controlled
> regulator-supplied power outputs [2].  This is an important feature
> for some kinds of BMC (baseboard management controller) systems where
> the BMC provides an operator with manual control of a set of DC power
> outputs.
> 
> As in a broadly similar patchset that was recently almost merged [0],
> this takes the approach of providing support by extending the existing
> userspace-consumer regulator driver.  A couple questions about the
> userspace-consumer driver came up along the way, however.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: devres: Add devm_regulator_bulk_get_exclusive()
      commit: fd1845069711cdf1b1aaaa0f22311b7736396331
[2/3] dt-bindings: regulator: Add regulator-output binding
      commit: 14b8ad4c2580231fc45c2313ef822a15bb12f63f
[3/3] regulator: userspace-consumer: Handle regulator-output DT nodes
      commit: 5c51d4afcf3fd36159713556402e16cfab794ae9

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
