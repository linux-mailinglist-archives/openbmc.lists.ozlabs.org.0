Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FEE42960B
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 19:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSmVH1DH6z2ybB
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 04:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KGAnLsdC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KGAnLsdC; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSmTr19HLz2xsW
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 04:47:41 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id o20so58506360wro.3
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CD4U2BX4E+kiITaHGHSsl3DKnn2pX8JeFjnIxeL4Ask=;
 b=KGAnLsdC3iq/1dgzHeU/gVbJi5IWN90UF2gZn+JHpSrlLQC3k7u375wwFGWJtvL13K
 fCi5hMO2dpN70R9uMV9GAvmNd4Fy35j1ZSgMmC0Gtvk5z2cFjjMB66uO8jQvE+7ouJmS
 0AmSsx9V5I2bWVgVjRXFKlAtKQY86wMT1M8Dlnx/XnRuww/x7yu6wYMenS9vAa8LdaYy
 pqUStlesafPeWn/IrLPp4ChpEQnCVcP4IjFiAyWyOIFxaifR348nJZfy1GLPaq2DgIkk
 Ptun2jD5eZqnm7nVl75kc+GO+Fzi9HtADGeSp4Ra9wekxTfDS/BYxjTA9bqE85xpQqw5
 zmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CD4U2BX4E+kiITaHGHSsl3DKnn2pX8JeFjnIxeL4Ask=;
 b=bAjE7YZVBaX6dxh4BXzVWvxQe9YqMdgZi2HbEkKlE8iA12WF7PSCUU6kbbll/kGvi+
 WPtaOXyw1g3bA7X9gpQ7uTWEwNe+Ctaud+DpWvBLtSLkKJw/AYSbvfM+RVYZS4ocr7dq
 WOYEugD15ju+UjZWIJIx+fYr8mRha7fqePaAwk6xeOI8O1Zs5XJzWV2SgdhGKdB8z5+4
 +8Ud6qkHlsLEI/JSbBejWzAGj1g5W61LT+oU3REowvgZwd5YxELRr70mZ+j/fgSY/g4P
 zZ/H7Lku6btJ7UCM8i2OrwzAWV9pPfuv7RhRPECDrevjYmYs2H7zw0NJeV4w+bn7PMtQ
 pcaw==
X-Gm-Message-State: AOAM53157/JnIaoXLYTN0RxhQZqYeiKYCPwLyDu1BojKiVqKlRCcYM2u
 M2RpJMBCfOWDgD3U3WSNvExUqpbFBniVARCwgzGruA==
X-Google-Smtp-Source: ABdhPJxdXkHXLsEFZGXVxddslC426+PJoaOvqhNBtxp0SaQs/Vi8NPnDGk5eLDY2wabQ7Y4oFzSSCyEL6yDx0XE9Cls=
X-Received: by 2002:a7b:c258:: with SMTP id b24mr389512wmj.160.1633974455754; 
 Mon, 11 Oct 2021 10:47:35 -0700 (PDT)
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
 <CAGm54UHq33wD5Fm6D59Mq=XwFrQvXQ0qdbV-CSRwNLuyfj06hg@mail.gmail.com>
In-Reply-To: <CAGm54UHq33wD5Fm6D59Mq=XwFrQvXQ0qdbV-CSRwNLuyfj06hg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 11 Oct 2021 10:47:24 -0700
Message-ID: <CAH2-KxDZD0hYdmrbainSHHKhtqp32a=aXmJg1WxyFOtGTSzCEA@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Lei Yu <yulei.sh@bytedance.com>
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

On Fri, Oct 8, 2021 at 7:18 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Sat, Oct 9, 2021 at 1:35 AM Ed Tanous <edtanous@google.com> wrote:
> >
> > On Fri, Oct 8, 2021 at 1:31 AM Lei YU <mine260309@gmail.com> wrote:
> > >
> > > It's noticed that the `repotest` is enabled in CI and we got CI
> > > failure due to node-manager's patch:
> > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47673
> > >
> > > I know the right way is to ask Intel to upstream the node-manager and
> > > fix the issues we met.
> > > But in reality it's not easy and it takes time for Intel to upstream a
> > > repo (and it depends on Intel to decide whether or not to upstream)
> >
> > If this is something you need, there's no need to wait for Intel, as
> > that application already has an Apache 2 license.  You are free to
> > upstream it and maintain it yourself if you don't want to wait for
> > intel.
> >
> > >
> > >
> > > @Ed Do we really want to reject such patches?
> >
> > I don't want to reject patches, I want to see them on master in a way
> > that things can be changed as needs evolve.  This patch is a perfect
> > example of something that, had we taken the small amount of time to
> > upstream this small daemon, wouldn't have even been an issue now as
> > sdbusplus needs to make a very minor change.  As-is, we're effectively
>
> Totally agree. We have already asked Intel to upstream the
> node-manager, let's wait for the feedback.'

Let's not wait any longer.  The code is licensed appropriately, is
already open source, and in total, is smaller than a number of single
patchsets I've seen in recent history (it would probably classify as a
medium patchset).  Just open a review to add the code to an existing
repository, or request a new repository along with a design doc.  If
you want this to live in dbus-sensors, I'm fine with that, just make
sure we have maintainers that can test on their systems;  It seems
like an ok fit given it's another entity-manager enabled sensor app,
although I don't have a strong opinion between the two options.


>
> > 2 levels of fork deep (openbmc upstream -> intel-bmc -> openbmc
> > upstream only for bytedance systems, which is the source of the
> > problem, not this patch itself.
>
> True. But as an Intel x86 platform, the repo is needed and in the
> current state, the patch has to be added. Otherwise the g220a build is
> broken.
> Is it OK to ignore the repotest CI failure and just merge the patch in
> meta-bytedance layer?
> (Be noted that it's not trying to make a bad example, but only trying
> to fix the broken build)
