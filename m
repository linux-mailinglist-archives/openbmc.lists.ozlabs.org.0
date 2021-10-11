Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9A4292AA
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HShjD4vbCz2yKZ
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 01:57:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f7CuQjNh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f7CuQjNh; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HShhp4Q9Mz2xY6
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 01:56:57 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id z20so68771098edc.13
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+Pd6bHAS4Qps0SV9PiOU96qawgdI/awNMmIuTUTGa7I=;
 b=f7CuQjNhtmzDTPfeqPtg0xheoqXh7rcZNOiPtD85eAAyVHfZUNTaIAbKBkXDNxOpSS
 pK/aH/K0loWBWrfx3AsUgdTAdW7Myb8BD3VDs1XaQQt8I6hrdVbX5rhW6kMXARQUsouJ
 NaMQVyF6zWX9/rhRFVI7UoRBA8VXG3UEqnDcWZgFukfPQNufI0+CM6opj3fVSvjHamdg
 hv1Xwmn9HU4dTBSzbIbH1X+NIHeDMaTG2yPyDTD+3Rtxn/f7zLu7j/duIKlQ97Uty8jK
 xje/r3+fg61mHFepFf68rEk+jKFgm2SbXbD6qYft6yfwYGc/870RSOta1mz0DIJtEaVA
 /MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+Pd6bHAS4Qps0SV9PiOU96qawgdI/awNMmIuTUTGa7I=;
 b=dMHtCccqxeYvpsQiivVinFxZZbwqrp4oK9TB5lfeFOPf4VWnmxViTaMKjx/GcYE9wX
 6/D7zecEt948hCx1SrubbkNGOTrIN32XBAesne+5z8pfnq+9Lrdn+N8dLt3i1Whqy3rn
 wpO/v0spU0GO4PgFr5QlhaKccZEKxmLNI8jn6ywqCK97kseIl4M40JCsFUpOQ1kc5M1b
 rRZxRF2+BfhwDkzWMYb2dTyvavgtrenaT+Zm/xXanUhpj8dFx/z7qyO65hfzMVWta9vy
 MtW7CmkxLlnn6O+JY1z1ZPnJ4jiFMz3a5iGvUxpq2X4senTq4W4pYrpxFjaTvmcXxIv8
 xQkg==
X-Gm-Message-State: AOAM530Yi3zgF4Yjcai+5gY5jZveLH/MaZeW33XympSfRyds9oP1cnUI
 Mde3rgrjgxS2aHpeXStK1qQvcaXuVGiRJjtlc91A1JYySO0=
X-Google-Smtp-Source: ABdhPJymFLZ4Dx2yxnPgsPL4d/4nHhRGfkkKsrP8QWKxWcOk6LpFPSdWI8zHq/VAo9e8BCEYQ6wXX5SYmWy4frB76gE=
X-Received: by 2002:a05:6402:40d0:: with SMTP id
 z16mr42894982edb.220.1633964210863; 
 Mon, 11 Oct 2021 07:56:50 -0700 (PDT)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 11 Oct 2021 20:28:42 +0530
Message-ID: <CAA7Tbcs_YbUpD-cQo2x7XpYgFyeoYT7hkWwZ_rMCf2N+6y0BTw@mail.gmail.com>
Subject: Implementing Shutdown interfaces like Critical/Warning interfaces in
 Dbus-sensors.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005d437c05ce14f0f2"
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005d437c05ce14f0f2
Content-Type: text/plain; charset="UTF-8"

Hi All,

We have a use case of triggering alarms for Soft/Hard shutdown interfaces.
Based on these alarms, I need to power off the slots.

Critical and Warning interfaces and alarm created based on the sensor
threshold Severity value. Please refer to the below code.
https://github.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp#L116

Already we have Severity 0  for Warning and Severity 1 for Critical.
We can have Severity 2 for Softshutdown and Severity 3 for Hardshutdown.

So, Based on the Severity value, the soft and hard shutdown alarm will set
as true.
Then the sensor-monitor application would take the action based on the
soft/hard shutdown alarm.

Could you please provide your suggestions on this.

Thanks,
Kumar.

--0000000000005d437c05ce14f0f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>We have a use case of triggering alarms for=
 Soft/Hard shutdown interfaces. Based on these alarms, I need to power off =
the slots.<br><br>Critical and Warning interfaces and alarm created based o=
n the sensor threshold Severity value. Please refer to the below code.<br><=
a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/Threshold=
s.cpp#L116">https://github.com/openbmc/dbus-sensors/blob/master/src/Thresho=
lds.cpp#L116</a><br><br>Already we have Severity 0 =C2=A0for Warning and Se=
verity 1 for Critical.<br>We can have Severity 2 for Softshutdown and Sever=
ity 3 for Hardshutdown.<br><br>So, Based on the Severity value, the soft an=
d hard shutdown alarm will set as true.<br>Then the sensor-monitor applicat=
ion would take the action based on the soft/hard shutdown alarm.<br><br>Cou=
ld you please provide your suggestions on this.<br><div><br></div><div>Than=
ks,</div><div>Kumar.</div></div>

--0000000000005d437c05ce14f0f2--
