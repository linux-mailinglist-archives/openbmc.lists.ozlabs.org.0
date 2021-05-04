Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E554372E67
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 19:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZR3w44Q8z300c
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 03:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=nu/zxCZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=nu/zxCZ9; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZR3f3Vcvz2xZM
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 03:02:35 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id b131so13095442ybg.5
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9evvt8midsjAb7n7183V7P4/bPdgBkGBK+Tf2gRN21E=;
 b=nu/zxCZ9uwk9jsUvo5w6oxMlz9yKnUCyYEY0TWc5YNrhr4MS8dzHOdEISKXtMAYzvm
 nHL9OOZ6e8SbB5RAQlXvnNmR+RKOW4NfqHMJHHfs4zWSvMuyuochSIQPpFm8cMVVlXPz
 uWDn8N6+B558vm9eDuIkTN0uvqSpvTH7WrbIoVwQ1PYQKskdcMacjqhVDibVTNyGNvWJ
 uMj44vTb6SuQoNudNKyb0+ab3FgUfHQq2jrhycYKylUcghiK7FMNkNXhzPijEMLAXj9t
 0GcQSCKqmIXwJMhjZRf2ViMlIbpV3gbZPfBB4UZ9TA3eajZrXM/J4PSa2KsWSAX5tL2e
 3ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9evvt8midsjAb7n7183V7P4/bPdgBkGBK+Tf2gRN21E=;
 b=eMtiyNvZSkJ5X/iuLtZ+bH0MUGcga+o6rLEyOOvc5ixc3OK3D8Q3teABCm0zFmdMWE
 otl8sWOPSzsvo7RSBAZbDlbLCXxba2wmOuGxL1vONf59LhfR83sulN8UZ9R0sRcUZsWa
 w1YMtOUQiq3+LJUqs+E3rASSpFwMCPA44dYK/fmZz+4mJIHoi2puRCDcUfwnC1IqjGiH
 otXuK+IAPBBtJ2XS8t2T6iwECXr2Bor2+zI8pvdCjY1CdWm6+pE1kfIVBMc7oMN0+bt1
 fwBbJbmUp0SR6hRoREesPsZh6U18bDtatjAgecQ2yvkraj1Y6MmfLsbHY/rqtjh+iK3C
 WLBQ==
X-Gm-Message-State: AOAM532vXsK0sPtgzOurFGndrBRLF70HA4GoHbvHRgYGRhakGgyTrHOW
 gY/x1R6Ge3uX2aA345/qT2tJTkrIvSOMLWS4kiYc3g==
X-Google-Smtp-Source: ABdhPJy2pQZvPGbLdSpjqUhYlCAuwctaNmqAYsvx/9AKFn5dR5sBWOuJAB7Fs172kHQWZatRZAmCvJ0sex+83KznpPc=
X-Received: by 2002:a25:7313:: with SMTP id o19mr29778726ybc.348.1620147750026; 
 Tue, 04 May 2021 10:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
In-Reply-To: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 4 May 2021 10:02:19 -0700
Message-ID: <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
Subject: Re: D-bus model proposal for pay for access features
To: Ratan Gupta <ratankgupta31@gmail.com>
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

> Content-Type: text/html; charset="UTF-8"

First of all, please avoid sending html emails if you can. They don't
render properly on everyone's workflows.

On Fri, Apr 30, 2021 at 11:15 AM Ratan Gupta <ratankgupta31@gmail.com> wrote:
>
> Hi All,
>
> I would like to introduce a dbus model proposal around pay for access features.Normally IBM system ships with more hardware than was purchased, which can be unlocked later.

It would be great to get a lot more background here.  On its nose,
this seems like this polar opposite of open firmware and something
that, if done wrong, could be very harmful to the goals of the
project.  Assuming you did this, wouldn't anyone be able to simply
recompile the code with the license checks disabled, load it on the
system, and enable whatever they want without licenses?  That seems
like something you didn't intend, and something that's less likely on
closed source firmware, but probably needs considered in this design.

As-is, I'm not sure which side of the line I come down on, but my two
initial thoughts are:
1. I don't want to support it or help the code in any way, but IBM can
check this into their own specific interfaces.
2. This is harmful to the intent of OpenBMC and open source firmware
as a whole, and shouldn't be supported in any capacity in the OpenBMC
codebase.

I think a lot more background and details than what was provided in
the initial email are needed before jumping to "what does the dbus
interface look like" type discussions.

How would open firmware principals be retained if we're now supporting
firmware locking down systems?
Are patches allowed to circumvent the license checks?
Does IBM intend to not allow loading self-compiled firmware on their
systems to support this feature?
What is and isn't allowed to be locked down?
Can the license checks be entirely compiled out?
Do these licenses appear on any public interfaces?  How do we ensure
that the public interfaces aren't misused?  How do we keep standards
compliance (or do we not care)?
How does this affect our standing in things like OCP open system
firmware groups?  Does this OpenBMC systems that enable this feature
ineligible?

Those are the questions I have off the top of my head, and to
reiterate, this feels like the kind of thing that needs more than a
one sentence background statement before diving directly into designs.

>
> Features could be 1) AIX enabled/disabled
> 2) How many processors are enabled
> 3) How much memory is enabled
>
> Proposed Model:
>
> The model consists of following main entities:1 - licenses - these objects represents the features.  There will be a license represnting
> feature(one is to one relation ship) and these objects have state - active, inactive, unknown, etc.
> These objects could implement the Delete interface for when a client wishes to disable the license/feature.
>
> 2 - manager - the manager object (distinct from freedesktop object manager) provides a method
> interface to create new license objects.
>
> Alternate Dbus Model:
>
> 1 - Licenses: these objects represent an agreement.  These objects have an
> association to one or more features, and these objects have state - active,inactive, unknown, etc.
> These objects could implement the Delete interface for when a client wishes to disable the license.
>
> 2 - Features: these objects describe the features available.
> Feature objects would be static and implementation/platform defined.  A BMC or host firmware update
> could potentially add or remove the available features exposed as dbus objects.  At the moment the
> only feature attribute I can think of is a name and the feature status.
>
> 3 Manager - the manager object (distinct from freedesktop object manager)
> provides a method interface to create new license objects.
>
> The difference between two models areIn the alternate Dbus model we are keeping the feature Dbus object and the License have an associated features
> In the proposed model we are only keeping the license D-bus object which represent the feature.
>
> Flow would be as below with the proposed model -1/ Manager object would be having interface like upload (License activation key)
> 2/ On IBM systems we send this key to the host firmware which activates the features
> 3/ Host Firmware sends the activated feature list to the BMC
> 4/ BMC creates the licenses for the activated features
>
> I suspect an implementation of the above flow is highly IBM specific,
> but I hope some of you have some feedback that might enable some collaboration.
> If not - where should we put this application?
>
> Ratan
