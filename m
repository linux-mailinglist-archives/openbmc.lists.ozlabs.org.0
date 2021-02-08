Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60991313F40
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 20:39:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZGZ24PRDzDvVX
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 06:39:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pD+O+ymg; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZGXx2MCrzDvVJ
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 06:38:36 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id j19so3870029lfr.12
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 11:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9MBaP0iBiwW0iSh9st+CQFiJBD434V32CapT2bYlh1Y=;
 b=pD+O+ymgnbXoierdayBvz3eWqDcEzYsWKaJCqXSF/z6+U4kMvVi3+bMdcgbrQtg2fu
 NTvFPnBOyq5MGZKdnYLP8z13u3x5KgDLbWqNqAeqCGQznM7soFAByA6PM/KabHlMQhaz
 NgVgpOeXRhGU1YXR3nE6SR12H09ggQVL6p834PdbndVYk4487NeSiVZIFe3rZmh2wUfb
 eU0xWWd1pBE283DNJKQrve+wYJWz1S4j9gd+JaXFRIjrQ98fUBoTsfr5edhNuzb5dlEv
 XcnhbHlfuQ3BBrOkqcW9JLq8YcYyDdPs90PLdh6mgiEO/pcmon3EbIf7vm/rjexJFGLu
 g70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9MBaP0iBiwW0iSh9st+CQFiJBD434V32CapT2bYlh1Y=;
 b=H4eYlXfvfghyXg19iCGtGgkzy+OwAyXPpIXsISeniEkyNzpS/trjrSSVATZagWM2kU
 cCEvA/eDFfmbJKFTw/ueJ3NUpJiCfaERrnrEw8RHEO3TJ6xGgW7WR9qJ5F6v6V9UoUGe
 cyTP3OP3QGf9foZtkbFC7pli4pbozSMHJTQFlYwWxTOlEbX9jP+FjhVKciIBCQUWmCZJ
 Loqc0sw+xTO4wkuokipolwZqKalUOz912a9C3KYdmlZuaAnD8IDnqp8SWlK+XB7eZGJ+
 ZvqPbALtib71LxsU76qcKqKhdSL8hBxpc975GADSgPCDMyaIA9M6/tzwhP6jx3a7+Vsw
 lv6A==
X-Gm-Message-State: AOAM532XRA6j2CjLfO0qN6bKgc8FdpZimtsaqDTOXPBmkaYsy3jpOWSw
 d8exoBBJE6bM9Rfl7NOYYNgMO20H/V9lnkKv7fdE1zwSkZ4=
X-Google-Smtp-Source: ABdhPJz9o3pWF8+hipUH+BfJV5VDeK6BbABT4JX3nV2GYecwMY4KPJxqQutvCMxgjgn6mNCeh/ZJ56GV/Uk4Kv8aMOY=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr10623196lfp.285.1612813109259; 
 Mon, 08 Feb 2021 11:38:29 -0800 (PST)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Mon, 8 Feb 2021 22:38:18 +0300
Message-ID: <CACSj6VW38ctPRF7VeOnm7CB39QtFyK0SAMtggm9uZxU3JHU4QQ@mail.gmail.com>
Subject: Support for the "BIOS boot type" option in the 'phosphor-host-ipmid'
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

What was the point of splitting IPMI boot source interface to BootMode
and BootSource?
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Control/Boot/Mode.interface.yaml
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Control/Boot/Source.interface.yaml

In the IPMI specification all possible boot options are represented by
"Boot Device Selector" field in the "Get System Boot Options" =D1=81ommand:

```
[5:2] - Boot device selector
0000b =3D No override
0001b =3D Force PXE
0010b =3D Force boot from default Hard-drive
0011b =3D Force boot from default Hard-drive, request Safe Mode
0100b =3D Force boot from default Diagnostic Partition
0101b =3D Force boot from default CD/DVD
0110b =3D Force boot into BIOS Setup
0111b =3D Force boot from remotely connected (redirected) Floppy/primary
removable media
1001b =3D Force boot from primary remote media
1000b =3D Force boot from remotely connected (redirected) CD/DVD
1010b =3D reserved
1011b =3D Force boot from remotely connected (redirected) Hard Drive
1100-1110b =3D Reserved
1111b =3D Force boot from Floppy/primary removable media
```

With this in mind, splitting Boot device selector to `BootMode` and
`BootSource` seems to be redundant:


https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.c=
pp
```
std::map<IpmiValue, Source::Sources> sourceIpmiToDbus =3D {
    {0x01, Source::Sources::Network},
    {0x02, Source::Sources::Disk},
    {0x05, Source::Sources::ExternalMedia},
    {0x0f, Source::Sources::RemovableMedia},
    {ipmiDefault, Source::Sources::Default}};

std::map<IpmiValue, Mode::Modes> modeIpmiToDbus =3D {
#ifdef ENABLE_BOOT_FLAG_SAFE_MODE_SUPPORT
    {0x03, Mode::Modes::Safe},
#endif // ENABLE_BOOT_SAFE_MODE_SUPPORT
    {0x06, Mode::Modes::Setup},
    {ipmiDefault, Mode::Modes::Regular}};
```

And the main question is, what is the best way to add `BIOS boot type`
option functionality to the current design?
Currently `phosphor-host-ipmid` lacks support for the IPMI BIOS boot type f=
ield:

```
[5] - BIOS boot type (for BIOS that support both legacy and EFI boots)
0b =3D =E2=80=9CPC compatible=E2=80=9D boot (legacy)
1b =3D Extensible Firmware Interface Boot (EFI)
```

Because of this it is not possible to select EFI or Legacy boot with
the ipmitool. `phosphor-host-ipmid` always reports BIOS boot type flag
as "Legacy". And this could lead to problems in the HOST firmware that
expects this feature to be working in the BMC.

```
~$ ipmitool -U root -P 0penBmc -H 192.168.101.221 -I lanplus -C 17
chassis bootdev none options=3Defiboot
Set Boot Device to none
~$ ipmitool -U root -P 0penBmc -H 192.168.101.221 -I lanplus -C 17
chassis bootparam get 5
Boot parameter version: 1
Boot parameter 5 is valid/unlocked
Boot parameter data: 8000000000
 Boot Flags :
   - Boot Flag Valid
   - Options apply to only next boot
   - BIOS PC Compatible (legacy) boot
   - Boot Device Selector : No override
   - Console Redirection control : System Default
   - BIOS verbosity : Console redirection occurs per BIOS
configuration setting (default)
   - BIOS Mux Control Override : BIOS uses recommended setting of the
mux at the end of POST
```

What is the best way to add support for this kind of functionality?
Should I add another phosphor-dbus-interface, something like
`/xyz/openbmc_project/Control/Boot/Type.interface.yaml`?
I guess I just want to know OpenBMC community opinion regarding this
problem before I start working on the solution.

Best regards,
Konstantin Aladyshev
