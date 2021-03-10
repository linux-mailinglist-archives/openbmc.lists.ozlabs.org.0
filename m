Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36433492D
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 21:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwkng4n4Yz3cXr
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 07:53:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=hO0JhY1h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hO0JhY1h; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwknS00d3z3cKR
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 07:53:30 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id t1so30198265eds.7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 12:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tf3dIo6gnugCOwpQCA/eG+UQQJfall++CY4pzNFbxB8=;
 b=hO0JhY1hWg7GeIQOkMgs2V4R3/pccxLhbooyqeh9DJrpdcC3r25utiqOHPJbhxtQZC
 /v0bB+ozQtAGa6RfF/Ft4n9uitmJPmXcLYl4Z0wV3Ppvb/VV14rGytJHbOwrZL3Hjkb8
 ctxGMFgFahl2Z15BiwZ/njHhyN4JGclGbbvBuvkSQyHwFV0Fyj3J6lyowYIWHucaRpJr
 5WnoMYQ/5ZurTGNiUFxHRmvx57nvRkaSk5hID/wCypd4hL9oMAFNl9JXNpw1/g0zltdS
 n2AtMqjBkPdo9hY4u0w1uBjFQj8rI7GZzXQaK1Pc9IAAyZHoEa4A0JWEvkH3bVbXdWW/
 hg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tf3dIo6gnugCOwpQCA/eG+UQQJfall++CY4pzNFbxB8=;
 b=d6/yTaiNia7lKehYdXJdtY2wxjkihggyarNO3446vs9XideThG91QwvTGWLBcbgFF9
 OAQ/EQlvqvpRnpcQvCQGJdGuFj7OZ5uxPR6/comKp8JMnZqfS36P/xuDbQY45zeybd9F
 yDRfM17BdnwUGPmFhQutkV9QDWQhP1CtMFo1NNtUQLDiwhb5UGuEszeRZ3KtXnyCq6iC
 F62hjZG2eDAK2lVnL87y/IrKR5M2JyJI0yQ3ByTenM+ohodKVXJK4IAnYu31eqIXVkPf
 kfQldOGIU8Z1b0gRqnoubBjVX0kIxxYFzTN+wHnOZdQXSGywydRBfmPCcS3jD4HoewNO
 Uhvg==
X-Gm-Message-State: AOAM53161EkgkDbz0y9sneMEbCzDWytKgO8NV9Bczu1xsOvQ0n+ddZ0h
 5ZMHFOvE9qear6UVURyU4sAdZ26tyQutu5rUndQgoQ==
X-Google-Smtp-Source: ABdhPJx4m7Dx1ylM3+V9o2LyJTej5AwwzV9N65YcD1uMnh31+AHeNWAvf3M9WdcxGJDsMpLvVQiFMagcL3zSfgcY3Rw=
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr5433358edd.78.1615409601976; 
 Wed, 10 Mar 2021 12:53:21 -0800 (PST)
MIME-Version: 1.0
References: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
 <20210309142956.ywqxbryyjcyffj75@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210309142956.ywqxbryyjcyffj75@thinkpad.fuzziesquirrel.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 10 Mar 2021 12:53:10 -0800
Message-ID: <CAOLfGj7sWt9S=NgCNgKdeeB+8JQJKq_A7b+J4nz8T7hhREXXPg@mail.gmail.com>
Subject: Re: Host Serial Console Logs via Redfish
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="0000000000007e6df805bd34db9a"
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
 openbmc@lists.ozlabs.org, Ofer Yehielli <ofery@google.com>,
 Ed Tanous <edtanous@google.com>, Richard Hanley <rhanley@google.com>,
 Justin Chen <juschen@google.com>, Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007e6df805bd34db9a
Content-Type: text/plain; charset="UTF-8"

Hi Brad,

Thanks for your reply!

>that phosphor-hostlogger collects host serial console logs via obmc-console
> >and generates tarballs in a rotation manner. These tarballs are then
> >consumed and exposed by a new node in bmcweb log service.
>
> Is it one console line per LogEntry?
>

Yes, one line per LogEntry. A line produced by phosphor-hostlogger in the
zip file has a timestamp + log message in it. The timestamp is then filled
into LogEntries.

>We propose the following methods to improve it.
> >
> >   - Method 1: *D-Bus Signal*; phosphor-hostlogger implements an interface
> >   which contains a signal. The payload of the signal should contain
> >   timestamps and log messages.  BmcWeb registers as a listener and once
> it
> >   receives a signal, it populates a new LogEntry. BmcWeb should
> implement its
> >   own configurable ring buffer to store log entries received from D-Bus.
> >   - Method 2: *File Watcher*; add file watchers in BmcWeb to monitor the
> >   log files produced by phosphor-hostlogger. This method is similar to
> method
> >   1. But persistence is still a necessary condition.
> >   - Method 3: *obmc-console + bmcweb*: install the console collection and
> >   ring buffer parts of phosphor-hostlogger as a library. Use the library
> >   directly in BmcWeb to collect console logs.
> >   - Method 4: *phosphor-hostlogger + journal + rsyslog + bmcweb*: this
> >   architecture is very similar to what the current OpenBMC uses for
> >   redfish-event
> >   <
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >.
> >   Add a new schema for log entries. Publish journal logs in
> >   phosphor-hostlogger. Add file watchers in BmcWeb to monitor the log
> files
> >   produced by rsyslog. rsyslog should have log rotation enabled.
> Persistence
> >   is still a necessary condition.
> Perhaps a missing option here is a single dbus object per LogEntry?  I'm
> not necessarily advocating for that - can I assume that was not
> considered because of performance/scaling concerns?

Yes, one DBus object per LogEntry is an option. But as you said, this
option might not scale. We want to mimic a near real-time console via
Redfish and we care about latency.

Sincerely,
Nan

On Tue, Mar 9, 2021 at 6:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi Nan
>
> Thanks for this announcement.  I don't have a lot of specific feedback
> for you, but this sort of introduction to new content is super helpful
> for the overall health of OpenBMC.
>
> On Mon, Mar 08, 2021 at 01:45:00PM -0800, Nan Zhou wrote:
>
> >Implementation for Phase 1 is in
> >https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39093. It is
> >based on obmc-console, phosphor-hostlogger, and bmcweb. The basic idea is
>
> I like how you are making use of these existing projects.
>
> >that phosphor-hostlogger collects host serial console logs via
> obmc-console
> >and generates tarballs in a rotation manner. These tarballs are then
> >consumed and exposed by a new node in bmcweb log service.
>
> Is it one console line per LogEntry?
>
> >We propose the following methods to improve it.
> >
> >   - Method 1: *D-Bus Signal*; phosphor-hostlogger implements an interface
> >   which contains a signal. The payload of the signal should contain
> >   timestamps and log messages.  BmcWeb registers as a listener and once
> it
> >   receives a signal, it populates a new LogEntry. BmcWeb should
> implement its
> >   own configurable ring buffer to store log entries received from D-Bus.
> >   - Method 2: *File Watcher*; add file watchers in BmcWeb to monitor the
> >   log files produced by phosphor-hostlogger. This method is similar to
> method
> >   1. But persistence is still a necessary condition.
> >   - Method 3: *obmc-console + bmcweb*: install the console collection and
> >   ring buffer parts of phosphor-hostlogger as a library. Use the library
> >   directly in BmcWeb to collect console logs.
> >   - Method 4: *phosphor-hostlogger + journal + rsyslog + bmcweb*: this
> >   architecture is very similar to what the current OpenBMC uses for
> >   redfish-event
> >   <
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
> >.
> >   Add a new schema for log entries. Publish journal logs in
> >   phosphor-hostlogger. Add file watchers in BmcWeb to monitor the log
> files
> >   produced by rsyslog. rsyslog should have log rotation enabled.
> Persistence
> >   is still a necessary condition.
>
> Perhaps a missing option here is a single dbus object per LogEntry?  I'm
> not necessarily advocating for that - can I assume that was not
> considered because of performance/scaling concerns?
>
> -brad
>

--0000000000007e6df805bd34db9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad,<div><br></div><div>Thanks for your reply!</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;that phosphor-hostlogger col=
lects host serial console logs via obmc-console<br>&gt;and generates tarbal=
ls in a rotation manner. These tarballs are then<br>&gt;consumed and expose=
d by a new node in bmcweb log service.<br><br></span>Is it one console line=
 per LogEntry?<br></blockquote><div><br></div><div>Yes, one line per LogEnt=
ry. A line produced by phosphor-hostlogger in the zip file has a timestamp=
=C2=A0+ log message in it. The timestamp is then filled into LogEntries.</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span c=
lass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;We propose the following=
 methods to improve it.<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt;<br></span>&gt;=C2=A0 =C2=A0- Method 1: *D-Bus Signal*; ph=
osphor-hostlogger implements an interface<br><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0which contains a signal. The paylo=
ad of the signal should contain<br></span><span class=3D"gmail-im" style=3D=
"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0timestamps and log messages.=C2=A0 Bm=
cWeb registers as a listener and once it<br></span><span class=3D"gmail-im"=
 style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0receives a signal, it popula=
tes a new LogEntry. BmcWeb should implement its<br></span><span class=3D"gm=
ail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0own configurable ring=
 buffer to store log entries received from D-Bus.<br></span>&gt;=C2=A0 =C2=
=A0- Method 2: *File Watcher*; add file watchers in BmcWeb to monitor the<b=
r><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0lo=
g files produced by phosphor-hostlogger. This method is similar to method<b=
r></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =
=C2=A01. But persistence is still a necessary condition.<br></span>&gt;=C2=
=A0 =C2=A0- Method 3: *obmc-console + bmcweb*: install the console collecti=
on and<br><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =
=C2=A0ring buffer parts of phosphor-hostlogger as a library. Use the librar=
y<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=
=A0 =C2=A0directly in BmcWeb to collect console logs.<br></span>&gt;=C2=A0 =
=C2=A0- Method 4: *phosphor-hostlogger + journal + rsyslog + bmcweb*: this<=
br><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0a=
rchitecture is very similar to what the current OpenBMC uses for<br></span>=
<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0redf=
ish-event<br></span>&gt;=C2=A0 =C2=A0&lt;<a href=3D"https://github.com/open=
bmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/docs/blob/master/archi=
tecture/redfish-logging-in-bmcweb.md</a>&gt;.<br><span class=3D"gmail-im" s=
tyle=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0Add a new schema for log entri=
es. Publish journal logs in<br></span><span class=3D"gmail-im" style=3D"col=
or:rgb(80,0,80)">&gt;=C2=A0 =C2=A0phosphor-hostlogger. Add file watchers in=
 BmcWeb to monitor the log files<br></span><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0produced by rsyslog. rsyslog shoul=
d have log rotation enabled. Persistence<br></span><span class=3D"gmail-im"=
 style=3D"color:rgb(80,0,80)">&gt;=C2=A0 =C2=A0is still a necessary conditi=
on.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>=
Perhaps a missing option here is a single dbus object per LogEntry?=C2=A0 I=
&#39;m<br>not necessarily advocating for that - can I assume that was not<b=
r>considered because of performance/scaling concerns?</blockquote><div>Yes,=
 one DBus object per LogEntry is an option. But as you said, this option mi=
ght not scale. We want to mimic a near real-time console via Redfish and we=
 care about=C2=A0latency.</div><div><br></div><div>Sincerely,</div><div>Nan=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Mar 9, 2021 at 6:30 AM Brad Bishop &lt;<a href=3D"mailto:brad=
leyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Nan<br>
<br>
Thanks for this announcement.=C2=A0 I don&#39;t have a lot of specific feed=
back <br>
for you, but this sort of introduction to new content is super helpful <br>
for the overall health of OpenBMC.<br>
<br>
On Mon, Mar 08, 2021 at 01:45:00PM -0800, Nan Zhou wrote:<br>
<br>
&gt;Implementation for Phase 1 is in<br>
&gt;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39093"=
 rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/=
openbmc/bmcweb/+/39093</a>. It is<br>
&gt;based on obmc-console, phosphor-hostlogger, and bmcweb. The basic idea =
is<br>
<br>
I like how you are making use of these existing projects.<br>
<br>
&gt;that phosphor-hostlogger collects host serial console logs via obmc-con=
sole<br>
&gt;and generates tarballs in a rotation manner. These tarballs are then<br=
>
&gt;consumed and exposed by a new node in bmcweb log service.<br>
<br>
Is it one console line per LogEntry?<br>
<br>
&gt;We propose the following methods to improve it.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- Method 1: *D-Bus Signal*; phosphor-hostlogger implements=
 an interface<br>
&gt;=C2=A0 =C2=A0which contains a signal. The payload of the signal should =
contain<br>
&gt;=C2=A0 =C2=A0timestamps and log messages.=C2=A0 BmcWeb registers as a l=
istener and once it<br>
&gt;=C2=A0 =C2=A0receives a signal, it populates a new LogEntry. BmcWeb sho=
uld implement its<br>
&gt;=C2=A0 =C2=A0own configurable ring buffer to store log entries received=
 from D-Bus.<br>
&gt;=C2=A0 =C2=A0- Method 2: *File Watcher*; add file watchers in BmcWeb to=
 monitor the<br>
&gt;=C2=A0 =C2=A0log files produced by phosphor-hostlogger. This method is =
similar to method<br>
&gt;=C2=A0 =C2=A01. But persistence is still a necessary condition.<br>
&gt;=C2=A0 =C2=A0- Method 3: *obmc-console + bmcweb*: install the console c=
ollection and<br>
&gt;=C2=A0 =C2=A0ring buffer parts of phosphor-hostlogger as a library. Use=
 the library<br>
&gt;=C2=A0 =C2=A0directly in BmcWeb to collect console logs.<br>
&gt;=C2=A0 =C2=A0- Method 4: *phosphor-hostlogger + journal + rsyslog + bmc=
web*: this<br>
&gt;=C2=A0 =C2=A0architecture is very similar to what the current OpenBMC u=
ses for<br>
&gt;=C2=A0 =C2=A0redfish-event<br>
&gt;=C2=A0 =C2=A0&lt;<a href=3D"https://github.com/openbmc/docs/blob/master=
/architecture/redfish-logging-in-bmcweb.md" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openbmc/docs/blob/master/architecture/redfish-logg=
ing-in-bmcweb.md</a>&gt;.<br>
&gt;=C2=A0 =C2=A0Add a new schema for log entries. Publish journal logs in<=
br>
&gt;=C2=A0 =C2=A0phosphor-hostlogger. Add file watchers in BmcWeb to monito=
r the log files<br>
&gt;=C2=A0 =C2=A0produced by rsyslog. rsyslog should have log rotation enab=
led. Persistence<br>
&gt;=C2=A0 =C2=A0is still a necessary condition.<br>
<br>
Perhaps a missing option here is a single dbus object per LogEntry?=C2=A0 I=
&#39;m <br>
not necessarily advocating for that - can I assume that was not <br>
considered because of performance/scaling concerns?<br>
<br>
-brad<br>
</blockquote></div>

--0000000000007e6df805bd34db9a--
