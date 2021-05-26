Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4993920C5
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr15y5v5fz301X
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 05:21:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=TOvjYMKf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TOvjYMKf; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr15j19cFz2xtl
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 05:21:26 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id y197so3598961ybe.11
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ibxdOFAJTn/oJnNhHpAn8QFWziopGqDms3rpXurLrQc=;
 b=TOvjYMKfsXEr4x8SCdHyWulR9vDPeeWv6qEvlveW24XDR+Zdqz0GoFQxrE6z4Kq7da
 qc0L99bMft/ic+B9cYZ1tnbKW0jwk4LA/BXHywlyUW21XrtYdhxqGhhN0cB/1Qgqf0yV
 qHZX7KHq0CHgDSbPaemmPfW6+Ld9ji/FRR18qTSZH3KsJZ+3MUMQMTxZ+9TyuTuY/Nos
 qULctc+SWqBre2mMaFm45XgYzhlI8t+EltFDqAxsPk/TPWlUrmTB6JfOqudoXaHxyw9i
 zbEi/LQi6Fw38RI6Uo4y0rlwA8aA4uogNVtxv/MtbEe7V9U30cifWIBkb9VoVQhY0QPE
 WWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibxdOFAJTn/oJnNhHpAn8QFWziopGqDms3rpXurLrQc=;
 b=uoRemDHk53AElJyxPeEFVRNTzmRBEKCG0d72u2m9Xfvn1hhcUUS2O/CQj8SwivyG/s
 YqS77MCWkmDCYRTcufJ+m5F9s9X0stdsflcQLOPlhEOCgqCway68Gt1nWumcwQ67A88u
 pVJ3F3E8L9lwHhP4+4O5iQUmLIKfHKxHMr1ODwgIb0ZEm+6y+6XdKgDmM5a8g4cCHZA8
 dLlFMswqBt+WKQyYBVW6WCgzK02FoPDtQpS9pTiQCQTfpZVk/GzeGrgeDIqiTh1bTMJp
 bCJv8VpuS/FCWBVOZIUaMsCMXLv7cswtEQkyDY5wuCV/jdtElAKX7Awn6JGrYaXMRxQm
 8pkA==
X-Gm-Message-State: AOAM532uzkeL4J2wz1yGRFhPvGICVXkvjyWpPs/CjtJOde8gdbEn2qoj
 tI1V7sQXcN4q2KGaMa8aW7YVDzE7EXANzAxAfM85sw==
X-Google-Smtp-Source: ABdhPJwXhbXQDUFU3fEswNH+9Mjq0skjbZ/BPlpymj4MgxZMZhn4+Et8GtPKoUELH5ZX1ZrJaGAz/1b96w1sGcNsryk=
X-Received: by 2002:a25:bdcf:: with SMTP id g15mr51637808ybk.311.1622056881190; 
 Wed, 26 May 2021 12:21:21 -0700 (PDT)
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
In-Reply-To: <20210526182153.xcbs5dp6sprzv7u2@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 26 May 2021 12:21:10 -0700
Message-ID: <CAOLfGj6Sn77vH-TrE-GmHrYCJ7AMHs2zr0HR_yJrES1qX_buow@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000035e14505c3408cd1"
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

--00000000000035e14505c3408cd1
Content-Type: text/plain; charset="UTF-8"

>
> > If there are too many logs in a boot cycle, won't the current hostlogger
> > lose some earlier logs (boot logs) as well?
> That's the point!
> Hostlogger does not lose these logs. It writes the boot messages, then
> skips
> the middle and writes the last 3000 lines when the host shuts down.
> We have two log files per host session: start and end.
> It is too expensive to store all host output, so mid-session messages are
> skipped.
> It can be easily implemented with a buffer, but I am not sure we can
> achieve
> this with logrotate.

Thanks for the information. I am not aware of this functionality in the
current hostlogger. Are you saying it will be implemented in the future or
I miss it in the current codes.
One of our options for log rotations is writing our own codes, I am sure we
can implement the logic you mentioned above without too much effort.
The linux logrotate also has "prerotate scripts", we can carefully name the
compressed log file and keep the oldest several ones (which have host boot
logs) out of rotation.

> Or did me missing something?
> >
> > Also, we already talked about it: there's a problem that if BMC loses the
> > power before it sends out a signal to hostlogger, data in memory won't be
> > persisted.
> Yes, I agree that this is a problem. But there are ways to fix it without
> breaking the current functionality of Hostlogger.
> We can use rsyslog with external log server, or increase the buffer size
> in obmc-console-server, or use systemd-cat with logrotate.
> We can even add a new mode to Hostlogger that will not use the buffer, but
> as I said earlier, there are not many common parts.

I guess you are arguing we need a new daemon rather than modify Hostlogger,
right? +Ed Tanous <edtanous@google.com> here to see what his opinion is.

On Wed, May 26, 2021 at 11:22 AM Artem Senichev <artemsen@gmail.com> wrote:

> On Wed, May 26, 2021 at 09:20:38AM -0700, Nan Zhou wrote:
> > >
> > > > We plan to implement something similar to rotate count
> > > > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
> > > basically
> > > > like a ring buffer in the file system. We keep N log files. The
> latest
> > > log
> > > > file is in plain text and the writer keeps appending data to it. The
> rest
> > > > N-1 files are compressed.
> > > In this case, you will keep full logs without gaps:
> > > ```
> > > Host start <- log is empty, start logging
> > > |
> > > [...] <- write file, compress and rotate file
> > > |
> > > Host reboot or shut down
> > > ```
> > > If there are too many logs, logrotate removes the oldest one and we
> lose
> > > the
> > > boot log (form host start).
> > > This is the default Hostlogger mode:
> > > ```
> > > Host start <- log is empty, start logging
> > > |
> > > [line 3000] <- flush 3000 lines to the persistent file
> > > |
> > > [...] <- these logs are skipped (the last 3000 lines are in memory)
> > > |
> > > Host reboot or shut down <- flush last 3000 lines to the file
> >
> >
> > Thanks for your explanation, but I didn't get it. Are you arguing that
> one
> > can keep more logs in memory rather than on disk?
>
> Of course not! =)
>
> > If there are too many logs in a boot cycle, won't the current hostlogger
> > lose some earlier logs (boot logs) as well?
>
> That's the point!
> Hostlogger does not lose these logs. It writes the boot messages, then
> skips
> the middle and writes the last 3000 lines when the host shuts down.
> We have two log files per host session: start and end.
> It is too expensive to store all host output, so mid-session messages are
> skipped.
> It can be easily implemented with a buffer, but I am not sure we can
> achieve
> this with logrotate.
>
> > Or did me missing something?
> >
> > Also, we already talked about it: there's a problem that if BMC loses the
> > power before it sends out a signal to hostlogger, data in memory won't be
> > persisted.
>
> Yes, I agree that this is a problem. But there are ways to fix it without
> breaking the current functionality of Hostlogger.
> We can use rsyslog with external log server, or increase the buffer size
> in obmc-console-server, or use systemd-cat with logrotate.
> We can even add a new mode to Hostlogger that will not use the buffer, but
> as I said earlier, there are not many common parts.
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>

--00000000000035e14505c3408cd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; If there are too many lo=
gs in a boot cycle, won&#39;t the current hostlogger<br></span><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; lose some earlier logs (boo=
t logs) as well?</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
"><br></span>That&#39;s the point!<br>Hostlogger does not lose these logs. =
It writes the boot messages, then skips<br>the middle and writes the last 3=
000 lines when the host shuts down.<br>We have two log files per host sessi=
on: start and end.<br>It is too expensive to store all host output, so mid-=
session messages are<br>skipped.<br>It can be easily implemented with a buf=
fer, but I am not sure we can achieve<br>this with logrotate.</blockquote><=
div>Thanks for the information. I am not aware of this functionality in the=
 current hostlogger. Are you saying it will be implemented in the future or=
 I miss it in the current codes.</div><div>One of our options for log rotat=
ions is writing our own codes, I am sure we can implement the=C2=A0logic yo=
u mentioned above without too much effort.</div><div>The linux logrotate al=
so has &quot;prerotate scripts&quot;, we can carefully name the compressed =
log file and keep the oldest=C2=A0several=C2=A0ones (which have host boot l=
ogs) out of rotation.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=
 Or did me missing something?<br></span><span class=3D"gmail-im" style=3D"c=
olor:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; Also, we already talked about it: there&#39;s a problem t=
hat if BMC loses the<br></span><span class=3D"gmail-im" style=3D"color:rgb(=
80,0,80)">&gt; power before it sends out a signal to hostlogger, data in me=
mory won&#39;t be<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,=
0,80)">&gt; persisted.</span><span class=3D"gmail-im" style=3D"color:rgb(80=
,0,80)"><br></span>Yes, I agree that this is a problem. But there are ways =
to fix it without<br>breaking the current functionality of Hostlogger.<br>W=
e can use rsyslog with external log server, or increase the buffer size<br>=
in obmc-console-server, or use systemd-cat with logrotate.<br>We can even a=
dd a new mode to Hostlogger that will not use the buffer, but<br>as I said =
earlier, there are not many common parts.</blockquote><div>I guess you are =
arguing we need a new daemon rather than modify Hostlogger, right?=C2=A0<a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-2" href=3D"mailto:edtanous@go=
ogle.com" tabindex=3D"-1">+Ed Tanous</a>=C2=A0here to see what his opinion =
is.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, May 26, 2021 at 11:22 AM Artem Senichev &lt;<a href=3D"mai=
lto:artemsen@gmail.com">artemsen@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Wed, May 26, 2021 at 09:20:38A=
M -0700, Nan Zhou wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; We plan to implement something similar to rotate count<br>
&gt; &gt; &gt; &lt;<a href=3D"https://linux.die.net/man/8/logrotate" rel=3D=
"noreferrer" target=3D"_blank">https://linux.die.net/man/8/logrotate</a>&gt=
; in linux logrotate. It is<br>
&gt; &gt; basically<br>
&gt; &gt; &gt; like a ring buffer in the file system. We keep N log files. =
The latest<br>
&gt; &gt; log<br>
&gt; &gt; &gt; file is in plain text and the writer keeps appending data to=
 it. The rest<br>
&gt; &gt; &gt; N-1 files are compressed.<br>
&gt; &gt; In this case, you will keep full logs without gaps:<br>
&gt; &gt; ```<br>
&gt; &gt; Host start &lt;- log is empty, start logging<br>
&gt; &gt; |<br>
&gt; &gt; [...] &lt;- write file, compress and rotate file<br>
&gt; &gt; |<br>
&gt; &gt; Host reboot or shut down<br>
&gt; &gt; ```<br>
&gt; &gt; If there are too many logs, logrotate removes the oldest one and =
we lose<br>
&gt; &gt; the<br>
&gt; &gt; boot log (form host start).<br>
&gt; &gt; This is the default Hostlogger mode:<br>
&gt; &gt; ```<br>
&gt; &gt; Host start &lt;- log is empty, start logging<br>
&gt; &gt; |<br>
&gt; &gt; [line 3000] &lt;- flush 3000 lines to the persistent file<br>
&gt; &gt; |<br>
&gt; &gt; [...] &lt;- these logs are skipped (the last 3000 lines are in me=
mory)<br>
&gt; &gt; |<br>
&gt; &gt; Host reboot or shut down &lt;- flush last 3000 lines to the file<=
br>
&gt; <br>
&gt; <br>
&gt; Thanks for your explanation, but I didn&#39;t get it. Are you arguing =
that one<br>
&gt; can keep more logs in memory rather than on disk?<br>
<br>
Of course not! =3D)<br>
<br>
&gt; If there are too many logs in a boot cycle, won&#39;t the current host=
logger<br>
&gt; lose some earlier logs (boot logs) as well?<br>
<br>
That&#39;s the point!<br>
Hostlogger does not lose these logs. It writes the boot messages, then skip=
s<br>
the middle and writes the last 3000 lines when the host shuts down.<br>
We have two log files per host session: start and end.<br>
It is too expensive to store all host output, so mid-session messages are<b=
r>
skipped.<br>
It can be easily implemented with a buffer, but I am not sure we can achiev=
e<br>
this with logrotate.<br>
<br>
&gt; Or did me missing something?<br>
&gt; <br>
&gt; Also, we already talked about it: there&#39;s a problem that if BMC lo=
ses the<br>
&gt; power before it sends out a signal to hostlogger, data in memory won&#=
39;t be<br>
&gt; persisted.<br>
<br>
Yes, I agree that this is a problem. But there are ways to fix it without<b=
r>
breaking the current functionality of Hostlogger.<br>
We can use rsyslog with external log server, or increase the buffer size<br=
>
in obmc-console-server, or use systemd-cat with logrotate.<br>
We can even add a new mode to Hostlogger that will not use the buffer, but<=
br>
as I said earlier, there are not many common parts. <br>
<br>
-- <br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
</blockquote></div>

--00000000000035e14505c3408cd1--
