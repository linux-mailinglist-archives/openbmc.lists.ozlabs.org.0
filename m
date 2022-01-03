Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82888482EA2
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 08:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JS6Kv2wJFz304x
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 18:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HYhaMqBc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HYhaMqBc; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JS6KV3NVZz2xgb
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 18:08:28 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id o6so132526890edc.4
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jan 2022 23:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHZXehm927KzyKKNWTOoXfcUbZ7zByws6+ycWQTcJRc=;
 b=HYhaMqBcLuLMhGXhJqYmkLq48w7N/lEZYw0CwrF1XgidYeScNZRR+14e4IySLZgrHQ
 BvVUxVSX6lson2aNsp6guT4SH68hfA41J4Wxq5+2K7/owRDjXRGnX9jo/o4EmANv9VB/
 MGI8X5E8Rq5kjdCVa1EtutYuxvjD850AeVi9XG4BzlK6naWIGtdyb1VbOWGhdrub0Edr
 Qdqp14/lgCWAumC2q1XbAxYCmKQ4Ogb/2MTRme+mpn3przNfEM553HMiB0xMfoFwbQPy
 5ZBb2vqi65fwFV8f5mI0OtsQl0p+CCG7PGlqavTWY+UPV7/hbezXfUA/gd/zJpEJ268p
 mfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHZXehm927KzyKKNWTOoXfcUbZ7zByws6+ycWQTcJRc=;
 b=RuGXhc2ayuz1lIvW5jsjvt+U1XXhWOrm1U8TT3oClu2ZtiMiSaiwzxdEnQT9FAy0UW
 O5cHinm9WD2Viiv8nvjAU53tt+Qif+vjquGMx6BPdRRGHybxrizCkcCePZ8XBFhvZwKI
 qc/U82UDZ/o/w//GJkaEWg6J3vcOZkfehFG5NiBEfVMA6IjkViB79JiO+fl2Mnxtni0P
 F2U6pWT31JP7EEpgQdUAp4dIMXkwcqZ0Rt0Ch0PmJZ2FAcscp67tKlyMSrvwiiOkoc7T
 Uufw6HFL8cEDlyj0c8FvvPy/RpKw27E2sQn2Yny0sFWFyeXwSggyaXh3fwZd+4Vc5cEi
 2xLQ==
X-Gm-Message-State: AOAM530vHwv/vYnAkp+QKmbZJqeoY6GHXByn1YbxfjPofxq+8i7z5HEB
 Efc/ewxGglORVdmy7FMoPx11Y6ug5fQxyAgCg1Y=
X-Google-Smtp-Source: ABdhPJyUuO/ufuo4UMzhFTHJlFyGCAHNRToMF0FpriMYuHKke762OvazrowZI8q09vkzg4tbYesGFmbX4BzO3rET1c4=
X-Received: by 2002:a05:6402:d72:: with SMTP id
 ec50mr35909272edb.107.1641193698527; 
 Sun, 02 Jan 2022 23:08:18 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
 <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
 <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
 <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
 <5e028060-b1c8-c76d-6093-2560c66822ee@linux.vnet.ibm.com>
In-Reply-To: <5e028060-b1c8-c76d-6093-2560c66822ee@linux.vnet.ibm.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 3 Jan 2022 12:40:22 +0530
Message-ID: <CAA7TbcsoGm+=GH27hVShaLWiu1o=NSn9dG=VS+4_Mgc5vikbuQ@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000006889f805d4a82f60"
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
Cc: velumanit@hcl.com, Ed Tanous <edtanous@google.com>,
 Jayashree D <jayashree-d@hcl.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006889f805d4a82f60
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce for your response.

Please find below the entitymanager hwmon sensor configuration path for our
system.
https://github.com/openbmc/entity-manager/blob/master/configurations/FBYV2.json#L434

Thanks,
Kumar.



On Sat, Jan 1, 2022 at 1:42 AM Bruce Mitchell <
bruce.mitchell@linux.vnet.ibm.com> wrote:

> On 12/31/2021 09:30, Bruce Mitchell wrote:
> > On 12/20/2021 10:29, Ed Tanous wrote:
> >> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> >> <kumarthangavel.hcl@gmail.com> wrote:
> >>>
> >>> Hi All,
> >>>
> >>> Gentle Reminder on this.
> >>>
> >>> Thanks,
> >>> Kumar.
> >>>
> >>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel
> >>> <kumarthangavel.hcl@gmail.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>>
> >>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp
> Sensor.
> >>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab
> >>>>
> >>
> >> Bruce, this is your patch.  Could you take a look at the below and
> >> provide your input?
> >>
> >>>>
> >>>>
> >>>> While testing those changes in my platform, I found that each sensor
> >>>> in hwmon temp has been creating twice.
> >>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is
> >>>> created twice.
> >>>>
> >>>>
> >>>> /sys/class/hwmon/hwmon2/temp2_input
> >>>> /sys/class/hwmon/hwmon2/temp1_input
> >>>>
> >>>>
> >>>> Before your change, hwmon temp sensor will check whether the path is
> >>>> already exists or not.
> >>>> If it exists, it will skip and proceed with next path.
> >>>>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
> >>>>
> >>>>
> >>>>
> >>>> Could you please explain why it is creating twice in hwmon temp ?
> >>>>
> >>>>
> >>>> Journalctl log before your changes applied :
> >>>>
> >>>>
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> >>>> "/sys/class/hwmon/hwmon2/temp2_input"
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
> >>>> xyz.openbmc_project.Configuration.TMP421
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> >>>> "/sys/class/hwmon/hwmon2/temp1_input"
> >>>>
> >>>>
> >>>>
> >>>> Journalctl log after your changes applied :
> >>>>
> >>>>
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> "/sys/class/hwmon/hwmon2/temp2_input"
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> >>>> xyz.openbmc_project.Configuration.TMP421
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>
> >>>>
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> "/sys/class/hwmon/hwmon2/temp1_input"
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> >>>> xyz.openbmc_project.Configuration.TMP421
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> >>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>
> >>>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Kumar.
> >
> > I will give it quick look today.  Also today is my last day at IBM.
> >
>
> The problem I had to solve was that I was adding devices
> (DPS310 and Si7020 type) that has more than one sensor type
> per device, in this case under /sys/bus/iio/devices .
> So the loop cannot continue after finding the first sensor of
> the device.  I have not seen p10bmc /sys/class/hwmon temperature
> sensors being created twice, in this case the TMP75.
>
> What is the entity-manager configuration for your system?
> I suspect that the dbus-sensors Hwmon does not take into account
> some detail that is needs to related to entity-manager.
>
>
>

--0000000000006889f805d4a82f60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bruce for your response.<div><br></div><div>Please =
find below the entitymanager hwmon sensor configuration path for our system=
.</div><div><a href=3D"https://github.com/openbmc/entity-manager/blob/maste=
r/configurations/FBYV2.json#L434">https://github.com/openbmc/entity-manager=
/blob/master/configurations/FBYV2.json#L434</a><br></div><div><br></div><di=
v>Thanks,</div><div>Kumar.</div><div><br></div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 1=
, 2022 at 1:42 AM Bruce Mitchell &lt;<a href=3D"mailto:bruce.mitchell@linux=
.vnet.ibm.com">bruce.mitchell@linux.vnet.ibm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 12/31/2021 09:30, Bruce =
Mitchell wrote:<br>
&gt; On 12/20/2021 10:29, Ed Tanous wrote:<br>
&gt;&gt; On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel<br>
&gt;&gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_bla=
nk">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Gentle Reminder on this.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Kumar.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"=
_blank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; In dbus-sensors repo, I saw the patch for changes in Hwmon=
 Temp Sensor.<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/commit/=
544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f=
9c79a60faf8a26f410c1568e5341b22b7ab" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0=
fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b=
22b7ab</a> <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce, this is your patch.=C2=A0 Could you take a look at the belo=
w and<br>
&gt;&gt; provide your input?<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; While testing those changes in my platform, I found that e=
ach sensor <br>
&gt;&gt;&gt;&gt; in hwmon temp has been creating twice.<br>
&gt;&gt;&gt;&gt; After analyzed the patch, for below 2 paths SP_OUTLET_TEMP=
 sensor is <br>
&gt;&gt;&gt;&gt; created twice.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp2_input<br>
&gt;&gt;&gt;&gt; /sys/class/hwmon/hwmon2/temp1_input<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Before your change, hwmon temp sensor will check whether t=
he path is <br>
&gt;&gt;&gt;&gt; already exists or not.<br>
&gt;&gt;&gt;&gt; If it exists, it will skip and proceed with next path.<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/commit/=
544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f=
9c79a60faf8a26f410c1568e5341b22b7abL96" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3=
ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e53=
41b22b7abL96</a> <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Could you please explain why it is creating twice in hwmon=
 temp ?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Journalctl log before your changes applied :<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : <b=
r>
&gt;&gt;&gt;&gt; &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : <b=
r>
&gt;&gt;&gt;&gt; xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP=
_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path=
 : <br>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br=
>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path=
 : <br>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_=
TEMP<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : <b=
r>
&gt;&gt;&gt;&gt; &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Journalctl log after your changes applied :<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor ty=
pe : <br>
&gt;&gt;&gt;&gt; xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP=
_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br=
>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_=
TEMP<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; &quot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor ty=
pe : <br>
&gt;&gt;&gt;&gt; xyz.openbmc_project.Configuration.TMP421<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP=
_OUTLET_TEMP<br>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br=
>
&gt;&gt;&gt;&gt; Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : <b=
r>
&gt;&gt;&gt;&gt; /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_=
TEMP<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Kumar.<br>
&gt; <br>
&gt; I will give it quick look today.=C2=A0 Also today is my last day at IB=
M.<br>
&gt; <br>
<br>
The problem I had to solve was that I was adding devices<br>
(DPS310 and Si7020 type) that has more than one sensor type<br>
per device, in this case under /sys/bus/iio/devices .<br>
So the loop cannot continue after finding the first sensor of<br>
the device.=C2=A0 I have not seen p10bmc /sys/class/hwmon temperature<br>
sensors being created twice, in this case the TMP75.<br>
<br>
What is the entity-manager configuration for your system?<br>
I suspect that the dbus-sensors Hwmon does not take into account<br>
some detail that is needs to related to entity-manager.<br>
<br>
<br>
</blockquote></div>

--0000000000006889f805d4a82f60--
