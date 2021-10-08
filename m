Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB7426FA7
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 19:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQwMn4g1bz30R1
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 04:36:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Z/GPBCG1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Z/GPBCG1; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQwMM5hVMz2yxx
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 04:35:41 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so31945529wrc.10
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPTJSxY2QpM9V0qcdD8nbrJEJtr+sJZ/YbEyrztxVr8=;
 b=Z/GPBCG1G2ZXFYO3T/dlm2mMiz8GEcm9vdgDzvVEoqitpcQ5JJssECRSaN+mW9fPv/
 hBM2P6heShOhL60P9X0+G0ODEyeq7oHNDCMQeyJ31uTSCCsrTuTERUspNh7VpL0ojWWj
 6CSXaIUOecrQ4ehUP6WdZkueoSyny3rgk0sbk5cwJOPAhwpYz4NdRGTqToHCjV8btXQ3
 VhqLHx3oR0nH30tdiGyDSnEWX3U6Osg5LxSoMhSHuVhSY80fWESflJL0xpwNoa/y/Csp
 SrR2832lF7B8pCPlFYwh9CYwivfjelnC3FBLVWE4xEE7eRFm3Y0AAmSV2hBGNooX+8mU
 iFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPTJSxY2QpM9V0qcdD8nbrJEJtr+sJZ/YbEyrztxVr8=;
 b=DoLJfGYTBNHesb4BF622ugeDzJ1zf+FaxaFcDN2Ut0DY0+bQUY64qM3oG6duT053ie
 6kluGaNIG47Y5TFeMaO4gh7PwReOipxyd2vsXQ4d597azMBVCb3gZOgfzUjINYrhmqJz
 KCR+QIYrdxAxafNAAhouata8I/AXrvxvbVEpP4zTNnQ2D3Zya17IooPC6WKmX9RcsXNU
 8gcp9dDYHg6Y/9/ZifBZcC8Ib8bwG4ULeBkBPTh9wAi/09TbCAPe0Q7yXPubXTwGdICH
 fW3t/7BR/kG8zld2+e0/3QVWEaQ7zB669tCq/Y/n7C1JnVu0oOhTsQAFpomEYkgBUmQn
 G7UQ==
X-Gm-Message-State: AOAM530wVrC0nrneX2YhChEtBgNiHVT6IcJuqY9h+TatsArbY2RUkJov
 2Rfm2iNqBdbofOdAcyQ4JpQhxSNz9sFRb8imefYCjQ==
X-Google-Smtp-Source: ABdhPJwhzeLqQtRe840W1eNXOF84RkOdDs1wgmpb5jM//t1hXllq7RMq+p7VPPX7QPbgTp0JtKqCfHlw4RnefNY9//A=
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr5760444wrb.83.1633714531494;
 Fri, 08 Oct 2021 10:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
 <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
 <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
 <CAGm54UF82Xx_N0g2d0sOx8Yt0vZ--+eAk18cS_68nt2RPoL=pA@mail.gmail.com>
 <CAARXrtnhAirRLo3EWM5=3KhjJWaWq1kPTeZ2=Yuec43Ebp1Y9g@mail.gmail.com>
In-Reply-To: <CAARXrtnhAirRLo3EWM5=3KhjJWaWq1kPTeZ2=Yuec43Ebp1Y9g@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 8 Oct 2021 10:35:20 -0700
Message-ID: <CAH2-KxCSosmLTXM2=m=cuG6X8=_MUW30ZgYEfbhGvdJXhWs-pg@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Lei YU <mine260309@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 8, 2021 at 1:31 AM Lei YU <mine260309@gmail.com> wrote:
>
> It's noticed that the `repotest` is enabled in CI and we got CI
> failure due to node-manager's patch:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47673
>
> I know the right way is to ask Intel to upstream the node-manager and
> fix the issues we met.
> But in reality it's not easy and it takes time for Intel to upstream a
> repo (and it depends on Intel to decide whether or not to upstream)

If this is something you need, there's no need to wait for Intel, as
that application already has an Apache 2 license.  You are free to
upstream it and maintain it yourself if you don't want to wait for
intel.

>
>
> @Ed Do we really want to reject such patches?

I don't want to reject patches, I want to see them on master in a way
that things can be changed as needs evolve.  This patch is a perfect
example of something that, had we taken the small amount of time to
upstream this small daemon, wouldn't have even been an issue now as
sdbusplus needs to make a very minor change.  As-is, we're effectively
2 levels of fork deep (openbmc upstream -> intel-bmc -> openbmc
upstream only for bytedance systems, which is the source of the
problem, not this patch itself.

>
> On Tue, Sep 28, 2021 at 4:37 PM Lei Yu <yulei.sh@bytedance.com> wrote:
> >
> > > > I have a similar case.
> > > > As an x86 system, some of the recipes/changes are referenced from
> > > > Intel-BMC, which is not upstreamed.
> > > > Currently, we had patches related to UART routing and
> > > > phosphor-node-manager-proxy.
> > > > The UART routing patches are being upstreamed thanks to Troy.
> > > > The change to node-manager is related to the HW design difference, and
> > > > due to the fact that phosphor-node-manager-proxy is in Intel-BMC, we
> > > > can not really make the patch upstream.
> > >
> > > I'm not following why that's preventing upstreaming.  If
> > > node-manager-proxy is something you need on your systems, I don't see
> > > a reason why we would avoid cleaning it up and upstreaming it, but I
> > > have no details on what this patch is, or what it does, so it's really
> > > hard to talk in concrete terms about how to proceed next.
> >
> > node-manager-proxy is in Intel-BMC, so we really need Intel to
> > upstream it into openbmc.
> >
> > --
> > BRs,
> > Lei YU
