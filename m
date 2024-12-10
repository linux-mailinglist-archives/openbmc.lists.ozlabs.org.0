Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6839EB17A
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2024 14:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6zPR04d9z3bVj
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:00:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733835656;
	cv=none; b=A0lpb3VzwufNiZahLE2yYE9P5NnWyE8+lsWdQtlaELBaRQ7Wxlv1LoTJmPti3ekq+QHTz+ostkHC1JD/CzM2KZyRs9qpPzVewmeFiz2bJRbuaDKsmNDncRgbNDRcQ/PQu12OQpO6Ss3iR+nka9OU/W9HNMrwg7kU1Jy3sDU2fc1e+4Pu9nHQe8yktnYKPSl+fjA1gId13fKbhHPCOOTFEcFW61E48qhhzZ+woytoxaLB62512RoNZDxyCQZu/heO3dWdBX02Pyapwyn5yUep6sCTFY+b4AIGha5D97DDjXA4PLLPAyf8VvraNAZ2zLNJBvMa9fInLHMzLBst8nb21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733835656; c=relaxed/relaxed;
	bh=6s1Y6p3w5g9RObkM06oK2W80+/bjnjpN96L0wHyxeJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=at4jpgZKnCXyunkn5AV/HALLkrOSQQ6QmpbgZA7s/q+TWNsRALlpbvmi9Dh+KrpXySCqTAAhBj3wh6obsVPWFBusBPW9kZGId9vCxuiX2NdICYCOSyuJgcQLkUx2q+y6c/wJNGJAS1i3xjJy5JNQi5et+iayP++inKekEkkvDbedjA+k0HHRaSx61LUSC62FkanOWPtPXrNgRuQUsj91Og2Wm7dTud50BIG4wRRw8AXce1Gb4yixkFrVmbSMo+07/+zeaOO2kTQBaFvog75vQ++D/5GQe/t2fhTbKZzz8vYek6CkntgBJ/2BL2BoqHoKWRre5o2GKfcoiPEB9YPpDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kF8HjOEO; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kF8HjOEO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6zPM08Jrz2yFB;
	Wed, 11 Dec 2024 00:00:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BD2F5C5E64;
	Tue, 10 Dec 2024 13:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63526C4CEDF;
	Tue, 10 Dec 2024 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835651;
	bh=jaThpRIjcCNZ0lQjQ42i7rnft7gfMtJKkGlTrJdutek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kF8HjOEOVQLLfosqKYy2yxSmojOUK9dE5AA0qn5ypsIUCqMuvvubvy0hKGiYQ8Xor
	 6795C5de8kjVFtlMwiiO0yvBtylBAJx9uLg2QTrUhj5LBT5gc8YXjxO05YOmVhg8W+
	 0qJh03WHF00pbCa0+Watf5W+S8lygjvV2SzdapZuYoYrn+0OOjY1V3FxUylPh8QjU0
	 tQ9Jme+ujIAPmykTpGt7yA/94UwUvxyAPnO5Ouf8L27JwQK3ismNTAfGbIb5IlDVlR
	 n239MCpWHdhRAvcEwbC2K+wkt+X/bK8qXG3Qxvsbgm9FBdOXG0wlyWlvBl9AnIxSYy
	 Fj80hDpsJ6ALQ==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
References: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: aspeed: Fix an error handling path in
 aspeed_spi_[read|write]_user()
Message-Id: <173383564913.34030.1229101307217258864.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Nov 2024 22:30:29 +0100, Christophe JAILLET wrote:
> A aspeed_spi_start_user() is not balanced by a corresponding
> aspeed_spi_stop_user().
> Add the missing call.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
      commit: c84dda3751e945a67d71cbe3af4474aad24a5794

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

