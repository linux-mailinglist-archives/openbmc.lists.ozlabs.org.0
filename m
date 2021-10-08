Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC34263E4
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 06:44:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQbDy1YTRz302N
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 15:44:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z/L+yZ5M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z/L+yZ5M; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQbDX3LYQz2yHX;
 Fri,  8 Oct 2021 15:43:39 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id 138so8280632qko.10;
 Thu, 07 Oct 2021 21:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gw7wgCaTvKYfMbMV5PxHZoE3kvEBXYtxmjTRmjNu3yU=;
 b=Z/L+yZ5MrjWEkKwsTluewvUnMYn1psbS+3h1jYz5KDe5q+emwrnH5WqoC6/flz4U57
 raR168czq8D1ADzDZ5FjPapHJcO4OPq3Pk9WYTpA4jsP8sLqtpzxOIo4N71qkW61LtLc
 H54bnTcrokGgQpOqfPhM6cj2PmiWdv5mGJ/8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gw7wgCaTvKYfMbMV5PxHZoE3kvEBXYtxmjTRmjNu3yU=;
 b=v1oDsthHOWIs4L57d1kaO9t06rpPTbGVUS+/gcYO5O/swSQ31X9b+rGHQzcw4Z2YYD
 G/grf+aimX5CPznljkK/D9rR+j6voSAMZIL5Cnq0KrRl7kwZ6MgEyv5PAkvUMjzxH/9H
 S6eCYwmn0sq+waqkvuu1DUQcSrEZdsORkYO7wC/7AnkQAIn6RQPTuIjNKwwRxmG6KD3K
 xGnmPjYlSwN0j7Z8qIrs2wAZLgmoBHzV/Df3PQH/C0fmEp/TYXX0f/gk0Af4bsxJBq07
 ivIJzc3/bqQyCIqFgzOuFDNd+1C3xc1kUJir4E5mGbSgqVw8htDTS6TZSbGLwqmGpk3L
 pdvg==
X-Gm-Message-State: AOAM53154heqaiCd3vmZQkh1KkkLzAMz1Ww/wISKkxmBupZnd7cX2gXb
 Gnwvf8mEVGluhHnAg3rk5L0VvUmhnLcu2mBDLUiTrKkR
X-Google-Smtp-Source: ABdhPJyMiuGznZhJ+Kw46FLW26WDpsOFcbXLbn863aS0Ef7/II4nBu4wAPfJG+qTVxqTQSL0dCOJxsMUJyRRkyrdGy8=
X-Received: by 2002:a05:620a:5fd:: with SMTP id
 z29mr1130132qkg.36.1633668216260; 
 Thu, 07 Oct 2021 21:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
 <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
In-Reply-To: <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Oct 2021 04:43:24 +0000
Message-ID: <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
To: Zev Weiss <zev@bewilderbeest.net>, Greg KH <gregkh@linuxfoundation.org>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Greg,

On Tue, 28 Sept 2021 at 18:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
> >Hi Mauro,
> >
> >On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> >> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
> >> > enabled
> >> >
> >> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> >> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> >> > > garbage interrupts"), the ASpeed video engine sometimes asserts
> >> > > interrupts that the driver hasn't enabled.  In addition to the
> >> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> >> > > patch, COMP_READY has also been observed.  Instead of playing
> >> > > whack-a-mole with each one individually, we can instead just blanket
> >> > > ignore everything we haven't explicitly enabled.
> >> >
> >> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
> >> > Change looks good, thanks!
> >> >
> >> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> >> >
> >> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> >> > >
> >> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >
> >I notice this wasn't merged in the pull request you sent for v5.15.
> >Would you be able to ensure it makes it in the next pull request you
> >send?
> >
> >It can have some fixes tags too:
> >
> >Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
> >Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> >Acked-by: Joel Stanley <joel@jms.id.au>
> >
> >Cheers,
> >
> >Joel
> >
>
> Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?

We're struggling to get a hold of the media maintainers to merge this
fix. Have you heard from them recently?

Cheers,

Joel
