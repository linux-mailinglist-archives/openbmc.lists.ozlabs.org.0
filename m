Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3E14E020
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 18:42:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487nkQ5FCRzDqZW
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 04:42:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=qIki7rDk; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487njb6M0vzDqZR;
 Fri, 31 Jan 2020 04:42:11 +1100 (AEDT)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1D5620661;
 Thu, 30 Jan 2020 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580406128;
 bh=iylYJCQlli4M7Fmtr9gfq5RSFTD1CKi2eHDl0ImzPr8=;
 h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
 b=qIki7rDktDLpciAgwxatXi3SNExDjE8bKxSbUgpK14Ib8qJnQiYukCYtK4D/V8cvS
 xmF73jnWeEizgXM6Yojq39qkyaLfUZcJ+SuSReCwCZ9WuNBHTET6GPcm/rR41gT3u3
 K6sQBenHOSluVyTXn00dR0H2eWf7KL/07HUM4zBQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
 <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Thu, 30 Jan 2020 09:42:07 -0800
Message-Id: <20200130174208.B1D5620661@mail.kernel.org>
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jae Hyun Yoo (2020-01-15 13:26:38)
> This commit adds critical clock setting logic that applies
> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
> device tree.

Yes that is what the patch does. The commit text is supposed to explain
_why_ the patch is important. Please read "The canonical patch format"
from Documentation/process/submitting-patches.rst to understand what is
expected.

>=20
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 411ff5fb2c07..d22eeb574ede 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *=
pdev)
> =20
>         for (i =3D 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>                 const struct aspeed_gate_data *gd =3D &aspeed_gates[i];
> +               unsigned long flags =3D gd->flags;
>                 u32 gate_flags;
> =20
> +               of_clk_detect_critical(pdev->dev.of_node, i, &flags);
> +

Do you need clks to be critical, but only sometimes? What clks need to
be critical? Why aren't there drivers for those clks that turn them on
as necessary?

There was a lengthy discussion years ago on the list about this function
and how it's not supposed to be used in newer code. Maybe we need to
revisit that discussion and conclude that sometimes we actually do need
clks to be turned on and kept on because we'll never have a driver for
them in the kernel. Similar to how pinctrl has pin hogs.

