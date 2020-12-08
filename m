Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FF2D20C9
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 03:28:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqkd66FcBzDqcL
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 13:28:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RRnyDGHr; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqkcF42R8zDq7F;
 Tue,  8 Dec 2020 13:27:54 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id dm12so7633629qvb.3;
 Mon, 07 Dec 2020 18:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M6BrLtQzjtTPKyMV2O2fXe6jMdLz4xz3CFXS9fstNao=;
 b=RRnyDGHry2kQNjUragxCULNdKfvOQy05D2huodFRwOLiedS2MAL2DIFE3DlnqgS9jU
 Gfv0qINCbzTr6zM45qlfrJm5Pr6kMt1aLvWXSdupuZti//5M3Xtwo0OTCcvjHAkk/jCi
 lbI21+EYXua/3dz7BFK5CrbVUNhRk+MkC2wvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M6BrLtQzjtTPKyMV2O2fXe6jMdLz4xz3CFXS9fstNao=;
 b=UF2fc77u+J83QxGAQd5Xwz+oMOpNlm9BOCza6H28YDIliHDnOfoP1E58i4wVPpwyMX
 fNnyd4za53xKKvne6ulGYaiqmjC+NK9J8DQzhLCqWGukKof2W39PnsHzv5t5y4hvvgal
 at9WcdNdhjmmMPdk6kTqanYk1NfDY4TgN925RVc5iKgeB07n6mQfOIkSaPDYvTtcIjWe
 c7vnMXNbl1FrEprlb4MzmJqtDuKYxZorKWch4cFRj3GxuoDGOzgB6dXA5YZyFC8lRsDD
 DCkSAcjgtlcgGZtp7NfUzfFog/tVHQuLUl//Q8i2TmbOCSWUe8QhCKA3/lI+BpYx1kw8
 tcQA==
X-Gm-Message-State: AOAM5309O6G7BrG/k38V4CtRmM2sLVECI/1czxBfI/VlTlwFDkQGvs+M
 GQAIEfClFYFeWlV7RIUOQe3ht7kh5qcv6TLCKxo=
X-Google-Smtp-Source: ABdhPJw29BFw6jgelfIVlOcw2Z1gxH77700UF44YtT2QPZke6I7PlgTaW6fFCR0Fh+6gLBi8JEUGte5SLQPrKOTCZig=
X-Received: by 2002:a05:6214:c66:: with SMTP id
 t6mr19745975qvj.43.1607394470213; 
 Mon, 07 Dec 2020 18:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20201207164240.15436-2-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 02:27:37 +0000
Message-ID: <CACPK8Xf-5YDB2ofA+ivn8AtKLmVABD2PQ7p678cppu0hka63xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: ast2600: fix reset settings for eclk and vclk
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine reset setting should be coupled with eclk to match it
> with the setting for previous Aspeed SoCs which is defined in
> clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
> driver. Also, reset bit 6 is defined as 'Video Engine' reset in
> datasheet so it should be de-asserted when eclk is enabled. This
> commit fixes the setting.
>
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

This fix should go to stable too.

Thanks Jae.

> ---
>  drivers/clk/clk-ast2600.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 177368cac6dd..882da16575d4 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -60,10 +60,10 @@ static void __iomem *scu_g6_base;
>  static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         /*                                  clk rst  name               parent   flags */
>         [ASPEED_CLK_GATE_MCLK]          = {  0, -1, "mclk-gate",        "mpll",  CLK_IS_CRITICAL }, /* SDRAM */
> -       [ASPEED_CLK_GATE_ECLK]          = {  1, -1, "eclk-gate",        "eclk",  0 },   /* Video Engine */
> +       [ASPEED_CLK_GATE_ECLK]          = {  1,  6, "eclk-gate",        "eclk",  0 },   /* Video Engine */
>         [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>         /* vclk parent - dclk/d1clk/hclk/mclk */
> -       [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
> +       [ASPEED_CLK_GATE_VCLK]          = {  3, -1, "vclk-gate",        NULL,    0 },   /* Video Capture */
>         [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
>         /* From dpll */
>         [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
> --
> 2.17.1
>
