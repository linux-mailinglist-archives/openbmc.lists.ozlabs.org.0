Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEA51AFD5
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:55:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktpxf4Lptz3bdR
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 06:55:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QzjTRmML;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QzjTRmML; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpxG0Gmyz2ynk
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:54:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D890EB82989;
 Wed,  4 May 2022 20:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C8C385A5;
 Wed,  4 May 2022 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651697693;
 bh=iA5vkbIA9NTfenOG2m2/vpIGFQLXt9XVSFrGul7+NgI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QzjTRmMLh9jv8SZCbzxSgPezaKMtprLp22u3Hq1AbYlF/cRxSdYeyG5TX6gIEZir/
 jVZoqB4db39gbYZPUAaKOR2oB95eElBP9TxLQSns0Q8+pAwx+uO/to8MvjYaVEp1Wf
 g6SyOQM31v0iR7NoZBao5GJQNu1w4CkZoirb6YHZQWW0bHImIjQRs5q5pOxJZraf54
 akKEK7YagoBToxv3YjwBiSJq75EaI1rcnlpdR8dcCFbOBrJLs5qwg/dBoWqq07ueRu
 50YHU6IhIbBIjt+3bu+KSGjic89FHXJuuwrKkFXbFYTYpIRK0kgCtEoobRMrU0HXPO
 3KMFh04Ed13yg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 zev@bewilderbeest.net
In-Reply-To: <20220504065252.6955-1-zev@bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
Subject: Re: (subset) [PATCH 1/6] dt-bindings: regulator: Add
 regulator-external-output property
Message-Id: <165169769164.1749555.12170259506910526602.b4-ty@kernel.org>
Date: Wed, 04 May 2022 21:54:51 +0100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 3 May 2022 23:52:47 -0700, Zev Weiss wrote:
> Some regulators do not provide power to anything within the system
> described by a device tree, and simply supply an external output.  The
> regulator-external-output property can now be used to mark such
> regulators.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/6] regulator: core: Add error flags to sysfs attributes
      commit: 0f2d636e7d1fd76f704dd3ea5089ce29a8aee049

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
