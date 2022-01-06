Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119948649F
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 13:52:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV5qB1JS4z30LJ
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 23:52:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JsolqJ29;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JsolqJ29; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV5pl0kpRz305q
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 23:52:12 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id z9so8960099edm.10
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jan 2022 04:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MsNXUcvHWOPJyu3NNDTld0SLu9yVDFfZ4c7CS9L9k0c=;
 b=JsolqJ29I20fOTzBzP1JFHt68a9AWCVhaKwlVx/fRHNurBKeNaDcIF16tv188gM5ZR
 huBQmXx+muSGHmk/5cpoGCWpS1h3moAu9n/CtmSJDkW9OD3jRQaebSOMOtOqE+MKOSPs
 5HQUA/VTsQwcZ2aQ3QU7FRyyZwZdm5EXnhRZehaE1F2ULjpTt8q6EJkFx+UFtHYZ1fN3
 plUpZlnq3Hpej6DjXY4fDdxWqc2sCKre89s1OIu32CSUL80cWZ+G0aCJS0fl5p726fKy
 q8WofxWw2NcNSm1ravgh283vWKnU0/HpQ6vuAb6gIFXbs/b//uyp9OtPjzql4hjZ7Ada
 TCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MsNXUcvHWOPJyu3NNDTld0SLu9yVDFfZ4c7CS9L9k0c=;
 b=dpR4FZpckAPmCW374NV7bo/KV8MhLq+HcLA7zisFY85Hyp6fBIJkX6hulgnovQJKIh
 EiYuX1g2FuWPc24Zy618YcrHKFFKOdX4ApgcN3PLOwbc+WpmJlqFoy6U5j+/R/FTsd21
 4DBJB0plR+CrQcYPJgy6e4dNZM4GDP8ktYXJKVPBrG0DM5c/2KAJ6ZJyLVuL0DPm6vjr
 VqCu8k7Qg5pVGDsOwiAk85yXb00bVzHryPZ2MQeF7jxOH9z9V2pRmSEW2SO4Sa1kuQSe
 GQOjxCTqkmReSt5uz0jEU0TmcK3WNA+fOxvYsJyMChsIZua6bC3QtqUh/6yZYZp66Q7g
 I6aA==
X-Gm-Message-State: AOAM532eaAQbAPYbwoEIduLUgiPvJZAil5JscjjhCpo6XE8nuIeF5xoh
 K9k8+jV5EuqhWeEspiXdB/yVkIWTsHMC3WDeTTE=
X-Google-Smtp-Source: ABdhPJwv7Ij02Hyxi99aka4OfHhKPVN1OOkORFt3HxwF/HXHzixc/eyHpD9ltZXxo4UlheFWIXK+ACpiEzFZW6gLr4o=
X-Received: by 2002:a17:906:f8c2:: with SMTP id
 lh2mr46354185ejb.364.1641473526124; 
 Thu, 06 Jan 2022 04:52:06 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
 <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
 <CAH2-KxBMht4OaoVi=ceVa3w46Gp_Ejbfcv+M7apVtZj4Up1c0Q@mail.gmail.com>
In-Reply-To: <CAH2-KxBMht4OaoVi=ceVa3w46Gp_Ejbfcv+M7apVtZj4Up1c0Q@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 6 Jan 2022 18:24:10 +0530
Message-ID: <CAA7TbcvuvdLvSkSsObttDuF5bK7=roDeiETq1dxTPHo3RkbasQ@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000006ed28105d4e95646"
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
 Jayashree D <jayashree-d@hcl.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006ed28105d4e95646
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

  Please find the below patch to fix this issue.
  https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/50153

Thanks,
Kumar.

On Wed, Jan 5, 2022 at 12:08 AM Ed Tanous <edtanous@google.com> wrote:

> On Mon, Jan 3, 2022 at 1:09 PM Patrick Williams <patrick@stwcx.xyz> wrote=
:
> >
> > Ed,
> >
> > I think there are other commits needing the IIO functionality now. Ther=
e
> is at least the pending commit for Humidity that we=E2=80=99d like to get=
 merged. I
> think it is better to move forward with a fix rather than backwards with =
a
> revert at this point.
>
> Sure, if there are patches available to fix the regression, I'm happy
> to avoid the revert.  I'll let this sit another day or two to see if
> someone puts up a patch to fix the issue, but after that, we need to
> unbreak master, and in the absence of a patch to fix it, a revert is
> the next best option.
>
> >
> > Kumar/Jayashree,
> >
> > Can you dig into this and get to the bottom of it?
> >
> > - Patrick
> > Sent from my iPhone
> >
> > > On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
> > >
> > > =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
> > > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> > >>
> > >>> On 12/20/2021 10:29, Ed Tanous wrote:
> > >>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> > >>> <kumarthangavel.hcl@gmail.com> wrote:
> > >>>>
> > >>>> Hi All,
> > >>>>
> > >>>> Gentle Reminder on this.
> > >>>>
> > >>>> Thanks,
> > >>>> Kumar.
> > >>>>
> > >>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <
> kumarthangavel.hcl@gmail.com> wrote:
> > >>>>>
> > >>>>> Hi All,
> > >>>>>
> > >>>>>
> > >>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp
> Sensor.
> > >>>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7ab
> > >>>
> > >>> Bruce, this is your patch.  Could you take a look at the below and
> > >>> provide your input?
> > >>>
> > >>>>>
> > >>>>>
> > >>>>> While testing those changes in my platform, I found that each
> sensor in hwmon temp has been creating twice.
> > >>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor
> is created twice.
> > >>>>>
> > >>>>>
> > >>>>> /sys/class/hwmon/hwmon2/temp2_input
> > >>>>> /sys/class/hwmon/hwmon2/temp1_input
> > >>>>>
> > >>>>>
> > >>>>> Before your change, hwmon temp sensor will check whether the path
> is already exists or not.
> > >>>>> If it exists, it will skip and proceed with next path.
> > >>>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7abL96
> > >>>>>
> > >>>>>
> > >>>>> Could you please explain why it is creating twice in hwmon temp ?
> > >>>>>
> > >>>>>
> > >>>>> Journalctl log before your changes applied :
> > >>>>>
> > >>>>>
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
> xyz.openbmc_project.Configuration.TMP421
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name :
> SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> > >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> Journalctl log after your changes applied :
> > >>>>>
> > >>>>>
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> > >>>>>
> > >>>>>
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> > >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> Thanks,
> > >>>>>
> > >>>>> Kumar.
> > >>
> > >> I will give it quick look today.  Also today is my last day at IBM.
> > >>
> > >
> > > Do you plan on continuing this beyond your tenure at IBM?  If not, is
> > > someone taking this feature over for you?  Given it's been a few week=
s
> > > since this regression was reported, and I don't see any fixes in
> > > review, I'm leaning toward reverting it on master for the time being
> > > until someone puts up a patch to fix the issue.
> >
>

--0000000000006ed28105d4e95646
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>=C2=A0 Please find t=
he below patch to fix this issue.</div>=C2=A0=C2=A0<a aria-label=3D"Link ht=
tps://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/50153" title=3D"h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/50153" href=3D"h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/50153" rel=3D"no=
opener noreferrer" target=3D"_blank" tabindex=3D"-1" style=3D"box-sizing:bo=
rder-box;outline-style:none;color:rgb(98,100,167);text-decoration-line:none=
;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">https://gerrit.openbmc=
-project.xyz/c/openbmc/dbus-sensors/+/50153</a><br><div><br></div><div>Than=
ks,</div><div>Kumar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Jan 5, 2022 at 12:08 AM Ed Tanous &lt;<a =
href=3D"mailto:edtanous@google.com">edtanous@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jan 3, 2022 =
at 1:09 PM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=
=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; Ed,<br>
&gt;<br>
&gt; I think there are other commits needing the IIO functionality now. The=
re is at least the pending commit for Humidity that we=E2=80=99d like to ge=
t merged. I think it is better to move forward with a fix rather than backw=
ards with a revert at this point.<br>
<br>
Sure, if there are patches available to fix the regression, I&#39;m happy<b=
r>
to avoid the revert.=C2=A0 I&#39;ll let this sit another day or two to see =
if<br>
someone puts up a patch to fix the issue, but after that, we need to<br>
unbreak master, and in the absence of a patch to fix it, a revert is<br>
the next best option.<br>
<br>
&gt;<br>
&gt; Kumar/Jayashree,<br>
&gt;<br>
&gt; Can you dig into this and get to the bottom of it?<br>
&gt;<br>
&gt; - Patrick<br>
&gt; Sent from my iPhone<br>
&gt;<br>
&gt; &gt; On Jan 3, 2022, at 11:21 AM, Ed Tanous &lt;<a href=3D"mailto:ed@t=
anous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell<br>
&gt; &gt; &lt;<a href=3D"mailto:bruce.mitchell@linux.vnet.ibm.com" target=
=3D"_blank">bruce.mitchell@linux.vnet.ibm.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; On 12/20/2021 10:29, Ed Tanous wrote:<br>
&gt; &gt;&gt;&gt; On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel<br>
&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" targe=
t=3D"_blank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Hi All,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Gentle Reminder on this.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Thanks,<br>
&gt; &gt;&gt;&gt;&gt; Kumar.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel &lt;<=
a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">kumarthang=
avel.hcl@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Hi All,<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; In dbus-sensors repo, I saw the patch for changes=
 in Hwmon Temp Sensor.<br>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensor=
s/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad=
3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7=
d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1=
568e5341b22b7ab</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Bruce, this is your patch.=C2=A0 Could you take a look at=
 the below and<br>
&gt; &gt;&gt;&gt; provide your input?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; While testing those changes in my platform, I fou=
nd that each sensor in hwmon temp has been creating twice.<br>
&gt; &gt;&gt;&gt;&gt;&gt; After analyzed the patch, for below 2 paths SP_OU=
TLET_TEMP sensor is created twice.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp2_input<br>
&gt; &gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp1_input<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Before your change, hwmon temp sensor will check =
whether the path is already exists or not.<br>
&gt; &gt;&gt;&gt;&gt;&gt; If it exists, it will skip and proceed with next =
path.<br>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensor=
s/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad=
3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef89=
8fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f4=
10c1568e5341b22b7abL96</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Could you please explain why it is creating twice=
 in hwmon temp ?<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Journalctl log before your changes applied :<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Path : &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Type : xyz.openbmc_project.Configuration.TMP421<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Name : SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: =
Path : &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Journalctl log after your changes applied :<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Sensor type : xyz.openbmc_project.Configuration.TMP421<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Name : SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Sensor type : xyz.openbmc_project.Configuration.TMP421<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Name : SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: =
Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Kumar.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I will give it quick look today.=C2=A0 Also today is my last =
day at IBM.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Do you plan on continuing this beyond your tenure at IBM?=C2=A0 I=
f not, is<br>
&gt; &gt; someone taking this feature over for you?=C2=A0 Given it&#39;s be=
en a few weeks<br>
&gt; &gt; since this regression was reported, and I don&#39;t see any fixes=
 in<br>
&gt; &gt; review, I&#39;m leaning toward reverting it on master for the tim=
e being<br>
&gt; &gt; until someone puts up a patch to fix the issue.<br>
&gt;<br>
</blockquote></div>

--0000000000006ed28105d4e95646--
