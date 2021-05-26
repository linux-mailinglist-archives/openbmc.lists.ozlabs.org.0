Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9A3910E8
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 08:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqhTG6ZKSz2yjJ
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 16:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=DMNDkSrr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DMNDkSrr; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqhSx3ppCz2xgF
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 16:51:59 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id g38so548705ybi.12
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8kgRqAOZB84ntHe6RMg9vMghuhHNJwnc9+apBpiI0PU=;
 b=DMNDkSrr/boIlh1GqQSnmMiTCu9gyIgOIGLgQH9D+kBjnLVNWowuip9SeT9ZrnaYmj
 EMTF+hoLeW5DeUEdwtrZirxCGPI/7odKsmT2qrmxGL5IQtHTDQRnSjN76V0v+fDdXAt8
 hexc6vcERe4GgSPG7ZIDpWnKw3wW7xb8RARMOLeUs8ck7bCKU642edyA2ANEioi80Pd/
 MM6WK2JSCMG2qgV/F4nXlGzyR7jVQ/bmBfJv2FY56JZgrBAqB9kL2H/BK0htFhR1ZCix
 7gc6KanVym/5LZDAeZdyaCO/PquHn4f8+U2BHlhlPX2QYmOTgI+MyWJ5Hsy3IbnLnCaV
 xsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8kgRqAOZB84ntHe6RMg9vMghuhHNJwnc9+apBpiI0PU=;
 b=oFQ4J76xjKVLXc2FNxKzxKqnXH4Tox1FELQp1ed0arsOiI6YnRKbwuIz3cECSQUY+y
 rE7/NjuiCKLK9N1NG4lnOXDWRRJzl4A96MWiSecUw2RxEkY5HVHgt97VIQGcivj5/thh
 IZXfz9QQCytPIWLRLVZMAWIy17efSdW2hDSC3+ax7E9cExMvs8xF7XHcyooY1rie9bOG
 UTHkvbuw/hZK+lBnyYTJjH0rfteqxi1Ze6DLcpkDlf5r6hRJ5OHhzI5KGsiG7aM2S6cq
 3J6J1A2/nOmnRXbUKie4Me0dMLxhmfjmcC434n9h1akcgkCIOG863tzF2t7UJ3SMUfPN
 p5+Q==
X-Gm-Message-State: AOAM533HenOUm4x6i3UeH7A4XZzTsI233jAQnHO+tmHJyofgMRzWpHVm
 /6kgEZsRYl7okJnW+oaYEBsxeJORDOYPItvH1TQqew==
X-Google-Smtp-Source: ABdhPJzRhtOcAkl/ATBCvWgwjGm5LLaiPjPd3AoBVvfSbHsfCpOVMjt3ZHv5A8ETMtNVR11ptePEA+WjQVcgBQfSg4U=
X-Received: by 2002:a25:bad0:: with SMTP id a16mr48073806ybk.441.1622011915339; 
 Tue, 25 May 2021 23:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
In-Reply-To: <20210526061119.b7n2beqthbemsoba@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Tue, 25 May 2021 23:51:44 -0700
Message-ID: <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000009776e05c3361428"
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

--00000000000009776e05c3361428
Content-Type: text/plain; charset="UTF-8"

> > 1. log_buffer.xpp:
> > will be removed; we propose to persist a chunk into the log file as soon
> as
> > we receive it; newline will be logged as is, so logs are still splitted
> by
> > newlines;
> If you remove the newline handler we will lose the timestamps added for
> each
> line.

Good catch. If timestamps are necessary (it is necessary for the Redfish
LogEntry), I think we can keep the current newline detection logic in
log_buffer.xpp. Once a new line is detected, we append the current
timestamp first, and then append the bytes chunk.

> we can potentially set the maximum length of a log as well (force
> > split a long line into smaller lines)
> I would leave the host output "as is". I don't think we should modify it.

OK. We have concerns about edge cases where a log line is too long.

> 2. host_console.xpp: stay unchanged;
> >
> > 3. zlib_file.xpp, zlib_exception.xpp:
> > will be removed or slightly changed; we can potentially use the linux
> > logrotate which has built-in compression and file rotation (in this case
> > these compression utilities will be removed).
> > The latest log file isn't compressed any more. History log files are
> still
> > compressed.
> Just curious, how are you going to remove the oldest messages from the
> latest
> file in runtime? You are not going to rewrite the entire file on every
> input
> character, are you?

The following is my current idea: we will rename the latest file to
something else and notify the writer (hostlogger) to close its old file
descriptor and open a new one (should be doable via linux logrotate and
inotify or some signal handlers, as logrotate is able to send some signals
to hostlogger if a rotation is performed). The writer keeps appending logs
most of the time using the same fd unless the latest file is rotated. This
should be better than truncating the file where the reader (BMCWeb) won't
have race conditions (it might read old snapshots but it is not a big deal
in our case).

> We need to implement some codes to deal with the race condition in log
> > rotations (we should reopen the writing fd after the latest log file is
> > renamed; inotify might do the trick).
> > We might also need to rotate according to host boot cycles (like what
> > postcodes are doing right now).
> >
> > 3. dbus_loop.xpp: stay unchanged;
> >
> > 4. service.xpp:
> > will be slightly changed; socket IO callback and host state watcher are
> > kept; manual flash or flash upon service restart will be removed
> The manual flush is used in the dreport, please don't forget to remove that
> call there.

Thanks for the information.

 > 5. config.xpp:
> > will be slightly changed; options for flash policy will be removed;
> Not slightly =)
> Most options are related to the buffer and flush policies.
> As I can see, there will stay the socket Id and output directory only.

Yes. I would assume the host state policy will stay as well.

How do you like the proposal now? I hope we make it more clear. Do you
think it is a good direction that we can go with?

On Tue, May 25, 2021 at 11:11 PM Artem Senichev <artemsen@gmail.com> wrote:

> On Tue, May 25, 2021 at 10:29:48PM -0700, Nan Zhou wrote:
> > Hi Artem,
> >
> > I listed the potential changes below (to the best of my understand of
> > phosphor-hostlogger),
> >
> > 1. log_buffer.xpp:
> > will be removed; we propose to persist a chunk into the log file as soon
> as
> > we receive it; newline will be logged as is, so logs are still splitted
> by
> > newlines;
>
> If you remove the newline handler we will lose the timestamps added for
> each
> line.
>
> > we can potentially set the maximum length of a log as well (force
> > split a long line into smaller lines)
>
> I would leave the host output "as is". I don't think we should modify it.
>
> > 2. host_console.xpp: stay unchanged;
> >
> > 3. zlib_file.xpp, zlib_exception.xpp:
> > will be removed or slightly changed; we can potentially use the linux
> > logrotate which has built-in compression and file rotation (in this case
> > these compression utilities will be removed).
> > The latest log file isn't compressed any more. History log files are
> still
> > compressed.
>
> Just curious, how are you going to remove the oldest messages from the
> latest
> file in runtime? You are not going to rewrite the entire file on every
> input
> character, are you?
>
> > We need to implement some codes to deal with the race condition in log
> > rotations (we should reopen the writing fd after the latest log file is
> > renamed; inotify might do the trick).
> > We might also need to rotate according to host boot cycles (like what
> > postcodes are doing right now).
> >
> > 3. dbus_loop.xpp: stay unchanged;
> >
> > 4. service.xpp:
> > will be slightly changed; socket IO callback and host state watcher are
> > kept; manual flash or flash upon service restart will be removed
>
> The manual flush is used in the dreport, please don't forget to remove that
> call there.
>
> > 5. config.xpp:
> > will be slightly changed; options for flash policy will be removed;
>
> Not slightly =)
> Most options are related to the buffer and flush policies.
> As I can see, there will stay the socket Id and output directory only.
>
> > We might split the implementation into several phases. We might not jump
> to
> > the final version at one iteration. But the above are what we eventually
> > want at this moment.
> >
> > On Tue, May 25, 2021 at 8:03 AM Nan Zhou <nanzhou@google.com> wrote:
> >
> > > "we propose to remove the ring buffer and write to the log file as soon
> > >> as some characters are received. This implicitly removes the needs of
> > >> the ring buffer, and the persistence triggering (host reboot, sigterm,
> > >> etc) in hostlogger"
> > >> I would like to get a more detailed description of further changes in
> > >> order
> > >> to see the whole picture of the solution.
> > >
> > >  Originally I didn't consider including changing the log file
> according to
> > > the boot cycle; we will keep part of the dbus/signal watcher to make
> that
> > > different reboot posts to a different log file.
> > >
> > > We will work out some more detailed descriptions for future changes
> soon.
> > >
> > > On Mon, May 24, 2021 at 11:41 PM Artem Senichev <artemsen@gmail.com>
> > > wrote:
> > >
> > >> Sorry guys, maybe this is a misunderstanding on my part.
> > >>
> > >> I was confused with the following line in the proposal:
> > >>
> > >> "we propose to remove the ring buffer and write to the log file as
> soon
> > >> as some characters are received. This implicitly removes the needs of
> > >> the ring buffer, and the persistence triggering (host reboot, sigterm,
> > >> etc) in hostlogger"
> > >>
> > >> I would like to get a more detailed description of further changes in
> > >> order
> > >> to see the whole picture of the solution.
> > >>
> > >> --
> > >> Regards,
> > >> Artem Senichev
> > >> Software Engineer, YADRO.
> > >>
> > >>
> > >> On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:
> > >> > On Mon, May 24, 2021 at 12:52 AM Artem Senichev <artemsen@gmail.com
> >
> > >> wrote:
> > >> > >
> > >> > > I'll try to convey the main idea that we tried to implement in
> this
> > >> service.
> > >> > >
> > >> > > Hostlogger was originally designed to work with OpenPOWER systems,
> > >> which
> > >> > > generate a very detailed log at boot time.
> > >> >
> > >> > There are definitely other non OpenPOWER systems that have this same
> > >> behavior.
> > >> >
> > >> > > It is important to save these logs and the host console output
> just
> > >> before
> > >> > > rebooting for further investigation of incidents when hardware
> errors
> > >> occur.
> > >> > > So, we have two log files for each server session (boot log +
> last OS
> > >> messages).
> > >> > > That's why we need a D-bus watcher.
> > >> > > BMC flash has around 3MiB of free RW space, this force us to use
> > >> compression
> > >> > > and file rotation.
> > >> > >
> > >> > > All of these features are unnecessary for "streaming" real-time
> log
> > >> recording.
> > >> >
> > >> > I disagree with you there.  Rotation and compression are still
> useful
> > >> > in a "streaming" case.  Because of the ways the APIs are defined,
> > >> > LogService in redfish provides both a "historical" version of past
> > >> > logs.  It's useful to have those logs rotated and compressed.
> > >> >
> > >> > > You don't need DBus watchers, rotation can be done with native
> Linux
> > >> utilities,
> > >> > > you don't even need to split the input stream into lines.
> > >> >
> > >> > I'm not following why those now wouldn't be needed.  Redfish
> LogEntry
> > >> > would separate per line, so we'd have to do the splitting somewhere.
> > >> > There's already code to do that in hostlogger.  Wouldn't you still
> > >> > want to separate log per boot, and have lines split between log
> files?
> > >> >  I'm not following why those would go away just because there's a
> > >> > desire to poll for logs and get up to date information.
> > >> >
> > >> > > Just redirect obmc-console.log: `tail -f
> /var/log/obmc-console.log >
> > >> my.log`.
> > >> >
> > >> > This doesn't solve the problem presented.  First of all, log
> rotation
> > >> > and compression are still needed.  Also, it's desirable to have dbus
> > >> > watchers and separate the logs per boot, such that they can end up
> > >> > separated in the Redfish API.  Also, in what you presented, my.log
> > >> > would quickly and easily overflow the available space, as there's no
> > >> > log rotation.
> > >> >
> > >> > >
> > >> > > I understand your desire to add a new mode to the existing project
> > >> instead of
> > >> > > creating a new one. But there is very little in common between
> these
> > >> modes.
> > >> >
> > >> > I'm not following how they're all that different, see above about
> > >> > needing very similar features.  For the sake of argument, lets say
> we
> > >> > went with a totally different implementation, would it be able to
> live
> > >> > in the hostlogger repo to be able to reuse code where needed?
> There's
> > >> > a lot of code that I suspect will be identical.
> > >> >
> > >> > > Even reading the socket will have to be done separately, since it
> is
> > >> buffered
> > >> > > for line splitting in the current implementation.
> > >> > > In the end, only bb-recipe and the `main` function will remain in
> the
> > >> common.
> > >> > >
> > >> > > --
> > >> > > Regards,
> > >> > > Artem Senichev
> > >> > > Software Engineer, YADRO.
> > >> > >
> > >> > > On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:
> > >> > >
> > >> > > > >
> > >> > > > > >
> > >> > > > > > > we propose to remove the ring buffer and write to the log
> file
> > >> > > > > > > as soon as some characters are received.
> > >> > > > > >
> > >> > > > > > I am not sure it is a good idea.
> > >> > > > > > The host can generate a lot of logs, but we have very
> limited
> > >> free space.
> > >> > > > > This is a fair concern, but wouldn't the rollover limits make
> > >> this not
> > >> > > > > an issue?  They seem like they could be easily configured.
> > >> > > >
> > >> > > > Right. Logrotate will be able to handle the rotation. Maximum
> size,
> > >> # log
> > >> > > > files, and compression can be easily configured.
> > >> > > >
> > >> > > > > In
> > >> > > > > > addition, such heavy traffic will lead to a quick breakdown
> of
> > >> the flash
> > >> > > > > (most
> > >> > > > > > available products are guaranteed to withstand around
> 100,000
> > >> P/E cycles
> > >> > > > > only).
> > >> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I
> know
> > >> of
> > >> > > > > that implement this without any ill effects to flash
> longevity,
> > >> with
> > >> > > > > that said, if Nan made the "last log on disk" feature
> > >> configurable,
> > >> > > > > would that alleviate your concerns?
> > >> > > >
> > >> > > > We also noticed that the obmc-server itself will buffer the log
> a
> > >> bit. Will
> > >> > > > it still be a problem if we don't write a character at once but
> a
> > >> block of
> > >> > > > them?
> > >> > > > And as Ed said, we can also make this feature configurable. I
> would
> > >> imagine
> > >> > > > the log buffer will remain if the "last log on disk" feature is
> > >> disabled.
> > >> > > >
> > >> > > >
> > >> > > > > >
> > >> > > > > > > This implicitly removes the needs
> > >> > > > > > > of the ring buffer, and the persistence triggering (host
> > >> reboot,
> > >> > > > > sigterm,
> > >> > > > > > > etc) in hostlogger. We believe this keeps the same
> > >> functionality but
> > >> > > > > saves
> > >> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > >> > > > > Difference of opinion here, I don't think this removes the
> need
> > >> for
> > >> > > > > the host reboot event;  Having each reboot post to a
> different log
> > >> > > > > needs to be maintained, and I have to imagine that there's
> some
> > >> sort
> > >> > > > > of sigterm handler still, although it becomes a lot smaller.
> > >> > > >
> > >> > > >
> > >> > > > >
> > >> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> > >> rotate. How
> > >> > > > > are you
> > >> > > > > > going to keep the same functionality if you remove
> everything
> > >> related to
> > >> > > > > it?
> > >> > > > > +1.  In the initial thought I didn't think we were removing
> any
> > >> > > > > functionality with this.  I had assumed the dbus watcher would
> > >> remain,
> > >> > > > > and we would still have the log rotation behavior.  In reading
> > >> through
> > >> > > > > Nans proposal I don't think these are getting removed;  Maybe
> I
> > >> > > > > misunderstood?
> > >> > > >
> > >> > > >
> > >> > > > Yes, if we want to keep different reboot posts to a different
> log
> > >> file, we
> > >> > > > can keep part of the dbus/signal watcher.
> > >> > > >
> > >> > > > On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com
> >
> > >> wrote:
> > >> > > >
> > >> > > > > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <
> > >> artemsen@gmail.com>
> > >> > > > > wrote:
> > >> > > > > >
> > >> > > > > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > >> > > > > > > Hi all,
> > >> > > > > > >
> > >> > > > > > > In the previous thread (
> > >> > > > > > >
> > >> https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html),
> we
> > >> > > > > > > (engineers from Google and Quanta) discussed our attempt
> to
> > >> share host
> > >> > > > > > > serial logs via Redfish, which includes polling logs via
> > >> LogService and
> > >> > > > > > > streaming log bytes via EventService (e.g. SSE). We went
> with
> > >> the
> > >> > > > > event log
> > >> > > > > > > architecture
> > >> > > > > > > <
> > >> > > > >
> > >>
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> > >> > > > > >
> > >> > > > > > > and did the implementation.
> > >> > > > > > >
> > >> > > > > > > We still want to reuse the phosphor-hostlogger and do some
> > >> > > > > modification. We
> > >> > > > > > > believe it is better to try to reuse existing codes if
> > >> possible and
> > >> > > > > improve
> > >> > > > > > > them rather than creating new things that have similar
> > >> functionalities
> > >> > > > > (in
> > >> > > > > > > our case, it is a daemon that could collect logs and
> persist
> > >> them).
> > >> > > > > >
> > >> > > > > > I agree, reusing code is a right choice, but only when it is
> > >> really
> > >> > > > > possible.
> > >> > > > > > For now it looks like you want to remove most of the
> Hostlogger
> > >> features
> > >> > > > > to
> > >> > > > > > transform it from buffer-like to stream-like service.
> > >> > > > >
> > >> > > > > I'm not quite following this statement.  Which features are
> > >> getting
> > >> > > > > removed?  From what I can see, he's suggesting making
> > >> > > > > phosphor-hostlogger look more like a well-behaved linux
> logging
> > >> > > > > daemon, but I don't think any features got omitted (or I'm
> missing
> > >> > > > > something critical).
> > >> > > > >
> > >> > > > > >
> > >> > > > > > > We want to do the following modification in
> > >> phosphor-hostlogger (from
> > >> > > > > the
> > >> > > > > > > input and output point of view, just very few things will
> be
> > >> changed)
> > >> > > > > > >
> > >> > > > > > > 1. One limitation of phosphor-hostlogger is that it will
> lose
> > >> data in
> > >> > > > > the
> > >> > > > > > > memory (the ring buffer maintained by hostlogger) when BMC
> > >> gets force
> > >> > > > > > > restarted;
> > >> > > > > >
> > >> > > > > > When BMC goes to reboot it stops all services, at that
> moment
> > >> hostlogger
> > >> > > > > gets
> > >> > > > > > a signal and flushes all gathered logs to a file.
> > >> > > > >
> > >> > > > > Only if the reboot is planned.  If the BMC loses power (which
> is
> > >> > > > > "normal" for a bmc) there isn't time to persist to flash
> before
> > >> the
> > >> > > > > power goes down and the logs are most likely lost.
> > >> > > > >
> > >> > > > > >
> > >> > > > > > > we propose to remove the ring buffer and write to the log
> file
> > >> > > > > > > as soon as some characters are received.
> > >> > > > > >
> > >> > > > > > I am not sure it is a good idea.
> > >> > > > > > The host can generate a lot of logs, but we have very
> limited
> > >> free space.
> > >> > > > >
> > >> > > > > This is a fair concern, but wouldn't the rollover limits make
> > >> this not
> > >> > > > > an issue?  They seem like they could be easily configured.
> > >> > > > >
> > >> > > > > > In
> > >> > > > > > addition, such heavy traffic will lead to a quick breakdown
> of
> > >> the flash
> > >> > > > > (most
> > >> > > > > > available products are guaranteed to withstand around
> 100,000
> > >> P/E cycles
> > >> > > > > only).
> > >> > > > >
> > >> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I
> know
> > >> of
> > >> > > > > that implement this without any ill effects to flash
> longevity,
> > >> with
> > >> > > > > that said, if Nan made the "last log on disk" feature
> > >> configurable,
> > >> > > > > would that alleviate your concerns?
> > >> > > > >
> > >> > > > > >
> > >> > > > > > > This implicitly removes the needs
> > >> > > > > > > of the ring buffer, and the persistence triggering (host
> > >> reboot,
> > >> > > > > sigterm,
> > >> > > > > > > etc) in hostlogger. We believe this keeps the same
> > >> functionality but
> > >> > > > > saves
> > >> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > >> > > > >
> > >> > > > > Difference of opinion here, I don't think this removes the
> need
> > >> for
> > >> > > > > the host reboot event;  Having each reboot post to a
> different log
> > >> > > > > needs to be maintained, and I have to imagine that there's
> some
> > >> sort
> > >> > > > > of sigterm handler still, although it becomes a lot smaller.
> > >> > > > >
> > >> > > > > >
> > >> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> > >> rotate. How
> > >> > > > > are you
> > >> > > > > > going to keep the same functionality if you remove
> everything
> > >> related to
> > >> > > > > it?
> > >> > > > >
> > >> > > > > +1.  In the initial thought I didn't think we were removing
> any
> > >> > > > > functionality with this.  I had assumed the dbus watcher would
> > >> remain,
> > >> > > > > and we would still have the log rotation behavior.  In reading
> > >> through
> > >> > > > > Nans proposal I don't think these are getting removed;  Maybe
> I
> > >> > > > > misunderstood?
> > >> > > > >
> > >> > > > > >
> > >> > > > > > > 2. We propose not to compress the latest log file. This
> saves
> > >> us the
> > >> > > > > > > overhead of doing decompression when BMCWeb just needs to
> > >> retrieve the
> > >> > > > > most
> > >> > > > > > > recent logs. There are still going to be log rotations in
> the
> > >> file
> > >> > > > > level.
> > >> > > > > > > Files other than the latest log file are still going to be
> > >> compressed.
> > >> > > > > We
> > >> > > > > > > can modify existing codes to achieve this or use the linux
> > >> logrotate
> > >> > > > > > > directly.
> > >> > > > > > >
> > >> > > > > > > Furthermore, we will add host serial logs into BMCWeb,
> both
> > >> LogService
> > >> > > > > and
> > >> > > > > > > EventService. In LogService, we will teach BMCWeb how to
> read
> > >> the
> > >> > > > > latest
> > >> > > > > > > log file that is not compressed and the other compressed
> old
> > >> logs, and
> > >> > > > > how
> > >> > > > > > > to assemble LogEntries out of raw serial logs. We will
> discuss
> > >> > > > > EventService
> > >> > > > > > > in future threads but the very initial idea is to setup
> > >> inotify on log
> > >> > > > > > > files and SSE to stream out new bytes to clients (like
> what
> > >> the
> > >> > > > > existing
> > >> > > > > > > event logging is doing).
> > >> > > > > > >
> > >> > > > > > > As we said above, for phosphor-hostlogger, the input is
> still
> > >> the
> > >> > > > > > > obmc-server unix socket, and the output are still
> persisted
> > >> log files.
> > >> > > > > But
> > >> > > > > > > the functionality will get improved (less data loss), code
> > >> gets
> > >> > > > > simplified
> > >> > > > > > > (no ring buffer and persistence triggering), and it will
> > >> become easier
> > >> > > > > and
> > >> > > > > > > more performant to get BMCWeb hooked up for log streaming
> via
> > >> Redfish.
> > >> > > > > > >
> > >> > > > > > > Please let us know what you think. We appreciate any
> > >> feedback. Thank
> > >> > > > > you
> > >> > > > > > > very much!
> > >> > > > > > >
> > >> > > > > > > Sincerely,
> > >> > > > > > > Nan
> > >> > > > > >
> > >> > > > > > --
> > >> > > > > > Regards,
> > >> > > > > > Artem Senichev
> > >> > > > > > Software Engineer, YADRO.
> > >> > > > >
> > >>
> > >
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>

--00000000000009776e05c3361428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span class=3D"gmail-im" style=3D"color:rgb(80,0,=
80)">&gt; 1. log_buffer.xpp:<br></span><span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">&gt; will be removed; we propose to persist a chunk into =
the log file as soon as<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; we receive it; newline will be logged as is, so logs are =
still splitted by<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,=
0,80)">&gt; newlines;</span><span class=3D"gmail-im" style=3D"color:rgb(80,=
0,80)"><br></span>If you remove the newline handler we will lose the timest=
amps added for each<br>line.</blockquote><div>Good catch. If timestamps are=
 necessary (it is necessary for the Redfish LogEntry), I think we can keep =
the current newline detection logic in log_buffer.xpp. Once a new line is d=
etected, we append the current timestamp first, and then append the bytes c=
hunk.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; we can potentia=
lly set the maximum length of a log as well (force<br></span><span class=3D=
"gmail-im" style=3D"color:rgb(80,0,80)">&gt; split a long line into smaller=
 lines)</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></s=
pan>I would leave the host output &quot;as is&quot;. I don&#39;t think we s=
hould modify it.</blockquote><div>OK. We have concerns about edge cases whe=
re a log line is too long.=C2=A0=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; 2. host_console.xpp: stay unchanged;<br></span><span clas=
s=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"g=
mail-im" style=3D"color:rgb(80,0,80)">&gt; 3. zlib_file.xpp, zlib_exception=
.xpp:<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; =
will be removed or slightly changed; we can potentially use the linux<br></=
span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; logrotate w=
hich has built-in compression and file rotation (in this case<br></span><sp=
an class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; these compression u=
tilities will be removed).<br></span><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80)">&gt; The latest log file isn&#39;t compressed any more. His=
tory log files are still<br></span><span class=3D"gmail-im" style=3D"color:=
rgb(80,0,80)">&gt; compressed.</span><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80)"><br></span>Just curious, how are you going to remove the ol=
dest messages from the latest<br>file in runtime? You are not going to rewr=
ite the entire file on every input<br>character, are you?</blockquote><div>=
The=C2=A0following is my current idea: we will rename the latest file to so=
mething else and notify the writer (hostlogger) to close its old file descr=
iptor and open a new one (should be doable via linux logrotate and inotify =
or some signal handlers, as logrotate is able to send some signals to hostl=
ogger if a rotation is performed). The writer keeps appending logs most of =
the time using the same fd unless the latest file is rotated. This should b=
e better=C2=A0than truncating the file where the reader (BMCWeb) won&#39;t =
have race conditions (it might read old snapshots but it is not a big=C2=A0=
deal in our case).=C2=A0</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&=
gt; We need to implement some codes to deal with the race condition in log<=
br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; rotati=
ons (we should reopen the writing fd after the latest log file is<br></span=
><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; renamed; inotif=
y might do the trick).<br></span><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)">&gt; We might also need to rotate according to host boot cycles=
 (like what<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"=
>&gt; postcodes are doing right now).<br></span><span class=3D"gmail-im" st=
yle=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D=
"color:rgb(80,0,80)">&gt; 3. dbus_loop.xpp: stay unchanged;<br></span><span=
 class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; 4. service.xpp:<br></span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; will be slightly =
changed; socket IO callback and host state watcher are<br></span><span clas=
s=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; kept; manual flash or flas=
h upon service restart will be removed</span><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)"><br></span>The manual flush is used in the dreport,=
 please don&#39;t forget to remove that<br>call there.</blockquote><div>Tha=
nks for the information.</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">=C2=A0<span style=3D"color:rgb(80,0,80)">&gt; 5. config=
.xpp:<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; =
will be slightly changed; options for flash policy will be removed;</span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>Not slightl=
y =3D)<br>Most options are related to the buffer and flush policies.<br>As =
I can see, there will stay the socket Id and output directory only.</blockq=
uote><div>Yes. I would assume the host state policy will stay as well.</div=
><div><br></div><div>How do you like=C2=A0the proposal now? I hope we make =
it more clear. Do you think it is a good direction that we can go with?=C2=
=A0 =C2=A0=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, May 25, 2021 at 11:11 PM Artem Senichev &lt;<=
a href=3D"mailto:artemsen@gmail.com">artemsen@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, May 25, 2021=
 at 10:29:48PM -0700, Nan Zhou wrote:<br>
&gt; Hi Artem,<br>
&gt; <br>
&gt; I listed the potential changes below (to the best of my understand of<=
br>
&gt; phosphor-hostlogger),<br>
&gt; <br>
&gt; 1. log_buffer.xpp:<br>
&gt; will be removed; we propose to persist a chunk into the log file as so=
on as<br>
&gt; we receive it; newline will be logged as is, so logs are still splitte=
d by<br>
&gt; newlines;<br>
<br>
If you remove the newline handler we will lose the timestamps added for eac=
h<br>
line.<br>
<br>
&gt; we can potentially set the maximum length of a log as well (force<br>
&gt; split a long line into smaller lines)<br>
<br>
I would leave the host output &quot;as is&quot;. I don&#39;t think we shoul=
d modify it.<br>
<br>
&gt; 2. host_console.xpp: stay unchanged;<br>
&gt; <br>
&gt; 3. zlib_file.xpp, zlib_exception.xpp:<br>
&gt; will be removed or slightly changed; we can potentially use the linux<=
br>
&gt; logrotate which has built-in compression and file rotation (in this ca=
se<br>
&gt; these compression utilities will be removed).<br>
&gt; The latest log file isn&#39;t compressed any more. History log files a=
re still<br>
&gt; compressed.<br>
<br>
Just curious, how are you going to remove the oldest messages from the late=
st<br>
file in runtime? You are not going to rewrite the entire file on every inpu=
t<br>
character, are you?<br>
<br>
&gt; We need to implement some codes to deal with the race condition in log=
<br>
&gt; rotations (we should reopen the writing fd after the latest log file i=
s<br>
&gt; renamed; inotify might do the trick).<br>
&gt; We might also need to rotate according to host boot cycles (like what<=
br>
&gt; postcodes are doing right now).<br>
&gt;<br>
&gt; 3. dbus_loop.xpp: stay unchanged;<br>
&gt; <br>
&gt; 4. service.xpp:<br>
&gt; will be slightly changed; socket IO callback and host state watcher ar=
e<br>
&gt; kept; manual flash or flash upon service restart will be removed<br>
<br>
The manual flush is used in the dreport, please don&#39;t forget to remove =
that<br>
call there.<br>
<br>
&gt; 5. config.xpp:<br>
&gt; will be slightly changed; options for flash policy will be removed;<br=
>
<br>
Not slightly =3D)<br>
Most options are related to the buffer and flush policies.<br>
As I can see, there will stay the socket Id and output directory only.<br>
<br>
&gt; We might split the implementation into several phases. We might not ju=
mp to<br>
&gt; the final version at one iteration. But the above are what we eventual=
ly<br>
&gt; want at this moment.<br>
&gt; <br>
&gt; On Tue, May 25, 2021 at 8:03 AM Nan Zhou &lt;<a href=3D"mailto:nanzhou=
@google.com" target=3D"_blank">nanzhou@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; &quot;we propose to remove the ring buffer and write to the log f=
ile as soon<br>
&gt; &gt;&gt; as some characters are received. This implicitly removes the =
needs of<br>
&gt; &gt;&gt; the ring buffer, and the persistence triggering (host reboot,=
 sigterm,<br>
&gt; &gt;&gt; etc) in hostlogger&quot;<br>
&gt; &gt;&gt; I would like to get a more detailed description of further ch=
anges in<br>
&gt; &gt;&gt; order<br>
&gt; &gt;&gt; to see the whole picture of the solution.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Originally I didn&#39;t consider including changing the log=
 file according to<br>
&gt; &gt; the boot cycle; we will keep part of the dbus/signal watcher to m=
ake that<br>
&gt; &gt; different reboot posts to a different log file.<br>
&gt; &gt;<br>
&gt; &gt; We will work out some more detailed descriptions for future chang=
es soon.<br>
&gt; &gt;<br>
&gt; &gt; On Mon, May 24, 2021 at 11:41 PM Artem Senichev &lt;<a href=3D"ma=
ilto:artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Sorry guys, maybe this is a misunderstanding on my part.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I was confused with the following line in the proposal:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &quot;we propose to remove the ring buffer and write to the l=
og file as soon<br>
&gt; &gt;&gt; as some characters are received. This implicitly removes the =
needs of<br>
&gt; &gt;&gt; the ring buffer, and the persistence triggering (host reboot,=
 sigterm,<br>
&gt; &gt;&gt; etc) in hostlogger&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I would like to get a more detailed description of further ch=
anges in<br>
&gt; &gt;&gt; order<br>
&gt; &gt;&gt; to see the whole picture of the solution.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Regards,<br>
&gt; &gt;&gt; Artem Senichev<br>
&gt; &gt;&gt; Software Engineer, YADRO.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:<br=
>
&gt; &gt;&gt; &gt; On Mon, May 24, 2021 at 12:52 AM Artem Senichev &lt;<a h=
ref=3D"mailto:artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&=
gt;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; I&#39;ll try to convey the main idea that we tried =
to implement in this<br>
&gt; &gt;&gt; service.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Hostlogger was originally designed to work with Ope=
nPOWER systems,<br>
&gt; &gt;&gt; which<br>
&gt; &gt;&gt; &gt; &gt; generate a very detailed log at boot time.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; There are definitely other non OpenPOWER systems that ha=
ve this same<br>
&gt; &gt;&gt; behavior.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; It is important to save these logs and the host con=
sole output just<br>
&gt; &gt;&gt; before<br>
&gt; &gt;&gt; &gt; &gt; rebooting for further investigation of incidents wh=
en hardware errors<br>
&gt; &gt;&gt; occur.<br>
&gt; &gt;&gt; &gt; &gt; So, we have two log files for each server session (=
boot log + last OS<br>
&gt; &gt;&gt; messages).<br>
&gt; &gt;&gt; &gt; &gt; That&#39;s why we need a D-bus watcher.<br>
&gt; &gt;&gt; &gt; &gt; BMC flash has around 3MiB of free RW space, this fo=
rce us to use<br>
&gt; &gt;&gt; compression<br>
&gt; &gt;&gt; &gt; &gt; and file rotation.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; All of these features are unnecessary for &quot;str=
eaming&quot; real-time log<br>
&gt; &gt;&gt; recording.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I disagree with you there.=C2=A0 Rotation and compressio=
n are still useful<br>
&gt; &gt;&gt; &gt; in a &quot;streaming&quot; case.=C2=A0 Because of the wa=
ys the APIs are defined,<br>
&gt; &gt;&gt; &gt; LogService in redfish provides both a &quot;historical&q=
uot; version of past<br>
&gt; &gt;&gt; &gt; logs.=C2=A0 It&#39;s useful to have those logs rotated a=
nd compressed.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; You don&#39;t need DBus watchers, rotation can be d=
one with native Linux<br>
&gt; &gt;&gt; utilities,<br>
&gt; &gt;&gt; &gt; &gt; you don&#39;t even need to split the input stream i=
nto lines.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I&#39;m not following why those now wouldn&#39;t be need=
ed.=C2=A0 Redfish LogEntry<br>
&gt; &gt;&gt; &gt; would separate per line, so we&#39;d have to do the spli=
tting somewhere.<br>
&gt; &gt;&gt; &gt; There&#39;s already code to do that in hostlogger.=C2=A0=
 Wouldn&#39;t you still<br>
&gt; &gt;&gt; &gt; want to separate log per boot, and have lines split betw=
een log files?<br>
&gt; &gt;&gt; &gt;=C2=A0 I&#39;m not following why those would go away just=
 because there&#39;s a<br>
&gt; &gt;&gt; &gt; desire to poll for logs and get up to date information.<=
br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Just redirect obmc-console.log: `tail -f /var/log/o=
bmc-console.log &gt;<br>
&gt; &gt;&gt; my.log`.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; This doesn&#39;t solve the problem presented.=C2=A0 Firs=
t of all, log rotation<br>
&gt; &gt;&gt; &gt; and compression are still needed.=C2=A0 Also, it&#39;s d=
esirable to have dbus<br>
&gt; &gt;&gt; &gt; watchers and separate the logs per boot, such that they =
can end up<br>
&gt; &gt;&gt; &gt; separated in the Redfish API.=C2=A0 Also, in what you pr=
esented, my.log<br>
&gt; &gt;&gt; &gt; would quickly and easily overflow the available space, a=
s there&#39;s no<br>
&gt; &gt;&gt; &gt; log rotation.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; I understand your desire to add a new mode to the e=
xisting project<br>
&gt; &gt;&gt; instead of<br>
&gt; &gt;&gt; &gt; &gt; creating a new one. But there is very little in com=
mon between these<br>
&gt; &gt;&gt; modes.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I&#39;m not following how they&#39;re all that different=
, see above about<br>
&gt; &gt;&gt; &gt; needing very similar features.=C2=A0 For the sake of arg=
ument, lets say we<br>
&gt; &gt;&gt; &gt; went with a totally different implementation, would it b=
e able to live<br>
&gt; &gt;&gt; &gt; in the hostlogger repo to be able to reuse code where ne=
eded?=C2=A0 There&#39;s<br>
&gt; &gt;&gt; &gt; a lot of code that I suspect will be identical.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Even reading the socket will have to be done separa=
tely, since it is<br>
&gt; &gt;&gt; buffered<br>
&gt; &gt;&gt; &gt; &gt; for line splitting in the current implementation.<b=
r>
&gt; &gt;&gt; &gt; &gt; In the end, only bb-recipe and the `main` function =
will remain in the<br>
&gt; &gt;&gt; common.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; --<br>
&gt; &gt;&gt; &gt; &gt; Regards,<br>
&gt; &gt;&gt; &gt; &gt; Artem Senichev<br>
&gt; &gt;&gt; &gt; &gt; Software Engineer, YADRO.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou =
wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; we propose to remove the ring b=
uffer and write to the log file<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; as soon as some characters are =
received.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; I am not sure it is a good idea.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; The host can generate a lot of logs,=
 but we have very limited<br>
&gt; &gt;&gt; free space.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; This is a fair concern, but wouldn&#39;t =
the rollover limits make<br>
&gt; &gt;&gt; this not<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; an issue?=C2=A0 They seem like they could=
 be easily configured.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Right. Logrotate will be able to handle the ro=
tation. Maximum size,<br>
&gt; &gt;&gt; # log<br>
&gt; &gt;&gt; &gt; &gt; &gt; files, and compression can be easily configure=
d.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; In<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; addition, such heavy traffic will le=
ad to a quick breakdown of<br>
&gt; &gt;&gt; the flash<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; (most<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; available products are guaranteed to=
 withstand around 100,000<br>
&gt; &gt;&gt; P/E cycles<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; only).<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; JFFS2 is wear leveled, and there are othe=
r BMC stacks that I know<br>
&gt; &gt;&gt; of<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; that implement this without any ill effec=
ts to flash longevity,<br>
&gt; &gt;&gt; with<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; that said, if Nan made the &quot;last log=
 on disk&quot; feature<br>
&gt; &gt;&gt; configurable,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; would that alleviate your concerns?<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; We also noticed that the obmc-server itself wi=
ll buffer the log a<br>
&gt; &gt;&gt; bit. Will<br>
&gt; &gt;&gt; &gt; &gt; &gt; it still be a problem if we don&#39;t write a =
character at once but a<br>
&gt; &gt;&gt; block of<br>
&gt; &gt;&gt; &gt; &gt; &gt; them?<br>
&gt; &gt;&gt; &gt; &gt; &gt; And as Ed said, we can also make this feature =
configurable. I would<br>
&gt; &gt;&gt; imagine<br>
&gt; &gt;&gt; &gt; &gt; &gt; the log buffer will remain if the &quot;last l=
og on disk&quot; feature is<br>
&gt; &gt;&gt; disabled.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; This implicitly removes the nee=
ds<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; of the ring buffer, and the per=
sistence triggering (host<br>
&gt; &gt;&gt; reboot,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; sigterm,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; etc) in hostlogger. We believe =
this keeps the same<br>
&gt; &gt;&gt; functionality but<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; saves<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; hundreds of lines of codes in p=
hosphor-hostlogger.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; Difference of opinion here, I don&#39;t t=
hink this removes the need<br>
&gt; &gt;&gt; for<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; the host reboot event;=C2=A0 Having each =
reboot post to a different log<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; needs to be maintained, and I have to ima=
gine that there&#39;s some<br>
&gt; &gt;&gt; sort<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; of sigterm handler still, although it bec=
omes a lot smaller.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; You are suggesting to delete the buf=
fer, DBus watcher, log<br>
&gt; &gt;&gt; rotate. How<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; are you<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; going to keep the same functionality=
 if you remove everything<br>
&gt; &gt;&gt; related to<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; it?<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; +1.=C2=A0 In the initial thought I didn&#=
39;t think we were removing any<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; functionality with this.=C2=A0 I had assu=
med the dbus watcher would<br>
&gt; &gt;&gt; remain,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; and we would still have the log rotation =
behavior.=C2=A0 In reading<br>
&gt; &gt;&gt; through<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; Nans proposal I don&#39;t think these are=
 getting removed;=C2=A0 Maybe I<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; misunderstood?<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Yes, if we want to keep different reboot posts=
 to a different log<br>
&gt; &gt;&gt; file, we<br>
&gt; &gt;&gt; &gt; &gt; &gt; can keep part of the dbus/signal watcher.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; On Fri, May 21, 2021 at 10:24 AM Ed Tanous &lt=
;<a href=3D"mailto:edtanous@google.com" target=3D"_blank">edtanous@google.c=
om</a>&gt;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; On Thu, May 20, 2021 at 11:10 PM Artem Se=
nichev &lt;<br>
&gt; &gt;&gt; <a href=3D"mailto:artemsen@gmail.com" target=3D"_blank">artem=
sen@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; On Thu, May 20, 2021 at 04:29:09PM -=
0700, Nan Zhou wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi all,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; In the previous thread (<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-Ma=
rch/025234.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.=
org/pipermail/openbmc/2021-March/025234.html</a>), we<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; (engineers from Google and Quan=
ta) discussed our attempt to<br>
&gt; &gt;&gt; share host<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; serial logs via Redfish, which =
includes polling logs via<br>
&gt; &gt;&gt; LogService and<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; streaming log bytes via EventSe=
rvice (e.g. SSE). We went with<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; event log<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; architecture<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/archit=
ecture/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-=
bmcweb.md</a><br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; and did the implementation.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; We still want to reuse the phos=
phor-hostlogger and do some<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; modification. We<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; believe it is better to try to =
reuse existing codes if<br>
&gt; &gt;&gt; possible and<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; improve<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; them rather than creating new t=
hings that have similar<br>
&gt; &gt;&gt; functionalities<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; (in<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; our case, it is a daemon that c=
ould collect logs and persist<br>
&gt; &gt;&gt; them).<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; I agree, reusing code is a right cho=
ice, but only when it is<br>
&gt; &gt;&gt; really<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; possible.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; For now it looks like you want to re=
move most of the Hostlogger<br>
&gt; &gt;&gt; features<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; transform it from buffer-like to str=
eam-like service.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; I&#39;m not quite following this statemen=
t.=C2=A0 Which features are<br>
&gt; &gt;&gt; getting<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; removed?=C2=A0 From what I can see, he&#3=
9;s suggesting making<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; phosphor-hostlogger look more like a well=
-behaved linux logging<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; daemon, but I don&#39;t think any feature=
s got omitted (or I&#39;m missing<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; something critical).<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; We want to do the following mod=
ification in<br>
&gt; &gt;&gt; phosphor-hostlogger (from<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; input and output point of view,=
 just very few things will be<br>
&gt; &gt;&gt; changed)<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; 1. One limitation of phosphor-h=
ostlogger is that it will lose<br>
&gt; &gt;&gt; data in<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; memory (the ring buffer maintai=
ned by hostlogger) when BMC<br>
&gt; &gt;&gt; gets force<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; restarted;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; When BMC goes to reboot it stops all=
 services, at that moment<br>
&gt; &gt;&gt; hostlogger<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; gets<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; a signal and flushes all gathered lo=
gs to a file.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; Only if the reboot is planned.=C2=A0 If t=
he BMC loses power (which is<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &quot;normal&quot; for a bmc) there isn&#=
39;t time to persist to flash before<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; power goes down and the logs are most lik=
ely lost.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; we propose to remove the ring b=
uffer and write to the log file<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; as soon as some characters are =
received.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; I am not sure it is a good idea.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; The host can generate a lot of logs,=
 but we have very limited<br>
&gt; &gt;&gt; free space.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; This is a fair concern, but wouldn&#39;t =
the rollover limits make<br>
&gt; &gt;&gt; this not<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; an issue?=C2=A0 They seem like they could=
 be easily configured.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; In<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; addition, such heavy traffic will le=
ad to a quick breakdown of<br>
&gt; &gt;&gt; the flash<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; (most<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; available products are guaranteed to=
 withstand around 100,000<br>
&gt; &gt;&gt; P/E cycles<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; only).<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; JFFS2 is wear leveled, and there are othe=
r BMC stacks that I know<br>
&gt; &gt;&gt; of<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; that implement this without any ill effec=
ts to flash longevity,<br>
&gt; &gt;&gt; with<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; that said, if Nan made the &quot;last log=
 on disk&quot; feature<br>
&gt; &gt;&gt; configurable,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; would that alleviate your concerns?<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; This implicitly removes the nee=
ds<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; of the ring buffer, and the per=
sistence triggering (host<br>
&gt; &gt;&gt; reboot,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; sigterm,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; etc) in hostlogger. We believe =
this keeps the same<br>
&gt; &gt;&gt; functionality but<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; saves<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; hundreds of lines of codes in p=
hosphor-hostlogger.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; Difference of opinion here, I don&#39;t t=
hink this removes the need<br>
&gt; &gt;&gt; for<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; the host reboot event;=C2=A0 Having each =
reboot post to a different log<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; needs to be maintained, and I have to ima=
gine that there&#39;s some<br>
&gt; &gt;&gt; sort<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; of sigterm handler still, although it bec=
omes a lot smaller.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; You are suggesting to delete the buf=
fer, DBus watcher, log<br>
&gt; &gt;&gt; rotate. How<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; are you<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; going to keep the same functionality=
 if you remove everything<br>
&gt; &gt;&gt; related to<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; it?<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; +1.=C2=A0 In the initial thought I didn&#=
39;t think we were removing any<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; functionality with this.=C2=A0 I had assu=
med the dbus watcher would<br>
&gt; &gt;&gt; remain,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; and we would still have the log rotation =
behavior.=C2=A0 In reading<br>
&gt; &gt;&gt; through<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; Nans proposal I don&#39;t think these are=
 getting removed;=C2=A0 Maybe I<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; misunderstood?<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; 2. We propose not to compress t=
he latest log file. This saves<br>
&gt; &gt;&gt; us the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; overhead of doing decompression=
 when BMCWeb just needs to<br>
&gt; &gt;&gt; retrieve the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; most<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; recent logs. There are still go=
ing to be log rotations in the<br>
&gt; &gt;&gt; file<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; level.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Files other than the latest log=
 file are still going to be<br>
&gt; &gt;&gt; compressed.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; We<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; can modify existing codes to ac=
hieve this or use the linux<br>
&gt; &gt;&gt; logrotate<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; directly.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Furthermore, we will add host s=
erial logs into BMCWeb, both<br>
&gt; &gt;&gt; LogService<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; EventService. In LogService, we=
 will teach BMCWeb how to read<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; latest<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; log file that is not compressed=
 and the other compressed old<br>
&gt; &gt;&gt; logs, and<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; how<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; to assemble LogEntries out of r=
aw serial logs. We will discuss<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; EventService<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; in future threads but the very =
initial idea is to setup<br>
&gt; &gt;&gt; inotify on log<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; files and SSE to stream out new=
 bytes to clients (like what<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; existing<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; event logging is doing).<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; As we said above, for phosphor-=
hostlogger, the input is still<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; obmc-server unix socket, and th=
e output are still persisted<br>
&gt; &gt;&gt; log files.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; But<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; the functionality will get impr=
oved (less data loss), code<br>
&gt; &gt;&gt; gets<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; simplified<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; (no ring buffer and persistence=
 triggering), and it will<br>
&gt; &gt;&gt; become easier<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; more performant to get BMCWeb h=
ooked up for log streaming via<br>
&gt; &gt;&gt; Redfish.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Please let us know what you thi=
nk. We appreciate any<br>
&gt; &gt;&gt; feedback. Thank<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; you<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; very much!<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Sincerely,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Nan<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Artem Senichev<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Software Engineer, YADRO.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
<br>
-- <br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
</blockquote></div></div>

--00000000000009776e05c3361428--
