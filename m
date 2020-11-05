Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB42A774D
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 07:03:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRXxv2nQ2zDqkx
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:03:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Shg61Lub; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRXx94hhSzDqfc
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 17:02:35 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id w4so562111pgg.13
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 22:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ue0+PkLFA5H9LsHbrvd/2iD+2F3SXDQCaZqfN1XkzXw=;
 b=Shg61Lub/ri5bsoxutj70GzHIprfeqaevvbuBlD9PXZ2YeKiHkLZpLHJ7eQkhCHBop
 10t7SjO2XjuqrGQ0KVFFIFkeZkWwjf8H0wwfL9ORHIwuu8wtCtsUv/1gPAmUD1vQZPD3
 yx7sazgAx76TYy2UVANzSG52uoXOv02YH28YGdXVtzYEY158neJVpW7TFtuJJfVhP2VV
 3SyWQVnbscSFjOnPamc7XWXc/1npffz8z/S1FJfbvaeTvbvn0kKKIGqom1iabNAheN5W
 WroXolpQ4nfIcqobrfMz8ajQXQP4boDMW0PsLg5rQ6j1XOktlRYVZStBRMI+3yfW6SzN
 RSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ue0+PkLFA5H9LsHbrvd/2iD+2F3SXDQCaZqfN1XkzXw=;
 b=tv9xGckZ/gjDJSxBBJZY79ZJnK25Vl3iw+oOHjw1JuTyM3B1Sb7niq5dCzKx4doFzU
 Kkv2+bm15TTRzCXIPBPts1ap4SshXM3TAsVzxw21diLahecoR/YYpAxZywNi/o4HQfBt
 PCFDsmkq+6dDu6jIYUiKleUZYWCYo0lba8piowxdeuW/JSEsONLjUKn7yAJsvxkh/SEV
 pm/U0rUnnn7Bgni/1mkjEcUfUmAVBQmPdHRwZpuVFp9ZebaL9CdsJ7fwO/rW2F6FRlix
 XhPQRmledy83NsdszTJuyjAwLI33PXnH0hrXMMmeqcGZ5Ak6L4Q+q2sw475vRVvFkP/t
 9gxw==
X-Gm-Message-State: AOAM531uXhRkWxujoLZBsovB40YazdYYPnGQqFia/gFssE/WoAMg1Sav
 HHCxFDoLJm0rc2+MLsaTvWvrClbT8Md3BwfqNmtASQsXt1EPjA==
X-Google-Smtp-Source: ABdhPJxO7R2P7qHIKB2FEFAVR1SacT0vmkzJC969eAoEzpYZL3ZHpEFAC4baLmrclf5JUaSzhXA/+2+x8RuHXH582cM=
X-Received: by 2002:a63:6547:: with SMTP id z68mr952362pgb.411.1604556147829; 
 Wed, 04 Nov 2020 22:02:27 -0800 (PST)
MIME-Version: 1.0
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 5 Nov 2020 11:32:17 +0530
Message-ID: <CAD+gp9B6Y8-hCP+hzT3Bh8xkg-mcFj_EnQ-FDz6Ax_tqAtJnnw@mail.gmail.com>
Subject: Error:"Failed to find the pwm0_gpio40 line"
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000036add605b355d7a4"
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

--00000000000036add605b355d7a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

we are trying to control our board with RPI bmc.we are trying to control
power on, off and reset

we compiled x86-power-control with openbmc and create a patch for the sane
with the GPIO name "pwm0_gpio40". and when we are try to use this.
we are facing the below error.

root@akky:~# systemctl status
xyz.openbmc_project.Chassis.Control.Power.service
=E2=97=8F xyz.openbmc_project.Chassis.Control.Power.service - Power Control
Loaded: loaded
(/lib/systemd/system/xyz.openbmc_project.Chassis.Control.Power.service;
enabled; vendor preset: enabled)
Active: failed (Result: exit-code) since Thu 1970-01-01 00:00:13 UTC; 33s
ago
Process: 310 ExecStart=3D/usr/bin/power-control (code=3Dexited,
status=3D255/EXCEPTION)
Main PID: 310 (code=3Dexited, status=3D255/EXCEPTION)
Jan 01 00:00:13 akky systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Scheduled restart job,
restart counter is at 2.
Jan 01 00:00:13 akky systemd[1]: Stopped Power Control.
Jan 01 00:00:13 akky systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Start request repeated
too quickly.
Jan 01 00:00:13 akky systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Failed with result
'exit-code'.
Jan 01 00:00:13 akky systemd[1]: Failed to start Power Control.
root@akky:~# /usr/bin/power-control -h
Start Chassis power control service...
Failed to find the pwm0_gpio40 line

Could someone help me how to fix this or some pointers regarding this error=
.

Also is physcial connection between the bmc and the server is needed or we
can test this through someother way.

Thanks & Regards,
Khader B Shaik

--00000000000036add605b355d7a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Team,<div><br></div><div><div style=3D"box-sizing:=
border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emo=
ji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">we are tryin=
g to control our board with RPI bmc.we are trying to control power on, off =
and reset=C2=A0</div></div><div style=3D"box-sizing:border-box;font-family:=
&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI=
 Emoji&quot;,sans-serif;font-size:14px"><br></div><div style=3D"box-sizing:=
border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emo=
ji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px"><div style=
=3D"box-sizing:border-box">we compiled x86-power-control with openbmc and c=
reate a patch for the sane with the GPIO name &quot;pwm0_gpio40&quot;. and =
when we are try to use this.</div><div style=3D"box-sizing:border-box">we a=
re facing the below error.</div><div style=3D"box-sizing:border-box"><br></=
div><div style=3D"box-sizing:border-box"><div style=3D"box-sizing:border-bo=
x"><div>root@akky:~# systemctl status xyz.openbmc_project.Chassis.Control.P=
ower.service<br>

=E2=97=8F xyz.openbmc_project.Chassis.Control.Power.service - Power Control=
<br>

     Loaded: loaded (/lib/systemd/system/xyz.openbmc_project.Chassis.Contro=
l.Power.service; enabled; vendor preset: enabled)<br>

     Active: failed (Result: exit-code) since Thu 1970-01-01 00:00:13 UTC; =
33s ago<br>

    Process: 310 ExecStart=3D/usr/bin/power-control (code=3Dexited, status=
=3D255/EXCEPTION)<br>

   Main PID: 310 (code=3Dexited, status=3D255/EXCEPTION)</div>

<div>
<div> </div>

<div>
<div>Jan 01 00:00:13 akky systemd[1]: xyz.openbmc_project.Chassis.Control.P=
ower.service: Scheduled restart job, restart counter is at 2.<br>

Jan 01 00:00:13 akky systemd[1]: Stopped Power Control.<br>

Jan 01 00:00:13 akky systemd[1]: xyz.openbmc_project.Chassis.Control.Power.=
service: Start request repeated too quickly.<br>

Jan 01 00:00:13 akky systemd[1]: xyz.openbmc_project.Chassis.Control.Power.=
service: Failed with result &#39;exit-code&#39;.<br>

Jan 01 00:00:13 akky systemd[1]: Failed to start Power Control.<br>

root@akky:~# /usr/bin/power-control -h<br>

Start Chassis power control service...<br>

Failed to find the pwm0_gpio40 line<br>

 </div></div></div><div><br></div><div>Could someone help me how to fix thi=
s or some pointers regarding this error.</div><div><br></div><div>Also is p=
hyscial=C2=A0connection between the bmc and the server is needed or we can =
test this through someother=C2=A0way.</div><div><br></div><div>Thanks &amp;=
 Regards,</div><div>Khader B Shaik</div><div><br></div></div></div></div></=
div>

--00000000000036add605b355d7a4--
