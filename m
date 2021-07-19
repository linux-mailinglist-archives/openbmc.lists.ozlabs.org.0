Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC073CEAB0
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 20:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT8lZ3XnNz3bT3
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 04:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TcFZvwR4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TcFZvwR4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT8lJ2NnVz2xb6
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 04:00:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFC1B610FB;
 Mon, 19 Jul 2021 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626717625;
 bh=JWq2f6zNmXW4BeuCzn54AbgPD0+ZAm0TjMTAxYtV9WI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TcFZvwR4olyw/rrNp+dglf+As16BA6AgtlpU9jbbv1IdRM67IVAUAU+XWWQxsFlmW
 SF1Q5vVrYpa+fN4Af8orQ5P0wVwwGI4DfKmHKSJaWTy0aRl4nZoU2ssZbNUEaV1JSq
 IxP5UIhIZmBaicQX7B98EL7d+YRt2FGtVMtqn6nuMrTsfn9ifd+J6QaSyAko/RWPCE
 JlpIwCNAOL1ncwHYjCns90XOsirn4UzDhCqlL+Z8YFnLxdl/4kWny6Ary47csLHBbQ
 JdGJ2HjxZZGbo+y8ePkIj/Tk5YZ5wFFTVCwAtjJ1GlYk4KQuBIWl3aabc9hN+tgolR
 CCOxjuKRByLRQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 0/2] spi: fsi: Reduce max transfer size to 8 bytes
Date: Mon, 19 Jul 2021 19:00:21 +0100
Message-Id: <162671570469.34697.17687227058188572653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210716133915.14697-1-eajames@linux.ibm.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jul 2021 08:39:13 -0500, Eddie James wrote:
> The security restrictions on the FSI-attached SPI controllers have
> been applied universally to all controllers, so the controller can no
> longer transfer more than 8 bytes for one transfer. Refactor the driver
> to remove the looping and support for larger transfers, and remove the
> "restricted" compatible string, as all the controllers are now
> considered restricted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: fsi: Reduce max transfer size to 8 bytes
      commit: 34d34a56a5ea1e54a5af4f34c6ac9df724129351
[2/2] dt-bindings: fsi: Remove ibm,fsi2spi-restricted compatible
      commit: 2b2d4dfca4e7cb6de70985b1579a6c08c027b8c9

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
