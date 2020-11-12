Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FBC2B0849
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 16:20:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX4zG5W20zDqpJ
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 02:20:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F3tJgSfv; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX4yH2XqdzDqnT
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 02:19:17 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id n5so5574302ile.7
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 07:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0IiAr9YuHHMiV0//4H1ahkz/wi8OEs6IpNVFooO7mA=;
 b=F3tJgSfvBfxrEaZyQO/mCHwRdXceN7povF8VrmtVenKTzB0VHwQEs1nCkTGPXFC0wg
 B1Uw6W5JU/9x45D6n5rZjolIWh+yVBQTzDuJ+8M9Phox+vgfe1FO1hz3wtCXBB7FPcxw
 06hkgmbgYboY+gg5jTKyPOQyYp8F2qwo8Qu9lAToTb6kJtsPCoiXqLzm0xog6iSZnIzQ
 O4j51y4HDFJK8gy1uHtL4DTU6GLiLO8LGS5kiTUtAHnTQcJKrDUEENmFKfZnUbda2Chx
 HCz7Cq5J0E5VHmXezCKRg9tX2EIc9vwiBFd/o2OCYUJXhJmpjfWSEQW5M8HfsrIv0Aic
 jq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0IiAr9YuHHMiV0//4H1ahkz/wi8OEs6IpNVFooO7mA=;
 b=fGg4EPJL5Vbz8DRp4KePGwdqBfPJouoFWnnSkm91Khgff/jZxbJ11bM3aHEVd+nNag
 +GZnVnZWMYqdK2HIZZK71eK9UDfH7U4eVFn8sms+4U35JrMbD0WqVt0QP+9jAvac58nI
 yzubJ/cRnCIyN7ItuhVIgQ5WoslaGvNA35Wcv9EBehehcqQUov+mVMww4ebHt+743hS+
 uoYEWNX27ZhAEgSSwiWYFLzwV4xhfnnTmstxjYbjJ6DSS+tDlXKOnmmk2Wn+9xemcT0j
 rr11AVj/m1pdLhaM874LsoOta0tDDAsfpnPuWIX75yg0rJmCi8QqAfvy2+QakyKiQpfS
 kaxg==
X-Gm-Message-State: AOAM5318Fh3/Boj+v1h8PIZfISGU4osXIoFSZ/g6j9yz/a23wDwH6+/6
 mY1AXvdpUojfDZs1zXeFJX1NF4kBCi/teGvef8U=
X-Google-Smtp-Source: ABdhPJwTZzh0rudsdDlVzP36WFBzGuwfpa0j2vPuusxxhSqqlqIUSJAZ1h9mGH/DuKPUhpxNvMumSWIEqqQY3GQ+hAg=
X-Received: by 2002:a92:c529:: with SMTP id m9mr23134032ili.195.1605194352873; 
 Thu, 12 Nov 2020 07:19:12 -0800 (PST)
MIME-Version: 1.0
References: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
 <b75f4c12-0d40-c529-40cd-3fb9ec1fc0ce@linux.vnet.ibm.com>
 <CABYu0WhSqhhxULpe+f9eq2e8Tv4uYzh2DaDRxfXe838pk4EP4Q@mail.gmail.com>
 <352ce958-186c-a26c-382f-d21ed26729ef@linux.vnet.ibm.com>
 <986DD922-0EB7-4776-A302-2BBA264018C2@fb.com>
In-Reply-To: <986DD922-0EB7-4776-A302-2BBA264018C2@fb.com>
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Thu, 12 Nov 2020 20:49:01 +0530
Message-ID: <CABYu0WgL=OH3cW5jKBYAkP+A+_VkLWgEE5i1iddf+WLQdBua5g@mail.gmail.com>
Subject: Re: Firmware Version in ipmi mc info
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="00000000000032daba05b3ea6ffb"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000032daba05b3ea6ffb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vijay,

Yes I was looking at the wrong object. Moreover with ipmi, since my tag was
not conformant to the format "vX.Y.Z..", I was not seeing the version
properly. I am good on this now.

Thanks,
Shakeeb

On Thu, Nov 12, 2020 at 6:56 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hello Shakeeb and Tom,
>
>
>
> I don=E2=80=99t see any issues with version for BMC in upstream version a=
s well.
> Software versions are exposed in bmc updater object rather than version
> object and see following command yields BMC version
>
> busctl get-property xyz.openbmc_project.Software.BMC.Updater  /xyz/openbm=
c_project/software/1950470f
> xyz.openbmc_project.Software.Version Version
>
> s "2.9.0-dev-1057-gfe5603705"
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> o=
n
> behalf of TOM JOSEPH <tomjose@linux.vnet.ibm.com>
> *Date: *Thursday, November 5, 2020 at 9:46 PM
> *To: *Shakeeb B K <shakeebbk@gmail.com>
> *Cc: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> *Subject: *Re: Firmware Version in ipmi mc info
>
>
>
> Hello Shakeeb,
>
> Typically there is a D-Bus object for each version and that implements th=
e
> xyz.openbmc_project.Software.Version interface.
> /xyz/openbmc_project/software doesn't implement the interface.
>
> busctl tree xyz.openbmc_project.Software.BMC.Updater
> =E2=94=94=E2=94=80/xyz
>   =E2=94=94=E2=94=80/xyz/openbmc_project
>     =E2=94=94=E2=94=80/xyz/openbmc_project/software
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/software/6b6a7c53
>       =E2=94=94=E2=94=80/xyz/openbmc_project/software/76174d14
>
> I guess the upstream implementation of this command is broken with the
> latest version format. We discussed this in the community, work is not do=
ne
> yet. https://lists.ozlabs.org/pipermail/openbmc/2020-August/022598.html
>
> Regards,
> Tom
>
>
>
> On 06-11-2020 09:38, Shakeeb B K wrote:
>
> Hi Tom, Thanks for the reply. But it doesn't seem to work as expected. I'=
m
> looking at...
>
>
>
> *This Message Is From an External Sender*
>
> This message came from outside your organization.
>
> Hi Tom,
>
>
>
> Thanks for the reply.
>
> But it doesn't seem to work as expected. I'm looking at the
> witherspoon-bmc on QEMU.
>
>
>
> root@witherspoon:~# systemctl status
> xyz.openbmc_project.Software.BMC.Updater
> * *xyz.openbmc_project.Software.BMC.Updater.service* - OpenBMC Software
> Update Manager
>      Loaded: loaded
> (/lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service;
> enabled; vendor preset: enabled)
>     Drop-In:
> /lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service.d
>              `-software-bmc-updater.conf
>      Active: *active (running)* since Thu 2020-11-05 14:10:57 UTC; 13h ag=
o
>    Main PID: 387 (phosphor-image-)
>      CGroup: /system.slice/xyz.openbmc_project.Software.BMC.Updater.servi=
ce
>              `-387 /usr/bin/phosphor-image-updater
>
> Nov 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC Software Update
> Manager...
> Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC Software Update
> Manager.
>
>
> root@witherspoon:~# busctl get-property xyz.openbmc_project.State.BMC
> /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC
> CurrentBMCState
> s "*xyz.openbmc_project.State.BMC.BMCState.Ready*"
>
>
> *root@witherspoon:~# busctl get-property
> xyz.openbmc_project.Software.Version /xyz/openbmc_project/software
> xyz.openbmc_project.Software.Version Version Failed to get property Versi=
on
> on interface xyz.openbmc_project.Software.Version: Unknown interface
> xyz.openbmc_project.Software.Version or property Version.*
>
> root@witherspoon:~# busctl introspect --no-pager
> xyz.openbmc_project.Software.Version /xyz/openbmc_project/software
> NAME                                TYPE      SIGNATURE  RESULT/VALUE
>  FLAGS
> org.freedesktop.DBus.Introspectable interface -          -             -
> .Introspect                         method    -          s             -
> org.freedesktop.DBus.ObjectManager  interface -          -             -
> .GetManagedObjects                  method    -          a{oa{sa{sv}}} -
> .InterfacesAdded                    signal    oa{sa{sv}} -             -
> .InterfacesRemoved                  signal    oas        -             -
> org.freedesktop.DBus.Peer           interface -          -             -
> .GetMachineId                       method    -          s             -
> .Ping                               method    -          -             -
> org.freedesktop.DBus.Properties     interface -          -             -
> .Get                                method    ss         v             -
> .GetAll                             method    s          a{sv}         -
> .Set                                method    ssv        -             -
> .PropertiesChanged                  signal    sa{sv}as   -             -
>
>
>
>
>
> Thanks,
>
> Shakeeb
>
>
>
> On Fri, Nov 6, 2020 at 8:37 AM TOM JOSEPH <tomjose@linux.vnet.ibm.com>
> wrote:
>
> Hey Shakeeb,
>
> The service implementing the xyz.openbmc_project.Software.Version should
> be running in the case of a normal boot as well. In our systems the servi=
ce
> is xyz.openbmc_project.Software.BMC.Updater and the Version property is
> populated when the BMCState is Ready.
>
> Regards,
> Tom
>
> On 05-11-2020 20:02, Shakeeb B K wrote:
>
> Hi All, Currently the ipmi handler for "mc info" command depends on the
> "Version"...
>
>
>
> *This Message Is From an External Sender*
>
> This message came from outside your organization.
>
> Hi All,
>
>
>
> Currently the ipmi handler for "mc info" command depends on the "Version"
> property on interface xyz.openbmc_project.Software.Version.
>
> But this is getting populated only on the image update path by
> phosphor-bmc-code-mgmt.
>
> Shouldn't the version be set on a normal boot as well? Is this a gap in
> current implementation?
>
>
>
> Thanks,
>
> Shakeeb
>
>

--00000000000032daba05b3ea6ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vijay,<div><br></div><div>Yes I was looking at the wron=
g object. Moreover with ipmi, since my tag was not conformant to the format=
 &quot;vX.Y.Z..&quot;, I was not seeing the version properly. I am good on =
this now.</div><div><br></div><div>Thanks,</div><div>Shakeeb</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, N=
ov 12, 2020 at 6:56 AM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.co=
m">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-1410478744982165190WordSection1">
<p class=3D"MsoNormal">Hello Shakeeb and Tom,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I don=E2=80=99t see any issues with version for BMC =
in upstream version as well. Software versions are exposed in bmc updater o=
bject rather than version object and see following command yields BMC versi=
on<u></u><u></u></p>
<p class=3D"gmail-m_-1410478744982165190p1"><span class=3D"gmail-m_-1410478=
744982165190s1">busctl get-property xyz.openbmc_project.Software.BMC.Update=
r</span><span class=3D"gmail-m_-1410478744982165190apple-converted-space">=
=C2=A0
</span><span class=3D"gmail-m_-1410478744982165190s1">/xyz/openbmc_project/=
software/1950470f xyz.openbmc_project.Software.Version Version</span><u></u=
><u></u></p>
<p class=3D"gmail-m_-1410478744982165190p1"><span class=3D"gmail-m_-1410478=
744982165190s1">s &quot;2.9.0-dev-1057-gfe5603705&quot;</span><u></u><u></u=
></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of TOM JOSEPH &lt;<a href=
=3D"mailto:tomjose@linux.vnet.ibm.com" target=3D"_blank">tomjose@linux.vnet=
.ibm.com</a>&gt;<br>
<b>Date: </b>Thursday, November 5, 2020 at 9:46 PM<br>
<b>To: </b>Shakeeb B K &lt;<a href=3D"mailto:shakeebbk@gmail.com" target=3D=
"_blank">shakeebbk@gmail.com</a>&gt;<br>
<b>Cc: </b>&quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@lists.=
ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Firmware Version in ipmi mc info<u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p>Hello Shakeeb,<br>
<br>
Typically there is a D-Bus object for each version and that implements the =
xyz.openbmc_project.Software.Version interface. /xyz/openbmc_project/softwa=
re doesn&#39;t implement the interface.<br>
<br>
busctl tree xyz.openbmc_project.Software.BMC.Updater<br>
=E2=94=94=E2=94=80/xyz<br>
=C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project<br>
=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project/software<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <span style=3D"font-family:&quot;MS Gothic&q=
uot;">=E2=94=9C</span>=E2=94=80/xyz/openbmc_project/software/6b6a7c53<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project/softw=
are/76174d14<u></u><u></u></p>
<p>I guess the upstream implementation of this command is broken with the l=
atest version format. We discussed this in the community, work is not done =
yet.
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-August/022598.ht=
ml" target=3D"_blank">https://lists.ozlabs.org/pipermail/openbmc/2020-Augus=
t/022598.html</a><u></u><u></u></p>
<p class=3D"MsoNormal">Regards,<br>
Tom <u></u><u></u></p>
<p><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 06-11-2020 09:38, Shakeeb B K wrote:<u></u><u></u=
></p>
</div>
<blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
<p class=3D"MsoNormal"><span class=3D"gmail-m_-1410478744982165190pfptprehe=
ader1"><span style=3D"font-size:1pt;color:white">Hi Tom, Thanks for the rep=
ly. But it doesn&#39;t seem to work as expected. I&#39;m looking at...=C2=
=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><u></u><u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;background:rgb(156,163,167);border-radius:4px">
<tbody>
<tr>
<td style=3D"padding:12pt;border-radius:4px">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;max-width:100%">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;background:rgb(156,163,167)">
<tbody>
<tr>
<td width=3D"100%" valign=3D"top" style=3D"width:100%;padding:0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%">
<tbody>
<tr>
<td style=3D"padding:0in">
<p class=3D"MsoNormal"><span class=3D"gmail-m_-1410478744982165190pfpttitle=
"><b><span style=3D"font-size:13.5pt;font-family:Roboto">This Message Is Fr=
om an External Sender</span></b></span>
<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:0in">
<p class=3D"MsoNormal"><span class=3D"gmail-m_-1410478744982165190pfptsubti=
tle"><span style=3D"font-size:10pt;font-family:Roboto">This message came fr=
om outside your organization.</span></span>
<u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<div>
<p class=3D"MsoNormal">Hi Tom, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the reply.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But it doesn&#39;t seem to work as expected. I&#39;m=
 looking at the witherspoon-bmc on QEMU.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
root@witherspoon:~# systemctl status xyz.openbmc_project.Software.BMC.Updat=
er<br>
* <b>xyz.openbmc_project.Software.BMC.Updater.service</b> - OpenBMC Softwar=
e Update Manager<br>
=C2=A0 =C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/xyz.openbmc_project=
.Software.BMC.Updater.service; enabled; vendor preset: enabled)<br>
=C2=A0 =C2=A0 Drop-In: /lib/systemd/system/xyz.openbmc_project.Software.BMC=
.Updater.service.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-software-bmc-updater.conf=
<br>
=C2=A0 =C2=A0 =C2=A0Active: <b>active (running)</b> since Thu 2020-11-05 14=
:10:57 UTC; 13h ago<br>
=C2=A0 =C2=A0Main PID: 387 (phosphor-image-)<br>
=C2=A0 =C2=A0 =C2=A0CGroup: /system.slice/xyz.openbmc_project.Software.BMC.=
Updater.service<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-387 /usr/bin/phosphor-ima=
ge-updater<br>
<br>
Nov 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC Software Update Ma=
nager...<br>
Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC Software Update Man=
ager.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-fam=
ily:&quot;Courier New&quot;"><br>
root@witherspoon:~# busctl get-property xyz.openbmc_project.State.BMC /xyz/=
openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC CurrentBMCState<br=
>
s &quot;<b>xyz.openbmc_project.State.BMC.BMCState.Ready</b>&quot;</span><u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><b><span style=3D"font-=
family:&quot;Courier New&quot;">root@witherspoon:~# busctl get-property xyz=
.openbmc_project.Software.Version /xyz/openbmc_project/software xyz.openbmc=
_project.Software.Version Version<br>
Failed to get property Version on interface xyz.openbmc_project.Software.Ve=
rsion: Unknown interface xyz.openbmc_project.Software.Version or property V=
ersion.</span></b><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
root@witherspoon:~# busctl introspect --no-pager xyz.openbmc_project.Softwa=
re.Version /xyz/openbmc_project/software
<br>
NAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE =C2=A0 =C2=A0 =C2=A0SIGNATURE=
 =C2=A0RESULT/VALUE =C2=A0FLAGS<br>
org.freedesktop.DBus.Introspectable interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.Introspect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
org.freedesktop.DBus.ObjectManager =C2=A0interface - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.GetManagedObjects =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a{oa{sa{sv}}}=
 -<br>
.InterfacesAdded =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0signal =C2=A0 =C2=A0oa{sa{sv}} - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -<br>
.InterfacesRemoved =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0signal =C2=A0 =C2=A0oas =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
org.freedesktop.DBus.Peer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -<br>
.GetMachineId =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.Ping =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
org.freedesktop.DBus.Properties =C2=A0 =C2=A0 interface - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.Get =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =C2=A0 =C2=A0ss =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 v =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.GetAll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0a{sv} =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.Set =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =C2=A0 =C2=A0ssv =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
.PropertiesChanged =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0signal =C2=A0 =C2=A0sa{sv}as =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Shakeeb<u></u><u></u></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Nov 6, 2020 at 8:37 AM TOM JOSEPH &lt;<a hre=
f=3D"mailto:tomjose@linux.vnet.ibm.com" target=3D"_blank">tomjose@linux.vne=
t.ibm.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<p>Hey Shakeeb,<br>
<br>
The service implementing the xyz.openbmc_project.Software.Version should be=
 running in the case of a normal boot as well. In our systems the service i=
s xyz.openbmc_project.Software.BMC.Updater and the Version property is popu=
lated when the BMCState is Ready.<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Regards,<br>
Tom<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">On 05-11-2020 20:02, Shakeeb B K wrote:<u></u><u></u=
></p>
</div>
<blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
<p class=3D"MsoNormal"><span style=3D"font-size:1pt;color:white">Hi All, Cu=
rrently the ipmi handler for &quot;mc info&quot; command depends=C2=A0on th=
e &quot;Version&quot;...=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
</span><u></u><u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;background:rgb(156,163,167);border-radius:4px">
<tbody>
<tr>
<td style=3D"padding:12pt;border-radius:4px">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;border-radius:4px">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in;max-width:100%">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;background:rgb(156,163,167)">
<tbody>
<tr>
<td width=3D"100%" valign=3D"top" style=3D"width:100%;padding:0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%">
<tbody>
<tr>
<td style=3D"padding:0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:13.5pt;font-family:Robot=
o">This Message Is From an External Sender</span></b>
<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:0in">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Roboto">Th=
is message came from outside your organization.</span>
<u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<div>
<p class=3D"MsoNormal">Hi All, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Currently the ipmi handler for &quot;mc info&quot; c=
ommand depends=C2=A0on the &quot;Version&quot; property on interface=C2=A0x=
yz.openbmc_project.Software.Version.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But this is getting populated only on the image upda=
te path by phosphor-bmc-code-mgmt.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Shouldn&#39;t the version be set on a normal boot as=
 well? Is this a gap in current implementation?
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Shakeeb<u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
</blockquote>
</div>
</blockquote>
</div>
</div>

</blockquote></div>

--00000000000032daba05b3ea6ffb--
