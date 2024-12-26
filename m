Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 403539FC714
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2024 01:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJVV8502Pz3c5Y
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2024 11:53:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735174381;
	cv=none; b=Sj0XG9tq7hrNEs5ablR6sZc6FWMuoUMeP7DM5bi/LvOTj5L6A7lfaLncIYCXDQ6XbtTCVPKFISgbqqUuKMADaN5ao+HlxwuMGapH2El/dyrzQvFO9M9jMQ/zvSHiOgnv3UB+/87dn9QAI0NWPCp81vkKD0fF8PrORv82uWKSIyKdhdJPAz6xkwqg+YzYxJ40Ix22ZPuuZPW7qJ17yvFhHrHq394azxNVbPEqpdm8ZjgexppIG/vOXa3x8+uR3O8vlCiVU0JAqavZqDopXfBeyJIoPaBbcAboCFQHf3MgqCK+y+jMYWul0fiIaECwHQyYonFIB7eB7P1kx9kuJCRLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735174381; c=relaxed/relaxed;
	bh=wt2utwCaGNVaVhyQN4HeE1ZG/ZhKus2H5Hco4TOyL2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSL5Dwp3z13UK5ynysmFEFDSv2eu4p/I0Wy1BPhw6hSCNHbXRkeOptg2ERoU555yT0BAblwuj1WLiyS3tX66HELv7uPywz2qL+pqvuRCo4ZNn3+uVFZOf4Z//sAZlUXE4fjFFKo3C3JYYh4LS8XBhSCEfDFstWuQU2btvFoJt7o0Iz/NkjvqoiHEljJHcN6xvgsbC6fdUke6ICY1pBF2+dYs5vaDaWxDoGr/DRWgaTWFr5rcmxIX26I3NEa/32zcICKmx5hWZzK75FsFaIpSTGBNhZYmBhNVhG+tQNTrFr6u+XkteDsLka4IeuwC/t0hH+1bWs6CYtRpaywBer+zfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoivcSeq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoivcSeq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJVV35tsLz2xLR
	for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2024 11:52:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3248A40845;
	Thu, 26 Dec 2024 00:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696BBC4CECD;
	Thu, 26 Dec 2024 00:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735174375;
	bh=JX36L1Nj3ZUHuxu/OyVh4TcWR6YGBUoPfpPDmIBl3fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoivcSequk8qxuzf/zvdycU74YNWkqzK+qA1aWirl2LKhHK1WSCiFX3u2CgbZ6IpE
	 zGt5+x5co/I6V+zZr2tnlDDSRz9ME1Y6OVJuxzd2a/3N3/FPOkkv+ugXDfxA/4LBdx
	 gBPIpidt02pLHG/rM+DSEvkWF3AvggAHxK9jAnh3Ee3kFHBgebidQTHstuyP76fYHc
	 xqmrOuTkCG9nO02N5pl+ZZi5sfRc9WIzff569qa9S3lg6HvjjOWQyjBlPfKojrw7CX
	 k63exwZgFBkMFVzPbhF+er5qjDgRr3waAFISqtLEed2qL5sIVijv+ZpMstEXhFQ8Cc
	 nEsPXSTptI3mw==
Date: Thu, 26 Dec 2024 01:52:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
Message-ID: <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
References: <20241219090859.18722-1-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
> 
> Tyrone Ting (3):
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
>   i2c: npcm: use i2c frequency table

merged to i2c/i2c-host.

Thanks,
Andi
