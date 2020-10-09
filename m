Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33877288EBC
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 18:24:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7D1H343gzDqSD
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 03:24:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H68Aei14; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7D0N2WFYzDqQK
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 03:23:45 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id k6so10674003ior.2
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=07fcWIpdk386mOgFsqfdp6/Ly0QamopJS56ldowIWWw=;
 b=H68Aei14x6tPKrLG/QVfU5fAYsEGCspthELFUZ3h9AyX8xiNgNlv2HW97Wxl9Znc+q
 giNdC4DyUfdFZJ25Yj88BRtzCNFQBSzp0aRkJaTiGj9Rjb4WZOiUd4YjnwV+3Xsv9r46
 S0gptFDtWvy1im9HY2EGcLXEPJz0heCo34Q6KSVF4N/8AaqUvz82n4x0M68fpPeBrk3H
 NYyaZzTDmjMNKr9ipQnLdWkcS51TFMW05t2ketqM83xCnt/8GI4mCP2uTMfKTq9vVPXi
 vM7z+Kkl5sF/wwRHP+cdfo7dBvKGp3sZWcqj3mYMQcO+LJRY4gH+4d16bFQcQ3MYafYR
 jr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=07fcWIpdk386mOgFsqfdp6/Ly0QamopJS56ldowIWWw=;
 b=aEyRIhr1uCQ7uzlaHT/rW3EjJvFNdZlPh1V1jVv27832ORKANqmZzj2eJWzs2RsXOb
 rxuVbznDYeD1WYqxgSivDqVa2/HAibaiNLnNwbRuHPtD8ITbo3HmxaezKWvIEiRss720
 ptsxcnxWBDnWl7iPRBaTibhvp431plLfUC+meuiUjZG2j+wjiVogsKW0SIm9Siqdgcsr
 iLdGqeUsWdTBm1edSj03+F48TIdpxCG9vrkVXw7XeOctB4iiyN6SJISfZ+mWnCm3HKBl
 C/NxclEOd0H+cR3WgrgFF31ibH9KnHg9CISx6Jb1+RjpGTyXv5QMOlMsumEE7K1dUwO+
 rqBg==
X-Gm-Message-State: AOAM5335SPLZmF3sRMGTQ2ye39WHx/cZubVL8wrOA2BKlU2VYPN7VdW/
 ERM/er65a447I791wWWJ4dMlr5JFgT+zWOfZtHHNIZRikQ4=
X-Google-Smtp-Source: ABdhPJxyJDi7VTYE4RYO5TMYlyVzFX5CUeoSx5QIhL4ZCk7SwGlH1KGVeEyBCyNZqnhKpoHY3LfCkiZJWL2LdXzScao=
X-Received: by 2002:a02:c8d1:: with SMTP id q17mr11521787jao.127.1602260621890; 
 Fri, 09 Oct 2020 09:23:41 -0700 (PDT)
MIME-Version: 1.0
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Fri, 9 Oct 2020 21:53:29 +0530
Message-ID: <CAMRErLPwoqfOQKg9k5s-g84Jb5M-3S43riF9wQbpggPk=kjfsQ@mail.gmail.com>
Subject: Service auto start issue in the phosphor-gpio-monitor
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000034987c05b13f5f7b"
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
Cc: bradleyb@fuzziesquirrel.com, velumanit@hcl.com,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000034987c05b13f5f7b
Content-Type: text/plain; charset="UTF-8"

Hi All,

I have added the one line configuration("virtual/obmc-gpio-monitor")
in the package group to add the phosphor-gpio-monitor.

phosphor-multi-gpio-monitor.service not getting started automatically
at boot-up.But can able start this service in the command line.

Is there anything I need to add to start service at boot-up.

Log :
-----
root@yosemitev2:~# systemctl status phosphor-multi-gpio-monitor.service
* phosphor-multi-gpio-monitor.service - Phosphor Multi GPIO monitor
     Loaded: loaded (
]8;;file://yosemitev2/lib/systemd/system/phosphor-multi-gpio-monitor.service/lib/
    systemd/system/phosphor-multi-gpio-monitor.service ]8;;; static; vendor
preset: enabled)
     Active: inactive (dead)


Thanks
Mani.E

--00000000000034987c05b13f5f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>I have added the one line configuration(&qu=
ot;virtual/obmc-gpio-monitor&quot;) <br>in the package group to add the pho=
sphor-gpio-monitor.<br><br>phosphor-multi-gpio-monitor.service not getting =
started automatically<br>at boot-up.But can able start this service in the =
command line.<br><br>Is there anything I need to add to start service at bo=
ot-up.<br><br>Log :<br>-----<br>root@yosemitev2:~# systemctl status phospho=
r-multi-gpio-monitor.service<br>* phosphor-multi-gpio-monitor.service - Pho=
sphor Multi GPIO monitor<br>=C2=A0 =C2=A0 =C2=A0Loaded: loaded ( ]8;;file:/=
/yosemitev2/lib/systemd/system/phosphor-multi-gpio-monitor.service/lib/<br>=
=C2=A0 =C2=A0 systemd/system/phosphor-multi-gpio-monitor.service ]8;;; stat=
ic; vendor preset: enabled)<br>=C2=A0 =C2=A0 =C2=A0Active: inactive (dead)<=
br><br><br><div>Thanks</div><div>Mani.E<br></div></div>

--00000000000034987c05b13f5f7b--
