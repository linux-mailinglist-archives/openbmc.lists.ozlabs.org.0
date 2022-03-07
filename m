Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E24D0898
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 21:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC9Ly6W1Lz30jZ
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 07:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fli1cHh/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fli1cHh/; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC9LZ0b0Dz2ymb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 07:39:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 170556151A;
 Mon,  7 Mar 2022 20:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB51C340F4;
 Mon,  7 Mar 2022 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685586;
 bh=6Lv7X6cEyhJiRnzqWJw0WxCSP6g9ZNGOQU0y2bDaPZQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fli1cHh/Ygj19UNnJtXYT4hwxr8Z/MXW+tBDlY/0D0fFdR4+WsIaHQQEVDK9tnOEM
 /ffMhKriHcFK0DQF45hdjCEIA64aW0FBmPFWwQCJ7jpW56t8NFZxX13X66GZ6LZsS5
 HaTxrStzvRQFqiufcoaF85q1/KSHEJmdldIXv8T5ij4uMjH/BZY0/GeoOZd5ex+qpf
 BjDpDcbZQzz7WV0XMHQ7/RMYoYtxmGowRqpUg/OhcdDkO4I0sI7sBDJ9rBz3r5W0Jv
 +yOXdqiOn6bqH/461DAD9bwPeACbNDTYlu+QGen74/by3DZuAyGbxT2vSQ46XCwkNv
 v9SfXCGESyN7Q==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>, linux-spi@vger.kernel.org
In-Reply-To: <20220306142312.109017-1-j.neuschaefer@gmx.net>
References: <20220306142312.109017-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] spi: npcm-fiu: Fix typo ("npxm")
Message-Id: <164668558469.3137564.11739196623813186789.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:44 +0000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 6 Mar 2022 15:23:12 +0100, Jonathan Neuschäfer wrote:
> The platform is called NPCM, not NPXM.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: npcm-fiu: Fix typo ("npxm")
      commit: b15e3bc76925eb1366348483fca89f115c8cde31

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
