Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BC63FE1E
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 03:29:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNcMx3Pqjz3bbh
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 13:29:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=sT3amljx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=sT3amljx;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNcML5S9Yz3bZQ
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 13:28:59 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so6998741pjs.4
        for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2022 18:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNd2I8ry/VNOoF2GjUEL8fyhe7XDKKLAPJ2HFGlG0vQ=;
        b=sT3amljxEdn0du2eAiriWjMSSC684HvgFlznDd3BuaaBRwfz0hsRmlsBvQ0nLdarAf
         9L0121RAqeKmBe+HZSeSmzLEJoNkpVR/KjHeLCuw99kINiEpq3m8z5ohMqM+4zAmPeWF
         SqEqE4nYjudqYsl8OnMFtPYecsxkU0tBdYp78+K5bIZQQnHWMhOCv323v+LAmgCuaSuy
         Fv1Ei+Q4kFf6WY5fxhSm/PBAqAPnUvZEtEwrNkcjlTrzkHt6+X4CTWwbzRMHHVi9PwRY
         foChjSDIm0pmE0qudfTrCxkM4qsuMUw2+L5G3K2MpFc7r9H6PRMgzFOwDp0vJL+Eo4rl
         EjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNd2I8ry/VNOoF2GjUEL8fyhe7XDKKLAPJ2HFGlG0vQ=;
        b=1l95np4AeK9TKyRfYrZGNNilzHuLwwZuJMVZLtPcPrqu6zaE9vZ0M5P2Zr4/TDhERd
         4LTXpYYwUlsJCzTMzG9epTCKeqX/6RFPX5lkbP4HIoVRV3Q0Z4Crhpakr6csnqG95ZHe
         cg4EB+3f7wxXBk5575BjpQrDazT0AukfqfIMimgykY+qjQma26Ff9StjHBPpTJxm8Bz6
         5A1BbxUfCMxIDJkrhooxRxc/mMdziOhGLJMSU5/y5gVRafHSE0QK0v+8h1iTjjJZujcx
         ObCaMZNR8Wv6DIk2sRuDqiiCgQvmIBVFDQCD7mSz5AXpb1mQ+k37sAekndNJchDlqRP1
         4nZw==
X-Gm-Message-State: ANoB5plaqt6qTFv+muXNHTH0tyzBtYhdtdg24RBIspNEf4niseCxO5W1
	/hRAmyA+DBPqLHHfOiAVPrBaKHxGB2GafzAHZWVcpb30lQ05Qe+4
X-Google-Smtp-Source: AA0mqf5IqwlOrFmrTqTMhjgysuqF4q5KJ+P0Wa5uKF46RZqMvZPpIPyyh2IVCGtaVJFsxhFSYYU3xPrN6l4/wVJROQo=
X-Received: by 2002:a17:902:8e85:b0:189:8ec5:93fb with SMTP id
 bg5-20020a1709028e8500b001898ec593fbmr21828312plb.154.1669948137774; Thu, 01
 Dec 2022 18:28:57 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UFOHuVnC1ta1PPbr3TzS4SS4=nOQiHuJ65YbD_1WCD-Cg@mail.gmail.com>
 <Y4jtbqORZxk3WLD3@heinlein.taila677.ts.net>
In-Reply-To: <Y4jtbqORZxk3WLD3@heinlein.taila677.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 2 Dec 2022 10:29:11 +0800
Message-ID: <CAGm54UEimMBzncOmwQRZXZcG+qBoESc5gbrxKUxZGvKJh4uqpA@mail.gmail.com>
Subject: Re: Missing fan present object in fansensor (and expected usage of
 object manager)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 2, 2022 at 2:07 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Dec 01, 2022 at 09:38:17PM +0800, Lei Yu wrote:
> > This email is to discuss an issue found in fansensor service, and
> > about the expected usage of object manager.
> >
> > # The issue
> > With upstream dbus-sensors (7627c86), the fan-present objects are
> > missing on DBus.
> > The fansensor service should create objects like
> > `/xyz/openbmc_project/inventory/fan0` to represent the fan presence
> > status [1].
> > However, with the changes of "fixing the ObjectManager in the right
> > place"[2], it creates an object manager with
> > `/xyz/openbmc_project/sensors` instead of `/`, and the objects created
> > on different object paths are actually not created anymore.
> >
> > I see there is a fix for the "control" objects in the fanensor[3], but
> > the fan-present objects are still missing.
> >
> > The fix is simple that we could add an extra object manager on
> > `/xyz/openbmc_project/inventory/`.
> >
> > # Expected usage of object manager
> > But that involves extra object managers.
>
> There isn't really any harm in extra object managers.  They are "cheap"
> as they're effectively just a string held in the sd-bus library.
>
> > For a service that creates objects on different paths (e.g. sensors,
> > control, inventory), should it really create different object
> > managers?
>
> We've had some ambiguity in where the object manager should be hosted.
> From a dbus perspective there is no requirement, but it makes it
> difficult to call GetManagedObjects.  The direction that we've been
> going is that:
>
>     1. Some hierarchies are now explicitly documenting where an ObjectManager
>        is required (like sensors does now).  This should generally go at
>        the level 1 deeper than "openbmc_project".

I guess it's better to document more requirements to help daemon to
host the objects on expected paths. E.g. for
inventories/control/settings

>
>     2. Daemons can still optionally host an ObjectManager at the root if
>        this is somehow helpful.
>
> > The caller of such service (e.g. bmcweb) usually calls
> > `GetManagedObjects` to the object manager interface to get the
> > objects. In the above case, it has to call `GetManagedObjects`
> > multiple times on different paths.
>
> The reason for having the ObjectManager lower in the hierarchy is so
> that the GetManagedObjects call is cheaper and doesn't give you every
> object hosted by that service.  In something like the PLDM daemon this
> might be lots of objects that the particular call has no interest in.
>
> I don't suspect there is really any case, with the current
> implementation, where bmcweb is going to attempt to prune the calls by
> grabbing objects from two different hierarchies in a single call.  We've
> decided to simplify the "where do I find the ObjectManager" instead of
> optimizing the performance of "give me exactly what I want with this specific
> query".

Agreed.

>
> > So the question is, what is the *expected* and *proper* way to use
> > object manager for such case?
> >
> > [1]: https://github.com/openbmc/dbus-sensors/blob/master/src/TachSensor.cpp#L77
> > [2]: https://github.com/openbmc/dbus-sensors/commit/14ed5e99
> > [3]: https://github.com/openbmc/dbus-sensors/commit/d9067251
>
> FWIW, Nan fixed[1] the same issue you're seeing in dbus-sensors in the
> phosphor-health-monitor by adding the ObjectManager at the root.  We
> don't currently require one at `/xyz/openbmc_project/inventory` but I
> wouldn't be surprised if we do in the not-too-distant future.

So for this fansensor case, let's add the object that hosts
/xyz/openbmc_project/inventory
Will post a patch.

>
> 1. https://github.com/openbmc/phosphor-health-monitor/commit/af109947dad9c6dbf496c4111c625e5ae407dd81
>
> --
> Patrick Williams



-- 
BRs,
Lei YU
