Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459C103085
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 01:08:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hjgy2q3pzDqkL
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 11:07:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PSR0M4f0"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HjgG1bNzzDqQD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:07:21 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id n4so5869734qvq.9
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 16:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVK3MfTd7ANRl5HqfRxD0Ne190XrM7tjKt9yUWRGK1Y=;
 b=PSR0M4f070OzX5NK5rtMQBKsEh2gI1sROSKZ1YEzCBpRVJt8wiQClslh2cXDFKwqq2
 hQBTpsiFAdRAdF8qXosRdpfaOfSRN/zvQKvK10xcKbzxt9Q2hLIyom2DES8eTrPjPyFz
 I1FEG/VZSCbzHTjUqeZPsBWFVM/JGJlb30be0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVK3MfTd7ANRl5HqfRxD0Ne190XrM7tjKt9yUWRGK1Y=;
 b=REO/YHGzuqCDob6rsGTkUOI+nfC4yaFj2pSuvxlPkVc3k+2Iphcp8F3C7e1dw18Kt+
 YsafwlGCblXo9KtXfdFrHRRsDc0PUQu+VuMPrFMBPoduzJOqB9gsQZ3mRNcrV53jeyhS
 p1NDLvsfceyS+r05tQH5Las2Z6gIPM3ZVMy4YAReeo3gTC9Lb9Cy3yyudv/AD6WGdo7T
 nX1izCtZDpF56pORm/orcp417/uuZNchs0xI7XpgXHW1/O0RbRKYexf/H3xvQc51qiO+
 2ioTQ7/5mOkf6CVDk+rRdzB2wNzPb07xYrkuw5Iit7wp5AOPH+WVbrXAecaHBfgtdbkL
 TEhA==
X-Gm-Message-State: APjAAAVLmIk55/m8YBexjqukf2mQHEYZ6RBWD35Q0hpPGfMUT64eSnEE
 JUUgDAHdUCfgYX/xCsQ1AntRGDduxACjdRAgOCeayE4J
X-Google-Smtp-Source: APXvYqx2prtoPqo3ceeR/bDpUhhqn7BMQf8nd2abfgP7VEf3tID29AY4VhTj56L+SNubwRnrO7FW4lTzkFKWeCXqiew=
X-Received: by 2002:a0c:edcc:: with SMTP id i12mr73852qvr.20.1574208437943;
 Tue, 19 Nov 2019 16:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20191119235910.31825-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191119235910.31825-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Nov 2019 00:07:05 +0000
Message-ID: <CACPK8XcPOwn1n=m-ie7_ywnF6zXgHXYoG_ZArd5Tt+0OUPP__w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3] clk: ast2600: enable BCLK for PCI/PCIe bus
 always
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Nov 2019 at 23:59, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> BCLK for PCI/PCIe bus should be enabled always with having the
> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
> initcall phase as an unused clock, and eventually it causes
> unexpected behavior on BMC features that are connected to the host
> through PCI/PCIe bus.

Which features do you see have unexpected behavior? We could load a
driver instead, which would keep this clock disabled for platforms
that don't use PCIe. If this isn't an option (eg. VGA) then we can
include this patch.

Cheers,

Joel

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 9191bc3e78ee..8201d65018b9 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -64,7 +64,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>         /* vclk parent - dclk/d1clk/hclk/mclk */
>         [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
> -       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
> +       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  CLK_IS_CRITICAL }, /* PCIe/PCI */
>         /* From dpll */
>         [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REF0CLK]       = {  6, -1, "ref0clk-gate",     "clkin", CLK_IS_CRITICAL },
> --
> 2.7.4
>
