Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863F4CBEF1
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 14:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8X4x1N3mz3bvP
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 00:33:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QNW3s+QR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNW3s+QR; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8X4S5jdMz3bt6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 00:33:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 215B9B82552;
 Thu,  3 Mar 2022 13:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F040C340F1;
 Thu,  3 Mar 2022 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646314403;
 bh=PzmD1DQl0AcE+Tk4xay3tQNO7r7M/VFyeQO/bs5i4qs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QNW3s+QRMh+TfNsAziQbGL+oxvc1NzLaH95icAinfzQGo1B+AK9FiegBrlR63Elqv
 QQGq6lk6hdNyJB8Dn+7yhbCAVBO65u1lGVIcgYpjHM09Jt82wmi2cXQY4c6mAOJLk8
 L5ppoa5dxpet8B3Z070TEWwjfw7p68+jd/En9k7G7LcgtakUGiKJ+60SnXi8r/J8oc
 cPz2Dy0yQ8NVZktakhCUIn7iJy0b4DUsE6SA1Z1HSBA8N0GAk8R6yxxjNyg2tZlRXu
 xBRc5DGW05bRokk/NnyC9ZcXhbQTq4M0nQkGdGhHqt92uiwKRJU9YeyuhtAm6BOIVg
 bCNGYR6VMqNtw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, avifishman70@gmail.com
In-Reply-To: <20220303092131.2060044-1-chi.minghao@zte.com.cn>
References: <20220303092131.2060044-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] spi: Use of_device_get_match_data()
Message-Id: <164631440076.1874006.2759123055383084875.b4-ty@kernel.org>
Date: Thu, 03 Mar 2022 13:33:20 +0000
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
Cc: benjaminfair@google.com, venture@google.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-spi@vger.kernel.org, tali.perry1@gmail.com, openbmc@lists.ozlabs.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 3 Mar 2022 09:21:31 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: Use of_device_get_match_data()
      commit: dc8fea13f98ace0ae8815dd44d1e60c184f3f930

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
