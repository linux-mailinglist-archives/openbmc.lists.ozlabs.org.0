Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D04BD8E9
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 11:05:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2HwY6Cxhz3cCT
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 21:05:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gf3wBkdc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=logananth13.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gf3wBkdc; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Hw82cz8z3bVd
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 21:04:38 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso15155447pjl.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IwgQR0zL9dbZHRDQOTsUviIRA6Yarv0XMQGj8yyvy1E=;
 b=gf3wBkdcSLe2sdnLOIeGrNnFOAm9xoE3FvBb7zDjm1cLM+Vywn07XOsuTTrCP69Zfg
 QXYZ1BldyaC9mzJ4D+A8FJo9MYNod+BBPXJJMvQCVcchGExAel6KAJjivfsbdiSXdQiG
 WmnzBGYpdqk3riarsF/Jd74QqBHfgmK8x+QAMCaDPZAWlOLj6Gmzj5zmQVDMxB+yNPOs
 LDX0Qvm7Hrum6CT9EKgjpiaQY4MChjtqtKWCd6Bk1pYS9/JQbqIBr1f4MMYt2shQ8Fia
 S4/iN13KjULFCfalyepN/R+VuuRzsp1IfV3kJh5zGsxoNsdPbsvnG/Y1x2js6uUd/3Ur
 p4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IwgQR0zL9dbZHRDQOTsUviIRA6Yarv0XMQGj8yyvy1E=;
 b=r531IsASW5Kd8UdsYgk+CuSyaqZ1ZGMK5JIP0vDDOug1eQm0Py20218GL0Qc9RHf16
 ChddnkLfNbHz9lG9Ydt5WoTiFIv7e6OcdPQ2RS4W0/b2v8QlDzGMsN6Sq1QLzqhWOIoj
 fOypMrOLxo/FUzrMHpJKD0g5IWHCEfCJAAwT/wvzfc2moIzu/IhcbtXcFAT71+zX0BaH
 oBvNW8m+7/VP0475/v2tW51dgW9eJvk9NhkqGckX15Mmfz3K7Y58K5XiwmMSmjJPUI7c
 a/q4iKmcrnuCpywXHO+SmV7cSeeieQD1Aa/WTHz8fhzf9kQC6q022Y/EpDDcbBsEtrQG
 WHlA==
X-Gm-Message-State: AOAM532ai68rdb7J9LgAzzKtsuxLBEjZtGnezLdCdILBo49rIe9dyRXR
 i8aLcDEup3u+DrvwfqrV7m7rtXw2xm9VZ5pAc/nfYBFrt/wFMo5oIYs=
X-Google-Smtp-Source: ABdhPJw2XFdVpxyTbGVLaE3SOhvMGpHU8lfGA8bJ7ICu/mNIoLOO61QWo0dF0f/dpOs+xwZ0DeLGclLJ3e443LxETuU=
X-Received: by 2002:a17:902:9682:b0:14e:fe33:64af with SMTP id
 n2-20020a170902968200b0014efe3364afmr18386625plp.160.1645437876587; Mon, 21
 Feb 2022 02:04:36 -0800 (PST)
MIME-Version: 1.0
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Mon, 21 Feb 2022 15:34:25 +0530
Message-ID: <CAGpPFEGBJdci87Cjy7N0DQUPE=4W6MrWi_=PFXVuH8sv1xP15Q@mail.gmail.com>
Subject: EEPROM byte size identification implementation
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000224fa305d8845c39"
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
Cc: thangavel.k@hcl.com, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000224fa305d8845c39
Content-Type: text/plain; charset="UTF-8"

In phosphor-networkd repo, ncsid is the separate daemon. It doesn't have
the dbus-service for it, and it is not associated with the dbus service. We
wanted to get the nic card manufacturer details from ncsid and that can be
shared with other modules. So  it is possible to update the code with
handling dbus- service and dbus operations. If so, we can get the nic card
details using dbus to other modules or repositories. So is it possible to
change that binary into service to expose D-bus?

for reference: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49477

Regards,
Logananth.S

--000000000000224fa305d8845c39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In phosphor-networkd repo, ncsid is the separate daem=
on. It doesn&#39;t
 have the dbus-service for it, and it is not associated with the dbus=20
service. We wanted to get the nic card manufacturer details from ncsid=20
and that can be shared with other modules. So=C2=A0 it is possible to updat=
e=20
the code with handling dbus- service and dbus operations. If so, we can=20
get the nic card details using dbus to other modules or repositories. So
 is it possible to change that binary into service to expose D-bus?</div><d=
iv><br></div><div><div>for reference:=C2=A0<a href=3D"https://gerrit.openbm=
c-project.xyz/c/openbmc/docs/+/49477" target=3D"_blank">https://gerrit.open=
bmc-project.xyz/c/openbmc/docs/+/49477</a></div></div><div><br></div><div>R=
egards,</div><div>Logananth.S<br></div></div>

--000000000000224fa305d8845c39--
