Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EBD5A4FFD
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 17:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGYtq5Dq3z3bmP
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 01:16:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=KB2g+qIj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=spatton@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=KB2g+qIj;
	dkim-atps=neutral
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGYtL6lhjz3bXZ
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 01:16:09 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27TFFm2t105906
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 10:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661786148;
	bh=yyNMGVm1UFPbwalNz/MP3bhGFsaYvXp72LDXZjOpt3w=;
	h=From:To:Subject:Date;
	b=KB2g+qIjxCPbMoBKNsZwT4CTMbsTHbZJC96+c+m8F2bpMZ4kprBfl3P4ArH+/fmys
	 URvwgb+yFP/Mnbu0AyPe4dSYJtLpG1i/gHPbYTtABuxqNLB6sTLaOgHCMDM4MK3oNv
	 WMU43khh734QxEzpr0guHyDZ5dviNURc9a7RrGrA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27TFFmrt100439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 10:15:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 29
 Aug 2022 10:15:48 -0500
Received: from DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010]) by
 DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010%17]) with mapi id
 15.01.2507.006; Mon, 29 Aug 2022 10:15:48 -0500
From: "Patton, Schuyler" <spatton@ti.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: new port seeing ipmid exiting with seg fault
Thread-Topic: new port seeing ipmid exiting with seg fault
Thread-Index: Adi7uig+46mXlu/cTLeuedYC8FAEiA==
Date: Mon, 29 Aug 2022 15:15:48 +0000
Message-ID: <66a2cce533124f56b60f68f9f0b807af@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.35.203]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_66a2cce533124f56b60f68f9f0b807afticom_"
MIME-Version: 1.0
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

--_000_66a2cce533124f56b60f68f9f0b807afticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

In our port the ipmid is exiting with a seg fault.  Does anyone have any su=
ggestions on what to look at or what the problem might be? I have included =
some info I collected from systemctl and journalctl. Thanks in advance for =
any pointers, suggestions.

root@evb-am62xx:~# systemctl status phosphor-ipmi-host
x phosphor-ipmi-host.service - Phosphor Inband IPMI
     Loaded: loaded (/lib/systemd/system/phosphor-ipmi-host.service; enable=
d; vendor preset: enabled)
    Drop-In: /lib/systemd/system/phosphor-ipmi-host.service.d
             `-10-override.conf
     Active: failed (Result: core-dump) since Mon 2022-08-29 15:01:40 UTC; =
3min 8s ago
   Duration: 1.163s
    Process: 368 ExecStart=3D/usr/bin/env ipmid (code=3Ddumped, signal=3DSE=
GV)
   Main PID: 368 (code=3Ddumped, signal=3DSEGV)

Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Schedule=
d restart job, restart counter is at 2.
Aug 29 15:01:40 evb-am62xx systemd[1]: Stopped Phosphor Inband IPMI.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Start re=
quest repeated too quickly.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Failed w=
ith result 'core-dump'.
Aug 29 15:01:40 evb-am62xx systemd[1]: Failed to start Phosphor Inband IPMI=
.


root@evb-am62xx:~# journalctl | grep ipmi
Jan 01 00:00:04 evb-am62xx systemd[1]: /lib/systemd/system/phosphor-ipmi-ne=
t@.socket:3: Invalid interface name, ignoring: sys-subsystem-net-devices-%i=
.device
Jan 01 00:00:04 evb-am62xx systemd[1]: Created slice Slice /system/phosphor=
-ipmi-net.
Aug 29 15:01:19 evb-am62xx systemd[1]: Listening on phosphor-ipmi-net@eth0.=
socket.
Aug 29 15:01:21 evb-am62xx ipmid[329]: JSON file not found
Aug 29 15:01:22 evb-am62xx systemd-coredump[339]: Process 334 (netipmid) of=
 user 0 dumped core.
Aug 29 15:01:22 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Main=
 process exited, code=3Ddumped, status=3D11/SEGV
Aug 29 15:01:22 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Fail=
ed with result 'core-dump'.
Aug 29 15:01:23 evb-am62xx systemd-coredump[338]: Process 329 (ipmid) of us=
er 0 dumped core.
Aug 29 15:01:23 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Main pro=
cess exited, code=3Ddumped, status=3D11/SEGV
Aug 29 15:01:23 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Failed w=
ith result 'core-dump'.
Aug 29 15:01:38 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Sche=
duled restart job, restart counter is at 1.
Aug 29 15:01:38 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Schedule=
d restart job, restart counter is at 1.
Aug 29 15:01:39 evb-am62xx systemd-coredump[373]: Process 370 (netipmid) of=
 user 0 dumped core.
Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Main=
 process exited, code=3Ddumped, status=3D11/SEGV
Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Fail=
ed with result 'core-dump'.
Aug 29 15:01:39 evb-am62xx systemd-coredump[371]: Process 368 (ipmid) of us=
er 0 dumped core.
Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Main pro=
cess exited, code=3Ddumped, status=3D11/SEGV
Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Failed w=
ith result 'core-dump'.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Sche=
duled restart job, restart counter is at 2.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Schedule=
d restart job, restart counter is at 2.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Start re=
quest repeated too quickly.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-host.service: Failed w=
ith result 'core-dump'.
Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi-net@eth0.service: Job =
phosphor-ipmi-net@eth0.service/start failed with result 'dependency'.

Regards,
Schuyler Patton
Sitara MPU System Applications
Texas Instruments


--_000_66a2cce533124f56b60f68f9f0b807afticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In our port the ipmid is exiting with a seg fault. &=
nbsp;Does anyone have any suggestions on what to look at or what the proble=
m might be? I have included some info I collected from systemctl and journa=
lctl. Thanks in advance for any pointers,
 suggestions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@evb-am62xx:~# systemctl status phosphor-ipmi-ho=
st<o:p></o:p></p>
<p class=3D"MsoNormal">x phosphor-ipmi-host.service - Phosphor Inband IPMI<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Loaded: loaded (/lib/system=
d/system/phosphor-ipmi-host.service; enabled; vendor preset: enabled)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Drop-In: /lib/systemd/system/phos=
phor-ipmi-host.service.d<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; `-10-override.conf<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Active: failed (Result: cor=
e-dump) since Mon 2022-08-29 15:01:40 UTC; 3min 8s ago<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Duration: 1.163s<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Process: 368 ExecStart=3D/usr/bin=
/env ipmid (code=3Ddumped, signal=3DSEGV)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Main PID: 368 (code=3Ddumped, signal=3D=
SEGV)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Scheduled restart job, restart counter is at 2.<o:p></o:p></=
p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: Stopped Phosp=
hor Inband IPMI.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Start request repeated too quickly.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: Failed to sta=
rt Phosphor Inband IPMI.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@evb-am62xx:~# journalctl | grep ipmi<o:p></o:p>=
</p>
<p class=3D"MsoNormal">Jan 01 00:00:04 evb-am62xx systemd[1]: /lib/systemd/=
system/phosphor-ipmi-net@.socket:3: Invalid interface name, ignoring: sys-s=
ubsystem-net-devices-%i.device<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:00:04 evb-am62xx systemd[1]: Created slice=
 Slice /system/phosphor-ipmi-net.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:19 evb-am62xx systemd[1]: Listening on =
phosphor-ipmi-net@eth0.socket.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:21 evb-am62xx ipmid[329]: JSON file not=
 found<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:22 evb-am62xx systemd-coredump[339]: Pr=
ocess 334 (netipmid) of user 0 dumped core.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:22 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Main process exited, code=3Ddumped, status=3D11/SEGV<o:p=
></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:22 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:23 evb-am62xx systemd-coredump[338]: Pr=
ocess 329 (ipmid) of user 0 dumped core.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:23 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Main process exited, code=3Ddumped, status=3D11/SEGV<o:p></o=
:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:23 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:38 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Scheduled restart job, restart counter is at 1.<o:p></o:=
p></p>
<p class=3D"MsoNormal">Aug 29 15:01:38 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Scheduled restart job, restart counter is at 1.<o:p></o:p></=
p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd-coredump[373]: Pr=
ocess 370 (netipmid) of user 0 dumped core.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Main process exited, code=3Ddumped, status=3D11/SEGV<o:p=
></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd-coredump[371]: Pr=
ocess 368 (ipmid) of user 0 dumped core.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Main process exited, code=3Ddumped, status=3D11/SEGV<o:p></o=
:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:39 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Scheduled restart job, restart counter is at 2.<o:p></o:=
p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Scheduled restart job, restart counter is at 2.<o:p></o:p></=
p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Start request repeated too quickly.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-host.service: Failed with result 'core-dump'.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 29 15:01:40 evb-am62xx systemd[1]: phosphor-ipmi=
-net@eth0.service: Job phosphor-ipmi-net@eth0.service/start failed with res=
ult 'dependency'.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Regards,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Schuyler Patton<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Sitara MPU System Applic=
ations<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Texas Instruments<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_66a2cce533124f56b60f68f9f0b807afticom_--
