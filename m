Return-Path: <openbmc+bounces-768-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C73BEEE25
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 00:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqY1R4hZjz2yjv;
	Mon, 20 Oct 2025 09:21:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760759951;
	cv=none; b=Xkt6Ogf9z+NvsP7hthoiQYaWCykAGKyKwzcN6vCm1I2nJhzvyKrWtQJCf9Q1C1IJWx2DpdcsjGSNTtYif+DuCO/Zl7Kt+pwMu09mDyOJMz/HlSgunMqp56YOOPgEm6dHZfl+WD2pnlQ174oUXSZz/afpTmSd3mNwn0zJdXKqd7aergQefRrmJNzL+4XguCToKdWpRQX98EWW/QzdO8qhOkUp13PlPfn+DFAcCLlNmIGJcGcWqNRyUwm51zfCGmnqZCJZHgurCB1/uUu8vkMSz5krwIkjhCqNJrbs4WgfiUiqVRlkLQRNVEY+fThHa3F4iBoMpEsQVm0mH7cHCo3rdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760759951; c=relaxed/relaxed;
	bh=Qw4YXAl9CtY6hAowDvx/pdZbXjPBYE782Swc9Cge1go=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MciIQ5mgG8im8C2tSrR/7UPgVevzGHCqu6Z7vsQ0RoZbuAFUUMuTBzFouKnJAilXoAaIxKGrQYjaq1ds0Tc7aYMnYWoJ2GZBp4o/OBf5z6M6QfrR74RaubBbA0/Lkxl7L1pScSy6eZrianPTh4u+ecsPFlLLt5PQhSfz7TlXHRmdhrPbHEAkWsRtW8+AYPq1E1UqLFlnFd34vlrMDor+ov/oCAeqYjPhmpS1G1M0GrQ9p0WpzvpQ5LXICsCKuE0FND1mcGJGu7d7I6Xzxep1I3EwSIfY3kAKp9IFyJHj1jv3RxDTnqOHxDOrq/14hDMXByRM4Q5CHB5dH6yTBLl0lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krIfENMf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krIfENMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpScG4Qvxz2yrg;
	Sat, 18 Oct 2025 14:59:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 225F941B3C;
	Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E640C4CEF8;
	Sat, 18 Oct 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760759947;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krIfENMfuFjiHhOD9R6DJZJbEI9qyq58vTH4tVORoQRTS2pGY5lkJEIZDY6cO/JsF
	 7rV4qf/QB3xJavBLHP0t1tOOd2ijiKeeH7r5PBJer2K+56mKaBeK4gxS6ShjW6W321
	 VkvkNEiUhE+GJg+MsRokLA9CNBFgs7U0v7KF5BOur/qWmLZ7DKTce6BLHyqQ3UmI3d
	 h3G0koy5DXW63vce1vAszW8CD0JUM4rwNfwwIrL7aT81malR9QIBv5/P/aZVWwdmzB
	 yRQW1/nRqFaZ64tNvz5lQ6FqKOjnXl5DoM5YdsFKHtq3AqF25dzypI1i46AMW/sKZH
	 62a7C0hJMLpqQ==
Date: Fri, 17 Oct 2025 21:59:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
cc: linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
    openbmc@lists.ozlabs.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] defconfig: cleanup orphaned CONFIG_SCHED_DEBUG
In-Reply-To: <20250828103828.33255-1-twoerner@gmail.com>
Message-ID: <e88ab2ff-dc16-dab7-0ff3-702f093563ce@kernel.org>
References: <20250828103828.33255-1-twoerner@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 28 Aug 2025, Trevor Woerner wrote:

> In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
> Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
> by patches preceding it.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

[ ... ]

>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -

[ ... ]

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul

