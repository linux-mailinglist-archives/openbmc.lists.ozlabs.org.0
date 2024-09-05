Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225896E528
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CP26825z3cG5
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:36:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725572212;
	cv=none; b=iWaIISvJW7RnTEkwsIy68UrUyvo7Q/FlHgNBBszHRIqhFHGn1RBdf6tIexvNodJuBaVynQQIezkdJ7AElMg9NiI372aC7qO35gTspny6JeRQ4Ckzmhfa/YieZ9RmXXdq7hvTK5F3Hu5oYQsLtMcgcg945VY20JI4VbDPENpRlmzlc82X0k87wPOQ4WlkxENWncqgoUp1NHLm5w6Qc4ICxpqQY3ybb1l1aS7mF+4CSupyKTtzg4RHjh1q7OAVcD6zVV/DfDdEmcJ7DbRoWSzE7Kttd+Ig7CUfw3VPns8TH+HNfoYneDpZ7OzFoEN/oFSUovfnDaYkvHNGYcaPkW2aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725572212; c=relaxed/relaxed;
	bh=PiprTdAUXKPG4uDnvSmiRLAkfX/ex4byzdXaL/1YLm0=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Enw9v57k2yxmjb0u6ybQLScRm17EoFzBnbLlA9ElibodxiIak/O64PyIjdHMe+8KYg/4X/aSyuFejbVpGGiHLJ3tQNTfcztZ9634ok+3E8sZ16pLzbQ9XmD6fmPUj1yPZ2Tbi9Wc1R2fTqIssG6hiW1Fa8cs4Fg4z2XoPXV/PLwLiUfp5lxfVZJBjfAkMc1mvtSA6eBvfkogAyGzfgyMo0jFqFhl/UZp12UrxnjGvewSPMv9WxffcjH+r8XVgn0fyfbqHokOONEh4V5M0o6DQTG62f5EWhfyECtTHxstp5idjJAUxpVrLQfOZJxwm3cU6LVhLHcJJ5XZaOdkbRQR3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hp9EPcOH; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hp9EPcOH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0CNz6dlKz2yFD
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:36:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35263A40A1F;
	Thu,  5 Sep 2024 21:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A0AC4CEC3;
	Thu,  5 Sep 2024 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572209;
	bh=N3afdJvaOgoTj0oQs7CNW/770sY6SRZRML2iJbqLz7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hp9EPcOHtnHzz2Ph496oqK25N5wY64kY4qPf4L+C+TEkND1eUKF+54x53kLwVbcf1
	 40Rl4OotFCX2F2Mme3xibcyPk0pe+0YEXKaSMiGrPMMzBm4tP9mnkbWVI2vraXBNe+
	 PYCwKk7mmQ3u9UOq6f2ekGoAUKjX+oRicLR+Ejw8UnbOrWO+SGAoSqhnDrdVUiMhKO
	 fySv0udKIwE7TedGYdLNHkSk4uW1jEkvuv+eKdTqpOln9lv1lpA93uWV0siijoHZUM
	 tlU0VODNUj6cNhhiXXvZ5QaScpaei1AP58Qjz0S71n4FoUwgSqy2qN2WmPOO1t1Le8
	 pr4eoLVSqOJHQ==
Date: Thu, 5 Sep 2024 23:36:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-2-kfting@nuvoton.com>
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

On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> The original design supports 10 slave addresses although only 2
> addresses are required for current implementation.
> 
> Restore the npcm_i2caddr array length to fix the smatch warning.
> 
> Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

your email used in From: is different that your e-mail used the
SoB. Is this done in purpose? If so I will keep it as it is, no
problem for me, otherwise I can fix it while applying it.

Andi
