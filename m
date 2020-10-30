Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5552A096C
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 16:18:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN5YM1PLQzDqwh
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 02:18:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aXPqU/I2; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN5XF1SQGzDqvg
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 02:17:31 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id c129so5389378yba.8
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZAVlxS848nyUPX9IRXYOziFtd2+lokvXBwcgGE8mHhg=;
 b=aXPqU/I2uA6QLca6h0CoGaBP+RooXme+U0y3RvDUKXJBAyMRPOPaVC/V0+9FvNIuYK
 HANPgtgwlWIJ0u7Y3427nbphSw3MXR+MRh43rO9WgMvV5/GsNT2dphkzX4Kbvdw4JWUO
 DuQz82ee0rvv1Ljl0tSKrQaBonLvKbcIukusC6pseOJ9qzYMiz3HwEGICNzfwF3EfRt8
 aH6qLpHc6X+tFkh/g/3OpyLayjeWoMMI30xyzKcfTA1ifMbAdL6XfUIBCgtuPl+0eqy1
 HwXUmVze/ZjsDkBK6D8/IWbrExsqk9xcc3CoG7NRp3uUwo6JCAzlkUyw4G7lHpjywxZM
 yavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZAVlxS848nyUPX9IRXYOziFtd2+lokvXBwcgGE8mHhg=;
 b=dHluQE1MolynKrFWCDX9TBC8gioTPgOYp1MDOyHevMH65Y33Ao55Sw15cA3O0xwKyn
 XCTZiVzgtuvK8PMGISXZ2wzAUozPDwVe+fSFrZhck2B5aMLdvPRnJAgxzDNpZYyk4NpF
 xzBgvNiV9t/q0yvG/pGwLqtw5U+uQtnNC+/P8Lg1c1v7EZQ+UQRz5zLc/ACPjgdCTESR
 T+ZDNTae1B6ZvNEyK0D+vdApIeLfHp7CdOS2QYBSZygiRT3giMR7A6sVNyX3UFMh+g3S
 H3jICnlilCRMX3QX4+G56iA9R0qVWqhAjS6Hjh8BKq+Z/z98N8bt+ipMR3sMjSS6dkTk
 KfEg==
X-Gm-Message-State: AOAM531OsQt2QPi8Eq0YdUZEuV1UR0GUhT7whujoAtYgZvhDWwXanC+2
 z5mAcrIqeaa7M8aNISigsRvSD4ZnKdsCUFMTNTF8A8gTzJvkZg==
X-Google-Smtp-Source: ABdhPJyQ3PvQkxq98OvQlrX0Ml6iH8wRnO0yaLDTniRfumuoY8t5kpAFYWiV5N2CAQjQN4Krk51y2dZqCWxE/79cRMs=
X-Received: by 2002:a25:c094:: with SMTP id c142mr3865801ybf.170.1604071047961; 
 Fri, 30 Oct 2020 08:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
 <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
 <36c2d0c1-b1a1-3ea9-01b4-34611dff4426@linux.vnet.ibm.com>
In-Reply-To: <36c2d0c1-b1a1-3ea9-01b4-34611dff4426@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 30 Oct 2020 08:17:17 -0700
Message-ID: <CACWQX81EusRC6faFN5uB6_qp+nHcsrXb9_8WLunMq+GuMK4vng@mail.gmail.com>
Subject: Re: bmcweb logging
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 5:24 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
> On 10/29/20 9:52 PM, Ed Tanous wrote:
> > On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
> >> Hi Ed,
> >>
> >> I was having issues in getting the logs from bmcweb repo, If I don't
> >> define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get me
> >> any logs in journal(not even error log) and if I define the compiler
> >> flag then it gets too much debug info.
> > What's your limit for "too much"?
>
> around 30+ traces for each Redfish request.If we enable the bmcweb
> logging, with that  journal is full of bmcweb traces.

You've answered what bmcweb does today;  I asked you what the limit
should be.  5 per request?  10?.  Personally, 30 prints for a single
request is exactly what I would expect.  There are roughly 30 things
that happen for every request, any of which can go wrong, and when
stalls happen, it's good to know what the last thing was.  If you're
trying to debug new handler code that can assume the core is handling
things correctly and has no bugs, I could see that as being about 10
more than you'd need, but as someone that has to debug core
regressions quite a bit, having that information is quite helpful.

>
> >
> >> Seems it happens because we have hardcoded the logelevel  and there is
> >> no way through which we can change except making the change manually in
> >> the following place.
> >>
> >> https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
> >>
> >> Suggestion is we can define another compile time flag for log level and
> >> use that log level at the above line for type of logging , by default
> >> logging should be enabled with error log level.
> > Thusfar, we don't really have a definition of what kind of detail
> > should be included at each log level, nor are we consistent about
> > setting the log levels.  If it's important to you, and you want to put
> > together some patches, we certainly could define the log verbosity,
> > but we'd also have to come up with better definitions for what level
> > each log needs to take, and be more consistent about it.
>
> We have different log levels in bmcweb like error, critical, info,
> debug, but what is missing is we don't have some compile time variable
> to control it( currently it is either full or none.)

Error critical and info are used roughly interchangeably in code, and
we don't have a good definition of when to use each one.  It should be
noted, it's a 1 line fix to set a lower verbosity;  Have you tried
setting a lower one?  Did it give you the result you were looking for
on old code?

>
> >
> > IMO, that level of log granularity was never that valuable to debug,
> > my thought being that if I'm enabling logging I don't care about
> > performance, so the more logs the better.  When reproducing a failure,
> > there doesn't tend to be a lot of logging present, and it's easy
> > enough to find what you want, but maybe you had a different
> > experience?
>
> Yes, I had a different experience in the recent bug where the failure
> was intermittent and it was happening only after running the regression,
> when I look into the log, not a single trace was there.Hence I thought
> that atleast the logs which is being marked as error(BMCWEB_LOG_ERROR)
> should have been written to the journal.
>
> Say In production if we find some issue and we ask for the journal then
> journal will not be useful as it will not be having any traces to debug.

Agreed, but that's not what the bmcweb logging framework is designed
for, nor is it really in any webservers that I'm aware of.  What it
sounds like you're looking for is an access log and an error log,
similar to nginx, which is capable of running all the time and logging
a minimal subset of a request.  bmcweb doesn't have that today.

>
> >
> > Long term, my intent was to just get rid of the various verbosities,
> > and make logging ON or OFF in the code, and downgrade to a single
> > macro, but if you see a need, we could certainly go the other
> > direction.
> >
> >> If there is a need user can play with new compiler flag for more verbose
> >> logging.
> > I don't personally see the need, but if it would help you, I don't
> > think it adds much complexity to do it, and I'd be happy to review
> > your patches.
> Sure, I would be pushing the patch for the same.

Cool.

> >
> >> Am I missing something in usage of logging infra?
> >>
> >> Ratan
> >>
> >>
> >
> > Just to be clear, you're using logging in a debug context, correct?
> > If we're trying to use this to define an access log, that's a very
> > different problem space, and the existing logging infrastructure would
> > be poorly suited for it.

It'd be helpful if you had answered this, although I'm starting to get
a sense of what you're looking for.
