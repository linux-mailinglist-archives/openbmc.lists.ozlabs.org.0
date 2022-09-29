Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDC5EEA9D
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 02:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdDyt5qzbz3btV
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 10:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvuSQ4n/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvuSQ4n/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdDyW045Gz301Z
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 10:39:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7F24B82298;
	Thu, 29 Sep 2022 00:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F96C433D6;
	Thu, 29 Sep 2022 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664411963;
	bh=7xPHzTBZmJ6MPVuiaFfM3giD1v5pmkT5FJsQ+s1Qhdg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lvuSQ4n/pwx39gpW4h3BxWvXD2eS8jEJYLLkZ/7/aBXDpeuSCghxIjvRSS7McoWq5
	 NygnwytjTHV0fmu7BwKuSbnKA+a47LXfYfh0RGENyAc4EaYlC6K2TBKQh3neJMZz09
	 e3HqmQLFYuBMr0JBCHNzmS5ZiM5dJtNguJQHlt/6ptZJz8vVIvQZpx1rpxDDjjlt6o
	 mhP0VJLtyEytt2BrGdhpve81MsoGU/NZO/bT5td91icogtuJFLw5ZRkl0Bzxwiv9QU
	 XKUSlLLzcht7fMAeJ8jh2hmiZScl8+tFFoXUjZafW92X1B4DajgZfAfkRZxswqe+1F
	 DqqpZ3zD+8aNw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927133931.104060-1-yuancan@huawei.com>
References: <20220927133931.104060-1-yuancan@huawei.com>
Subject: Re: [PATCH] clk: clk-npcm7xx: Remove unused struct npcm7xx_clk_gate_data and npcm7xx_clk_div_fixed_data
From: Stephen Boyd <sboyd@kernel.org>
To: Yuan Can <yuancan@huawei.com>, avifishman70@gmail.com, benjaminfair@google.com, linux-clk@vger.kernel.org, mturquette@baylibre.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 28 Sep 2022 17:39:21 -0700
User-Agent: alot/0.10
Message-Id: <20220929003923.72F96C433D6@smtp.kernel.org>
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
Cc: yuancan@huawei.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Yuan Can (2022-09-27 06:39:31)
> After commit 6a5898411159("clk: clk-npcm7xx: Remove unused static const t=
ables
> 'npcm7xx_gates' and 'npcm7xx_divs_fx'"), no one use struct
> npcm7xx_clk_gate_data and struct npcm7xx_clk_div_fixed_data, so remove th=
em.
>=20
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---

Applied to clk-next
