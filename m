Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1B6A0350
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 08:34:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMlC04NcYz3cKb
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 18:34:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iZ25G3XT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iZ25G3XT;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMlBQ4Swnz3c8G
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 18:33:34 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id y19so5463060pgk.5
        for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 23:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIjkTDh8M1dP8SCMsyCeSJuS1gRVeECoWs/gYQewViU=;
        b=iZ25G3XTc+8TEBwlvdFa18XxbJbcuxtdJzYcJyDgAX89CIjwxeZs3J6OLAlstOXsAf
         FM7strDJ+u20DOTG1Lw2+ilyv1gpz6t+PdEN9DDtfg8cfH6rB/bqVa/fgdQtUIMlaV1o
         WakimBMfPt1HmA0aAtIWuBhApQIXsQwLrzZ2i0pP+Idqr7AhFCdsqfEHdxNBr1NR5TPG
         inurZOZbEw24dK62Q6WRVLZkZdcIdN4u7Y2RwbK1zx4ej0aEKF8qMbxi5MPtdRcPhBPD
         Bty9nHdyHh8mW+cyB45ObtTG5l+1BcWwlnrPGll5dZxTncGnEyRxqTGwyoCn7jlU7aO1
         mJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIjkTDh8M1dP8SCMsyCeSJuS1gRVeECoWs/gYQewViU=;
        b=iAw1vpfa/n8ZGd5TcrHQbYJ0yOMx1BErQz1XmK89pG9hsTr7w9yLSP2Es9LCQ+4+kh
         xr3ytIt3H7R4qD6830mnK3pM3S+5+IrH5O2rmICrO3QazLpaIUD08TRk499T6JGnPvOG
         fJYTXEIN3qYf3Tun+YD2Jo3B9iXp1IEiEhQPUivQPki0fDoyOcnG+uaiwb8zURyBNvdW
         VtreoB7l3xjBmUCHGYtXFjhd5QPkaJ3QmZPlJ5JuRyyF4B9LEXPcmDBWNMpU7/4C14gH
         6HF50tFqUqXb5Ev0zh1Y3SraFqUiw11AcKdEUM6dD0RwI5mUFxyloqyAmD/inaLvp7nB
         0h1g==
X-Gm-Message-State: AO0yUKU8me8RT19P/9+sNx0N4dlvSWWM10K81cMY/lOZ73KpP3PkoRuv
	RzpswjEXYk3hyhT4C+55rc5vkwWqR50=
X-Google-Smtp-Source: AK7set+LpkxkLa1wH2T9XS+HzFboeg9FKQktTKznk+O4JrIfqKnVsw3PVJVrzAIzPLxDteH0+rxoJw==
X-Received: by 2002:a62:1c55:0:b0:5a8:b55f:540e with SMTP id c82-20020a621c55000000b005a8b55f540emr11163941pfc.6.1677137612213;
        Wed, 22 Feb 2023 23:33:32 -0800 (PST)
Received: from fedora ([76.132.59.39])
        by smtp.gmail.com with ESMTPSA id d7-20020aa78147000000b00571cdbd0771sm7109398pfn.102.2023.02.22.23.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 23:33:31 -0800 (PST)
Date: Wed, 22 Feb 2023 23:33:29 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: OpenBMC Linux 6.1
Message-ID: <Y/cWyUVGkYA2UvBp@fedora>
References: <CACPK8XfAtPfUxBP92iwqRpnaRgP=51_SyuYsxCrpk3MQ9do6WA@mail.gmail.com>
 <Y/WyIjpX/T0g9RdP@fedora>
 <CACPK8Xf-3Du23NZDGR_SkPUmDT96=E3PH-FVzDSBZ6R55kooRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf-3Du23NZDGR_SkPUmDT96=E3PH-FVzDSBZ6R55kooRg@mail.gmail.com>
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

On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:
> On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for the update. Let me move some Meta/Facebook AST2500 and
> > AST2600 Network OpenBMCs to v6.1, and will share my findings later.
> 
> Thanks Tao, I appreciate it.

Just heads up I sanity tested dev-6.1 branch on 3 aspeed generations,
and everything looks normal. The 3 openbmc platforms are:
  - wedge100 (AST2400)
  - cmm (AST2500)
  - fbdarwin (AST2600, dts to be upstreamed)

> 
> > Besides, could you please share your long term kernel upgrade plan? For
> > example, are you planning to align with LTS kernel in the future? Or the
> > ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> > released?
> 
> Somewhere in between those two.
> 
> If we were to wait 5 or so years between updates, then we remove the
> motivation for developers to upstream their code, and I imagine it
> would be a headache to hunt down regressions when making that big
> jump.
> 
> On the other hand, management has been trained to target the stable
> releases and somehow consider them to be better than others. I argue
> this isn't true, because the code is only as stable as the test and
> development resources that are put into it! That said, it's less work
> to merge in the stable tree every week or two and test that than it is
> to do a new rebase every three months.
> 
> The ultimate goal is to have all of our code upstream, and just use
> whatever kernel yocto has. We're pretty close for aspeed machines; at
> IBM we have some downstream hacks for misbehaving i2c devices, and
> some device trees for pre-production hardware that have minor
> differences to the production version. If we were to upstream the
> hacks for i2c devices (or stop using them) then we could ship upstream
> kernels.
> 
> Ultimately it would be best for the project if we used the latest
> kernel on master, and had a LTS kernel that was used by product
> branches. This would require the project to fund someone to do this
> work long term, to ensure the stable updates haven't caused
> regressions, to cherry pick patches that fix code that was not present
> in the upstream release, and in their remaining time help get more
> code in mainline.
> 
> Cheers,
> 
> Joel

Thanks for sharing the details, and in short, I'm moving torward the
similar direction:)

My current plan is to upgrade openbmc kernel at least once a year
(skipping ~4 kernel releases) for facebook network openbmc platforms,
and I'm facing the similar challenges: upstreaming kernel patches and
test enhancement. I don't have plan to force more frequent kernel
upgrade in 2023, because if I had bandwidth, I'd rather spend the time
upstreaming patches: I believe kernel upgrade would be much easier if
all the patches are upstreamed.

I quickly went through the local kernel patches in my repo, and they
fall in 3 major categories: 1) JTAG master drivers 2) hwmon drivers 3)
enabling dsa in a few dts files. I'm not sure if anyone is actively
looking into the jtag patch series, but I will try my best to clean up
some patches in #2 and #3 this year.

BTW, I will create the recipe to fetch dev-6.1 into meta/facebook
openbmc tree soon. Thanks again for maintaining the tree.


Cheers,

Tao
