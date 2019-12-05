Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B2F113DFC
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 10:31:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T9Tc2trZzDqb5
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 20:31:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.9.34;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="KoPk7Zz4"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009034.outbound.protection.outlook.com [40.92.9.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T9Sg09GYzDqTs
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 20:30:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA0oVTuZgKoutUVMEMoMZ2dTD0iqMgbwmJ/e+qfR2EcY5oSq61r8NLF5U1FyWWrcVEISjEhTkUcpQ2fadD6dNSNct/pJYj6Vi9GibeiA8uPihhaHKs4MPgcmP5ZvmmbkbcAfFWi4VVGT0aEWL4wiXgrxQW3S4W/7xwo0274nQaptqwq3h5mb5UGbtSxh7TjZWsjC8ooiC0BaCySBmOjgPh3Wf365y4WKBLMsZRzL+EfjIOhfgTf+RxMMCVyg5fmrsBLCTAhA5ovdfH+lOcoX3pFn+hbgLSXOB+2S1Hsxyf9s7CptUzkx1TyeD6EOYbZLCPlOyLh0MoXdxLf2v/1EGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tvyt9ZsAJitwuvPXEUkvWyWI3e8VoUzv2elnUX9Ghw=;
 b=fL0/tG9Trg1Pr5Fm+7F9tRyjh0rO8ghHIM/XG1j+emj19dLzoSCH4RDQmA7qJsnBlFQDdNEutA2sOxNIC2ACQLvHToLDTcYnJMUdWOBLw2hEwVBrTLHw+ZUtkRpmX3Oi/zb6jId9/1eujqgqO4hXpvWajjGUcL+wKZUzo3ogCIRyjujvIeY4bdayDc5xLnMa5aW2RrTCoPETSaX5pz5DJ39y5MfaABwUzD0spCGTunDVCiVBhRlKLeh0y3+KgdEV79IwlLrWewwUeJy/UpoWL3hasKbJYZDEnm3221+nXO9cVEDDK/kirRLEHxxOhaaFZ2Y/5QSL1TWelsMedKMjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tvyt9ZsAJitwuvPXEUkvWyWI3e8VoUzv2elnUX9Ghw=;
 b=KoPk7Zz4mHgkSuBkj8W1+TxqfnRvVs6/XDvec2mUbhCHyb/wcFFnEkiWrimMlD/An6oyQcbPnQgHDZag3R06bn2qCck+Hn8mewgcmJzxrLFa0SPDtX/xOdvgvJDCxNWZs+Y9TGd5Mxqrr/9jVmSrulSXHaYA9jLS+wl7xcq3KjTnxMCboBb+C9yv/HXA/P2l7VH5Kq5HTX8tRhxXEZL4TJ3dLvFgZwb/xFIiWtfwdOD9bvM+Ekti50z1AWEvVVjc/qhfne5q+o23DdeEZk2eOVqSaar9ErtXBGrSiL19qcwdkp+PJY0HdoQkOYKMIC8rTVsRgacUcqiWACQTQg3hAQ==
Received: from CO1NAM04FT007.eop-NAM04.prod.protection.outlook.com
 (10.152.90.60) by CO1NAM04HT009.eop-NAM04.prod.protection.outlook.com
 (10.152.90.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Thu, 5 Dec
 2019 09:30:52 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.90.53) by
 CO1NAM04FT007.mail.protection.outlook.com (10.152.90.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 09:30:52 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e%2]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 09:30:51 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [s2600wf]: Two services conflict
Thread-Topic: [s2600wf]: Two services conflict
Thread-Index: AQHVq02Z9EDAAhtac0GNFaL0Y81YUQ==
Date: Thu, 5 Dec 2019 09:30:51 +0000
Message-ID: <MN2PR04MB66699A79577266B251242C69CD5C0@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D6E91A6AE9DAECD2D48371FA495078C5D4384713B9EE217BFD025A0C458028BB;
 UpperCasedChecksum:BCC4BEAC03FB71A707CD98BB1643D6E9ADAB4E5A75804FC430327787715CD26A;
 SizeAsReceived:6649; Count:42
x-tmn: [NmJ4ftixv72AAaik/O/bOwIQOP7fiRX4]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 4d515a9b-3a59-4b98-358f-08d77965d1f6
x-ms-traffictypediagnostic: CO1NAM04HT009:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2VWJtkIvssWy5pnrG2i/9hSSFzR233ws6rfwKyTXoIEbQn6LNlFJzY2A20y7Yg5ZIzAUdK11vHBW4e6DHEwzynsYCwRJtzDErADeVGvR8dhWgZxsw+x7eqhIfMk5CPcY+CllCw7qSHUeCwPhclLkWnxADdWESBW3nKlrFJaYpJ39HI9lHENzN4WUm+xzlVc
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66699A79577266B251242C69CD5C0MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d515a9b-3a59-4b98-358f-08d77965d1f6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 09:30:51.6390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT009
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

--_000_MN2PR04MB66699A79577266B251242C69CD5C0MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I tested the s2600wf on both qemu and real HW.
Journal says:
Jan 01 00:00:37 s2600wf systemd[1]: xyz.openbmc_project.State.Host.service:=
 Two services allocated for the same bus name xyz.openbmc_project.State.Hos=
t, refusing operation.
Jan 01 00:00:37 s2600wf systemd[1]: xyz.openbmc_project.State.Host.service:=
 Cannot add dependency job, ignoring: Unit xyz.openbmc_project.State.Host.s=
ervice failed to load properly: File exists.
--------------------
One is from   xyz.openbmc_project.State.Host.service in module phosphor-sta=
te-manager:
[Unit]
Description=3DPhosphor Host State Manager
Wants=3Dmapper-wait@-xyz-openbmc_project-control-host0-auto_reboot.service
After=3Dmapper-wait@-xyz-openbmc_project-control-host0-auto_reboot.service
Before=3Dmapper-wait@-xyz-openbmc_project-state-host.service
After=3Dphosphor-reset-host-running@0.service
Wants=3Dobmc-mapper.target
After=3Dobmc-mapper.target

[Service]
ExecStart=3D/usr/bin/env phosphor-host-state-manager
SyslogIdentifier=3Dphosphor-host-state-manager
Restart=3Dalways
Type=3Ddbus
BusName=3Dxyz.openbmc_project.State.Host

[Install]
WantedBy=3Dmulti-user.target
------------------------------
The other is from xyz.openbmc_project.Chassis.Control.Power.service in modu=
le x86-power-control:
[Unit]
Description=3DIntel Power Control

[Service]
Restart=3Dalways
RestartSec=3D3
ExecStart=3D/usr/bin/power-control
Type=3Ddbus
BusName=3Dxyz.openbmc_project.State.Host

[Install]
WantedBy=3Dsysinit.target
-----------------------
Both service file declare the BusName as xyz.openbmc_project.State.Host. Th=
at seems to be why they conflict.

Should I remove one of them?

Thanks.

Zheng



--_000_MN2PR04MB66699A79577266B251242C69CD5C0MN2PR04MB6669namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Hi,</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>I tested the s2600wf on both qemu and real HW.<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Journal says:<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Jan 01 00:00:37 s2600wf systemd[1]: xyz.openbmc_project.State.Host.se=
rvice: Two services allocated for the same bus name xyz.openbmc_project.Sta=
te.Host, refusing operation.<br>
</span><span>Jan 01 00:00:37 s2600wf systemd[1]: xyz.openbmc_project.State.=
Host.service: Cannot add dependency job, ignoring: Unit xyz.openbmc_project=
.State.Host.service failed to load properly: File exists.</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>--------------------<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>One is from &nbsp;&nbsp;xyz.openbmc_project.State.Host.service in mod=
ule phosphor-state-manager:</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span><span>[Unit]<br>
</span>
<div>Description=3DPhosphor Host State Manager<br>
</div>
<div>Wants=3Dmapper-wait@-xyz-openbmc_project-control-host0-auto_reboot.ser=
vice<br>
</div>
<div>After=3Dmapper-wait@-xyz-openbmc_project-control-host0-auto_reboot.ser=
vice<br>
</div>
<div>Before=3Dmapper-wait@-xyz-openbmc_project-state-host.service<br>
</div>
<div>After=3Dphosphor-reset-host-running@0.service<br>
</div>
<div>Wants=3Dobmc-mapper.target<br>
</div>
<div>After=3Dobmc-mapper.target<br>
</div>
<div><br>
</div>
<div>[Service]<br>
</div>
<div>ExecStart=3D/usr/bin/env phosphor-host-state-manager<br>
</div>
<div>SyslogIdentifier=3Dphosphor-host-state-manager<br>
</div>
<div>Restart=3Dalways<br>
</div>
<div>Type=3Ddbus<br>
</div>
<div>BusName=3Dxyz.openbmc_project.State.Host<br>
</div>
<div><br>
</div>
<div>[Install]<br>
</div>
<span>WantedBy=3Dmulti-user.target</span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>------------------------------</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>The other is from xyz.openbmc_project.Chassis.Control.Power.service i=
n module x86-power-control:</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span><span>[Unit]<br>
</span>
<div>Description=3DIntel Power Control<br>
</div>
<div><br>
</div>
<div>[Service]<br>
</div>
<div>Restart=3Dalways<br>
</div>
<div>RestartSec=3D3<br>
</div>
<div>ExecStart=3D/usr/bin/power-control<br>
</div>
<div>Type=3Ddbus<br>
</div>
<div>BusName=3Dxyz.openbmc_project.State.Host<br>
</div>
<div><br>
</div>
<div>[Install]<br>
</div>
<span>WantedBy=3Dsysinit.target</span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>-----------------------</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Both service file declare the BusName as <span>xyz.openbmc_project.St=
ate.Host</span>. That seems to be why they conflict.</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Should I remove one of them?</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Thanks.</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Zheng<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MN2PR04MB66699A79577266B251242C69CD5C0MN2PR04MB6669namp_--
