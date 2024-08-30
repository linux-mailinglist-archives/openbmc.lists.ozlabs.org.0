Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895939662DE
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 15:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwJnp2Nl5z3bX5
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 23:26:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725024378;
	cv=none; b=ls6WP2YLej8EAY2dLPHXBIXL/CKfjkSkrVAeOMms6SLkunBEZ2NwgL7thY4jgVoroZ12AXUwe2L8i4m+Fe2BQhcunzyd4a61ONaCIbvq8eeDdFkWPmkKRLnVS/jkluf0lefo475zRkXpJFm0CLb8yf9B35ERUb154dnkx1Dk5JY35QqBS42yTG/x3AC/qzQ8FJCOiursjqEgpDihB74e81iqPC+W0vjmHjemLld1FfaYByU/fvqYwohhszLOH0D9I+i2VC9QmUo77QYFcICCgTJdQIDpzhoA/1tYi38pPEFZF/5Vbhee2yKEdb5jBcKdbKCsrZ0SP/UtArPIAuNBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725024378; c=relaxed/relaxed;
	bh=wxoxRFhanJ/9XYDZJJGKCYI4h6SMlHLSYPn8/CXQc28=;
	h=Received:Received:DKIM-Signature:From:To:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer; b=HsXuliSHHr6RV1x/NyO0h6uFkl8qzgY3u0fu2pACpMxrEYh5KtEK6JrifPYjNVOtprmiri0DpS1y3oANiSFq7qFetC1xtz5NyHnJXM2C2jZb7EDJ9WxdgW837FSEFLWwdWQvOlNDgdtJsbSjEzd75kdqS6XEa8oiHDwGvkCC6FA7VdFkzf0nV83nzsbJo0qk6hNA8H+25lZbn6R6FZwq8g9kupzvjsM9SmL/XqWiPAFBqIEDx5RTiaufiHSnTHEDce6oFVGf4aaE6qwAygziLsxb/qjT3VjnuSA+wVrqE90wRdj/B8MKHHLgsIIufuoE7VboRDUkVyorw8B7cUjxKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2Zpe57D; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2Zpe57D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwJnk4yJRz2ypD
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 23:26:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8992A441F3;
	Fri, 30 Aug 2024 13:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B7CC4CECD;
	Fri, 30 Aug 2024 13:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725024374;
	bh=opmxZALe6MJxD3g/uFPGVChnU9jKvX+bVrQYJoBibo8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=s2Zpe57DMILot7DO4weooaHlW1tFoJq67StQ++DDAn+9h/OxVnUafi3PJ3kKvfF5e
	 5vC0YLoBWynN1Zcpi7kp8PDjterZ18O1alo2WnEM0TieKSimDyIh9uw4xuFzELWumb
	 Q2Dd4LUFuWCANZRUU5nrzJIE2d+6wcMPOqtgho7XwMVs9TVIedmOnnu8YzL3/FaJj8
	 aqQwh26isw+c50NQPCMUTMHbwqjNRIcRLCbcvJ400f1z6xhJ7DXSrGplBFmh7qHX3F
	 ycTckqUjp3E3Kl5lu3E9ULMCSA1g1Wk/4yNU95WETl4z/2eQM99I5A64iM1mfq+OLp
	 Bj4fH1ZS7FD0Q==
From: Mark Brown <broonie@kernel.org>
To: j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826132544.3463616-1-ruanjinjie@huawei.com>
References: <20240826132544.3463616-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/2] spi: wpcm-fiu: Fix uninitialized res
Message-Id: <172502437325.145364.4287067442185618996.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 14:26:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 26 Aug 2024 21:25:42 +0800, Jinjie Ruan wrote:
> Fix uninitialized res in probe function.
> 
> Jinjie Ruan (2):
>   spi: wpcm-fiu: Fix uninitialized res
>   spi: wpcm-fiu: Simplify with dev_err_probe()
> 
> drivers/spi/spi-wpcm-fiu.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: wpcm-fiu: Fix uninitialized res
      commit: 1db86650b978bf4bf70267556f6bf7bc8b2253da
[2/2] spi: wpcm-fiu: Simplify with dev_err_probe()
      commit: 196d34e2c8cfec7b94e44e75d0b1bc9176acf6f8

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

