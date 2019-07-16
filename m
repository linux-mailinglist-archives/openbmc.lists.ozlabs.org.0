Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6C6A0FF
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 05:51:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nmfW67hyzDqVT
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 13:51:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.81; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=yschu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="FGaLCq6o"; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300081.outbound.protection.outlook.com [40.107.130.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nmdn00F4zDqPK
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 13:50:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaEw/U+F+tnR4pC4l/f/aAkFFxxkewtUVKE07q+EF33/vvrb4Qgbwa0wiqzTYIib//eGbRRrrNmuE4omh5qJKizZgb0zAWRjwjV/G1acNxCgNf+Sr0KA5SxPa3MIzOR9fUil6yXnbdxRwQX6x3uE9JhtTAb+fAass8WsoZ8iWnx0+fj/WOtY40NVdKwtfTD0MPvz2fi0Xb3bfKIYy1vCh8W+WW+aEg+OLWd6YcUtyOdqaAPpGlVy3F5jtGFO23Eyh9Ndg8Mz+vr/47iBFEO6q9KH7N9Fne2cb8kjU6F6Qea2wMEeviT8AtUE2hoobMcrcn2H3PpUap5uxZO8qLUUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xMmyfVPM+hkCTQyiwuiakiPznSpYOWluXsnJOmTqqM=;
 b=hysqilX/RPWk+cDc97FcDa/dRjYB3DPsmsmdbNuOFGnUVCmS/HUAVyrUO3cBvloBLJvETf+ZWrrMJ+NKfaCRAqZ8Nc86jkYageD61CdWc4jCNeUBRFwLkIyAf4h+83PZyp35cnOjS8vNgXo2CeZyDwPXImVhc8j5XN8HBjQRmztJR7iizIlO7pyj9qHjpksTZbDkr4p/82gjekwk9b5+TWG3ztXYBcqjpVsiUdzgfzXbpveWIhW9fuUcJbTcQFmsuM6xXwFBbimnwDoaR8krBQdhixX1YayzXyb1ha1TpeSWasOfE116zkwsYyc7b9rUZ9UYQmWr3YoEH5RwAwEr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nuvoton.com;dmarc=pass action=none
 header.from=nuvoton.com;dkim=pass header.d=nuvoton.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector1-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xMmyfVPM+hkCTQyiwuiakiPznSpYOWluXsnJOmTqqM=;
 b=FGaLCq6opu1Glw0elIraE6m3g3Mux2Jd8HCQWeLCyayZM4M6HHtiGxQZZxJp3cZbwu//+8HxdsgHey3r7jNLaxxgbUt1HIRz0uWuwoBSDf2POfzZXbLzxvUCb0jS9I2EPg0CzwjdAqW/OHWi02lCGHMqPN5/6VmROPLcR9ju/Dc=
Received: from HK2PR03MB4516.apcprd03.prod.outlook.com (10.170.159.14) by
 HK2PR03MB4545.apcprd03.prod.outlook.com (10.170.156.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.9; Tue, 16 Jul 2019 03:50:45 +0000
Received: from HK2PR03MB4516.apcprd03.prod.outlook.com
 ([fe80::39c3:82c8:b8c6:817b]) by HK2PR03MB4516.apcprd03.prod.outlook.com
 ([fe80::39c3:82c8:b8c6:817b%3]) with mapi id 15.20.2094.009; Tue, 16 Jul 2019
 03:50:45 +0000
From: CS20 YSChu <YSCHU@nuvoton.com>
To: vishwa <vishwa@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: bmc_booted LED group was not asserted when BMC started up
Thread-Topic: bmc_booted LED group was not asserted when BMC started up
Thread-Index: AdU65rNjoTCLcPEvQ7uDpwnoJTJjBwAC6/sAACQMsxA=
Date: Tue, 16 Jul 2019 03:50:45 +0000
Message-ID: <HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0@HK2PR03MB4516.apcprd03.prod.outlook.com>
References: <HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com>
 <dfd399c9-757c-de7d-f61d-4ec844b9b0b6@linux.vnet.ibm.com>
In-Reply-To: <dfd399c9-757c-de7d-f61d-4ec844b9b0b6@linux.vnet.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=YSCHU@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9289a3df-d238-4c6e-f0e3-08d709a0c80e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK2PR03MB4545; 
x-ms-traffictypediagnostic: HK2PR03MB4545:|HK2PR03MB4545:
x-microsoft-antispam-prvs: <HK2PR03MB4545175E01F931E14EC87C32B6CE0@HK2PR03MB4545.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(346002)(136003)(376002)(366004)(199004)(189003)(81156014)(8936002)(81166006)(52536014)(2906002)(25786009)(99286004)(86362001)(7736002)(68736007)(5660300002)(80792005)(66556008)(66446008)(8676002)(64756008)(66946007)(88996005)(66476007)(316002)(71200400001)(74316002)(229853002)(6506007)(66066001)(76176011)(53546011)(26005)(3846002)(53936002)(6116002)(186003)(790700001)(71190400001)(7696005)(6246003)(102836004)(476003)(2501003)(9686003)(478600001)(446003)(486006)(110136005)(54896002)(236005)(14454004)(256004)(6436002)(33656002)(6306002)(55016002)(14444005)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK2PR03MB4545;
 H:HK2PR03MB4516.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s8yd87Xn+xHnVMvGFNR+7rxeDydmvvXtauwV/kq5FoPbb1GXn5i02SrjS05XXsjPfdBlzR/dQkOKTzJq1W15RXBQCRXv9VIIGiy6h2gsJFFHXXCG6lujdISA+2LxDJoO0Pc5hs/+5ZzioZUmI/jeHIcQPp6ZhX/mKr8eJE2XzwtGO/gEkJkHfa8P32GMeJw9iaa+8Qz+2bbx217AIu5JvtCc9oV8O4/SVe+vmSK/6ywdS2al6BziQma8CkSaglJwca1ABzjTaqUYt0z9NJBqyQ1hX5hXrtb60GkIpidDVA/MknhSq16dSoaamy1wUkVR49rgLhb/XQk6JLuswLGwgbaa/Zspte7bg0AXZJlHAPL1QqYAg6fX3kTOc0Dekmvm5LypDGV7z6yj/3ABTVsYngaSb+cv0c0lm74NdoN+DZM=
Content-Type: multipart/alternative;
 boundary="_000_HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0HK2PR03MB4516apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9289a3df-d238-4c6e-f0e3-08d709a0c80e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:50:45.1314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSCHU@nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4545
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

--_000_HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0HK2PR03MB4516apcp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi Vishwa,


-- The o/p of "systemctl status obmc-led-group-start@bmc_booted.service<mai=
lto:obmc-led-group-start@bmc_booted.service>"

obmc-led-group-start@bmc_booted.service - Assert bmc_booted LED
   Loaded: loaded (/lib/systemd/system/obmc-led-group-start@.service; stati=
c; vendor preset: enabled)
  Drop-In: /lib/systemd/system/obmc-led-group-start@bmc_booted.service.d
           =84=80bmc_booted.conf
   Active: inactive (dead)
Warning: The unit file, source configuration file or drop-ins of obmc-led-g=
roup-start@bmc_booted.service changed on disk. Run 'systemctl daemon-reload=
' to reload units.

-- Properties of /xyz/openbmc_project/led/groups/bmc_booted
   array [
      dict entry(
         string "Asserted"
         variant             boolean false
      )
   ]


-- properties of xyz/openbmc_project/led/physical/heartbeat ?
   array [
      dict entry(
         string "State"
         variant             string "xyz.openbmc_project.Led.Physical.Actio=
n.Off"
      )
      dict entry(
         string "DutyOn"
         variant             byte 50
      )
      dict entry(
         string "Color"
         variant             string "xyz.openbmc_project.Led.Physical.Palet=
te.Unknown"
      )
      dict entry(
         string "Period"
         variant             uint16 1000
      )
   ]

Thanks.
Stanley

From: vishwa [mailto:vishwa@linux.vnet.ibm.com]
Sent: Monday, July 15, 2019 5:48 PM
To: CS20 YSChu; openbmc@lists.ozlabs.org
Subject: Re: bmc_booted LED group was not asserted when BMC started up


Hi Stanley,

Could you tell:

-- The o/p of "systemctl status obmc-led-group-start@bmc_booted.service<mai=
lto:obmc-led-group-start@bmc_booted.service>"

-- Properties of /xyz/openbmc_project/led/groups/bmc_booted

-- properties of xyz/openbmc_project/led/physical/heartbeat ?

!! Vishwa !!
On 7/15/19 1:57 PM, CS20 YSChu wrote:
Hi,

In normal case, we will see bmc_booted LED group been asserted when bmc sta=
rts up.

Apr 08 04:56:30 evb-npcm750 systemd[1]: Starting Wait for /xyz/openbmc_proj=
ect/led/groups/bmc_booted...
Apr 08 04:56:31 evb-npcm750 systemd[1]: Started Wait for /xyz/openbmc_proje=
ct/led/groups/bmc_booted.
Apr 08 04:56:35 evb-npcm750 systemd[1]: Starting Assert bmc_booted LED...
Apr 08 04:56:35 evb-npcm750 systemd[1]: Started Assert bmc_booted LED.

Recently, I update to newer commit (don't know what exact commit cause this=
), the wanted service was started but bmc-led-group-start service itself wa=
s not started. As a result, bmc heartbeat led was not blinked.
Can anyone please advise how to investigate such kind of issue?

Jul 11 04:54:03 runbmc-nuvoton systemd[1]: Starting Wait for /xyz/openbmc_p=
roject/led/groups/bmc_booted...
Jul 11 04:54:06 runbmc-nuvoton systemd[1]: Started Wait for /xyz/openbmc_pr=
oject/led/groups/bmc_booted.

------
Below is unit file of obmc-led-group-start@bmc_booted.service<mailto:obmc-l=
ed-group-start@bmc_booted.service> in /lib/systemd/system/multi-user.target=
.wants
[Unit]
Description=3DAssert %i LED
Wants=3Dmapper-wait@-xyz-openbmc_project-led-groups-%i.service<mailto:Wants=
=3Dmapper-wait@-xyz-openbmc_project-led-groups-%25i.service>
After=3Dmapper-wait@-xyz-openbmc_project-led-groups-%i.service<mailto:After=
=3Dmapper-wait@-xyz-openbmc_project-led-groups-%25i.service>
Conflicts=3Dobmc-led-group-stop@%i.service<mailto:Conflicts=3Dobmc-led-grou=
p-stop@%25i.service>

[Service]
Type=3Doneshot
RemainAfterExit=3Dyes
Restart=3Dno
ExecStart=3D/bin/sh -c "busctl call `mapper get-service /xyz/openbmc_projec=
t/led/groups/%i` /xyz/openbmc_project/led/groups/%i org.freedesktop.DBus.Pr=
operties Set ssv xyz.openbmc_project.Led.Group Asserted b true"
SyslogIdentifier=3Dobmc-led-group-start


Thanks.
Stanley

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

--_000_HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0HK2PR03MB4516apcp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";
	color:black;}
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
	font-family:"Calibri","sans-serif";
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Hi Vish=
wa,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p><span lang=3D"EN-US">-- The o/p of &quot;systemctl status <a href=3D"mai=
lto:obmc-led-group-start@bmc_booted.service">
obmc-led-group-start@bmc_booted.service</a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">obmc-le=
d-group-start@bmc_booted.service - Assert bmc_booted LED<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; Loaded: loaded (/lib/systemd/system/obmc-led-group-start@.service; st=
atic; vendor preset: enabled)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp; =
Drop-In: /lib/systemd/system/obmc-led-group-start@bmc_booted.service.d<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=3D=
"font-family:&quot;&#26032;&#32048;&#26126;&#39636;&quot;,&quot;serif&quot;=
;color:#1F497D">=84=80</span><span lang=3D"EN-US" style=3D"color:#1F497D">b=
mc_booted.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; Active: inactive (dead)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Warning=
: The unit file, source configuration file or drop-ins of obmc-led-group-st=
art@bmc_booted.service changed on disk. Run 'systemctl daemon-reload' to re=
load units.<o:p></o:p></span></p>
<p><span lang=3D"EN-US">-- Properties of /xyz/openbmc_project/led/groups/bm=
c_booted<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; array [<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;Asserted&quot;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;boolean false<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; ]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p><span lang=3D"EN-US">-- properties of xyz/openbmc_project/led/physical/h=
eartbeat ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; array [<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;State&quot;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;xyz.openbmc_pro=
ject.Led.Physical.Action.Off&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;DutyOn&quot;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; byte 50<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;Color&quot;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;xyz.openbmc_pro=
ject.Led.Physical.Palette.Unknown&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string &quot;Period&quot;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16 1000<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp; ]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thanks.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Stanley=
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:=
</span></b><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext"> vishwa [mailto:vish=
wa@linux.vnet.ibm.com]
<br>
<b>Sent:</b> Monday, July 15, 2019 5:48 PM<br>
<b>To:</b> CS20 YSChu; openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: bmc_booted LED group was not asserted when BMC started =
up<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p><span lang=3D"EN-US">Hi Stanley,<o:p></o:p></span></p>
<p><span lang=3D"EN-US">Could you tell:<o:p></o:p></span></p>
<p><span lang=3D"EN-US">-- The o/p of &quot;systemctl status <a href=3D"mai=
lto:obmc-led-group-start@bmc_booted.service">
obmc-led-group-start@bmc_booted.service</a>&quot;<o:p></o:p></span></p>
<p><span lang=3D"EN-US">-- Properties of /xyz/openbmc_project/led/groups/bm=
c_booted<o:p></o:p></span></p>
<p><span lang=3D"EN-US">-- properties of xyz/openbmc_project/led/physical/h=
eartbeat ?<o:p></o:p></span></p>
<p><span lang=3D"EN-US">!! Vishwa !!<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 7/15/19 1:57 PM, CS20 YSChu =
wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In normal case, we will see bmc=
_booted LED group been asserted when bmc starts up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:30 evb-npcm750 sys=
temd[1]: Starting Wait for /xyz/openbmc_project/led/groups/bmc_booted...<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:31 evb-npcm750 sys=
temd[1]: Started Wait for /xyz/openbmc_project/led/groups/bmc_booted.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:35 evb-npcm750 sys=
temd[1]: Starting Assert bmc_booted LED...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:35 evb-npcm750 sys=
temd[1]: Started Assert bmc_booted LED.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Recently, I update to newer com=
mit (don&#8217;t know what exact commit cause this), the wanted service was=
 started but bmc-led-group-start service itself was not started. As a resul=
t, bmc heartbeat led was not blinked.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Can anyone please advise how to=
 investigate such kind of issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 11 04:54:03 runbmc-nuvoton =
systemd[1]: Starting Wait for /xyz/openbmc_project/led/groups/bmc_booted...=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 11 04:54:06 runbmc-nuvoton =
systemd[1]: Started Wait for /xyz/openbmc_project/led/groups/bmc_booted.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Below is unit file of <a href=
=3D"mailto:obmc-led-group-start@bmc_booted.service">
obmc-led-group-start@bmc_booted.service</a> in /lib/systemd/system/multi-us=
er.target.wants<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[Unit]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Description=3DAssert %i LED<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"mailto:Wants=3Dmappe=
r-wait@-xyz-openbmc_project-led-groups-%25i.service">Wants=3Dmapper-wait@-x=
yz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"mailto:After=3Dmappe=
r-wait@-xyz-openbmc_project-led-groups-%25i.service">After=3Dmapper-wait@-x=
yz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"mailto:Conflicts=3Do=
bmc-led-group-stop@%25i.service">Conflicts=3Dobmc-led-group-stop@%i.service=
</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[Service]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Type=3Doneshot<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RemainAfterExit=3Dyes<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Restart=3Dno<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ExecStart=3D/bin/sh -c &quot;bu=
sctl call `mapper get-service /xyz/openbmc_project/led/groups/%i` /xyz/open=
bmc_project/led/groups/%i org.freedesktop.DBus.Properties Set ssv xyz.openb=
mc_project.Led.Group Asserted b true&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SyslogIdentifier=3Dobmc-led-gro=
up-start<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Stanley<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US" style=3D"font-family:&quot;Times New Roman&quot;,&quot;seri=
f&quot;">
<hr size=3D"3" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,&quot;sans-serif&quot;;color:gray">The privileged confidential info=
rmation contained in this email is intended for use only by the addressees =
as indicated by the original sender of this email. If you
 are not the addressee indicated in this email or are not responsible for d=
elivery of the email to such a person, please kindly reply to the sender in=
dicating this fact and delete all copies of it from your computer and netwo=
rk server immediately. Your cooperation
 is highly appreciated. It is advised that any unauthorized use of confiden=
tial information of Nuvoton is strictly prohibited; and any information in =
this email irrelevant to the official business of Nuvoton shall be deemed a=
s neither given nor endorsed by
 Nuvoton. </span><span lang=3D"EN-US" style=3D"font-family:&quot;Times New =
Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
</blockquote>
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

--_000_HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0HK2PR03MB4516apcp_--
