Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B465BE0BF
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 10:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWwGs4LVnz3bXy
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 18:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PKgTgwAE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=kumarthangavel.hcl@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PKgTgwAE;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWwGT0gWKz2xBF
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 18:49:52 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id y11so2287360pjv.4
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=yT+Qkq2ztS0ThS6JysD3Psj4oU9q4NKtvkU3ViiP8W8=;
        b=PKgTgwAEcyOjr2ItrjGIff9tTcaPZitj5khjwJ91xNvxuju80Sw2CMQryiirsOVmJz
         ho2omH50JiPqufcu9y5kpcJNuxQEEpYk7xwgmzrlRTurPb0Q0nmQv7DToGOE2FFAMNaz
         pV9Z8pdMUJ+Zhn8QtfjsZ591n48mgpLDorBOGW2cL7m5S1uwdviBRjzdCBtapOtvXRcg
         zpn6DOlG6foqjQadoLCThN56Cn6CdwJsM35viabkw9lI9WKP+1an1kBFNy1tuocXokvA
         9CegWE2yQ8DgM175l+U0RO/1NdvmASZRLQHsAyHGq77/Kb9k892gsPh0qvqvemxcWzwu
         Bsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=yT+Qkq2ztS0ThS6JysD3Psj4oU9q4NKtvkU3ViiP8W8=;
        b=xXYdOl6phKK+ItzK/fIcspbK+kr6E6u74wWD60jJdfA3kB1rqR2NOsSvpf+LMrDKu+
         P/6j/h1mwrFvHC/hMBVRBS+HeiGFziWQ8mzIyFS1rQCV9FJ+635VZpyiVDZ+wGKmE7TX
         mcJWrhROENTe93kx5W46vj0FzaLYPQqIJcM5rd2zGEbzYiFQHQEsTQiZhmV4po77Hgw7
         1QYRNh0Z47c0ASaJAMscAIUCJEbRXospzTExyRcZmeFqmmSPT6MixfKiIOF7oLaZYWD2
         f9fAp6SqjNHBEX835qsbHH6tTQGAjFY6eFkJI/9aWVwVQmj20HpvRa3eKM+f13KPvKx/
         FhHw==
X-Gm-Message-State: ACrzQf16eXshd9T3DA0rS1v2dGXiQLbw9ft7/1KHHOz1OV6qDw40wKfp
	GFwvauLuHzvpOog2nmN1AOS+aUWsEuTF6hYgnQFz8J9y3o8=
X-Google-Smtp-Source: AMsMyM6dOkWIy/TC+iqCG1QQbypcssuRRcmTTKKZC1FKjPjodWY2INxbJrmA0BxIkSpER7mwgJXpsHHCNyRYdoaY7SE=
X-Received: by 2002:a17:90a:cb83:b0:203:a244:832c with SMTP id
 a3-20020a17090acb8300b00203a244832cmr2650317pju.97.1663663789828; Tue, 20 Sep
 2022 01:49:49 -0700 (PDT)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 20 Sep 2022 14:19:38 +0530
Message-ID: <CAA7TbcsX-+EWCVjNMoB3n4qRWp1_1fOLWkM_8qK1UTXqQ-GgSw@mail.gmail.com>
Subject: Rescan busses for FRU device removal/unplug
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000037f10405e917e9ec"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>, velumani.hcl@gmail.com, garnermic@gmail.com, velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000037f10405e917e9ec
Content-Type: text/plain; charset="UTF-8"

Hi All,

Whenever Rescan function is called, it is removing all fru devices and
their interfaces from dbus and scans all busses and adding all other
devices and dbus interfaces.

If ReScan function is called, incase of removing/unplugging only one FRU
device from the system, then it will remove all fru devices from the system
and their interfaces instead of removing one device. So, all the FRU's and
associated sensors and their dbus interfaces were also removed. Then scans
all buses and adds newly scanned devices and dbus interfaces.

Ex : If a system has 5 FRU devices, then one FRU device is
removed/unplugged, it will remove all devices and scan all buses and
recreate the 4 FRU devices.

I think Some additional removal of other FRU devices and adding/recreating
other FRU devices is happening here. So, to avoid this issue, We can keep
both old and new scanning lists and compare the devices in the list and
remove only the unplugged FRU devices and their dbus interfaces and keep
other FRU devices as it is. This is also applicable for adding(plug) new
FRU to the system.

Please share your thoughts on this.

--00000000000037f10405e917e9ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Whenever Rescan function is cal=
led, it is removing all fru devices and their interfaces from dbus and scan=
s all busses and adding all other devices and dbus interfaces.<br><br>If Re=
Scan function is called, incase of removing/unplugging only one FRU device =
from the system, then it will remove all fru devices from the system and th=
eir interfaces instead of removing one device. So, all the FRU&#39;s and as=
sociated sensors and their dbus interfaces were also removed. Then scans al=
l buses and adds newly scanned devices and dbus interfaces.<br><br>Ex : If =
a system has 5 FRU devices, then one FRU device is removed/unplugged, it wi=
ll remove all devices and scan all buses and recreate the 4 FRU devices. <b=
r><br>I think Some additional removal of other FRU devices and adding/recre=
ating other FRU devices is happening here. So, to avoid this issue, We can =
keep both old and new scanning lists and compare the devices in the list an=
d remove only the unplugged FRU devices and their dbus interfaces and keep =
other FRU devices as it is. This is also applicable for adding(plug) new FR=
U to the system. <br><br>Please share your thoughts on this.<br></div></div=
>

--00000000000037f10405e917e9ec--
