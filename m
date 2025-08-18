Return-Path: <openbmc+bounces-474-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13ABB2B27A
	for <lists+openbmc@lfdr.de>; Mon, 18 Aug 2025 22:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PcT05lmz3chg;
	Tue, 19 Aug 2025 06:35:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755549352;
	cv=none; b=dDOiOKzxI728qTPE2kU/lq7LM4Mwk0rs0ZFcpFUynfZnMkgJpfWeMTsXYjXlEs7BBzjY+qffKBmVTRqJqPx9GhQv2o5H5BP0X4e6eud1LTmZVq0Mc5A4viNJ6jYY7HUr2BQakkntSN+eOMHGKfPdnFlAhKt9O9vLxafXIO1ZVGdeSuRF+qyBMii25nnwrZUAY7Dr0ShoJPdoG+rOUtYY5Vq4aOgW6TDwGSifb1ogYgVJmRPNtHS/+WEt6iDUsGTbPbMay3Ql07kwV9NwwJCjo6IeJUOvLSjThwG7PI+MM4GfktVCTu8TxCU9/DRwf3ubUa3ATjvE7cL3oeGb4g47dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755549352; c=relaxed/relaxed;
	bh=zPUrzVX19GqRWO8uuoQNdQgJkUoqWb0AZHWYn8BOOuo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BI5n0SPyAT9ENCj4fSoMyJVyelfWxspNe1e2/qXIVmKJGx3+SBLyNhQv1gNRihLa9rM6ucDzf6LKueljmoMsHF6AHJJbTk/4/PVzKW8POO3jd4rbVXvxgx+lVDHX6Fd8bRLri/4AnBXauSHa2OvNsyZjTnUTx3LU0d6r5WQ0tf/ydhG6u0Xen8Q0yQ6JKCsfwhb0FRmWhwuGx1q0tWbVM4vwHSsRMBxn88DQjUSGfPrEGh1qba+R9qjDLbYTx/kwm0UlwaFo+H7oJeBxCIvJG8wA0lNkTkIwhGuOL1iUQjTqq5If42Qh2EV9jR521r8CfEU56v4T/ZI0eB8Apkuqsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uQEVHSl+; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uQEVHSl+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5PcS1ftZz3chZ
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 06:35:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5EBC5C62C8;
	Mon, 18 Aug 2025 20:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1177C4CEEB;
	Mon, 18 Aug 2025 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755549349;
	bh=om2cfshnlMUz7DuvRjvZA14In9sewmxBtmoNs13zHqw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uQEVHSl+duq+dWLUD9eW7eVtnhv2PmtTTxGShiVKLaoXm1AZwNzmFVVwBWbNLfnKg
	 94Rptxkq/91UxwElGtWNKiw3S7i/v4rMR6FWZ1ZU6f3UTJDV4YDtGBJ0ulG1WCgOz1
	 DSfa1jXtrrqlrbJE3cTEvmqjW4E2SWvBobJJfxl9qWfPRA16kgHJSoJ3jTGBtyUbUZ
	 0LNddIr0zP9JhbNdc9h62WWL6M/vUZYDls/huH7FMIPUj5utoSBbq8q1m+fUwsl8aF
	 N8Sv1p/4cz8QAo5VRqq6szY9e76eJ2vUc4mEZbqVB2J7MYIXScGH1mPu08d67/1H49
	 XmSHZe5KSNIgw==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250815082118.586422-1-rongqianfeng@vivo.com>
References: <20250815082118.586422-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH 0/3] spi: use min_t() to improve code
Message-Id: <175554934664.130972.8355246635589446804.b4-ty@kernel.org>
Date: Mon, 18 Aug 2025 21:35:46 +0100
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
X-Mailer: b4 0.15-dev-cff91
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 15 Aug 2025 16:21:14 +0800, Qianfeng Rong wrote:
> Use min_t() to reduce the code and improve readability.
> 
> No functional changes.
> 
> Qianfeng Rong (3):
>   spi: spi-fsl-lpspi: use min_t() to improve code
>   spi: npcm-fiu: use min_t() to improve code
>   spi: spl022: use min_t() to improve code
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: spi-fsl-lpspi: use min_t() to improve code
      commit: a750050349ea138e3e86c66a8a41de736619b9de
[2/3] spi: npcm-fiu: use min_t() to improve code
      commit: 1bdc716023a78c2c41fdcb3fc37f09da1be4b7df
[3/3] spi: spl022: use min_t() to improve code
      commit: 90179609efa421b1ccc7d8eafbc078bafb25777c

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


