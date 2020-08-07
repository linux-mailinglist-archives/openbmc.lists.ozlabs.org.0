Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CF23F2C5
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 20:31:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNYpl57m0zDqmh
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 04:31:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LCyGWICH; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNYnb3jvLzDqcX
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 04:30:25 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id t7so2349997otp.0
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WQKP6U+0c/1GnGEG0X4C3haVJLIMBIt1mOx2c36h0L4=;
 b=LCyGWICH0TCj+VqwwNvVllEFxt3WgJNu11glghk28PLruYiaW2p4WiusfYsKHz36/2
 bYNCbU/AkxGJxPWhjPO8aQ6/tcbn0TAMKMtg94ccCN6/nyQSqFqaKSsllwR7czDRxbuO
 p1KQb/sB/Tucpb8yyc4gRDpMoyV7db52sMQ8ujjmucqakUz5hzoBp2EG4VjP2K01NUyx
 xUoJkopE3xYyS6Nni3vCkXBukft2a28L1qfUTjZ5GkJ791oIE8CNfyr31kjoLw+1T6oH
 h8HZvEO05IN84rEqVUacktqjEKhLZLJAIMTXT+thvRN4iJqhPotOYjUpxD80XQmkqNoj
 rBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQKP6U+0c/1GnGEG0X4C3haVJLIMBIt1mOx2c36h0L4=;
 b=LI/2/S3Fh3iomd6wwJm+olhQxam4dheHOalC3A2+P9hyP0njYjueSk3Q4OirH4IK8j
 ky6TIRQ8AdSH0/IhYAM+E18Ak3Z/DxEmRVrwrhEzeNS0ebyps61Az6WWTk9Se4UB36cG
 H/q/cJ+PokDl6xTEhTRR7sqkdXh4+BmnWMMHnKSgFHBqkllIRstGuHUuqBHkLtRFCHdC
 NT3McBJ51QMBnWOGHCMKX0PpmY3kQZjdageb2lz+eTJz/VwpKkEANzmCgEoUNiAQ5IA6
 eRjmpsV+3WFyfEESzn9gxN/kvBM0eqI1BQ5vWWvAAIYC+oKoZanx1vUKZoREWSbif11i
 gE2Q==
X-Gm-Message-State: AOAM530fmMS57uhq/BidzRZxZgMtIltK4BWr7AstudHMMoczojm/2486
 Ht4cO+UteuJd6AsebSVkvGvuHTZ23NH6nCmccQn+lA==
X-Google-Smtp-Source: ABdhPJziUly1XeayJzNsv6vKPbeTBIX0uDmoxs2sR4AHbWTBFxpv9mZck9P6smrE38PTRB+XJdcT4D+btzU7QklOmXU=
X-Received: by 2002:a9d:450a:: with SMTP id w10mr13090580ote.327.1596825021987; 
 Fri, 07 Aug 2020 11:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <cf598e89-10ba-8cdd-f6c6-26f175e21e83@linux.intel.com>
In-Reply-To: <cf598e89-10ba-8cdd-f6c6-26f175e21e83@linux.intel.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 11:29:45 -0700
Message-ID: <CAHBbfcW=r9=sCPkV-bEXuE-Fi_2w-REE3RuaAhLHYL3iMZdVxw@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000034cdd605ac4dccad"
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
Cc: Alex Qiu <xqiu@google.com>, Ed Tanous <ed@tanous.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000034cdd605ac4dccad
Content-Type: text/plain; charset="UTF-8"

>
> What would happen if something wasn't in the approved devices list?
> Print a warning? Assert? I don't have any problems with this approach.
>
I think currently in PSUSensors if the name of the device isn't in
pmBusNames
<https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59>
then PSUSensors refuses to monitor that particular device (
https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L269
).

It would be nice if this list could be (in the future) extended to all
> sensor types.

Sure, I'll start with PSUSensors first.


A quick word about the original topic of this thread; we picked
hwmontemp sensors where possible because we've seen performance issues for
PSUSensors (could be N seconds before Sensor.Value gets updated to dbus).
This has undesirable implications for PID loops..
thought was that spreading temp sensors over into hwmontemp sensor where
possible would help mitigate the performance issue until we can figure out
a better long term solution.


On Fri, Aug 7, 2020 at 11:17 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/7/2020 11:04 AM, Jason Ling wrote:
> >
> >     Yeah that's what I meant, a generic PSUSensor Type with a field
> called
> >     'Export' or something that EM can use to get the Export type.
> >
> > Sure, I think that handles the EM side of things.
> >
> >     I'm conflicted on that.  Part of the reason that list is there, and
> >     not in the config files directly, is to convey that those are the
> >     types that have been tested to work correctly, and the types that the
> >     config files "promise" to work sanely.  The other thing is, if you've
> >     done the testing, adding to that list is (should be) relatively
> >     trivial and straightforward.  Opening up that list to runtime parsing
> >     opens a lot of security questions I'm not prepared to answer.
> >
> > Sure, let's scrap runtime parsing and go for something far simpler.
> > (1) have a base type, devices list that represents the approved device
> list.
> > (2) have an empty extended type, device list that represents user
> > specified extensions.
> > (3) factor these out into separate files and provide a method that
> > returns the union of the base and extended types/devices.
> >
> > now we have a base type/device list that contains supported guaranteed
> > devices and another extended type/device list that is easier to maintain
> > patches for.
> > I think that's a rather small change and accomplishes what I'd like
> > while preserving the intent of keeping a list of supported types/devices.
> > What do you think?
>
> What would happen if something wasn't in the approved devices list?
> Print a warning? Assert? I don't have any problems with this approach.
> It would be nice if this list could be (in the future) extended to all
> sensor types.
>

--00000000000034cdd605ac4dccad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">What wou=
ld happen if something wasn&#39;t in the approved devices list?<br>Print a =
warning? Assert? I don&#39;t have any problems with this approach.<br></blo=
ckquote><div>I think currently in PSUSensors if the name of the device isn&=
#39;t in <a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src=
/PSUSensorMain.cpp#L59">pmBusNames</a>=C2=A0 then PSUSensors refuses to mon=
itor that particular device (<a href=3D"https://github.com/openbmc/dbus-sen=
sors/blob/master/src/PSUSensorMain.cpp#L269">https://github.com/openbmc/dbu=
s-sensors/blob/master/src/PSUSensorMain.cpp#L269</a>).=C2=A0</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">It would be nice if=
 this list could be (in the future) extended to all<br>sensor types.</block=
quote><div>Sure, I&#39;ll start with PSUSensors first.</div><div>=C2=A0</di=
v><div></div><div><br></div><div>A quick word about the original topic of t=
his thread; we picked hwmontemp=C2=A0sensors where possible because we&#39;=
ve seen performance issues for PSUSensors (could be N seconds before Sensor=
.Value gets updated to dbus). This has undesirable implications for PID loo=
ps..<br></div><div>thought was that spreading temp sensors over into hwmont=
emp sensor where possible would help mitigate the performance issue until w=
e can figure out a better long term solution.</div><div>=C2=A0</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Aug 7, 2020 at 11:17 AM James Feist &lt;<a href=3D"mailto:james.feist@linu=
x.intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 8/7/2020 11:04 AM, Jason Ling wr=
ote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yeah that&#39;s what I meant, a generic PSUSensor T=
ype with a field called<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;Export&#39; or something that EM can use to ge=
t the Export type.<br>
&gt; <br>
&gt; Sure, I think that handles the EM side of things.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m conflicted on that.=C2=A0 Part of the reaso=
n that list is there, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0not in the config files directly, is to convey that=
 those are the<br>
&gt;=C2=A0 =C2=A0 =C2=A0types that have been tested to work correctly, and =
the types that the<br>
&gt;=C2=A0 =C2=A0 =C2=A0config files &quot;promise&quot; to work sanely.=C2=
=A0 The other thing is, if you&#39;ve<br>
&gt;=C2=A0 =C2=A0 =C2=A0done the testing, adding to that list is (should be=
) relatively<br>
&gt;=C2=A0 =C2=A0 =C2=A0trivial and straightforward.=C2=A0 Opening up that =
list to runtime parsing<br>
&gt;=C2=A0 =C2=A0 =C2=A0opens a lot of security questions I&#39;m not prepa=
red to answer.<br>
&gt; <br>
&gt; Sure, let&#39;s scrap runtime parsing and go for something far simpler=
.<br>
&gt; (1) have a base type, devices list that represents the approved device=
 list.<br>
&gt; (2) have an empty extended type, device list that represents user <br>
&gt; specified extensions.<br>
&gt; (3) factor these out into separate files and provide a method that <br=
>
&gt; returns the union of the base and extended types/devices.<br>
&gt; <br>
&gt; now we have a base type/device list that contains supported guaranteed=
 <br>
&gt; devices and another extended type/device list that is easier to mainta=
in <br>
&gt; patches for.<br>
&gt; I think that&#39;s a rather small change and accomplishes what I&#39;d=
 like <br>
&gt; while preserving the intent of keeping a list of supported types/devic=
es.<br>
&gt; What do you think?<br>
<br>
What would happen if something wasn&#39;t in the approved devices list? <br=
>
Print a warning? Assert? I don&#39;t have any problems with this approach. =
<br>
It would be nice if this list could be (in the future) extended to all <br>
sensor types.<br>
</blockquote></div>

--00000000000034cdd605ac4dccad--
