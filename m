Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298837B0C0
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 23:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfrW805pYz3cDh
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 07:23:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DixXUpGM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DixXUpGM; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfrTB11RMz3bs0
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 07:21:33 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id j75so20319344oih.10
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fAi8U1BzCcK47EfiykF51uBOEzU4yuKs+y6J7axAFI8=;
 b=DixXUpGMy+lpPdXlqUAelI4h5KSndJU4K42u2F4DKaU5FN2JAOy1J564gthAM/l63W
 rR4HxrJYkzLt0xDoEcqIuD+AKszHjC9TJS83h7PfoA/IvZzYD3WwCEukHdmsDc46zLtN
 lVK1w/T8doc6IvgHduy0bzUbjo4qDOKZqCo5VwaQR3DF4AjxAbueciM4aiFl7eyeqMhE
 lO5UXVVP8/ZFAtnFzrgsAR8s+F4LNLAbaWn1YakvRIVH43uU/sU+byNO9cYhjF5Vx8Ak
 mfE2/NSFQabtEiaNxC+NuqQzo2HYE4wDoGKO0WWkmKAHKdl5wORlGtsvNB96RyZO3g+9
 f5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fAi8U1BzCcK47EfiykF51uBOEzU4yuKs+y6J7axAFI8=;
 b=bh/khI8uSEbdmthTIkw66/FKClBI4RSuzLBa1Dj32jZmv3Sa3hlzPxM9VmHjcL7A1C
 +M4qBpqMawj1sFcuFO/euJgqGuvMXz19jr8YlPJUoYhiOzgDfnWFo37iJLVBx8sHH56/
 IPUNMYZt5jW+MHWMAHw2YeuAW1nv0e1K6WfSeerc8jZvGHBDrvmq9buo15ryyCTJsMWd
 SRjjGIIp3JgoYfo+r0SkkPkyH8ig36g9Z7chHhzD1oy0nrJR0t4aGL+dVcw/VAxjqIP5
 s7PZGKKfsCJ9uZvDO0CZWMApKweIYd/ceFPGugKstZ1P7536rLCFv3ZkY1xL+5sszDIz
 5u2A==
X-Gm-Message-State: AOAM533gYFrnV1/1Yopt8cbZhQP3t4cVKTjyPm8AE6yMJmBfMjs0id/6
 JZluxtggKklJIWqTaXY/64M=
X-Google-Smtp-Source: ABdhPJxrz59sY8qilh4HLeBK7CUH7m/ASeTk9rbTlDAsu66TrqPk5saucN5q1QkEWUj773VxALPz8g==
X-Received: by 2002:aca:b383:: with SMTP id c125mr5195432oif.60.1620768088469; 
 Tue, 11 May 2021 14:21:28 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:f4e2:df94:bf29:a77a])
 by smtp.gmail.com with ESMTPSA id v19sm4056696otq.35.2021.05.11.14.21.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 May 2021 14:21:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: Phosphor-host-check failing when running sdbus commands
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SN6PR08MB4399AB4C2EA5000B74F995EAC3539@SN6PR08MB4399.namprd08.prod.outlook.com>
Date: Tue, 11 May 2021 16:21:27 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A78B1C8-208A-49B8-84F6-ED94D72B1595@gmail.com>
References: <SN6PR08MB439915516EDE54C56D38AB86C3549@SN6PR08MB4399.namprd08.prod.outlook.com>
 <SN6PR08MB4399AB4C2EA5000B74F995EAC3539@SN6PR08MB4399.namprd08.prod.outlook.com>
To: Brandon Ong <Brandon.Ong@fii-na.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 11, 2021, at 9:38 AM, Brandon Ong <Brandon.Ong@fii-na.com> =
wrote:
>=20
> Hi All,
>=20
> This is the issue I encountered and I=E2=80=99m still stuck on..
>=20
> Using journalctl -u phosphor-reset-host-check@0.service
> =20
> Apr 28 23:28:18 kudo systemd[1]: Starting Check Host0 status on BMC =
reset...
> Apr 28 23:28:20 kudo phosphor-host-check[973]: Check if host is =
running
> Apr 28 23:28:20 kudo phosphor-host-check[973]: Error in mapper call =
for control host, use default service
> Apr 28 23:28:25 kudo phosphor-host-check[973]: Error in call to =
control host Execute
> Apr 28 23:28:25 kudo phosphor-host-check[973]: terminate called after =
throwing an instance of 'sdbusplus::exception::SdBusError'
> Apr 28 23:28:25 kudo phosphor-host-check[973]:   what():  sd_bus_call: =
org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable
> Apr 28 23:28:33 kudo systemd[1]: phosphor-reset-host-check@0.service: =
Main process exited, code=3Ddumped, status=3D6/ABRT
> Apr 28 23:28:33 kudo systemd[1]: phosphor-reset-host-check@0.service: =
Failed with result 'core-dump'.
> Apr 28 23:28:33 kudo systemd[1]: Failed to start Check Host0 status on =
BMC reset.

You may want to try out =
https://gerrit.openbmc-project.xyz/q/topic:%22bmc-reset-host-up%22+(status=
:open%20OR%20status:merged)

I=E2=80=99ve been refactoring this code path. You=E2=80=99d want to be =
sure you have the phosphor-host-ipmid, phosphor-state-manager, and =
phosphor-dbus-interface commits. The pldm one=E2=80=99s are not needed.

>=20
> Thanks,
> Brandon

