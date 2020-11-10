Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E66772ACED9
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 06:04:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVbPT0gNbzDqcl
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 16:04:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HSATgnet; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVbK930LNzDqg7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 16:00:29 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id t191so9182765qka.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2020 21:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhfKLL7SMUeBAfH0QEkMQoIgBsRJ4kOeOrW2qXnAV8g=;
 b=HSATgnetQfuGysN3bEYkMT/g1kClY7MCoGnqyG7rn/LMVv7JfaScJN0vUrEXtmWxlq
 frOUuJtDX3kr87QcZW8Orl5s2MK5SPPKLMK4FRKCfwRDPTy4je4kDTcQjjqzSn25WpiP
 xoun1xekNB9nDOuCHkJMflDQJn3KeW58hHw++sj+EazMtMi2HSC0zEjDHR3K3uYNsPpc
 p8FR/VVWzvolI3AvU4CQKKIMuvYdrLO2pdi5JH6LUqKOxf+ZHYy47AymUJ0NMqUeIOhd
 w6vAjd5LIj/jnAuvloerHOaCzirfQm3NSyt60F3qSvbveZarIDhl2RTks/5Hgw0F/Qn1
 xZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhfKLL7SMUeBAfH0QEkMQoIgBsRJ4kOeOrW2qXnAV8g=;
 b=hQmD7bZC0P9awX5ATtxtnqPSBHovPU4KsspJ2mvupRk0VLRTxUKeXK5mymwTni86+1
 Z3dhGS8APtcNK4sVUDu28gvPDTxG8JuiLJeKsQV10v7lNkPEEWt+i8cydY4oIZwe7ff+
 kZzFmTGRD8gOxwvBBpxNr2aGRCx8gZeHbQFDhSUsieBEu7XshDHWtCIokvFQMHx+hiSW
 Xpfpp/oZ07G5pFqc4jA9TYF+iuXSO2z06TUot6SeKn9ET5tP9vPk1C75omMrxxIuXoYD
 zhCpzAVvwVnfrtKcjywnqmV8yNnJu2n9X6hqPhZRk90NGa7askrECqKnc/FM/L0BZU/8
 l3HQ==
X-Gm-Message-State: AOAM532LVQB0vPPZaj5eHhVGl8u/0gxEmGtO8xhy8vfC5U5sRO56DZkm
 /WLn0haodWfJ68gfVFAouOCFbmGfrOm1f0KOqC0=
X-Google-Smtp-Source: ABdhPJzsMcfoCL0jtSGBgQzpU5LSDgC5+G/52TFudA4M+1NCBEZ0AsnDKjGpKtWG5On7jaM+wH/QvAeOgiB6zpH56V0=
X-Received: by 2002:a37:7f83:: with SMTP id
 a125mr17180802qkd.423.1604984422837; 
 Mon, 09 Nov 2020 21:00:22 -0800 (PST)
MIME-Version: 1.0
References: <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
 <CALioo35DvdU8KsTJbB9RQiLQ+Md6gTW3TYeNy8qitVZLQzHK=A@mail.gmail.com>
 <OF8D57E4C0.929A4052-ON0025861B.00159DF0-0025861B.00165862@notes.na.collabserv.com>
 <CALioo37f6Katzcag-hgA=u_spHOdeQw5WbvSapAs=qMyiwOxYg@mail.gmail.com>
 <5FAA16C5.3050103@linux.intel.com>
In-Reply-To: <5FAA16C5.3050103@linux.intel.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Tue, 10 Nov 2020 12:00:11 +0700
Message-ID: <CALioo35HQx9uNKjr5HzG+AkHb0AdAk3sAQS=ZrfPJevUWgoJUA@mail.gmail.com>
Subject: Re: Re: phosphor-logging: entry() failed parse message.
To: "chunhui.jia" <chunhui.jia@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000064b25c05b3b98e38"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ramesh I I1 <rameshi1@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000064b25c05b3b98e38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok.
It is clear now.

Thanks Chunhui.
Thu Nguyen.

On Tue, Nov 10, 2020 at 11:27 AM chunhui.jia <chunhui.jia@linux.intel.com>
wrote:

> The data embedded in your entry() is meta-data.   Use '-overbose' option
> in journalctl command to print.
>
> journalctl -ef -overbose
> >>
> Tue 2020-11-10 12:28:43.472063 UTC
> [s=3D93d61b6180db407d8f32924833a6954d;i=3D10c4;b=3D0ba0603a97814c2bb3d22f=
4857b5f964;m=3D13e4a3855c;t=3D5b3bfd1cbc915;x=3Dbac5bbc519880cdf]
>     _UID=3D0
>     _GID=3D0
>     _CAP_EFFECTIVE=3D3fffffffff
>     _BOOT_ID=3D0ba0603a97814c2bb3d22f4857b5f964
>     _MACHINE_ID=3Db1d2788fe17541c0ba0363cd0f0aa699
>     _HOSTNAME=3Dintel-obmc
>     _SYSTEMD_SLICE=3Dsystem.slice
>     _TRANSPORT=3Djournal
>     PRIORITY=3D3
>
> CODE_FILE=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+04a38ed10d-r0/re=
cipe-sysroot/usr/include/phosphor-logging/log.hpp
>     CODE_LINE=3D76
>     CODE_FUNC=3Dhelper_log
>     TRANSACTION_ID=3D4091710023
>     SYSLOG_IDENTIFIER=3Dipmid
>     _PID=3D245
>     _COMM=3Dipmid
>     _EXE=3D/usr/bin/ipmid
>     _CMDLINE=3Dipmid
>     _SYSTEMD_CGROUP=3D/system.slice/phosphor-ipmi-host.service
>     _SYSTEMD_UNIT=3Dphosphor-ipmi-host.service
>     _SYSTEMD_INVOCATION_ID=3D62df2ae5590c48a2b79ffe6843c3681c
>     MESSAGE=3DFailed to GetAll
>     INTF=3Dxyz.openbmc_project.Inventory.Decorator.Ipmi
>     WHAT=3Dsd_bus_call: org.freedesktop.DBus.Error.UnknownInterface: Unkn=
own
> interface 'xyz.openbmc_project.Inventory.Decorator.Ipmi'.
>
> PATH=3D/xyz/openbmc_project/inventory/system/powersupply/SOLUM_CO_IS162F2=
2_PSU1
>     _SOURCE_REALTIME_TIMESTAMP=3D1605011323472063
>
> 2020-11-10
> ------------------------------
> chunhui.jia
> ------------------------------
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Thu Ba Nguyen <tbnguyen1985@gmail.c=
om>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A*2020-11-10 06:35
> *=E4=B8=BB=E9=A2=98=EF=BC=9A*Re: phosphor-logging: entry() failed parse m=
essage.
> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*"Ramesh I I1"<rameshi1@in.ibm.com>
> *=E6=8A=84=E9=80=81=EF=BC=9A*"OpenBMC Maillist"<openbmc@lists.ozlabs.org>
>
> Thanks Ramesh,
>
> But your commands are applied for some messages.
> And don't answer my questions.
> "Do I need to add any option when building?" to make phosphor-logging
> print message in entry().
>
> Regards.
> Thu Nguyen.
>
>
>
>
> On Mon, Nov 9, 2020 at 11:04 AM Ramesh I I1 <rameshi1@in.ibm.com> wrote:
>
>> Hi Thu Nguyen,
>>
>> Below link may help you to get more detailed log which you are referring=
.
>> https://github.com/openbmc/openbmc/wiki/Debugging-OpenBMC#journalctl
>>
>> For example:
>> journalctl -o json-pretty MESSAGE=3D"watchdog: Timed out"
>>
>> Regards,
>> Ramesh
>>
>> ----- Original message -----
>> From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
>> Sent by: "openbmc" <openbmc-bounces+rameshi1=3Din.ibm.com@lists.ozlabs.o=
rg>
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Cc:
>> Subject: [EXTERNAL] Re: phosphor-logging: entry() failed parse message.
>> Date: Sat, Nov 7, 2020 6:11 PM
>>
>> The output in BMC console will be:
>> phosphor-watchdog[534]: watchdog: Timed out
>>
>> Regards.
>> Thu Nguyen
>>
>> On Sat, Nov 7, 2020 at 7:38 PM Thu Ba Nguyen <tbnguyen1985@gmail.com>
>> wrote:
>>
>> Hi,
>>
>> In openBmc, We are using phosphor-logging.
>> When I log:
>> log<level::INFO>(
>> "watchdog: Timed out",
>> entry("ACTION=3D%s", convertForMessage(action).c_str()),
>> entry("TIMER_USE=3D%s", convertForMessage(expiredTimerUse()).c_str()),
>> entry("TARGET=3D%s", target->second.c_str()));
>> The message in entry() is losted.
>> Do I need to add any option when building?
>>
>> Thanks.
>> Thu Nguyen.
>>
>>
>>
>>

--00000000000064b25c05b3b98e38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok.<div>It is clear now.</div><div><br></div><div>Thanks C=
hunhui.</div><div>Thu Nguyen.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 10, 2020 at 11:27 AM chunhui=
.jia &lt;<a href=3D"mailto:chunhui.jia@linux.intel.com">chunhui.jia@linux.i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bor=
der-left-color:rgb(204,204,204);padding-left:1ex"><u></u>





<div style=3D"border-width:0px;font-size:10.5pt;font-family:arial;color:rgb=
(0,0,0);margin:12px;line-height:1.5">
<div>The data embedded in your entry() is meta-data.=C2=A0=C2=A0 Use &#39;-=
overbose&#39;=20
option in journalctl command to print. </div>
<div>=C2=A0</div>
<div>journalctl -ef -overbose</div>
<div>&gt;&gt;</div>
<div>Tue 2020-11-10 12:28:43.472063 UTC=20
[s=3D93d61b6180db407d8f32924833a6954d;i=3D10c4;b=3D0ba0603a97814c2bb3d22f48=
57b5f964;m=3D13e4a3855c;t=3D5b3bfd1cbc915;x=3Dbac5bbc519880cdf]<br>=C2=A0=
=C2=A0=C2=A0=20
_UID=3D0<br>=C2=A0=C2=A0=C2=A0 _GID=3D0<br>=C2=A0=C2=A0=C2=A0=20
_CAP_EFFECTIVE=3D3fffffffff<br>=C2=A0=C2=A0=C2=A0=20
_BOOT_ID=3D0ba0603a97814c2bb3d22f4857b5f964<br>=C2=A0=C2=A0=C2=A0=20
_MACHINE_ID=3Db1d2788fe17541c0ba0363cd0f0aa699<br>=C2=A0=C2=A0=C2=A0=20
_HOSTNAME=3Dintel-obmc<br>=C2=A0=C2=A0=C2=A0=20
_SYSTEMD_SLICE=3Dsystem.slice<br>=C2=A0=C2=A0=C2=A0=20
_TRANSPORT=3Djournal<br>=C2=A0=C2=A0=C2=A0 PRIORITY=3D3<br>=C2=A0=C2=A0=C2=
=A0=20
CODE_FILE=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+04a38ed10d-r0/reci=
pe-sysroot/usr/include/phosphor-logging/log.hpp<br>=C2=A0=C2=A0=C2=A0=20
CODE_LINE=3D76<br>=C2=A0=C2=A0=C2=A0 CODE_FUNC=3Dhelper_log<br>=C2=A0=C2=A0=
=C2=A0=20
TRANSACTION_ID=3D4091710023<br>=C2=A0=C2=A0=C2=A0=20
SYSLOG_IDENTIFIER=3Dipmid<br>=C2=A0=C2=A0=C2=A0 _PID=3D245<br>=C2=A0=C2=A0=
=C2=A0=20
_COMM=3Dipmid<br>=C2=A0=C2=A0=C2=A0 _EXE=3D/usr/bin/ipmid<br>=C2=A0=C2=A0=
=C2=A0=20
_CMDLINE=3Dipmid<br>=C2=A0=C2=A0=C2=A0=20
_SYSTEMD_CGROUP=3D/system.slice/phosphor-ipmi-host.service<br>=C2=A0=C2=A0=
=C2=A0=20
_SYSTEMD_UNIT=3Dphosphor-ipmi-host.service<br>=C2=A0=C2=A0=C2=A0=20
_SYSTEMD_INVOCATION_ID=3D62df2ae5590c48a2b79ffe6843c3681c<br>=C2=A0=C2=A0=
=C2=A0=20
MESSAGE=3DFailed to GetAll<br>=C2=A0=C2=A0=C2=A0=20
INTF=3Dxyz.openbmc_project.Inventory.Decorator.Ipmi<br>=C2=A0=C2=A0=C2=A0=
=20
WHAT=3Dsd_bus_call: org.freedesktop.DBus.Error.UnknownInterface: Unknown in=
terface=20
&#39;xyz.openbmc_project.Inventory.Decorator.Ipmi&#39;.<br>=C2=A0=C2=A0=C2=
=A0=20
PATH=3D/xyz/openbmc_project/inventory/system/powersupply/SOLUM_CO_IS162F22_=
PSU1<br>=C2=A0=C2=A0=C2=A0=20
_SOURCE_REALTIME_TIMESTAMP=3D1605011323472063<br></div>
<div>=C2=A0</div>
<div style=3D"font-size:10pt;font-family:Verdana;color:rgb(192,192,192)" al=
ign=3D"left">2020-11-10=20
<hr id=3D"gmail-m_-7259127040050132605SignNameHR" style=3D"border-width:1px=
 0px 0px;border-top-style:solid;border-top-color:rgb(192,192,192);height:1p=
x;width:122px" align=3D"left">
<span id=3D"gmail-m_-7259127040050132605_FlashSignName">chunhui.jia</span> =
</div>
<hr style=3D"border-width:1px 0px 0px;border-top-style:solid;border-top-col=
or:rgb(192,192,192);height:1px">

<blockquote id=3D"gmail-m_-7259127040050132605ntes-flashmail-quote" style=
=3D"font-size:10pt;font-family:Verdana;padding-left:0px;margin-left:0px">
  <div><strong>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong>Thu Ba Nguyen &=
lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985=
@gmail.com</a>&gt;</div>
  <div><strong>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A</strong>2020-1=
1-10=C2=A006:35</div>
  <div><strong>=E4=B8=BB=E9=A2=98=EF=BC=9A</strong>Re: phosphor-logging: en=
try() failed parse=20
  message.</div>
  <div><strong>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong>&quot;Ramesh I =
I1&quot;&lt;<a href=3D"mailto:rameshi1@in.ibm.com" target=3D"_blank">ramesh=
i1@in.ibm.com</a>&gt;</div>
  <div><strong>=E6=8A=84=E9=80=81=EF=BC=9A</strong>&quot;OpenBMC=20
  Maillist&quot;&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_=
blank">openbmc@lists.ozlabs.org</a>&gt;</div>
  <div>=C2=A0</div>
  <div>
  <div dir=3D"ltr">
  <div dir=3D"ltr">Thanks Ramesh,
  <div><br></div>
  <div>But your commands are applied for some messages.</div>
  <div>And don&#39;t answer my questions.</div>
  <div>&quot;Do I need to add any option when building?&quot; to make phosp=
hor-logging=20
  print message in entry().</div>
  <div><br></div>
  <div>Regards.</div>
  <div>Thu Nguyen.</div>
  <div><br></div>
  <div>
  <div><br></div>
  <div><br></div></div></div></div><br>
  <div class=3D"gmail_quote">
  <div class=3D"gmail_attr" dir=3D"ltr">On Mon, Nov 9, 2020 at 11:04 AM Ram=
esh I I1=20
  &lt;<a href=3D"mailto:rameshi1@in.ibm.com" target=3D"_blank">rameshi1@in.=
ibm.com</a>&gt;=20
  wrote:<br></div>
  <blockquote class=3D"gmail_quote" style=3D"padding-left:1ex;border-left-w=
idth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);margin:=
0px 0px 0px 0.8ex">
    <div style=3D"font-size:10pt;font-family:Arial,Helvetica,sans-serif" di=
r=3D"ltr">
    <div dir=3D"ltr">Hi=C2=A0Thu Nguyen,</div>
    <div dir=3D"ltr">=C2=A0</div>
    <div dir=3D"ltr">Below link=C2=A0may help you=C2=A0to get more detailed=
 log=20
    which you are referring.</div>
    <div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc/wiki/Deb=
ugging-OpenBMC#journalctl" target=3D"_blank">https://github.com/openbmc/ope=
nbmc/wiki/Debugging-OpenBMC#journalctl</a></div>
    <div dir=3D"ltr">=C2=A0</div>
    <div dir=3D"ltr">For example:</div>
    <div dir=3D"ltr">journalctl -o json-pretty MESSAGE=3D&quot;watchdog: Ti=
med out&quot;</div>
    <div dir=3D"ltr">=C2=A0</div>
    <div dir=3D"ltr">Regards,</div>
    <div dir=3D"ltr">Ramesh</div>
    <blockquote style=3D"direction:ltr;padding-left:5px;margin-left:5px;bor=
der-left-width:2px;border-left-style:solid;border-left-color:rgb(170,170,17=
0);margin-right:0px" dir=3D"ltr">----- Original message -----<br>From: Thu =
Ba Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">t=
bnguyen1985@gmail.com</a>&gt;<br>Sent by: &quot;openbmc&quot;=20
      &lt;openbmc-bounces+rameshi1=3D<a href=3D"mailto:in.ibm.com@lists.ozl=
abs.org" target=3D"_blank">in.ibm.com@lists.ozlabs.org</a>&gt;<br>To: OpenB=
MC Maillist=20
      &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">ope=
nbmc@lists.ozlabs.org</a>&gt;<br>Cc:<br>Subject:=20
      [EXTERNAL] Re: phosphor-logging: entry() failed parse message.<br>Dat=
e:=20
      Sat, Nov 7, 2020 6:11 PM<br>=C2=A0<br>
      <div dir=3D"ltr">
      <div dir=3D"ltr">The output in BMC console will be:=20
      <div>phosphor-watchdog[534]: watchdog: Timed out</div>
      <div>=C2=A0</div>
      <div>Regards.</div>
      <div>Thu Nguyen</div></div></div>=C2=A0=20
      <div>
      <div dir=3D"ltr">On Sat, Nov 7, 2020 at 7:38 PM Thu Ba Nguyen &lt;<a =
href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail=
.com</a>&gt; wrote:</div>
      <blockquote style=3D"padding-left:1ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);margin:0px 0px 0px 0.8ex"=
>
        <div dir=3D"ltr">
        <div dir=3D"ltr">Hi,=20
        <div>=C2=A0</div>
        <div>In openBmc, We are using phosphor-logging.</div>
        <div>When I log:</div>
        <div>
        <div style=3D"font-size:18px;font-family:Menlo,Monaco,&quot;Courier=
 New&quot;,monospace;white-space:pre-wrap;color:rgb(212,212,212);line-heigh=
t:27px;background-color:rgb(30,30,30)">
        <div><span style=3D"color:rgb(220,220,170)">log</span>&lt;<span sty=
le=3D"color:rgb(78,201,176)">level</span>::<span style=3D"color:rgb(78,201,=
176)">INFO</span>&gt;(</div>
        <div><span style=3D"color:rgb(206,145,120)">&quot;watchdog: Timed=
=20
        out&quot;</span>,</div>
        <div><span style=3D"color:rgb(220,220,170)">entry</span>(<span styl=
e=3D"color:rgb(206,145,120)">&quot;ACTION=3D%s&quot;</span>, <span style=3D=
"color:rgb(220,220,170)">convertForMessage</span>(<span style=3D"color:rgb(=
156,220,254)">action</span>).<span style=3D"color:rgb(220,220,170)">c_str</=
span>()),</div>
        <div><span style=3D"color:rgb(220,220,170)">entry</span>(<span styl=
e=3D"color:rgb(206,145,120)">&quot;TIMER_USE=3D%s&quot;</span>, <span style=
=3D"color:rgb(220,220,170)">convertForMessage</span>(<span style=3D"color:r=
gb(220,220,170)">expiredTimerUse</span>()).<span style=3D"color:rgb(220,220=
,170)">c_str</span>()),</div>
        <div><span style=3D"color:rgb(220,220,170)">entry</span>(<span styl=
e=3D"color:rgb(206,145,120)">&quot;TARGET=3D%s&quot;</span>, <span style=3D=
"color:rgb(156,220,254)">target</span>-&gt;<span style=3D"color:rgb(156,220=
,254)">second</span>.<span style=3D"color:rgb(220,220,170)">c_str</span>())=
);</div></div></div>
        <div>The message in entry() is losted.</div>
        <div>Do I need to add any option when building?</div>
        <div>=C2=A0</div>
        <div>Thanks.</div>
        <div>Thu Nguyen.</div></div></div></blockquote></div></blockquote>
    <div dir=3D"ltr">=C2=A0</div></div><br></blockquote></div></div></block=
quote></div></blockquote></div>

--00000000000064b25c05b3b98e38--
