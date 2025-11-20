Return-Path: <openbmc+bounces-926-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D152C733BA
	for <lists+openbmc@lfdr.de>; Thu, 20 Nov 2025 10:40:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBtd40LG0z2ypW;
	Thu, 20 Nov 2025 20:40:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763631639;
	cv=none; b=cv/Ok0vViEAkrZ/oELQXutgtnLPcHRs9kAwgleDYcqh05qSp4bjRVn2+dXdl1CzUFswxTAkPeoEmlJoLToDBoZWQIjxkucjqbsV716zMIQmheycdCKAH921eYeVe795VkagjmswtXugOe7+Nhw7HKl/qZV69rHSK8mn9I+7U+Mzx//9Xwi+MQTzNU15zqpBcByMgW520K3bn0QNsN37rC5h2m2LRbgBLz+nsxdH+MEr9hw8lR4wQV4uMHpUFf96RSH8dseBCwdS7J3wiqiGZcN/7fjJx4CRH6CPevGbIo5pB83E3Byhm7ACFNmeWkWaUKT3fzaAJSN1xFlyMmVVoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763631639; c=relaxed/relaxed;
	bh=SUi5lS5rCzVuDAcHFYLYCYAitVuFZQocxlSp+9/3pB8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sqoa1M1SFFnoPW3eckmLKFOxQbuzzZxTwa/VvCowNov9t3kj9LYrE9v/ACO/BynOZe7IMGMajzoYX2/RXrbv3UiwTZlj58HpG0jeiaexFTX+LQmRfQiLJIeoGLqTpTf3czOeuIKgw9wCAScbyByKUzrw237BIU/ZL8aDchca1FS1mqbR8Tjq9AP5U9+ijN8zpmTxcQ6tmMCs4tbgaFSrA5Xubw5QKAthXE1TH93Ch2OcQBbsuv9DRkeLxjTnLIJO07py20hiklxdyq6XAeqaN+ucw9oSKeN97GB71vk8uG1GDO4LYA0U6bJ4mz245n7YH7XRhbI8XRrYlNfnLbQOlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8x5dMDI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8x5dMDI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBtd32T8hz2yG5;
	Thu, 20 Nov 2025 20:40:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31DE042DA0;
	Thu, 20 Nov 2025 09:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22B0C4CEF1;
	Thu, 20 Nov 2025 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631636;
	bh=d9gi6IAhGMrPheyNCbI0JonIbRfzHt0QW40OJqiT97M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=D8x5dMDI9qJnYU21qSlLei8gHq6Zp6XE3Ht93IoCv3k7PJAFzVClSKbtAgejBTKQ9
	 Mlfkw1A7ZzKb+RXGRyRjn44BAeRKBXZkSIw6dDMVgPLcb4V86Y6I7sMSO17zYx81q8
	 Lb5p2niv4ymriPG4Rh4qDWJUCqR3AXLPVdGP+enV5nTKiKhcvUEMsjwNR5IxksI+iI
	 pOuGw0lIbm+/s4GAY7s5IaveZtqiSuhHzrVxN0SfktEXbcH3diGb4+WggKOSWAetV5
	 hJZhfgmu6eLjeVPX9gEw+PGJqSjehjYiliL4+9+a0TF+R5/jlR0BSczu8Z2OYlYOdh
	 sQ3lludhl8vrw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org, clg@redhat.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, BMC-SW@aspeedtech.com, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH v2 0/4] spi: aspeed: Add AST2700 SoC support and Quad
 SPI handling update
Message-Id: <176363163164.560683.4991477364624751148.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:31 +0000
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
X-Mailer: b4 0.15-dev-a6db3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 14 Nov 2025 18:10:38 +0800, Chin-Ting Kuo wrote:
> This series adds AST2700 support to the ASPEED FMC/SPI driver and
> bindings, introduces 64-bit address compatibility, and improves
> Quad SPI page programming behavior. It also implements AST2700-specific
> segment logic, where range adjustment is not required because the
> AST2700 SPI hardware controller already fixes decoding issues on
> the existing platforms and adopts an updated scheme.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
      commit: be6671d3908e97a2128f5327610a1dcb4d420cfa
[2/4] spi: aspeed: Enable Quad SPI mode for page program
      commit: 716d0a0a2ab00c601120c19bb357f4373f4722d1
[3/4] spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit platforms
      commit: 508f3d3b688e1650ed383fe208b323aa6c164420
[4/4] spi: aspeed: Add support for the AST2700 SPI controller
      commit: 9e510e677090bb794b46348b10e1c8038286e00a

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


