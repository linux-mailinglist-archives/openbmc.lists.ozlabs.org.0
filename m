Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE34B360E
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 09:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WzDG2D53zF3Hj
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 17:59:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iDomNEPQ"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WzCX4qdWzF1rp
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 17:59:03 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id 67so34725283oto.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46KTOiBljX+YO4Vj0Yv6+FPEBKUIAJRKT8QSvs4J+P0=;
 b=iDomNEPQZlzhxxpsSnd4qr/9utp4szgTff6YEf98SQaVOn0kX6zJ8Hfrgw1ztwGSml
 XiI6YLq0RCpFsQOAWtlyVfEz2g6+7GDpmzgAR7b4u/RMzxmKynKpgHhKVRKI3tZL9RWb
 VdExhnmExs8OTuYowAFccLZ8vlpUsAttm8MNBfNPTNLCiCyPlS2Lv8insLzg/ropi93P
 2My9W4sHPPdmD75O0YwwJ1OB4AS1ieWS9h9cCp9wxq/ZkOz10qXh1RP0PLEEJTkFhxVW
 lpQwDnI8oVzJIj5aZ/duKAg4PBC/3B4uvet0/x+En8SYOHfLlgI8YfiZW9BwUjC6BW3v
 w6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46KTOiBljX+YO4Vj0Yv6+FPEBKUIAJRKT8QSvs4J+P0=;
 b=T+iPSjVh2fzzjDSiavbYZ3tVzl0vatl9YEv8SEe8L/puGVSQp4YQVNGYMCNort6vgj
 QBm76JVbCC9akqAKJWLUyiWZMJbqktBfS91b8JwVoVLbSTooIdNmI0+GAoQH9ZXseAq8
 tKYTQN+i9z/UPYR0HDXr1C+Nh7yU531Xi7pyAkbAwYmIA12yc+lPXgTjs6YjjzdusTo+
 pjLn0RB2UurPnPzvZQd+hd10kAQXYHk/+nu3Wek1r3ScWlgR7IG/nu1tp+QLvO8DqTfd
 yig/kP3IwLTZY4AiBo71ofqwxhVfFwfL3jT/DL8ZLb7ACSs/nGIK8Mp9mMGjqKeJhnBJ
 FFNA==
X-Gm-Message-State: APjAAAVq/DUA2eWcRjF0UG6d4Ijim1V6hFNcxO8l9HRCPF6NMJHlmB6H
 u030CD0U0SiognFnjminQE1mj/dXorbTwIssi0k=
X-Google-Smtp-Source: APXvYqxMuDHYUEz3eTsAize+ADxyBHQqSTwri8vfPTcn0E3rzZWpODITvMN4r3Cz7hrRlC8wsTAv/gidrNMkruZD/PE=
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr38715503oth.317.1568620740673; 
 Mon, 16 Sep 2019 00:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLGtWJ-aJKRPt812zc1yj8TVBVxcSR1KX5_NznoVxJg7Fg@mail.gmail.com>
 <OF0AEE1426.28DFDF49-ON00258477.0027585E-65258477.00278E77@notes.na.collabserv.com>
In-Reply-To: <OF0AEE1426.28DFDF49-ON00258477.0027585E-65258477.00278E77@notes.na.collabserv.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 16 Sep 2019 13:27:06 +0530
Message-ID: <CAE33tLHTE3pLOAN9C1z5_CFFJ7fR-YkfRLQSZiP5LQ-r728oSg@mail.gmail.com>
Subject: Re: CurrentBMCState: BMCState.NotReady
To: George Keishing <gkeishin@in.ibm.com>
Content-Type: multipart/related; boundary="000000000000091b6b0592a6fa16"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000091b6b0592a6fa16
Content-Type: multipart/alternative; boundary="000000000000091b690592a6fa15"

--000000000000091b690592a6fa15
Content-Type: text/plain; charset="UTF-8"

root@s2600wf:~# systemctl list-jobs --no-pager
JOB UNIT                                                            TYPE
 STATE
111 mapper-wait@-xyz-openbmc_project-state-host0.service            start
running
151 mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service start
running
143 obmc-host-reset-running@0.target                                start
waiting
145 op-reset-chassis-on@0.service                                   start
waiting
169 xyz.openbmc_project.State.Host.service                          start
waiting
149 op-reset-chassis-running@0.service                              start
waiting
154 phosphor-reset-sensor-states@0.service                          start
waiting
163 xyz.openbmc_project.Time.Manager.service                        start
waiting
146 obmc-power-reset-on@0.target                                    start
waiting
141 phosphor-reset-host-check@0.service                             start
waiting
140 obmc-host-reset@0.target                                        start
waiting
109 phosphor-discover-system-state@0.service                        start
waiting
152 phosphor-reset-host-running@0.service                           start
waiting
 97 obmc-led-group-start@bmc_booted.service                         start
waiting
  1 multi-user.target                                               start
waiting

15 jobs listed.

On Mon, Sep 16, 2019 at 12:42 PM George Keishing <gkeishin@in.ibm.com>
wrote:

> Probably the host services are still not up and started as per the log
> there.
>
> *systemctl list-jobs --no-pager | cat*
>
> You can check like that to see what services are pending to complete and
> perhaps take the journalctl --no-pager logs and see what services are
> crashing out.
>
> That should help where to look at.
>
>
> *Thanks and Regards,*
>
>
> [image: Inactive hide details for AKASH G J ---16-09-2019 12:08:46---Hi
> all, root@s2600wf:~# cat /etc/os-release]AKASH G J ---16-09-2019
> 12:08:46---Hi all, root@s2600wf:~# cat /etc/os-release
>
> From: AKASH G J <akashgj91@gmail.com>
> To: openbmc@lists.ozlabs.org
> Date: 16-09-2019 12:08
> Subject: [EXTERNAL] CurrentBMCState: BMCState.NotReady
> Sent by: "openbmc" <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
> ------------------------------
>
>
>
> Hi all,
>
> root@s2600wf:~# cat /etc/os-release
> ID="openbmc-phosphor"
> NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> VERSION="2.8.0-dev"
> VERSION_ID="2.8.0-dev-309-g2e155a0-dirty"
> PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
> 2.8.0"
> BUILD_ID="2.8.0-dev"
> OPENBMC_TARGET_MACHINE="s2600wf"
>
> The BMC console shows that the BMC state is '*Not Ready*'.
>
> root@s2600wf:~# obmcutil state
> CurrentBMCState     : xyz.openbmc_project.State.BMC.BMCState.NotReady
> CurrentPowerState   : xyz.openbmc_project.State.Chassis.PowerState.Off
> Error finding '/xyz/openbmc_project/state/host0' service: No such file or
> directory
>
>
> Regards,
> Akash
>
>
>

--000000000000091b690592a6fa15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">root@s2600wf:~# systemctl list-jobs --no-pager<br>JOB UNIT=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE =C2=A0ST=
ATE =C2=A0<br>111 mapper-wait@-xyz-openbmc_project-state-host0.service =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start running<br>151 mapper-wait@-xyz=
-openbmc_project-Chassis-Control-Power0.service start running<br>143 obmc-h=
ost-reset-running@0.target =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start waitin=
g<br>145 op-reset-chassis-on@0.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 start waiting<br>169 xyz.openbmc_project.State.Host.service =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0start waiting<br>149 op-reset-chassis-running@0.service =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0start waiting<br>154 phosphor-reset-sensor-states@0=
.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0start waiting<br>163 xyz.openbmc_project.Time.Manag=
er.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0start waiting<br>146 obmc-power-reset-on@0.target =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start waiting<br>141 phosph=
or-reset-host-check@0.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start waiting<br>140 o=
bmc-host-reset@0.target =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0start waiting<br>109 phosphor-discover-system-state@0.serv=
ice =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0start waiting<br>152 phosphor-reset-host-running@0.service =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 start waiting<br>=C2=A097 obmc-led-group-start@bmc_booted.ser=
vice =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 start waiting<br>=C2=A0 1 multi-user.target =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start=
 waiting<br><br>15 jobs listed.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Sep 16, 2019 at 12:42 PM George Keis=
hing &lt;<a href=3D"mailto:gkeishin@in.ibm.com">gkeishin@in.ibm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>=
<font face=3D"Calibri">Probably the host services are still not up and star=
ted as per the log there.</font><br><br><i><font face=3D"Calibri">systemctl=
=C2=A0list-jobs --no-pager | cat</font></i> <br><br><font size=3D"2">You ca=
n check like that to see what services are pending to complete and perhaps =
take the   </font><font face=3D"Calibri">journalctl=C2=A0--no-pager</font> =
<font size=3D"2">   logs and see what services are crashing out. </font><br=
><br><font size=3D"2">That should help where to look at.</font><br><br><br>=
<b><font size=3D"2" color=3D"#0000FF">Thanks and Regards,</font></b><br><br=
><br><img src=3D"cid:16d3912748b308fca931" alt=3D"Inactive hide details for=
 AKASH G J ---16-09-2019 12:08:46---Hi all, root@s2600wf:~# cat /etc/os-rel=
ease" width=3D"16" height=3D"16" border=3D"0"><font size=3D"2" color=3D"#42=
4282">AKASH G J ---16-09-2019 12:08:46---Hi all, root@s2600wf:~# cat /etc/o=
s-release</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </f=
ont><font size=3D"2">AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" t=
arget=3D"_blank">akashgj91@gmail.com</a>&gt;</font><br><font size=3D"2" col=
or=3D"#5F5F5F">To:        </font><font size=3D"2"><a href=3D"mailto:openbmc=
@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a></font><br=
><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">16=
-09-2019 12:08</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:       =
 </font><font size=3D"2">[EXTERNAL] CurrentBMCState: BMCState.NotReady</fon=
t><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=
=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+gkeishin=3D<a href=3D"mailto=
:in.ibm.com@lists.ozlabs.org" target=3D"_blank">in.ibm.com@lists.ozlabs.org=
</a>&gt;</font><br></p><hr style=3D"color:rgb(128,145,165)" width=3D"100%" =
size=3D"2" noshade align=3D"left"><br><br><br>Hi all,<br><br>root@s2600wf:~=
# cat /etc/os-release <br>ID=3D&quot;openbmc-phosphor&quot;<br>NAME=3D&quot=
;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)&quot;<br>VERS=
ION=3D&quot;2.8.0-dev&quot;<br>VERSION_ID=3D&quot;2.8.0-dev-309-g2e155a0-di=
rty&quot;<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project=
 Reference Distro) 2.8.0&quot;<br>BUILD_ID=3D&quot;2.8.0-dev&quot;<br>OPENB=
MC_TARGET_MACHINE=3D&quot;s2600wf&quot;<br><br>The BMC console shows that t=
he BMC state is &#39;<b>Not Ready</b>&#39;.<br><br>root@s2600wf:~# obmcutil=
 state<br>CurrentBMCState =C2=A0 =C2=A0 : xyz.openbmc_project.State.BMC.BMC=
State.NotReady<br>CurrentPowerState =C2=A0 : xyz.openbmc_project.State.Chas=
sis.PowerState.Off<br>Error finding &#39;/xyz/openbmc_project/state/host0&#=
39; service: No such file or directory<br><br><br>Regards,<br>Akash<br><br>=
<br>
<p></p></div>
</blockquote></div>

--000000000000091b690592a6fa15--

--000000000000091b6b0592a6fa16
Content-Type: image/gif; name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-Transfer-Encoding: base64
Content-ID: <16d3912748b308fca931>
X-Attachment-Id: 16d3912748b308fca931

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--000000000000091b6b0592a6fa16--
