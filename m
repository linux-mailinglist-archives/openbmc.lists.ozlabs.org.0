Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C098CECF
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 10:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSmK2Hllz3by2
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 18:34:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858094;
	cv=none; b=BU3w68nWsnQSOSC7/6LECy8IEOsZzyLUUpolgtk/lO4BbDRuHUoYXg9hr6RNH4fmxXvII7Oto/58k5b3fFcO/ou3He4EKecla3Rdz2BACgYbo+cdCzQkoiui56QUVI1sZ5/jQSjYYW9jf7GHCjrh3PMQGZeqoaA7T7/5DjBCVgcQhxOwevWMUJJYBvUAYtRUQeS9m9RVmpyLeAte9Njd7WFGek7p3kK65KaMbDkNCXDQV7Reqj7NuggCvt/QPD6n+f/lQKMzYCS97SW+DZF4KcKVOvN82FMHGQ3WvXj2kOT/lRW5FPTEYEatef2YkvINhJve5M7pf9FJp9mfhjyxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858094; c=relaxed/relaxed;
	bh=W5VNv/60BDYQda36yq4iNAXdMwUvXcHPcz0jyeEewG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNHxXi4LAPWlJpYeDCK6FOFEWAdwhnoofuL7amV84lFH5ILOqpraWDJBFv+kEvI5Ta0wHDYUDpo9Q2GlGEuDFHJjrM2YMlK8raeUZBcxBF700RSOTHtw6e2a7UeA8rl0SOPfkm8nzp/9yurjpsDmVtajNaVrorCJ96NiyWUCChT3oH9AUZWL8WTMasfEGdW/WLlvZmCnG6ygeo3WHON1Q6IRjY3hkmhYEF58LWCQWc4YyGlG4cTtHxjcnWx9IocJXabEcLc/yC7y2w9oaQqMNFxSQ7AanQ72nb08w7JGfhDVVDchU2pNlcxyp/Mx6w2jo63PhLeU6mLvB2zviKaqZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cWGoUsRC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cWGoUsRC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSmG06Kfz2yHs
	for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2024 18:34:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 446BC5C0508;
	Wed,  2 Oct 2024 08:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC8C4CEC5;
	Wed,  2 Oct 2024 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858086;
	bh=ZLWnJaCsiLvFSACdpMHMHipnkZ7K293HKDrkz3uZ8Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWGoUsRCvDGtIasFiD0dNE5RSMOqb6Mc7vIZgDU/Hlw99i28s11fG95+2NeMYF9tz
	 0l1xLsAlpqBFIkC3s578H9kkXs144uHAkhqM9p5oNVvdteRah/zqpziv1czggAmK1O
	 Zj9zfxCBOJctAqtMYZ+k1/tOR9FxG++IbiQXZJwGQC6cEgBh5MSFLaGbAGBk3VbumI
	 pT64aQzI+jP2UAjh0X+hjiUgDXbYffiarl9zheMGOdaELloVuQDGnYe/L22ys8ZJk+
	 v5pitAHWjh6YWoswGtmGgB5Lo/QZx/o3u4Hayqeh0SzGwI4TMZM4aaEfiW651bIu92
	 dRmxzQZbVJtnA==
Date: Wed, 2 Oct 2024 10:34:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
Message-ID: <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
References: <20241001062855.6928-1-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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

> Tyrone Ting (5):
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition

I merged just these two patches to i2c/i2c-host.

Thanks,
Andi

>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table
