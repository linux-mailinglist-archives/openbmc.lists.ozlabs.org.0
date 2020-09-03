Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C725B82C
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 03:16:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhjYq0jXdzDr1S
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 11:16:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GZ99X5y7; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhjXt54W8zDr0m
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 11:15:23 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id q3so939691ybp.7
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 18:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJXOHn5FKTJsQmzcLAbfLhANDh6NPSh7cX/g+S6Zmgw=;
 b=GZ99X5y7POqsamQd1lTAl4toWkuslelHOyEIxuxdpWdG+KT/udcdiSzZV1/raiY9Ph
 md/Qf6+A81xViGpMR6UoUBsmEhgxzhah0GcO7Hcp4/KJKAW3FjLlnf+6K4tFkDJVFkt+
 NBaiEta4byHxm9w/zOW48SD+fgLm+RllNJwTssb33xIZQtpRP8xkuStmUke8WyZnGfe1
 LzAw19QROE06RwXg/sXpyrkBeZ5CqTBOIwnShN+ykyOVVjoX4m4FZt91eRhmsGr+KA9p
 FBLGAiwi27seos76jmlxrMM9slQ/2xedHYdbjhGLIrRLKYh4hsRb3xDKiOxGMOvivLpb
 dxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJXOHn5FKTJsQmzcLAbfLhANDh6NPSh7cX/g+S6Zmgw=;
 b=MiM7aAWZlsaU1RTirwUQkTgEONSDWuYv1OSCd9ia/3XzYdEolj0BTDRUunI2z+n/k3
 RdLI7Zv0wQveMyKkyztDLT2FL/WDLihgSLvL0CTYr11Wa85IoWt+7DmWEif0r1hYY9FI
 n52201V8tJZ3TZ5nubihLRT+/mv+WHLxOoKLv8Y9SdVqvM/0hAldv9v7pZtmCybGfzcd
 qwkhU1qwMLsB7F+U0srz8K2ZhS+9HiXnHLoM5NpQNTVzApxk8kwbpS0E/vK6RcyBuJco
 3j1jAWOakCTp8vo++NVJbQ3QqWka1zmkDfVCtc88mSd/9wBN1dZGpm2g1mh0Q7wuqgKT
 eM6A==
X-Gm-Message-State: AOAM530DhRrU+746QQ+l+zkawxGEgURDXuHlQ1qhORXr6l3ZagC0faqo
 F78/vIYEMTBtC55qM5YXlRPPBLcMe2iSfgPYXeUtqQ==
X-Google-Smtp-Source: ABdhPJyc8rAd5Uf90JEN4u+cYlZWO++ER+0pOb8uBisNq1PVFXsLIdz6Se2ZPWQgPGnPpEtF1tD03xmH3Z/SjOusnvc=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr657060ybu.449.1599095719917; 
 Wed, 02 Sep 2020 18:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
 <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
 <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
In-Reply-To: <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 2 Sep 2020 18:15:07 -0700
Message-ID: <CACWQX83+BO7WuZBW6ubJwvYOhKee=F0Hf5WBWm2uX2bhBV3ZMA@mail.gmail.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
To: Andrei Kartashev <a.kartashev@yadro.com>
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

On Wed, Sep 2, 2020 at 3:27 PM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> On Mon, 2020-08-31 at 10:14 -0700, Ed Tanous wrote:
> >
> > On Wed, Aug 26, 2020 at 11:11 PM Andrei Kartashev <
> > a.kartashev@yadro.com> wrote:
> > > Since there is a plan to move to EM for inventory, I believe it is
> > > really good idea to also have support for FruDevice in phosphor-
> > > host-
> > > ipmid. Then we can have a common way on how to handle it.
> > > Same for SDR BTW.
> >
> > +1.  This was attempted a long time ago, but nobody was able to come
> > up with a design that kept the "old" way working for those that
> > needed it, and at the time there were some missing features.  Given
> > where entity manager has gotten, it's probably time to start that
> > discussion up again.  Do you think you could put together a patch
> > that does what you describe?
> >
> Well, I currently have number of more critical tasks for platform
> bring-up, but I can take a look.

If you get the time, I'd appreciate it.  If not, I still appreciate
your input sofar.

>
> > > But there is other thing: there is catastrophically not enough
> > > documentation for EntityManager/dbus-sensors. Looks like common way
> > > just to adjust existing config and hope that it still will work.
> > > <sorry, was all the day trying to get adcsensors work yesterday>
> >
> > That being the case, would you mind taking a look at the docs changes
> > I just put up.  It's trying to improve the EM documentation a bit,
> > although I realize it doesn't get all the way to where it needs to
> > be.
> > https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/36110
>
> Great doc! I wish I had it month ago )

At least it'll be there for the next person.

>
> > Also, it'd be great if you can come up with some concrete examples of
> > what else we can improve in this regard.  Unfortunately the "copy an
> > existing config and modify" approach was the best way we found to
> > make platform ports easy.  A lot of systems tend to look pretty
> > similar, based on similar reference platforms, so usually there's
> > something to use as a starting point.  Building a config from scratch
> > using first principals and documentation is kind of daunting, and
> > became a non-starter for most people, given that the config files
> > tend to be large.
>
> Yes, everyone likes "copy-paste" and this is working approach. Unless
> you understand what exactly you pasting. E.g. Fan/PID configuration
> looks like a hell and it doesn't match one that described in phosphor-
> pid-manager ).

That's definitely a low effort/high reward place where we should do a
better job documenting each parameter and their constraints.

> So, now we have brilliant top-level overview, next step is to describe
> how to use and extend it. That is mostly on reactor side, of course,
> but on EM side we should clearly describe how config is translated to
> dbus objects.

This has evolved quite a bit over the life of Entity Manager, but
again, this is great feedback, and something that it's probably time
to document better including documenting the places that are "wrong",
but hacked around a problem.

> Another thing I would like to have is even more high-
> level document describing the common architecture of EM-based
> inventory.
> I can start with some drafts of what I dig, to make it more clear.

Great!

>
> > What were the biggest roadblocks you hit trying to get ADCSensor
> > working?
> >
>
> ADC is king of easiest sensor you can have, I thought ).

I think LM75 beats it :)

> But still I
> face stones. For example, if you remove "PowerState": "On" from all
> channels, you will get crash with "Power Match Not Created". Or this
> configuration entry in Wolfpass config:

That's a bug for sure.  What host power state management system are you using?

>             "BridgeGpio": [
>                 {
>                     "Name": "P3VBAT_BRIDGE_EN",
>                     "Polarity": "High"
>                 }
>             ],
> which seems to be copy-pasted from somewhere else, since it present in
> all other configs, but not in board schematics )
> That is, of cause, not
> a problem of EM or dbus-sensor, but this is example for copy-pasting
> issues.
>

I just looked, and there's 2 platforms that have a bridgeGpio
definition, and Wolf Pass for sure has it on the schematic, not sure
about FBTP.  Which platform were you looking at that didn't have it?
ADCs have a very high parasitic drain on the cmos battery, to the
point where it affects their longevity.  This is an implementation of
a FET that explicitly enables the circuit when the battery is being
read.  Most modern Aspeed platforms should have this circuit.

Point made, copy-paste is not a substitute for documenting what things
do so when you copy paste, you can know what needs modified.
