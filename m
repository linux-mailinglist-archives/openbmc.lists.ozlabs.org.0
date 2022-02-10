Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD84B1C1A
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvy2Z3DgCz3bdG
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:18:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xd7iyFwG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92c;
 helo=mail-ua1-x92c.google.com; envelope-from=karthicsk706@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Xd7iyFwG; dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvPNJ5rpVz2ymg
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 15:46:39 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id w21so2400826uan.7
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 20:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DErYDUbh4s2cblWAN9OMY7V6tiK/UnAxfXz7cSu+dmw=;
 b=Xd7iyFwGhGfJ0s/zQRq+VmUoVo4FgP8DLLScFSJiGjukuqEr4Vgu1LB/qAS2ZikK+D
 6Z7+dCOxhiSzkjBvqLHqRAvsYqAmaH7r6d/VZu+BPmRN6zyFXXmTqIEYVYna6FVcADCp
 pvB9IL1NdnoDPYx2pZ6O17zGnOuR2Ad0PciqVtWGrunWOTKJj76LRtEaJZxTKNRj3zVh
 VsebBO4n7wWAeuox/cqevit/+S/GnG58ttWxO/BqBJm1HE8AUtbj4Dpm6iGRYoJn1hKB
 ePis+S0BA9IiACby7UX7f+ZVsrq86HaAbo9SuGCgbSETQ8C5cw21PuiIU4j4r1klujJu
 OHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DErYDUbh4s2cblWAN9OMY7V6tiK/UnAxfXz7cSu+dmw=;
 b=CYLff78AC0DeaFEZ9SZhvr1i4qOSFFEUItCuaJWWpAKBRBF5xdIgnXKiiwzLOHU2Sn
 bq9Z7Pz/WNM1C76N+qrJQPb1rE/McaH7LWRhPed+qbuAtS+ADAin63SMXcAyaVh9PwaA
 BdzEDBj5Q/BlNcjVivG6h+ioViBLqE2eCTVwTI1BldzZjsUTpyI6XbS7LBt0nyOALVHY
 NraNp84i/ug+7U9G3ovyXdHbTQyu6HrlA83G3S8HHvKIsaweTbnS9hvcSEiO0aAAN+Dn
 31DwVfZo2vzsSZAYn9Y2Q6cmVFA0xKjJ8Ig1qikfbhc1TDNM2v/K7oqxgQWhEvkURV3n
 Ha/w==
X-Gm-Message-State: AOAM5306ZuVr+YIjtwuUIFYysD1HkyqCmkDd04zsPzRc2IHqPUXL1MiJ
 r8GejVkoQpUDFuqUnexCNxdAtBtmn7yI1oea4GcxEJoT9RGTaQ==
X-Google-Smtp-Source: ABdhPJx2TQVSIlseEpLGnMBne3FZjJJXfznTEoXhYmH1zUxPkeKefATv2JAWD33xgFABeA5tkSN0qH1h+YumHCqSa2k=
X-Received: by 2002:ab0:7389:: with SMTP id l9mr1863110uap.1.1644468394433;
 Wed, 09 Feb 2022 20:46:34 -0800 (PST)
MIME-Version: 1.0
From: karthi keyan <karthicsk706@gmail.com>
Date: Thu, 10 Feb 2022 10:16:23 +0530
Message-ID: <CAMN9bcxGP4V0vKqLbh7yNdnjr45mpZkBo4vzpP_xU7mfM329tA@mail.gmail.com>
Subject: EEPROM byte size identification implementation
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007e9f4f05d7a2a280"
X-Mailman-Approved-At: Fri, 11 Feb 2022 13:16:37 +1100
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
Cc: velumanit@hcl.com, anoo@us.ibm.com, Ed Tanous <ed@tanous.net>,
 thangavel.k@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007e9f4f05d7a2a280
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
Karthikeyan P

--0000000000007e9f4f05d7a2a280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In phosphor-networkd repo, ncsid is the separate daem=
on. It doesn&#39;t have the dbus-service for it, and it is not associated w=
ith the dbus service. We wanted to get the nic card manufacturer details fr=
om ncsid and that can be shared with other modules. So=C2=A0 it is possible=
 to update the code with handling dbus- service and dbus operations. If so,=
 we can get the nic card details using dbus to other modules or repositorie=
s. So is it possible to change that binary into service to expose D-bus?</d=
iv><div><br></div><div>for reference:=C2=A0<a href=3D"https://gerrit.openbm=
c-project.xyz/c/openbmc/docs/+/49477" target=3D"_blank">https://gerrit.open=
bmc-project.xyz/c/openbmc/docs/+/49477</a></div><div><br></div><div>Regards=
,</div><div>Karthikeyan P</div></div>

--0000000000007e9f4f05d7a2a280--
