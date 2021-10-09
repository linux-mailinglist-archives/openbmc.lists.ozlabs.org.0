Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51F427679
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 04:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR7yc5xZvz308m
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 13:18:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=32b0+MSH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=32b0+MSH; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR7y86QDFz2xY2
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 13:18:04 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id z126so1828848oiz.12
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 19:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5p+uZMdN2vZioeKZI7exWifsWp5x7aYjDJz9UC5OoTE=;
 b=32b0+MSHQpn++1r61LOlRsqfWkInxfNtZf1Dq+QZA5ub3iGvZGVi/II94QNsCjCRgA
 BFZHKqx8F9kiQDXEPeJYau1X4zoSNfZ3Y9JKbb6aMTYBTmVCLWulg9tcTb25t1lgml1M
 XXpFyC0t17EvtHM+bP/YsXQQCU91JlUJLfJWghmc5D93H1DQb29lmTWYy3T/2zmI8tmQ
 oFqh5lQtOIpkO5EgPOF6WHVXKshkShFFa9tPA+0XILl+sWTiAv9EaQIaXKd6szs6A4k7
 vsKgcnuH8T7kpdQbsP439D83l+cFjU4yxdpc8lvVyl6rZVAv5gWt7fc14WTryAu/n6ez
 d53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5p+uZMdN2vZioeKZI7exWifsWp5x7aYjDJz9UC5OoTE=;
 b=uT1C7pMF2dYzycC27wd4xcw9JzgRNk7C9rLqBvo59AENAw1TxmbEvPFD9hRLrkz8V/
 zquWAzn56IkfKCJp8uCAif3XNy8ejCigNW3gwBMvVtQPBt155Nh6tRqfxTjfsyXnQEB7
 WfK78DtPP4LEzu6ibrNMarr56icoisXY00EaUQDTfnlgOeo1bkPUbWzPKels+BcoqmK6
 TxdUaGGQ0UGMc3eCnoOsS6GdiqtVUhZYp9xE1fD4FZXa77IFjT2TOC87nf80fss6lMT+
 6fFuQOPkCx0cfQIUYqPZd8RdSDIUh00vLrOgjmf36M57p50wH+pnMoKbP4GGnlMOcjfb
 lUjg==
X-Gm-Message-State: AOAM533+mghSP6dUyH3OgvK4m+vCQ3vzotpihMFTpXZ/m1CrhgDTCkKq
 obwaDqQcp/uk1DXVkXvJuFdD8KkN1xTt+1of8uIrIig6GnUVqQ==
X-Google-Smtp-Source: ABdhPJwwfldFaPZgdpk6e7dM42SjL/SNUuf1c4pkZrMgILMP8MsJYI1mnOQosjVIlUfhP86n01KhzIu2t/31s4ZICyg=
X-Received: by 2002:a54:4d9e:: with SMTP id y30mr18873471oix.50.1633745881496; 
 Fri, 08 Oct 2021 19:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
 <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
 <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
 <CAGm54UF82Xx_N0g2d0sOx8Yt0vZ--+eAk18cS_68nt2RPoL=pA@mail.gmail.com>
 <CAARXrtnhAirRLo3EWM5=3KhjJWaWq1kPTeZ2=Yuec43Ebp1Y9g@mail.gmail.com>
 <CAH2-KxCSosmLTXM2=m=cuG6X8=_MUW30ZgYEfbhGvdJXhWs-pg@mail.gmail.com>
In-Reply-To: <CAH2-KxCSosmLTXM2=m=cuG6X8=_MUW30ZgYEfbhGvdJXhWs-pg@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Sat, 9 Oct 2021 10:18:04 +0800
Message-ID: <CAGm54UHq33wD5Fm6D59Mq=XwFrQvXQ0qdbV-CSRwNLuyfj06hg@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Ed Tanous <edtanous@google.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Oct 9, 2021 at 1:35 AM Ed Tanous <edtanous@google.com> wrote:
>
> On Fri, Oct 8, 2021 at 1:31 AM Lei YU <mine260309@gmail.com> wrote:
> >
> > It's noticed that the `repotest` is enabled in CI and we got CI
> > failure due to node-manager's patch:
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47673
> >
> > I know the right way is to ask Intel to upstream the node-manager and
> > fix the issues we met.
> > But in reality it's not easy and it takes time for Intel to upstream a
> > repo (and it depends on Intel to decide whether or not to upstream)
>
> If this is something you need, there's no need to wait for Intel, as
> that application already has an Apache 2 license.  You are free to
> upstream it and maintain it yourself if you don't want to wait for
> intel.
>
> >
> >
> > @Ed Do we really want to reject such patches?
>
> I don't want to reject patches, I want to see them on master in a way
> that things can be changed as needs evolve.  This patch is a perfect
> example of something that, had we taken the small amount of time to
> upstream this small daemon, wouldn't have even been an issue now as
> sdbusplus needs to make a very minor change.  As-is, we're effectively

Totally agree. We have already asked Intel to upstream the
node-manager, let's wait for the feedback.

> 2 levels of fork deep (openbmc upstream -> intel-bmc -> openbmc
> upstream only for bytedance systems, which is the source of the
> problem, not this patch itself.

True. But as an Intel x86 platform, the repo is needed and in the
current state, the patch has to be added. Otherwise the g220a build is
broken.
Is it OK to ignore the repotest CI failure and just merge the patch in
meta-bytedance layer?
(Be noted that it's not trying to make a bad example, but only trying
to fix the broken build)
