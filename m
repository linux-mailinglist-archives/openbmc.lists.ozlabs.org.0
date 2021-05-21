Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52938CC0E
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:24:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmtl06bkNz3bt7
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:24:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=QWGAnzid;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QWGAnzid; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmtkj5WN2z300K
 for <openbmc@lists.ozlabs.org>; Sat, 22 May 2021 03:24:13 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id c14so20023919wrx.3
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qajxqFHRA+2AD0b8gsgnaXlQOqaQD+2LrsrIgeyKH9g=;
 b=QWGAnzidPhsg4fAbialgse4Elqa1stSMBmWgVIlvEV2n+dmCkICZSmigaVJCEMfGf4
 6lLenBNbeuQdhVxzrXyFs2sntrhUn0LsaMlI2+GhWKZplhuuMMqWAqqdFYn12RxsXPQH
 MJ5DqrMezLriRDf+5ZrtmQ/VB3fmgfdqE5s+BSumz8pRoiNG24VUEQ9trK8pzk95U8S5
 X/7FNIyYzVEDEesO3/vqhNcckggUQFdRR7o1ConMv1Cy0MPAJzJCxG78zrrWNK3xnBGw
 QxAT95Zwdtar/zgVc6tL7fOtuZxm95g337iu4pfXu2f60FrYZISp3YP2cVMrV55LaJdc
 9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qajxqFHRA+2AD0b8gsgnaXlQOqaQD+2LrsrIgeyKH9g=;
 b=QNDjp0ZBT8XJ2i1fQ+YN9VJLvVMas07Givs6rW4s0E69w/pXCVagwGgt6hhfsGz9BJ
 +p9jIBBDWyS164sJEDGZSarVJ6DtAB7VX0hW23CwMF2IBP4N2WUpx0o2janzpTnj5F3k
 5B/HR6h1dK3eA6QUI4mnlUe3fq7dQX78n9GoUHJhQuWaI6gdt/WjnTsRZ5WeRr7XN+fu
 +U6Ea9lWr1JOyzKiIrE/dzv7J2P/MVO004vGb3Lr8M02agcLaLKc3TpAdzFplbiuO1QP
 Y8ufMLq8EsRMkg/03cVmDZI1kziMwhZCLgSFxsjdJlu2qmT463I5z8bAe8y140V9A7eF
 ucqQ==
X-Gm-Message-State: AOAM533x4k4lnk3g3OPdAzhsPusJkg9TVEJzPHm38BBh6Bqh+p4LL/gu
 kMP7tOtPimcQed19kjjExH0Hfhirvm/o4x+TcMFWtQ==
X-Google-Smtp-Source: ABdhPJzmuW5591XNGSznAR4uZ/5BNFF63YlNvqdP0u/Fwe97Pt/0wm12hZ/hWdqzIL/fWnyotdi11fdC+74E5fg1VHs=
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr10543660wrn.217.1621617846263; 
 Fri, 21 May 2021 10:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
In-Reply-To: <20210521061023.4zy5s7fzycz5lppx@gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 21 May 2021 10:23:55 -0700
Message-ID: <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
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
Cc: Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Nan Zhou <nanzhou@google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Richard Hanley <rhanley@google.com>,
 a.senichev@yadro.com, a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com> wrote:
>
> On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > Hi all,
> >
> > In the previous thread (
> > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > (engineers from Google and Quanta) discussed our attempt to share host
> > serial logs via Redfish, which includes polling logs via LogService and
> > streaming log bytes via EventService (e.g. SSE). We went with the event log
> > architecture
> > <https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>
> > and did the implementation.
> >
> > We still want to reuse the phosphor-hostlogger and do some modification. We
> > believe it is better to try to reuse existing codes if possible and improve
> > them rather than creating new things that have similar functionalities (in
> > our case, it is a daemon that could collect logs and persist them).
>
> I agree, reusing code is a right choice, but only when it is really possible.
> For now it looks like you want to remove most of the Hostlogger features to
> transform it from buffer-like to stream-like service.

I'm not quite following this statement.  Which features are getting
removed?  From what I can see, he's suggesting making
phosphor-hostlogger look more like a well-behaved linux logging
daemon, but I don't think any features got omitted (or I'm missing
something critical).

>
> > We want to do the following modification in phosphor-hostlogger (from the
> > input and output point of view, just very few things will be changed)
> >
> > 1. One limitation of phosphor-hostlogger is that it will lose data in the
> > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > restarted;
>
> When BMC goes to reboot it stops all services, at that moment hostlogger gets
> a signal and flushes all gathered logs to a file.

Only if the reboot is planned.  If the BMC loses power (which is
"normal" for a bmc) there isn't time to persist to flash before the
power goes down and the logs are most likely lost.

>
> > we propose to remove the ring buffer and write to the log file
> > as soon as some characters are received.
>
> I am not sure it is a good idea.
> The host can generate a lot of logs, but we have very limited free space.

This is a fair concern, but wouldn't the rollover limits make this not
an issue?  They seem like they could be easily configured.

> In
> addition, such heavy traffic will lead to a quick breakdown of the flash (most
> available products are guaranteed to withstand around 100,000 P/E cycles only).

JFFS2 is wear leveled, and there are other BMC stacks that I know of
that implement this without any ill effects to flash longevity, with
that said, if Nan made the "last log on disk" feature configurable,
would that alleviate your concerns?

>
> > This implicitly removes the needs
> > of the ring buffer, and the persistence triggering (host reboot, sigterm,
> > etc) in hostlogger. We believe this keeps the same functionality but saves
> > hundreds of lines of codes in phosphor-hostlogger.

Difference of opinion here, I don't think this removes the need for
the host reboot event;  Having each reboot post to a different log
needs to be maintained, and I have to imagine that there's some sort
of sigterm handler still, although it becomes a lot smaller.

>
> You are suggesting to delete the buffer, DBus watcher, log rotate. How are you
> going to keep the same functionality if you remove everything related to it?

+1.  In the initial thought I didn't think we were removing any
functionality with this.  I had assumed the dbus watcher would remain,
and we would still have the log rotation behavior.  In reading through
Nans proposal I don't think these are getting removed;  Maybe I
misunderstood?

>
> > 2. We propose not to compress the latest log file. This saves us the
> > overhead of doing decompression when BMCWeb just needs to retrieve the most
> > recent logs. There are still going to be log rotations in the file level.
> > Files other than the latest log file are still going to be compressed. We
> > can modify existing codes to achieve this or use the linux logrotate
> > directly.
> >
> > Furthermore, we will add host serial logs into BMCWeb, both LogService and
> > EventService. In LogService, we will teach BMCWeb how to read the latest
> > log file that is not compressed and the other compressed old logs, and how
> > to assemble LogEntries out of raw serial logs. We will discuss EventService
> > in future threads but the very initial idea is to setup inotify on log
> > files and SSE to stream out new bytes to clients (like what the existing
> > event logging is doing).
> >
> > As we said above, for phosphor-hostlogger, the input is still the
> > obmc-server unix socket, and the output are still persisted log files. But
> > the functionality will get improved (less data loss), code gets simplified
> > (no ring buffer and persistence triggering), and it will become easier and
> > more performant to get BMCWeb hooked up for log streaming via Redfish.
> >
> > Please let us know what you think. We appreciate any feedback. Thank you
> > very much!
> >
> > Sincerely,
> > Nan
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
