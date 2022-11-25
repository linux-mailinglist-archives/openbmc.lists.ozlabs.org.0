Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B336638CD6
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 16:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJdMg0lkFz3f4p
	for <lists+openbmc@lfdr.de>; Sat, 26 Nov 2022 02:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKMnTL5q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKMnTL5q;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJdM70l5sz30Bp
	for <openbmc@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AB1ABCE2E4E;
	Fri, 25 Nov 2022 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C64EC433C1;
	Fri, 25 Nov 2022 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669388397;
	bh=r7j/KqFohUwAcs2W4hrpDx/O21av5DhhKkqig5OLGug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DKMnTL5qkYC/euvVta/XjxcmHnZu6wPHuLaOhXm7vcHHkiQksS2//WMfLxePDLFDP
	 OaWa8ol1QS1gr/hUwsSUDxG+I10oS13wJSzWRWukTokN8JPFHF5cd+0jU7y7ycQ7ZL
	 bd78oZD6hPEjAX/QLNFdqXi2JgqD5oTnS/P29vT60voF+lxutK5Dy0DlN1QRkgSSD4
	 x+M5Xb4xpPF7wBnLyNGUre6/ekIt72zZnC11KfIGAiunccrH8wPh2pBTUliUAUQWoK
	 Bfdo23hZKzCR9zv9vfhMIIKkF497DPIQmRlFD9K65Vg6TQNr9iblS6ZPVgtSSiUEvh
	 t7BCQIEj+K7yw==
From: Mark Brown <broonie@kernel.org>
To: openbmc@lists.ozlabs.org, Jonathan Neuschäfer <j.neuschaefer@gmx.net>, linux-spi@vger.kernel.org
In-Reply-To: <20221124191400.287918-1-j.neuschaefer@gmx.net>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 0/3] Nuvoton WPCM450 FIU SPI flash controller
Message-Id: <166938839614.724738.3789873339009050726.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:59:56 +0000
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 24 Nov 2022 20:13:57 +0100, Jonathan Neuschäfer wrote:
> This patchset adds DT bindings and a driver for the Flash Interface Unit
> (FIU), the SPI flash controller in the Nuvoton WPCM450 BMC SoC. It
> supports four chip selects, and direct (memory-mapped) access to 16 MiB
> per chip. Larger flash chips can be accessed by software-defined SPI
> transfers.
> 
> The existing NPCM7xx FIU driver is sufficitently incompatible with the
> WPCM450 FIU that I decided to write a new driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash Interface Unit (FIU)
      commit: dd71cd4dd6c9bede8ee8277d650fcb9c1b12702c
[2/3] spi: wpcm-fiu: Add driver for Nuvoton WPCM450 Flash Interface Unit (FIU)
      commit: 1f8811a2613ef9e233d56885a19dd4c6e81a5d94
[3/3] spi: wpcm-fiu: Add direct map support
      commit: 9838c182471ee5532824bae7f2669d3539719f78

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
