Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAF276106
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:27:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxSr74k9PzDqbv
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:27:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=A/wjbvAt; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxSqP2Q6RzDqNX
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:27:12 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id x20so560036ybs.8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyCzammNLyupAsgasyLZbxU4x/loC3vzDLCZS8VkP7w=;
 b=A/wjbvAt1pqxECb7YjottexUYoPtG/qgsyCsoNfi2FB1dyxJwwQ0X7UCU4TKIMvvub
 G1IlSzTKONWdSHx9ruBTPrlJIUAPHI5UjbBdx3y1GVUbgmbYTYE2Xthf44cePa9mPLeH
 fDiL2xn8QCultLcKOmWDqEB9PNWjSUKs7QUTlktZ8yurj3+qc5h75wJvtwPae4dt8AcF
 1V3XUveiQUgrVeyaRaHlhvB92DDRC+pFrDvNOxqTZFufh2JeryOJdfSyWqJsoqaX65UI
 SxrlpS4r1qJggZNIcEZU3MtWz8ShAMMW+CmEN99+AQoVEFKfC5sRRkIPRXBcpSzGuKcy
 e4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyCzammNLyupAsgasyLZbxU4x/loC3vzDLCZS8VkP7w=;
 b=RlYQ0tK1rdT5zKQwAI3UD/5bf07+4Snn2s1LJ/C482jFD91Dhnw5qT/DQ4czhuLFG9
 Px539x6Tvxo9mv8xv0G63fbrIKzWcWDr2Le8s1XPNOivZu3DyC00oezIfCEJ4fT4gAHj
 S2GJfUGdZ4dHTL7Sk6577VES4HaxsbPdNoIH1vxl+1jSnR7mna0RUokBr7WAddPcz1wG
 B7NJj8vvvsMxI0p6kUj2ALtsg3wpJLqdYko1PtGt4DObZGPHJ2UokWh+T3Fx93S/6kAB
 hhHDKn6DmMdvCbbXShvHmuk6aMHwHYF/5exYnxvNlO9Rnzk14lVoHIMO2Dna9sH6X7KF
 U0xQ==
X-Gm-Message-State: AOAM5327Hpq3yQi6kZJHC3UfsWWof5o3vsJCiz96Z81wavn6VExiTKAu
 fm2cjWsbfEhTuG5jVIYtpvlw9zMsB0+MEZ7FVhTjCw==
X-Google-Smtp-Source: ABdhPJzNnx7R4bHRu+hBCtZ3gkXf6hYxsmDOfGYjRU/tFKjl5wtw15Mr66gywL4lNMd9CYpqhilnjHtCz2PQwTuJId0=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr2027286ybi.209.1600889229229; 
 Wed, 23 Sep 2020 12:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
In-Reply-To: <20200923191051.GR6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 12:26:58 -0700
Message-ID: <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
Subject: Re: Chassis reset
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
> >
> > Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/openbmc_project/chassis_system0.
> > Later one is used for AC reset.
>
> Can we do a query to see if 'chassis_system0' exists and use it first
> and then 'chassis0' if not?

I don't think it's that simple.  The way the dbus APIs are defined,
one Redfish chassis needs to call the chassis0 path, the other needs
to call the chassis_system0 path.  We'd need a way to key off which
one is which.  I haven't seen any entity-manager configs get checked
in for a "multinode chassis" entity type, so whatever interface we use
to describe that will probably be what we need to key off to make that
path distinction.

>
> I think we need to do some enhancement to x86-power-control though also
> to only create this 'chassis_system0' object if configured.  I believe
> the current code change you did does it always, even if the
> systemd-target is empty.

I keep getting the feeling that xyz/openbmc_project/chassis_system0 is
just overloading what /xyz/openbmc_project/chassis0 is intended to do,
x86-power-control just had that already defined, so we went another
direction.  I wonder if we just need to make the "Can I do a real AC
reset" configurable, and have it change the behavior of
/xyz/openbmc_project/chassis0 in that case.

Also, I'll reiterate that a chassis reset really should be going in a
separate repo/application from x86-power-control.  x86-power-control
should be focused on managing the host.

>
> --
> Patrick Williams
