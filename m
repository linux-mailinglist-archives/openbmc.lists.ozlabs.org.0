Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE736380E19
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 18:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhYlM6ctqz30D6
	for <lists+openbmc@lfdr.de>; Sat, 15 May 2021 02:24:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=agPv0EOl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=agPv0EOl; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhYl24TRkz307j
 for <openbmc@lists.ozlabs.org>; Sat, 15 May 2021 02:24:29 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id n2so30625425wrm.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 09:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+/GNJBkGrmh5PbD2uLphLUDZkMFPSEWKEZS9Wfzu/M=;
 b=agPv0EOlbEaxJqnBS9fzhZha721WWTkTeCgT20/OjwoBZICTXzC0QRVGyDP4+d1ONE
 b8T+KFy+Npz1lTLojiylJorW7x2oSAaLaCH4n9tSxj+4lW05FB6W9qJYLNt+FBqw7K/A
 tejoIgsV1Fu9hBLkkCdmonYS3N2SMAy/8JrZBEYuJyySxnfUC5dzcAoUlsn6wEEma1ql
 C81wmFDUqaXk600JUEE3mVk/2U3vP7zI9tP6ouBGemHc4RVOuB5UZtAwJwtZiIZEN7jt
 aB4OvedSE61Ry0RJ+wp6FL6K0VT2L6nJh/SC3wcYqrtDT2qa4dwnWQo2QoApP+ugezja
 jcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+/GNJBkGrmh5PbD2uLphLUDZkMFPSEWKEZS9Wfzu/M=;
 b=YaxFeCfzO8CtLw444xElUAouWIZtQU88y0Wb3t8jwBIvpkR4qVhc7nWzzXNUQGqNSF
 41i87QZhBMqGB27dsqsuDPib2rUG2M+YnStxGXRSKrilY+H2HQdK6kiZBa28Ar8ASV4B
 F+9gK/MskOBIZsucGeKra6+omDoP0QTW1VVwSBmuVHuYY8prrB3ROS1b5qT2eOe2xSZg
 lJ31ybfyI3joB89NCnAJF3XJNTZUVV/EXxp5/HXxEiqVxJVYxkRTeckIfcIlb/9zlqGj
 iJ3mmkTGPuWtcLDQ4bQEyUXynsiWb4OuXUtffhjSP6W3z0NDP9JO0cm1ggAVUguaEVaz
 QWKg==
X-Gm-Message-State: AOAM532/Fi1dTFujmGy2lSsnQPmGqxWIv/aT5KEuluo8ASLs2nsXqBfe
 DY0eH+Q6DjFZDCc6PSmhYg4MBsDPLC8s7gGKElOV94GYTc0=
X-Google-Smtp-Source: ABdhPJzFi/qL00ROqPIKu8+MoSEPYiGKtJvrwyMtxxF6PBO+iu/cb4IrZa2ZJzt+qQVKsT8FRi/9kFB8iOXMY6O7m18=
X-Received: by 2002:a5d:6088:: with SMTP id w8mr58197079wrt.424.1621009461605; 
 Fri, 14 May 2021 09:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR08MB43999FF4F59E2DB627EF52CBC3659@SN6PR08MB4399.namprd08.prod.outlook.com>
 <91538a6c-60be-b8fa-7b9a-021c98a06326@linux.intel.com>
 <DM6PR08MB58830D49DACE954A4C7EDFCBB25F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <CAH2-KxBtxOOBubEKvdMRy+bbJrzc65Hn7N2EGft8vrMWcL+dAQ@mail.gmail.com>
 <71682083-58b9-ae07-dd11-8a58d8ca731e@linux.intel.com>
In-Reply-To: <71682083-58b9-ae07-dd11-8a58d8ca731e@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 14 May 2021 09:24:10 -0700
Message-ID: <CAH2-KxCSUK7DWjo8hTdjEWbGnyMW8N00Z2wnCUUgiYLjzmCOaA@mail.gmail.com>
Subject: Re: x86-power-control for ARM CPU based system.
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

On Thu, May 13, 2021 at 6:42 PM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 5/13/2021 1:55 PM, Ed Tanous wrote:
> > On Thu, Apr 29, 2021 at 8:47 AM Mohaimen Alsamarai
> > <Mohaimen.Alsamarai@fii-na.com> wrote:
> >>
> >> Adding openbmc mail list
> >>
> >> -----Original Message-----
> >> From: Bills, Jason M <jason.m.bills@linux.intel.com>
> >> Sent: Tuesday, March 23, 2021 4:08 PM
> >> To: Brandon Ong <Brandon.Ong@fii-na.com>
> >> Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>; Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
> >> Subject: Re: x86-power-control for ARM CPU based system.
> >>
> >> Hi Brandon,
> >> On 3/22/2021 3:43 PM, Brandon Ong wrote:
> >>> Hi Jason,
> >>>
> >>> I am currently working on the implementation of the x86-power-control
> >>> for an ARM CPU based system.
> >>>
> >>>
> >>> Is there a way to add a compile option to x86-power-control in order
> >>> to change the behavior to support the ARM power control logic if it
> >>> were to be integrated into x86-power-control?
> >> x86-power-control was created to solve specific timing issues with our platforms.  It wasn't designed to be a flexible solution for the community to use.
> >
> > And OpenBMC was initially designed for POWER platforms.  Things change :)
> >
> > Clearly x86-power-control seems to solve more problems, as a lot of
> > new platforms seem to be preferring it.
> I'm glad it is working well. :)
>
> > If the code being changed is
> > messy, unmaintainable, or isn't well abstracted, that's a different
> > discussion,
> This is definitely a concern.  Since it wasn't designed as a flexible
> solution, I'm worried it will become fragile with a lot of changes.
>
> > but outright saying nobody else can make use of
> > x86-power-control seems problematic, and would lead to a power control
> > daemon per-platform, which seems hard to maintain,
> This was not my intention, so I apologize if it came out that way.
> Making changes to x86-power-control is definitely better than everyone
> forking their own.
>
> However, I have tried to think of good ways to make x86-power-control
> more flexible and generic and have not come up with anything much
> different from phosphor-state-manager.  So, I worry that we could spend
> a lot of time and effort making x86-power-control flexible only to end
> up with something that is essentially the same as what we already have.
> But I don't want to squash any efforts here, so I'm open to ideas and
> proposals.

Brandon, it sounds like this is your time to propose something either
here or via patchsets.

>
> > and in looking at
> > the amd patches, an amd specific daemon would largely just copy-paste
> > 95% of x86-power-control today into something like amd-power-control
> > if we took this to the logical conclusion.
> 95% the same sounds like a minor effort to include in x86-power-control.
>   This particular thread was mentioning a build switch for ARM CPU
> support which made it sound like there would be significant differences,
> so I wanted to make sure that phosphor-state-manager had been evaluated.
>
> >
> >>
> >> phosphor-state-manager
> >> (https://github.com/openbmc/phosphor-state-manager) is the OpenBMC community power state manager.  It is designed for flexibility in how different systems change power state.
> >>
> >> Rather than add build modifications to x86-power-control for your needs, I'd recommend that you look at phosphor-state-manager which was designed to be customizable for different systems.
> >
> > phosphor-state-manager has all the problems that you found when you
> > went to use it, and found it lacking.  Clearly Brandon has found the
> > same and is looking to make some (hopefully minor) mods to make
> > x86-power-control more useful in more contexts.  If it's a matter of
> > code cleanliness or separation, there's certainly a discussion to be
> > had here, but effectively saying that everyone should go build their
> > own version of x86-power-control seems wasteful, as a lot of platforms
> > share similar properties to what x86-power-control does.
> I have some vague high-level ideas of trying to figure out how to make
> the power states and event handlers more generic, so that the various
> events, timeouts, and state changes could be customized.  But I haven't
> gone any further than "maybe a class or something". :)  Maybe that level
> of flexibility isn't needed, though...

When I looked at the various forks, I don't really see them changing
any of the state handlers;  The state machine seems largely unchanged,
aside from doing things like removing watch dogs, which are just state
transitions and probably should be configurable anyway for debug, and
even then, I've only seen one get removed (although admittedly I
haven't looked through every line of every fork of x86-power-control
yet).

>
> >
> > The things I see in the patch are:
> > 1. The ability to invert polarities of the inputs.
> > 2. The ability to disable at compile time some of the watchdogs that
> > don't make sense on certain platforms.
> > 3. disabling the beeper (which I'm not sure is needed so long as you
> > handle errors silently).
> > 4. A couple of platform-name-specific hardcodes, that I suspect aren't
> > needed or can be abstracted.
> >
> > Is there a way we can avoid the duplication of code in this case?
> I agree.  These changes sound minor and able to be integrated into
> x86-power-control.  Is a patch already available to look at?

Not that I'm aware of, but glad to hear you're open to things.

Brandon, sounds like getting a couple patches put up is your next step.

-Ed

>
> >
> >>
> >> Thanks,
> >> -Jason
> >>
> >>>
> >>> Thanks,
> >>> Brandon
> >>>
