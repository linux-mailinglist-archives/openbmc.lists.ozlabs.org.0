Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F2453B7
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 06:55:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q7Zm6Nc2zDrQ3
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 14:55:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="bzTP2qSA"; 
 dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q7ZH01NDzDrPy
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 14:54:46 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id i34so1082772qta.6
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 21:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a4jq7+FeyNgig7uoYeW41jdV4RNy907V4kpYbPMTFD8=;
 b=bzTP2qSA6ydr09NnrHpnE2M+GG9FGeUayMY8/uRcsiTQBUaQRzKPW06ROCfPlBjfgj
 18eJTxnuEO1I/rkRA+y+g5buQT89uWIlxN2N0QJVter7+WHf96m2u5fdzmBX7Co5F+pv
 DtQHJ1vmVVtg9P2W+tDx+sNRJynRnTE+jC8Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a4jq7+FeyNgig7uoYeW41jdV4RNy907V4kpYbPMTFD8=;
 b=Cv/DuewecJLgNzqQ++RT8a60dAMCeQrRoE1r9P+jU0cEOzWVhoKA0EWHwEvu2yD7lc
 8bZO3STLzXJpBHH1P130CJKgzc2D2nDUGJu3Mxb/DM5r0dYpdiQfCK6MAgFlgFNM52jL
 f6Hlt/tcLji0BQBSf9FlQNj6BB70/HQ0Ko8sRHKpOODPLdwYGnSny3E3fs5QyLjvhEf6
 4XqwJM9l92SmPtc783Dn+Em8e2iF2lgHTLERRRYqOpZ2U+ZVKJaD1BMlNtS7cVk6Ju5B
 apY+Wn7yR2a6b456WMM+eju3JGQBrYY646ewxKBayc47KpFTLGXMrAVKtfhVJPNTj8Vb
 qN/A==
X-Gm-Message-State: APjAAAXSClyaGA8ZI3+BtQwbNANK4AC3bYQHcATPqXdzGFVIKc0FHeTt
 ypwd11qdnPQ+xThhdKGmgNimSRm4hO3HsdOP0X9em+H+K8E=
X-Google-Smtp-Source: APXvYqx9T9MYrKa0CLTLwyTx+80a5zjNycWo0RoayqcKn1TCMUkzUR1ZirzkqPoiin46fJlovgciGB9r7IJh4fBytGk=
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr6563896qvc.105.1560488082315; 
 Thu, 13 Jun 2019 21:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
In-Reply-To: <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Jun 2019 04:54:30 +0000
Message-ID: <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>, 
 Benjamin Fair <benjaminfair@google.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 May 2019 at 18:46, Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Fri, May 10, 2019 at 9:33 AM Patrick Venture <venture@google.com> wrote:
> > > I'd like to have a nuvoton based machine so we have some confidence
> > > that kernel bumps aren't broken.
> > >
> > > That would mean adding the evb-nuvoton or gsj machines to CI.
> >
> > I vote for the gsj machine.  Not that it's a democracy :)
>
> I gave this a try but ran into https://github.com/openbmc/openbmc/issues/3542
> Be great to get gsj into CI since it would give us a few new layers
> for coverage.

gsj is now supported in the kernel.

Andrew tried to build the machine and ran into u-boot issues which is
still blocking the machine's addition to our CI. Patrick, are you able
to look into that?

 https://github.com/openbmc/openbmc/issues/3542#issuecomment-501706892

Once we get the u-boot issue sorted out, I propose the following changes:

 - drop qemu from CI. 'qemu' is actually testing on a generic arm
machine. A few of us at IBM have a side project that has resulted in a
high quality Qemu support for the aspeed boards, so if you would like
to test in qemu I recommend grabbing palmetto or romulus and doing
that. So consider this dropping the generic qemu image and instead
focusing on the aspeed one.

 - add gsj. This gives us coverage of the nuvoton kernel and u-boot,
as well as the nuvoton specific layers

 - add swift. This is an ast2500-based system that we're looking to
use emmc flash with, and having testing for those images will be
useful

Cheers,

Joel
