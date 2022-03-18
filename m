Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE94DE30E
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 21:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKxF43rw8z30Q9
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 07:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZXbBUJx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pZXbBUJx; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKxDh26mNz3089
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 07:58:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA5E360EEA;
 Fri, 18 Mar 2022 20:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ABBC340E8;
 Fri, 18 Mar 2022 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647637088;
 bh=dJlguLWz9Eu/tegMYxnjfLVGayVps0C/hKd+hIGT7B4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pZXbBUJxjPvbTDOofi7A65A0oJxaDpgdoSyqFMBL1b8skBA1pr5sk6EEHvwXPDgPJ
 G6aqR+QI54plcHRBllUdGK22TZLn9KHYJGRgBTFKLjGp1o1iinjAT+fzphATgd8nTh
 4s5PSbQwTsK4JASrNggdyparqjPjfJQZ2EAmR+DVGaTnNxzTQT9arnt6JCLfIEpK75
 XaDRBPZwpQCCa/FvoZKgoo/EK49xE2YokGrd4cYWD9i5LPV9LiuUnMI60pR/Cva4SW
 jvx9qTXCE3lL6xxynwVewN+nB6P7SqF8HYyKlrSJCkWG5wwpX+/XYB1lamXSvjgX88
 9VVfcePRTflMg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220317211426.38940-1-eajames@linux.ibm.com>
References: <20220317211426.38940-1-eajames@linux.ibm.com>
Subject: Re: [PATCH] spi: fsi: Implement a timeout for polling status
Message-Id: <164763708679.2336580.18094786186372148755.b4-ty@kernel.org>
Date: Fri, 18 Mar 2022 20:58:06 +0000
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 16:14:26 -0500, Eddie James wrote:
> The data transfer routines must poll the status register to
> determine when more data can be shifted in or out. If the hardware
> gets into a bad state, these polling loops may never exit. Prevent
> this by returning an error if a timeout is exceeded.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: fsi: Implement a timeout for polling status
      commit: 89b35e3f28514087d3f1e28e8f5634fbfd07c554

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
