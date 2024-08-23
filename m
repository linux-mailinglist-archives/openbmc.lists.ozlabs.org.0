Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5895D967
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2024 00:57:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrFnw63Z2z30gv
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2024 08:57:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724453841;
	cv=none; b=LnH225H2vRujj/kFdT04vyNyrcnZexkNLAr1/DqSOgozQAdiT2dIew0Xs9Ko1NhBsVmvESjPj6UhbvgAcVMSW0379dm71cosQghXvHKDmq9LHqiOVn5sTA3fJ7CwHOTsVV8taBoUT92c5YnO4dnXE7Skdz6VmNGsTyP1JmUvhkqGRwveHlUqMnk10GQ/UnIwi6qnz+E+r6tP0NXqMB7sZqjgecdhMsX+/5GJIZiccMPu8Uqb1WnQclNqlFUll0sOyIyPvcorsqHqcWT6azMyGCDSWS+WTALXLVC8r/OaBFcW6yZAyTD3heJpd/7ul76l3kwnYiQuJ24XgV20wLLmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724453841; c=relaxed/relaxed;
	bh=GqBUOIdtqPf1BOKy4htMX5aq/A/g5IlhJoXSUs/XlnY=;
	h=Received:Received:DKIM-Signature:From:To:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer; b=ADmBhom16IjLPCiwp7n52k6EiOIjdOAa0yIUgNGfReIBpxvFaTWqiiV/VLzkbOoGN6kcm47g44a8dvNumiKxHyBzWyaov/ILz69kedtIf+4F76jiJ+Vjl3kVD6njwyaw/nioheli7prHOpQBVaDiRrP5Lufrj5WtmbtT7qEYpjPPD9QqE62aiUaQa9O7h0/ZhOeeNUTG8+ZNVabCVZBly+LtE5G7NUvzsrGg9WzCiVlaEqZHyNJPOc7hBd9kjMH0MxPDg555vABeaEaF0sPxYJqvRHD1Q0H2+EMFMBzVPYv/E1cp1Whp/w+joYCUOnbppBq5CERVUNmv+kqml0xNGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DuB06APX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DuB06APX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WrFns3nXfz2yXs
	for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2024 08:57:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF17DCE116A;
	Fri, 23 Aug 2024 22:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10BCC32786;
	Fri, 23 Aug 2024 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724453837;
	bh=5re0XXR5mMdIdi6tFfPqPdlxaclMxPhMNEH4/z7dZyY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DuB06APXyTAKSMi6OlPwnSqwvvVomlNUhFx7Y57PGJc1DYO59tBWOnJWLBFt+Xy/L
	 2F2TWlU52hNiiswGvB26J+jlKZNWarQ4jrs4bTKJZD49XvR5v2a6cMkYdv8a6vicla
	 YtdwPxsS1ZFJuHTIHbeDp648kMZMAfF2IAA/ZsGDRsXaPmnoOYU4+rhbBGLFPToaWC
	 JZI1NxGzti92u8fuGKy+K7mDCt/yp9xD9N9Ll8RqEQxhWUi0OY6rVvVl9LlYWif+Ru
	 hrKGk96uk65pYwS1tgKxzyMab/Ev7zh9rNlfZ+xYpEp7Ei97s8FIJ+L8KZRsU8SCRl
	 86VOZFlVCGBVg==
From: Mark Brown <broonie@kernel.org>
To: j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240820123518.1788294-1-ruanjinjie@huawei.com>
References: <20240820123518.1788294-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] spi: wpcm-fiu: Use
 devm_platform_ioremap_resource_byname()
Message-Id: <172445383531.842317.17431935290870556217.b4-ty@kernel.org>
Date: Fri, 23 Aug 2024 23:57:15 +0100
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

On Tue, 20 Aug 2024 20:35:18 +0800, Jinjie Ruan wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: wpcm-fiu: Use devm_platform_ioremap_resource_byname()
      commit: 3bf2a5359b0bde22418705ec862ac5077312e4c2

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

