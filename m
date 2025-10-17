Return-Path: <openbmc+bounces-759-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA92BE84E8
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 13:25:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp2YH1hkgz3cZN;
	Fri, 17 Oct 2025 22:25:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760700307;
	cv=none; b=MSz0tQL0T0mJ2MObgJoWZ1YpvuFyM5z/b54i/Qjf0peD/GaFfV7R94wEtxEM7DR3DxkXg0LtIw9JuonUynR1SaxoJQRuUVBRQtH23EEoisYQWkUVv+9u+Dte7Lqgmieye7xWpRYIYLeIK9y0q/Y1jF2Q0VrOE2UtgkNk3VD6ZeoXpbwuAd40HFsijf2ejxdpAZ8iaocO/NFQR3uwmfY+2YT0JxuM/vjabOytnLm3ah3xhWQvon5REKPSFEqhh0u5RkLLjEJ7nC0Nr/RzkicLWv9NPh9+oPwiThCjNXzjFy5AVgXFQ7inGjyHCHuY7zSFYmNYY8aJas5hU2IxPqtCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760700307; c=relaxed/relaxed;
	bh=x7SrQcEhSUYcmuUdv81JIKa1JW6QODcCoPOeMwyReHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gkw9aEQGI3tYofq1uL/aneCVJzKjDpbo6hfa1g/8XmT1xyskYHYsQb2FtKIkgJTiS5/4BeB3idZ17XcSgCwfynvTk3aAQtOUT0fPjSDZwgN+h8MbQiI4XI7bUFIaGRlr0xQaljtKODMTBVILG8BQQ9t6aV8kdoyysO4zGOs2q3174Pq0vAYmkt4+s9a+hJbh7ipW6p9nWL2+NXijpG3DoZBRrtKBkSQYH0tNXfxtUtMaqmunzaV6nREAu865SsNWsxN5tax8oavFrBC0sWQWV0nwhYksG3YWMLP3TS0ALMH7dSmXzWVJS31m/LOWE7QFIMzy8HtIvGVwZ4u8JM/60A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=riBoFF8m; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=riBoFF8m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp2YG3R2xz3cZ2;
	Fri, 17 Oct 2025 22:25:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A42841A39;
	Fri, 17 Oct 2025 11:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A735C4CEE7;
	Fri, 17 Oct 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760700304;
	bh=Oha5M5RT2nW2MzZklI9wS7QllDX3Iir9ry2TjWilqqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=riBoFF8m0IcwZ+37LWZ9Kck4w0akHJzJVv7yYIxm0Fk8dSrg4j4K38bYDy99GWGYC
	 J/xmAsajaw9OaKqCLeOv6Walg3iGIPnpzmNNxlvfiEtN0Ei08Vk5NyJR+EpnYuI3fJ
	 Isr2v7iiBXOY0NnkQ5vnwAZqrZCw3sBNRtdoI3mEK74++fQfoMOEDlDdigjHjympjJ
	 GU8vjsdfjhPmKyS3wwEWENJOqTpBy/alzbSTyXtZUn++6fZWnDqbLI2OttmDNXtoZF
	 ugApFpcYV1uHfyMll8Vq9165mHODLDwJXT4eaw2hrzsrNI3JM46p6tU5uQxhsXai0O
	 RvslakHm7ZigA==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <coking@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251016153000.9142-1-coking@nvidia.com>
References: <20251016153000.9142-1-coking@nvidia.com>
Subject: Re: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
Message-Id: <176070030059.36285.11703430965734905306.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 12:25:00 +0100
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

On Thu, 16 Oct 2025 16:30:00 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_warn message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: fix spelling mistake "triming" -> "trimming"
      commit: d77daa49085b067137d0adbe3263f75a7ee13a1b

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


