Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95491391B80
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 17:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqvhS4BgGz302y
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 01:17:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=s/H8agRo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=s/H8agRo; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqvh86hLcz2xvQ
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 01:17:26 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id i4so2557513ybe.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3le2RFJ5D8hcofeIpe3pICJhNQ7Zv/+6RdEbPKcK9rc=;
 b=s/H8agRo5eAuJF1dobiiyrSRz8EINXSON8N6nY5XcCaAhINxjqQKfTclaMS40jMEGu
 q/02bMdkLcqusw3KxUQNaojF+swK9y9PfzWydtzbHymEUZUWbzhKb+DPqn8Pez86rWOR
 Y9AQV28j+9ThZe3VuME/kLZo4lyI07iYFctBuH83XCkaAivFjy6vpYJCQLn2MmWISpJ0
 exICc75xROahYzAKD225DhTv53ViwRnQfix9TiNctb7UoDmfhhgPUHRZrNkVJ6+u3OI2
 LPd0QmjzDlKetw0YI9BJa4eLek4fYHVU1EC77yH85NA/adJPSNwhHx7Z2P4Yate3oRtO
 fUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3le2RFJ5D8hcofeIpe3pICJhNQ7Zv/+6RdEbPKcK9rc=;
 b=pLfdWH0G8IR612ayv5h1KLv55BcRc9s9mxmJEQ1oyY1R1n6+ntOwBAs2bUUZeQwz7O
 WTNTNI8e0FLa56FQoy6TiJRcARb9eztm2xmS3FkYO/Qt3ZIfadbFd439/GWglCAIwPt+
 LeDannma7Iw2+LiXQgHZwbjS8d4EuLwe6PiRxzmYJBIsar20G6Z7nCtAGUPA3MLQarqE
 YtsdYdZwzAS41BLoZJFm+ZfXhbkXhMOiCuvEWVMP/xxw8eJej3+c01ddxESoxJLRZJLj
 Zn+c3ZYr8GNrtB5FuNw+ARfm3uBVlwX/Acp/7sSlyZK7IbkOMYj7gfpHN+l3gW1FeuYo
 /h3Q==
X-Gm-Message-State: AOAM531UXmCDlmEMzgPHpWbVlackRLgUlI6VooPQGGb6ulQsbT9C33aL
 1mginGfwJfGNfSK/jvYAHq9H/qfTgfRJGOU166czvg==
X-Google-Smtp-Source: ABdhPJyN4TSLQfz1tJ5DVu0XRe5hyGvhtgxyNl/XfGPPTWjI9tbFYJg1/vrQ9ARFJbMu9jDS5oz9sgkDvJWkmKcSfNQ=
X-Received: by 2002:a5b:612:: with SMTP id d18mr30353366ybq.314.1622042242368; 
 Wed, 26 May 2021 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
In-Reply-To: <20210526085623.mhls24mmo4idu5we@gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 26 May 2021 08:17:11 -0700
Message-ID: <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ab40cd05c33d231e"
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

--000000000000ab40cd05c33d231e
Content-Type: text/plain; charset="UTF-8"

>
> > > > 3. zlib_file.xpp, zlib_exception.xpp:
> > > > will be removed or slightly changed; we can potentially use the linux
> > > > logrotate which has built-in compression and file rotation (in this
> case
> > > > these compression utilities will be removed).
> > > > The latest log file isn't compressed any more. History log files are
> > > > still compressed.
> > > Just curious, how are you going to remove the oldest messages from the
> > > latest file in runtime? You are not going to rewrite the entire file on
> > > every input character, are you?
> >
> > The following is my current idea: we will rename the latest file to
> > something else and notify the writer (hostlogger) to close its old file
> > descriptor and open a new one (should be doable via linux logrotate and
> > inotify or some signal handlers, as logrotate is able to send some
> signals
> > to hostlogger if a rotation is performed). The writer keeps appending
> logs
> > most of the time using the same fd unless the latest file is rotated.
> This
> > should be better than truncating the file where the reader (BMCWeb) won't
> > have race conditions (it might read old snapshots but it is not a big
> deal
> > in our case).
> Currently we can keep the last N lines of the host's output, the oldest
> messages are removed. It is easy to implement with a buffer in memory.
> But how are you going to get rid of the old lines if you write data
> directly
> to the log file?
> Rotation will not help you with that (we actually don't need to store such
> old
> logs).

We plan to implement something similar to rotate count
<https://linux.die.net/man/8/logrotate> in linux logrotate. It is basically
like a ring buffer in the file system. We keep N log files. The latest log
file is in plain text and the writer keeps appending data to it. The rest
N-1 files are compressed.

On Wed, May 26, 2021 at 1:56 AM Artem Senichev <artemsen@gmail.com> wrote:

> On Tue, May 25, 2021 at 11:51:44PM -0700, Nan Zhou wrote:
> > > > 3. zlib_file.xpp, zlib_exception.xpp:
> > > > will be removed or slightly changed; we can potentially use the linux
> > > > logrotate which has built-in compression and file rotation (in this
> case
> > > > these compression utilities will be removed).
> > > > The latest log file isn't compressed any more. History log files are
> > > > still compressed.
> > > Just curious, how are you going to remove the oldest messages from the
> > > latest file in runtime? You are not going to rewrite the entire file on
> > > every input character, are you?
> >
> > The following is my current idea: we will rename the latest file to
> > something else and notify the writer (hostlogger) to close its old file
> > descriptor and open a new one (should be doable via linux logrotate and
> > inotify or some signal handlers, as logrotate is able to send some
> signals
> > to hostlogger if a rotation is performed). The writer keeps appending
> logs
> > most of the time using the same fd unless the latest file is rotated.
> This
> > should be better than truncating the file where the reader (BMCWeb) won't
> > have race conditions (it might read old snapshots but it is not a big
> deal
> > in our case).
>
> Currently we can keep the last N lines of the host's output, the oldest
> messages are removed. It is easy to implement with a buffer in memory.
> But how are you going to get rid of the old lines if you write data
> directly
> to the log file?
> Rotation will not help you with that (we actually don't need to store such
> old
> logs).
>
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
>

--000000000000ab40cd05c33d231e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt; &gt; 3. zlib_file.x=
pp, zlib_exception.xpp:<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; &gt; &gt; will be removed or slightly changed; we can pot=
entially use the linux<br></span><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)">&gt; &gt; &gt; logrotate which has built-in compression and fil=
e rotation (in this case<br></span><span class=3D"gmail-im" style=3D"color:=
rgb(80,0,80)">&gt; &gt; &gt; these compression utilities will be removed).<=
br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt; &=
gt; The latest log file isn&#39;t compressed any more. History log files ar=
e<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=
 &gt; still compressed.<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; &gt; Just curious, how are you going to remove the oldest=
 messages from the<br></span><span class=3D"gmail-im" style=3D"color:rgb(80=
,0,80)">&gt; &gt; latest file in runtime? You are not going to rewrite the =
entire file on<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,8=
0)">&gt; &gt; every input character, are you?<br></span><span class=3D"gmai=
l-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" =
style=3D"color:rgb(80,0,80)">&gt; The following is my current idea: we will=
 rename the latest file to<br></span><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80)">&gt; something else and notify the writer (hostlogger) to c=
lose its old file<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,=
0,80)">&gt; descriptor and open a new one (should be doable via linux logro=
tate and<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&g=
t; inotify or some signal handlers, as logrotate is able to send some signa=
ls<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; to =
hostlogger if a rotation is performed). The writer keeps appending logs<br>=
</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; most of t=
he time using the same fd unless the latest file is rotated. This<br></span=
><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; should be bette=
r than truncating the file where the reader (BMCWeb) won&#39;t<br></span><s=
pan class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; have race conditio=
ns (it might read old snapshots but it is not a big deal<br></span><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; in our case).</span><spa=
n class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>Currently we c=
an keep the last N lines of the host&#39;s output, the oldest<br>messages a=
re removed. It is easy to implement with a buffer in memory.<br>But how are=
 you going to get rid of the old lines if you write data directly<br>to the=
 log file?<br>Rotation will not help you with that (we actually don&#39;t n=
eed to store such old<br>logs).</blockquote><div>We plan to implement somet=
hing similar to <a href=3D"https://linux.die.net/man/8/logrotate">rotate co=
unt</a> in linux logrotate. It is basically like a ring buffer in the file =
system. We keep N log files. The latest log file is in plain text and the w=
riter keeps appending data to it. The rest N-1 files are compressed.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, May 26, 2021 at 1:56 AM Artem Senichev &lt;<a href=3D"mailto:artemse=
n@gmail.com">artemsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, May 25, 2021 at 11:51:44PM -0700, =
Nan Zhou wrote:<br>
&gt; &gt; &gt; 3. zlib_file.xpp, zlib_exception.xpp:<br>
&gt; &gt; &gt; will be removed or slightly changed; we can potentially use =
the linux<br>
&gt; &gt; &gt; logrotate which has built-in compression and file rotation (=
in this case<br>
&gt; &gt; &gt; these compression utilities will be removed).<br>
&gt; &gt; &gt; The latest log file isn&#39;t compressed any more. History l=
og files are<br>
&gt; &gt; &gt; still compressed.<br>
&gt; &gt; Just curious, how are you going to remove the oldest messages fro=
m the<br>
&gt; &gt; latest file in runtime? You are not going to rewrite the entire f=
ile on<br>
&gt; &gt; every input character, are you?<br>
&gt; <br>
&gt; The following is my current idea: we will rename the latest file to<br=
>
&gt; something else and notify the writer (hostlogger) to close its old fil=
e<br>
&gt; descriptor and open a new one (should be doable via linux logrotate an=
d<br>
&gt; inotify or some signal handlers, as logrotate is able to send some sig=
nals<br>
&gt; to hostlogger if a rotation is performed). The writer keeps appending =
logs<br>
&gt; most of the time using the same fd unless the latest file is rotated. =
This<br>
&gt; should be better than truncating the file where the reader (BMCWeb) wo=
n&#39;t<br>
&gt; have race conditions (it might read old snapshots but it is not a big =
deal<br>
&gt; in our case).<br>
<br>
Currently we can keep the last N lines of the host&#39;s output, the oldest=
<br>
messages are removed. It is easy to implement with a buffer in memory.<br>
But how are you going to get rid of the old lines if you write data directl=
y<br>
to the log file?<br>
Rotation will not help you with that (we actually don&#39;t need to store s=
uch old<br>
logs).<br>
<br>
-- <br>
Regards,<br>
Artem Senichev<br>
Software Engineer, YADRO.<br>
</blockquote></div>

--000000000000ab40cd05c33d231e--
