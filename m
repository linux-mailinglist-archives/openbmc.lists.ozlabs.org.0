Return-Path: <openbmc+bounces-413-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D590B19169
	for <lists+openbmc@lfdr.de>; Sun,  3 Aug 2025 03:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bvhjZ0nc9z3bby;
	Sun,  3 Aug 2025 11:21:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754184098;
	cv=none; b=Icq8deZXfl/RH5W4G7cJm8OK/fKnozkU1Y5NwBS45AExdRYS016LjpAuLUhpsPo68uDFLrHgfCTqdmxvufRmb7kcpA/HfMZ4JEPiKY+lsqa04nKoNhprteOHZaL8QDmLKmn1lF2M93B/3557uG0DKL4IQP9OqiurkXKqJiiAeNyLw6ur/Vy1aZQw0pTNr+1tFqowL7DRMTVK1BVsnFPHw0lazP9M59Pvstvm9aVHQgfqJaRVc/gOcxUH1Z2bt9eSWaKjMg3UI7mH8e/unnm6ek3TSKKrou8M8EaNVCJyLKoSev1swwn2vvXffcaBOOTjA0+tBdPXjBplPWtwIYIElA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754184098; c=relaxed/relaxed;
	bh=xbH8hOkjMz5i59oT3KbdPFr9gL61/+cWeH+sH8L1hf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9nZBkA7H1Ch+GNUQBy5KgyXKnHg8bdTUtuFDV9jj39LpjKQxXrXF+tyb3Fd6Bw2UmsnqumLjXBzc6TgzOMKjn1fdosduOZwaNcBbRuSZy1uRgPjmV+FnG8fV0+cR8wYfconcrh3izn6B4ygn6oQwS6YLKiNAVrC/yhOxaQyBzX7eyKDMUx4eUl54aQsSNQMoBXAG2hr+uffYoTdyAVrUqVSiwFA8G0nFgcjL+NR2ET6fPgVUIfz1nTb9i5y1eJxWm7JCPiiEFcS/J4ACBcpRko8DeZM1a9NTancrGTx+3qPFSeFSynxB+E0Wm6H45QEnhtpIFYsKcA22s9R2buKYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=me7oGRjP; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=me7oGRjP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bvhjX26cQz2xgp
	for <openbmc@lists.ozlabs.org>; Sun,  3 Aug 2025 11:21:36 +1000 (AEST)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id A9DEF580E8F
	for <openbmc@lists.ozlabs.org>; Sun,  3 Aug 2025 01:02:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BC4E43390;
	Sun,  3 Aug 2025 01:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754182907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xbH8hOkjMz5i59oT3KbdPFr9gL61/+cWeH+sH8L1hf4=;
	b=me7oGRjPlj9OSgUS7mP2TCViY2896IWqAGfAc6dIhlrLfGj2780LVpIoFSAQpq/rQkj7p+
	Wp0e8NbM8aNFESGRby0PxDH+xwt/RumYvtZwipFDkrhwKOt/Z3FN1K4pyAABjZF9XkqxLn
	d7xxNlwjI4c7xs4AJEC/q+LTyTS3CONLCpWmGl/tp0EWaQ/qeM/oFmiSvP2cBsN4gSz+Zn
	nw5f1R4bafZ3F8U3mDNgmiv4wvgf+tInw4n9AdjnT+4cnnvKcyGWS+vbS2qLBbKvEvebQF
	WhJ74TcfbIYLJd789PNtto8/q3ZTqoVgSjeEhdv66zgyXBa6uD32JyJ7rH2bYg==
Date: Sun, 3 Aug 2025 03:01:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akinobu Mita <akinobu.mita@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Mia Lin <mimi05633@gmail.com>,
	Michael McCormick <michael.mccormick@enatel.net>,
	Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 00/15] rtc: convert from clk round_rate() to
 determine_rate() and fix a few bugs
Message-ID: <175418267001.2341527.14209599648775421774.b4-ty@bootlin.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdektdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrkhhinhhosghurdhmihhtrgesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmp
 dhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghvihhfihhshhhmrghnjedtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhmrghimhhonhejjeesghhmrghilhdrtghomhdprhgtphhtthhopehtrghlihdrphgvrhhrhidusehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 10 Jul 2025 11:20:20 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> I also noticed that in some of the drivers that if round_rate() is
> called with a requested rate higher than the highest supported rate,
> then the clock is disabled. According to the clk API, round_rate()
> should instead return the highest supported rate. This series also
> updates the functions to return the maximum supported rate.
> 
> [...]

Applied, thanks!

[01/15] rtc: ds1307: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/cf6eb547a24a
[02/15] rtc: hym8563: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/d0a518eb0a69
[03/15] rtc: nct3018y: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/437c59e4b222
[04/15] rtc: pcf85063: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/186ae1869880
[05/15] rtc: pcf8563: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/906726a5efee
[06/15] rtc: rv3028: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/b574acb3cf75
[07/15] rtc: ds1307: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/31b5fea399d5
[08/15] rtc: hym8563: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/394a4b920a72
[09/15] rtc: m41t80: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/e05d81b75efd
[10/15] rtc: max31335: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/9e0dfc7962b3
[11/15] rtc: nct3018y: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/1251d043f764
[12/15] rtc: pcf85063: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/ad853657d791
[13/15] rtc: pcf8563: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/e6f1af719ea1
[14/15] rtc: rv3028: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/c4253b091441
[15/15] rtc: rv3032: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/35d6aae85b36

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

