Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5164DE20
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 02:39:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VKZF0ms0zDrHP
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 10:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="OV5VcpGM"; 
 dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VKYk1ZY5zDrGs
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 10:38:48 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id c70so3243248qkg.7
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 17:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zl5rlykWaRGsVQG6wMK791uGG6pWmTMWb8Usd1bjW/I=;
 b=OV5VcpGMwK7z8Ge1U6YfeJieC/LqWHGhQz49NYy61PDROcfqrW/Ejj1zacqfQRPknL
 /vZUnSTOnrQcUh4+jUEMpEmb/qaWkKl/oCr3vrIMqQpw+0W986NVwtjqF+FwXLxCbY2l
 TEE5VR/dtRuf06usL2Jjneg2dbsiKe8bFjhEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zl5rlykWaRGsVQG6wMK791uGG6pWmTMWb8Usd1bjW/I=;
 b=SUnesH+dtlkotEWIm1i/jJASpLkzjHY+Pmb6n6v7Rhn9LVGfyG4Tc/uVdlgMXdW+2Y
 rrwo0hCXiIcJPUD1L7hbUbOnr9WSOoUM25MWc1IKr4SKXt9KTolrocuopFhrG3cHoJpQ
 8rw8ZWITS9RAE0+yl8Nd+Kqh5MrOYuuX8+T4L73KwM1gZME37AQrm1BEm5rutpOBv7zA
 4Z5cHpJJHBMAa3hrbR9qATaaqao8maHD+RtLM50UB3T5i6f3Y12IK9KqHxqznLg7DGj0
 oTXj6lNhos6Sf7sqdswxCd6fPAM91hgkZDGnJwNRbxeJHeUxId5glutamEwwc9Oh1VXY
 JCPw==
X-Gm-Message-State: APjAAAXE30b2lC4IhBRWcsd7TyPHdSZei829y6ZQu4dRS9zAQDv4kArj
 fQhaBrpgG0L1AreQOU1zJy92hUyhg0eLc8AS52g=
X-Google-Smtp-Source: APXvYqzO+hf5R+lPVr/IE9m2XlHI6n4i1YmiB/m0rpydllkxv8ChMTzjMHhDsZwK6pGORop+9MHwvzEu7oOOYDec9S0=
X-Received: by 2002:a05:620a:1113:: with SMTP id
 o19mr74168920qkk.330.1561077524459; 
 Thu, 20 Jun 2019 17:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
 <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
In-Reply-To: <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jun 2019 00:38:31 +0000
Message-ID: <CACPK8XdXNaWBNsigUuxGJtKPrrO=9Jhuy_Tci3ShBVXFD3WKSg@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jun 2019 at 15:55, Benjamin Fair <benjaminfair@google.com> wrote:
> >
> > Andrew tried to build the machine and ran into u-boot issues which is
> > still blocking the machine's addition to our CI. Patrick, are you able
> > to look into that?
> >
> >  https://github.com/openbmc/openbmc/issues/3542#issuecomment-501706892
>
> That issue will be resolved by switching to a 2019-based U-Boot branch:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/22556

This has been merged now.

Andrew G, are we able to turn on the CI?

I think we have consensus to drop qemu, and enable gsj. There were no
objections to enabling swift too.

Cheers,

Joel

>
> >
> >
> >
> > Once we get the u-boot issue sorted out, I propose the following changes:
> >
> >  - drop qemu from CI. 'qemu' is actually testing on a generic arm
> > machine. A few of us at IBM have a side project that has resulted in a
> > high quality Qemu support for the aspeed boards, so if you would like
> > to test in qemu I recommend grabbing palmetto or romulus and doing
> > that. So consider this dropping the generic qemu image and instead
> > focusing on the aspeed one.
>
> +1
>
> Many things are already broken on QEMU, including phosphor-ipmi-host.
> It's not a useful platform to test with.
>
> >
> >  - add gsj. This gives us coverage of the nuvoton kernel and u-boot,
> > as well as the nuvoton specific layers
>
> Agreed. I'd also like to switch to (or add) a Nuvoton system with a
> host once such a machine is supported upstream. The gsj is only a
> storage tray so it doesn't test IPMI bridges, power control, etc.
>
> >
> >  - add swift. This is an ast2500-based system that we're looking to
> > use emmc flash with, and having testing for those images will be
> > useful
> >
> > Cheers,
> >
> > Joel
