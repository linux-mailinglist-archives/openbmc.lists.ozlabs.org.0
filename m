Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A582483CFA
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 08:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSksz5x7fz2ynj
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 18:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WJ3f/X2+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WJ3f/X2+; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSksX3F0fz2yZv
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jan 2022 18:34:54 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id b13so144876588edd.8
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jan 2022 23:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//VRVxLWbO+HBxKXp/eIBEW/9+D0wzD30W/lxBmk4Ik=;
 b=WJ3f/X2+yz1gZXxqrdtW73UMp5RcIKcSBFSgczj9dmr8A2x6EhQC7cb+RrjkhjJinS
 bazIPO61FCwjLxFjBlOK89DH32jwNKX62LroJ5HAyCUI5rFW1YHMKX5CRWU6zw1mARCM
 /ZFrSa9jPsW/KGYawxntADfJflQmqwlsNBXO7BoOhHGYdt9hPohPM6hy1H0Y+BNg8gVa
 NPJUxwGUQY0qLmcvQqpTus/TYLBXHgplTDCwIhrnaSlnAGyw32nR04ucsk3ahn8LShHb
 6LiN4W782QFrMpQk8G+Xr4FEk3BpimfnBUHe+PuVD/i9BQwiabTGjFm+Hd5jwzZH+fHY
 3vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//VRVxLWbO+HBxKXp/eIBEW/9+D0wzD30W/lxBmk4Ik=;
 b=KxMVfV4xXJmM5Qt4MjnYjkOfRDOmxAvNL95zZrlwP8YOiCP4L/USF8LQAGmc5Yq/FG
 TwE7tKTFKj8U5KVRkTAsD3KZRezTvJufrpLrRq7CVUXKauAjeAzAEanw5CulnJ22AOks
 uhPkyMcBRKoo7s8AEiKUQIScW1sEdEsBC9Hh6GWEf+6E2FzAuVDyFEzIwP0bofIT8uy/
 absybzt1Hk1lx1sHROKFbTNNJ0G4qh7hPBBN8J2LwKuPuqTcIeedPBqYqkHqkflUndOC
 89wY6HqEJ4eHDh7QYeaRede0tW++5loLHHuCc3OSeNsqM47I6nNtOecwkDzcsMOrWBe3
 G2LQ==
X-Gm-Message-State: AOAM530ScqixBhYqbLuD7zeQxIYlSblwot20KHPrxNQZQV/ScQzAtWWH
 lru9XVBYSXCcbBLsqumBsG/jTmZVYzmIQPnyP6U=
X-Google-Smtp-Source: ABdhPJzgUJ4Q7mGRaiH03rstV6hRkapaR6eScQUfWAqcw1l0nHY0a8NnWWhFnIbTB9+QGKF3wuLMEu3MafjSxwsynhw=
X-Received: by 2002:a17:906:65c8:: with SMTP id
 z8mr41433816ejn.727.1641281686318; 
 Mon, 03 Jan 2022 23:34:46 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
 <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
In-Reply-To: <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 4 Jan 2022 13:06:49 +0530
Message-ID: <CAA7TbcvDyDjLjagn9ePQ3DC4iNUF2jpw=0VecsPpLizJZj2BMw@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000e3b10d05d4bcabae"
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e3b10d05d4bcabae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick/Ed,

      We are already working on this to fix this issue. Since that patch
was submitted by Bruce, we posted this in the mailing list to get his
opinion.
After fixing this issue, we will submit the patch in gerrit. We need help
in testing this fix in IBM platforms.

Thanks,
Kumar.




On Tue, Jan 4, 2022 at 2:39 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> Ed,
>
> I think there are other commits needing the IIO functionality now. There
> is at least the pending commit for Humidity that we=E2=80=99d like to get=
 merged. I
> think it is better to move forward with a fix rather than backwards with =
a
> revert at this point.
>
> Kumar/Jayashree,
>
> Can you dig into this and get to the bottom of it?
>
> - Patrick
> Sent from my iPhone
>
> > On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
> >
> > =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>
> >>> On 12/20/2021 10:29, Ed Tanous wrote:
> >>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> >>> <kumarthangavel.hcl@gmail.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> Gentle Reminder on this.
> >>>>
> >>>> Thanks,
> >>>> Kumar.
> >>>>
> >>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <
> kumarthangavel.hcl@gmail.com> wrote:
> >>>>>
> >>>>> Hi All,
> >>>>>
> >>>>>
> >>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp
> Sensor.
> >>>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7ab
> >>>
> >>> Bruce, this is your patch.  Could you take a look at the below and
> >>> provide your input?
> >>>
> >>>>>
> >>>>>
> >>>>> While testing those changes in my platform, I found that each senso=
r
> in hwmon temp has been creating twice.
> >>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor i=
s
> created twice.
> >>>>>
> >>>>>
> >>>>> /sys/class/hwmon/hwmon2/temp2_input
> >>>>> /sys/class/hwmon/hwmon2/temp1_input
> >>>>>
> >>>>>
> >>>>> Before your change, hwmon temp sensor will check whether the path i=
s
> already exists or not.
> >>>>> If it exists, it will skip and proceed with next path.
> >>>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7abL96
> >>>>>
> >>>>>
> >>>>> Could you please explain why it is creating twice in hwmon temp ?
> >>>>>
> >>>>>
> >>>>> Journalctl log before your changes applied :
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
> xyz.openbmc_project.Configuration.TMP421
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name :
> SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
> >>>>>
> >>>>>
> >>>>>
> >>>>> Journalctl log after your changes applied :
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>>
> >>>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Kumar.
> >>
> >> I will give it quick look today.  Also today is my last day at IBM.
> >>
> >
> > Do you plan on continuing this beyond your tenure at IBM?  If not, is
> > someone taking this feature over for you?  Given it's been a few weeks
> > since this regression was reported, and I don't see any fixes in
> > review, I'm leaning toward reverting it on master for the time being
> > until someone puts up a patch to fix the issue.
>
>

--000000000000e3b10d05d4bcabae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Patrick/Ed,<div><br></div><div>=C2=A0 =C2=A0 =C2=
=A0=C2=A0<span style=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot=
;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-s=
erif;font-size:14px">We are already working on this to fix this issue. Sinc=
e that patch was submitted by Bruce, we posted this in the mailing list to =
get his opinion.=C2=A0</span></div><span style=3D"color:rgb(36,36,36);font-=
family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;,sans-serif;font-size:14px">After fixing this issue, we =
will submit the patch in gerrit. We need help in testing this fix in IBM pl=
atforms.</span><div><font color=3D"#242424" face=3D"Segoe UI, system-ui, Ap=
ple Color Emoji, Segoe UI Emoji, sans-serif"><span style=3D"font-size:14px"=
><br></span></font></div><div><font color=3D"#242424" face=3D"Segoe UI, sys=
tem-ui, Apple Color Emoji, Segoe UI Emoji, sans-serif"><span style=3D"font-=
size:14px">Thanks,</span></font></div><div><font color=3D"#242424" face=3D"=
Segoe UI, system-ui, Apple Color Emoji, Segoe UI Emoji, sans-serif"><span s=
tyle=3D"font-size:14px">Kumar.<br></span></font><div><font color=3D"#242424=
" face=3D"Segoe UI, system-ui, Apple Color Emoji, Segoe UI Emoji, sans-seri=
f"><span style=3D"font-size:14px">=C2=A0<br></span></font><div><span style=
=3D"color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px"=
><br></span></div><div><span style=3D"color:rgb(36,36,36);font-family:&quot=
;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;,sans-serif;font-size:14px"><br></span></div></div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan=
 4, 2022 at 2:39 AM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xy=
z">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Ed,<br>
<br>
I think there are other commits needing the IIO functionality now. There is=
 at least the pending commit for Humidity that we=E2=80=99d like to get mer=
ged. I think it is better to move forward with a fix rather than backwards =
with a revert at this point. <br>
<br>
Kumar/Jayashree,<br>
<br>
Can you dig into this and get to the bottom of it?<br>
<br>
- Patrick<br>
Sent from my iPhone<br>
<br>
&gt; On Jan 3, 2022, at 11:21 AM, Ed Tanous &lt;<a href=3D"mailto:ed@tanous=
.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; <br>
&gt; =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell<br>
&gt; &lt;<a href=3D"mailto:bruce.mitchell@linux.vnet.ibm.com" target=3D"_bl=
ank">bruce.mitchell@linux.vnet.ibm.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt;&gt; On 12/20/2021 10:29, Ed Tanous wrote:<br>
&gt;&gt;&gt; On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"=
_blank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Gentle Reminder on this.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt; Kumar.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel &lt;<a hre=
f=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">kumarthangavel.=
hcl@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; In dbus-sensors repo, I saw the patch for changes in H=
wmon Temp Sensor.<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/com=
mit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe=
091f9c79a60faf8a26f410c1568e5341b22b7ab" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c=
3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5=
341b22b7ab</a><br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Bruce, this is your patch.=C2=A0 Could you take a look at the =
below and<br>
&gt;&gt;&gt; provide your input?<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; While testing those changes in my platform, I found th=
at each sensor in hwmon temp has been creating twice.<br>
&gt;&gt;&gt;&gt;&gt; After analyzed the patch, for below 2 paths SP_OUTLET_=
TEMP sensor is created twice.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp2_input<br>
&gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp1_input<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Before your change, hwmon temp sensor will check wheth=
er the path is already exists or not.<br>
&gt;&gt;&gt;&gt;&gt; If it exists, it will skip and proceed with next path.=
<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/com=
mit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe=
091f9c79a60faf8a26f410c1568e5341b22b7abL96" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d6=
84c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c156=
8e5341b22b7abL96</a><br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Could you please explain why it is creating twice in h=
wmon temp ?<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Journalctl log before your changes applied :<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path =
: &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type =
: xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name =
: SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus =
path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus =
path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path =
: &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Journalctl log after your changes applied :<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Senso=
r type : xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name =
: SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Senso=
r type : xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name =
: SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path =
: /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Kumar.<br>
&gt;&gt; <br>
&gt;&gt; I will give it quick look today.=C2=A0 Also today is my last day a=
t IBM.<br>
&gt;&gt; <br>
&gt; <br>
&gt; Do you plan on continuing this beyond your tenure at IBM?=C2=A0 If not=
, is<br>
&gt; someone taking this feature over for you?=C2=A0 Given it&#39;s been a =
few weeks<br>
&gt; since this regression was reported, and I don&#39;t see any fixes in<b=
r>
&gt; review, I&#39;m leaning toward reverting it on master for the time bei=
ng<br>
&gt; until someone puts up a patch to fix the issue.<br>
<br>
</blockquote></div>

--000000000000e3b10d05d4bcabae--
