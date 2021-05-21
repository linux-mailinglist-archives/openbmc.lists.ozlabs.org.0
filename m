Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8B38C9D2
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 17:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmqnS1nrdz3bTh
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 01:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=f/07+yeo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=f/07+yeo; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmqn80NW0z303j
 for <openbmc@lists.ozlabs.org>; Sat, 22 May 2021 01:11:06 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id w1so16600339ybt.1
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knhVeYYDerhRXrtx/BvXkXatZPxOD/Zi/zEjtpcIZyI=;
 b=f/07+yeokuqI5W2Mvd2CwatKiwQFxL+WfFqq9Lf5a7zzcf9lqf0KOPPksrTyERHiPe
 xrbjPzOM2GaXyV3tyTfzFDrcb8XgEpBRy4oUkmMfI9iyxgwRhtzfOkl16ZkhhEC0OAuT
 lh8ylG2SD1be9TkV9jkDQL0Zeq1tMP//kRC2DrDccebx7OdtYD+e8PbtnjuLbItfr+sa
 ZUpIMksdLNOTreGqGAKbsmpNRoZjh0Adxrp/o0obf2K9pM5av/6Ohrw2HEEiqEDsIedM
 ci8lEvWpgfxMIh3phM9e9jC+j8Q8AYlHU6ByeXHuL6CclaMFgb6EiNOH0hR6QHUGsS3V
 qsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knhVeYYDerhRXrtx/BvXkXatZPxOD/Zi/zEjtpcIZyI=;
 b=gZdxgjoRtxO9oZVrCaGliGU1vKqIFhM8S/yL4lW2LYOkH0HIPX6EP7fzGkg4MIeZiX
 f3VbJzfRFmgmppT1zCA0anQesw6QTsRSUFGK0Ihvv5qSNMFBdYuy0zFJhgaX8O603nYJ
 vwnJV8YOx8ilV3n0fPzd4pe5KMbETS2a7gMV9ZcOpAmDvZf3ccK2WSml+YGmXn7ElWRQ
 8ASGMNCzy4gKnl3UFH9FZV/2oQUjMgIPq4p+iYY9QM/CkOw8gpS5vx6JTyDrVYbWMuYV
 0lgtvC+3E0QYyIs+z/xfyflwEsFz3KU9nLZVpY3F8I8fwN4mz2gFe4GdYecwDgjjwA/Y
 cfqA==
X-Gm-Message-State: AOAM531pg3UeckVz5kS2anpZYttHAC4n407SUZ/BOiyDhaeO8urgcByC
 4uqbC8qWxtUrdh75IEZyDWN71/AUQcWptwXppTJL8A==
X-Google-Smtp-Source: ABdhPJzTV2PH2Tx/XX7XjDkUsJqNHFJV7UC/yYpkPVG7Vy+dtafsyDsuPHnvGzDRYvU45BRS9gO3IxYg+URMKrQFzck=
X-Received: by 2002:a25:bc41:: with SMTP id d1mr16675835ybk.67.1621609860252; 
 Fri, 21 May 2021 08:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
In-Reply-To: <20210521061023.4zy5s7fzycz5lppx@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Fri, 21 May 2021 08:10:49 -0700
Message-ID: <CAOLfGj76F6WRRU9kS2eQ=FhM=2GAM6NAiiPiRjucVO1Nupm1ag@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000afb23405c2d877a5"
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
 openbmc@lists.ozlabs.org, a.amelkin@yadro.com, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000afb23405c2d877a5
Content-Type: text/plain; charset="UTF-8"

On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:

> > Hi all,
> >
> > In the previous thread (
> > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > (engineers from Google and Quanta) discussed our attempt to share host
> > serial logs via Redfish, which includes polling logs via LogService and
> > streaming log bytes via EventService (e.g. SSE). We went with the event
> log
> > architecture
> > <
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >
> > and did the implementation.
> >
> > We still want to reuse the phosphor-hostlogger and do some modification.
> We
> > believe it is better to try to reuse existing codes if possible and
> improve
> > them rather than creating new things that have similar functionalities
> (in
> > our case, it is a daemon that could collect logs and persist them).
> I agree, reusing code is a right choice, but only when it is really
> possible.
> For now it looks like you want to remove most of the Hostlogger features to
> transform it from buffer-like to stream-like service.

Hostlogger will still consume bytes from obmc-console-server and persist
logs in files. If the log itself has EOL, it will be splitted in the file
as well.
I thought that is all things we want in the Hostlogger.

> We want to do the following modification in phosphor-hostlogger (from the
> > input and output point of view, just very few things will be changed)
> >
> > 1. One limitation of phosphor-hostlogger is that it will lose data in the
> > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > restarted;
> When BMC goes to reboot it stops all services, at that moment hostlogger
> gets
> a signal and flushes all gathered logs to a file.

Yes, I understand hostlogger registers a sigterm handler. But what if BMC
lost its power before sigterm gets sent? That's what I mean by "force
restart".

> we propose to remove the ring buffer and write to the log file
> as soon as some characters are received.

I am not sure it is a good idea.
> The host can generate a lot of logs, but we have very limited free space.
> In
> addition, such heavy traffic will lead to a quick breakdown of the flash
> (most
> available products are guaranteed to withstand around 100,000 P/E cycles
> only).

I would like to get input from Ed for this point. +Ed Tanous
<edtanous@google.com>.

> This implicitly removes the needs
> > of the ring buffer, and the persistence triggering (host reboot, sigterm,
> > etc) in hostlogger. We believe this keeps the same functionality but
> saves
> > hundreds of lines of codes in phosphor-hostlogger.
> You are suggesting to delete the buffer, DBus watcher, log rotate. How are
> you
> going to keep the same functionality if you remove everything related to
> it?

Log rotation is kept. Ring buffer and DBus watcher are great in the
original design but become unnecessary if we persist logs immediately. Do
we miss
anything that the previous hostlogger provides (transfer bytes from the
unix socket to EOL-separated compressed logs)? I believe in this proposal
we have
less data loss, simpler codes, and make it more performant for Redfish
integration.

On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com> wrote:

> On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> > Hi all,
> >
> > In the previous thread (
> > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> > (engineers from Google and Quanta) discussed our attempt to share host
> > serial logs via Redfish, which includes polling logs via LogService and
> > streaming log bytes via EventService (e.g. SSE). We went with the event
> log
> > architecture
> > <
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >
> > and did the implementation.
> >
> > We still want to reuse the phosphor-hostlogger and do some modification.
> We
> > believe it is better to try to reuse existing codes if possible and
> improve
> > them rather than creating new things that have similar functionalities
> (in
> > our case, it is a daemon that could collect logs and persist them).
>
> I agree, reusing code is a right choice, but only when it is really
> possible.
> For now it looks like you want to remove most of the Hostlogger features to
> transform it from buffer-like to stream-like service.
>
> > We want to do the following modification in phosphor-hostlogger (from the
> > input and output point of view, just very few things will be changed)
> >
> > 1. One limitation of phosphor-hostlogger is that it will lose data in the
> > memory (the ring buffer maintained by hostlogger) when BMC gets force
> > restarted;
>
> When BMC goes to reboot it stops all services, at that moment hostlogger
> gets
> a signal and flushes all gathered logs to a file.
>
> > we propose to remove the ring buffer and write to the log file
> > as soon as some characters are received.
>
> I am not sure it is a good idea.
> The host can generate a lot of logs, but we have very limited free space.
> In
> addition, such heavy traffic will lead to a quick breakdown of the flash
> (most
> available products are guaranteed to withstand around 100,000 P/E cycles
> only).
>
> > This implicitly removes the needs
> > of the ring buffer, and the persistence triggering (host reboot, sigterm,
> > etc) in hostlogger. We believe this keeps the same functionality but
> saves
> > hundreds of lines of codes in phosphor-hostlogger.
>
> You are suggesting to delete the buffer, DBus watcher, log rotate. How are
> you
> going to keep the same functionality if you remove everything related to
> it?
>
> > 2. We propose not to compress the latest log file. This saves us the
> > overhead of doing decompression when BMCWeb just needs to retrieve the
> most
> > recent logs. There are still going to be log rotations in the file level.
> > Files other than the latest log file are still going to be compressed. We
> > can modify existing codes to achieve this or use the linux logrotate
> > directly.
> >
> > Furthermore, we will add host serial logs into BMCWeb, both LogService
> and
> > EventService. In LogService, we will teach BMCWeb how to read the latest
> > log file that is not compressed and the other compressed old logs, and
> how
> > to assemble LogEntries out of raw serial logs. We will discuss
> EventService
> > in future threads but the very initial idea is to setup inotify on log
> > files and SSE to stream out new bytes to clients (like what the existing
> > event logging is doing).
> >
> > As we said above, for phosphor-hostlogger, the input is still the
> > obmc-server unix socket, and the output are still persisted log files.
> But
> > the functionality will get improved (less data loss), code gets
> simplified
> > (no ring buffer and persistence triggering), and it will become easier
> and
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
>

--000000000000afb23405c2d877a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">On T=
hu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:<br></span><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">&gt; Hi all,<br></span><span class=3D"gmail-im" style=3D"=
color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"color:=
rgb(80,0,80)">&gt; In the previous thread (<br></span><span class=3D"gmail-=
im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0<a href=3D"https://lists.ozlabs.=
org/pipermail/openbmc/2021-March/025234.html" rel=3D"noreferrer" target=3D"=
_blank">https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html</=
a>), we<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt=
; (engineers from Google and Quanta) discussed our attempt to share host<br=
></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; serial l=
ogs via Redfish, which includes polling logs via LogService and<br></span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; streaming log byt=
es via EventService (e.g. SSE). We went with the event log<br></span><span =
class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; architecture<br></span=
>&gt; &lt;<a href=3D"https://github.com/openbmc/docs/blob/master/architectu=
re/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcw=
eb.md</a>&gt;<br>&gt; and did the implementation.<br><span class=3D"gmail-i=
m" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" sty=
le=3D"color:rgb(80,0,80)">&gt; We still want to reuse the phosphor-hostlogg=
er and do some modification. We<br></span><span class=3D"gmail-im" style=3D=
"color:rgb(80,0,80)">&gt; believe it is better to try to reuse existing cod=
es if possible and improve<br></span><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80)">&gt; them rather than creating new things that have similar=
 functionalities (in<br></span><span class=3D"gmail-im" style=3D"color:rgb(=
80,0,80)">&gt; our case, it is a daemon that could collect logs and persist=
 them).</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></s=
pan>I agree, reusing code is a right choice, but only when it is really pos=
sible.<br>For now it looks like you want to remove most of the Hostlogger f=
eatures to<br>transform it from buffer-like to stream-like service.</blockq=
uote><div>Hostlogger will still consume bytes from obmc-console-server and =
persist logs in files. If the log itself has EOL, it will be splitted=C2=A0=
in the file as well.=C2=A0</div><div>I thought that is all things we want i=
n the Hostlogger. </div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80=
)"><br></span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; We want to do the following=
 modification in phosphor-hostlogger (from the<br></span><span class=3D"gma=
il-im" style=3D"color:rgb(80,0,80)">&gt; input and output point of view, ju=
st very few things will be changed)<br></span><span class=3D"gmail-im" styl=
e=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"c=
olor:rgb(80,0,80)">&gt; 1. One limitation of phosphor-hostlogger is that it=
 will lose data in the<br></span><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)">&gt; memory (the ring buffer maintained by hostlogger) when BMC=
 gets force<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"=
>&gt; restarted;</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
"><br></span>When BMC goes to reboot it stops all services, at that moment =
hostlogger gets<br>a signal and flushes all gathered logs to a file.</block=
quote><div>Yes, I understand hostlogger registers a sigterm handler. But wh=
at if BMC lost its power before sigterm gets sent? That&#39;s what I mean b=
y &quot;force restart&quot;.</div><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)"><br>&gt; we propose to remove the ring buffer and write to the=
 log file<br>&gt; as soon as some characters are received.<br><br></span><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I am not sure it is a good =
idea.<br>The host can generate a lot of logs, but we have very limited free=
 space. In<br>addition, such heavy traffic will lead to a quick breakdown o=
f the flash (most<br>available products are guaranteed to withstand around =
100,000 P/E cycles only).</blockquote><div>I would like to get input from E=
d for this point.=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" =
href=3D"mailto:edtanous@google.com" tabindex=3D"-1">+Ed Tanous</a>.=C2=A0</=
div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt; This implicitly removes the needs<br></span><s=
pan class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; of the ring buffer=
, and the persistence triggering (host reboot, sigterm,<br></span><span cla=
ss=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; etc) in hostlogger. We be=
lieve this keeps the same functionality but saves<br></span><span class=3D"=
gmail-im" style=3D"color:rgb(80,0,80)">&gt; hundreds of lines of codes in p=
hosphor-hostlogger.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,=
80)"><br></span>You are suggesting to delete the buffer, DBus watcher, log =
rotate. How are you<br>going to keep the same functionality if you remove e=
verything related to it?</blockquote><div>Log rotation is kept. Ring buffer=
 and DBus watcher are great in the original design but become unnecessary i=
f we persist logs immediately. Do we miss</div><div>anything that the previ=
ous hostlogger=C2=A0provides (transfer bytes from the unix socket to EOL-se=
parated compressed logs)? I believe in this proposal we have=C2=A0</div><di=
v>less data loss, simpler codes, and make it more performant for Redfish in=
tegration.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, May 20, 2021 at 11:10 PM Artem Senichev &lt;<=
a href=3D"mailto:artemsen@gmail.com">artemsen@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, May 20, 2021=
 at 04:29:09PM -0700, Nan Zhou wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; In the previous thread (<br>
&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-March/02523=
4.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piper=
mail/openbmc/2021-March/025234.html</a>), we<br>
&gt; (engineers from Google and Quanta) discussed our attempt to share host=
<br>
&gt; serial logs via Redfish, which includes polling logs via LogService an=
d<br>
&gt; streaming log bytes via EventService (e.g. SSE). We went with the even=
t log<br>
&gt; architecture<br>
&gt; &lt;<a href=3D"https://github.com/openbmc/docs/blob/master/architectur=
e/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcwe=
b.md</a>&gt;<br>
&gt; and did the implementation.<br>
&gt; <br>
&gt; We still want to reuse the phosphor-hostlogger and do some modificatio=
n. We<br>
&gt; believe it is better to try to reuse existing codes if possible and im=
prove<br>
&gt; them rather than creating new things that have similar functionalities=
 (in<br>
&gt; our case, it is a daemon that could collect logs and persist them).<br=
>
<br>
I agree, reusing code is a right choice, but only when it is really possibl=
e.<br>
For now it looks like you want to remove most of the Hostlogger features to=
<br>
transform it from buffer-like to stream-like service.<br>
<br>
&gt; We want to do the following modification in phosphor-hostlogger (from =
the<br>
&gt; input and output point of view, just very few things will be changed)<=
br>
&gt; <br>
&gt; 1. One limitation of phosphor-hostlogger is that it will lose data in =
the<br>
&gt; memory (the ring buffer maintained by hostlogger) when BMC gets force<=
br>
&gt; restarted;<br>
<br>
When BMC goes to reboot it stops all services, at that moment hostlogger ge=
ts<br>
a signal and flushes all gathered logs to a file.<br>
<br>
&gt; we propose to remove the ring buffer and write to the log file<br>
&gt; as soon as some characters are received.<br>
<br>
I am not sure it is a good idea.<br>
The host can generate a lot of logs, but we have very limited free space. I=
n<br>
addition, such heavy traffic will lead to a quick breakdown of the flash (m=
ost<br>
available products are guaranteed to withstand around 100,000 P/E cycles on=
ly).<br>
<br>
&gt; This implicitly removes the needs<br>
&gt; of the ring buffer, and the persistence triggering (host reboot, sigte=
rm,<br>
&gt; etc) in hostlogger. We believe this keeps the same functionality but s=
aves<br>
&gt; hundreds of lines of codes in phosphor-hostlogger.<br>
<br>
You are suggesting to delete the buffer, DBus watcher, log rotate. How are =
you<br>
going to keep the same functionality if you remove everything related to it=
?<br>
<br>
&gt; 2. We propose not to compress the latest log file. This saves us the<b=
r>
&gt; overhead of doing decompression when BMCWeb just needs to retrieve the=
 most<br>
&gt; recent logs. There are still going to be log rotations in the file lev=
el.<br>
&gt; Files other than the latest log file are still going to be compressed.=
 We<br>
&gt; can modify existing codes to achieve this or use the linux logrotate<b=
r>
&gt; directly.<br>
&gt; <br>
&gt; Furthermore, we will add host serial logs into BMCWeb, both LogService=
 and<br>
&gt; EventService. In LogService, we will teach BMCWeb how to read the late=
st<br>
&gt; log file that is not compressed and the other compressed old logs, and=
 how<br>
&gt; to assemble LogEntries out of raw serial logs. We will discuss EventSe=
rvice<br>
&gt; in future threads but the very initial idea is to setup inotify on log=
<br>
&gt; files and SSE to stream out new bytes to clients (like what the existi=
ng<br>
&gt; event logging is doing).<br>
&gt; <br>
&gt; As we said above, for phosphor-hostlogger, the input is still the<br>
&gt; obmc-server unix socket, and the output are still persisted log files.=
 But<br>
&gt; the functionality will get improved (less data loss), code gets simpli=
fied<br>
&gt; (no ring buffer and persistence triggering), and it will become easier=
 and<br>
&gt; more performant to get BMCWeb hooked up for log streaming via Redfish.=
<br>
&gt; <br>
&gt; Please let us know what you think. We appreciate any feedback. Thank y=
ou<br>
&gt; very much!<br>
&gt; <br>
&gt; Sincerely,<br>
&gt; Nan<br>
<br>
-- <br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
</blockquote></div>

--000000000000afb23405c2d877a5--
