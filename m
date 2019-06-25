Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA185522D7
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 07:31:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XvsH4hZ5zDqWJ
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 15:31:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uqeG9VhV"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xvrg06wbzDqSr
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 15:30:35 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id l10so3552212ybj.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LUbjTQCVId9/x4FU9SrngC6WUhyNVOcKmEJiBA5bhFI=;
 b=uqeG9VhVUIO5AuojEbC+mauG7vWPWQI8+v3Yy+vyey5vc10BF0wgc0LMH0CwXc9e9S
 +C9ySn/BnfmQL5H25kmiJe/Sh6XKHg8e2iVBIzFwL3oxRS73LYdgbs/hOvzzSg5xg6Yr
 FK3x+z3/kjVwhT/356hxNCR1I2g+qoKDKd5KwPC9b9XtB/D1t/Sz15/AZiqAACnioTd+
 NzrD7+FFA8cBzgB4t8xddauvQuNehIReajMDu0qIpidy1vM/eNGRierI7Gva7UH49pC4
 W4S6s4nuO/wTSDIO/po8N3GvrYV57W7IUTZKDwT/u3d6p7lXX8gQXBV6zveY5BffhyMT
 Eh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LUbjTQCVId9/x4FU9SrngC6WUhyNVOcKmEJiBA5bhFI=;
 b=Pa5xY+Ta3Emg6/hYaPC5ZvBmJ9DhYkhQswz8UWQYHWJ+1sbLa0/Pw7wfBzSTDijFuj
 3XYvsj203Lg0fYadfZ9OXKPsr5w9kUuyr3XIiR3qy9Yo8tsFprIChm0FoiUh0yHRvtb/
 CDtVa3wzEdwViH7b4GjgKYd27gF7Fx9mb4ksMyRJFhiuvvN4mbDf+p07IEjMEGWAGeiy
 VJoXwInnBGlnsj0pHrvcHBRCEppz+Fv6JK3VKPFWAhSo8GWSINWJhHKrRIryW4toHfaK
 TimBWALWz1sYibJmV8tz3My1bjt9Ogk7exQDqDwXGbDcZCBITgxi3c8sR9e4ueaXgZ04
 0iyg==
X-Gm-Message-State: APjAAAXFOJomEhxRtDMaBUscRHxoTCR1ZLEnXxwngy+z1iIyWA40tMmn
 2QmUuAIJ2iZCCGWpeCvqDaAjd5Dbk/pZRUXQnULYJ44laUU=
X-Google-Smtp-Source: APXvYqzW82JxPjsSiQWoxhR5YIwfVdf8kA8ESFmvW2V2OWa3yifh5OQsCnydcsbmy0eVi2om23xRcDgD6j0AcG+E+uk=
X-Received: by 2002:a25:ca03:: with SMTP id a3mr12130411ybg.28.1561440631302; 
 Mon, 24 Jun 2019 22:30:31 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Kim <brandonkim@google.com>
Date: Mon, 24 Jun 2019 22:30:20 -0700
Message-ID: <CALGRKGNgvfYYt9mT=JnTSPn=oFUFP2LR7cgtGBbtUfpsku5OSw@mail.gmail.com>
Subject: Behavior change for sensor read failures (phosphor-hwmon /
 phosphor-host-ipmid)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002b045c058c1f3a01"
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
Cc: spinler@us.ibm.com, tomjoseph@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002b045c058c1f3a01
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I'm working on an alternative to NEGATIVE_ERRNO_ON_FAIL for sensor read
failures <https://github.com/openbmc/phosphor-hwmon/issues/10>.

I'm hoping to change the default behavior of phosphor-host-ipmid upon
sensor read failures and wanted to receive some feedback:

Currently if there's a fault file and it returns a fault, phosphor-hwmon
does not update the sensor value on D-Bus. However, phosphor-host-ipmid's
request will succeed (*return* *IPMI_CC_OK and a stale sensor value*) since
the device is left on D-Bus by default.

The new default behavior:

   - We will always have an OperationalState interface with Functional
   property for each Sensor.Value
   - If a fault file with fault has been detected, Functional property will
   be set to false
      - If UPDATE_FUNCTIONAL_ON_FAIL build switch is defined, Functional
      will be updated to false upon sensor read failures as well
   - phosphor-host-ipmid will read this Functional property when performing
   a Sensor.Value read
      - If the Functional property is false, phosphor-host-ipmid will
      return *IPMI_CC_SENSOR_INVALID and fail*


The main difference is that phosphor-host-ipmid will be performing an extra
property read to see if a sensor is `Functional` for Sensor.Value and
returning a failure IPMI code instead of a stale sensor value when sensor
has a fault.

You can find 3 open code reviews under this topic <
https://gerrit.openbmc-project.xyz/q/topic:%22Handle+Sensor.Value+read+failure%22+(status:open%20OR%20status:merged)
>

Thanks,
Brandon

--0000000000002b045c058c1f3a01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<div><br></div><div>I&#39;m working on an a=
lternative to=C2=A0NEGATIVE_ERRNO_ON_FAIL for sensor read failures &lt;<a h=
ref=3D"https://github.com/openbmc/phosphor-hwmon/issues/10">https://github.=
com/openbmc/phosphor-hwmon/issues/10</a>&gt;.</div><div><br></div><div>I&#3=
9;m hoping to change the default behavior of phosphor-host-ipmid upon senso=
r read failures and wanted to receive some feedback:</div><div><br></div><d=
iv>Currently if there&#39;s a fault file and it returns a fault, phosphor-h=
wmon does not update the sensor value on D-Bus. However, phosphor-host-ipmi=
d&#39;s request will succeed (<b>return</b>=C2=A0<b>IPMI_CC_OK=C2=A0and  a =
stale sensor value</b>) since the device is left on D-Bus by default.</div>=
<div><br></div><div>The new default behavior:</div><div><ul><li>We will alw=
ays have an OperationalState interface with Functional property for each Se=
nsor.Value</li><li>If a fault file with fault has been detected, Functional=
 property will be set to false</li><ul><li>If UPDATE_FUNCTIONAL_ON_FAIL bui=
ld switch is defined, Functional will be updated to false upon sensor read =
failures as well</li></ul><li>phosphor-host-ipmid will read this Functional=
 property when performing a Sensor.Value read</li><ul><li>If the Functional=
 property is false, phosphor-host-ipmid will return=C2=A0<b>IPMI_CC_SENSOR_=
INVALID and fail</b></li></ul></ul></div><div><br></div><div>The main diffe=
rence is that phosphor-host-ipmid will be performing an extra property read=
 to see if a sensor is `Functional` for Sensor.Value and  returning a failu=
re IPMI code instead of a stale sensor value when sensor has a fault.</div>=
<div><br></div><div>You can find 3 open code reviews under this topic &lt;<=
a href=3D"https://gerrit.openbmc-project.xyz/q/topic:%22Handle+Sensor.Value=
+read+failure%22+(status:open%20OR%20status:merged)">https://gerrit.openbmc=
-project.xyz/q/topic:%22Handle+Sensor.Value+read+failure%22+(status:open%20=
OR%20status:merged)</a>&gt;=C2=A0</div><div><br></div><div>Thanks,</div><di=
v>Brandon</div><div><br></div></div>

--0000000000002b045c058c1f3a01--
