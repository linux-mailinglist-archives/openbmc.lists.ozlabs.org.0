Return-Path: <openbmc+bounces-763-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35487BEB388
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 20:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpCxX2rL8z3cYN;
	Sat, 18 Oct 2025 05:28:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760725696;
	cv=none; b=GjxBtTSS4sWoe0pv1y7Hg2gTKILC8QVyDnhYapGcDQLmWUnOxBWRA2AvYnqTX5kBYbjv0OM8vNUql04yO1hYmwuaSyK6j5oZKhGK2wj9Xt7jnjN7aiU2wz9Ub+fLr2CWBVvzmy6U5WoyxN8HfwYJo2/Joidck+7g4w1vBQhfDwIZqOd0LTLCC44KD0QnNlKfVhIhNvJTvFu5vA0BE5Hd0t6uTbn9u8hFYyiZE9dMIMrEU5J1ohTFCzkulQoEzXJS6eA2JpNF/Ulxme3skYX1BYGwByf95jZTO6y6jJe17ju1/lB2Wi6FVR1cjs/+jhifbwoZc8VRhgTAaw6ihNGzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760725696; c=relaxed/relaxed;
	bh=BOLwxPOsjvtFHK4xXIDbXSyAW1unv3Fhxpu6VBNCbOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LEr9zGEOcMK0PLYZ/nQOv6T+vFxDXID7Z2i+wYiMCR5g2aazg/AqAwx+jgerp3PmhO5axQDbDtmXxAjrv4xrPoq/RAAQ3Z4Jqian8mvGS1y7rASfB4YjTS4NUBvYuy0Fkl+bkzj+RaY+8PnYqhz+vuiyygrWcdwMaLtO5Fh/hv3YPR36ji/4nRS1A9PZ+LIc6ZNW/UA4dLO4fXorn7evO+k/AZoiLZFz10Vl8SPZqt9RYJpp1Euf1lFMZf5zW9ynOZTID/XDaV+nqvQ9UrJ/DnmHF/G37UIIVursh9oLz7+ihm5nvWaKNKi50/4f4TjcaA2jdCzvidCxmM5S8Xge0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=chBEFcY5; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=chBEFcY5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpCxW44gxz3cYG;
	Sat, 18 Oct 2025 05:28:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E55460575;
	Fri, 17 Oct 2025 18:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF90C4CEE7;
	Fri, 17 Oct 2025 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760725692;
	bh=5cLbT2X/tFBAuRxHE52sCqVi7oz0uWxIVRufr/jQJYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=chBEFcY5D6V/OVnkuwloQIaEU+vfkYkFz5RxJnY+9NXjZQ7BbJosIJbgJXDlr1bf+
	 w9+tNKVkdDG2Hw4mDY8FrQqIWm+MeuG13+meKG7tvCO7jCE47Vtny1281/zWVln8qh
	 JlxjbWX+nBAEe3wlIWdbJb/w+UXmfjVOXsS4anWyA2hr0EXJqPQhLmt8ZW7sx3A/xQ
	 gmQ1sZdw+PTM/m6osVZmGM0EWMeXwmQDGklvG89n+1xPNZdoRUxLq8YjzXCCCdiHX3
	 fKZukgNFYGNI45Qe6nXIq9hndvGxEJ6hM03KpMNwysxVPRMMXxld2w0q1ZrqjdNnbE
	 652G/X/933IHw==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aPJpEnfK31pHz8_w@stanley.mountain>
References: <aPJpEnfK31pHz8_w@stanley.mountain>
Subject: Re: [PATCH next] spi: aspeed: Fix an IS_ERR() vs NULL bug in
 probe()
Message-Id: <176072569036.192503.11424414988999143165.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 19:28:10 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 17 Oct 2025 19:04:34 +0300, Dan Carpenter wrote:
> The platform_get_resource() function doesn't return error pointers, it
> returns NULL on error.  Update the error checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix an IS_ERR() vs NULL bug in probe()
      commit: 0cc08c8130ac8f74419f99fe707dc193b7f79d86

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


