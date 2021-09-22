Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79B41418C
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 08:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDnxm3J64z2yZB
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 16:11:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KhqjKtr5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KhqjKtr5; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDnxN2zMQz2xtv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 16:11:34 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id p4so6211715qki.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 23:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kM853qG8TvBFzz7C6Ngb5QSP3OrP4B0gVyL86iEFEXc=;
 b=KhqjKtr5yXF0KGknWtbuexD2mRJ2sspJfqaV38L5o+G4sR9Co45TsFHD4V+EkoE6dR
 IyvSr5wEa8NygVt3NjSllqR/V9p/8lprFv+nEu4DSMBGGxT6nv1YXBnsfkYcrf0DlvLQ
 bCLYcZALLxcUg5OTVmjHMytVf53qzIKTgPJc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kM853qG8TvBFzz7C6Ngb5QSP3OrP4B0gVyL86iEFEXc=;
 b=MOA0m2Pd20peUQStXII66n6lErafoY++XcWXvnTAyzjREewvQx/qfWaxGk5BX00tce
 7PosiWGp8NA5noV5MNiLZ1mB1QQPrJW3+vMiGsZHGcxCk45ITDLwC3FeQkMH4cMaPqvb
 Nz8HuqaHBkuqgElo5DFWkTfKB7QrP7Zig2QUXc58Ik2sQCPQm4EwQZhcPNXujCMZ4l0b
 c8IHjx7PRiVXHSWDOA7mDXc/aSzJcncz1BAsAT2uAALdHoeuVEDJATXq8+mT+LDsh+Rx
 2Qik0NkuEZco2PuBCa3wJ1b4U9sRiHD41syWedKoDtGu0zIv5KYowD9mpa/g7nCxM6qG
 CHmQ==
X-Gm-Message-State: AOAM532WCzruryx/1InNyjT99mCYkuVV6/wyAL5TU99NP9mRTcYMUY4t
 jrOYBdQ4H9w7LU+B1igYdb1FUVuuFr4UvjmmFG6lnRXR
X-Google-Smtp-Source: ABdhPJwOsbXhx9pBXnAdcGE+8c6kx1QGf3yd2BsYR39k0YXxVM5iX+idpr6UMaAiNVXBxGw/HflyH88LLl1xa34UZ0E=
X-Received: by 2002:a05:620a:1aa6:: with SMTP id
 bl38mr33242767qkb.36.1632291090771; 
 Tue, 21 Sep 2021 23:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
 <CACPK8Xeu_3y4Mnsk-_rzWRQsx0nY=0cuqkM4FGoz_sbhOZ3BCQ@mail.gmail.com>
 <20210922060848.GA31321@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210922060848.GA31321@taoren-ubuntu-R90MNF91>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Sep 2021 06:11:18 +0000
Message-ID: <CACPK8Xe_fqxMqzRUW1CMa1iJQaOCmVE7fyK7Q2G5zUFHtDGZgA@mail.gmail.com>
Subject: Re: Kernel moving to Linux v5.14
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Sept 2021 at 06:08, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> On Wed, Sep 22, 2021 at 12:24:46AM +0000, Joel Stanley wrote:
> > On Tue, 14 Sept 2021 at 02:11, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > The openbmc kernel will move to a 5.14 based tree for Aspeed and
> > > Nuvoton machines.
> > >
> > >     linux-openbmc: Move to Linux v5.14
> > >
> > >     This moves the OpeNBMC kernel to a v5.14 base. There are 78 patches in
> > >     the tree, plus a the MCTP core and device tree changes that were merged
> > >     in v5.15 which have been backported.
> > >
> > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46847
> >
> > This has now been merged. Thank you to those who reviewed the change.
> >
> > Please address future kernel changes to the dev-5.14 tree.
> >
> > Cheers,
> >
> > Joel
>
> Thanks Joel for carrying and backporting the patches. I'm also porting
> Linux v5.14 to Facebook OpenBMC tree and these patches are very helpful.

Thanks, I appreciate you saying so.

Even more helpful would be to have your patches in the openbmc tree, I
would think.

Would you consider doing that, instead of us both having to spend time
maintaining separate trees?

Cheers,

Joel
