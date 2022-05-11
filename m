Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16193522C0F
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 08:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kykrl74frz3c8V
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 16:04:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ORHC7SJy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ORHC7SJy; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KykrL6XVCz3bYP
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 16:04:17 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso1957107wmq.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 23:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yQZl0d0b6Eae6vWImC6ay9PBAOGRvV6AfQxjzefGuI=;
 b=ORHC7SJyT2LelI9KhMIoq14zzoo/Fa5U8LiaZNX9SICFDeAPOB0Yc/DaX8jUVp6jtX
 bs87JqWYMtIBwxeA3h9zRvrUrK/WJY4beR1J1EGZAGp4+IgP4gWC+1HRXnLWyGtyz8NV
 fZoO+K+KBagtfCndoVOl/YmMjAIULKMVaPDWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yQZl0d0b6Eae6vWImC6ay9PBAOGRvV6AfQxjzefGuI=;
 b=Fz0sqgC0uTjPt4d8AcD21oMQRgQyvd9IYniKLa9WSg7eCtu3Ixqlt4073WKoL1SxE5
 67RGK0a3++I+b9YV+2raWiJTl66ZhFfOXYjCngAwdKAGkprwMM49v36A3BVxeeN+IMFM
 Nh4TXGjILnR/WqgDYBNijfsrM21GaYP5DOsYVyanYRtmDsIM3quNwEbI63OlJRpJNFJL
 edks5R7vOXse8Xqvq06UQ7hqZmWRXITj4jcLxG+sSl8p2Dr08dADDNZnRO+qd28DBPpX
 wwua+1mgI8kOsfFr2xUFH0E6BU7ZzIecRhdTvFmiXN0rvyyOyCpqqDFUQRTK3WsfvPnM
 ySAw==
X-Gm-Message-State: AOAM530arExRzTEsw6c6YXD4sSyKgYtvoskkELxe4YPiNkz7YA+zc9VW
 jxpsqLwfKyN9fQ/gnvZThessKRR0vN70qKwn4RM=
X-Google-Smtp-Source: ABdhPJxWi5za2czYGzlKiNr7yKcEc/Admgg3a3c21R8XMJjrqpxTMZFz6dV2wHu4QFVNT5O+sPm1HYWo/zG2KtyccIc=
X-Received: by 2002:a05:600c:3583:b0:394:77fc:d6a2 with SMTP id
 p3-20020a05600c358300b0039477fcd6a2mr3058328wmq.63.1652249053878; Tue, 10 May
 2022 23:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220414210045.26480-1-zev@bewilderbeest.net>
 <YnsviIh2dFoogpIE@hatter.bewilderbeest.net>
In-Reply-To: <YnsviIh2dFoogpIE@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 06:04:01 +0000
Message-ID: <CACPK8Xdg9doTkKowWj7yS30Wqh=kstK5YbY1+QxRPw_6A0pR9A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 at 03:37, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Thu, Apr 14, 2022 at 02:00:45PM PDT, Zev Weiss wrote:
> > The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
> > are mostly compatible with the existing ast2400-evb device tree, with
> > a couple small tweaks for the serial console UART and ethernet MACs.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > ---
> >  arch/arm/dts/Makefile             |  1 +
> >  arch/arm/dts/ast2400-ahe-50dc.dts | 34 +++++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 arch/arm/dts/ast2400-ahe-50dc.dts
> >
>
> Ping...does this look like a reasonable approach for a board that's
> mostly-but-not-entirely EVB-compatible?

That looks okay. Are you sure you have everything that the evb enables
on your board? Dual flashes on both flash controllers, etc?

I wonder if it would be better to put more into ast2400-u-boot.dtsi
and use that?

But I don't have strong opinions either way. Your device tree looks
fine, and I am happy to merge it.

> Once the regulator/extcon
> driver question gets sorted out I'll post a kernel dts, after which I
> think the necessary pieces will be in place to add an OpenBMC meta-layer
> for this system.
>
> This patch is also still outstanding as a semi-dependency (not strictly
> necessary for this, but nice to have for it):
> https://lore.kernel.org/openbmc/20220414205950.26406-1-zev@bewilderbeest.net/
>
>
> Thanks,
> Zev
>
