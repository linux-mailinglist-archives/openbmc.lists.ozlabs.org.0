Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 442072EE76D
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 22:08:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBf383KLKzDqtp
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 08:08:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HL/EEqMT; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBf2L2TQMzDqWm
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 08:07:33 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id t30so7003201wrb.0
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1LOD/QGfUvIVNnUcxx30C72ygcHPR0UWSBWT+42qNI=;
 b=HL/EEqMTj+Oav2+grSBKptsqGU/9JXEiyHXzBj1yQRPdFapopN0e2s/maUrV1GN5NL
 ss5Bdz1dmRS2BX7ilmnQmEiQQHCu3a8cBd+OrNOxbQXslEOmunKagS7e+DZsTradYWFN
 r5iFSuwsvv+k95RGDSrsQjcheOmHqflQcct581vR6zJK0gQtwCPRCW9OeRznXhLZodUx
 XX3wVttCL+llVbUcMLFHGuHwyaKHZ5ghoMhIUsR1Z/2R2CoEeiyE6cXd0HQzFKcJiDhX
 WtrfF9kHgRK9Jmc9QBjXjuHHZ/bL7trner7dntAfqWpU9rVlwcspMAnJ5ar/du7zYbf5
 bqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1LOD/QGfUvIVNnUcxx30C72ygcHPR0UWSBWT+42qNI=;
 b=Ft4y6qWhN3xdwAZGQRQH98WQ4QQsUwGrCSIJa7FYIU/x1A740610EVB9Ub3nU4uGrZ
 x97lJKPpZSinaE4wnjndyAHN7lmDVPJTC2WblOEJRD6N0q7/g5Nj8/0OZT98Nu3r4AcO
 QhfU00Q7mpGtLwfnOPQC/8w9ArrkU0TeojqkHJ0NkxvKzio94rhEDbVnSlHZKkeW+D2c
 A1omyKysd9WKeQ3RAHmtU4NQmjwAMQCneR7j7FZV5tNGXF4evGYqP7NF5aoPHYnsSHFG
 z0tXx1bl6VKXdEsq+FO6Rtnn/DP3+YYB02l5+5BoGQ8CRASBBBrHOTudVblEWFTb6/Uv
 1H+g==
X-Gm-Message-State: AOAM531IgYpr45H7kzDQneliQ1dRwxpPvkAiVLe4/E05/5ZD33R9dN/7
 YLWhiIpzvaF4PRwU+Kf7uTAsLuJe3gMOynDRNh35+t0KeXk=
X-Google-Smtp-Source: ABdhPJxMO+nsIrB0AdF9sKbCJ1rEHEfRjGYcpp39jiGafGkbaT+soZ7RCvaM4N4BZ9UxWT+muwAZzVzAhO+Gdsr0kf0=
X-Received: by 2002:adf:a551:: with SMTP id j17mr443657wrb.217.1610053643660; 
 Thu, 07 Jan 2021 13:07:23 -0800 (PST)
MIME-Version: 1.0
References: <CAFR_W8pjBgn=V9ye-R9ThvyvqwxqYnY94vAX0q1h4sVEaLWN2Q@mail.gmail.com>
 <X/c7dM7/uDIDTlFI@heinlein>
 <4a31f202-e038-a9cd-687b-25b572dedae4@linux.intel.com>
In-Reply-To: <4a31f202-e038-a9cd-687b-25b572dedae4@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 7 Jan 2021 13:07:12 -0800
Message-ID: <CAH2-KxDfcvJtoo7f9+YAxmo=z8WTYUv1aaWH6cfS-ss+oV-=4Q@mail.gmail.com>
Subject: Re: Changing LEDs status in response to Power Events
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

On Thu, Jan 7, 2021 at 1:01 PM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 1/7/2021 8:48 AM, Patrick Williams wrote:
> > On Wed, Jan 06, 2021 at 04:52:32PM -0800, Maxim Sloyko wrote:
> >> Hi all,
> >>
> >> We would like to change the state of some of the LEDs in response to some
> >> power events. For example, if the system goes from Standby to On, the LED
> >> needs to change from blinking fast to blinking slowly.  The way we are
> >> doing it right now is we have a script that runs every second, polls system
> >> state over D-Bus (xyz.openbmc_project.State.Chassis and
> >> xyz.openbmc_project.State.Host) and then, again over D-Bus, ask
> >> phosphor-led-manager to switch LED into a new state. This does not sound
> >> like a good solution to me, so I have a few questions:
> >>
> >> 0. Did I miss some existing way to do it in OpenBMC?
> >> 1. If not, does anybody have the same problem and how do you solve this?
> >> 2. If not, Is anybody working on a solution for this?
> >> 3. If not, any thoughts on what's the best way to handle this? I can see at
> >> least two approaches:
> >>     a) Implement some callbacks in x86-power-control, so that one can
> >> register their services/targets to be notified of the event.
> >>     b) Implement this in phosphor-led-manager, so that it can listen to
> >> D-Bus events and respond to them.
> >
> > This usecase is one of the reasons phosphor-state-manager was
> > implemented using systemd targets (or at least one of the nice fallouts
> > of that design).  The intention was that system-specific things like
> > this could easily install themselves into dependencies on the state
> > transition targets.
> >
> > Unfortunately, if you're using x86-power-control as your state-manager
> > I don't think you get this feature.
>
> x86-power-control was built to solve a very specific problem to get some
> of our power-up timing and error-handling issues solved that we couldn't
> figure out how to do with systemd targets in phosphor-state-manager.
> Because of that, it wasn't designed to be very flexible or extensible.
>
> I've thought about how we might be able to improve that but don't want
> to re-invent the wheel where phosphor-state-manager has already solved
> the flexibility and extensibility problem.
>
> I have wanted to get back and spend some more time to see if I can get
> the same reliability, timing and error-handling using systemd targets
> with phosphor-state-manager, but have not had a chance.
>
> For this issue, another option instead of the polling script may be to
> have a new daemon that matches on the Host state property changes and
> updates the LED.

This is roughly what I suggested to maxim out of band.  I think he's
trying to avoid the "yet another daemon" problem, but I don't see a
great way to do that in this case.

One interesting thing to note, setting the LED state in a configurable
way is somewhat the problem space that James Feist was trying to solve
with callback manager, but that never got into mainline.  I'm not sure
it solves this problem directly, but might be a more extensible
option.

>
> We can consider adding callbacks to x86-power-control, but it may not be
> worth it if phosphor-state-manager can already handle it or there is a
> simpler alternative.

Considering we have a public, well defined API that gives the
information we need, I suspect x86-power-control isn't the right place
to be adding callbacks, as that would tie it to systems that implement
that daemon.

>
> Thanks,
> -Jason
> >
