Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB0484406
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 16:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSwlT20mKz2yfm
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 02:00:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q4TLx35H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q4TLx35H; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSwl32zmnz2x9P
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 01:59:58 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id u25so28227774edf.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2Ys4/Pea6b+g1Mftx59prNAISfe7h5JC7gPu0213lg=;
 b=q4TLx35HDJZ3y8tK1uc3Eo0E9WisenoROWUZ2u6MilebvUwjjoPsRRQZzagw26t9oM
 XohoHMUXZo2KsWUyALfC+hqc2eweC3ctCmUV5GTJvKDlLOXZ9MJsAMotaRuKHBWDwoJL
 ZQCG850UxGwhTpAP1N88F6skUvkCJu2TYNk5aRyqJTTNVYRbjkqqGxiadz7Z41YXtpON
 oaX/j7uhzWgE0oO9x6owzsQ6E6nynj9YL6hMJfCro4GAEW8cmNB5xkDiOQ3WKYTVM/Ju
 WSxiyVbY/stfcKFf/vYclCvmcDNpFFf115Bpn0erLY3yLFgRAEiviQcM6kI1uDlCpcH+
 yb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2Ys4/Pea6b+g1Mftx59prNAISfe7h5JC7gPu0213lg=;
 b=6iuXny5mZImwDHNXIaLsYwnvS0DWpZm9PnaiQfwlLa9pLWX+b+JuQ55L7+wR8mC1oo
 LPTmb6Sh8prJKqRk9elz0KxclyjOsClu5MuaRVxGNVq5P2wERuyg7ZDdYkIEx/KH4dSf
 cir52HFRBiZGcBNdQF53OPabBNKOPfLRni1s5vVq/I3MMKR10KDe/t2dVdNhK1x70/u/
 7zlheoVa08HnTzFejVkgWuVzgyBX06wYl2FCDObJbYPj/0DIM4kByr0SvzZIa2f+zM3b
 7ana44HfvZ4DOqftlHQjjb8NaK1pQ6Rn+cXACS9DL0vRZxQ5yPdV9X7VVdHFV588wbAb
 eypA==
X-Gm-Message-State: AOAM533c2k3jFamMTV1H2DSCrYcZe3QJmAERmca10q3cc+q6M4UmLpMb
 44ddW+o86KPVbT/awidbfsRC9TdWZ/JyQeSvFG0=
X-Google-Smtp-Source: ABdhPJyZOmcmtyiOmfvnJqmC7bpKzhtpRml0KOacmwCLmUsEcJ/eSfnYXsAzAzEqo5pLXWdehgVToSmTCcoOlHY+2eo=
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr40115004ejc.665.1641308392572; 
 Tue, 04 Jan 2022 06:59:52 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
 <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
 <CAA7TbcvDyDjLjagn9ePQ3DC4iNUF2jpw=0VecsPpLizJZj2BMw@mail.gmail.com>
 <d83cda1c-0663-7b30-8451-4e914d2fae7f@linux.ibm.com>
In-Reply-To: <d83cda1c-0663-7b30-8451-4e914d2fae7f@linux.ibm.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 4 Jan 2022 20:31:55 +0530
Message-ID: <CAA7TbcuqZgAPpVb3UxW1Oo5uw-+j3QeSHu6YTzzGYTQOF__LHw@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000b4cc0b05d4c2e31e"
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

--000000000000b4cc0b05d4c2e31e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Matt.

On Tue, Jan 4, 2022 at 8:06 PM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 1/4/2022 1:36 AM, Kumar Thangavel wrote:
> > Hi Patrick/Ed, We are already working on this to fix this issue. Since
> > that patch was submitted by Bruce, we posted this in the mailing list
> > to get his opinion. After fixing this issue, we will submit the patch
> > in gerrit. We need help in testing ZjQcmQRYFpfptBannerStart
> > ZjQcmQRYFpfptBannerEnd
> > Hi Patrick/Ed,
> >
> > We are already working on this to fix this issue. Since that patch was
> > submitted by Bruce, we posted this in the mailing list to get his
> > opinion.
> > After fixing this issue, we will submit the patch in gerrit. We need
> > help in testing this fix in IBM platforms.
> >
>
> I can help test on an IBM system.
>
> > Thanks,
> > Kumar.
> >
> >
> >
> >
> > On Tue, Jan 4, 2022 at 2:39 AM Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> >     Ed,
> >
> >     I think there are other commits needing the IIO functionality now.
> >     There is at least the pending commit for Humidity that we=E2=80=99d=
 like
> >     to get merged. I think it is better to move forward with a fix
> >     rather than backwards with a revert at this point.
> >
> >     Kumar/Jayashree,
> >
> >     Can you dig into this and get to the bottom of it?
> >
> >     - Patrick
> >     Sent from my iPhone
> >
> >     > On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
> >     >
> >     > =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
> >     > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >     >>
> >     >>> On 12/20/2021 10:29, Ed Tanous wrote:
> >     >>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> >     >>> <kumarthangavel.hcl@gmail.com> wrote:
> >     >>>>
> >     >>>> Hi All,
> >     >>>>
> >     >>>> Gentle Reminder on this.
> >     >>>>
> >     >>>> Thanks,
> >     >>>> Kumar.
> >     >>>>
> >     >>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel
> >     <kumarthangavel.hcl@gmail.com> wrote:
> >     >>>>>
> >     >>>>> Hi All,
> >     >>>>>
> >     >>>>>
> >     >>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon
> >     Temp Sensor.
> >     >>>>>
> >
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7ab
> >     >>>
> >     >>> Bruce, this is your patch.  Could you take a look at the below
> and
> >     >>> provide your input?
> >     >>>
> >     >>>>>
> >     >>>>>
> >     >>>>> While testing those changes in my platform, I found that
> >     each sensor in hwmon temp has been creating twice.
> >     >>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP
> >     sensor is created twice.
> >     >>>>>
> >     >>>>>
> >     >>>>> /sys/class/hwmon/hwmon2/temp2_input
> >     >>>>> /sys/class/hwmon/hwmon2/temp1_input
> >     >>>>>
> >     >>>>>
> >     >>>>> Before your change, hwmon temp sensor will check whether the
> >     path is already exists or not.
> >     >>>>> If it exists, it will skip and proceed with next path.
> >     >>>>>
> >
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7abL96
> >     >>>>>
> >     >>>>>
> >     >>>>> Could you please explain why it is creating twice in hwmon
> >     temp ?
> >     >>>>>
> >     >>>>>
> >     >>>>> Journalctl log before your changes applied :
> >     >>>>>
> >     >>>>>
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> >     "/sys/class/hwmon/hwmon2/temp2_input"
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
> >     xyz.openbmc_project.Configuration.TMP421
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name :
> >     SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> >     "/sys/class/hwmon/hwmon2/temp1_input"
> >     >>>>>
> >     >>>>>
> >     >>>>>
> >     >>>>> Journalctl log after your changes applied :
> >     >>>>>
> >     >>>>>
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     "/sys/class/hwmon/hwmon2/temp2_input"
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type
> >     : xyz.openbmc_project.Configuration.TMP421
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> >     SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >     >>>>>
> >     >>>>>
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     "/sys/class/hwmon/hwmon2/temp1_input"
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type
> >     : xyz.openbmc_project.Configuration.TMP421
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
> >     SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >     >>>>>
> >     >>>>>
> >     >>>>>
> >     >>>>> Thanks,
> >     >>>>>
> >     >>>>> Kumar.
> >     >>
> >     >> I will give it quick look today.  Also today is my last day at
> IBM.
> >     >>
> >     >
> >     > Do you plan on continuing this beyond your tenure at IBM?  If
> >     not, is
> >     > someone taking this feature over for you?  Given it's been a few
> >     weeks
> >     > since this regression was reported, and I don't see any fixes in
> >     > review, I'm leaning toward reverting it on master for the time
> being
> >     > until someone puts up a patch to fix the issue.
> >
>
>

--000000000000b4cc0b05d4c2e31e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Matt.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 8:06 PM Matt Spinler &=
lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linux.ibm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/4/2022 1:36 AM, Kumar Thangavel wrote:<br>
&gt; Hi Patrick/Ed, We are already working on this to fix this issue. Since=
 <br>
&gt; that patch was submitted by Bruce, we posted this in the mailing list =
<br>
&gt; to get his opinion. After fixing this issue, we will submit the patch =
<br>
&gt; in gerrit. We need help in testing ZjQcmQRYFpfptBannerStart <br>
&gt; ZjQcmQRYFpfptBannerEnd<br>
&gt; Hi=C2=A0Patrick/Ed,<br>
&gt;<br>
&gt; We are already working on this to fix this issue. Since that patch was=
 <br>
&gt; submitted by Bruce, we posted this in the mailing list to get his <br>
&gt; opinion.<br>
&gt; After fixing this issue, we will submit the patch in gerrit. We need <=
br>
&gt; help in testing this fix in IBM platforms.<br>
&gt;<br>
<br>
I can help test on an IBM system.<br>
<br>
&gt; Thanks,<br>
&gt; Kumar.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jan 4, 2022 at 2:39 AM Patrick Williams &lt;<a href=3D"mailto:=
patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Ed,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think there are other commits needing the IIO fun=
ctionality now.<br>
&gt;=C2=A0 =C2=A0 =C2=A0There is at least the pending commit for Humidity t=
hat we=E2=80=99d like<br>
&gt;=C2=A0 =C2=A0 =C2=A0to get merged. I think it is better to move forward=
 with a fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0rather than backwards with a revert at this point.<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Kumar/Jayashree,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Can you dig into this and get to the bottom of it?<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Patrick<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sent from my iPhone<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Jan 3, 2022, at 11:21 AM, Ed Tanous &lt;<a =
href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce=
 Mitchell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:bruce.mitchell@linux.vne=
t.ibm.com" target=3D"_blank">bruce.mitchell@linux.vnet.ibm.com</a>&gt; wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On 12/20/2021 10:29, Ed Tanous wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On Sun, Dec 19, 2021 at 9:11 PM Kumar =
Thangavel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; &lt;<a href=3D"mailto:kumarthangavel.h=
cl@gmail.com" target=3D"_blank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Hi All,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Gentle Reminder on this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Kumar.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; On Thu, Dec 16, 2021 at 1:56 PM Ku=
mar Thangavel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com"=
 target=3D"_blank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Hi All,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; In dbus-sensors repo, I saw th=
e patch for changes in Hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0Temp Sensor.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/dbus-sensors/=
commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b=
7fe091f9c79a60faf8a26f410c1568e5341b22b7ab" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d6=
84c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c156=
8e5341b22b7ab</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Bruce, this is your patch.=C2=A0 Could=
 you take a look at the below and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; provide your input?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; While testing those changes in=
 my platform, I found that<br>
&gt;=C2=A0 =C2=A0 =C2=A0each sensor in hwmon temp has been creating twice.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; After analyzed the patch, for =
below 2 paths SP_OUTLET_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0sensor is created twice.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp2_=
input<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp1_=
input<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Before your change, hwmon temp=
 sensor will check whether the<br>
&gt;=C2=A0 =C2=A0 =C2=A0path is already exists or not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; If it exists, it will skip and=
 proceed with next path.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/dbus-sensors/=
commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b=
7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe=
7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c=
1568e5341b22b7abL96</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Could you please explain why i=
t is creating twice in hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0temp ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Journalctl log before your cha=
nges applied :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Type :<br>
&gt;=C2=A0 =C2=A0 =C2=A0xyz.openbmc_project.Configuration.TMP421<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Name :<br>
&gt;=C2=A0 =C2=A0 =C2=A0SP_OUTLET_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Dbus path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Dbus path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
REMOTE_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Journalctl log after your chan=
ges applied :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Sensor type<br>
&gt;=C2=A0 =C2=A0 =C2=A0: xyz.openbmc_project.Configuration.TMP421<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Name :<br>
&gt;=C2=A0 =C2=A0 =C2=A0SP_OUTLET_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
REMOTE_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Sensor type<br>
&gt;=C2=A0 =C2=A0 =C2=A0: xyz.openbmc_project.Configuration.TMP421<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Name :<br>
&gt;=C2=A0 =C2=A0 =C2=A0SP_OUTLET_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwm=
ontempsensor[327]: Path :<br>
&gt;=C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/sensors/temperature/SP_OUTLET_=
REMOTE_TEMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Kumar.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I will give it quick look today.=C2=A0 Als=
o today is my last day at IBM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Do you plan on continuing this beyond your ten=
ure at IBM?=C2=A0 If<br>
&gt;=C2=A0 =C2=A0 =C2=A0not, is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; someone taking this feature over for you?=C2=
=A0 Given it&#39;s been a few<br>
&gt;=C2=A0 =C2=A0 =C2=A0weeks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; since this regression was reported, and I don&=
#39;t see any fixes in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; review, I&#39;m leaning toward reverting it on=
 master for the time being<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; until someone puts up a patch to fix the issue=
.<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000b4cc0b05d4c2e31e--
