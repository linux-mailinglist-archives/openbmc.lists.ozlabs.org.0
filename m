Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF90391CE1
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 18:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqx5d11Bgz2ymP
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 02:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=I+gUUaKt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=I+gUUaKt; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqx5K5ZTvz2xfy
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 02:20:51 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id e10so1230964ybb.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r4OeAxeTVYxw0HDsfHLah/gcwmXZ60z9mMig9oc+y9w=;
 b=I+gUUaKtSzIM17m5k/NV4l/6SIZP6i5QGWV51yyoqKY9tAQevgnoDcWbzUlL2MZx61
 lzjRFahOEKRSctpp8MT0iGumHfps8GAmWfxiDtXU1cMYJzwc+Z55vhURm7HW7JuoUBoV
 sd+V0/ZcYtxwjH6gla/Lo3Sp/nciDbvCQZrfDs+t4x05HUsrnkxDLpOhkPf2amJew3X+
 BSL2lw5Y1MIS8nLU9kUCQ27TBNq2ljJJYT1WdJkjyWfxl+zWiGfJZlthTCTpneZpsBnO
 b9xBwxEFcJ48K123t3eWpUTxBjsDz+mQIvDGKmYMkVJlYQuv98xZqwQhpZJ7MyNA4uDG
 bCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4OeAxeTVYxw0HDsfHLah/gcwmXZ60z9mMig9oc+y9w=;
 b=NEcNem3ikTlrXWXTi8KlwU6lNN6vYrHwGGDgqvt3VohemEVbpN3zBsVTwy7XqL2fX4
 4NJpDa4CGgV/H0PkZEf40d20F0zW9WhgC3aOyyQ08LNASSeqSZEHSVn9SOdpBY9ysQHn
 t5G3Poyb1ZFNjJ8EYwN5B63UvgP9YWO9n17q+CgEEb/K2cATJ+KXxwhdtBoYLP/ZEePm
 pH9ek5eg40CCri39igc5Xab1m8h66bsR8itFlzyB19P/IQxYfsyhKo3Znrbgh0Jw617I
 yAla+sY4Uze2ldYkymj0dBKNPNi5HrCVsrm66FW+YdtCXAMOgxl8pbTZ0meO1w1FdxmK
 rtxQ==
X-Gm-Message-State: AOAM533KkZxhCpqpFFtIUYnpVrUGQtfjdQbJKyuprlCJm4W+bfo5BWHQ
 mL7Fcty8FYPMRI5XkIaAz81SVOR2O1p+TNyz1VmYfg==
X-Google-Smtp-Source: ABdhPJyfOkQmaLHajTE4rBBpMTQ//Z4GNP3v5S+Lr2P123erla0bNrabUgY8mbFbwLK+c+tZRQ0BJCAMo/oghI/7ZlQ=
X-Received: by 2002:a25:bdcf:: with SMTP id g15mr50542139ybk.311.1622046048762; 
 Wed, 26 May 2021 09:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
 <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
 <20210526160816.pvpxzwnix3lgwaln@gmail.com>
In-Reply-To: <20210526160816.pvpxzwnix3lgwaln@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 26 May 2021 09:20:38 -0700
Message-ID: <CAOLfGj6WmBxQNm_LDNfW-m5Bs5sndxwoVJ6QupwHo+cvBDL7qA@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008c689105c33e06d0"
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

--0000000000008c689105c33e06d0
Content-Type: text/plain; charset="UTF-8"

>
> > We plan to implement something similar to rotate count
> > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
> basically
> > like a ring buffer in the file system. We keep N log files. The latest
> log
> > file is in plain text and the writer keeps appending data to it. The rest
> > N-1 files are compressed.
> In this case, you will keep full logs without gaps:
> ```
> Host start <- log is empty, start logging
> |
> [...] <- write file, compress and rotate file
> |
> Host reboot or shut down
> ```
> If there are too many logs, logrotate removes the oldest one and we lose
> the
> boot log (form host start).
> This is the default Hostlogger mode:
> ```
> Host start <- log is empty, start logging
> |
> [line 3000] <- flush 3000 lines to the persistent file
> |
> [...] <- these logs are skipped (the last 3000 lines are in memory)
> |
> Host reboot or shut down <- flush last 3000 lines to the file


Thanks for your explanation, but I didn't get it. Are you arguing that one
can keep more logs in memory rather than on disk? If there are too many
logs in a boot cycle, won't the current hostlogger lose some earlier logs
(boot logs) as well? Or did me missing something?

Also, we already talked about it: there's a problem that if BMC loses the
power before it sends out a signal to hostlogger, data in memory won't be
persisted.

On Wed, May 26, 2021 at 9:08 AM Artem Senichev <artemsen@gmail.com> wrote:

> On Wed, May 26, 2021 at 08:17:11AM -0700, Nan Zhou wrote:
> > >
> > > > > > 3. zlib_file.xpp, zlib_exception.xpp:
> > > > > > will be removed or slightly changed; we can potentially use the
> linux
> > > > > > logrotate which has built-in compression and file rotation (in
> this
> > > case
> > > > > > these compression utilities will be removed).
> > > > > > The latest log file isn't compressed any more. History log files
> are
> > > > > > still compressed.
> > > > > Just curious, how are you going to remove the oldest messages from
> the
> > > > > latest file in runtime? You are not going to rewrite the entire
> file on
> > > > > every input character, are you?
> > > >
> > > > The following is my current idea: we will rename the latest file to
> > > > something else and notify the writer (hostlogger) to close its old
> file
> > > > descriptor and open a new one (should be doable via linux logrotate
> and
> > > > inotify or some signal handlers, as logrotate is able to send some
> > > signals
> > > > to hostlogger if a rotation is performed). The writer keeps appending
> > > logs
> > > > most of the time using the same fd unless the latest file is rotated.
> > > This
> > > > should be better than truncating the file where the reader (BMCWeb)
> won't
> > > > have race conditions (it might read old snapshots but it is not a big
> > > deal
> > > > in our case).
> > > Currently we can keep the last N lines of the host's output, the oldest
> > > messages are removed. It is easy to implement with a buffer in memory.
> > > But how are you going to get rid of the old lines if you write data
> > > directly
> > > to the log file?
> > > Rotation will not help you with that (we actually don't need to store
> such
> > > old
> > > logs).
> >
> > We plan to implement something similar to rotate count
> > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
> basically
> > like a ring buffer in the file system. We keep N log files. The latest
> log
> > file is in plain text and the writer keeps appending data to it. The rest
> > N-1 files are compressed.
>
> In this case, you will keep full logs without gaps:
> ```
> Host start <- log is empty, start logging
> |
> [...] <- write file, compress and rotate file
> |
> Host reboot or shut down
> ```
>
> If there are too many logs, logrotate removes the oldest one and we lose
> the
> boot log (form host start).
>
> This is the default Hostlogger mode:
> ```
> Host start <- log is empty, start logging
> |
> [line 3000] <- flush 3000 lines to the persistent file
> |
> [...] <- these logs are skipped (the last 3000 lines are in memory)
> |
> Host reboot or shut down <- flush last 3000 lines to the file
> ```
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>

--0000000000008c689105c33e06d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; We plan to implement som=
ething similar to rotate count<br></span>&gt; &lt;<a href=3D"https://linux.=
die.net/man/8/logrotate" rel=3D"noreferrer" target=3D"_blank">https://linux=
.die.net/man/8/logrotate</a>&gt; in linux logrotate. It is basically<br><sp=
an class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; like a ring buffer =
in the file system. We keep N log files. The latest log<br></span><span cla=
ss=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; file is in plain text and=
 the writer keeps appending data to it. The rest<br></span><span class=3D"g=
mail-im" style=3D"color:rgb(80,0,80)">&gt; N-1 files are compressed.</span>=
<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>In this ca=
se, you will keep full logs without gaps:<br>```<br>Host start &lt;- log is=
 empty, start logging<br>|<br>[...] &lt;- write file, compress and rotate f=
ile<br>|<br>Host reboot or shut down<br>```<br>If there are too many logs, =
logrotate removes the oldest one and we lose the<br>boot log (form host sta=
rt).<br>This is the default Hostlogger mode:<br>```<br>Host start &lt;- log=
 is empty, start logging<br>|<br>[line 3000] &lt;- flush 3000 lines to the =
persistent file<br>|<br>[...] &lt;- these logs are skipped (the last 3000 l=
ines are in memory)<br>|<br>Host reboot or shut down &lt;- flush last 3000 =
lines to the file</blockquote><div><br></div><div>Thanks for your explanati=
on, but I didn&#39;t get it. Are you arguing that one can keep more logs in=
 memory rather than on disk? If there are too many logs in a boot cycle, wo=
n&#39;t the current hostlogger lose some earlier logs (boot logs) as well? =
Or did me missing something?</div><div><br></div><div>Also, we already talk=
ed about it: there&#39;s a problem that if BMC loses the power before it se=
nds out a signal to hostlogger, data in memory won&#39;t be persisted.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, May 26, 2021 at 9:08 AM Artem Senichev &lt;<a href=3D"mailto:artem=
sen@gmail.com">artemsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, May 26, 2021 at 08:17:11AM -0700, =
Nan Zhou wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; 3. zlib_file.xpp, zlib_exception.xpp:<br>
&gt; &gt; &gt; &gt; &gt; will be removed or slightly changed; we can potent=
ially use the linux<br>
&gt; &gt; &gt; &gt; &gt; logrotate which has built-in compression and file =
rotation (in this<br>
&gt; &gt; case<br>
&gt; &gt; &gt; &gt; &gt; these compression utilities will be removed).<br>
&gt; &gt; &gt; &gt; &gt; The latest log file isn&#39;t compressed any more.=
 History log files are<br>
&gt; &gt; &gt; &gt; &gt; still compressed.<br>
&gt; &gt; &gt; &gt; Just curious, how are you going to remove the oldest me=
ssages from the<br>
&gt; &gt; &gt; &gt; latest file in runtime? You are not going to rewrite th=
e entire file on<br>
&gt; &gt; &gt; &gt; every input character, are you?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The following is my current idea: we will rename the latest =
file to<br>
&gt; &gt; &gt; something else and notify the writer (hostlogger) to close i=
ts old file<br>
&gt; &gt; &gt; descriptor and open a new one (should be doable via linux lo=
grotate and<br>
&gt; &gt; &gt; inotify or some signal handlers, as logrotate is able to sen=
d some<br>
&gt; &gt; signals<br>
&gt; &gt; &gt; to hostlogger if a rotation is performed). The writer keeps =
appending<br>
&gt; &gt; logs<br>
&gt; &gt; &gt; most of the time using the same fd unless the latest file is=
 rotated.<br>
&gt; &gt; This<br>
&gt; &gt; &gt; should be better than truncating the file where the reader (=
BMCWeb) won&#39;t<br>
&gt; &gt; &gt; have race conditions (it might read old snapshots but it is =
not a big<br>
&gt; &gt; deal<br>
&gt; &gt; &gt; in our case).<br>
&gt; &gt; Currently we can keep the last N lines of the host&#39;s output, =
the oldest<br>
&gt; &gt; messages are removed. It is easy to implement with a buffer in me=
mory.<br>
&gt; &gt; But how are you going to get rid of the old lines if you write da=
ta<br>
&gt; &gt; directly<br>
&gt; &gt; to the log file?<br>
&gt; &gt; Rotation will not help you with that (we actually don&#39;t need =
to store such<br>
&gt; &gt; old<br>
&gt; &gt; logs).<br>
&gt; <br>
&gt; We plan to implement something similar to rotate count<br>
&gt; &lt;<a href=3D"https://linux.die.net/man/8/logrotate" rel=3D"noreferre=
r" target=3D"_blank">https://linux.die.net/man/8/logrotate</a>&gt; in linux=
 logrotate. It is basically<br>
&gt; like a ring buffer in the file system. We keep N log files. The latest=
 log<br>
&gt; file is in plain text and the writer keeps appending data to it. The r=
est<br>
&gt; N-1 files are compressed.<br>
<br>
In this case, you will keep full logs without gaps:<br>
```<br>
Host start &lt;- log is empty, start logging<br>
|<br>
[...] &lt;- write file, compress and rotate file<br>
|<br>
Host reboot or shut down<br>
```<br>
<br>
If there are too many logs, logrotate removes the oldest one and we lose th=
e<br>
boot log (form host start).<br>
<br>
This is the default Hostlogger mode:<br>
```<br>
Host start &lt;- log is empty, start logging<br>
|<br>
[line 3000] &lt;- flush 3000 lines to the persistent file<br>
|<br>
[...] &lt;- these logs are skipped (the last 3000 lines are in memory)<br>
|<br>
Host reboot or shut down &lt;- flush last 3000 lines to the file<br>
```<br>
<br>
-- <br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
</blockquote></div>

--0000000000008c689105c33e06d0--
