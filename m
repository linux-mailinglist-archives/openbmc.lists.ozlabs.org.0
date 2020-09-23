Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7432763D2
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 00:36:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxY1v40m8zDqTg
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 08:36:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sDTuUDla; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxY171JfWzDqF3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:35:55 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 133so870527ybg.11
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymgatjWSfXCU3qE60i8dMIl1Uh3qLXtbWfEwFSFrn6A=;
 b=sDTuUDla4boGSYXvG6i3d/5XD22EGNFWa8lQ63XXRdwr1gm7BIDoKDfgnXBTALp3Ux
 V33TLant+10hL0T48GcO25MwcV+PNxFwP6+t8ZRvHegwMieRW+g2xD0LYurg/XKNiBIW
 GicCR7Wf4TCyhoqP7eC40qNXFEwc1Av/0G2rJeavqhoQ/EmnF5k/wxyLXU4FeP1p0xuJ
 pmj9QPvs8eEY06V8aD/uZVSqS5LOmDgjW7Pfbjw1N4KqNbgFdKtoogQeRLkPNc79uI/w
 wmrLpLzjeFBdzjvRfFQ8BTahgZm90wxYBoSbeCvdL9Gm9//9DRLUxzcuUnUCyLMh3lvU
 zxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymgatjWSfXCU3qE60i8dMIl1Uh3qLXtbWfEwFSFrn6A=;
 b=P/+36PI/mnWxVzP5wbI4XEAYLPgTqJaYwcnems2lLsSmSGE1R8N9DEf3xngB0ewgr7
 nvATLxcQ0VVJnENY6G8CtJEcYuDTip3WeAdjj1QS9C4wS7D0UYCcPlEkWil4Je80rhsx
 O2KVCtsXXpgxwhbZPrTDeI82D2vfn80ZS3fc3Wu97Nnvdv049MaEk2ETvCio94yEBbBG
 XdFJmUP2c39oABcbVSQ1ewtW4O68Ham3TSmY5/eGZzreWodwgHUy+3164o7N6FynKIhL
 bZ5q0eBn8aiX5BnULnIVdIk2XaF9EqAAbkIbYv91wFwAd6Uk9ehLooNyaj4Qar8RO3aj
 8dGg==
X-Gm-Message-State: AOAM533UXRqhuI0y0XNnw0ctcnc6WBJL1ru84KOIxSHVjMMGTa5yG3qV
 SSA5r1+Wl4vfiL2oLpAB8TPAojGsii06q2tgU8lyWg/HgzNqpw==
X-Google-Smtp-Source: ABdhPJzMHp9xJechIwxsCFLJSqo8NFhoxzE08AtXGwSGdNklqw5u4Gsw44Qkbi0rLBMW6qPw6AVEfNab3NaRQn4i2uM=
X-Received: by 2002:a25:ef03:: with SMTP id g3mr3094110ybd.340.1600900551300; 
 Wed, 23 Sep 2020 15:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <e6cbdf1e-8504-d9d5-2554-fe2d4986e54b@linux.intel.com>
In-Reply-To: <e6cbdf1e-8504-d9d5-2554-fe2d4986e54b@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 15:35:40 -0700
Message-ID: <CACWQX827ftfPo-D9gBtDm_bdp7xq71c+hkxfHRVvzVqPoSfztg@mail.gmail.com>
Subject: Re: Chassis reset
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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

On Wed, Sep 23, 2020 at 3:01 PM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 9/23/2020 2:42 PM, Patrick Williams wrote:
> >
> > I'm not understanding what you mean by "come up with an API to steer the
> > Redfish..."  I think everything is specified here at a dbus level.  The
> > issue is figuring out the appropriate Redfish model of
> > Chassis/ComputerSystem objects (along with the included Resource.Reset
> > types).  To a casual reader, who hasn't been involved much in Redfish
> > implementation, the current mapping of these ResetTypes seems fairly
> > arbitrary.
> >
> > With CIM there use to be these Profile documents that showed "the right
> > way" to fit all these pieces together.  Does that not exist with
> > Redfish?  How does any external application consume Redfish in a
> > consistent way?
>
> I'm not sure it helps with the overall consistency question, but for
> OpenBMC, we defined our mapping of Redfish ResetType values to Chassis
> and Host State Transitions on D-Bus, here:
> https://github.com/openbmc/docs/blob/838fa962b73deb1ef7908ee8dfa1203fa5263517/designs/state-management-and-external-interfaces.md#proposed-design.
>
> This is what x86-power-control aspires to match and I think what led to
> creating new D-Bus interfaces for the chassis_system and AC power state
> changes (since we didn't want to break this mapping).

Sounds reasonable, it just makes things slightly more complex for
Redfish, as now there's two things that could be a redfish Chassis
reset.  Not a huge deal.

>
> Perhaps we need to separate the Host and Chassis on the Redfish side and
> extend the D-Bus interfaces to support all the needed ResetTypes?
> >

I'm not following.  There's a Host (ie ComputerSystem) and Chassis in
redfish today.  How would we separate them further?
