Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88C12A982
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 02:35:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jsvj42H6zDqLN
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 12:34:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.81; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="HH8yn/Xf"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320081.outbound.protection.outlook.com [40.107.132.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jsv05g5mzDqBN
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 12:34:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8t435ChAxfpqU8pP9kjsUtCEd9IiCFSBfgm3rXtK+LEoi2Szeo9U2sYiAXiBU4wvI+/eQvT1MJbIaBlAMAzAliZQ3VfrEByvag/dcIakse65eX8adJG+w6v0y+Ra1FSvUFoPNE90ZivzUm4cBtPFnB26bfgAx3IHELh9lb+H6McPO5gWshll1Pr4LGNWTiOrDGDdHrW2ZBwF32r/NNymBAqw06mPcVez0yysvXKyF17XlUJtUp0ATNwnugpZFHjoTBJ6cM0pd9u6d0yqEpRyq144WkE3zJlcOeYDv54MvXXjXmOvfVNT1jXq52nMX5nm1W+Vq/oZ6yEzqIpYqN6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujaJrEj3Co9JvFngSTsVNEqIG31GhVZpyOaL6wa+qgA=;
 b=aGbd2ZOad0hbpvJf7wa1FfgS1Q2LRuR+v7fDIs8x1BbTo0jiwnzeiPR3UmRNTSiFTi5JoNpUUVTa5BSEM366g/iajyAnWQZrL/IohawkwnNLPtyT9MLwaMA83PtixykIfJCyrFoy6iiQL2InRhcEvFO82uq40alOESDBCNqRiz7oJ9z9cSTELKrmhEBjb9zoSsg3S5HmuU0BoM57nHLZ35GcizfqxTGl3Vm5VHmlTC05rknoQztkr0dVu0VoCa0nXU8TcZIt9BGAORLpHCP1z53+5l0/McsdWz3/3rvv0fFmxxVne/sBzrqm75uSwbohsLiJGKGppB0uiOd56Mdq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujaJrEj3Co9JvFngSTsVNEqIG31GhVZpyOaL6wa+qgA=;
 b=HH8yn/XfxRMAnrEkCvGAhGZQUT2ifIspYuwbVBWNw7aBfqvheRQhdMP1dmGfA37Po7+scBFDXPkrbFyoh0nrHXEDk3/SkgeSd2OLEovluER4XXRRCKJOnVW7XywT+NF2oGFCFrnZ3qx0gpQCrMkK9/RTvn3EncPNCER0v8HTpG4=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB2996.apcprd03.prod.outlook.com (52.133.147.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.7; Thu, 26 Dec 2019 01:34:09 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999%6]) with mapi id 15.20.2581.007; Thu, 26 Dec 2019
 01:34:09 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: zhang_cy1989 <zhang_cy1989@163.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: systemctl start obmc-host-start@0.target fail
Thread-Topic: systemctl start obmc-host-start@0.target fail
Thread-Index: AQHVuxd2dgun2IBbEEOrXiAK9S1+uKfLnUVQ
Date: Thu, 26 Dec 2019 01:34:09 +0000
Message-ID: <HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <6d26931a.d7c4.16f3cc7df52.Coremail.zhang_cy1989@163.com>
In-Reply-To: <6d26931a.d7c4.16f3cc7df52.Coremail.zhang_cy1989@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74233c52-8ad6-46d8-77b8-08d789a3b43c
x-ms-traffictypediagnostic: HK0PR03MB2996:|HK0PR03MB2996:
x-microsoft-antispam-prvs: <HK0PR03MB299632754DA6D148B21B1423CF2B0@HK0PR03MB2996.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(366004)(136003)(376002)(346002)(189003)(199004)(55016002)(26005)(6506007)(66446008)(66476007)(66556008)(64756008)(9686003)(186003)(966005)(76116006)(2906002)(66946007)(7696005)(5660300002)(52536014)(71200400001)(53546011)(8936002)(81166006)(8676002)(81156014)(316002)(110136005)(33656002)(86362001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB2996;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YfPFMahipJJWZEnwjmpp6lJ2CGCb702HlyRme0H6OxblXblbULv78pR67H1YeQcmyWdJCrCzKI0xadc8OJgnMnoUHvqfuhQPN1tGfCQuakOtOen9zJKdufLjxbJR0X6C4HZ19bJ6FrvUrGr6mi5ryiEHBKzu46Q4/wSBHrQK3RXUi3bcbCzhsoPNORLvPxY9qIvzrI0kbmImTRPdzL9+xzs/HkVV6uuw2OYzzRp7ma7OC/R0p3HP4VCbtQK84fuHAML+2D1mpjihfoZf51nbERF64K4ytNndIqgyPzcf2EXivyT+K+I5bq2P33SLvCEaKnzFvS9UQ/hQx0n1KRFZy30DseIXGKKlso9SIa+9FqKJtOJyYZL5qsUXqPLfAgbP1ko0y/DZelYRpqbTRYLZ83o71ZkDgMM1HYw6IBjvVTM0H3qwNnVjZrMM5CJ1GoiwgCf09/k6PKdvRwu+ReXqNxk4LMKu8n+z6slXaVHU7Ro=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74233c52-8ad6-46d8-77b8-08d789a3b43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2019 01:34:09.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJvzdtojEI4qMZv2o/JAiPpFPPpPthIetgfQZxB8dPDwcRxR6stIDOM77ZnZHVI/5NV/O0yHgiDlyz9AIhH2Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB2996
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

--_000_HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Felixzhang,

About this kind of systemd target start fail, you can use dbus-monitor to c=
heck target dependency more detail.
BTW, you can also use systemctl list-dependecies obmc-host-start@0.target t=
o get all related services.

For example for using x86-power-control:
systemctl list-dependencies obmc-host-start@0.target

obmc-host-start@0.target (Power ON)
-> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service
-> phosphor-reset-host-reboot-attempts@0.service
-> obmc-host-startmin@0.target
     -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service
     -> obmc-enable-host-watchdog@0.service
     -> phosphor-watchdog@poweron.service
     -> obmc-chassis-poweron@0.target
          -> intel-power-start@0.service
          -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.servic=
e
          -> phosphor-fan-control-init@0.service
          -> phosphor-fan-monitor-init@0.service
          -> phosphor-fan-presence-tach@0.service

Then you should found that might some services doesn't start normally and c=
ause your obmc-host-tart@0.target start fail.

Best regards,
Tim
From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org=
] On Behalf Of zhang_cy1989
Sent: Wednesday, December 25, 2019 7:19 PM
To: openbmc@lists.ozlabs.org
Subject: systemctl start obmc-host-start@0.target fail



Dear All
   On ast2500+x86 platform, use the romulus bmc firmware, the detail inform=
ation:
ID=3D"openbmc-phosphor"
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"2.7.0-0"
VERSION_ID=3D"2.7.0-0-gcb91a7773-dirty"
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)=
 2.7.0-0"
BUILD_ID=3D"2.7.0"
OPENBMC_TARGET_MACHINE=3D"romulus"

  The BMC ip: 192.168.0.1
  Remote Computer ip: 192.168.0.2

  I use the ipmitool to communicate with BMC:
ipmitool -I lanplus -H 192.168.0.1 -U root -P 0penBmc power on

 And from the journalctl results, I found those infromations:
......
-- The unit op-wait-power-on@0.service<mailto:op-wait-power-on@0.service> h=
as entered the 'failed' state with result 'timeout'.
Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to turn=
 on.
-- Subject: A start job for unit op-wait-power-on@0.service<mailto:op-wait-=
power-on@0.service> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- A start job for unit op-wait-power-on@0.service<mailto:op-wait-power-on@=
0.service> has finished with a failure.
--
-- The job identifier is 906 and the job result is failed.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power O=
n).
-- Subject: A start job for unit obmc-chassis-poweron@0.target<mailto:obmc-=
chassis-poweron@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- A start job for unit obmc-chassis-poweron@0.target<mailto:obmc-chassis-p=
oweron@0.target> has finished with a failure.
--
-- The job identifier is 886 and the job result is dependency.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0 Minim=
um.
-- Subject: A start job for unit obmc-host-startmin@0.target<mailto:obmc-ho=
st-startmin@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- A start job for unit obmc-host-startmin@0.target<mailto:obmc-host-startm=
in@0.target> has finished with a failure.
--
-- The job identifier is 752 and the job result is dependency.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.
-- Subject: A start job for unit obmc-host-start@0.target<mailto:obmc-host-=
start@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- A start job for unit obmc-host-start@0.target<mailto:obmc-host-start@0.t=
arget> has finished with a failure.
Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target<mailto:obmc-ho=
st-start@0.target>: Job obmc-host-start@0.target<mailto:obmc-host-start@0.t=
arget>/start failed with result 'dependency'.
Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target<mailto:obmc-ho=
st-start@0.target>: Triggering OnFailure=3D dependencies.
Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target<mailto:obmc=
-host-startmin@0.target>: Job obmc-host-startmin@0.target<mailto:obmc-host-=
startmin@0.target>/start failed with result 'dependency'.
Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target<mailto:obmc=
-host-startmin@0.target>: Triggering OnFailure=3D dependencies.
Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target<mailto:ob=
mc-chassis-poweron@0.target>: Job obmc-chassis-poweron@0.target<mailto:obmc=
-chassis-poweron@0.target>/start failed with result 'dependency'.
Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target<mailto:ob=
mc-chassis-poweron@0.target>: Triggering OnFailure=3D dependencies.
......

I alse do the following action:
systemctl start obmc-host-start@0.target<mailto:obmc-host-start@0.target>
And alse get the similar fail result.

I don't how to debug this isuue.Could you give me some suggestions?

Best Regards
Felixzhang








________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0HK0PR03MB4660apcp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:746683260;
	mso-list-type:hybrid;
	mso-list-template-ids:1347444886 -1018534136 865637696 1704367922 -7440780=
18 -1471895998 -546286762 -2061070516 -224210562 1537788260;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Hi Felixzhan=
g,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">About this k=
ind of systemd target start fail, you can use
<b>dbus-monitor</b> to check target dependency more detail.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">BTW, you can=
 also use
<b>systemctl list-dependecies obmc-host-start@0.target</b> to get all relat=
ed services.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">For example =
for using x86-power-control:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">systemctl=
 list-dependencies obmc-host-start@0.target<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">obmc-host-st=
art@0.target (Power ON)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; mapper=
-wait@-xyz-openbmc_project-Chassis-Control-Power0.service<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; phosph=
or-reset-host-reboot-attempts@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; obmc-h=
ost-startmin@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.=
service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; obmc-enable-host-watchdog@0.service<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; phosphor-watchdog@poweron.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; obmc-chassis-poweron@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; intel-power-start@0.servic=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; mapper-wait@-xyz-openbmc_p=
roject-Chassis-Control-Power0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-control-init@=
0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-monitor-init@=
0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-presence-tach=
@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Then you sho=
uld found that might some services doesn&#8217;t start normally and cause y=
our obmc-host-tart@0.target start fail.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Best regards=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Tim<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
openbmc [mailto:openbmc-bounces&#43;chli30=3Dnuvoton.com@lists.ozlabs.org]
<b>On Behalf Of </b>zhang_cy1989<br>
<b>Sent:</b> Wednesday, December 25, 2019 7:19 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> systemctl start obmc-host-start@0.target fail<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Dear All<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; On ast2500&#4=
3;x86 platform, use the romulus bmc firmware, the detail information:<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#DD4032">ID=3D&quot;openbmc-ph=
osphor&quot;</span></b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#DD4032"><br>
<b>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro=
)&quot;</b><br>
<b>VERSION=3D&quot;2.7.0-0&quot;</b><br>
<b>VERSION_ID=3D&quot;2.7.0-0-gcb91a7773-dirty&quot;</b><br>
<b>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference=
 Distro) 2.7.0-0&quot;</b><br>
<b>BUILD_ID=3D&quot;2.7.0&quot;</b><br>
<b>OPENBMC_TARGET_MACHINE=3D&quot;romulus&quot;</b></span><span lang=3D"EN-=
US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;colo=
r:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; The BMC ip: 192.168=
.0.1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; Remote Computer ip:=
 192.168.0.2<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; I use the ipmitool =
to communicate with BMC:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">ipmitool -I lanplus -H 192=
.168.0.1 -U root -P 0penBmc power on<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;And from the journal=
ctl results, I found those infromations:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">......<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">-- The unit
<a href=3D"mailto:op-wait-power-on@0.service">op-wait-power-on@0.service</a=
> has entered the 'failed' state with result 'timeout'.<br>
Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to turn=
 on.<br>
-- Subject: A start job for unit <a href=3D"mailto:op-wait-power-on@0.servi=
ce">op-wait-power-on@0.service</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://lists.freedesktop.org/mailman/listinfo/syste=
md-devel">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:op-wait-power-on@0.service">op-wa=
it-power-on@0.service</a> has finished with a failure.<br>
--<br>
-- The job identifier is 906 and the job result is failed.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power O=
n).<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.t=
arget">obmc-chassis-poweron@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://lists.freedesktop.org/mailman/listinfo/syste=
md-devel">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.target">ob=
mc-chassis-poweron@0.target</a> has finished with a failure.<br>
--<br>
-- The job identifier is 886 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0 Minim=
um.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-startmin@0.tar=
get">obmc-host-startmin@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://lists.freedesktop.org/mailman/listinfo/syste=
md-devel">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-startmin@0.target">obmc=
-host-startmin@0.target</a> has finished with a failure.<br>
--<br>
-- The job identifier is 752 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-start@0.target=
">obmc-host-start@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://lists.freedesktop.org/mailman/listinfo/syste=
md-devel">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-start@0.target">obmc-ho=
st-start@0.target</a> has finished with a failure.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Nov 28 08:24:09 romulus sy=
stemd[1]:
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a>: J=
ob <a href=3D"mailto:obmc-host-start@0.target">
obmc-host-start@0.target</a>/start failed with result 'dependency'.<br>
Nov 28 08:24:09 romulus systemd[1]: <a href=3D"mailto:obmc-host-start@0.tar=
get">obmc-host-start@0.target</a>: Triggering OnFailure=3D dependencies.<br=
>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target">
obmc-host-startmin@0.target</a>: Job <a href=3D"mailto:obmc-host-startmin@0=
.target">
obmc-host-startmin@0.target</a>/start failed with result 'dependency'.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target">
obmc-host-startmin@0.target</a>: Triggering OnFailure=3D dependencies.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target">
obmc-chassis-poweron@0.target</a>: Job <a href=3D"mailto:obmc-chassis-power=
on@0.target">
obmc-chassis-poweron@0.target</a>/start failed with result 'dependency'.<br=
>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target">
obmc-chassis-poweron@0.target</a>: Triggering OnFailure=3D dependencies.<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">......<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">I alse do the following ac=
tion:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#528135">systemctl start
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a> </=
span></b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">And alse get the similar f=
ail result.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">I don't how to debug this =
isuue.Could you give me some suggestions?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Best Regards<o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Felixzhang<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:bl=
ack"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<p><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0HK0PR03MB4660apcp_--
