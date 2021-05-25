Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C838FB15
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 08:41:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq4Hd0wbkz2yQq
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 16:41:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XgCDjnal;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XgCDjnal; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq4HM3NZZz2y0C
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 16:41:34 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id q1so1899203lfo.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OyA6DXax42g+OIo8Vc9CMQ2lSziZRwq4NpNyQ2oUOss=;
 b=XgCDjnalmdQknY+9rrlQEsdiGjj/880nmX/PIn4WZwKAIrZPsZOteNRqM+EXwbN5Ue
 91OYviqnISetljxJSHRBpE//m3BoE9D/7DGv3hyOyDQGU2K72icBGQeYV35xZ+5aIO28
 6iRXhFxYtX8vJDtLyoBXPPZBxkkKMwZzbnAKGPo98/tcOe2CT4IPA8NtIl2z4+I5/aZY
 Tslzc4gLsBZUSX0PDpSZDsMuMhv6SqN86qjTU4MJjJQi5+ujiJSQO54pGL0pcfWhuwiP
 8J3/bjIJKp5MiCJAys36DJxyS/YJMn/yOSWGzIBZO6RZ1bGg1SBhWDcU36vpVqDXH0ap
 2eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OyA6DXax42g+OIo8Vc9CMQ2lSziZRwq4NpNyQ2oUOss=;
 b=mXO0wH4fZbldHy/Kbtn4tyb1lnjAM7eikPSC7ePMPnIWbvRtn1V9G/P4M4yjv3n/xp
 S9llfJuU50HdM6byAaOa/8adMowtjhl2zCUYDFAkCWsT2lE6A5mjY6Wd3HHbLIo0Jqar
 /T5gEWD4n4Dg5gi6ynf0dmiEi2UdUCUtjTkSl9LOYti08y4wtqbygF+PA1fnqVQIIzUb
 l73RfpNGKWnd6hXL1wXmX/h3O3KRn9NzTR/7dEBhfjMeWJ9SAX9yw6Nk966gjQkY1FoH
 k0/UZfu5D8bCmBvReLKXBQAVgM+rYFeNAyIrTOlrrz8HBQgxUjV9HZ4PE4AQeZSaM/e/
 9tTg==
X-Gm-Message-State: AOAM5334LDR8a6tzYu+5PFU3WoiHvUzbv5pj7YTrrF/gLDSEf+weDr0T
 zFlgZ71zfUatXNA4Uhih2es=
X-Google-Smtp-Source: ABdhPJxtsrHth9BszXNP4IzI0xY/gHABPtt6yGZNwizGfMZuNsyWiENCnw+GQU5xcPfBbTzGhjfsXQ==
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr12762443lfg.294.1621924890885; 
 Mon, 24 May 2021 23:41:30 -0700 (PDT)
Received: from gmail.com ([109.252.116.140])
 by smtp.gmail.com with ESMTPSA id i11sm1634205lfe.211.2021.05.24.23.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 23:41:30 -0700 (PDT)
Date: Tue, 25 May 2021 09:41:27 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
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

Sorry guys, maybe this is a misunderstanding on my part.

I was confused with the following line in the proposal:

"we propose to remove the ring buffer and write to the log file as soon
as some characters are received. This implicitly removes the needs of
the ring buffer, and the persistence triggering (host reboot, sigterm,
etc) in hostlogger"

I would like to get a more detailed description of further changes in order
to see the whole picture of the solution. 

--
Regards,
Artem Senichev
Software Engineer, YADRO.


On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:
> On Mon, May 24, 2021 at 12:52 AM Artem Senichev <artemsen@gmail.com> wrote:
> >
> > I'll try to convey the main idea that we tried to implement in this service.
> >
> > Hostlogger was originally designed to work with OpenPOWER systems, which
> > generate a very detailed log at boot time.
> 
> There are definitely other non OpenPOWER systems that have this same behavior.
> 
> > It is important to save these logs and the host console output just before
> > rebooting for further investigation of incidents when hardware errors occur.
> > So, we have two log files for each server session (boot log + last OS messages).
> > That's why we need a D-bus watcher.
> > BMC flash has around 3MiB of free RW space, this force us to use compression
> > and file rotation.
> >
> > All of these features are unnecessary for "streaming" real-time log recording.
> 
> I disagree with you there.  Rotation and compression are still useful
> in a "streaming" case.  Because of the ways the APIs are defined,
> LogService in redfish provides both a "historical" version of past
> logs.  It's useful to have those logs rotated and compressed.
> 
> > You don't need DBus watchers, rotation can be done with native Linux utilities,
> > you don't even need to split the input stream into lines.
> 
> I'm not following why those now wouldn't be needed.  Redfish LogEntry
> would separate per line, so we'd have to do the splitting somewhere.
> There's already code to do that in hostlogger.  Wouldn't you still
> want to separate log per boot, and have lines split between log files?
>  I'm not following why those would go away just because there's a
> desire to poll for logs and get up to date information.
> 
> > Just redirect obmc-console.log: `tail -f /var/log/obmc-console.log > my.log`.
> 
> This doesn't solve the problem presented.  First of all, log rotation
> and compression are still needed.  Also, it's desirable to have dbus
> watchers and separate the logs per boot, such that they can end up
> separated in the Redfish API.  Also, in what you presented, my.log
> would quickly and easily overflow the available space, as there's no
> log rotation.
> 
> >
> > I understand your desire to add a new mode to the existing project instead of
> > creating a new one. But there is very little in common between these modes.
> 
> I'm not following how they're all that different, see above about
> needing very similar features.  For the sake of argument, lets say we
> went with a totally different implementation, would it be able to live
> in the hostlogger repo to be able to reuse code where needed?  There's
> a lot of code that I suspect will be identical.
> 
> > Even reading the socket will have to be done separately, since it is buffered
> > for line splitting in the current implementation.
> > In the end, only bb-recipe and the `main` function will remain in the common.
> >
> > --
> > Regards,
> > Artem Senichev
> > Software Engineer, YADRO.
> >
> > On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:
> >
> > > >
> > > > >
> > > > > > we propose to remove the ring buffer and write to the log file
> > > > > > as soon as some characters are received.
> > > > >
> > > > > I am not sure it is a good idea.
> > > > > The host can generate a lot of logs, but we have very limited free space.
> > > > This is a fair concern, but wouldn't the rollover limits make this not
> > > > an issue?  They seem like they could be easily configured.
> > >
> > > Right. Logrotate will be able to handle the rotation. Maximum size, # log
> > > files, and compression can be easily configured.
> > >
> > > > In
> > > > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > > > (most
> > > > > available products are guaranteed to withstand around 100,000 P/E cycles
> > > > only).
> > > > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > > > that implement this without any ill effects to flash longevity, with
> > > > that said, if Nan made the "last log on disk" feature configurable,
> > > > would that alleviate your concerns?
> > >
> > > We also noticed that the obmc-server itself will buffer the log a bit. Will
> > > it still be a problem if we don't write a character at once but a block of
> > > them?
> > > And as Ed said, we can also make this feature configurable. I would imagine
> > > the log buffer will remain if the "last log on disk" feature is disabled.
> > >
> > >
> > > > >
> > > > > > This implicitly removes the needs
> > > > > > of the ring buffer, and the persistence triggering (host reboot,
> > > > sigterm,
> > > > > > etc) in hostlogger. We believe this keeps the same functionality but
> > > > saves
> > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > > > Difference of opinion here, I don't think this removes the need for
> > > > the host reboot event;  Having each reboot post to a different log
> > > > needs to be maintained, and I have to imagine that there's some sort
> > > > of sigterm handler still, although it becomes a lot smaller.
> > >
> > >
> > > >
> > > > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > > > are you
> > > > > going to keep the same functionality if you remove everything related to
> > > > it?
> > > > +1.  In the initial thought I didn't think we were removing any
> > > > functionality with this.  I had assumed the dbus watcher would remain,
> > > > and we would still have the log rotation behavior.  In reading through
> > > > Nans proposal I don't think these are getting removed;  Maybe I
> > > > misunderstood?
> > >
> > >
> > > Yes, if we want to keep different reboot posts to a different log file, we
> > > can keep part of the dbus/signal watcher.
> > >
> > > On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com> wrote:
> > >
> > > > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com>
> > > > wrote:
> > > > >
> > > > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > In the previous thread (
> > > > > > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > > > > > (engineers from Google and Quanta) discussed our attempt to share host
> > > > > > serial logs via Redfish, which includes polling logs via LogService and
> > > > > > streaming log bytes via EventService (e.g. SSE). We went with the
> > > > event log
> > > > > > architecture
> > > > > > <
> > > > https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> > > > >
> > > > > > and did the implementation.
> > > > > >
> > > > > > We still want to reuse the phosphor-hostlogger and do some
> > > > modification. We
> > > > > > believe it is better to try to reuse existing codes if possible and
> > > > improve
> > > > > > them rather than creating new things that have similar functionalities
> > > > (in
> > > > > > our case, it is a daemon that could collect logs and persist them).
> > > > >
> > > > > I agree, reusing code is a right choice, but only when it is really
> > > > possible.
> > > > > For now it looks like you want to remove most of the Hostlogger features
> > > > to
> > > > > transform it from buffer-like to stream-like service.
> > > >
> > > > I'm not quite following this statement.  Which features are getting
> > > > removed?  From what I can see, he's suggesting making
> > > > phosphor-hostlogger look more like a well-behaved linux logging
> > > > daemon, but I don't think any features got omitted (or I'm missing
> > > > something critical).
> > > >
> > > > >
> > > > > > We want to do the following modification in phosphor-hostlogger (from
> > > > the
> > > > > > input and output point of view, just very few things will be changed)
> > > > > >
> > > > > > 1. One limitation of phosphor-hostlogger is that it will lose data in
> > > > the
> > > > > > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > > > > > restarted;
> > > > >
> > > > > When BMC goes to reboot it stops all services, at that moment hostlogger
> > > > gets
> > > > > a signal and flushes all gathered logs to a file.
> > > >
> > > > Only if the reboot is planned.  If the BMC loses power (which is
> > > > "normal" for a bmc) there isn't time to persist to flash before the
> > > > power goes down and the logs are most likely lost.
> > > >
> > > > >
> > > > > > we propose to remove the ring buffer and write to the log file
> > > > > > as soon as some characters are received.
> > > > >
> > > > > I am not sure it is a good idea.
> > > > > The host can generate a lot of logs, but we have very limited free space.
> > > >
> > > > This is a fair concern, but wouldn't the rollover limits make this not
> > > > an issue?  They seem like they could be easily configured.
> > > >
> > > > > In
> > > > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > > > (most
> > > > > available products are guaranteed to withstand around 100,000 P/E cycles
> > > > only).
> > > >
> > > > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > > > that implement this without any ill effects to flash longevity, with
> > > > that said, if Nan made the "last log on disk" feature configurable,
> > > > would that alleviate your concerns?
> > > >
> > > > >
> > > > > > This implicitly removes the needs
> > > > > > of the ring buffer, and the persistence triggering (host reboot,
> > > > sigterm,
> > > > > > etc) in hostlogger. We believe this keeps the same functionality but
> > > > saves
> > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > > >
> > > > Difference of opinion here, I don't think this removes the need for
> > > > the host reboot event;  Having each reboot post to a different log
> > > > needs to be maintained, and I have to imagine that there's some sort
> > > > of sigterm handler still, although it becomes a lot smaller.
> > > >
> > > > >
> > > > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > > > are you
> > > > > going to keep the same functionality if you remove everything related to
> > > > it?
> > > >
> > > > +1.  In the initial thought I didn't think we were removing any
> > > > functionality with this.  I had assumed the dbus watcher would remain,
> > > > and we would still have the log rotation behavior.  In reading through
> > > > Nans proposal I don't think these are getting removed;  Maybe I
> > > > misunderstood?
> > > >
> > > > >
> > > > > > 2. We propose not to compress the latest log file. This saves us the
> > > > > > overhead of doing decompression when BMCWeb just needs to retrieve the
> > > > most
> > > > > > recent logs. There are still going to be log rotations in the file
> > > > level.
> > > > > > Files other than the latest log file are still going to be compressed.
> > > > We
> > > > > > can modify existing codes to achieve this or use the linux logrotate
> > > > > > directly.
> > > > > >
> > > > > > Furthermore, we will add host serial logs into BMCWeb, both LogService
> > > > and
> > > > > > EventService. In LogService, we will teach BMCWeb how to read the
> > > > latest
> > > > > > log file that is not compressed and the other compressed old logs, and
> > > > how
> > > > > > to assemble LogEntries out of raw serial logs. We will discuss
> > > > EventService
> > > > > > in future threads but the very initial idea is to setup inotify on log
> > > > > > files and SSE to stream out new bytes to clients (like what the
> > > > existing
> > > > > > event logging is doing).
> > > > > >
> > > > > > As we said above, for phosphor-hostlogger, the input is still the
> > > > > > obmc-server unix socket, and the output are still persisted log files.
> > > > But
> > > > > > the functionality will get improved (less data loss), code gets
> > > > simplified
> > > > > > (no ring buffer and persistence triggering), and it will become easier
> > > > and
> > > > > > more performant to get BMCWeb hooked up for log streaming via Redfish.
> > > > > >
> > > > > > Please let us know what you think. We appreciate any feedback. Thank
> > > > you
> > > > > > very much!
> > > > > >
> > > > > > Sincerely,
> > > > > > Nan
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Artem Senichev
> > > > > Software Engineer, YADRO.
> > > >
