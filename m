Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B451A321
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 20:47:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450zhf1l1jzDqTy
	for <lists+openbmc@lfdr.de>; Sat, 11 May 2019 04:46:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dCmZ82zO"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450zgm4QX8zDqRq
 for <openbmc@lists.ozlabs.org>; Sat, 11 May 2019 04:46:12 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id w6so6481955otl.7
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NphYlJTT0atfZWiQGMxbq2XhyDjPdsI1Sw33jNDMjvs=;
 b=dCmZ82zOgVWZRQaddbM2kDvPGeBSF21EvL5X6/f5DCY0TtO4pjaRbCzVWNGGAA6hy+
 AL3xpzYlzivurARyUdvh2A2NvhKydfqSgPyfVvzZ01Zb2LpRYvWL8dlujKZ05PGrdTU7
 X9iPSAycAllFz+69V58MrlW1Ou6EfYmXlsLXw0aTK0zg4M0jE8Cs0jS9tCMXRcDbf1Es
 jVY3zA/lFApwfKZbVl15ZTAJpgT/NdYlo/hMoaFY6jWpDFMx/WnWOF/IUJA1StOelVSp
 8zf6f5XKD+09xAb2Kl1Guq06165dSE4Jo+mVywY2DQN5wuJ8y9rC+KjC8wvX38b8AI4J
 O/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NphYlJTT0atfZWiQGMxbq2XhyDjPdsI1Sw33jNDMjvs=;
 b=cAmbfuiTxbwnLMwdP0Htk5WV0dzTe5vcErBvBjddd4jZmjoMlQe04bhifiCaNynuue
 YmRSbTQ9WQvFxfORsniRpS0g+Oe9cHb5tES6koqj6JIekhVEAFAeYYA9Sj7rCCmbMiqk
 Ukqd5D9vEPA8gSqOLBrEfWFnUUtXqAvG2vnG/wyFrXeQ4/smHQv5NBdt9G4/8obdVuV+
 VeJdFe58LabGaGN5yB2kJDR+gPCuCSgZkOxHeirF3tjh7cj1xGTH0XQNNSx1vv1rM0BB
 QmIUFh3vuAOb07oa3ktWDC1hdVwQnt3q+IYUjS95rNwgACKKV47B4RKOXHy2ofLlb++j
 c8Vw==
X-Gm-Message-State: APjAAAV90nMiKuKbX7sta0uYVtvPuy4CjJ8l9V+JnJoynaPv5Ia+mvtx
 wytSfPIZmy0LDeOuokikIakyZnR8nC0A3IoyTeY=
X-Google-Smtp-Source: APXvYqytqX5A2Y9qfExPLfVppuGfggETjgFohKxsEURkg7J9GfjPfPjjdboiwjDHBcJRzEeM1LpnP7xsC1jXMY+ixIM=
X-Received: by 2002:a9d:6519:: with SMTP id i25mr7852840otl.287.1557513968417; 
 Fri, 10 May 2019 11:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
In-Reply-To: <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 10 May 2019 13:45:52 -0500
Message-ID: <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Patrick Venture <venture@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2019 at 9:33 AM Patrick Venture <venture@google.com> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
> Date: Thu, May 9, 2019 at 6:11 PM
> To: Andrew Geissler, Benjamin Fair
> Cc: OpenBMC Maillist
>
> > On Thu, 14 Mar 2019 at 13:39, Andrew Geissler <geissonator@gmail.com> wrote:
> > >
> > > I took an action item from last weeks Infrastructure Workgroup.
> > >
> > > The point was we're wasting CI resources by testing meta-*
> > > commits that are not actually tested by any of the machines in the
> > > CI job. We're also falsely marking those commits as Verified because
> > > if they are not in any of the systems under test, they're not being
> > > tested at all.
> > >
> > > The systems currently run as a part of the meta-* CI jobs are here:
> > > https://openpower.xyz/view/CI/job/run-meta-ci/
> >
> > > Are there any advantages to running CI against meta-* layers that
> > > are not in a machine being built? Are there other machines we can
> > > add to CI that would cover some of the meta layers above? The
> > > general criteria for getting a machine added to CI is that it's actively
> > > being developed and supported. We also need to balance our
> > > CI compute resources so the overall goal (in my mind) would be
> > > to pick the machines that cover the most meta layers.
> >
> > I'd like to have a nuvoton based machine so we have some confidence
> > that kernel bumps aren't broken.
> >
> > That would mean adding the evb-nuvoton or gsj machines to CI.
>
> I vote for the gsj machine.  Not that it's a democracy :)

I gave this a try but ran into https://github.com/openbmc/openbmc/issues/3542
Be great to get gsj into CI since it would give us a few new layers
for coverage.

google provides a good chunk of the CI build infrastructure for OpenBMC so
you definitely get a vote :)

Andrew

>
> >
> > Cheers,
> >
> > Joel
