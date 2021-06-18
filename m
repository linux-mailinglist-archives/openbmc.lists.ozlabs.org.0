Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE923AD1FA
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 20:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G66cd5kbtz3c0R
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 04:18:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=tt4ohwQ1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tt4ohwQ1; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G66cL51YNz306b
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 04:18:24 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id c9so13174848qkm.0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvzMGJP3Nl6Cd1for5dQrCcmZAjLLZXyaAP+x1heSdc=;
 b=tt4ohwQ1x+vdqI1nGs8Fw23Cz+9RPneapa1o9nU+VFTvFteesscTDQl60WggBZXiEh
 0DuLvF6z10TVig8yYW+rCOtPbnOGV73gOoPEq0u2M46nZeQgHgoRxouHGTw4KCFwnfMq
 o2tcDm5x9kA4rZOJxGBHcl3ES3XZU21D2snN/R/PAVjtO4spoqAR/esjUeLWVJg4m1/v
 HWhdgVKu9ldcYksarJzyyjjuhTs0bFw80n7ZWs0vZo4hdq7GdFvRdiIgebVp8LLfOrMs
 tCLyz0h8LLNDsphrq1n4bvxTzN+3oMUX1yYxPOKreZS4UO/zpwL5584cP/DsC9DiD6cp
 zdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvzMGJP3Nl6Cd1for5dQrCcmZAjLLZXyaAP+x1heSdc=;
 b=AgSS04Z3hN+euuAV3EYU1X5UXeMgm9TUfv9UhzZc0Ki7x2HvUwdF58dtv81Qq0mc/c
 wjAezrpX9eHclar4YP32SvmqjinZIa8iW1yfX4e0p+RS+e28eUgBFkL01FUiGe514wQB
 eCSGkgF2QUaKfwqeP0W/hGeruZsDK375agZXvV2lCX/v+43dnQLSi4YvrxIXVwxdqSR7
 FnDXTUUVPk6MgJa4CaWfPuCNuPm7jH5bZ8wM13JLOIhwIE9aAG6fkKoPeXh2xUgbK+lZ
 Vjb8GVwhmIayoCF9NbZRcZPtwhn2ruxVtqc4oB9dmsOPpaWKeqrWwvoEYTZNkKngGjIr
 R18Q==
X-Gm-Message-State: AOAM533QeQ93Xxfn72u6gG1bK2rv6d4HXVQfvwvnSyhYw4vfvWpGbaF9
 WjVJZ1vLIHE8iZXoXwWX87Rmw2CL4IDgK9s0n1T5Fg==
X-Google-Smtp-Source: ABdhPJyw8xvRj9Q5sciVrQwztf59RS4fyVaoICGTzBVt727KxI+b+KBl0IV/GDH9BTbFZ9qZAI9KgZPGFnls08zgTlo=
X-Received: by 2002:a25:ab6b:: with SMTP id u98mr3478715ybi.311.1624040298188; 
 Fri, 18 Jun 2021 11:18:18 -0700 (PDT)
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
 <CAOLfGj7d=VmXrXXd09nW==1Th5OCiP0nyfWbUbYDssRJ94Os-g@mail.gmail.com>
 <CAHsrh9L4d96C5_8=QVmujdf71iALnQdCk=zzJ3Hb=Spey5NZxA@mail.gmail.com>
In-Reply-To: <CAHsrh9L4d96C5_8=QVmujdf71iALnQdCk=zzJ3Hb=Spey5NZxA@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Fri, 18 Jun 2021 11:18:06 -0700
Message-ID: <CAOLfGj4yry3VV5m6zgGGFpJs-MDUd=3XFVtkZzLDb278gFHvww@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Artem Senichev <artemsen@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000013966705c50e59c5"
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

--00000000000013966705c50e59c5
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

I still don't see a reason to have two different applications in one
> repository, but let's try.
> I believe that the common part with socket opening/reading (about 100
> lines of code) is nothing compared to the complexity of supporting
> such sophisticated configuration in meson and bb files.


Please take a look at
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hostlogger/+/44241. I
made the HostLogger build the same binary but with different behaviour. In
this way, no bb file changes are needed. It leverages existing socket
reading, config reading, and dbus event loop. By default it doesn't affect
the existing buffer based HostLogger at all.

Sincerely,
Nan


On Sun, Jun 13, 2021 at 11:18 PM Artem Senichev <artemsen@gmail.com> wrote:

> On Sat, Jun 12, 2021 at 12:07 AM Nan Zhou <nanzhou@google.com> wrote:
> >>
> >> >
> >> >> > Or did me missing something?
> >> >> >
> >> >> > Also, we already talked about it: there's a problem that if BMC
> loses the
> >> >> > power before it sends out a signal to hostlogger, data in memory
> won't be
> >> >> > persisted.
> >> >> Yes, I agree that this is a problem. But there are ways to fix it
> without
> >> >> breaking the current functionality of Hostlogger.
> >> >> We can use rsyslog with external log server, or increase the buffer
> size
> >> >> in obmc-console-server, or use systemd-cat with logrotate.
> >> >> We can even add a new mode to Hostlogger that will not use the
> buffer, but
> >> >> as I said earlier, there are not many common parts.
> >> >
> >> > I guess you are arguing we need a new daemon rather than modify
> Hostlogger, right? +Ed Tanous here to see what his opinion is.
> >> If Nans use case is in fact totally different, and can't be handled in
> >> the same application I think that's ok, but I'd like to see the new
> >> application put in the hostlogger repo so it can share the routines
> >> that are common (things like finding and opening the unix socket,
> >> managing the reads, and the zlib integration) and to ensure that users
> >> find it when searching for code that solves this problem, as on the
> >> outset they're pretty similar, just with seemingly different rules.
> >> If we don't put it there, it seems like we'd have to duplicate a lot
> >> of code.
> >
> > Thanks a lot for the previous discussion. Following up on this, is it
> acceptable if we add a new application (it will be a new binary + a new
> systemd service config) in the hostlogger repo to support the stream
> application? We can add options to control whether to turn on this new
> stream application. In this way, existing applications stay unchanged. As
> Ed said, we could use codes that deal with unix sockets and reads. It
> should also make sense that console codes are put together in the same
> place.
> >
> > Please let us know what you think. Your confirmation will be very
> valuable and will unblock our development.
>
> I still don't see a reason to have two different applications in one
> repository, but let's try.
> I believe that the common part with socket opening/reading (about 100
> lines of code) is nothing compared to the complexity of supporting
> such sophisticated configuration in meson and bb files.
>
> --
> Best regards,
> Artem Senichev
>

--00000000000013966705c50e59c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Artem,<div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I still don&#39;t see a reason to have two different a=
pplications in one<br>repository, but let&#39;s try.<br>I believe that the =
common part with socket opening/reading (about 100<br>lines of code) is not=
hing compared to the complexity of supporting<br>such sophisticated configu=
ration in meson and bb files.</blockquote><div><br></div><div>Please take a=
 look at=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosp=
hor-hostlogger/+/44241">https://gerrit.openbmc-project.xyz/c/openbmc/phosph=
or-hostlogger/+/44241</a>. I made the HostLogger build the same binary but =
with different behaviour. In this way, no bb file changes are needed. It le=
verages existing socket reading, config reading, and dbus event loop. By de=
fault it doesn&#39;t affect the existing buffer based HostLogger at all.</d=
iv><div><br></div><div>Sincerely,</div><div>Nan</div></div><div dir=3D"ltr"=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sun, Jun 13, 2021 at 11:18 PM Artem Senichev &lt;<a href=3D"mailto:=
artemsen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Jun 12, 202=
1 at 12:07 AM Nan Zhou &lt;<a href=3D"mailto:nanzhou@google.com" target=3D"=
_blank">nanzhou@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Or did me missing something?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Also, we already talked about it: there&#39;s a prob=
lem that if BMC loses the<br>
&gt;&gt; &gt;&gt; &gt; power before it sends out a signal to hostlogger, da=
ta in memory won&#39;t be<br>
&gt;&gt; &gt;&gt; &gt; persisted.<br>
&gt;&gt; &gt;&gt; Yes, I agree that this is a problem. But there are ways t=
o fix it without<br>
&gt;&gt; &gt;&gt; breaking the current functionality of Hostlogger.<br>
&gt;&gt; &gt;&gt; We can use rsyslog with external log server, or increase =
the buffer size<br>
&gt;&gt; &gt;&gt; in obmc-console-server, or use systemd-cat with logrotate=
.<br>
&gt;&gt; &gt;&gt; We can even add a new mode to Hostlogger that will not us=
e the buffer, but<br>
&gt;&gt; &gt;&gt; as I said earlier, there are not many common parts.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I guess you are arguing we need a new daemon rather than modi=
fy Hostlogger, right? +Ed Tanous here to see what his opinion is.<br>
&gt;&gt; If Nans use case is in fact totally different, and can&#39;t be ha=
ndled in<br>
&gt;&gt; the same application I think that&#39;s ok, but I&#39;d like to se=
e the new<br>
&gt;&gt; application put in the hostlogger repo so it can share the routine=
s<br>
&gt;&gt; that are common (things like finding and opening the unix socket,<=
br>
&gt;&gt; managing the reads, and the zlib integration) and to ensure that u=
sers<br>
&gt;&gt; find it when searching for code that solves this problem, as on th=
e<br>
&gt;&gt; outset they&#39;re pretty similar, just with seemingly different r=
ules.<br>
&gt;&gt; If we don&#39;t put it there, it seems like we&#39;d have to dupli=
cate a lot<br>
&gt;&gt; of code.<br>
&gt;<br>
&gt; Thanks a lot for the previous discussion. Following up on this, is it =
acceptable if we add a new application (it will be a new binary + a new sys=
temd service config) in the hostlogger repo to support the stream applicati=
on? We can add options to control whether to turn on this new stream applic=
ation. In this way, existing applications stay unchanged. As Ed said, we co=
uld use codes that deal with unix sockets and reads. It should also make se=
nse that console codes are put together in the same place.<br>
&gt;<br>
&gt; Please let us know what you think. Your confirmation will be very valu=
able and will unblock our development.<br>
<br>
I still don&#39;t see a reason to have two different applications in one<br=
>
repository, but let&#39;s try.<br>
I believe that the common part with socket opening/reading (about 100<br>
lines of code) is nothing compared to the complexity of supporting<br>
such sophisticated configuration in meson and bb files.<br>
<br>
--<br>
Best regards,<br>
Artem Senichev<br>
</blockquote></div>

--00000000000013966705c50e59c5--
