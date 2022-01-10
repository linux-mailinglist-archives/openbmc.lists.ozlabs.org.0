Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A148A3E1
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 00:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXr902ssgz2yfb
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 10:47:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lx8+vJp5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lx8+vJp5; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXr8Z0mk1z2xWx
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 10:47:08 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id v124so13540045oie.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 15:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=Td5hBx3U6+no4VneY9EVYaR7+lWvzLYK9fw6rXo6n8o=;
 b=lx8+vJp5kKn5JRt0QUoHlY806CWBnvqR5S8yFxhk0M2KQ3sLpqFUSbOEVcxVzBWU0Z
 8yOWcYiQpDifXPB/tZw8VdOY/jrkqLohbOdegSjWkWvWi4dk3b5KFUtLyI2E0Yk2yoQ7
 J3vcLlbnBlUOY+W+E1N9+kHYaeSBrSk26NJeEC5ULFiTLzLubpPbT1KTpmgWGVOL2DQa
 uhMCyNAW4RmRJP+Ir8/+ZV+jyFmbVQZdxHEawvFbgUL/9g+gOQ5f661YqWl8RO/gvJZE
 FyOFBJeR+W+sr9bJtgyzw7hWwBuGIsQrY1YHlHcd1j5M8ke80Q9lT6Paic7nU4qkwfwk
 6zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=Td5hBx3U6+no4VneY9EVYaR7+lWvzLYK9fw6rXo6n8o=;
 b=FYjp9V9vke2b9B/BYN45pFGCy85rRYUyHRZBVpa3CQhuCCiVHlScrbPamn43Xp3uYp
 GsIyCyciWeybFLQjhu7/TmCquftEtByuaYX6el26BL0OT3on/VbVq5foCYFxx5QaXJNJ
 mi9mXs5DNI/ZmZuRTA3RnFXOXo/jSw+sn0wbFyp+eAhtRQusy7Q4c1q1louOwGME4bbK
 27wpcbVYob3xHtTT0HhntA5pvQFCLjxdYtiehLgwPVPAjgBjec5g76VSW2v+lVPb0bHi
 XxF9axJS62K++1X0xfsoR0oUPfodBKQAJacLEbgZEK6UlKmRmAT9q7dJyTAqJyHAkab5
 zmzg==
X-Gm-Message-State: AOAM530ze2mA7x2e0n7vbSrGyfpU9Y0o6hcgtxrtxUyNMTyibTlJ4quQ
 vAsrR2r3+szGiaVAR+58cHpAL4E7PuU=
X-Google-Smtp-Source: ABdhPJwBC2ZM5S+iXsxfGa1Zg4GwdkjVl6kebnNne6j32YVKoeFeoybmzxQoeEExOueA59yo8S1Ezg==
X-Received: by 2002:a05:6808:308d:: with SMTP id
 bl13mr98340oib.77.1641858424710; 
 Mon, 10 Jan 2022 15:47:04 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b02e:ff48:112e:8641:c280:30d1])
 by smtp.gmail.com with ESMTPSA id e69sm1766226ote.23.2022.01.10.15.47.02
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 15:47:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-76E93FF0-E254-4637-8C59-C1B59D361F95
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 10 Jan 2022 16:47:01 -0700
Subject: Query Sensor
Message-Id: <4CA1C696-1C4A-4FC9-A7F8-9AE1B892227D@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (19C56)
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


--Apple-Mail-76E93FF0-E254-4637-8C59-C1B59D361F95
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I could not find an example of a sensor query in the docs. I assume somethin=
g like this:

dbus-send --system --print-reply \
--dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b71e=
b7a1f29187594c05bb8fd9a.Hwmon1 \
/xyz/openbmc_project/sensors/temperature/lm75temp
xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \
double:

With the bold interface replaced with something correct.

Can some one give me an example, and a url about how to query properties?

Mike

Sent from my iPad=

--Apple-Mail-76E93FF0-E254-4637-8C59-C1B59D361F95
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi,</div><div><br></div><div>I could n=
ot find an example of a sensor query in the docs. I assume something like th=
is:</div><div><br></div><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"=
>dbus-send --system --print-reply \<o:p></o:p></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">--dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e5=
5ef11da905907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<o:p></o:p></p><p=
 class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; f=
ont-size: 11pt; font-family: Calibri, sans-serif;">/xyz/openbmc_project/sens=
ors/temperature/lm75temp<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webk=
it-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibr=
i, sans-serif;"><b>xyz.openbmc_project.Sensor.Property.Get</b> xyz.openbmc_p=
roject.Sensor.Value \<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-=
text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">double:</p><br><div dir=3D"ltr">With the bold interface replaced=
 with something correct.</div><div id=3D"AppleMailSignature" dir=3D"ltr"><br=
></div><div id=3D"AppleMailSignature" dir=3D"ltr">Can some one give me an ex=
ample, and a url about how to query properties?</div><div id=3D"AppleMailSig=
nature" dir=3D"ltr"><br></div><div id=3D"AppleMailSignature" dir=3D"ltr">Mik=
e</div><div id=3D"AppleMailSignature" dir=3D"ltr"><br></div><div dir=3D"ltr"=
>Sent from my iPad</div></body></html>=

--Apple-Mail-76E93FF0-E254-4637-8C59-C1B59D361F95--
