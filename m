Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4C390488
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 17:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqHRG0D33z306P
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 01:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=GtWuE+w2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GtWuE+w2; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqHQz0GW6z2yYc
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 01:03:52 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id l16so10614953ybf.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ygVCrCon3pnlBRIBzQ3CSkuuSfVmn+u4SxrMiLoLsQ=;
 b=GtWuE+w2V7HTaqmkEC2qqvHk3yE+No0+d3+VoS6t10BT837RNQDC+6nCr35V/52dB/
 PFS4eiR+weWdCHe75SBCEunOhx5rtZsoHnNVux7ItkPSvkJ4z+Bjfrl0v4NYYEHdQ+Ow
 P2QDf9QVHej2MWTAGqJ1RpYpNlCgvx3ozRerz6Z1kR6uSNVrnL8qRCcaFbSA12BXB/zt
 PVxHKQm568hpa8RM2atJak23HhE0un6TQB7LPBdkcyxYgGpyU/uwVDuTHAEE/FWLDNvn
 Rwv0q3vOwZ6EndZh9sw8duJAU473iLAnPeqCEHn0EY2RoqCfose5GWuPLxFdIDzUbJLr
 3D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ygVCrCon3pnlBRIBzQ3CSkuuSfVmn+u4SxrMiLoLsQ=;
 b=K++l8Ffk3dvcwE5tHqPvAhok0XbhzhmrfAc2YywJfVWdf35zr782kN/esRaKz+HSYr
 KbTyX1+onjWYwt31JDNc8+LLz9mQFYato3ZxmlCvg1EmqPxvYzCunMXrlu7nqTqsAD8Y
 Q40Ka+U9t3OE+4BPa5Z55m4d7dGDoYvUHuGbITyW2A43cIp9d+TLerY3Jhrw+tNyd+G7
 R7pkHx8h7nd2j/f3tA6kPNGUCm3WDnwzTIzDELkH7jaW6yVCIDHV2dVEoFinP0h2c+Ri
 hX5kko06saDww3m/VeQc1d5tvSJKz9F6ySwwL1n3316yEs+aivtSlugJbXMAicJ9u68b
 rncg==
X-Gm-Message-State: AOAM531S53tdON97B1v02LMmcBTj91yLbCHGR/6Wfb0pmRZlaqxwEdPl
 KSZix2WLFeZJoLQDmDqgbrjj0LcZz9T+tDEUX/lCYw==
X-Google-Smtp-Source: ABdhPJy87IVssKOazMXRbJc6SaSUflosZTBhfjD8DuHJaB0Lu5rhFw0Dmk1GeNri88ppAEmXpfl9Q5MjWbcnHsWLrpc=
X-Received: by 2002:a25:6c85:: with SMTP id
 h127mr41343632ybc.460.1621955028861; 
 Tue, 25 May 2021 08:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
In-Reply-To: <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Tue, 25 May 2021 08:03:38 -0700
Message-ID: <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000056cef305c328d5d3"
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

--00000000000056cef305c328d5d3
Content-Type: text/plain; charset="UTF-8"

>
> "we propose to remove the ring buffer and write to the log file as soon
> as some characters are received. This implicitly removes the needs of
> the ring buffer, and the persistence triggering (host reboot, sigterm,
> etc) in hostlogger"
> I would like to get a more detailed description of further changes in order
> to see the whole picture of the solution.

 Originally I didn't consider including changing the log file according to
the boot cycle; we will keep part of the dbus/signal watcher to make that
different reboot posts to a different log file.

We will work out some more detailed descriptions for future changes soon.

On Mon, May 24, 2021 at 11:41 PM Artem Senichev <artemsen@gmail.com> wrote:

> Sorry guys, maybe this is a misunderstanding on my part.
>
> I was confused with the following line in the proposal:
>
> "we propose to remove the ring buffer and write to the log file as soon
> as some characters are received. This implicitly removes the needs of
> the ring buffer, and the persistence triggering (host reboot, sigterm,
> etc) in hostlogger"
>
> I would like to get a more detailed description of further changes in order
> to see the whole picture of the solution.
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>
>
> On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:
> > On Mon, May 24, 2021 at 12:52 AM Artem Senichev <artemsen@gmail.com>
> wrote:
> > >
> > > I'll try to convey the main idea that we tried to implement in this
> service.
> > >
> > > Hostlogger was originally designed to work with OpenPOWER systems,
> which
> > > generate a very detailed log at boot time.
> >
> > There are definitely other non OpenPOWER systems that have this same
> behavior.
> >
> > > It is important to save these logs and the host console output just
> before
> > > rebooting for further investigation of incidents when hardware errors
> occur.
> > > So, we have two log files for each server session (boot log + last OS
> messages).
> > > That's why we need a D-bus watcher.
> > > BMC flash has around 3MiB of free RW space, this force us to use
> compression
> > > and file rotation.
> > >
> > > All of these features are unnecessary for "streaming" real-time log
> recording.
> >
> > I disagree with you there.  Rotation and compression are still useful
> > in a "streaming" case.  Because of the ways the APIs are defined,
> > LogService in redfish provides both a "historical" version of past
> > logs.  It's useful to have those logs rotated and compressed.
> >
> > > You don't need DBus watchers, rotation can be done with native Linux
> utilities,
> > > you don't even need to split the input stream into lines.
> >
> > I'm not following why those now wouldn't be needed.  Redfish LogEntry
> > would separate per line, so we'd have to do the splitting somewhere.
> > There's already code to do that in hostlogger.  Wouldn't you still
> > want to separate log per boot, and have lines split between log files?
> >  I'm not following why those would go away just because there's a
> > desire to poll for logs and get up to date information.
> >
> > > Just redirect obmc-console.log: `tail -f /var/log/obmc-console.log >
> my.log`.
> >
> > This doesn't solve the problem presented.  First of all, log rotation
> > and compression are still needed.  Also, it's desirable to have dbus
> > watchers and separate the logs per boot, such that they can end up
> > separated in the Redfish API.  Also, in what you presented, my.log
> > would quickly and easily overflow the available space, as there's no
> > log rotation.
> >
> > >
> > > I understand your desire to add a new mode to the existing project
> instead of
> > > creating a new one. But there is very little in common between these
> modes.
> >
> > I'm not following how they're all that different, see above about
> > needing very similar features.  For the sake of argument, lets say we
> > went with a totally different implementation, would it be able to live
> > in the hostlogger repo to be able to reuse code where needed?  There's
> > a lot of code that I suspect will be identical.
> >
> > > Even reading the socket will have to be done separately, since it is
> buffered
> > > for line splitting in the current implementation.
> > > In the end, only bb-recipe and the `main` function will remain in the
> common.
> > >
> > > --
> > > Regards,
> > > Artem Senichev
> > > Software Engineer, YADRO.
> > >
> > > On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:
> > >
> > > > >
> > > > > >
> > > > > > > we propose to remove the ring buffer and write to the log file
> > > > > > > as soon as some characters are received.
> > > > > >
> > > > > > I am not sure it is a good idea.
> > > > > > The host can generate a lot of logs, but we have very limited
> free space.
> > > > > This is a fair concern, but wouldn't the rollover limits make this
> not
> > > > > an issue?  They seem like they could be easily configured.
> > > >
> > > > Right. Logrotate will be able to handle the rotation. Maximum size,
> # log
> > > > files, and compression can be easily configured.
> > > >
> > > > > In
> > > > > > addition, such heavy traffic will lead to a quick breakdown of
> the flash
> > > > > (most
> > > > > > available products are guaranteed to withstand around 100,000
> P/E cycles
> > > > > only).
> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I know
> of
> > > > > that implement this without any ill effects to flash longevity,
> with
> > > > > that said, if Nan made the "last log on disk" feature configurable,
> > > > > would that alleviate your concerns?
> > > >
> > > > We also noticed that the obmc-server itself will buffer the log a
> bit. Will
> > > > it still be a problem if we don't write a character at once but a
> block of
> > > > them?
> > > > And as Ed said, we can also make this feature configurable. I would
> imagine
> > > > the log buffer will remain if the "last log on disk" feature is
> disabled.
> > > >
> > > >
> > > > > >
> > > > > > > This implicitly removes the needs
> > > > > > > of the ring buffer, and the persistence triggering (host
> reboot,
> > > > > sigterm,
> > > > > > > etc) in hostlogger. We believe this keeps the same
> functionality but
> > > > > saves
> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > > > > Difference of opinion here, I don't think this removes the need for
> > > > > the host reboot event;  Having each reboot post to a different log
> > > > > needs to be maintained, and I have to imagine that there's some
> sort
> > > > > of sigterm handler still, although it becomes a lot smaller.
> > > >
> > > >
> > > > >
> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> rotate. How
> > > > > are you
> > > > > > going to keep the same functionality if you remove everything
> related to
> > > > > it?
> > > > > +1.  In the initial thought I didn't think we were removing any
> > > > > functionality with this.  I had assumed the dbus watcher would
> remain,
> > > > > and we would still have the log rotation behavior.  In reading
> through
> > > > > Nans proposal I don't think these are getting removed;  Maybe I
> > > > > misunderstood?
> > > >
> > > >
> > > > Yes, if we want to keep different reboot posts to a different log
> file, we
> > > > can keep part of the dbus/signal watcher.
> > > >
> > > > On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com>
> wrote:
> > > >
> > > > > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <
> artemsen@gmail.com>
> > > > > wrote:
> > > > > >
> > > > > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > In the previous thread (
> > > > > > >
> https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > > > > > > (engineers from Google and Quanta) discussed our attempt to
> share host
> > > > > > > serial logs via Redfish, which includes polling logs via
> LogService and
> > > > > > > streaming log bytes via EventService (e.g. SSE). We went with
> the
> > > > > event log
> > > > > > > architecture
> > > > > > > <
> > > > >
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> > > > > >
> > > > > > > and did the implementation.
> > > > > > >
> > > > > > > We still want to reuse the phosphor-hostlogger and do some
> > > > > modification. We
> > > > > > > believe it is better to try to reuse existing codes if
> possible and
> > > > > improve
> > > > > > > them rather than creating new things that have similar
> functionalities
> > > > > (in
> > > > > > > our case, it is a daemon that could collect logs and persist
> them).
> > > > > >
> > > > > > I agree, reusing code is a right choice, but only when it is
> really
> > > > > possible.
> > > > > > For now it looks like you want to remove most of the Hostlogger
> features
> > > > > to
> > > > > > transform it from buffer-like to stream-like service.
> > > > >
> > > > > I'm not quite following this statement.  Which features are getting
> > > > > removed?  From what I can see, he's suggesting making
> > > > > phosphor-hostlogger look more like a well-behaved linux logging
> > > > > daemon, but I don't think any features got omitted (or I'm missing
> > > > > something critical).
> > > > >
> > > > > >
> > > > > > > We want to do the following modification in
> phosphor-hostlogger (from
> > > > > the
> > > > > > > input and output point of view, just very few things will be
> changed)
> > > > > > >
> > > > > > > 1. One limitation of phosphor-hostlogger is that it will lose
> data in
> > > > > the
> > > > > > > memory (the ring buffer maintained by hostlogger) when BMC
> gets force
> > > > > > > restarted;
> > > > > >
> > > > > > When BMC goes to reboot it stops all services, at that moment
> hostlogger
> > > > > gets
> > > > > > a signal and flushes all gathered logs to a file.
> > > > >
> > > > > Only if the reboot is planned.  If the BMC loses power (which is
> > > > > "normal" for a bmc) there isn't time to persist to flash before the
> > > > > power goes down and the logs are most likely lost.
> > > > >
> > > > > >
> > > > > > > we propose to remove the ring buffer and write to the log file
> > > > > > > as soon as some characters are received.
> > > > > >
> > > > > > I am not sure it is a good idea.
> > > > > > The host can generate a lot of logs, but we have very limited
> free space.
> > > > >
> > > > > This is a fair concern, but wouldn't the rollover limits make this
> not
> > > > > an issue?  They seem like they could be easily configured.
> > > > >
> > > > > > In
> > > > > > addition, such heavy traffic will lead to a quick breakdown of
> the flash
> > > > > (most
> > > > > > available products are guaranteed to withstand around 100,000
> P/E cycles
> > > > > only).
> > > > >
> > > > > JFFS2 is wear leveled, and there are other BMC stacks that I know
> of
> > > > > that implement this without any ill effects to flash longevity,
> with
> > > > > that said, if Nan made the "last log on disk" feature configurable,
> > > > > would that alleviate your concerns?
> > > > >
> > > > > >
> > > > > > > This implicitly removes the needs
> > > > > > > of the ring buffer, and the persistence triggering (host
> reboot,
> > > > > sigterm,
> > > > > > > etc) in hostlogger. We believe this keeps the same
> functionality but
> > > > > saves
> > > > > > > hundreds of lines of codes in phosphor-hostlogger.
> > > > >
> > > > > Difference of opinion here, I don't think this removes the need for
> > > > > the host reboot event;  Having each reboot post to a different log
> > > > > needs to be maintained, and I have to imagine that there's some
> sort
> > > > > of sigterm handler still, although it becomes a lot smaller.
> > > > >
> > > > > >
> > > > > > You are suggesting to delete the buffer, DBus watcher, log
> rotate. How
> > > > > are you
> > > > > > going to keep the same functionality if you remove everything
> related to
> > > > > it?
> > > > >
> > > > > +1.  In the initial thought I didn't think we were removing any
> > > > > functionality with this.  I had assumed the dbus watcher would
> remain,
> > > > > and we would still have the log rotation behavior.  In reading
> through
> > > > > Nans proposal I don't think these are getting removed;  Maybe I
> > > > > misunderstood?
> > > > >
> > > > > >
> > > > > > > 2. We propose not to compress the latest log file. This saves
> us the
> > > > > > > overhead of doing decompression when BMCWeb just needs to
> retrieve the
> > > > > most
> > > > > > > recent logs. There are still going to be log rotations in the
> file
> > > > > level.
> > > > > > > Files other than the latest log file are still going to be
> compressed.
> > > > > We
> > > > > > > can modify existing codes to achieve this or use the linux
> logrotate
> > > > > > > directly.
> > > > > > >
> > > > > > > Furthermore, we will add host serial logs into BMCWeb, both
> LogService
> > > > > and
> > > > > > > EventService. In LogService, we will teach BMCWeb how to read
> the
> > > > > latest
> > > > > > > log file that is not compressed and the other compressed old
> logs, and
> > > > > how
> > > > > > > to assemble LogEntries out of raw serial logs. We will discuss
> > > > > EventService
> > > > > > > in future threads but the very initial idea is to setup
> inotify on log
> > > > > > > files and SSE to stream out new bytes to clients (like what the
> > > > > existing
> > > > > > > event logging is doing).
> > > > > > >
> > > > > > > As we said above, for phosphor-hostlogger, the input is still
> the
> > > > > > > obmc-server unix socket, and the output are still persisted
> log files.
> > > > > But
> > > > > > > the functionality will get improved (less data loss), code gets
> > > > > simplified
> > > > > > > (no ring buffer and persistence triggering), and it will
> become easier
> > > > > and
> > > > > > > more performant to get BMCWeb hooked up for log streaming via
> Redfish.
> > > > > > >
> > > > > > > Please let us know what you think. We appreciate any feedback.
> Thank
> > > > > you
> > > > > > > very much!
> > > > > > >
> > > > > > > Sincerely,
> > > > > > > Nan
> > > > > >
> > > > > > --
> > > > > > Regards,
> > > > > > Artem Senichev
> > > > > > Software Engineer, YADRO.
> > > > >
>

--00000000000056cef305c328d5d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&quot;we propose to remove th=
e ring buffer and write to the log file as soon<br></span>as some character=
s are received. This implicitly removes the needs of<br><span class=3D"gmai=
l-im" style=3D"color:rgb(80,0,80)">the ring buffer, and the persistence tri=
ggering (host reboot, sigterm,<br></span><span class=3D"gmail-im" style=3D"=
color:rgb(80,0,80)">etc) in hostlogger&quot;</span><span class=3D"gmail-im"=
 style=3D"color:rgb(80,0,80)"><br></span>I would like to get a more detaile=
d description of further changes in order<br>to see the whole picture of th=
e solution.</blockquote><div>=C2=A0Originally I didn&#39;t consider=C2=A0in=
cluding changing the log file according to the boot cycle; we will keep par=
t of the dbus/signal watcher to make that different reboot posts to a diffe=
rent log file.</div><div><br></div><div>We will work out some more detailed=
 descriptions for future changes soon.</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 24, 2021 at 11:41 P=
M Artem Senichev &lt;<a href=3D"mailto:artemsen@gmail.com">artemsen@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Sorry guys, maybe this is a misunderstanding on my part.<br>
<br>
I was confused with the following line in the proposal:<br>
<br>
&quot;we propose to remove the ring buffer and write to the log file as soo=
n<br>
as some characters are received. This implicitly removes the needs of<br>
the ring buffer, and the persistence triggering (host reboot, sigterm,<br>
etc) in hostlogger&quot;<br>
<br>
I would like to get a more detailed description of further changes in order=
<br>
to see the whole picture of the solution. <br>
<br>
--<br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
<br>
<br>
On Mon, May 24, 2021 at 09:27:39AM -0700, Ed Tanous wrote:<br>
&gt; On Mon, May 24, 2021 at 12:52 AM Artem Senichev &lt;<a href=3D"mailto:=
artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll try to convey the main idea that we tried to implement i=
n this service.<br>
&gt; &gt;<br>
&gt; &gt; Hostlogger was originally designed to work with OpenPOWER systems=
, which<br>
&gt; &gt; generate a very detailed log at boot time.<br>
&gt; <br>
&gt; There are definitely other non OpenPOWER systems that have this same b=
ehavior.<br>
&gt; <br>
&gt; &gt; It is important to save these logs and the host console output ju=
st before<br>
&gt; &gt; rebooting for further investigation of incidents when hardware er=
rors occur.<br>
&gt; &gt; So, we have two log files for each server session (boot log + las=
t OS messages).<br>
&gt; &gt; That&#39;s why we need a D-bus watcher.<br>
&gt; &gt; BMC flash has around 3MiB of free RW space, this force us to use =
compression<br>
&gt; &gt; and file rotation.<br>
&gt; &gt;<br>
&gt; &gt; All of these features are unnecessary for &quot;streaming&quot; r=
eal-time log recording.<br>
&gt; <br>
&gt; I disagree with you there.=C2=A0 Rotation and compression are still us=
eful<br>
&gt; in a &quot;streaming&quot; case.=C2=A0 Because of the ways the APIs ar=
e defined,<br>
&gt; LogService in redfish provides both a &quot;historical&quot; version o=
f past<br>
&gt; logs.=C2=A0 It&#39;s useful to have those logs rotated and compressed.=
<br>
&gt; <br>
&gt; &gt; You don&#39;t need DBus watchers, rotation can be done with nativ=
e Linux utilities,<br>
&gt; &gt; you don&#39;t even need to split the input stream into lines.<br>
&gt; <br>
&gt; I&#39;m not following why those now wouldn&#39;t be needed.=C2=A0 Redf=
ish LogEntry<br>
&gt; would separate per line, so we&#39;d have to do the splitting somewher=
e.<br>
&gt; There&#39;s already code to do that in hostlogger.=C2=A0 Wouldn&#39;t =
you still<br>
&gt; want to separate log per boot, and have lines split between log files?=
<br>
&gt;=C2=A0 I&#39;m not following why those would go away just because there=
&#39;s a<br>
&gt; desire to poll for logs and get up to date information.<br>
&gt; <br>
&gt; &gt; Just redirect obmc-console.log: `tail -f /var/log/obmc-console.lo=
g &gt; my.log`.<br>
&gt; <br>
&gt; This doesn&#39;t solve the problem presented.=C2=A0 First of all, log =
rotation<br>
&gt; and compression are still needed.=C2=A0 Also, it&#39;s desirable to ha=
ve dbus<br>
&gt; watchers and separate the logs per boot, such that they can end up<br>
&gt; separated in the Redfish API.=C2=A0 Also, in what you presented, my.lo=
g<br>
&gt; would quickly and easily overflow the available space, as there&#39;s =
no<br>
&gt; log rotation.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; I understand your desire to add a new mode to the existing projec=
t instead of<br>
&gt; &gt; creating a new one. But there is very little in common between th=
ese modes.<br>
&gt; <br>
&gt; I&#39;m not following how they&#39;re all that different, see above ab=
out<br>
&gt; needing very similar features.=C2=A0 For the sake of argument, lets sa=
y we<br>
&gt; went with a totally different implementation, would it be able to live=
<br>
&gt; in the hostlogger repo to be able to reuse code where needed?=C2=A0 Th=
ere&#39;s<br>
&gt; a lot of code that I suspect will be identical.<br>
&gt; <br>
&gt; &gt; Even reading the socket will have to be done separately, since it=
 is buffered<br>
&gt; &gt; for line splitting in the current implementation.<br>
&gt; &gt; In the end, only bb-recipe and the `main` function will remain in=
 the common.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Regards,<br>
&gt; &gt; Artem Senichev<br>
&gt; &gt; Software Engineer, YADRO.<br>
&gt; &gt;<br>
&gt; &gt; On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; we propose to remove the ring buffer and writ=
e to the log file<br>
&gt; &gt; &gt; &gt; &gt; &gt; as soon as some characters are received.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I am not sure it is a good idea.<br>
&gt; &gt; &gt; &gt; &gt; The host can generate a lot of logs, but we have v=
ery limited free space.<br>
&gt; &gt; &gt; &gt; This is a fair concern, but wouldn&#39;t the rollover l=
imits make this not<br>
&gt; &gt; &gt; &gt; an issue?=C2=A0 They seem like they could be easily con=
figured.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Right. Logrotate will be able to handle the rotation. Maximu=
m size, # log<br>
&gt; &gt; &gt; files, and compression can be easily configured.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In<br>
&gt; &gt; &gt; &gt; &gt; addition, such heavy traffic will lead to a quick =
breakdown of the flash<br>
&gt; &gt; &gt; &gt; (most<br>
&gt; &gt; &gt; &gt; &gt; available products are guaranteed to withstand aro=
und 100,000 P/E cycles<br>
&gt; &gt; &gt; &gt; only).<br>
&gt; &gt; &gt; &gt; JFFS2 is wear leveled, and there are other BMC stacks t=
hat I know of<br>
&gt; &gt; &gt; &gt; that implement this without any ill effects to flash lo=
ngevity, with<br>
&gt; &gt; &gt; &gt; that said, if Nan made the &quot;last log on disk&quot;=
 feature configurable,<br>
&gt; &gt; &gt; &gt; would that alleviate your concerns?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We also noticed that the obmc-server itself will buffer the =
log a bit. Will<br>
&gt; &gt; &gt; it still be a problem if we don&#39;t write a character at o=
nce but a block of<br>
&gt; &gt; &gt; them?<br>
&gt; &gt; &gt; And as Ed said, we can also make this feature configurable. =
I would imagine<br>
&gt; &gt; &gt; the log buffer will remain if the &quot;last log on disk&quo=
t; feature is disabled.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This implicitly removes the needs<br>
&gt; &gt; &gt; &gt; &gt; &gt; of the ring buffer, and the persistence trigg=
ering (host reboot,<br>
&gt; &gt; &gt; &gt; sigterm,<br>
&gt; &gt; &gt; &gt; &gt; &gt; etc) in hostlogger. We believe this keeps the=
 same functionality but<br>
&gt; &gt; &gt; &gt; saves<br>
&gt; &gt; &gt; &gt; &gt; &gt; hundreds of lines of codes in phosphor-hostlo=
gger.<br>
&gt; &gt; &gt; &gt; Difference of opinion here, I don&#39;t think this remo=
ves the need for<br>
&gt; &gt; &gt; &gt; the host reboot event;=C2=A0 Having each reboot post to=
 a different log<br>
&gt; &gt; &gt; &gt; needs to be maintained, and I have to imagine that ther=
e&#39;s some sort<br>
&gt; &gt; &gt; &gt; of sigterm handler still, although it becomes a lot sma=
ller.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; You are suggesting to delete the buffer, DBus watc=
her, log rotate. How<br>
&gt; &gt; &gt; &gt; are you<br>
&gt; &gt; &gt; &gt; &gt; going to keep the same functionality if you remove=
 everything related to<br>
&gt; &gt; &gt; &gt; it?<br>
&gt; &gt; &gt; &gt; +1.=C2=A0 In the initial thought I didn&#39;t think we =
were removing any<br>
&gt; &gt; &gt; &gt; functionality with this.=C2=A0 I had assumed the dbus w=
atcher would remain,<br>
&gt; &gt; &gt; &gt; and we would still have the log rotation behavior.=C2=
=A0 In reading through<br>
&gt; &gt; &gt; &gt; Nans proposal I don&#39;t think these are getting remov=
ed;=C2=A0 Maybe I<br>
&gt; &gt; &gt; &gt; misunderstood?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes, if we want to keep different reboot posts to a differen=
t log file, we<br>
&gt; &gt; &gt; can keep part of the dbus/signal watcher.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, May 21, 2021 at 10:24 AM Ed Tanous &lt;<a href=3D"ma=
ilto:edtanous@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wro=
te:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, May 20, 2021 at 11:10 PM Artem Senichev &lt;<a =
href=3D"mailto:artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>=
&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; In the previous thread (<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.ozlabs.org/pipermail=
/openbmc/2021-March/025234.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html</a>), we<br>
&gt; &gt; &gt; &gt; &gt; &gt; (engineers from Google and Quanta) discussed =
our attempt to share host<br>
&gt; &gt; &gt; &gt; &gt; &gt; serial logs via Redfish, which includes polli=
ng logs via LogService and<br>
&gt; &gt; &gt; &gt; &gt; &gt; streaming log bytes via EventService (e.g. SS=
E). We went with the<br>
&gt; &gt; &gt; &gt; event log<br>
&gt; &gt; &gt; &gt; &gt; &gt; architecture<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/openbmc/docs/blob/master/=
architecture/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/openbmc/docs/blob/master/architecture/redfish-loggi=
ng-in-bmcweb.md</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; and did the implementation.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; We still want to reuse the phosphor-hostlogge=
r and do some<br>
&gt; &gt; &gt; &gt; modification. We<br>
&gt; &gt; &gt; &gt; &gt; &gt; believe it is better to try to reuse existing=
 codes if possible and<br>
&gt; &gt; &gt; &gt; improve<br>
&gt; &gt; &gt; &gt; &gt; &gt; them rather than creating new things that hav=
e similar functionalities<br>
&gt; &gt; &gt; &gt; (in<br>
&gt; &gt; &gt; &gt; &gt; &gt; our case, it is a daemon that could collect l=
ogs and persist them).<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I agree, reusing code is a right choice, but only =
when it is really<br>
&gt; &gt; &gt; &gt; possible.<br>
&gt; &gt; &gt; &gt; &gt; For now it looks like you want to remove most of t=
he Hostlogger features<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; transform it from buffer-like to stream-like servi=
ce.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m not quite following this statement.=C2=A0 Which=
 features are getting<br>
&gt; &gt; &gt; &gt; removed?=C2=A0 From what I can see, he&#39;s suggesting=
 making<br>
&gt; &gt; &gt; &gt; phosphor-hostlogger look more like a well-behaved linux=
 logging<br>
&gt; &gt; &gt; &gt; daemon, but I don&#39;t think any features got omitted =
(or I&#39;m missing<br>
&gt; &gt; &gt; &gt; something critical).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; We want to do the following modification in p=
hosphor-hostlogger (from<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; input and output point of view, just very few=
 things will be changed)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 1. One limitation of phosphor-hostlogger is t=
hat it will lose data in<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; memory (the ring buffer maintained by hostlog=
ger) when BMC gets force<br>
&gt; &gt; &gt; &gt; &gt; &gt; restarted;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; When BMC goes to reboot it stops all services, at =
that moment hostlogger<br>
&gt; &gt; &gt; &gt; gets<br>
&gt; &gt; &gt; &gt; &gt; a signal and flushes all gathered logs to a file.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Only if the reboot is planned.=C2=A0 If the BMC loses p=
ower (which is<br>
&gt; &gt; &gt; &gt; &quot;normal&quot; for a bmc) there isn&#39;t time to p=
ersist to flash before the<br>
&gt; &gt; &gt; &gt; power goes down and the logs are most likely lost.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; we propose to remove the ring buffer and writ=
e to the log file<br>
&gt; &gt; &gt; &gt; &gt; &gt; as soon as some characters are received.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I am not sure it is a good idea.<br>
&gt; &gt; &gt; &gt; &gt; The host can generate a lot of logs, but we have v=
ery limited free space.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is a fair concern, but wouldn&#39;t the rollover l=
imits make this not<br>
&gt; &gt; &gt; &gt; an issue?=C2=A0 They seem like they could be easily con=
figured.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; In<br>
&gt; &gt; &gt; &gt; &gt; addition, such heavy traffic will lead to a quick =
breakdown of the flash<br>
&gt; &gt; &gt; &gt; (most<br>
&gt; &gt; &gt; &gt; &gt; available products are guaranteed to withstand aro=
und 100,000 P/E cycles<br>
&gt; &gt; &gt; &gt; only).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; JFFS2 is wear leveled, and there are other BMC stacks t=
hat I know of<br>
&gt; &gt; &gt; &gt; that implement this without any ill effects to flash lo=
ngevity, with<br>
&gt; &gt; &gt; &gt; that said, if Nan made the &quot;last log on disk&quot;=
 feature configurable,<br>
&gt; &gt; &gt; &gt; would that alleviate your concerns?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This implicitly removes the needs<br>
&gt; &gt; &gt; &gt; &gt; &gt; of the ring buffer, and the persistence trigg=
ering (host reboot,<br>
&gt; &gt; &gt; &gt; sigterm,<br>
&gt; &gt; &gt; &gt; &gt; &gt; etc) in hostlogger. We believe this keeps the=
 same functionality but<br>
&gt; &gt; &gt; &gt; saves<br>
&gt; &gt; &gt; &gt; &gt; &gt; hundreds of lines of codes in phosphor-hostlo=
gger.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Difference of opinion here, I don&#39;t think this remo=
ves the need for<br>
&gt; &gt; &gt; &gt; the host reboot event;=C2=A0 Having each reboot post to=
 a different log<br>
&gt; &gt; &gt; &gt; needs to be maintained, and I have to imagine that ther=
e&#39;s some sort<br>
&gt; &gt; &gt; &gt; of sigterm handler still, although it becomes a lot sma=
ller.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; You are suggesting to delete the buffer, DBus watc=
her, log rotate. How<br>
&gt; &gt; &gt; &gt; are you<br>
&gt; &gt; &gt; &gt; &gt; going to keep the same functionality if you remove=
 everything related to<br>
&gt; &gt; &gt; &gt; it?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +1.=C2=A0 In the initial thought I didn&#39;t think we =
were removing any<br>
&gt; &gt; &gt; &gt; functionality with this.=C2=A0 I had assumed the dbus w=
atcher would remain,<br>
&gt; &gt; &gt; &gt; and we would still have the log rotation behavior.=C2=
=A0 In reading through<br>
&gt; &gt; &gt; &gt; Nans proposal I don&#39;t think these are getting remov=
ed;=C2=A0 Maybe I<br>
&gt; &gt; &gt; &gt; misunderstood?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2. We propose not to compress the latest log =
file. This saves us the<br>
&gt; &gt; &gt; &gt; &gt; &gt; overhead of doing decompression when BMCWeb j=
ust needs to retrieve the<br>
&gt; &gt; &gt; &gt; most<br>
&gt; &gt; &gt; &gt; &gt; &gt; recent logs. There are still going to be log =
rotations in the file<br>
&gt; &gt; &gt; &gt; level.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Files other than the latest log file are stil=
l going to be compressed.<br>
&gt; &gt; &gt; &gt; We<br>
&gt; &gt; &gt; &gt; &gt; &gt; can modify existing codes to achieve this or =
use the linux logrotate<br>
&gt; &gt; &gt; &gt; &gt; &gt; directly.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Furthermore, we will add host serial logs int=
o BMCWeb, both LogService<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; EventService. In LogService, we will teach BM=
CWeb how to read the<br>
&gt; &gt; &gt; &gt; latest<br>
&gt; &gt; &gt; &gt; &gt; &gt; log file that is not compressed and the other=
 compressed old logs, and<br>
&gt; &gt; &gt; &gt; how<br>
&gt; &gt; &gt; &gt; &gt; &gt; to assemble LogEntries out of raw serial logs=
. We will discuss<br>
&gt; &gt; &gt; &gt; EventService<br>
&gt; &gt; &gt; &gt; &gt; &gt; in future threads but the very initial idea i=
s to setup inotify on log<br>
&gt; &gt; &gt; &gt; &gt; &gt; files and SSE to stream out new bytes to clie=
nts (like what the<br>
&gt; &gt; &gt; &gt; existing<br>
&gt; &gt; &gt; &gt; &gt; &gt; event logging is doing).<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As we said above, for phosphor-hostlogger, th=
e input is still the<br>
&gt; &gt; &gt; &gt; &gt; &gt; obmc-server unix socket, and the output are s=
till persisted log files.<br>
&gt; &gt; &gt; &gt; But<br>
&gt; &gt; &gt; &gt; &gt; &gt; the functionality will get improved (less dat=
a loss), code gets<br>
&gt; &gt; &gt; &gt; simplified<br>
&gt; &gt; &gt; &gt; &gt; &gt; (no ring buffer and persistence triggering), =
and it will become easier<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; more performant to get BMCWeb hooked up for l=
og streaming via Redfish.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Please let us know what you think. We appreci=
ate any feedback. Thank<br>
&gt; &gt; &gt; &gt; you<br>
&gt; &gt; &gt; &gt; &gt; &gt; very much!<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sincerely,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Nan<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; Artem Senichev<br>
&gt; &gt; &gt; &gt; &gt; Software Engineer, YADRO.<br>
&gt; &gt; &gt; &gt;<br>
</blockquote></div>

--00000000000056cef305c328d5d3--
