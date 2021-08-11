Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D03E8F5D
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 13:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl6m50N3wz30Jx
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 21:19:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WuETSQKG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WuETSQKG; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl6lh1Xzmz2yfZ
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 21:19:11 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id o23so3573448ejc.3
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zwhFxBm8OWTlmEtb9W6K3U/lQzmUWEYcx7rII8A3l0s=;
 b=WuETSQKGiLHz5uueD81aQ5tsup8MUcXJS/z/AhWI4QD4dIGwSAM8r9RUFPtKXVBGsA
 eMlTeBvF83j33QZpTaz3mNB46TXrjMpz/eiLtOGnC2+52I/yBkF6uFCEnQY+1Kp7luvh
 WZQoJZAN3eoQyF0WxudODzGBbD5123KQqrRpamYQBHM1dc6lxM8VeHf+5RwJPeBJYp/W
 c/6x8H/M/Pli0F5hWvoiLGnqu1w8wGkfnyGNeXbICU2EC2XF/oV9jgEi75o1bUkUwpWI
 bPTClTI4NT2aGxFlYTXU9WJap3qdZObs25grQK+fCzlsvwM2ujhvZ12JdDM7AB7ssXs5
 X2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zwhFxBm8OWTlmEtb9W6K3U/lQzmUWEYcx7rII8A3l0s=;
 b=XJPhYdyv3eLcBTfXMAsT97xvinnvhACg0txhz8W72L2Bk8yFxad/B0ujo8Q/qBjqcw
 mnFsBFMmFyieALLN4GXD4OcDjV5MvU471z0BC3isquSCEZ4nkxNv3hEgbcPoYiVup7nt
 vrtdunDqAJSQJjWsQbkaJzbCUWW3Z28PD1io58/MoTIgE03RSjXyhKl5dCn3Ar0AsbU5
 bn6WcshaHYTrqBRarxH/bDFmfHuU9c9WI7MaXyHGcozDrmS1kUf1N0CrX0PYsv1w+6Vd
 12bXLeDo9rBTnrERT1I4HmSXT7PU18vk5WBTXkWn6xtr/iMJocjzCxNm3nAC/8k0C4QH
 D+JQ==
X-Gm-Message-State: AOAM532w7YMNLOnUz2DsuiNhaGf1csmtCVf3SSzLcT1lAnWfLcmD1N8U
 uN/iT210dHxftENkxHOVvh6GawuK60212L8KsChjcDnwElw=
X-Google-Smtp-Source: ABdhPJxKsESoauOf1oObGz3xdYdLvQdgKCE3PhLM74M9PV78MIfNEvNswPrAvjWVUohFthYpiXlWcCB1ONgeI9fGDu4=
X-Received: by 2002:a17:907:6297:: with SMTP id
 nd23mr3062303ejc.62.1628680744220; 
 Wed, 11 Aug 2021 04:19:04 -0700 (PDT)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 11 Aug 2021 16:51:00 +0530
Message-ID: <CAA7TbcveKrAFSODfKKJ_q1yaPEZgvn06mBO2tXe7h=Xr6jZHLw@mail.gmail.com>
Subject: Creating Hard Shutdown interfaces/alarm for NIC Sensor
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000363d2e05c946c9de"
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
 Ed Tanous <ed@tanous.net>, Jayashree D <jayashree-d@hcl.com>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000363d2e05c946c9de
Content-Type: text/plain; charset="UTF-8"

Hi All,



         We have an use case of NIC sensor value goes above 120 (upper non
recoverable), need to shutdown the slots.



         Critical and Warning interfaces and alarm created based on the
sensor threshold Severity value. Please refer the below code.


https://github.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp#L116



         For NIC sensor, planning to create soft and hard shutdown
interfaces and alarm based on severity value in hwmonTempSensor.



         Already we have Severity 0  for Warning and Severity 1 for
Critical.

         We can have Severity 2 for Softshutdown and Severity 3 for
Hardshutdown.



         So, Based on the Severity value, the soft and hard shutdown alarm
will set as true.

         Then the sensor-monitor application would take the action based on
the soft/hard shutdown alarm.


         Could you please provide your suggestions on this.



Thanks,

Kumar.

--000000000000363d2e05c946c9de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi All,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 We have an
use case of NIC sensor value goes above 120 (upper non recoverable), need t=
o shutdown
the slots.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Critical and
Warning interfaces and alarm created based on the sensor threshold Severity
value. Please refer the below code.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/Thre=
sholds.cpp#L116" style=3D"color:rgb(5,99,193)">https://github.com/openbmc/d=
bus-sensors/blob/master/src/Thresholds.cpp#L116</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 For NIC sensor,
planning to create soft and hard shutdown interfaces and alarm based on sev=
erity
value in hwmonTempSensor.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0 </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Already we
have Severity 0 =C2=A0for Warning and Severity
1 for Critical. </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 We can have
Severity 2 for Softshutdown and Severity 3 for Hardshutdown.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 So, Based on
the Severity value, the soft and hard shutdown alarm will set as true. </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Then the
sensor-monitor application would take the action based on the soft/hard
shutdown alarm. </p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt=
;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoNorm=
al" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,san=
s-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could you please provide your su=
ggestions on this.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Thanks,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Kumar.</p></div>

--000000000000363d2e05c946c9de--
