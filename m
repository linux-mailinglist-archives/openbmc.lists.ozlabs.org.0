Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6B39106D
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 08:11:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqgZT6rRRz2yhm
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 16:11:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iCpsGn/9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iCpsGn/9; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqgZC3tTsz2yY1
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 16:11:30 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id w7so127126lji.6
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 23:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OPcfJmLhsUqBsgyhVqdfdC2hYlkLy/qFjEQrJMA0WMU=;
 b=iCpsGn/92PmTx31TtffcdBjQwEv0MaQym8S/POkBi7KSi+x6FPYV8F31wCwmmzKF2a
 fwoHoLqVVdiBemAPDVPK7WXGPAV2f9TF3CI15+f7o5MEKjzh7zj18X7wrvU/6FDXPQGe
 1sOK6HPBulJodckg5DUYBUK+fYxPmsBawLGmW8PQgofxY16WLpVC55z1VoOIWrGP7IB/
 UjhBLvX6p0CwbNXVlIIw7scr5TjPK7nbbvnY9LXOKQmhPwO0VW02r+oxn8YwEIfZ6eoM
 h8c2AhPBKuMHtNzniyEMu7a5U7swxRBve0RflVWI2NDaYPO70sOkuiNpH1qaPvjZ+2Oz
 OvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OPcfJmLhsUqBsgyhVqdfdC2hYlkLy/qFjEQrJMA0WMU=;
 b=fQVa/a9gg/mZmEJyDgmAQQKcSYg49T/HgZwbUQilV0xTl/UzafSqONwODLFTP4gYe8
 soC7ECnEBXnH6CMKt/1NySR/l7Zl0jTx088+PdxabaEmdKVSIUzVwoJ52hVzUi7G1F1d
 Y0W7APSzUdKr0ZY4jr8Yba7aEKy5RmZep7rRWTZ556Qvjn66CGH+FIevOaTDKZE7IBFT
 /R8gOArSk4pLMy/XuK4CWUWef+Ub5GGjK8B8znGKaUH992++jyEQqNU6wQMJnLcQNjam
 fT8KtT+wC0S/Px7JO5Z43zh+x2CK0Hx2Lb27Cb8gL2h/E4/EF7JUOFNSwz+ehB+u6DCL
 hduQ==
X-Gm-Message-State: AOAM530wSEZYN4iuBTc154SHNJNqzcybpMgcIQT2x3ZXBxkoY3BRNcta
 86tuW0/QZwZm7dPsivvEWyA=
X-Google-Smtp-Source: ABdhPJz/lKGAae09vNSK0M+oQuE8TsDgrM7gbo4aKWAZcISmwN/5qkn68PKpxMu33T02P3BVl+bBlA==
X-Received: by 2002:a2e:8107:: with SMTP id d7mr979413ljg.350.1622009482398;
 Tue, 25 May 2021 23:11:22 -0700 (PDT)
Received: from gmail.com (109-252-116-140.nat.spd-mgts.ru. [109.252.116.140])
 by smtp.gmail.com with ESMTPSA id
 l6sm1936181lfk.49.2021.05.25.23.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 23:11:21 -0700 (PDT)
Date: Wed, 26 May 2021 09:11:19 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210526061119.b7n2beqthbemsoba@gmail.com>
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
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
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 10:29:48PM -0700, Nan Zhou wrote:
> Hi Artem,
> 
> I listed the potential changes below (to the best of my understand of
> phosphor-hostlogger),
> 
> 1. log_buffer.xpp:
> will be removed; we propose to persist a chunk into the log file as soon as
> we receive it; newline will be logged as is, so logs are still splitted by
> newlines;

If you remove the newline handler we will lose the timestamps added for each
line.

> we can potentially set the maximum length of a log as well (force
> split a long line into smaller lines)

I would leave the host output "as is". I don't think we should modify it.

> 2. host_console.xpp: stay unchanged;
> 
> 3. zlib_file.xpp, zlib_exception.xpp:
> will be removed or slightly changed; we can potentially use the linux
> logrotate which has built-in compression and file rotation (in this case
> these compression utilities will be removed).
> The latest log file isn't compressed any more. History log files are still
> compressed.

Just curious, how are you going to remove the oldest messages from the latest
file in runtime? You are not going to rewrite the entire file on every input
character, are you?

> We need to implement some codes to deal with the race condition in log
> rotations (we should reopen the writing fd after the latest log file is
> renamed; inotify might do the trick).
> We might also need to rotate according to host boot cycles (like what
> postcodes are doing right now).
>
> 3. dbus_loop.xpp: stay unchanged;
> 
> 4. service.xpp:
> will be slightly changed; socket IO callback and host state watcher are
> kept; manual flash or flash upon service restart will be removed

The manual flush is used in the dreport, please don't forget to remove that
call there.

> 5. config.xpp:
> will be slightly changed; options for flash policy will be removed;

Not slightly =)
Most options are related to the buffer and flush policies.
As I can see, there will stay the socket Id and output directory only.

> We might split the implementation into several phases. We might not jump to
> the final version at one iteration. But the above are what we eventually
> want at this moment.
> 
> On Tue, May 25, 2021 at 8:03 AM Nan Zhou <nanzhou@google.com> wrote:
> 
> > "we propose to remove the ring buffer and write to the log file as soon
> >> as some characters are received. This implicitly removes the needs of
> >> the ring buffer, and the persistence triggering (host reboot, sigterm,
> >> etc) in hostlogger"
> >> I would like to get a more detailed description of further changes in
> >> order
> >> to see the whole picture of the solution.
> >
> >  Originally I didn't consider including changing the log file according to
> > the boot cycle; we will keep part of the dbus/signal watcher to make that
> > different reboot posts to a different log file.
> >
> > We will work out some more detailed descriptions for future changes soon.
> >
> > On Mon, May 24, 2021 at 11:41 PM Artem Senichev <artemsen@gmail.com>
> > wrote:
> >
> >> Sorry guys, maybe this is a misunderstanding on my part.
> >>
> >> I was confused with the following line in the proposal:
> >>
> >> "we propose to remove the ring buffer and write to the log file as soon
> >> as some characters are received. This implicitly removes the needs of
> >> the ring buffer, and the persistence triggering (host reboot, sigterm,
> >> etc) in hostlogger"
> >>
> >> I would like to get a more detailed description of further changes in
> >> order
> >> to see the whole picture of the solution.
> >>
> >> --
> >> Regards,
> >> Artem Senichev
> >> Software Engineer, YADRO.
> >>
> >>
> >> On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:
> >> > On Mon, May 24, 2021 at 12:52 AM Artem Senichev <artemsen@gmail.com>
> >> wrote:
> >> > >
> >> > > I'll try to convey the main idea that we tried to implement in this
> >> service.
> >> > >
> >> > > Hostlogger was originally designed to work with OpenPOWER systems,
> >> which
> >> > > generate a very detailed log at boot time.
> >> >
> >> > There are definitely other non OpenPOWER systems that have this same
> >> behavior.
> >> >
> >> > > It is important to save these logs and the host console output just
> >> before
> >> > > rebooting for further investigation of incidents when hardware errors
> >> occur.
> >> > > So, we have two log files for each server session (boot log + last OS
> >> messages).
> >> > > That's why we need a D-bus watcher.
> >> > > BMC flash has around 3MiB of free RW space, this force us to use
> >> compression
> >> > > and file rotation.
> >> > >
> >> > > All of these features are unnecessary for "streaming" real-time log
> >> recording.
> >> >
> >> > I disagree with you there.  Rotation and compression are still useful
> >> > in a "streaming" case.  Because of the ways the APIs are defined,
> >> > LogService in redfish provides both a "historical" version of past
> >> > logs.  It's useful to have those logs rotated and compressed.
> >> >
> >> > > You don't need DBus watchers, rotation can be done with native Linux
> >> utilities,
> >> > > you don't even need to split the input stream into lines.
> >> >
> >> > I'm not following why those now wouldn't be needed.  Redfish LogEntry
> >> > would separate per line, so we'd have to do the splitting somewhere.
> >> > There's already code to do that in hostlogger.  Wouldn't you still
> >> > want to separate log per boot, and have lines split between log files?
> >> >  I'm not following why those would go away just because there's a
> >> > desire to poll for logs and get up to date information.
> >> >
> >> > > Just redirect obmc-console.log: `tail -f /var/log/obmc-console.log >
> >> my.log`.
> >> >
> >> > This doesn't solve the problem presented.  First of all, log rotation
> >> > and compression are still needed.  Also, it's desirable to have dbus
> >> > watchers and separate the logs per boot, such that they can end up
> >> > separated in the Redfish API.  Also, in what you presented, my.log
> >> > would quickly and easily overflow the available space, as there's no
> >> > log rotation.
> >> >
> >> > >
> >> > > I understand your desire to add a new mode to the existing project
> >> instead of
> >> > > creating a new one. But there is very little in common between these
> >> modes.
> >> >
> >> > I'm not following how they're all that different, see above about
> >> > needing very similar features.  For the sake of argument, lets say we
> >> > went with a totally different implementation, would it be able to live
> >> > in the hostlogger repo to be able to reuse code where needed?  There's
> >> > a lot of code that I suspect will be identical.
> >> >
> >> > > Even reading the socket will have to be done separately, since it is
> >> buffered
> >> > > for line splitting in the current implementation.
> >> > > In the end, only bb-recipe and the `main` function will remain in the
> >> common.
> >> > >
> >> > > --
> >> > > Regards,
> >> > > Artem Senichev
> >> > > Software Engineer, YADRO.
> >> > >
> >> > > On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:
> >> > >
> >> > > > >
> >> > > > > >
> >> > > > > > > we propose to remove the ring buffer and write to the log file
> >> > > > > > > as soon as some characters are received.
> >> > > > > >
> >> > > > > > I am not sure it is a good idea.
> >> > > > > > The host can generate a lot of logs, but we have very limited
> >> free space.
> >> > > > > This is a fair concern, but wouldn't the rollover limits make
> >> this not
> >> > > > > an issue?  They seem like they could be easily configured.
> >> > > >
> >> > > > Right. Logrotate will be able to handle the rotation. Maximum size,
> >> # log
> >> > > > files, and compression can be easily configured.
> >> > > >
> >> > > > > In
> >> > > > > > addition, such heavy traffic will lead to a quick breakdown of
> >> the flash
> >> > > > > (most
> >> > > > > > available products are guaranteed to withstand around 100,000
> >> P/E cycles
> >> > > > > only).
> >> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I know
> >> of
> >> > > > > that implement this without any ill effects to flash longevity,
> >> with
> >> > > > > that said, if Nan made the "last log on disk" feature
> >> configurable,
> >> > > > > would that alleviate your concerns?
> >> > > >
> >> > > > We also noticed that the obmc-server itself will buffer the log a
> >> bit. Will
> >> > > > it still be a problem if we don't write a character at once but a
> >> block of
> >> > > > them?
> >> > > > And as Ed said, we can also make this feature configurable. I would
> >> imagine
> >> > > > the log buffer will remain if the "last log on disk" feature is
> >> disabled.
> >> > > >
> >> > > >
> >> > > > > >
> >> > > > > > > This implicitly removes the needs
> >> > > > > > > of the ring buffer, and the persistence triggering (host
> >> reboot,
> >> > > > > sigterm,
> >> > > > > > > etc) in hostlogger. We believe this keeps the same
> >> functionality but
> >> > > > > saves
> >> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> >> > > > > Difference of opinion here, I don't think this removes the need
> >> for
> >> > > > > the host reboot event;  Having each reboot post to a different log
> >> > > > > needs to be maintained, and I have to imagine that there's some
> >> sort
> >> > > > > of sigterm handler still, although it becomes a lot smaller.
> >> > > >
> >> > > >
> >> > > > >
> >> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> >> rotate. How
> >> > > > > are you
> >> > > > > > going to keep the same functionality if you remove everything
> >> related to
> >> > > > > it?
> >> > > > > +1.  In the initial thought I didn't think we were removing any
> >> > > > > functionality with this.  I had assumed the dbus watcher would
> >> remain,
> >> > > > > and we would still have the log rotation behavior.  In reading
> >> through
> >> > > > > Nans proposal I don't think these are getting removed;  Maybe I
> >> > > > > misunderstood?
> >> > > >
> >> > > >
> >> > > > Yes, if we want to keep different reboot posts to a different log
> >> file, we
> >> > > > can keep part of the dbus/signal watcher.
> >> > > >
> >> > > > On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com>
> >> wrote:
> >> > > >
> >> > > > > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <
> >> artemsen@gmail.com>
> >> > > > > wrote:
> >> > > > > >
> >> > > > > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> >> > > > > > > Hi all,
> >> > > > > > >
> >> > > > > > > In the previous thread (
> >> > > > > > >
> >> https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> >> > > > > > > (engineers from Google and Quanta) discussed our attempt to
> >> share host
> >> > > > > > > serial logs via Redfish, which includes polling logs via
> >> LogService and
> >> > > > > > > streaming log bytes via EventService (e.g. SSE). We went with
> >> the
> >> > > > > event log
> >> > > > > > > architecture
> >> > > > > > > <
> >> > > > >
> >> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >> > > > > >
> >> > > > > > > and did the implementation.
> >> > > > > > >
> >> > > > > > > We still want to reuse the phosphor-hostlogger and do some
> >> > > > > modification. We
> >> > > > > > > believe it is better to try to reuse existing codes if
> >> possible and
> >> > > > > improve
> >> > > > > > > them rather than creating new things that have similar
> >> functionalities
> >> > > > > (in
> >> > > > > > > our case, it is a daemon that could collect logs and persist
> >> them).
> >> > > > > >
> >> > > > > > I agree, reusing code is a right choice, but only when it is
> >> really
> >> > > > > possible.
> >> > > > > > For now it looks like you want to remove most of the Hostlogger
> >> features
> >> > > > > to
> >> > > > > > transform it from buffer-like to stream-like service.
> >> > > > >
> >> > > > > I'm not quite following this statement.  Which features are
> >> getting
> >> > > > > removed?  From what I can see, he's suggesting making
> >> > > > > phosphor-hostlogger look more like a well-behaved linux logging
> >> > > > > daemon, but I don't think any features got omitted (or I'm missing
> >> > > > > something critical).
> >> > > > >
> >> > > > > >
> >> > > > > > > We want to do the following modification in
> >> phosphor-hostlogger (from
> >> > > > > the
> >> > > > > > > input and output point of view, just very few things will be
> >> changed)
> >> > > > > > >
> >> > > > > > > 1. One limitation of phosphor-hostlogger is that it will lose
> >> data in
> >> > > > > the
> >> > > > > > > memory (the ring buffer maintained by hostlogger) when BMC
> >> gets force
> >> > > > > > > restarted;
> >> > > > > >
> >> > > > > > When BMC goes to reboot it stops all services, at that moment
> >> hostlogger
> >> > > > > gets
> >> > > > > > a signal and flushes all gathered logs to a file.
> >> > > > >
> >> > > > > Only if the reboot is planned.  If the BMC loses power (which is
> >> > > > > "normal" for a bmc) there isn't time to persist to flash before
> >> the
> >> > > > > power goes down and the logs are most likely lost.
> >> > > > >
> >> > > > > >
> >> > > > > > > we propose to remove the ring buffer and write to the log file
> >> > > > > > > as soon as some characters are received.
> >> > > > > >
> >> > > > > > I am not sure it is a good idea.
> >> > > > > > The host can generate a lot of logs, but we have very limited
> >> free space.
> >> > > > >
> >> > > > > This is a fair concern, but wouldn't the rollover limits make
> >> this not
> >> > > > > an issue?  They seem like they could be easily configured.
> >> > > > >
> >> > > > > > In
> >> > > > > > addition, such heavy traffic will lead to a quick breakdown of
> >> the flash
> >> > > > > (most
> >> > > > > > available products are guaranteed to withstand around 100,000
> >> P/E cycles
> >> > > > > only).
> >> > > > >
> >> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I know
> >> of
> >> > > > > that implement this without any ill effects to flash longevity,
> >> with
> >> > > > > that said, if Nan made the "last log on disk" feature
> >> configurable,
> >> > > > > would that alleviate your concerns?
> >> > > > >
> >> > > > > >
> >> > > > > > > This implicitly removes the needs
> >> > > > > > > of the ring buffer, and the persistence triggering (host
> >> reboot,
> >> > > > > sigterm,
> >> > > > > > > etc) in hostlogger. We believe this keeps the same
> >> functionality but
> >> > > > > saves
> >> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> >> > > > >
> >> > > > > Difference of opinion here, I don't think this removes the need
> >> for
> >> > > > > the host reboot event;  Having each reboot post to a different log
> >> > > > > needs to be maintained, and I have to imagine that there's some
> >> sort
> >> > > > > of sigterm handler still, although it becomes a lot smaller.
> >> > > > >
> >> > > > > >
> >> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> >> rotate. How
> >> > > > > are you
> >> > > > > > going to keep the same functionality if you remove everything
> >> related to
> >> > > > > it?
> >> > > > >
> >> > > > > +1.  In the initial thought I didn't think we were removing any
> >> > > > > functionality with this.  I had assumed the dbus watcher would
> >> remain,
> >> > > > > and we would still have the log rotation behavior.  In reading
> >> through
> >> > > > > Nans proposal I don't think these are getting removed;  Maybe I
> >> > > > > misunderstood?
> >> > > > >
> >> > > > > >
> >> > > > > > > 2. We propose not to compress the latest log file. This saves
> >> us the
> >> > > > > > > overhead of doing decompression when BMCWeb just needs to
> >> retrieve the
> >> > > > > most
> >> > > > > > > recent logs. There are still going to be log rotations in the
> >> file
> >> > > > > level.
> >> > > > > > > Files other than the latest log file are still going to be
> >> compressed.
> >> > > > > We
> >> > > > > > > can modify existing codes to achieve this or use the linux
> >> logrotate
> >> > > > > > > directly.
> >> > > > > > >
> >> > > > > > > Furthermore, we will add host serial logs into BMCWeb, both
> >> LogService
> >> > > > > and
> >> > > > > > > EventService. In LogService, we will teach BMCWeb how to read
> >> the
> >> > > > > latest
> >> > > > > > > log file that is not compressed and the other compressed old
> >> logs, and
> >> > > > > how
> >> > > > > > > to assemble LogEntries out of raw serial logs. We will discuss
> >> > > > > EventService
> >> > > > > > > in future threads but the very initial idea is to setup
> >> inotify on log
> >> > > > > > > files and SSE to stream out new bytes to clients (like what
> >> the
> >> > > > > existing
> >> > > > > > > event logging is doing).
> >> > > > > > >
> >> > > > > > > As we said above, for phosphor-hostlogger, the input is still
> >> the
> >> > > > > > > obmc-server unix socket, and the output are still persisted
> >> log files.
> >> > > > > But
> >> > > > > > > the functionality will get improved (less data loss), code
> >> gets
> >> > > > > simplified
> >> > > > > > > (no ring buffer and persistence triggering), and it will
> >> become easier
> >> > > > > and
> >> > > > > > > more performant to get BMCWeb hooked up for log streaming via
> >> Redfish.
> >> > > > > > >
> >> > > > > > > Please let us know what you think. We appreciate any
> >> feedback. Thank
> >> > > > > you
> >> > > > > > > very much!
> >> > > > > > >
> >> > > > > > > Sincerely,
> >> > > > > > > Nan
> >> > > > > >
> >> > > > > > --
> >> > > > > > Regards,
> >> > > > > > Artem Senichev
> >> > > > > > Software Engineer, YADRO.
> >> > > > >
> >>
> >

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
