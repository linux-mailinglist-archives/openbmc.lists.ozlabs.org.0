Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CCB609927
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 06:32:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwhxZ601Nz3bjl
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 15:32:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SSom7+WT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SSom7+WT;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwhwz1mVBz30MT
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 15:31:46 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id y10so5904663wma.0
        for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2022 21:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylbB4TgUiswMgNzXSY5he3eIqSXYWsOOUzR5PI8EGsE=;
        b=SSom7+WTWWQQQe+Y+e8Ub1OT3weBuj5k3v8QJ04XZJJjiOk8V2VYo64Icmal1AZj1h
         60Oijsco/7KAewTwdPm7b5IIlbadsCC3aTYLjMgPzFUYQEW2Ryv+/BnGzKiImdNEsSpi
         5zFyt9LkrZl6CqQzZ1HEhGnmsE7G9P7NYs9v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylbB4TgUiswMgNzXSY5he3eIqSXYWsOOUzR5PI8EGsE=;
        b=6JQZEpuc3ixy5C4ahhfUStrn+oAArgvS8wVgnus3lO3A4ShhhQ7rfcl3IE1EKGfcSr
         AVw/z5vllkvwb0JIjlu319je4oUwP0wPMPWqR+XEd26q7mooUPN0xJXKB9ktCxZFpJ+r
         gJX9l/aD01+Xj+HJOhHmitZuBWudbAYsKFxgfxBrnczPVBRLs4n3bdRTreKzpZrsolqg
         YTUVQjiIsZhfEZP/euEs9i7mnBhOfENNqp31/B6PPK15TStIyekrE1jPWp6eFb9RjIq/
         z9fFExHIRQsBxV/XjCuYtyfFVWiPgFgXwuHNUdPhF8TijDziitPj/WBiE+h4WLNZKBmR
         JfqQ==
X-Gm-Message-State: ACrzQf3I7scpwyGGgBt1iSVa3fYyyX2piNsIIDSg9/QoYrm1JwnJSfzh
	BSnZS7CkT49u6ClvX2R5yYmRpnycC0dYSFxAaPkCM38ntxo=
X-Google-Smtp-Source: AMsMyM7TpTfBH+liO+sM+B6d9v2mx9oWPte7qJnz126T6FBFjZW7JdDTixH5f92Cyj+rNoRO5J82fM4TeKDaTNgG3yY=
X-Received: by 2002:a05:600c:a46:b0:3b9:9b97:9304 with SMTP id
 c6-20020a05600c0a4600b003b99b979304mr20599951wmq.34.1666585902245; Sun, 23
 Oct 2022 21:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <Y1XXXhYYe8sKejoH@fedora>
In-Reply-To: <Y1XXXhYYe8sKejoH@fedora>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Oct 2022 04:31:30 +0000
Message-ID: <CACPK8XckGUQrMhOLCUmiouVZd0r655dQH3zpGRLw01pjpyPeBA@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 24 Oct 2022 at 00:08, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> Hi Joel,
>
> Finally I added v6.0 to Meta/Facebook OpenBMC repository. Instead of
> making a copy of dev-6.0 (like what I did before), I create a recipe to
> fetch kernel from your repository directly this time. In other word, we
> are sharing the same kernel tree now.

That's great news. Congrats to you and your team for getting all of
your changes into the tree.

> Thanks again for maintaining the tree, and it is very helpful. BTW, I
> may ask your help to backport some upstream patches in the future :)

Thank you for the kind feedback.

Cheers,

Joel

>
>
> Cheers,
>
> Tao
>
> On Wed, Sep 28, 2022 at 06:34:53AM +0000, Joel Stanley wrote:
> > Hello OpenBMC,
> >
> > We've been using the v5.15 kernel as a base for almost 11 months. In
> > that time there's been 16 bumps to pull in stable fixes. We have
> > merged about 300 patches in that time to support new machines, and new
> > hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed's
> > spi-nor devices.
> >
> > It's time to move to a new base to ensure progress is made on our
> > mission to upstream all of the support. By rebasing on a new kernel
> > release we can see what work has been done, and what remains. Since
> > v5.15 we have upstream support for:
> >
> >  - PECI, thanks to Jae and Iwona
> >  - MCTP, thanks to Jermey and Matt
> >  - spi-nor, thanks to C=C3=A9dric
> >  - nct6775 i2c and lm25066, thanks to Zev
> >  - ast2600 adc, thanks to Billy
> >  - ast2600 gfx, thanks to Tommy
> >
> > and others I have missed.
> >
> > In addition to the ASPEED changes the Nuvton hackers have been hard at
> > work. We now have support for their latest generation  Cortex-A35 BMC,
> > the npcm845 "Arbel" and it's eval board. Likewise the HPE "GXP"
> > Cortex-A9 ASIC now has upstream support. Congratulations to both teams
> > for this work.
> >
> > I have prepared a v6.0 tree that contains backports of the FSI and
> > Aspeed v6.1 patches, and a small set of existing patches. I will
> > publish this on Monday, or once v6.0 final has been tagged.
> >
> > As promised the last time we rebased, the Nuvoton patches that have
> > not seen any updates since they were merged in 2019 have been dropped.
> > They are welcome to be resubmitted as long as they are also being
> > worked on upstream.
> >
> > Please address any future patches to the dev-6.0 tree.
> >
> > Cheers,
> >
> > Joel
