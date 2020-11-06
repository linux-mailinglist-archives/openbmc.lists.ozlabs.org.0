Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D22A8E0C
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 05:09:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS6Mt06BzzDqGC
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 15:09:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WPVgwnYG; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS6Lx3XYXzDr9w
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 15:08:23 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id n129so119378iod.5
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 20:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/vipcTu7iG1YEaEcKPimTJrUJ5d1v2YlnZnn7C7iZk=;
 b=WPVgwnYGzxFUfGnvcg74vudmILAkpAfSjlGvygvPK14eoyNB+Wnjc0oMwsDKn+78xO
 ACpEDMbPOudFvWSQzZDRC9aVRQO11IucIXskG3G7qUcxFLBIsjJTkbJsyCY8blqlzPSJ
 twuuSCxKapTOoDXjEjla738ckd2iaeNi9DHewJwTNKSVJedHzoLpDX2vpUiWWAfuk6V1
 o+Lj+6kGSW731HRXyYiKT+TKRPICiUuevVMxbGNIS1vwu9x3MyARxaLqpSpEmHcKIBDa
 dQT4CKmQotQNaxTjJhnDyqKSy07Rd309gcX8NMXp7xFypjsQsE5ISsj79avPeDMJa19c
 tFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/vipcTu7iG1YEaEcKPimTJrUJ5d1v2YlnZnn7C7iZk=;
 b=XP8AZuGkFL1+MDEsh+3v/FlsTqHhUcBq6wg4f8e1lT9PZI89RQ/V+CCqAmT3mGss6X
 TO6lzLeU8niGhWIA9EwuplrEIUIK6dXtTKhRSwKQkBkG1Su/Nk6ozQ1nek1tEr8VKp3m
 ZiJLNM0QiGz0WA0W2A6Jz/YPfewYIWzVfKsIF0Czc7v0RTfIseN1SLMcPtP6YW36b23B
 mJViuYABYKD84XXRfLk7p1Cz0be8/AebRxDNl/+fyyeDWw7eZfcYQY0TDNHQ8x6stlDS
 1R62fgAKhhLsapqKE6W3fmDO6u1WLvBPYGjubhiSowfmoAaeAyxDv+/yUpZB7cFnDkmA
 8SpA==
X-Gm-Message-State: AOAM53209k6XP1AWKxsVa9UZAqbOnE1pufczFcQtSnNNg1G3CTjOiziF
 9B4JGYHVbTa9gLhGfFtTmXhmVN1zWZWS7ovRc4HcHDaNgdX5Qw==
X-Google-Smtp-Source: ABdhPJzIR3TYYVIUVfgUo7YLJVcFpttMkv5cizu73vkkDPg6o6fs9q6ndALK32Gk6zxDvTx3g4upphJm/HNmwPwOgZ4=
X-Received: by 2002:a6b:f60d:: with SMTP id n13mr149091ioh.71.1604635699331;
 Thu, 05 Nov 2020 20:08:19 -0800 (PST)
MIME-Version: 1.0
References: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
 <b75f4c12-0d40-c529-40cd-3fb9ec1fc0ce@linux.vnet.ibm.com>
In-Reply-To: <b75f4c12-0d40-c529-40cd-3fb9ec1fc0ce@linux.vnet.ibm.com>
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Fri, 6 Nov 2020 09:38:08 +0530
Message-ID: <CABYu0WhSqhhxULpe+f9eq2e8Tv4uYzh2DaDRxfXe838pk4EP4Q@mail.gmail.com>
Subject: Re: Firmware Version in ipmi mc info
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000da451405b3685c6c"
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

--000000000000da451405b3685c6c
Content-Type: text/plain; charset="UTF-8"

Hi Tom,

Thanks for the reply.
But it doesn't seem to work as expected. I'm looking at the witherspoon-bmc
on QEMU.

root@witherspoon:~# systemctl status
xyz.openbmc_project.Software.BMC.Updater
* *xyz.openbmc_project.Software.BMC.Updater.service* - OpenBMC Software
Update Manager
     Loaded: loaded
(/lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service;
enabled; vendor preset: enabled)
    Drop-In:
/lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service.d
             `-software-bmc-updater.conf
     Active: *active (running)* since Thu 2020-11-05 14:10:57 UTC; 13h ago
   Main PID: 387 (phosphor-image-)
     CGroup: /system.slice/xyz.openbmc_project.Software.BMC.Updater.service
             `-387 /usr/bin/phosphor-image-updater

Nov 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC Software Update
Manager...
Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC Software Update
Manager.

root@witherspoon:~# busctl get-property xyz.openbmc_project.State.BMC
/xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC
CurrentBMCState
s "*xyz.openbmc_project.State.BMC.BMCState.Ready*"


*root@witherspoon:~# busctl get-property
xyz.openbmc_project.Software.Version /xyz/openbmc_project/software
xyz.openbmc_project.Software.Version VersionFailed to get property Version
on interface xyz.openbmc_project.Software.Version: Unknown interface
xyz.openbmc_project.Software.Version or property Version.*

root@witherspoon:~# busctl introspect --no-pager
xyz.openbmc_project.Software.Version /xyz/openbmc_project/software
NAME                                TYPE      SIGNATURE  RESULT/VALUE  FLAGS
org.freedesktop.DBus.Introspectable interface -          -             -
.Introspect                         method    -          s             -
org.freedesktop.DBus.ObjectManager  interface -          -             -
.GetManagedObjects                  method    -          a{oa{sa{sv}}} -
.InterfacesAdded                    signal    oa{sa{sv}} -             -
.InterfacesRemoved                  signal    oas        -             -
org.freedesktop.DBus.Peer           interface -          -             -
.GetMachineId                       method    -          s             -
.Ping                               method    -          -             -
org.freedesktop.DBus.Properties     interface -          -             -
.Get                                method    ss         v             -
.GetAll                             method    s          a{sv}         -
.Set                                method    ssv        -             -
.PropertiesChanged                  signal    sa{sv}as   -             -


Thanks,
Shakeeb

On Fri, Nov 6, 2020 at 8:37 AM TOM JOSEPH <tomjose@linux.vnet.ibm.com>
wrote:

> Hey Shakeeb,
>
> The service implementing the xyz.openbmc_project.Software.Version should
> be running in the case of a normal boot as well. In our systems the service
> is xyz.openbmc_project.Software.BMC.Updater and the Version property is
> populated when the BMCState is Ready.
> Regards,
> Tom
>
> On 05-11-2020 20:02, Shakeeb B K wrote:
>
> Hi All, Currently the ipmi handler for "mc info" command depends on the
> "Version"...
>
>
> This Message Is From an External Sender
> This message came from outside your organization.
> Hi All,
>
> Currently the ipmi handler for "mc info" command depends on the "Version"
> property on interface xyz.openbmc_project.Software.Version.
> But this is getting populated only on the image update path by
> phosphor-bmc-code-mgmt.
> Shouldn't the version be set on a normal boot as well? Is this a gap in
> current implementation?
>
> Thanks,
> Shakeeb
>
>

--000000000000da451405b3685c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tom,<div><br></div><div>Thanks for the reply.</div><div=
>But it doesn&#39;t seem to work as expected. I&#39;m looking at the wither=
spoon-bmc on QEMU.</div><div><br></div><div><font face=3D"monospace">root@w=
itherspoon:~# systemctl status xyz.openbmc_project.Software.BMC.Updater<br>=
* <b>xyz.openbmc_project.Software.BMC.Updater.service</b> - OpenBMC Softwar=
e Update Manager<br>=C2=A0 =C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system=
/xyz.openbmc_project.Software.BMC.Updater.service; enabled; vendor preset: =
enabled)<br>=C2=A0 =C2=A0 Drop-In: /lib/systemd/system/xyz.openbmc_project.=
Software.BMC.Updater.service.d<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0`-software-bmc-updater.conf<br>=C2=A0 =C2=A0 =C2=A0Active: <b>active=
 (running)</b> since Thu 2020-11-05 14:10:57 UTC; 13h ago<br>=C2=A0 =C2=A0M=
ain PID: 387 (phosphor-image-)<br>=C2=A0 =C2=A0 =C2=A0CGroup: /system.slice=
/xyz.openbmc_project.Software.BMC.Updater.service<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0`-387 /usr/bin/phosphor-image-updater<br><br>Nov=
 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC Software Update Manag=
er...<br>Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC Software U=
pdate Manager.</font></div><div><font face=3D"monospace"><br>root@witherspo=
on:~# busctl get-property xyz.openbmc_project.State.BMC /xyz/openbmc_projec=
t/state/bmc0 xyz.openbmc_project.State.BMC CurrentBMCState<br>s &quot;<b>xy=
z.openbmc_project.State.BMC.BMCState.Ready</b>&quot;<br><br></font></div><d=
iv><font face=3D"monospace"><b>root@witherspoon:~# busctl get-property xyz.=
openbmc_project.Software.Version /xyz/openbmc_project/software xyz.openbmc_=
project.Software.Version Version<br>Failed to get property Version on inter=
face xyz.openbmc_project.Software.Version: Unknown interface xyz.openbmc_pr=
oject.Software.Version or property Version.</b><br><br></font></div><div><f=
ont face=3D"monospace">root@witherspoon:~# busctl introspect --no-pager xyz=
.openbmc_project.Software.Version /xyz/openbmc_project/software <br>NAME =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE =C2=A0 =C2=A0 =C2=A0SIGNATURE =
=C2=A0RESULT/VALUE =C2=A0FLAGS<br>org.freedesktop.DBus.Introspectable inter=
face - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -<br>.Introspect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>org.fr=
eedesktop.DBus.ObjectManager =C2=A0interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>.GetManagedObjects =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =C2=A0=
 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a{oa{sa{sv}}} -<br>.InterfacesAd=
ded =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si=
gnal =C2=A0 =C2=A0oa{sa{sv}} - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<=
br>.InterfacesRemoved =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0signal =C2=A0 =C2=A0oas =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>org.freedesktop.DBus.Peer =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>.GetMachineId =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=
=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -<br>.Ping =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=
=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -<br>org.freedesktop.DBus.Properties =C2=A0 =C2=A0 interface - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-<br>.Get =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =C2=A0 =C2=A0ss =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 v =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>.=
GetAll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0a{sv} =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>.Set =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0method =C2=A0 =C2=A0ssv =C2=A0 =C2=A0 =C2=A0 =C2=A0- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>.PropertiesChanged =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signal =C2=A0 =C2=A0=
sa{sv}as =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</font><br></d=
iv><div><font face=3D"monospace"><br></font></div><div><div><br></div><div>=
Thanks,</div><div>Shakeeb</div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, 2020 at 8:37 AM TOM JOS=
EPH &lt;<a href=3D"mailto:tomjose@linux.vnet.ibm.com">tomjose@linux.vnet.ib=
m.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
 =20
   =20
 =20
  <div>
    <p>Hey Shakeeb,<br>
      <br>
      The service implementing the xyz.openbmc_project.Software.Version
      should be running in the case of a normal boot as well. In our
      systems the service is xyz.openbmc_project.Software.BMC.Updater
      and the Version property is populated when the BMCState is Ready.<br>
    </p>
    Regards,<br>
    Tom<br>
    <br>
    <div>On 05-11-2020 20:02, Shakeeb B K wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
     =20
     =20
     =20
       <span style=3D"font-size:1px;color:rgb(255,255,255);line-height:1px;=
max-height:0px;max-width:0px;opacity:0;overflow:hidden;display:none">
        Hi All, Currently the ipmi handler for &quot;mc info&quot; command
        depends=C2=A0on the &quot;Version&quot;...=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
     =20
     =20
      <table style=3D"width:100%;border-radius:4px;margin-bottom:16px" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"16" border=3D"0" bgcolor=3D"#9C=
A3A7">
        <tbody>
          <tr>
            <td align=3D"center">
              <table style=3D"width:100%" width=3D"100%" cellspacing=3D"0" =
cellpadding=3D"0" border=3D"0" align=3D"center">
                <tbody>
                  <tr>
                    <td style=3D"border-radius:4px" valign=3D"top" align=3D=
"center">
                      <table style=3D"max-width:100%;width:100%" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" bgcolor=3D"#9CA3A7" a=
lign=3D"center">
                        <tbody>
                          <tr>
                             <th style=3D"font-weight:normal;padding:0px;wi=
dth:100%;height:auto" valign=3D"top">
                              <table style=3D"width:100%;height:auto;text-a=
lign:left;vertical-align:middle" width=3D"100%" cellspacing=3D"0" cellpaddi=
ng=3D"0">
                                <tbody>
                                  <tr>
                                    <td> <span style=3D"font-family:Roboto,=
Helvetica,Arial,sans-serif;font-weight:bold;font-size:18px;line-height:20px=
;display:block;margin-bottom:4px">This
                                        Message Is From an External
                                        Sender</span> </td>
                                  </tr>
                                  <tr>
                                    <td> <span style=3D"font-weight:normal;=
font-family:Roboto,Helvetica,Arial,sans-serif;font-size:13px;line-height:16=
px;display:block">This
                                        message came from outside your
                                        organization.</span> </td>
                                  </tr>
                                </tbody>
                              </table>
                            </th>
                             </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
     =20
     =20
      <div dir=3D"ltr">Hi All,
        <div><br>
        </div>
        <div>Currently the ipmi handler for &quot;mc info&quot; command dep=
ends=C2=A0on
          the &quot;Version&quot; property on
          interface=C2=A0xyz.openbmc_project.Software.Version.=C2=A0</div>
        <div>But this is getting populated only on the image update path
          by phosphor-bmc-code-mgmt.</div>
        <div>Shouldn&#39;t the version be set on a normal boot as well? Is
          this a gap in current implementation? </div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Shakeeb</div>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000da451405b3685c6c--
