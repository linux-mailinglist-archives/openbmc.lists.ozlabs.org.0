Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5312AB13
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 09:53:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k3fC1mKyzDqF5
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 19:53:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.79; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="egHGUxFI"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320079.outbound.protection.outlook.com [40.107.132.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k3dV5srXzDq5t
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 19:53:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OETXd+/NsQNEpFCgs3qOaNs9zMIfsBLAlSCqAqcDECNTpH8pqruQpPJp+wiPs6hfTQ5HkbBV0+xBJ+OukLGt0B+AJimHKSn8lds8FNiKpLDus+SIQULN7XmlON2zi555eKJVBgLdQe5tB1Y97lw+5AOGLEeoeLFNnfFSlkUHMZu0AT5ohPDHLTrb+8M/75t88m5KDwCHLQeQMS9glsdrsu0qDuiTZPixIqwZvVsGebSTlmZFPSOzlBf3Am7EZHeRSDIkUoeuMNNNrLMOlrAMm8l01+9k6hcfuH4A5Jk37YFdSt3xnSqI/oekMb5OzJ6IaCXQaQxQ96+bN4m0QdvR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn7w3sGT6a2kpubRFoe7nTCI4J7rPv/7uLgDlajl+/o=;
 b=Xr2/xrmaXWATPRGNsSczm0M2iR0msJ8GfLRx6/qZxPRg9zRtZCLsujpgteFwDQ43OigUGEMlmV7DISF/Y9dB290Gj69cXCuJPBYBVUZgamtq5X1GkQCJD39EgNw2Gk+aB2kD7UZR5V57Flu75jme08JdXEbaaVwTCaC5dde5FixL85ZpnG0nmy143PL5CJDCflQtamwKFtEJeK0OBCf4XUTbF154785fqQQgSEY+8mzSygP+AjOJD+RLW1SqEqBKal6K3ncmN7NNl27mYteK13Uyd9QCybfyoDt/tzBHxfSEWOxsM/FfIuuaiO537Zl/KjTyfvz3jRzDzr9DNjnL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn7w3sGT6a2kpubRFoe7nTCI4J7rPv/7uLgDlajl+/o=;
 b=egHGUxFIXItIuHhqZH2TW8W3FmsHjb7lCFJv9YYqjc6GZnJTWfH5WdrA3Atk8H71I1u+thb0+T/h+Yta4/OEakk1YN6E27pgfwIjNPo9v6RJ45WOFSSVpifhp7BrOEIClrtS4q5dP+ZzfkHWUjr2tmiGhoTOdwbARM+KTwG4jgQ=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB3236.apcprd03.prod.outlook.com (52.133.152.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.8; Thu, 26 Dec 2019 08:53:13 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999%6]) with mapi id 15.20.2581.007; Thu, 26 Dec 2019
 08:53:13 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: zhang_cy1989 <zhang_cy1989@163.com>
Subject: RE: Re:RE: How to change the soft link in target.requires or
 target.wants directory
Thread-Topic: Re:RE: How to change the soft link in target.requires or
 target.wants directory
Thread-Index: AQHVu7ynwiENb//ZOkSaJWXMJLawtafMBu+AgAAA+ACAABBIgIAAAf3A
Date: Thu, 26 Dec 2019 08:53:13 +0000
Message-ID: <HK0PR03MB46602425176EEAD3C1FC3B4DCF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <13ed3524.9c60.16f4110e044.Coremail.zhang_cy1989@163.com>
 <CAARXrtkGz7oDdPHFY5R0kGTpn_c948Q1jXmwSN_hNkbJMnAKyw@mail.gmail.com>
 <HK0PR03MB4660E4622E092E8199B5AFB7CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <3e9ab7cf.bba3.16f415b526a.Coremail.zhang_cy1989@163.com>
In-Reply-To: <3e9ab7cf.bba3.16f415b526a.Coremail.zhang_cy1989@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2f262aa-614d-4373-926e-08d789e10abe
x-ms-traffictypediagnostic: HK0PR03MB3236:|HK0PR03MB3236:
x-microsoft-antispam-prvs: <HK0PR03MB3236BEB70B3815E7EEE85E3ACF2B0@HK0PR03MB3236.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(396003)(346002)(39840400004)(199004)(189003)(13464003)(51444003)(53546011)(66446008)(6916009)(66476007)(66556008)(76116006)(478600001)(186003)(6506007)(54906003)(86362001)(8676002)(4326008)(81156014)(8936002)(2906002)(81166006)(64756008)(26005)(66946007)(5660300002)(52536014)(71200400001)(9686003)(55016002)(33656002)(4001150100001)(316002)(7696005)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3236;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDYn0sUeMZVcsUI/BYvgOYGRktnd+gd5yBoOD4PnBP+Cy/ziEitINHPqZ+iltL+yMEh1kkW9A+zGVLsyQetOiGWFEQGxk+1M3lyrttBteV7iEuosjzSMgTOGxMg3n4GfaVtePFAxrC5uPmuoSElxlrAwL+o5pv0mgQdFhjYheCIxIDRqVmmxXbGxP7PGTPjQ3CHp1U46/oF3QDcZJD0Ldpw7XSQj9sIYYf3qZ0nCIJVR8uN15KfCJ1kVyqGiRHZ+u6LzfaCVlaq6y+nS6c/L5V4mzhea6pvqD6GpiAwapnZkxVKKnCdExQCZUR7LRUMbIZD5Zw4jBdFYnPbbiPZYZoUsl+VEbw0TUyXKVMoaRXRCMMavyT00ptAmJY5i5uVDnOjw8KSMdqKG0C6KzE9EDWUzXXNtoYgqu4WxQd75zgTknyuYuara5evRzzUiVOIJXMpS1b8jEGHuIXFeVy53GS7ASyp9u1nsijW3XaWbO9FkkdaZsOcD1yqhoU+q1ANI/dB2tst8t/I6+84GaHxUE4kR9FfPpe8HvbI6K/XWz4I=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB46602425176EEAD3C1FC3B4DCF2B0HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f262aa-614d-4373-926e-08d789e10abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2019 08:53:13.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gh0InabH5VbHWLERrXJypnIvMQhVoIZkE+TwMtgVVozF9c1I87eKBZ/YMpGPXK5O6sh+oVGnpidliC0OWiRdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3236
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB46602425176EEAD3C1FC3B4DCF2B0HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Felix,

I'm glad to hear your problem was solved partially.
I think that your guess might be right, you should check your power pin ON =
sequences behavior. (High->Sleep xxx ms->Low or opposite)
It's depend on your H/W platform.

systemctl list-dependencies obmc-host-shutdown@0.target
obmc-host-shutdown@0.target (Olderly shutdown)

-> xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service
-> obmc-chassis-poweroff@0.target
     -> mapper-wait@-xyz-openbmc_project-state-chassis0.service
     -> op-power-stop@0.service
     -> op-powered-off@0.service
     -> op-wait-power-off@0.service
     -> obmc-host-stop@0.target
          -> mapper-wait@-org-openbmc-control-chassis0.service

Best regards,
Tim
From: zhang_cy1989 [mailto:zhang_cy1989@163.com]
Sent: Thursday, December 26, 2019 4:38 PM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: Lei YU <mine260309@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re:RE: How to change the soft link in target.requires or target.wa=
nts directory

Dear Tim
   It's exactly what I wanted.
   You are wonderful.

   I remember you.
   You taught me a lot.

   Following your seggestions, I can power on the chassis by ipmitool.
   But there is still a bit prolems:
             When I do the action: ipmitool -I lanplus -H 192.168.0.1 -U ro=
ot -P 0penBmc power on.
             Right after, the chassis  is power up.
             Waiting for about 4 seconds,the chassis is power off again.

  I guess this is because the power up pin keeps active for a long time.
  when power up pin keeping active for 4 seconds,the chassis power will los=
t again.

  I will debug this problem. If you have more suggestions, welcome to teach=
 me.

  And,Could you show me the dependencies of "obmc-host-shutdown@0.target<ma=
ilto:obmc-host-shutdown@0.target>"?
  (power off, still on x86 motherboard and use romulus receipes).

 Looking forward for your reply.

Best Regards
Felix



At 2019-12-26 15:46:13, "CS20 CHLi30" <CHLI30@nuvoton.com<mailto:CHLI30@nuv=
oton.com>> wrote:

>Hi Felix,

>

>If you need to add your .service unit file into .want or .requires folder,=
 you can use systemd to do that in .bb file.

>

>You can refer obmc-op-control-power_git.bb this file for example:

>

>Install to .requires folder:

>RESET_ON_TMPL =3D "op-reset-chassis-running@.service<mailto:op-reset-chass=
is-running@.service>"

>RESET_ON_INSTFMT =3D "op-reset-chassis-running@{0}.service<mailto:op-reset=
-chassis-running@%7b0%7d.service>"

>RESET_ON_FMT =3D "../${RESET_ON_TMPL}:${RESET_TGTFMT}.requires/${RESET_ON_=
INSTFMT}"

>

>Install to .want folder:

># Force the standby target to run the chassis reset check target

>RESET_TMPL_CTRL =3D "obmc-chassis-powerreset@.target<mailto:obmc-chassis-p=
owerreset@.target>"

>SYSD_TGT =3D "multi-user.target"

>RESET_INSTFMT_CTRL =3D "obmc-chassis-powerreset@{0}.target<mailto:obmc-cha=
ssis-powerreset@%7b0%7d.target>"

>RESET_FMT_CTRL =3D "../${RESET_TMPL_CTRL}:${SYSD_TGT}.wants/${RESET_INSTFM=
T_CTRL}"

>SYSTEMD_LINK_${PN} +=3D "${@compose_list_zip(d, 'RESET_FMT_CTRL', 'OBMC_CH=
ASSIS_INSTANCES')}"

>

>Sincerely,

>Tim

>-----Original Message-----

>From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.or=
g] On Behalf Of Lei YU

>Sent: Thursday, December 26, 2019 3:37 PM

>To: zhang_cy1989 <zhang_cy1989@163.com<mailto:zhang_cy1989@163.com>>

>Cc: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>

>Subject: Re: How to change the soft link in target.requires or target.want=
s directory

>

>On Thu, Dec 26, 2019 at 3:18 PM zhang_cy1989 <zhang_cy1989@163.com<mailto:=
zhang_cy1989@163.com>> wrote:

>>

>> Dear All

>>    The target.requires or target.wants contains some soft link.

>>    Ex:

>>         /lib/systemd/system/obmc-host-startmin@0.target.requires<mailto:=
/lib/systemd/system/obmc-host-startmin@0.target.requires>

>>                    lrwxrwxrwx    1 root     root            31 Nov 29  2=
019 obmc-chassis-poweron@0.target<mailto:obmc-chassis-poweron@0.target> -> =
../obmc-chassis-poweron@.target<mailto:../obmc-chassis-poweron@.target>

>>                    lrwxrwxrwx    1 root     root            25 Nov 28 09=
:51 op-occ-enable@0.service<mailto:op-occ-enable@0.service> -> ../op-occ-en=
able@.service<mailto:../op-occ-enable@.service>

>>                    lrwxrwxrwx    1 root     root            22 Nov 28 09=
:57 start_host@0.service<mailto:start_host@0.service> -> ../start_host@.ser=
vice<mailto:../start_host@.service>

>>

>>     Now, I want to add or delete soft link:op-occ-enable@0.service

>>     I can use "rm -rf ./op-occ-enable@0.service<mailto:./op-occ-enable@0=
.service>" to achieve the goal.

>>     But,I'm not exactly sure this is formal operation. And I'm afraid th=
is will be side effect.

>>

>>     Are there other tools or formal methods to do this?

>

>These links are expected to be managed by systemd.

>You could disable or mask the services by `systemctl [disable|mask] <servi=
ce>`. If you need them later, just enable or unmask them.

>________________________________

>________________________________

> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.




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

--_000_HK0PR03MB46602425176EEAD3C1FC3B4DCF2B0HK0PR03MB4660apcp_
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
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
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
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";
	mso-fareast-language:ZH-CN;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Hi Felix,<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">I&#8217;m gl=
ad to hear your problem was solved partially.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">I think that=
 your guess might be right, you should check your power pin ON sequences be=
havior. (High-&gt;Sleep xxx ms-&gt;Low or opposite)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">It&#8217;s d=
epend on your H/W platform.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">systemctl li=
st-dependencies obmc-host-shutdown@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">obmc-host-sh=
utdown@0.target (Olderly shutdown)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; xyz.op=
enbmc_project.Ipmi.Internal.SoftPowerOff.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; obmc-c=
hassis-poweroff@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; mapper-wait@-xyz-openbmc_project-state-chassis0.service<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; op-power-stop@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; op-powered-off@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; op-wait-power-off@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; obmc-host-stop@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; mapper-wait@-org-openbmc-c=
ontrol-chassis0.service<o:p></o:p></span></p>
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
zhang_cy1989 [mailto:zhang_cy1989@163.com]
<br>
<b>Sent:</b> Thursday, December 26, 2019 4:38 PM<br>
<b>To:</b> CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;<br>
<b>Cc:</b> Lei YU &lt;mine260309@gmail.com&gt;; openbmc@lists.ozlabs.org<br=
>
<b>Subject:</b> Re:RE: How to change the soft link in target.requires or ta=
rget.wants directory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Dear Tim<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; It's exactly =
what I wanted.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; You are wonde=
rful.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; I remember yo=
u.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; You taught me=
 a lot.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; Following you=
r seggestions, I can power on the chassis by ipmitool.<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; But there is =
still a bit prolems:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When I do the action: ipmito=
ol -I lanplus -H 192.168.0.1 -U root -P 0penBmc power on.<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Right after, the chassis&nbs=
p; is power up.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Waiting for about 4 seconds,=
the chassis is power off again.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; I guess this is bec=
ause the power up pin keeps active for a long time.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; when power up pin k=
eeping active for 4 seconds,the chassis power will lost again.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;
</span><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#DD4032">I will debug this problem. If you hav=
e more suggestions, welcome to teach me.</span></b><span lang=3D"EN-US" sty=
le=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black=
"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#DD4032">&nbsp;</span></b><spa=
n lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sa=
ns-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#DD4032">&nbsp; And,Could you =
show me the dependencies of &quot;<a href=3D"mailto:obmc-host-shutdown@0.ta=
rget">obmc-host-shutdown@0.target</a>&quot;?</span></b><span lang=3D"EN-US"=
 style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:b=
lack"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#DD4032">&nbsp; (power off, st=
ill on x86 motherboard and use romulus receipes).</span></b><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;Looking forward for =
your reply.<o:p></o:p></span></p>
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
family:&quot;Arial&quot;,sans-serif;color:black">Felix<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></=
p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
<pre><span lang=3D"EN-US" style=3D"color:black">At 2019-12-26 15:46:13, &qu=
ot;CS20 CHLi30&quot; &lt;<a href=3D"mailto:CHLI30@nuvoton.com">CHLI30@nuvot=
on.com</a>&gt; wrote:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Hi Felix,<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;If you need to add your=
 .service unit file into .want or .requires folder, you can use systemd to =
do that in .bb file.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;You can refer obmc-op-c=
ontrol-power_git.bb this file for example:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Install to .requires fo=
lder:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_ON_TMPL =3D &quot=
;<a href=3D"mailto:op-reset-chassis-running@.service">op-reset-chassis-runn=
ing@.service</a>&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_ON_INSTFMT =3D &q=
uot;<a href=3D"mailto:op-reset-chassis-running@%7b0%7d.service">op-reset-ch=
assis-running@{0}.service</a>&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_ON_FMT =3D &quot;=
../${RESET_ON_TMPL}:${RESET_TGTFMT}.requires/${RESET_ON_INSTFMT}&quot;<o:p>=
</o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Install to .want folder=
:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;# Force the standby tar=
get to run the chassis reset check target<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_TMPL_CTRL =3D &qu=
ot;<a href=3D"mailto:obmc-chassis-powerreset@.target">obmc-chassis-powerres=
et@.target</a>&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;SYSD_TGT =3D &quot;mult=
i-user.target&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_INSTFMT_CTRL =3D =
&quot;<a href=3D"mailto:obmc-chassis-powerreset@%7b0%7d.target">obmc-chassi=
s-powerreset@{0}.target</a>&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;RESET_FMT_CTRL =3D &quo=
t;../${RESET_TMPL_CTRL}:${SYSD_TGT}.wants/${RESET_INSTFMT_CTRL}&quot;<o:p><=
/o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;SYSTEMD_LINK_${PN} &#43=
;=3D &quot;${@compose_list_zip(d, 'RESET_FMT_CTRL', 'OBMC_CHASSIS_INSTANCES=
')}&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Sincerely,<o:p></o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Tim<o:p></o:p></span></=
pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;-----Original Message--=
---<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;From: openbmc [<a href=
=3D"mailto:openbmc-bounces&#43;chli30=3Dnuvoton.com@lists.ozlabs.org">mailt=
o:openbmc-bounces&#43;chli30=3Dnuvoton.com@lists.ozlabs.org</a>] On Behalf =
Of Lei YU<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Sent: Thursday, Decembe=
r 26, 2019 3:37 PM<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;To: zhang_cy1989 &lt;<a=
 href=3D"mailto:zhang_cy1989@163.com">zhang_cy1989@163.com</a>&gt;<o:p></o:=
p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Cc: <a href=3D"mailto:o=
penbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><o:p></o:p></span></pr=
e>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;Subject: Re: How to cha=
nge the soft link in target.requires or target.wants directory<o:p></o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;On Thu, Dec 26, 2019 at=
 3:18 PM zhang_cy1989 &lt;<a href=3D"mailto:zhang_cy1989@163.com">zhang_cy1=
989@163.com</a>&gt; wrote:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;<o:p>&nbsp;</o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt; Dear All<o:p></o:p=
></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp; =
The target.requires or target.wants contains some soft link.<o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp; =
Ex:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:/lib/systemd/system/obmc-ho=
st-startmin@0.target.requires">/lib/systemd/system/obmc-host-startmin@0.tar=
get.requires</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&=
nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 31 Nov 29&nbsp; 2019 <a href=3D"mailto:obmc-chassis-poweron@0.target">obm=
c-chassis-poweron@0.target</a> -&gt; <a href=3D"mailto:../obmc-chassis-powe=
ron@.target">../obmc-chassis-poweron@.target</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&=
nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 25 Nov 28 09:51 <a href=3D"mailto:op-occ-enable@0.service">op-occ-enable@=
0.service</a> -&gt; <a href=3D"mailto:../op-occ-enable@.service">../op-occ-=
enable@.service</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&=
nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 22 Nov 28 09:57 <a href=3D"mailto:start_host@0.service">start_host@0.serv=
ice</a> -&gt; <a href=3D"mailto:../start_host@.service">../start_host@.serv=
ice</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;<o:p>&nbsp;</o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp; Now, I want to add or delete soft link:op-occ-enable@0.service<o:p></=
o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp; I can use &quot;rm -rf <a href=3D"mailto:./op-occ-enable@0.service">.=
/op-occ-enable@0.service</a>&quot; to achieve the goal.<o:p></o:p></span></=
pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp; But,I'm not exactly sure this is formal operation. And I'm afraid thi=
s will be side effect.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;<o:p>&nbsp;</o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&=
nbsp; Are there other tools or formal methods to do this?<o:p></o:p></span>=
</pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;These links are expecte=
d to be managed by systemd.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;You could disable or ma=
sk the services by `systemctl [disable|mask] &lt;service&gt;`. If you need =
them later, just enable or unmask them.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;_______________________=
_________<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;_______________________=
_________<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt; The privileged confide=
ntial information contained in this email is intended for use only by the a=
ddressees as indicated by the original sender of this email. If you are not=
 the addressee indicated in this email or are not responsible for delivery =
of the email to such a person, please kindly reply to the sender indicating=
 this fact and delete all copies of it from your computer and network serve=
r immediately. Your cooperation is highly appreciated. It is advised that a=
ny unauthorized use of confidential information of Nuvoton is strictly proh=
ibited; and any information in this email irrelevant to the official busine=
ss of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.<o:p=
></o:p></span></pre>
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

--_000_HK0PR03MB46602425176EEAD3C1FC3B4DCF2B0HK0PR03MB4660apcp_--
