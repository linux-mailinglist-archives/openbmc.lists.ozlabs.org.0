Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D163E0C66
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgC1m0B36z3cQg
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 12:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=B/uPjSmx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=B/uPjSmx; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgC1Q59lnz303D;
 Thu,  5 Aug 2021 12:17:29 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id t3so3548917qkg.11;
 Wed, 04 Aug 2021 19:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkGOSVQF9TOhjzyiUoCJV05ZbHNx5GT+bf4KeZ6f2IA=;
 b=B/uPjSmx60H4ihwfZ8wtzF6CYCbTEPVmk4keYAeCgxiUr7EbcO/Xr18Udj7qjH5pDi
 +hLao+j9kUFgzdXaH/y6DvRYXsBXnRnMH9bAa2Mo3Heh8Xn1tVLhLpaZSygh2NrmMsQB
 KSa+jXTwJWa9pcw6CjXCG92kKr9d5tF9FPV/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkGOSVQF9TOhjzyiUoCJV05ZbHNx5GT+bf4KeZ6f2IA=;
 b=KHG0JtZvBzclzNtB9Jp8qF869Uemk+ykCdBI8JaKld+txmYmL28ixUs7FGmLIZ1dpp
 CpGf6uKh94tXq0y/3GNssWsWLqfmU/SJwjAxXF/MsW87mBY85hPsFYfEOgZi5NnzwbSU
 wxPr0xx8vSSCiVxUyfkPD0/+bne5gtCJ6v1+GayGY4eVQ10X8UFlRHD+8QrZ0cyfKQQk
 0lyyRLtjw/c4bQlxKhJkEU2GYkUl78zyV2Ro3qilIbls4/ac2PAT0n4llo0QG76BfyC3
 iNpQ9NNeh68Rpv/dSNXpiXK4r9lfGchswRURpipN2HuRMyuCc6A9akHjmU8t4tIRKB74
 vwVQ==
X-Gm-Message-State: AOAM532F3XKFbRPf1+VauA5h9ZuP4nsfyZc4lTWJXSeG3s5oJCNHdfIC
 wyb7luEgXHzD4feqzcu+Ld/myWG91AaMa8VN2LI=
X-Google-Smtp-Source: ABdhPJysI08p+xS1rb4jB6N4wAriNvzo2kltaAaQt1+UjwLYcRVjKGA2lAJPptqP1gzrQhP151sLslPnoPHg6ECB8Y8=
X-Received: by 2002:a05:620a:893:: with SMTP id
 b19mr2511179qka.487.1628129845723; 
 Wed, 04 Aug 2021 19:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
 <20210728233755.17963-7-rentao.bupt@gmail.com>
 <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
 <20210805011951.GA28444@taoren-ubuntu-R90MNF91>
 <CACPK8XcwsOa5NzsUZeiv5qdWV5H6HBa7WK+cwbnqayP4zhoNkg@mail.gmail.com>
 <20210805020946.GA29371@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210805020946.GA29371@taoren-ubuntu-R90MNF91>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Aug 2021 02:17:13 +0000
Message-ID: <CACPK8XfewBvd4BLgkgkC0DBzVk5pmV4ZTVaVt=otrKfqJ6m5Lg@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 at 02:09, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> On Thu, Aug 05, 2021 at 01:37:29AM +0000, Joel Stanley wrote:
> > On Thu, 5 Aug 2021 at 01:20, Tao Ren <rentao.bupt@gmail.com> wrote:
> > > > > +&ehci1 {
> > > > > +       status = "okay";
> > > > > +};
> > > >
> > > > Have you verified that USB works with mainline? I've had reports of it
> > > > working on 5.8 but it seems to have regressed as of v5.10.
> > >
> > > It stopped working on ASPEED since commit 280a9045bb18 ("ehci: fix EHCI
> > > host controller initialization sequence"): ehci_handshake() returns
> > > error because HCHalted bit EHCI24[12] stays at 1.
> > >
> > > I have a dirty hack in my tree (ignoring the halt bit) and it "works" on
> > > AST2500 and AST2600. Let me send an email to openbmc and aspeed email
> > > groups to see if anyone has more context.
> >
> > We discovered the same, except in my testing it wasn't actually
> > "working" on my EVB. I have a A3 EVB on my desk and when plugging in a
> > USB key nothing happened.
>
> We have a non-removable USB device on Fuji (AST2600) BMC and it can be
> enumerated successfully (after applying the hack). Let me vist the lab
> and plug a USB key to CMM (AST2500) BMC sometime next week. Will collect
> results and send out email then.

Thanks!

> > > status is set in ast2600 common dtsi, but let me set it here to avoid
> > > confusion. Will update pinmux in v2. Thanks.
> >
> > Are you looking at mainline? I think it's disabled by default there:
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/aspeed-g6.dtsi#L246
>
> Sorry for the confusion, Joel. I mean the device is enabled in
> "ast2600-facebook-netbmc-common.dtsi" (patch #3 in the series). Do we
> still need to set status to "okay" explicitly in platform dts (to avoid
> confusion)?

I see, thanks for explaining. It's a downside of the device tree
bindings for the ethernet device.

Given you will be the one working with the board, I think it's up to
you how you lay it out. You could choose to add a comment to the
platform dts, or put the hunk you currently have in the common.dtsi in
the platform.

>
> &mac3 {
>         status = "okay";
>         phy-mode = "rgmii";
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_rgmii4_default>;
> };
