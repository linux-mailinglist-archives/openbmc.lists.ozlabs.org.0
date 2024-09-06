Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1D96EB85
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 09:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0S1l0c13z3cHb
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 17:06:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725606359;
	cv=none; b=P1SB2MQ5Y6pH4Nr0I4AB9u29V1XNQ3sEs5UALdd5B4Tcyp3hQjHZA9MBW8kBVPuL6HsM8B9vWTD0LKWJ+8N6KlZf/UktJQilDuwmTUX55SvwTBzqCRidOWF4I4meUzpOpJzhOTHAHbivA3yGAsXdSsIyn5yKDuUkcDwCxFqvI19RyNhYm/p58BoIynxrpOg6cRn8QX3OodsL772971IV15EJeE8ubyuQ77vXxVAwL7d8kA8/DaoT8NdF9E1DsEQ2mMiC+pBqaeOGbCSUuRQxVd8x0zRiVevOiEWRb8tO453iSqGnpLdTFPLKtnLqi8dytQyoG0SDiL38/kasfc6CDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725606359; c=relaxed/relaxed;
	bh=TxaVJD8d81aZ+N8Hn8Ru6afpYwJWN+eYnzxgtxQxHEc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=ihTiEPXoflrzgPKyHrKRMnkWkzk+aLuZZg6Tp7IuUrNvzzM4+qmP+eJagKodqEmTlYAyWYfNcbPPSKjcqvpXGW0B0C85A5rAfza4AaBLtynuvj7mhvTNVZIvzfh90ynIDPUiN/bT8b3myQ0mMJQbzQ2qGiCt+GTu4lgMhkfgnc/DCIKS2EqbnlMf3BxS62R9RxfQG8u2QOXuxyPw2P5LX5Wb9nACJvR60n5yB3T7UkzhJsxoupINkoVfelNQhbJOBUdq3bNsXqV4bDxyJB3FFrqosgqozRnUwXA2lvN07bCWWiw+ex71MC7VjNJmVO0IJm/84RZDjOzouavv9gyUyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r1MoESgT; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r1MoESgT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0S1g4TkZz302N
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 17:05:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 472BEA44979;
	Fri,  6 Sep 2024 07:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC54C4CEC8;
	Fri,  6 Sep 2024 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725606356;
	bh=oDrorMdX9k1okUgl5LsV5arhu2DByaxXuJRBbgjF4V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1MoESgT7X9hOR2b1uyfvxtTsVwxVl9+WbJPHieq3wIpfPEERTrJ2iUmOMV4jx0Qe
	 bIZe+an+cFqgiK3EBynDn82selrAcef9P8eqxbQmLGCYQin4wv/WHpk+V+y4U/nhN1
	 tEya3A/eUG/sWJb/M1sLDnYHhG1xuqaypPGcgH1IjydV4Yw3LRD9kFLdQlkfAGeZw1
	 fZ9WF+Iso2mfObfFCmlKtcYhVdt3mpIPt1jcbFcXvPGaW2l81++OMWsYmSLbYxqm2Y
	 bNMOaXdUlWR+OCjkoP/Ymfu2dRVPOb2jEp27lZAkeCeDQu9qagsaqSoM82GnNZUHqn
	 //NneqgHK5DEA==
Date: Fri, 6 Sep 2024 09:05:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
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

with the changes we agreed, I merged just this first patch in
i2c/i2c-host.

Thanks,
Andi
