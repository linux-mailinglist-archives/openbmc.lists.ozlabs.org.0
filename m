Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E0606353
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 16:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtVdJ3c1Rz3dql
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 01:40:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RnrUxA4p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RnrUxA4p;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtVch74rHz3c1p
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 01:40:04 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id f9-20020a17090a654900b00210928389f8so3675851pjs.2
        for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLVtAaIRyU6hUBY+3qzbPcnGpsExv5kPhm1A+14jfIE=;
        b=RnrUxA4pyhicLjP5p3VnO7QazlR53hLvaZVWH46DWzqCEVkrHWbh2Vo5qxyDF4Tj0y
         U2smOTTXvpw4bfTdSdLQ3IPlbDVtXysnfp5R4+x2v33TUGnu6qtTO9Qo4tezrK2vfm4E
         LcVNX46NTrg43+XYZRmJgRmoUGejvF0ZyFcdhx4xur0gXsI0EXXmz5fzO6FIWMaWfGmQ
         F/gkFCDZZXzkgayjBxwDK6M7FND38Qj8z8RKbM2JZyHAu0hxJaPl07/ohr//5oAzKODh
         m6T+5OyHpNWWOkGEyR/cxYFj0snerSZzbb4ZeWE/JJm4A41/xw3eAEhHwEwThsI6ZA5A
         /8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLVtAaIRyU6hUBY+3qzbPcnGpsExv5kPhm1A+14jfIE=;
        b=CpWzVHE3wIMlLQztqJWUVb8o2VlZ6yGvrzxkHsZFjVorxeuihsSilZTJZGH6+f62Bn
         9dn7J6lcaer4AePsyglLcjllLkd1EFNTjvX/djUYa6ZhmSJ7g3xo8BVHA3Ellikf240D
         EYxivZX5DNzVbIuiTFFERzlbhYuzQfDdTIMJG3TWDQqgyxrBHpyCHfnzgUnexu8zIIdk
         b8018EHttVq66axHEbgEo0iKbC5rR2WeNE0hxfNuNrnKqucC8GvybrLL29TQHTbU4Kvu
         8VR0Ii07N/BwBoAVLmhUE/XkTtm8DVp7bhg5IFIRvky2ANZ5aK3kirBYuOZOSFVFNaiV
         +LPA==
X-Gm-Message-State: ACrzQf1Qjww7/Ha4yZfIh7ZoLfU8YstBuZra1GWKPT3Ip0OKT8pClPN3
	04QY498DY14ZN/M4nBXRxFmmW3aKrwPvvHu/Wa0=
X-Google-Smtp-Source: AMsMyM7C7bLypBgEvUqxDtgom+rtLRifj0j762fQHJx1SfvPiYEoOGj9y/U/rdsjGMGV10UTjJvlUilQSttm9lVZTi4=
X-Received: by 2002:a17:90b:1e4b:b0:20d:8cf0:1a3c with SMTP id
 pi11-20020a17090b1e4b00b0020d8cf01a3cmr16867492pjb.172.1666276800909; Thu, 20
 Oct 2022 07:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com> <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com> <CAGm54UEOOZQtNZ1ev-6ExqjMoryO7GVNvNaW-iB9rO_kbHKAAA@mail.gmail.com>
In-Reply-To: <CAGm54UEOOZQtNZ1ev-6ExqjMoryO7GVNvNaW-iB9rO_kbHKAAA@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 20 Oct 2022 22:39:49 +0800
Message-ID: <CAO9PYRJUbmhy4uEjGEM2qQQaBUYeX6rCSo2m=U9hm=5u8dEAOg@mail.gmail.com>
Subject: Re: Adding support for custom SEL records
To: Lei Yu <yulei.sh@bytedance.com>
Content-Type: multipart/alternative; boundary="000000000000d0d4e105eb784ceb"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d0d4e105eb784ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lei:
    I encounter a SEL catch sync issue. If a SEL generated while ipmd
collecting all log enttry from file in SEL cache initialized progress then
the SEL wouldn't be exist in SEL cache. Do you ever encounter this issue?

Tyler

Lei Yu <yulei.sh@bytedance.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:26=E5=AF=AB=E9=81=93=EF=BC=9A

> On Thu, Oct 20, 2022 at 2:05 AM Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
> >
> >
> >
> > On 10/19/2022 11:10 AM, Brad Bishop wrote:
> > > Thanks Jason
> > >
> > > On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:
> > >
> > >> Intel had a requirement to support storing at least 4000 log entries=
.
> > >
>
> Bytedance has a requirement of 1000 log entries.
>
> > > Ok.  So is it fair to assume anyone using the DBus backend does not
> have
> > > this requirement?
> >
> > That is my assumption, yes.
> > >
> > >> At the time, we were able to get about 400 entries on D-Bus before
> > >> D-Bus performance became unusable.
> > >
> > > To anyone using the DBus backend - have you observed similar
> performance
> > > issues?
> > >
>
> We did hit the performance issue, specifically, it is extremely slow
> during BMC boot, when log-manager restore the log entries and put them
> on DBus.
> That's when I start the discussion about
> https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/52445 and
>
> https://lore.kernel.org/openbmc/CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2Qr=
YdR3SRqcvg@mail.gmail.com/
>
> Later we resolved the issue by:
> * Applying the patch
> https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/53904
> * Implement the SEL cache in ipmid that is already upstreamed
> * Improve the SEL cache by serialization (not upstreamed)
>
> Eventually we get fair performance on SEL handling (with 1000
> entries), it should handle 4000 as well.
>
> > > Jason is there a testcase or scenario I can execute to highlighht the
> > > issues you refer to concretely?  Maybe something like "create 4000
> sels,
> > > run ipmitool and see how long it takes?"
> >
> > To clarify, my understanding is the D-Bus performance issues were not
> > isolated to just IPMI.  All of D-Bus for every BMC service was impacted=
.
> >
> > If I remember correctly, Ed Tanous is who did the initial evaluation, s=
o
> > he may have more detail.  But I think it was similar to what you
> > suggest: Create 4000 logs on D-Bus and check the performance.  This
> > could be done with ipmitool.
> > >
> > >> I'd also be curious about the reverse question.  Is there any benefi=
t
> > >> to storing logs on D-Bus that makes it a better solution?
> > >
> > > Yes, this is exactly the question I've been trying to ask.  The answe=
r
> > > seems only to be that the code is in meta-intel/intel-ipmi-oem - but
> > > that is easily fixed by moving the code to
> > > meta-phosphor/phosphor-host-ipmid.
> > >
> > >> At the risk of complicating things more (https://xkcd.com/927/),
> D-Bus
> > >> was the primary solution when Intel joined.  We created the rsyslog
> > >> approach because of the limitation imposed by D-Bus.  But I know the=
re
> > >> are still those who don't like the rsyslog approach.  Is there a way
> > >> we can now get together and define a new logging solution that is
> > >> fully upstream and avoids the drawbacks of both existing solutions?
> > >
> > > I hope so, because doing that would make things a lot easier for our
> > > users adopting OpenBMC.
> >
> > My main requirements are to store many logs (at least 4000 was the
> > original number, but I can try to get an updated number if needed) and
> > have them persist across BMC reboots.
> >
> > We currently accomplish this using rsyslog to extract logs from the
> > journal and store them in a persistent text file.
> >
> > How is best to approach starting a new design discussion?  Should we
> > continue discussing in this thread?  Start a design doc review?
> > Something else?
> > >
> > > Thanks,
> > > brad
>
> I would like to add several notes (possibly limitations) about
> rsyslog's SEL in intel-ipmi-oem, please correct if I was wrong.
> * It handles the SELs from phosphor-sel-logger, mostly it only
> contains the threshold events.
> * It iterates the sel files, and convert the file content into SEL
> data every time on a request, which does not seem optimal
> * The "add sel entry" does not really add a sel log, it adds an event
> entry to Redfish instead.
> * With above behavior, it basically has two separate types of logs,
> SEL logs that are from rsyslog, and redfish event logs that are done
> by "add sel entry". Thus the implementation seems to only support SELs
> for sensor threshold events, but not for discrete sensors.
>
> In bytedance we need a "full" SEL feature that supports both
> thresholds and discrete sensors.
> The whole solution is based on the DBus logging, but it involves
> different repos (ipmid, phosphor-logging, fault-monitor). Part of the
> implementation is upstreamed but some are internal for now.
> I would like to share the details when I have bandwidth :)
>
> --
> BRs,
> Lei YU
>

--000000000000d0d4e105eb784ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lei:<div>=C2=A0 =C2=A0 I encounter a SEL catch sync iss=
ue. If a SEL generated while ipmd collecting all log enttry from file in SE=
L cache initialized progress then the SEL wouldn&#39;t be exist in SEL cach=
e. Do you ever encounter this issue?</div><div><br></div><div>Tyler</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
i Yu &lt;<a href=3D"mailto:yulei.sh@bytedance.com">yulei.sh@bytedance.com</=
a>&gt; =E6=96=BC 2022=E5=B9=B410=E6=9C=8820=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=
=99=9A=E4=B8=8A9:26=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Oct 20, 2022 at 2:05 AM Bills, Jas=
on M<br>
&lt;<a href=3D"mailto:jason.m.bills@linux.intel.com" target=3D"_blank">jaso=
n.m.bills@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 10/19/2022 11:10 AM, Brad Bishop wrote:<br>
&gt; &gt; Thanks Jason<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt;&gt; Intel had a requirement to support storing at least 4000 log =
entries.<br>
&gt; &gt;<br>
<br>
Bytedance has a requirement of 1000 log entries.<br>
<br>
&gt; &gt; Ok.=C2=A0 So is it fair to assume anyone using the DBus backend d=
oes not have<br>
&gt; &gt; this requirement?<br>
&gt;<br>
&gt; That is my assumption, yes.<br>
&gt; &gt;<br>
&gt; &gt;&gt; At the time, we were able to get about 400 entries on D-Bus b=
efore<br>
&gt; &gt;&gt; D-Bus performance became unusable.<br>
&gt; &gt;<br>
&gt; &gt; To anyone using the DBus backend - have you observed similar perf=
ormance<br>
&gt; &gt; issues?<br>
&gt; &gt;<br>
<br>
We did hit the performance issue, specifically, it is extremely slow<br>
during BMC boot, when log-manager restore the log entries and put them<br>
on DBus.<br>
That&#39;s when I start the discussion about<br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/52445" r=
el=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/ph=
osphor-logging/+/52445</a> and<br>
<a href=3D"https://lore.kernel.org/openbmc/CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0=
PH_zWJ2QrYdR3SRqcvg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/openbmc/CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR=
3SRqcvg@mail.gmail.com/</a><br>
<br>
Later we resolved the issue by:<br>
* Applying the patch<br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/53904" re=
l=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/pho=
sphor-objmgr/+/53904</a><br>
* Implement the SEL cache in ipmid that is already upstreamed<br>
* Improve the SEL cache by serialization (not upstreamed)<br>
<br>
Eventually we get fair performance on SEL handling (with 1000<br>
entries), it should handle 4000 as well.<br>
<br>
&gt; &gt; Jason is there a testcase or scenario I can execute to highlighht=
 the<br>
&gt; &gt; issues you refer to concretely?=C2=A0 Maybe something like &quot;=
create 4000 sels,<br>
&gt; &gt; run ipmitool and see how long it takes?&quot;<br>
&gt;<br>
&gt; To clarify, my understanding is the D-Bus performance issues were not<=
br>
&gt; isolated to just IPMI.=C2=A0 All of D-Bus for every BMC service was im=
pacted.<br>
&gt;<br>
&gt; If I remember correctly, Ed Tanous is who did the initial evaluation, =
so<br>
&gt; he may have more detail.=C2=A0 But I think it was similar to what you<=
br>
&gt; suggest: Create 4000 logs on D-Bus and check the performance.=C2=A0 Th=
is<br>
&gt; could be done with ipmitool.<br>
&gt; &gt;<br>
&gt; &gt;&gt; I&#39;d also be curious about the reverse question.=C2=A0 Is =
there any benefit<br>
&gt; &gt;&gt; to storing logs on D-Bus that makes it a better solution?<br>
&gt; &gt;<br>
&gt; &gt; Yes, this is exactly the question I&#39;ve been trying to ask.=C2=
=A0 The answer<br>
&gt; &gt; seems only to be that the code is in meta-intel/intel-ipmi-oem - =
but<br>
&gt; &gt; that is easily fixed by moving the code to<br>
&gt; &gt; meta-phosphor/phosphor-host-ipmid.<br>
&gt; &gt;<br>
&gt; &gt;&gt; At the risk of complicating things more (<a href=3D"https://x=
kcd.com/927/" rel=3D"noreferrer" target=3D"_blank">https://xkcd.com/927/</a=
>), D-Bus<br>
&gt; &gt;&gt; was the primary solution when Intel joined.=C2=A0 We created =
the rsyslog<br>
&gt; &gt;&gt; approach because of the limitation imposed by D-Bus.=C2=A0 Bu=
t I know there<br>
&gt; &gt;&gt; are still those who don&#39;t like the rsyslog approach.=C2=
=A0 Is there a way<br>
&gt; &gt;&gt; we can now get together and define a new logging solution tha=
t is<br>
&gt; &gt;&gt; fully upstream and avoids the drawbacks of both existing solu=
tions?<br>
&gt; &gt;<br>
&gt; &gt; I hope so, because doing that would make things a lot easier for =
our<br>
&gt; &gt; users adopting OpenBMC.<br>
&gt;<br>
&gt; My main requirements are to store many logs (at least 4000 was the<br>
&gt; original number, but I can try to get an updated number if needed) and=
<br>
&gt; have them persist across BMC reboots.<br>
&gt;<br>
&gt; We currently accomplish this using rsyslog to extract logs from the<br=
>
&gt; journal and store them in a persistent text file.<br>
&gt;<br>
&gt; How is best to approach starting a new design discussion?=C2=A0 Should=
 we<br>
&gt; continue discussing in this thread?=C2=A0 Start a design doc review?<b=
r>
&gt; Something else?<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; brad<br>
<br>
I would like to add several notes (possibly limitations) about<br>
rsyslog&#39;s SEL in intel-ipmi-oem, please correct if I was wrong.<br>
* It handles the SELs from phosphor-sel-logger, mostly it only<br>
contains the threshold events.<br>
* It iterates the sel files, and convert the file content into SEL<br>
data every time on a request, which does not seem optimal<br>
* The &quot;add sel entry&quot; does not really add a sel log, it adds an e=
vent<br>
entry to Redfish instead.<br>
* With above behavior, it basically has two separate types of logs,<br>
SEL logs that are from rsyslog, and redfish event logs that are done<br>
by &quot;add sel entry&quot;. Thus the implementation seems to only support=
 SELs<br>
for sensor threshold events, but not for discrete sensors.<br>
<br>
In bytedance we need a &quot;full&quot; SEL feature that supports both<br>
thresholds and discrete sensors.<br>
The whole solution is based on the DBus logging, but it involves<br>
different repos (ipmid, phosphor-logging, fault-monitor). Part of the<br>
implementation is upstreamed but some are internal for now.<br>
I would like to share the details when I have bandwidth :)<br>
<br>
-- <br>
BRs,<br>
Lei YU<br>
</blockquote></div>

--000000000000d0d4e105eb784ceb--
