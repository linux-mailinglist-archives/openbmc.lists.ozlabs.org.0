Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918D38E1F8
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 09:53:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpTwY3vVJz2yqC
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 17:53:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f/70JWer;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f/70JWer; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpTwF3SNbz2yXW
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 17:52:58 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id r5so39356842lfr.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 00:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XmPxC0ejSqfozVpfLHERWwn46x4Tl+JebkLOqiw2Zgs=;
 b=f/70JWeroFiU72sjSWMCq4HX1I2WDA9BV4vGxlQaid8I9iCtaOpGWzndR+Jtb2RW5D
 U0ukJvF+zdkUdpdrMyfP/vKLXmAv7ve3y2HZYVGgGSBp6rQkEWy5D8QjUtXDRmJnKr0K
 iwZQlBXAmyz2hxzu665PCt/T7M9LPJWOAcUHKus00luwGPSKwwBdBFbtvZv6pPs1jUrq
 7F8hVkKd+bmTXrzvFWUVRt5k0FetUcscezxeAXf+QUHDoe3SlLHfHIEr2fnSMWCHixvy
 VJMyI5B03dSPAl3n1h3emvn89g81Qx8YqoTAgKZGvqiXmqVzvwT70rfK0t5Ocslzw7+b
 B9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XmPxC0ejSqfozVpfLHERWwn46x4Tl+JebkLOqiw2Zgs=;
 b=eVh9XYzSy5FfTieYcg4L7QkzEXtrala+0rh3MImVfZCUvqe+X6O0V0drit3NHaOSd0
 GtVW2TPwLqQyZE+SG+P3XvO+29IpH/EmoSkHgY8KMVDG3DT1hxYITuT4rqMVTaL9Pnzv
 8KqFn05pzzy3w21sgXbKzkXIxQgwtySLXHp+efM6Bzz6uRSSe9VZwwxFIQdYobsJE+Hk
 R0Qx0NkyOqKEjxpjouVvMCfL3JNdqL98NA182qL+IOdNOGHQv3mPthLEZlS4//Yh68fS
 POOrc1QgziIpD+j0lEvolP7VrxYEdg/tVc7onld+OdAjacXJlCjUj7CJCXENhSeW1Lyi
 BsoQ==
X-Gm-Message-State: AOAM530uE9yeyyZlYgcKWyhvMspdqkhtQtANk0qdGoQ4bbnBKxSvJtv5
 T+Jd9ua4kf6Y/yql8X3v30E=
X-Google-Smtp-Source: ABdhPJzzR06BwQ2dGnJHX+5U0bJTjxpUx6dAY1B4w4U+LF+qHVchzSPZ5ttWKN4lOlXQ5J+zPDO0ag==
X-Received: by 2002:ac2:538b:: with SMTP id g11mr9477468lfh.172.1621842771922; 
 Mon, 24 May 2021 00:52:51 -0700 (PDT)
Received: from gmail.com (109-252-116-140.nat.spd-mgts.ru. [109.252.116.140])
 by smtp.gmail.com with ESMTPSA id
 p13sm1640033ljg.8.2021.05.24.00.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 00:52:50 -0700 (PDT)
Date: Mon, 24 May 2021 10:52:48 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210524075248.m7mimyya42xas3nx@gmail.com>
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
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

I'll try to convey the main idea that we tried to implement in this service.

Hostlogger was originally designed to work with OpenPOWER systems, which
generate a very detailed log at boot time.
It is important to save these logs and the host console output just before
rebooting for further investigation of incidents when hardware errors occur.
So, we have two log files for each server session (boot log + last OS messages).
That's why we need a D-bus watcher.
BMC flash has around 3MiB of free RW space, this force us to use compression
and file rotation.

All of these features are unnecessary for "streaming" real-time log recording.
You don't need DBus watchers, rotation can be done with native Linux utilities,
you don't even need to split the input stream into lines.
Just redirect obmc-console.log: `tail -f /var/log/obmc-console.log > my.log`.

I understand your desire to add a new mode to the existing project instead of
creating a new one. But there is very little in common between these modes.
Even reading the socket will have to be done separately, since it is buffered
for line splitting in the current implementation.
In the end, only bb-recipe and the `main` function will remain in the common. 

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.

On Fri, May 21, 2021 at 10:51:45AM -0700, Nan Zhou wrote:

> >
> > >
> > > > we propose to remove the ring buffer and write to the log file
> > > > as soon as some characters are received.
> > >
> > > I am not sure it is a good idea.
> > > The host can generate a lot of logs, but we have very limited free space.
> > This is a fair concern, but wouldn't the rollover limits make this not
> > an issue?  They seem like they could be easily configured.
> 
> Right. Logrotate will be able to handle the rotation. Maximum size, # log
> files, and compression can be easily configured.
> 
> > In
> > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > (most
> > > available products are guaranteed to withstand around 100,000 P/E cycles
> > only).
> > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > that implement this without any ill effects to flash longevity, with
> > that said, if Nan made the "last log on disk" feature configurable,
> > would that alleviate your concerns?
> 
> We also noticed that the obmc-server itself will buffer the log a bit. Will
> it still be a problem if we don't write a character at once but a block of
> them?
> And as Ed said, we can also make this feature configurable. I would imagine
> the log buffer will remain if the "last log on disk" feature is disabled.
> 
> 
> > >
> > > > This implicitly removes the needs
> > > > of the ring buffer, and the persistence triggering (host reboot,
> > sigterm,
> > > > etc) in hostlogger. We believe this keeps the same functionality but
> > saves
> > > > hundreds of lines of codes in phosphor-hostlogger.
> > Difference of opinion here, I don't think this removes the need for
> > the host reboot event;  Having each reboot post to a different log
> > needs to be maintained, and I have to imagine that there's some sort
> > of sigterm handler still, although it becomes a lot smaller.
> 
> 
> >
> > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > are you
> > > going to keep the same functionality if you remove everything related to
> > it?
> > +1.  In the initial thought I didn't think we were removing any
> > functionality with this.  I had assumed the dbus watcher would remain,
> > and we would still have the log rotation behavior.  In reading through
> > Nans proposal I don't think these are getting removed;  Maybe I
> > misunderstood?
> 
> 
> Yes, if we want to keep different reboot posts to a different log file, we
> can keep part of the dbus/signal watcher.
> 
> On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com> wrote:
> 
> > On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com>
> > wrote:
> > >
> > > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > > > Hi all,
> > > >
> > > > In the previous thread (
> > > > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > > > (engineers from Google and Quanta) discussed our attempt to share host
> > > > serial logs via Redfish, which includes polling logs via LogService and
> > > > streaming log bytes via EventService (e.g. SSE). We went with the
> > event log
> > > > architecture
> > > > <
> > https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> > >
> > > > and did the implementation.
> > > >
> > > > We still want to reuse the phosphor-hostlogger and do some
> > modification. We
> > > > believe it is better to try to reuse existing codes if possible and
> > improve
> > > > them rather than creating new things that have similar functionalities
> > (in
> > > > our case, it is a daemon that could collect logs and persist them).
> > >
> > > I agree, reusing code is a right choice, but only when it is really
> > possible.
> > > For now it looks like you want to remove most of the Hostlogger features
> > to
> > > transform it from buffer-like to stream-like service.
> >
> > I'm not quite following this statement.  Which features are getting
> > removed?  From what I can see, he's suggesting making
> > phosphor-hostlogger look more like a well-behaved linux logging
> > daemon, but I don't think any features got omitted (or I'm missing
> > something critical).
> >
> > >
> > > > We want to do the following modification in phosphor-hostlogger (from
> > the
> > > > input and output point of view, just very few things will be changed)
> > > >
> > > > 1. One limitation of phosphor-hostlogger is that it will lose data in
> > the
> > > > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > > > restarted;
> > >
> > > When BMC goes to reboot it stops all services, at that moment hostlogger
> > gets
> > > a signal and flushes all gathered logs to a file.
> >
> > Only if the reboot is planned.  If the BMC loses power (which is
> > "normal" for a bmc) there isn't time to persist to flash before the
> > power goes down and the logs are most likely lost.
> >
> > >
> > > > we propose to remove the ring buffer and write to the log file
> > > > as soon as some characters are received.
> > >
> > > I am not sure it is a good idea.
> > > The host can generate a lot of logs, but we have very limited free space.
> >
> > This is a fair concern, but wouldn't the rollover limits make this not
> > an issue?  They seem like they could be easily configured.
> >
> > > In
> > > addition, such heavy traffic will lead to a quick breakdown of the flash
> > (most
> > > available products are guaranteed to withstand around 100,000 P/E cycles
> > only).
> >
> > JFFS2 is wear leveled, and there are other BMC stacks that I know of
> > that implement this without any ill effects to flash longevity, with
> > that said, if Nan made the "last log on disk" feature configurable,
> > would that alleviate your concerns?
> >
> > >
> > > > This implicitly removes the needs
> > > > of the ring buffer, and the persistence triggering (host reboot,
> > sigterm,
> > > > etc) in hostlogger. We believe this keeps the same functionality but
> > saves
> > > > hundreds of lines of codes in phosphor-hostlogger.
> >
> > Difference of opinion here, I don't think this removes the need for
> > the host reboot event;  Having each reboot post to a different log
> > needs to be maintained, and I have to imagine that there's some sort
> > of sigterm handler still, although it becomes a lot smaller.
> >
> > >
> > > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> > are you
> > > going to keep the same functionality if you remove everything related to
> > it?
> >
> > +1.  In the initial thought I didn't think we were removing any
> > functionality with this.  I had assumed the dbus watcher would remain,
> > and we would still have the log rotation behavior.  In reading through
> > Nans proposal I don't think these are getting removed;  Maybe I
> > misunderstood?
> >
> > >
> > > > 2. We propose not to compress the latest log file. This saves us the
> > > > overhead of doing decompression when BMCWeb just needs to retrieve the
> > most
> > > > recent logs. There are still going to be log rotations in the file
> > level.
> > > > Files other than the latest log file are still going to be compressed.
> > We
> > > > can modify existing codes to achieve this or use the linux logrotate
> > > > directly.
> > > >
> > > > Furthermore, we will add host serial logs into BMCWeb, both LogService
> > and
> > > > EventService. In LogService, we will teach BMCWeb how to read the
> > latest
> > > > log file that is not compressed and the other compressed old logs, and
> > how
> > > > to assemble LogEntries out of raw serial logs. We will discuss
> > EventService
> > > > in future threads but the very initial idea is to setup inotify on log
> > > > files and SSE to stream out new bytes to clients (like what the
> > existing
> > > > event logging is doing).
> > > >
> > > > As we said above, for phosphor-hostlogger, the input is still the
> > > > obmc-server unix socket, and the output are still persisted log files.
> > But
> > > > the functionality will get improved (less data loss), code gets
> > simplified
> > > > (no ring buffer and persistence triggering), and it will become easier
> > and
> > > > more performant to get BMCWeb hooked up for log streaming via Redfish.
> > > >
> > > > Please let us know what you think. We appreciate any feedback. Thank
> > you
> > > > very much!
> > > >
> > > > Sincerely,
> > > > Nan
> > >
> > > --
> > > Regards,
> > > Artem Senichev
> > > Software Engineer, YADRO.
> >
