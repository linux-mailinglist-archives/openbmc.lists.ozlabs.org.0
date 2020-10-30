Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C112A092F
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 16:07:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN5JF1vf4zDqwL
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 02:07:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=glvURhrn; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN5Gx66FqzDqvd
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 02:05:58 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id c129so5357081yba.8
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DzwAhbocmc16vpZjSoPXeJeVMYNE4u1TE+RlAH0I2UE=;
 b=glvURhrna98AZGOnInI9OheEtTvwL+SXu9jr+a+R+fUCUMYZSXX2VesxU0mvg6Vanb
 WwnwqNf5eaxqXHygd2JHDAy80emuiUe+8NUBpL6Nwid+h93BEnk9WIGrttwvYdepBdCk
 HK1dDaBkOBTaWp70SR0zVMwoxzaSOQtwZ781X6cS5ACj46eMbQp+m7+7+W98vh7yg2qv
 ZvFIzEuITUZfYi8dY3AiCbfh0ZtMZfjFMxOlG1dmEDxqLnZeHlFMYugRS8SFF0bWUYty
 F+GAwYJWLj3BALa3VmRXilxBXyourconEhXwXl0ryUqxMUrduWsGB+nGwFJmfc2DeT4j
 BMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DzwAhbocmc16vpZjSoPXeJeVMYNE4u1TE+RlAH0I2UE=;
 b=eJ6bEYzQKNo/2AUuvwoOk3/yGLdfZA+JuSXttcw7U7ey+TsQaCOGgpLHnWsf5BlKCh
 nBHIMeeWU2KWhGug4LFyaW2jQc/2brCRSk4kyOzi6BZsewXJzprVjs0Nt3WfJWtM/ZB5
 TqQ0ixk4R28xyPkS0/rfKt1LK106a1WDt//6fVfJKY8Y3mRBfQSOLkrQ3KEehFuFRewm
 JUGDPJznKym9lYD761ni5pdi9hfVDnpT+jBl1os7lhyfFWMFl/U/IefPHGsdd7Lyhmy3
 vmXf+9Zv+9jcxQNnPCZLz6ejtKO8gU/MRanhgxA1cKLFlj+11avBZYTzg+RvYjfNmczi
 LIjg==
X-Gm-Message-State: AOAM533BFM7evPt7AA2/+QhksC+BkthmhuHEpA03qaTetTLLsyB6bCjv
 a8cFHJ83+fNx/ljOV+uxRpFs+gKh6htWAYQfIvrxNg==
X-Google-Smtp-Source: ABdhPJw3GQD1Pf3Ss4aPGlo29BWqz23robNY5BnyknabkiFwTMbCaYUtbrZyqXLzLP5WawMKGmK6OH9IozT2Of6y3lo=
X-Received: by 2002:a25:517:: with SMTP id 23mr4219011ybf.148.1604070353934;
 Fri, 30 Oct 2020 08:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
 <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
 <aac742e708ec91c95228b98b26da61b494996f41.camel@yadro.com>
In-Reply-To: <aac742e708ec91c95228b98b26da61b494996f41.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 30 Oct 2020 08:05:43 -0700
Message-ID: <CACWQX82nuLusTnzX065nHzOd8UA_=xXweaDXgWPGULjrTHEbSg@mail.gmail.com>
Subject: Re: bmcweb logging
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 3:42 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> Hi Ed,
>
> I disagree with you here. Once we have logs I expect to see errors
> information by default.

This imposes performance constraints.  Considering bmcweb is measured
for performance a lot, and enabling logging slows it down (quite a bit
if I remember the old testing I did) I would not be in support of any
debug level logging by default.  It should be noted, the current
logging mechanisms rely on iostreams, which also make the binary quite
a bit bigger.  Both of these aren't really acceptable as a default.

> I'm not gonna to build applications with
> verbose logging unless I debug it but but bugs could appears even you
> are not looking for them ;). Logging unusual/unexpected behaviour by
> default typically helps to localize problem.

I don't disagree, if your priorities are that debug is more important
than performance, enabling logging for all/some requests seems
reasonable.

> So I believe, we should formalize and cleanup log level usage.

I look forward to seeing the specifics of that.


PS, please don't top post when replying to the mailing list.

>
>
> On Thu, 2020-10-29 at 09:22 -0700, Ed Tanous wrote:
> > On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <
> > ratagupt@linux.vnet.ibm.com> wrote:
> > > Hi Ed,
> > >
> > > I was having issues in getting the logs from bmcweb repo, If I
> > > don't
> > > define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get
> > > me
> > > any logs in journal(not even error log) and if I define the
> > > compiler
> > > flag then it gets too much debug info.
> >
> > What's your limit for "too much"?
> >
> > > Seems it happens because we have hardcoded the logelevel  and there
> > > is
> > > no way through which we can change except making the change
> > > manually in
> > > the following place.
> > >
> > > https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
> > >
> > > Suggestion is we can define another compile time flag for log level
> > > and
> > > use that log level at the above line for type of logging , by
> > > default
> > > logging should be enabled with error log level.
> >
> > Thusfar, we don't really have a definition of what kind of detail
> > should be included at each log level, nor are we consistent about
> > setting the log levels.  If it's important to you, and you want to
> > put
> > together some patches, we certainly could define the log verbosity,
> > but we'd also have to come up with better definitions for what level
> > each log needs to take, and be more consistent about it.
> >
> > IMO, that level of log granularity was never that valuable to debug,
> > my thought being that if I'm enabling logging I don't care about
> > performance, so the more logs the better.  When reproducing a
> > failure,
> > there doesn't tend to be a lot of logging present, and it's easy
> > enough to find what you want, but maybe you had a different
> > experience?
> >
> > Long term, my intent was to just get rid of the various verbosities,
> > and make logging ON or OFF in the code, and downgrade to a single
> > macro, but if you see a need, we could certainly go the other
> > direction.
> >
> > > If there is a need user can play with new compiler flag for more
> > > verbose
> > > logging.
> >
> > I don't personally see the need, but if it would help you, I don't
> > think it adds much complexity to do it, and I'd be happy to review
> > your patches.
> >
> > > Am I missing something in usage of logging infra?
> > >
> > > Ratan
> > >
> > >
> >
> > Just to be clear, you're using logging in a debug context, correct?
> > If we're trying to use this to define an access log, that's a very
> > different problem space, and the existing logging infrastructure
> > would
> > be poorly suited for it.
> --
> Best regards,
> Andrei Kartashev
>
>
