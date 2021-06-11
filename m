Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511833A4A83
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 23:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1tjR5kPnz3c11
	for <lists+openbmc@lfdr.de>; Sat, 12 Jun 2021 07:08:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=kPLkiFcy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kPLkiFcy; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1tj71fptz303F
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jun 2021 07:07:53 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id q21so6147474ybg.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wyyeqAro2zpv2O4OvQGtcxcscjlHJpccDblvLeLMk0g=;
 b=kPLkiFcypZIPQcqqq8r0XUG3CKLcCLb8BgJe+t3NFmDIhbxknfSTCF/BMPXP9wkxF2
 Vsp3IxFEwSA8S1rR4+IcyPjEjW2fHcoMC2yfFUaijq27xkqMTaUyHBivoePPo44QTRKj
 nV8+ShdMT8vEf8hMBM6Rfr9p1wilFi5/CMHysguAgsvdOsgWXAa9pJgt1bL7a4yX9qTo
 oEVkaVLw+RJI21iuK78iF7SLanBmj68DEMhe+bhh2GxCOnlzp02vWLBr8FQttc0Z+FPF
 9+7/Zq3NAaDM7WXtWQ3742NYuVAmesPCY2QXjHxwpbFMGmXchmpe1kc529Vh2qwC+yVa
 PNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wyyeqAro2zpv2O4OvQGtcxcscjlHJpccDblvLeLMk0g=;
 b=U8SCr8xu5EPZ5jIU+CWkBjiSX8uGSXUUddyuaDbTjSTYoZKNidruY+ie4jEzm5C3Fw
 w7oYjz2KBdxA1oN6Y/s9kafFd76VkyhLccD3zqB96v2chRY61eTJzjb39Ki5J4YAKezI
 IPp9pfx+HZOTsaeW0JNjcnk4zm1ihiOpBscfgxax6tCXbXSXBt1L7D731UrqCxnWABuu
 ZajqdFitZ7UTFOX2wQj9h47+45lopBZ5NYWcV1f2d0HVp5METYcc5YjB/pklo6PAvDgn
 QZG7GJ94uyGBQFT1XlUPzLcWiFPeC0YBklpPsq7+C6hBkfDgWBXQylvh30o3VyPsD6i+
 lYjA==
X-Gm-Message-State: AOAM530b4w0kcOh/8ACmVVJ4CKtt9mz4YPIHj8hmLyzLnSu+lBibtxwd
 FvKEW+isjzP0YXLVMLUaD5oPUJbXWzsmAUeZaX2bpg==
X-Google-Smtp-Source: ABdhPJwvsgrne9S/Tpxl9buzY9cBssLc0T8AFxz4+ygMA7pTCi9LK2/wRUkH5mtjOMOqG4ch7II0TpR5k/m5ULClaYg=
X-Received: by 2002:a25:d241:: with SMTP id j62mr8145133ybg.396.1623445667601; 
 Fri, 11 Jun 2021 14:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
 <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
 <20210526160816.pvpxzwnix3lgwaln@gmail.com>
 <CAOLfGj6WmBxQNm_LDNfW-m5Bs5sndxwoVJ6QupwHo+cvBDL7qA@mail.gmail.com>
 <20210526182153.xcbs5dp6sprzv7u2@gmail.com>
 <CAOLfGj6Sn77vH-TrE-GmHrYCJ7AMHs2zr0HR_yJrES1qX_buow@mail.gmail.com>
 <CAH2-KxC8jkKMXmHa=9SsLBFORbHbsJ2DUTPhoCLp_0uam0q8tA@mail.gmail.com>
In-Reply-To: <CAH2-KxC8jkKMXmHa=9SsLBFORbHbsJ2DUTPhoCLp_0uam0q8tA@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Fri, 11 Jun 2021 14:07:36 -0700
Message-ID: <CAOLfGj7d=VmXrXXd09nW==1Th5OCiP0nyfWbUbYDssRJ94Os-g@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="00000000000054bf5205c483e6ea"
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

--00000000000054bf5205c483e6ea
Content-Type: text/plain; charset="UTF-8"

>
> >
> >> > Or did me missing something?
> >> >
> >> > Also, we already talked about it: there's a problem that if BMC loses
> the
> >> > power before it sends out a signal to hostlogger, data in memory
> won't be
> >> > persisted.
> >> Yes, I agree that this is a problem. But there are ways to fix it
> without
> >> breaking the current functionality of Hostlogger.
> >> We can use rsyslog with external log server, or increase the buffer size
> >> in obmc-console-server, or use systemd-cat with logrotate.
> >> We can even add a new mode to Hostlogger that will not use the buffer,
> but
> >> as I said earlier, there are not many common parts.
> >
> > I guess you are arguing we need a new daemon rather than modify
> Hostlogger, right? +Ed Tanous here to see what his opinion is.
> If Nans use case is in fact totally different, and can't be handled in
> the same application I think that's ok, but I'd like to see the new
> application put in the hostlogger repo so it can share the routines
> that are common (things like finding and opening the unix socket,
> managing the reads, and the zlib integration) and to ensure that users
> find it when searching for code that solves this problem, as on the
> outset they're pretty similar, just with seemingly different rules.
> If we don't put it there, it seems like we'd have to duplicate a lot
> of code.

Thanks a lot for the previous discussion. Following up on this, is it
acceptable if we add a new application (it will be a new binary + a new
systemd service config) in the hostlogger repo to support the stream
application? We can add options to control whether to turn on this new
stream application. In this way, existing applications stay unchanged. As
Ed said, we could use codes that deal with unix sockets and reads. It
should also make sense that console codes are put together in the
same place.

Please let us know what you think. Your confirmation will be very valuable
and will unblock our development.

On Fri, Jun 11, 2021 at 11:31 AM Ed Tanous <edtanous@google.com> wrote:

> On Wed, May 26, 2021 at 12:21 PM Nan Zhou <nanzhou@google.com> wrote:
> >>
> >> > If there are too many logs in a boot cycle, won't the current
> hostlogger
> >> > lose some earlier logs (boot logs) as well?
> >> That's the point!
> >> Hostlogger does not lose these logs. It writes the boot messages, then
> skips
> >> the middle and writes the last 3000 lines when the host shuts down.
> >> We have two log files per host session: start and end.
> >> It is too expensive to store all host output, so mid-session messages
> are
> >> skipped.
> >> It can be easily implemented with a buffer, but I am not sure we can
> achieve
> >> this with logrotate.
> >
> > Thanks for the information. I am not aware of this functionality in the
> current hostlogger. Are you saying it will be implemented in the future or
> I miss it in the current codes.
> > One of our options for log rotations is writing our own codes, I am sure
> we can implement the logic you mentioned above without too much effort.
> > The linux logrotate also has "prerotate scripts", we can carefully name
> the compressed log file and keep the oldest several ones (which have host
> boot logs) out of rotation.
>
> For what it's worth, I don't know if we have to use logrotate
> as-written if it's not a good fit here, but that style of writing to
> disk makes for easily tail-able logs, and has pretty well defined
> behavior for log rotation.  If we could keep the behavior (or the
> behavior + rotating on boot events), even if we didn't use logrotate
> itself, I think it would be a benefit to this.
>
> >
> >> > Or did me missing something?
> >> >
> >> > Also, we already talked about it: there's a problem that if BMC loses
> the
> >> > power before it sends out a signal to hostlogger, data in memory
> won't be
> >> > persisted.
> >> Yes, I agree that this is a problem. But there are ways to fix it
> without
> >> breaking the current functionality of Hostlogger.
> >> We can use rsyslog with external log server, or increase the buffer size
> >> in obmc-console-server, or use systemd-cat with logrotate.
> >> We can even add a new mode to Hostlogger that will not use the buffer,
> but
> >> as I said earlier, there are not many common parts.
> >
> > I guess you are arguing we need a new daemon rather than modify
> Hostlogger, right? +Ed Tanous here to see what his opinion is.
>
> If Nans use case is in fact totally different, and can't be handled in
> the same application I think that's ok, but I'd like to see the new
> application put in the hostlogger repo so it can share the routines
> that are common (things like finding and opening the unix socket,
> managing the reads, and the zlib integration) and to ensure that users
> find it when searching for code that solves this problem, as on the
> outset they're pretty similar, just with seemingly different rules.
> If we don't put it there, it seems like we'd have to duplicate a lot
> of code.
>
> >
> > On Wed, May 26, 2021 at 11:22 AM Artem Senichev <artemsen@gmail.com>
> wrote:
> >>
> >> On Wed, May 26, 2021 at 09:20:38AM -0700, Nan Zhou wrote:
> >> > >
> >> > > > We plan to implement something similar to rotate count
> >> > > > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
> >> > > basically
> >> > > > like a ring buffer in the file system. We keep N log files. The
> latest
> >> > > log
> >> > > > file is in plain text and the writer keeps appending data to it.
> The rest
> >> > > > N-1 files are compressed.
> >> > > In this case, you will keep full logs without gaps:
> >> > > ```
> >> > > Host start <- log is empty, start logging
> >> > > |
> >> > > [...] <- write file, compress and rotate file
> >> > > |
> >> > > Host reboot or shut down
> >> > > ```
> >> > > If there are too many logs, logrotate removes the oldest one and we
> lose
> >> > > the
> >> > > boot log (form host start).
> >> > > This is the default Hostlogger mode:
> >> > > ```
> >> > > Host start <- log is empty, start logging
> >> > > |
> >> > > [line 3000] <- flush 3000 lines to the persistent file
> >> > > |
> >> > > [...] <- these logs are skipped (the last 3000 lines are in memory)
> >> > > |
> >> > > Host reboot or shut down <- flush last 3000 lines to the file
> >> >
> >> >
> >> > Thanks for your explanation, but I didn't get it. Are you arguing
> that one
> >> > can keep more logs in memory rather than on disk?
> >>
> >> Of course not! =)
> >>
> >> > If there are too many logs in a boot cycle, won't the current
> hostlogger
> >> > lose some earlier logs (boot logs) as well?
> >>
> >> That's the point!
> >> Hostlogger does not lose these logs. It writes the boot messages, then
> skips
> >> the middle and writes the last 3000 lines when the host shuts down.
> >> We have two log files per host session: start and end.
> >> It is too expensive to store all host output, so mid-session messages
> are
> >> skipped.
> >> It can be easily implemented with a buffer, but I am not sure we can
> achieve
> >> this with logrotate.
> >>
> >> > Or did me missing something?
> >> >
> >> > Also, we already talked about it: there's a problem that if BMC loses
> the
> >> > power before it sends out a signal to hostlogger, data in memory
> won't be
> >> > persisted.
> >>
> >> Yes, I agree that this is a problem. But there are ways to fix it
> without
> >> breaking the current functionality of Hostlogger.
> >> We can use rsyslog with external log server, or increase the buffer size
> >> in obmc-console-server, or use systemd-cat with logrotate.
> >> We can even add a new mode to Hostlogger that will not use the buffer,
> but
> >> as I said earlier, there are not many common parts.
> >>
> >> --
> >> Regards,
> >> Artem Senichev
> >> Software Engineer, YADRO.
>

--00000000000054bf5205c483e6ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D=
"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; &gt; Or did me missing som=
ething?<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt=
;&gt; &gt;<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">=
&gt;&gt; &gt; Also, we already talked about it: there&#39;s a problem that =
if BMC loses the<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0=
,80)">&gt;&gt; &gt; power before it sends out a signal to hostlogger, data =
in memory won&#39;t be<br></span><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)">&gt;&gt; &gt; persisted.<br></span><span class=3D"gmail-im" sty=
le=3D"color:rgb(80,0,80)">&gt;&gt; Yes, I agree that this is a problem. But=
 there are ways to fix it without<br></span><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt;&gt; breaking the current functionality of Host=
logger.<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt=
;&gt; We can use rsyslog with external log server, or increase the buffer s=
ize<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt=
; in obmc-console-server, or use systemd-cat with logrotate.<br></span><spa=
n class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; We can even add =
a new mode to Hostlogger that will not use the buffer, but<br></span><span =
class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; as I said earlier,=
 there are not many common parts.<br></span><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">&gt; I guess you are arguing we need a new daemon rather =
than modify Hostlogger, right? +Ed Tanous here to see what his opinion is.<=
/span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>If N=
ans use case is in fact totally different, and can&#39;t be handled in<br>t=
he same application I think that&#39;s ok, but I&#39;d like to see the new<=
br>application put in the hostlogger repo so it can share the routines<br>t=
hat are common (things like finding and opening the unix socket,<br>managin=
g the reads, and the zlib integration) and to ensure that users<br>find it =
when searching for code that solves this problem, as on the<br>outset they&=
#39;re pretty similar, just with seemingly different rules.<br>If we don&#3=
9;t put it there, it seems like we&#39;d have to duplicate a lot<br>of code=
.</blockquote><div>Thanks a lot for the previous discussion. Following up o=
n this, is it acceptable if we add a new application (it will be a new bina=
ry + a new systemd service config) in the hostlogger=C2=A0repo to support t=
he stream application? We can add options to control whether to turn on thi=
s new stream application. In this way, existing applications stay unchanged=
. As Ed said, we could use codes that deal with unix sockets and reads. It =
should also make sense that console=C2=A0codes are put together in the same=
=C2=A0place.</div><div><br></div><div>Please let us know what you think. Yo=
ur confirmation will be very valuable and will unblock our development.=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Jun 11, 2021 at 11:31 AM Ed Tanous &lt;<a href=3D"mailto:e=
dtanous@google.com">edtanous@google.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed, May 26, 2021 at 12:21 PM Nan=
 Zhou &lt;<a href=3D"mailto:nanzhou@google.com" target=3D"_blank">nanzhou@g=
oogle.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; If there are too many logs in a boot cycle, won&#39;t the cur=
rent hostlogger<br>
&gt;&gt; &gt; lose some earlier logs (boot logs) as well?<br>
&gt;&gt; That&#39;s the point!<br>
&gt;&gt; Hostlogger does not lose these logs. It writes the boot messages, =
then skips<br>
&gt;&gt; the middle and writes the last 3000 lines when the host shuts down=
.<br>
&gt;&gt; We have two log files per host session: start and end.<br>
&gt;&gt; It is too expensive to store all host output, so mid-session messa=
ges are<br>
&gt;&gt; skipped.<br>
&gt;&gt; It can be easily implemented with a buffer, but I am not sure we c=
an achieve<br>
&gt;&gt; this with logrotate.<br>
&gt;<br>
&gt; Thanks for the information. I am not aware of this functionality in th=
e current hostlogger. Are you saying it will be implemented in the future o=
r I miss it in the current codes.<br>
&gt; One of our options for log rotations is writing our own codes, I am su=
re we can implement the logic you mentioned above without too much effort.<=
br>
&gt; The linux logrotate also has &quot;prerotate scripts&quot;, we can car=
efully name the compressed log file and keep the oldest several ones (which=
 have host boot logs) out of rotation.<br>
<br>
For what it&#39;s worth, I don&#39;t know if we have to use logrotate<br>
as-written if it&#39;s not a good fit here, but that style of writing to<br=
>
disk makes for easily tail-able logs, and has pretty well defined<br>
behavior for log rotation.=C2=A0 If we could keep the behavior (or the<br>
behavior + rotating on boot events), even if we didn&#39;t use logrotate<br=
>
itself, I think it would be a benefit to this.<br>
<br>
&gt;<br>
&gt;&gt; &gt; Or did me missing something?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also, we already talked about it: there&#39;s a problem that =
if BMC loses the<br>
&gt;&gt; &gt; power before it sends out a signal to hostlogger, data in mem=
ory won&#39;t be<br>
&gt;&gt; &gt; persisted.<br>
&gt;&gt; Yes, I agree that this is a problem. But there are ways to fix it =
without<br>
&gt;&gt; breaking the current functionality of Hostlogger.<br>
&gt;&gt; We can use rsyslog with external log server, or increase the buffe=
r size<br>
&gt;&gt; in obmc-console-server, or use systemd-cat with logrotate.<br>
&gt;&gt; We can even add a new mode to Hostlogger that will not use the buf=
fer, but<br>
&gt;&gt; as I said earlier, there are not many common parts.<br>
&gt;<br>
&gt; I guess you are arguing we need a new daemon rather than modify Hostlo=
gger, right? +Ed Tanous here to see what his opinion is.<br>
<br>
If Nans use case is in fact totally different, and can&#39;t be handled in<=
br>
the same application I think that&#39;s ok, but I&#39;d like to see the new=
<br>
application put in the hostlogger repo so it can share the routines<br>
that are common (things like finding and opening the unix socket,<br>
managing the reads, and the zlib integration) and to ensure that users<br>
find it when searching for code that solves this problem, as on the<br>
outset they&#39;re pretty similar, just with seemingly different rules.<br>
If we don&#39;t put it there, it seems like we&#39;d have to duplicate a lo=
t<br>
of code.<br>
<br>
&gt;<br>
&gt; On Wed, May 26, 2021 at 11:22 AM Artem Senichev &lt;<a href=3D"mailto:=
artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 26, 2021 at 09:20:38AM -0700, Nan Zhou wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; We plan to implement something similar to rotate co=
unt<br>
&gt;&gt; &gt; &gt; &gt; &lt;<a href=3D"https://linux.die.net/man/8/logrotat=
e" rel=3D"noreferrer" target=3D"_blank">https://linux.die.net/man/8/logrota=
te</a>&gt; in linux logrotate. It is<br>
&gt;&gt; &gt; &gt; basically<br>
&gt;&gt; &gt; &gt; &gt; like a ring buffer in the file system. We keep N lo=
g files. The latest<br>
&gt;&gt; &gt; &gt; log<br>
&gt;&gt; &gt; &gt; &gt; file is in plain text and the writer keeps appendin=
g data to it. The rest<br>
&gt;&gt; &gt; &gt; &gt; N-1 files are compressed.<br>
&gt;&gt; &gt; &gt; In this case, you will keep full logs without gaps:<br>
&gt;&gt; &gt; &gt; ```<br>
&gt;&gt; &gt; &gt; Host start &lt;- log is empty, start logging<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; [...] &lt;- write file, compress and rotate file<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; Host reboot or shut down<br>
&gt;&gt; &gt; &gt; ```<br>
&gt;&gt; &gt; &gt; If there are too many logs, logrotate removes the oldest=
 one and we lose<br>
&gt;&gt; &gt; &gt; the<br>
&gt;&gt; &gt; &gt; boot log (form host start).<br>
&gt;&gt; &gt; &gt; This is the default Hostlogger mode:<br>
&gt;&gt; &gt; &gt; ```<br>
&gt;&gt; &gt; &gt; Host start &lt;- log is empty, start logging<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; [line 3000] &lt;- flush 3000 lines to the persistent fil=
e<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; [...] &lt;- these logs are skipped (the last 3000 lines =
are in memory)<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; Host reboot or shut down &lt;- flush last 3000 lines to =
the file<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for your explanation, but I didn&#39;t get it. Are you=
 arguing that one<br>
&gt;&gt; &gt; can keep more logs in memory rather than on disk?<br>
&gt;&gt;<br>
&gt;&gt; Of course not! =3D)<br>
&gt;&gt;<br>
&gt;&gt; &gt; If there are too many logs in a boot cycle, won&#39;t the cur=
rent hostlogger<br>
&gt;&gt; &gt; lose some earlier logs (boot logs) as well?<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s the point!<br>
&gt;&gt; Hostlogger does not lose these logs. It writes the boot messages, =
then skips<br>
&gt;&gt; the middle and writes the last 3000 lines when the host shuts down=
.<br>
&gt;&gt; We have two log files per host session: start and end.<br>
&gt;&gt; It is too expensive to store all host output, so mid-session messa=
ges are<br>
&gt;&gt; skipped.<br>
&gt;&gt; It can be easily implemented with a buffer, but I am not sure we c=
an achieve<br>
&gt;&gt; this with logrotate.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Or did me missing something?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also, we already talked about it: there&#39;s a problem that =
if BMC loses the<br>
&gt;&gt; &gt; power before it sends out a signal to hostlogger, data in mem=
ory won&#39;t be<br>
&gt;&gt; &gt; persisted.<br>
&gt;&gt;<br>
&gt;&gt; Yes, I agree that this is a problem. But there are ways to fix it =
without<br>
&gt;&gt; breaking the current functionality of Hostlogger.<br>
&gt;&gt; We can use rsyslog with external log server, or increase the buffe=
r size<br>
&gt;&gt; in obmc-console-server, or use systemd-cat with logrotate.<br>
&gt;&gt; We can even add a new mode to Hostlogger that will not use the buf=
fer, but<br>
&gt;&gt; as I said earlier, there are not many common parts.<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Regards,<br>
&gt;&gt; Artem Senichev<br>
&gt;&gt; Software Engineer, YADRO.<br>
</blockquote></div>

--00000000000054bf5205c483e6ea--
