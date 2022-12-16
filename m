Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C6D64F133
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 19:44:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYdLV6pN3z3bZx
	for <lists+openbmc@lfdr.de>; Sat, 17 Dec 2022 05:44:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGo8OHTV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGo8OHTV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYdKx2Nqmz3bVc
	for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2022 05:44:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 357AD62179;
	Fri, 16 Dec 2022 18:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A426C433D2;
	Fri, 16 Dec 2022 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671216242;
	bh=vXaRsUEz+ZU8atzp08Gu7TMGOkHET3ojPGwll8eK0S0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tGo8OHTV3CB03XAOEEgy1LKM4ohkr0fVmRfCega/FzvnUSuCVoJ+CDhUpjIBdre9c
	 bf2gOLmN6g3k085im1FXmhLt7h5Hug/Y5A1mKl3g5SKLWP3tqIP0zBTx1FF6Xmbh0S
	 fo5p20JfswWi214OwwDiwMBNRghWmB8gfqQR6u2ryZ5jQbtdjhNULoip0TfaxkoSIG
	 66WtsvwamBuCGdO+2WRko2xfwOhUEvL9F0r6QyipLdIgoDYmFXXFsNrnuN03sShRaE
	 +np/w+rgP9EpZkwSe0PC7KqaZfK52ywIsiV0Se+dyMYH53jO1xe5YEZ42lULFcelxi
	 xnSbomOAZruxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221211204324.169991-2-tmaimon77@gmail.com>
References: <20221211204324.169991-1-tmaimon77@gmail.com> <20221211204324.169991-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v14 1/1] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, benjaminfair@google.com, joel@jms.id.au, mturquette@baylibre.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Fri, 16 Dec 2022 10:44:00 -0800
User-Agent: alot/0.10
Message-Id: <20221216184402.8A426C433D2@smtp.kernel.org>
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2022-12-11 12:43:24)
> diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> new file mode 100644
> index 000000000000..08ee7bea6f3a
> --- /dev/null
> +++ b/drivers/clk/clk-npcm8xx.c
> @@ -0,0 +1,650 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
[...]
> +#define NPCM8XX_CLK_S_RCP        "rcp"
> +
> +static const u32 pll_mux_table[] =3D { 0, 1, 2, 3 };
> +static const struct clk_parent_data pll_mux_parents[] =3D {
> +       { .fw_name =3D NPCM8XX_CLK_S_PLL0, .name =3D NPCM8XX_CLK_S_PLL0 },

As this is a new driver either you should only have .fw_name here. The
.name field is a backup to migrate code over to a new binding. When
.fw_name is used there should be an associated DT binding update. I
doubt the usage of .fw_name is correct though, because aren't these clks
internal to the controller? The .fw_name field is about describing
parents that are an input to the clk controller node in DT (because the
controller is a consumer of these clks that are external to the device).

So can you use the .hw field for these internal clks? Check out
CLK_HW_INIT_HWS() macro and friends for a possible way to initialize
this.

> +       { .fw_name =3D NPCM8XX_CLK_S_PLL1, .name =3D NPCM8XX_CLK_S_PLL1 },
> +       { .fw_name =3D NPCM8XX_CLK_S_REFCLK, .name =3D NPCM8XX_CLK_S_REFC=
LK },

Maybe this is external? If so, it would be great to have this in the
binding as a `clocks` property.
