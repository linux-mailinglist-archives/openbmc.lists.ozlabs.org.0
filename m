Return-Path: <openbmc+bounces-851-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE646C3A974
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 12:34:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Kpt0xl7z3069;
	Thu,  6 Nov 2025 22:34:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762428870;
	cv=none; b=K2WO7kFK5c2CEOnU5yWj5aShZuS/k/j4KvCK1ELpLjOqe9qU9UvyZumWNYxim3RtHeby4NPOnJQiMX0c0icO4cif4m2GmJKX98U6WdihgOvT4BF2V6RJbLKvOTUIxbvWUChfF1TGAcJfghE6duRlN4ihjTE7ErFfWVYa6F7szavTNTmvptFXKD+I9i5ge2o2lOmTPG7kuZq4/5p5BnLMqiEXFxbUd1NVkF6zWMo+zjV1M+ixAe94fKKM+8mWT1wmk9AJbHCSG78UVjVtF+1ij5vd9zVfD45JEjMmRlFwsHWCh2A1saZVFAaMzyfT+oZYd/GCrNfK5zhrFb1V6V5Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762428870; c=relaxed/relaxed;
	bh=uoAWLLaS6pd9UzlUzg92jVaWk5xwlBah0mG1uy97Rxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hp7sd7//QIzPTBb55xrMAkqxnoK97wAEZo75Vm18KEQWjRTtEORlVe1s9IdQHuDPt8hzSd7TZzKbuJygqjVNapvQwfB52sqUWfTBDL58t2NZF9+zwPaM3WLJoJEhjg+pz5OB1mRGNOA1OIPKqChutWuQmO2ExLlEE9bC2v1L8ZbmpyZ65V9DJnvPAQNqhwsZaRDVT/MUTukTC55xv1brvyAO0C+B9uauvly4a137YEJduWpfscQMzKw6xIM0JAShPHlv+HboRyCbRCTbxd6U2NrBmv3rLlS22weEfjg5ZgjL+hmWFRYkjJN0NlJNG5iQ2SrsBiYPKnI16gd+g5ugvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=capru84j; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=capru84j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2Kps1JVDz2xdg;
	Thu,  6 Nov 2025 22:34:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59C3F4345B;
	Thu,  6 Nov 2025 11:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC49C4CEF7;
	Thu,  6 Nov 2025 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762428861;
	bh=BMvBp0vVYTdKvDSUYn73f7UGpreVUIWzVn6Q8Jb768A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=capru84jwTfVANq97uUdwiKStahByghPYOfcSZsfq7pqGdSWPnZQX0ejEBzEqm/1x
	 hCPX8mxyjURRZeQDpwl1uf9BpSNKJ1k/WARaamJNL9BFjx3vl2s9Xh++0+A+nRu8k+
	 y8zVeQcnh5MAnqu0vYoTXoCpt3ZY06s9ibVXKjWU7iMpfAKiREQf55fzfeN6s+1irx
	 0QB7yl6Vg/8dQqU40OVcnTyk/g8PI3OMy88aWZgKD+j+vf0KMzJTxvqWYu1ZTw6TFg
	 PYehweac4njn/0tcc2ITP10V8kpAPZWKoOzDKTL16kRjNknJK1Em5t6ir7u66U5Van
	 uE82QDdn8kNOg==
From: Mark Brown <broonie@kernel.org>
To: joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH] spi: aspeed: Use devm_iounmap() to unmap
 devm_ioremap() memory
Message-Id: <176242885811.2357454.3184590153610422112.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 11:34:18 +0000
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

On Wed, 05 Nov 2025 16:49:52 +0800, Chin-Ting Kuo wrote:
> The AHB IO memory for each chip select is mapped using
> devm_ioremap(), so it should be unmapped using devm_iounmap()
> to ensure proper device-managed resource cleanup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap() memory
      commit: 2f538ef9f6f7c3d700c68536f21447dfc598f8c8

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


