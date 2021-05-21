Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36538CCB9
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmvM42dqBz307J
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=I9R2rW5V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=I9R2rW5V; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmvLq33Kwz2yxq
 for <openbmc@lists.ozlabs.org>; Sat, 22 May 2021 03:52:00 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 191so22672084ybn.7
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=na0J9HSArehqW4Gq7Br9DWlIYI0Cy/LIze5VdeiS4Nc=;
 b=I9R2rW5Vov5hoMwpgd+pbXBjJ4L0SSdCNsOJie1vyGKe8gJHxoAFIi6FLWrY/n8zDJ
 e8sxNcgtC0yiPWQLdcLBSySxbcZL1XgYmJZvIBZXu2hekJlKGd4aajz1a7m7mrqo6yaH
 Qtbrp55fSTfCmONa1Ttu7GT//mx73MdIdfKDxdzrELL7hr6QdoxM5NMViU/tFiYJmX+e
 pEqHsQMec+j9pDsfmeaeIU/FFH0BQIJYSoPNcE7AJ0lX0ye2tSHzDaTSpoDgEO5OsO/p
 x24VFUbaXaoivzsIvBOzaW+tzmOlJBbQz9zvKOxrWwMtdzCVBORK7qGMIXJFDx5sgk3M
 xBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=na0J9HSArehqW4Gq7Br9DWlIYI0Cy/LIze5VdeiS4Nc=;
 b=Ao5n6h1X92/8SbYGS2nvMsBCdkJu1OQs+GH73t9w5CESsYopQ3N77j79L3/FZ12cI8
 ejrJyNy2+BkMf0nVw6uV5TJWU2AolMxfojOPPuoAyucSJ5i3/Qj0VLql8C+s2oMgIf+N
 JkD/4I3J04G6j93teOxkfjHR6iG+oKx+nrAGBGzYEKJdP6i0Hda3US2HTX8hJBx6gxMP
 kjBzumzD1GwU58AtOw6fCu3F1wk5Z4zjYdokL9I9XJMdudISKEfuAtnga4t2uaNH0k0l
 54tTr5+NSYFjsx1OcRqZZqd5IVOfEEAB9T4i9UpG0+WSVAX8v8KspFx19Yox634LHY0I
 Ya8A==
X-Gm-Message-State: AOAM530xj1A7H7kdiAYtUMLJJT0XuEiOUEcd9/O7XXvCdbrhlYEkcQtj
 2HNRzlvvveqjQ8tPvt/B9BaaXxU9r2QrbfcZDAx8Wg==
X-Google-Smtp-Source: ABdhPJyjQqWAMz297zTMjLFj24tFgUwlNAU6W9veSPcqZwLWsBuWYqtKCfwTLzO/tzhf7aHuBjZHRrCa/1wAKX1Loc0=
X-Received: by 2002:a25:9a04:: with SMTP id x4mr16959628ybn.440.1621619516610; 
 Fri, 21 May 2021 10:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
In-Reply-To: <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Fri, 21 May 2021 10:51:45 -0700
Message-ID: <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="000000000000400b1f05c2dab76c"
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
 Alexander Amelkin <a.amelkin@yadro.com>, a.senichev@yadro.com,
 Richard Hanley <rhanley@google.com>, Artem Senichev <artemsen@gmail.com>,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000400b1f05c2dab76c
Content-Type: text/plain; charset="UTF-8"

>
> >
> > > we propose to remove the ring buffer and write to the log file
> > > as soon as some characters are received.
> >
> > I am not sure it is a good idea.
> > The host can generate a lot of logs, but we have very limited free space.
> This is a fair concern, but wouldn't the rollover limits make this not
> an issue?  They seem like they could be easily configured.

Right. Logrotate will be able to handle the rotation. Maximum size, # log
files, and compression can be easily configured.

> In
> > addition, such heavy traffic will lead to a quick breakdown of the flash
> (most
> > available products are guaranteed to withstand around 100,000 P/E cycles
> only).
> JFFS2 is wear leveled, and there are other BMC stacks that I know of
> that implement this without any ill effects to flash longevity, with
> that said, if Nan made the "last log on disk" feature configurable,
> would that alleviate your concerns?

We also noticed that the obmc-server itself will buffer the log a bit. Will
it still be a problem if we don't write a character at once but a block of
them?
And as Ed said, we can also make this feature configurable. I would imagine
the log buffer will remain if the "last log on disk" feature is disabled.


> >
> > > This implicitly removes the needs
> > > of the ring buffer, and the persistence triggering (host reboot,
> sigterm,
> > > etc) in hostlogger. We believe this keeps the same functionality but
> saves
> > > hundreds of lines of codes in phosphor-hostlogger.
> Difference of opinion here, I don't think this removes the need for
> the host reboot event;  Having each reboot post to a different log
> needs to be maintained, and I have to imagine that there's some sort
> of sigterm handler still, although it becomes a lot smaller.


>
> > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> are you
> > going to keep the same functionality if you remove everything related to
> it?
> +1.  In the initial thought I didn't think we were removing any
> functionality with this.  I had assumed the dbus watcher would remain,
> and we would still have the log rotation behavior.  In reading through
> Nans proposal I don't think these are getting removed;  Maybe I
> misunderstood?


Yes, if we want to keep different reboot posts to a different log file, we
can keep part of the dbus/signal watcher.

On Fri, May 21, 2021 at 10:24 AM Ed Tanous <edtanous@google.com> wrote:

> On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com>
> wrote:
> >
> > On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > > Hi all,
> > >
> > > In the previous thread (
> > > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > > (engineers from Google and Quanta) discussed our attempt to share host
> > > serial logs via Redfish, which includes polling logs via LogService and
> > > streaming log bytes via EventService (e.g. SSE). We went with the
> event log
> > > architecture
> > > <
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >
> > > and did the implementation.
> > >
> > > We still want to reuse the phosphor-hostlogger and do some
> modification. We
> > > believe it is better to try to reuse existing codes if possible and
> improve
> > > them rather than creating new things that have similar functionalities
> (in
> > > our case, it is a daemon that could collect logs and persist them).
> >
> > I agree, reusing code is a right choice, but only when it is really
> possible.
> > For now it looks like you want to remove most of the Hostlogger features
> to
> > transform it from buffer-like to stream-like service.
>
> I'm not quite following this statement.  Which features are getting
> removed?  From what I can see, he's suggesting making
> phosphor-hostlogger look more like a well-behaved linux logging
> daemon, but I don't think any features got omitted (or I'm missing
> something critical).
>
> >
> > > We want to do the following modification in phosphor-hostlogger (from
> the
> > > input and output point of view, just very few things will be changed)
> > >
> > > 1. One limitation of phosphor-hostlogger is that it will lose data in
> the
> > > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > > restarted;
> >
> > When BMC goes to reboot it stops all services, at that moment hostlogger
> gets
> > a signal and flushes all gathered logs to a file.
>
> Only if the reboot is planned.  If the BMC loses power (which is
> "normal" for a bmc) there isn't time to persist to flash before the
> power goes down and the logs are most likely lost.
>
> >
> > > we propose to remove the ring buffer and write to the log file
> > > as soon as some characters are received.
> >
> > I am not sure it is a good idea.
> > The host can generate a lot of logs, but we have very limited free space.
>
> This is a fair concern, but wouldn't the rollover limits make this not
> an issue?  They seem like they could be easily configured.
>
> > In
> > addition, such heavy traffic will lead to a quick breakdown of the flash
> (most
> > available products are guaranteed to withstand around 100,000 P/E cycles
> only).
>
> JFFS2 is wear leveled, and there are other BMC stacks that I know of
> that implement this without any ill effects to flash longevity, with
> that said, if Nan made the "last log on disk" feature configurable,
> would that alleviate your concerns?
>
> >
> > > This implicitly removes the needs
> > > of the ring buffer, and the persistence triggering (host reboot,
> sigterm,
> > > etc) in hostlogger. We believe this keeps the same functionality but
> saves
> > > hundreds of lines of codes in phosphor-hostlogger.
>
> Difference of opinion here, I don't think this removes the need for
> the host reboot event;  Having each reboot post to a different log
> needs to be maintained, and I have to imagine that there's some sort
> of sigterm handler still, although it becomes a lot smaller.
>
> >
> > You are suggesting to delete the buffer, DBus watcher, log rotate. How
> are you
> > going to keep the same functionality if you remove everything related to
> it?
>
> +1.  In the initial thought I didn't think we were removing any
> functionality with this.  I had assumed the dbus watcher would remain,
> and we would still have the log rotation behavior.  In reading through
> Nans proposal I don't think these are getting removed;  Maybe I
> misunderstood?
>
> >
> > > 2. We propose not to compress the latest log file. This saves us the
> > > overhead of doing decompression when BMCWeb just needs to retrieve the
> most
> > > recent logs. There are still going to be log rotations in the file
> level.
> > > Files other than the latest log file are still going to be compressed.
> We
> > > can modify existing codes to achieve this or use the linux logrotate
> > > directly.
> > >
> > > Furthermore, we will add host serial logs into BMCWeb, both LogService
> and
> > > EventService. In LogService, we will teach BMCWeb how to read the
> latest
> > > log file that is not compressed and the other compressed old logs, and
> how
> > > to assemble LogEntries out of raw serial logs. We will discuss
> EventService
> > > in future threads but the very initial idea is to setup inotify on log
> > > files and SSE to stream out new bytes to clients (like what the
> existing
> > > event logging is doing).
> > >
> > > As we said above, for phosphor-hostlogger, the input is still the
> > > obmc-server unix socket, and the output are still persisted log files.
> But
> > > the functionality will get improved (less data loss), code gets
> simplified
> > > (no ring buffer and persistence triggering), and it will become easier
> and
> > > more performant to get BMCWeb hooked up for log streaming via Redfish.
> > >
> > > Please let us know what you think. We appreciate any feedback. Thank
> you
> > > very much!
> > >
> > > Sincerely,
> > > Nan
> >
> > --
> > Regards,
> > Artem Senichev
> > Software Engineer, YADRO.
>

--000000000000400b1f05c2dab76c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D=
"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt; we propose to remove the =
ring buffer and write to the log file<br></span><span class=3D"gmail-im" st=
yle=3D"color:rgb(80,0,80)">&gt; &gt; as soon as some characters are receive=
d.<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br>=
</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; I am not =
sure it is a good idea.<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; The host can generate a lot of logs, but we have very lim=
ited free space.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
"><br></span>This is a fair concern, but wouldn&#39;t the rollover limits m=
ake this not<br>an issue?=C2=A0 They seem like they could be easily configu=
red.</blockquote><div>Right. Logrotate will be able to handle the rotation.=
 Maximum size, # log files, and compression can be easily configured.=C2=A0=
=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; In<br></span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; addition, such he=
avy traffic will lead to a quick breakdown of the flash (most<br></span><sp=
an class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; available products =
are guaranteed to withstand around 100,000 P/E cycles only).</span><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>JFFS2 is wear leve=
led, and there are other BMC stacks that I know of<br>that implement this w=
ithout any ill effects to flash longevity, with<br>that said, if Nan made t=
he &quot;last log on disk&quot; feature configurable,<br>would that allevia=
te your concerns?</blockquote><div>We also noticed that the obmc-server its=
elf will buffer the log a bit. Will it still be a problem if we don&#39;t w=
rite a character at once but a block of them?</div><div>And as Ed said, we =
can also make this feature configurable. I would imagine the log buffer wil=
l remain if=C2=A0the &quot;last log on disk&quot; feature is disabled.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span c=
lass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt; This implicitly remove=
s the needs<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"=
>&gt; &gt; of the ring buffer, and the persistence triggering (host reboot,=
 sigterm,<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&=
gt; &gt; etc) in hostlogger. We believe this keeps the same functionality b=
ut saves<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&g=
t; &gt; hundreds of lines of codes in phosphor-hostlogger.</span><span clas=
s=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>Difference of opinio=
n here, I don&#39;t think this removes the need for<br>the host reboot even=
t;=C2=A0 Having each reboot post to a different log<br>needs to be maintain=
ed, and I have to imagine that there&#39;s some sort<br>of sigterm handler =
still, although it becomes a lot smaller.</blockquote><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">&gt; You are suggesting to delete the buffer, DBus watche=
r, log rotate. How are you<br></span><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80)">&gt; going to keep the same functionality if you remove eve=
rything related to it?</span><span class=3D"gmail-im" style=3D"color:rgb(80=
,0,80)"><br></span>+1.=C2=A0 In the initial thought I didn&#39;t think we w=
ere removing any<br>functionality with this.=C2=A0 I had assumed the dbus w=
atcher would remain,<br>and we would still have the log rotation behavior.=
=C2=A0 In reading through<br>Nans proposal I don&#39;t think these are gett=
ing removed;=C2=A0 Maybe I<br>misunderstood?=C2=A0</blockquote><div><br></d=
iv><div>Yes, if we want to keep different reboot posts to a different log f=
ile, we can keep part of the dbus/signal watcher.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021=
 at 10:24 AM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com">edtanous@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, May 20, 2021 at 11:10 PM Artem Senichev &lt;<a href=3D"m=
ailto:artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:<br>
&gt; &gt; Hi all,<br>
&gt; &gt;<br>
&gt; &gt; In the previous thread (<br>
&gt; &gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-March/=
025234.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/=
pipermail/openbmc/2021-March/025234.html</a>), we<br>
&gt; &gt; (engineers from Google and Quanta) discussed our attempt to share=
 host<br>
&gt; &gt; serial logs via Redfish, which includes polling logs via LogServi=
ce and<br>
&gt; &gt; streaming log bytes via EventService (e.g. SSE). We went with the=
 event log<br>
&gt; &gt; architecture<br>
&gt; &gt; &lt;<a href=3D"https://github.com/openbmc/docs/blob/master/archit=
ecture/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-=
bmcweb.md</a>&gt;<br>
&gt; &gt; and did the implementation.<br>
&gt; &gt;<br>
&gt; &gt; We still want to reuse the phosphor-hostlogger and do some modifi=
cation. We<br>
&gt; &gt; believe it is better to try to reuse existing codes if possible a=
nd improve<br>
&gt; &gt; them rather than creating new things that have similar functional=
ities (in<br>
&gt; &gt; our case, it is a daemon that could collect logs and persist them=
).<br>
&gt;<br>
&gt; I agree, reusing code is a right choice, but only when it is really po=
ssible.<br>
&gt; For now it looks like you want to remove most of the Hostlogger featur=
es to<br>
&gt; transform it from buffer-like to stream-like service.<br>
<br>
I&#39;m not quite following this statement.=C2=A0 Which features are gettin=
g<br>
removed?=C2=A0 From what I can see, he&#39;s suggesting making<br>
phosphor-hostlogger look more like a well-behaved linux logging<br>
daemon, but I don&#39;t think any features got omitted (or I&#39;m missing<=
br>
something critical).<br>
<br>
&gt;<br>
&gt; &gt; We want to do the following modification in phosphor-hostlogger (=
from the<br>
&gt; &gt; input and output point of view, just very few things will be chan=
ged)<br>
&gt; &gt;<br>
&gt; &gt; 1. One limitation of phosphor-hostlogger is that it will lose dat=
a in the<br>
&gt; &gt; memory (the ring buffer maintained by hostlogger) when BMC gets f=
orce<br>
&gt; &gt; restarted;<br>
&gt;<br>
&gt; When BMC goes to reboot it stops all services, at that moment hostlogg=
er gets<br>
&gt; a signal and flushes all gathered logs to a file.<br>
<br>
Only if the reboot is planned.=C2=A0 If the BMC loses power (which is<br>
&quot;normal&quot; for a bmc) there isn&#39;t time to persist to flash befo=
re the<br>
power goes down and the logs are most likely lost.<br>
<br>
&gt;<br>
&gt; &gt; we propose to remove the ring buffer and write to the log file<br=
>
&gt; &gt; as soon as some characters are received.<br>
&gt;<br>
&gt; I am not sure it is a good idea.<br>
&gt; The host can generate a lot of logs, but we have very limited free spa=
ce.<br>
<br>
This is a fair concern, but wouldn&#39;t the rollover limits make this not<=
br>
an issue?=C2=A0 They seem like they could be easily configured.<br>
<br>
&gt; In<br>
&gt; addition, such heavy traffic will lead to a quick breakdown of the fla=
sh (most<br>
&gt; available products are guaranteed to withstand around 100,000 P/E cycl=
es only).<br>
<br>
JFFS2 is wear leveled, and there are other BMC stacks that I know of<br>
that implement this without any ill effects to flash longevity, with<br>
that said, if Nan made the &quot;last log on disk&quot; feature configurabl=
e,<br>
would that alleviate your concerns?<br>
<br>
&gt;<br>
&gt; &gt; This implicitly removes the needs<br>
&gt; &gt; of the ring buffer, and the persistence triggering (host reboot, =
sigterm,<br>
&gt; &gt; etc) in hostlogger. We believe this keeps the same functionality =
but saves<br>
&gt; &gt; hundreds of lines of codes in phosphor-hostlogger.<br>
<br>
Difference of opinion here, I don&#39;t think this removes the need for<br>
the host reboot event;=C2=A0 Having each reboot post to a different log<br>
needs to be maintained, and I have to imagine that there&#39;s some sort<br=
>
of sigterm handler still, although it becomes a lot smaller.<br>
<br>
&gt;<br>
&gt; You are suggesting to delete the buffer, DBus watcher, log rotate. How=
 are you<br>
&gt; going to keep the same functionality if you remove everything related =
to it?<br>
<br>
+1.=C2=A0 In the initial thought I didn&#39;t think we were removing any<br=
>
functionality with this.=C2=A0 I had assumed the dbus watcher would remain,=
<br>
and we would still have the log rotation behavior.=C2=A0 In reading through=
<br>
Nans proposal I don&#39;t think these are getting removed;=C2=A0 Maybe I<br=
>
misunderstood?<br>
<br>
&gt;<br>
&gt; &gt; 2. We propose not to compress the latest log file. This saves us =
the<br>
&gt; &gt; overhead of doing decompression when BMCWeb just needs to retriev=
e the most<br>
&gt; &gt; recent logs. There are still going to be log rotations in the fil=
e level.<br>
&gt; &gt; Files other than the latest log file are still going to be compre=
ssed. We<br>
&gt; &gt; can modify existing codes to achieve this or use the linux logrot=
ate<br>
&gt; &gt; directly.<br>
&gt; &gt;<br>
&gt; &gt; Furthermore, we will add host serial logs into BMCWeb, both LogSe=
rvice and<br>
&gt; &gt; EventService. In LogService, we will teach BMCWeb how to read the=
 latest<br>
&gt; &gt; log file that is not compressed and the other compressed old logs=
, and how<br>
&gt; &gt; to assemble LogEntries out of raw serial logs. We will discuss Ev=
entService<br>
&gt; &gt; in future threads but the very initial idea is to setup inotify o=
n log<br>
&gt; &gt; files and SSE to stream out new bytes to clients (like what the e=
xisting<br>
&gt; &gt; event logging is doing).<br>
&gt; &gt;<br>
&gt; &gt; As we said above, for phosphor-hostlogger, the input is still the=
<br>
&gt; &gt; obmc-server unix socket, and the output are still persisted log f=
iles. But<br>
&gt; &gt; the functionality will get improved (less data loss), code gets s=
implified<br>
&gt; &gt; (no ring buffer and persistence triggering), and it will become e=
asier and<br>
&gt; &gt; more performant to get BMCWeb hooked up for log streaming via Red=
fish.<br>
&gt; &gt;<br>
&gt; &gt; Please let us know what you think. We appreciate any feedback. Th=
ank you<br>
&gt; &gt; very much!<br>
&gt; &gt;<br>
&gt; &gt; Sincerely,<br>
&gt; &gt; Nan<br>
&gt;<br>
&gt; --<br>
&gt; Regards,<br>
&gt; Artem Senichev<br>
&gt; Software Engineer, YADRO.<br>
</blockquote></div>

--000000000000400b1f05c2dab76c--
