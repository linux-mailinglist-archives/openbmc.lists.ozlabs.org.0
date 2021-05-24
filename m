Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A038F187
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 18:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpjLl1HkMz305p
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 02:28:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=oEVT0cer;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oEVT0cer; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpjLS537hz2yXC
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 02:27:59 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id d11so29142200wrw.8
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXnf4cXmuVFTqX5HzjHuaEoedwxblxs6HKB1ez2VC10=;
 b=oEVT0cerrigHk8dglT403bp0ndwo24U9leTBNEfJyY5t5ETPyAjw5VpW4A9YMu9EtU
 rOZqj9CTzgHF5lt9Jc5vwwYDGZML+vdJ9F19DTINO/vSS/rd2aYeVnbctb4lGq+abdji
 8+7SMgzTjP9YO9nsGgq2KztzqgHQYH2oyTdhCNfCExOmSqYm1PZq26T/lgSWnLSA7FGB
 Bft+B6UY5yo75gPLoVDfLDccpNhWnDfqcacuN3uZqCQ8yqSGByIclDpoW3gUd9bxqRDS
 yITu6hAS/LO8w79dFOa4TQevt1knZ/rqZnXlli5+UdKvEoEzirdCOK82v0uXRQqIqUDd
 LCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXnf4cXmuVFTqX5HzjHuaEoedwxblxs6HKB1ez2VC10=;
 b=SLmSPpdqDsU8kup7MmCV/4iZKvIJgN9dSSefzQ3DFMptxlkcBMsin2hEcP+zpaozCu
 5udiSPGrxl/lR8HCiZtm3jzIbCTodYg7Qc13VC94MPI6d367prC4sK18F+S62jIXtxIE
 DqFdxGfckh//9F9nlZvLcHQ84FBzx6PgqTWRm4Fgmo0g6gxKmH1yn2XAdH+I49JMcxRH
 /Bu5esmip94+TMIOM2h1+Ju2+MM6iJgNb4bfkfABmd9VfYz42uWStnHCn5kvIxQgZ2Kl
 zIEU8NNKALo6HUurr6Pe4OzT6rIY0ReSHi14YNI896zFcLQF8aboSrINO1qwd5sNKEnN
 kU0A==
X-Gm-Message-State: AOAM531V9kbwSxPQ9gkH1HhN4dXT3LPGDv3F1N0ow2h+Igro9vmArqCR
 3js35iF+QkT9FnS0AFfawH+5fc+atEgPaAKNdR8ZJw==
X-Google-Smtp-Source: ABdhPJzwR3fGSpMc7cQ9R32qIoQ/sz4J5fnk1TIyFtm4+PSGQeJUCsXkcAkQHftDWhU6+i4cJWKA54jinx4bXXPZPCU=
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr22494318wrx.424.1621873671098; 
 Mon, 24 May 2021 09:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
In-Reply-To: <20210524075248.m7mimyya42xas3nx@gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 24 May 2021 09:27:39 -0700
Message-ID: <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
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

On Mon, May 24, 2021 at 12:52 AM Artem Senichev <artemsen@gmail.com> wrote:
>
> I'll try to convey the main idea that we tried to implement in this service.
>
> Hostlogger was originally designed to work with OpenPOWER systems, which
> generate a very detailed log at boot time.

There are definitely other non OpenPOWER systems that have this same behavior.

> It is important to save these logs and the host console output just before
> rebooting for further investigation of incidents when hardware errors occur.
> So, we have two log files for each server session (boot log + last OS messages).
> That's why we need a D-bus watcher.
> BMC flash has around 3MiB of free RW space, this force us to use compression
> and file rotation.
>
> All of these features are unnecessary for "streaming" real-time log recording.

I disagree with you there.  Rotation and compression are still useful
in a "streaming" case.  Because of the ways the APIs are defined,
LogService in redfish provides both a "historical" version of past
logs.  It's useful to have those logs rotated and compressed.

> You don't need DBus watchers, rotation can be done with native Linux utilities,
> you don't even need to split the input stream into lines.

I'm not following why those now wouldn't be needed.  Redfish LogEntry
would separate per line, so we'd have to do the splitting somewhere.
There's already code to do that in hostlogger.  Wouldn't you still
want to separate log per boot, and have lines split between log files?
 I'm not following why those would go away just because there's a
desire to poll for logs and get up to date information.

> Just redirect obmc-console.log: `tail -f /var/log/obmc-console.log > my.log`.

This doesn't solve the problem presented.  First of all, log rotation
and compression are still needed.  Also, it's desirable to have dbus
watchers and separate the logs per boot, such that they can end up
separated in the Redfish API.  Also, in what you presented, my.log
would quickly and easily overflow the available space, as there's no
log rotation.

>
> I understand your desire to add a new mode to the existing project instead of
> creating a new one. But there is very little in common between these modes.

I'm not following how they're all that different, see above about
needing very similar features.  For the sake of argument, lets say we
went with a totally different implementation, would it be able to live
in the hostlogger repo to be able to reuse code where needed?  There's
a lot of code that I suspect will be identical.

> Even reading the socket will have to be done separately, since it is buffered
> for line splitting in the current implementation.
> In the end, only bb-recipe and the `main` function will remain in the common.
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>
> On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:
>
> > >
> > > >
> > > > > we propose to remove the ring buffer and write to the log file
> > > > > as soon as some characters are received.
> > > >
> > > > I am not sure it is a good idea.
> > > > The host can generate a lot of logs, but we have very limited free space.
> > > This is a fair concern, but wouldn't the rollover limits make this not
> > > an issue?  They seem like they could be easily configured.
> >
> > Right. Logrotate will be able to handle the rotation. Maximum size, # log
> > files, and compression can be easily configured.
> >
> > > In
> > > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > > (most
> > > > available products are guaranteed to withstand around 100,000 P/E cycles
> > > only).
> > > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > > that implement this without any ill effects to flash longevity, with
> > > that said, if Nan made the "last log on disk" feature configurable,
> > > would that alleviate your concerns?
> >
> > We also noticed that the obmc-server itself will buffer the log a bit. Will
> > it still be a problem if we don't write a character at once but a block of
> > them?
> > And as Ed said, we can also make this feature configurable. I would imagine
> > the log buffer will remain if the "last log on disk" feature is disabled.
> >
> >
> > > >
> > > > > This implicitly removes the needs
> > > > > of the ring buffer, and the persistence triggering (host reboot,
> > > sigterm,
> > > > > etc) in hostlogger. We believe this keeps the same functionality but
> > > saves
> > > > > hundreds of lines of codes in phosphor-hostlogger.
> > > Difference of opinion here, I don't think this removes the need for
> > > the host reboot event;  Having each reboot post to a different log
> > > needs to be maintained, and I have to imagine that there's some sort
> > > of sigterm handler still, although it becomes a lot smaller.
> >
> >
> > >
> > > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > > are you
> > > > going to keep the same functionality if you remove everything related to
> > > it?
> > > +1.  In the initial thought I didn't think we were removing any
> > > functionality with this.  I had assumed the dbus watcher would remain,
> > > and we would still have the log rotation behavior.  In reading through
> > > Nans proposal I don't think these are getting removed;  Maybe I
> > > misunderstood?
> >
> >
> > Yes, if we want to keep different reboot posts to a different log file, we
> > can keep part of the dbus/signal watcher.
> >
> > On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com> wrote:
> >
> > > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com>
> > > wrote:
> > > >
> > > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > > > > Hi all,
> > > > >
> > > > > In the previous thread (
> > > > > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > > > > (engineers from Google and Quanta) discussed our attempt to share host
> > > > > serial logs via Redfish, which includes polling logs via LogService and
> > > > > streaming log bytes via EventService (e.g. SSE). We went with the
> > > event log
> > > > > architecture
> > > > > <
> > > https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> > > >
> > > > > and did the implementation.
> > > > >
> > > > > We still want to reuse the phosphor-hostlogger and do some
> > > modification. We
> > > > > believe it is better to try to reuse existing codes if possible and
> > > improve
> > > > > them rather than creating new things that have similar functionalities
> > > (in
> > > > > our case, it is a daemon that could collect logs and persist them).
> > > >
> > > > I agree, reusing code is a right choice, but only when it is really
> > > possible.
> > > > For now it looks like you want to remove most of the Hostlogger features
> > > to
> > > > transform it from buffer-like to stream-like service.
> > >
> > > I'm not quite following this statement.  Which features are getting
> > > removed?  From what I can see, he's suggesting making
> > > phosphor-hostlogger look more like a well-behaved linux logging
> > > daemon, but I don't think any features got omitted (or I'm missing
> > > something critical).
> > >
> > > >
> > > > > We want to do the following modification in phosphor-hostlogger (from
> > > the
> > > > > input and output point of view, just very few things will be changed)
> > > > >
> > > > > 1. One limitation of phosphor-hostlogger is that it will lose data in
> > > the
> > > > > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > > > > restarted;
> > > >
> > > > When BMC goes to reboot it stops all services, at that moment hostlogger
> > > gets
> > > > a signal and flushes all gathered logs to a file.
> > >
> > > Only if the reboot is planned.  If the BMC loses power (which is
> > > "normal" for a bmc) there isn't time to persist to flash before the
> > > power goes down and the logs are most likely lost.
> > >
> > > >
> > > > > we propose to remove the ring buffer and write to the log file
> > > > > as soon as some characters are received.
> > > >
> > > > I am not sure it is a good idea.
> > > > The host can generate a lot of logs, but we have very limited free space.
> > >
> > > This is a fair concern, but wouldn't the rollover limits make this not
> > > an issue?  They seem like they could be easily configured.
> > >
> > > > In
> > > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > > (most
> > > > available products are guaranteed to withstand around 100,000 P/E cycles
> > > only).
> > >
> > > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > > that implement this without any ill effects to flash longevity, with
> > > that said, if Nan made the "last log on disk" feature configurable,
> > > would that alleviate your concerns?
> > >
> > > >
> > > > > This implicitly removes the needs
> > > > > of the ring buffer, and the persistence triggering (host reboot,
> > > sigterm,
> > > > > etc) in hostlogger. We believe this keeps the same functionality but
> > > saves
> > > > > hundreds of lines of codes in phosphor-hostlogger.
> > >
> > > Difference of opinion here, I don't think this removes the need for
> > > the host reboot event;  Having each reboot post to a different log
> > > needs to be maintained, and I have to imagine that there's some sort
> > > of sigterm handler still, although it becomes a lot smaller.
> > >
> > > >
> > > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > > are you
> > > > going to keep the same functionality if you remove everything related to
> > > it?
> > >
> > > +1.  In the initial thought I didn't think we were removing any
> > > functionality with this.  I had assumed the dbus watcher would remain,
> > > and we would still have the log rotation behavior.  In reading through
> > > Nans proposal I don't think these are getting removed;  Maybe I
> > > misunderstood?
> > >
> > > >
> > > > > 2. We propose not to compress the latest log file. This saves us the
> > > > > overhead of doing decompression when BMCWeb just needs to retrieve the
> > > most
> > > > > recent logs. There are still going to be log rotations in the file
> > > level.
> > > > > Files other than the latest log file are still going to be compressed.
> > > We
> > > > > can modify existing codes to achieve this or use the linux logrotate
> > > > > directly.
> > > > >
> > > > > Furthermore, we will add host serial logs into BMCWeb, both LogService
> > > and
> > > > > EventService. In LogService, we will teach BMCWeb how to read the
> > > latest
> > > > > log file that is not compressed and the other compressed old logs, and
> > > how
> > > > > to assemble LogEntries out of raw serial logs. We will discuss
> > > EventService
> > > > > in future threads but the very initial idea is to setup inotify on log
> > > > > files and SSE to stream out new bytes to clients (like what the
> > > existing
> > > > > event logging is doing).
> > > > >
> > > > > As we said above, for phosphor-hostlogger, the input is still the
> > > > > obmc-server unix socket, and the output are still persisted log files.
> > > But
> > > > > the functionality will get improved (less data loss), code gets
> > > simplified
> > > > > (no ring buffer and persistence triggering), and it will become easier
> > > and
> > > > > more performant to get BMCWeb hooked up for log streaming via Redfish.
> > > > >
> > > > > Please let us know what you think. We appreciate any feedback. Thank
> > > you
> > > > > very much!
> > > > >
> > > > > Sincerely,
> > > > > Nan
> > > >
> > > > --
> > > > Regards,
> > > > Artem Senichev
> > > > Software Engineer, YADRO.
> > >
