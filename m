Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F61C32BC
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 08:26:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FtCX2nhfzDqg8
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 16:26:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.113; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Tch/4xEE; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Tch/4xEE; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310113.outbound.protection.outlook.com [40.107.131.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CQM86X3zzDr69
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 16:24:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slpgbkcofaS+a/j/iBvhKKLU6YP3bvystou5ehrpREw=;
 b=Tch/4xEEZjibbOP/gHo6FUdKYBL+JpniN+2+gDrolouemafGrLlx+7HSJcZnumnZL985DWC/RpX0OGZMKVEkaHU9Sg+4Y5TE+M1T7wFtqxr//b6f0Zx4ij2tVPsCva9jdO0lf81khuWVKn0VzmRZdNPn6CcrsPQit2rNBCM7EVQ=
Received: from SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) by
 HK0PR04MB3236.apcprd04.prod.outlook.com (2603:1096:203:82::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19; Thu, 30 Apr 2020 06:23:58 +0000
Received: from SG2APC01FT028.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::64) by SG2PR06CA0199.outlook.office365.com
 (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 06:23:57 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=KOR01-SL2-obe.outbound.protection.outlook.com;
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (192.8.245.53) by
 SG2APC01FT028.mail.protection.outlook.com (10.152.250.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 06:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0tIDI5CHwvlKf9wIbUxmdmEbEw9mfOVl+bIZAaqAa2H3kXoj7J1qE9P5Wq7vmypPBvgaB3x+/wdF6a//L/ggSGRee49IU+uTa+bdMSl0c192vTpDGxhVGFhTrecmxTZqvvRUjKF79PGKE/paL0xW6MvsCkeYYYjrBnz5hP5WxuWqJZEG3JpdNg+k0ciw9n9CNaY2RP4BtOweFNqtZ06Pdb8JBPfmxbbX98LTa+tzN5TGMDM5F/y7AL6Wiz0HRIUsays4Tz+Bttsn0RRl8yu2XtQ3RRsNRKfXRAfDZlRyzUQnZFr9Hbco8mjYn1W/+jF0Zr0ffvdlRd+95AgE+lFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slpgbkcofaS+a/j/iBvhKKLU6YP3bvystou5ehrpREw=;
 b=IlYrh6feU4BvWyhM6RWMTB0lxtfEYCvMfHCa6RFo3uCWVgn/D+yWNXvsIMpbd7VwC+vpKkpjalevuviWftDNIKpC66gQluJ6BvuixI3HRY6p0MxePd7FFsDQbKD3D9lxIuSGLP9dcaGj8hl708A6FG5r2mOxdkEgF4bpEYlreCQQObrCgGKJbn2/lQN/cMXBVflecR10FuaCXLwJ8ajzRZIXxTNE7KSYrrTSZxKpSDa7GFhXvofxCSTYWXYWj1SBhvfTL/upnmxN8Fzx6JfWaSYqGdul6ugLanD3N/SiE59x/7V93p1FaPObZDI2M1uEsmgTZ6oza6NcISOUc5NaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slpgbkcofaS+a/j/iBvhKKLU6YP3bvystou5ehrpREw=;
 b=Tch/4xEEZjibbOP/gHo6FUdKYBL+JpniN+2+gDrolouemafGrLlx+7HSJcZnumnZL985DWC/RpX0OGZMKVEkaHU9Sg+4Y5TE+M1T7wFtqxr//b6f0Zx4ij2tVPsCva9jdO0lf81khuWVKn0VzmRZdNPn6CcrsPQit2rNBCM7EVQ=
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com (2603:1096:300:68::15)
 by PS2PR04MB3783.apcprd04.prod.outlook.com (2603:1096:300:68::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 06:23:53 +0000
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969]) by PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 06:23:53 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: openbmc build issue.
Thread-Topic: openbmc build issue.
Thread-Index: AdYet5iAndvlzzdISBKEoFezUYKK/g==
Date: Thu, 30 Apr 2020 06:23:53 +0000
Message-ID: <PS2PR04MB354432E1908672CE27203758FDAA0@PS2PR04MB3544.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.198.16.122]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 36fa13fd-8def-4622-de5c-08d7eccf102c
x-ms-traffictypediagnostic: PS2PR04MB3783:|PS2PR04MB3783:|HK0PR04MB3236:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK0PR04MB32369BE71F63A0CE1A44B1BFFDAA0@HK0PR04MB3236.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;OLM:5236;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aSHfVtCCKdE2BdRFxfYYP4dKRlLFCdaawkPGodrJ20gMQczWsSMidPIcnLbZy2I5AxuKRhjn9fjUG2xhSTIiiw4CDNTZoa6nujpv54HxqdSrGrup9lpjHv6ydP5KXP9o3WtLTlrjBt8nRbx9hv+YllVoqN12ahIbyjMy9Lne+elkDI2joagyX719Ak151pdgWhWjxjKXOUzg1i58Vik9MxPEBrXI8uS9Q5l11Z4xKvqMjNPysZ4MjreIYrT7kAVSYeigP6GTnlbb3g6f/PMxG30my3MNEEkUu1qNG++s9sG7Q94qVHPDZnn75/X56Igcx77DLi4dpyBbOVBWFytnBCl337kc+2Ir9Gkrv4ejrpMsDyMa7lEeETw8iQIFDuXrqhSVktqIeNZ2tS+/zD7dLQ48+0IBfNxnnP1PnhD33cTZP+ru20SpWCaS/1ym4Rg5
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PS2PR04MB3544.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(26005)(2906002)(33656002)(316002)(7696005)(186003)(86362001)(3480700007)(478600001)(6506007)(71200400001)(5660300002)(6916009)(99936003)(9686003)(9326002)(7116003)(52536014)(8936002)(8676002)(66476007)(4326008)(66616009)(66946007)(66446008)(55016002)(76116006)(66556008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: be3bzRwwlPi2ctB+4lp6KxJXKHUyKVidO955HBGt+lMM99gyP8mr3XTI4GXTcbSdQSHmoxRn4cwLuPOcJDS3+MB7/bDMsYH9ESc0pdzdhgq+JQgPVWqUZJLBFtPOOZuQBu+y4yVEq4l40OK8NDhwXjtKyYTjoVuz9aBzZHTF2viB2J5HVqt5LIKrEAN/C66v4lALg8VoLlEOmz5WdHkKNelNEFsCZFgaM5ZtTVUEur9EL6hRIgMH4yjlFElSxCUSjra9rAJSmE6XxgqAln2atUHdFrSZdKB+ia+K6XF4HPklWhx/7EyLuaWn2Y33VB1C9CYI74E8GaB+zLpepp22PcDpqO8LUFpC+fK5f2UcVBCWPuGKCFGSXIYFf9P9RuUJUgUXQZYn/EXcx2QSYB6oGTvwcUTgZNdYVqVayxoBvbQfYvwafjZp9w4JQfI+iuBJylcPvUQe0hfRnO36pt3YKKMTyiWrzQFpidrxkK1hvIViyNHnpDT/r6Yjp6QW4UUpPIUevWsIFalArXUg2RxkCDmIuBJ47wG76qAnuksJa/xmS/YYp22z9ZJ5W13BB5BD7aq/QIcRrijtBEpi/CexNDIRIn+BIiHdCx7FUYNAG9Gh8TDdoV+xbWJ2b2ll2WU2TJ9soIl86DRYU5sMy/ZMiPoUhbN20MiJno/WNJH2Pi2VrvCPHeQ4dcIGS/7Wa1vZsyY4W65337Xa0L6zzBDPw8GJsbk+vWpubSNTwbyia3riGTgxEfClY/9cXx68D70rrrPbPHdn0csxPqVZjZuJEjAcf1iQwcY5ZvsfzO4yjiA=
Content-Type: multipart/mixed;
 boundary="_004_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3783
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT028.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-SL2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(52536014)(7116003)(6916009)(99936003)(82740400003)(47076004)(9686003)(336012)(9326002)(8936002)(4326008)(356005)(55016002)(66616009)(70586007)(82310400002)(70206006)(8676002)(81166007)(316002)(36906005)(26005)(2906002)(33656002)(6506007)(235185007)(21480400003)(5660300002)(7696005)(186003)(3480700007)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 090bd410-9ed5-4529-bbfa-08d7eccf0e49
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNg+lCAJ84xUTRtFrc5BN0awC8WCjHEaQnLckEVO4kEWIauYLqZNggUYrvyGq0ofBTnLq89q5RrsQJUDPY0Ou4Zbaev13KTq54/6UwCZaLlaZhbd6FiQWEW5Dbe5lNJhJXa3L0FNPiDqpMCr1KAj/O4nLfZA4IuDt4xXPjeZ2dMBqu8bNhcPoVDjcI82zaZMxvwAtzZxvvLJagRGUObZcsuC//13NKG/LOLYEbWFalyF/RMxoKqY1WqpTERddyBKtlPCQl1wLOCW4g8MuZN9AjLOzHqObBAakVitCYdlAwv1nAngJGL+/yAfLshb1aUyzSptQ/oskpmSeml6zZ/mFO0XwM8jvXR9a/0hx8lM38QX4XV/L8Tj8i+bzWYGPKBf5DDI+MzFHVuA52dRvi3hHfHl5Aj0snmRq8mEeVUpYlldiCVKfBHhd3VY9up4q4sMWze4w+5f/W1aVfI9sZzYf7s/bBHwXM4cBponyriJ+oy1sCKjmbXaO3+wGYIhkD/gcm0QUApDAzYwoqRxnOpbxA==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 06:23:56.4488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fa13fd-8def-4622-de5c-08d7eccf102c
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[KOR01-SL2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3236
X-Mailman-Approved-At: Mon, 04 May 2020 16:23:53 +1000
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_
Content-Type: multipart/alternative;
	boundary="_000_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_"

--_000_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

YV2 Build failing in latest LF openbmc master. PFB the reason and the detai=
led log file. Please let me know if there are suggestions to resolve.
ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image '/home/velu/bui=
ldtest/openbmc/build/tmp/work/yosemitev2-openbmc-linux-gnueabi/obmc-phospho=
r-image/1.0-r0/deploy-obmc-phosphor-image-image-complete/obmc-phosphor-imag=
e-yosemitev2.squashfs-xz' is too large!

Please fine the attachment.

Thanks,
Kumar.
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_
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
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"background:white">YV2 Build failing in late=
st LF openbmc master. PFB the reason and the detailed log file. Please let =
me know if there are suggestions to resolve.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"background:white">ERROR: obmc-phosphor-imag=
e-1.0-r0 do_generate_static: Image '/home/velu/buildtest/openbmc/build/tmp/=
work/yosemitev2-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/deploy-obm=
c-phosphor-image-image-complete/obmc-phosphor-image-yosemitev2.squashfs-xz'
 is too large!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please fine the attachment. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_--

--_004_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_
Content-Type: text/plain; name="yv2_image_size_too_large.txt"
Content-Description: yv2_image_size_too_large.txt
Content-Disposition: attachment; filename="yv2_image_size_too_large.txt";
	size=8607; creation-date="Thu, 30 Apr 2020 06:21:54 GMT";
	modification-date="Thu, 30 Apr 2020 06:21:57 GMT"
Content-Transfer-Encoding: base64

DQoNCkluaXRpYWxpc2luZyB0YXNrczogMTAwJSB8IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGltZTogMDowMDowNA0KU3N0YXRlIHN1bW1hcnk6IFdh
bnRlZCAyOTQgRm91bmQgMCBNaXNzZWQgMjk0IEN1cnJlbnQgMTEyOSAoMCUgbWF0Y2gsIDc5JSBj
b21wbGV0ZSkNCk5PVEU6IEV4ZWN1dGluZyBUYXNrcw0KTk9URTogU2V0c2NlbmUgdGFza3MgY29t
cGxldGVkDQpFUlJPUjogb2JtYy1waG9zcGhvci1pbWFnZS0xLjAtcjAgZG9fZ2VuZXJhdGVfc3Rh
dGljOiBJbWFnZSAnL2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJtYy9idWlsZC90bXAvd29yay95
b3NlbWl0ZXYyLW9wZW5ibWMtbGludXgtZ251ZWFiaS9vYm1jLXBob3NwaG9yLWltYWdlLzEuMC1y
MC9kZXBsb3ktb2JtYy1waG9zcGhvci1pbWFnZS1pbWFnZS1jb21wbGV0ZS9vYm1jLXBob3NwaG9y
LWltYWdlLXlvc2VtaXRldjIuc3F1YXNoZnMteHonIGlzIHRvbyBsYXJnZSENCg0KDQpERUJVRzog
RXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QNCk5PVEU6IERp
cmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsndmlydHVhbDpuYXRpdmU6L2hvbWUvdmVsdS9idWlsZHRl
c3Qvb3BlbmJtYy9tZXRhL3JlY2lwZXMta2VybmVsL2R0Yy9kdGNfMS41LjEuYmI6ZG9fcG9wdWxh
dGVfc3lzcm9vdCcsICcvaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1r
ZXJuZWwva2Vybi10b29scy9rZXJuLXRvb2xzLW5hdGl2ZV9naXQuYmI6ZG9fcG9wdWxhdGVfc3lz
cm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290
JywgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21r
bGlicy9ta2xpYnMtbmF0aXZlXzAuMS40NC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21l
L3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvbGRjb25maWct
bmF0aXZlXzIuMTIuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9o
b21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9ycG1f
NC4xNC4yLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS92ZWx1L2J1aWxkdGVzdC9v
cGVuYm1jL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2Nyb3NzLWxvY2FsZWRlZi1uYXRpdmVfMi4z
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3ZlbHUvYnVp
bGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVy
ZXBvLWNfMC4xNS4xLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvdmVsdS9idWlsZHRl
c3Qvb3BlbmJtYy9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1jcm9zc185LjIuYmI6ZG9f
cG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9v
cGVuYm1jL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18yMDE5LjEwLmJiOmRv
X3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJtYy9tZXRhL3Jl
Y2lwZXMta2VybmVsL2ttb2Qva21vZC1uYXRpdmVfZ2l0LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Qn
LCAndmlydHVhbDpuYXRpdmU6L2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJtYy9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYmlzb24vYmlzb25fMy40LjIuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcv
aG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEtYXNwZWVkL3JlY2lwZXMtYnNwL3UtYm9v
dC91LWJvb3QtYXNwZWVkXzIwMTYuMDcuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFs
Om5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9waWd6L3BpZ3pfMi40LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6
L2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJtYy9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZWRl
dnMvbWFrZWRldnNfMS4wLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2
ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVh
c2hmcy10b29scy9zcXVhc2hmcy10b29sc19naXQuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2
aXJ0dWFsOm5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC94ei94el81LjIuNC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0
aXZlOi9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHpv
cC9sem9wXzEuMDQuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS92ZWx1L2J1aWxkdGVz
dC9vcGVuYm1jL21ldGEvcmVjaXBlcy1jb3JlL29zLXJlbGVhc2Uvb3MtcmVsZWFzZS5iYjpkb19w
b3B1bGF0ZV9zeXNyb290JywgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNp
cGVzLWtlcm5lbC9rbW9kL2RlcG1vZHdyYXBwZXItY3Jvc3NfMS4wLmJiOmRvX3BvcHVsYXRlX3N5
c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJtYy9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvb3BrZy11dGlscy9vcGtnLXV0aWxzXzAuNC4xLmJiOmRvX3BvcHVs
YXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJt
Yy9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHJlbGluay9wcmVsaW5rX2dpdC5iYjpkb19wb3B1bGF0
ZV9zeXNyb290JywgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS1hc3BlZWQvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNwZWVkX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290
JywgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Jp
bnV0aWxzL2JpbnV0aWxzLWNyb3NzXzIuMzIuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0
dWFsOm5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9iYy9iY18xLjA3LjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2
ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtn
L29wa2dfMC40LjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS92ZWx1L2J1aWxkdGVz
dC9vcGVuYm1jL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXV3cmFwcGVyLWNyb3NzXzEu
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3F1aWx0L3F1aWx0LW5hdGl2ZV8wLjY2LmJiOmRvX3BvcHVs
YXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUvdmVsdS9idWlsZHRlc3Qvb3BlbmJt
Yy9tZXRhL3JlY2lwZXMtY29yZS91cGRhdGUtcmMuZC91cGRhdGUtcmMuZF8wLjguYmI6ZG9fcG9w
dWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVu
Ym1jL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYjpkb19wb3B1bGF0
ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yLjIuYmI6ZG9fcG9wdWxhdGVfc3lzcm9v
dCddDQpOT1RFOiB1LWJvb3QtYXNwZWVkIGV4aXN0cyBpbiBzeXNyb290LCBidXQgaXMgc3RhbGUg
KHUtYm9vdC1hc3BlZWQuNGZhYjMxNDc2MDQ3NGUzZGQ3MWNhNTJlNmI2M2U0NTBhZDA5MTRhN2Zh
ZGM5OGIzNmFjNGNiNmVjODBhNjBmYSB2cy4gdS1ib290LWFzcGVlZC5iODlkNGIyMmJkZjUwY2Q0
ZGRjNmJiM2I4ZjQ2MjExMWMzMDc4ZGQwOTBjYTU2MDU4YTM5MzNkMzQ3MDk0MGJlKSwgcmVtb3Zp
bmcuDQpERUJVRzogUmVtb3ZpbmcgbWFuaWZlc3Q6IC9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5i
bWMvYnVpbGQvdG1wL3dvcmsveW9zZW1pdGV2Mi1vcGVuYm1jLWxpbnV4LWdudWVhYmkvb2JtYy1w
aG9zcGhvci1pbWFnZS8xLjAtcjAvcmVjaXBlLXN5c3Jvb3Qvc3lzcm9vdC1wcm92aWRlcnMvdS1i
b290DQpERUJVRzogUmVtb3ZpbmcgbWFuaWZlc3Q6IC9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5i
bWMvYnVpbGQvdG1wL3dvcmsveW9zZW1pdGV2Mi1vcGVuYm1jLWxpbnV4LWdudWVhYmkvb2JtYy1w
aG9zcGhvci1pbWFnZS8xLjAtcjAvcmVjaXBlLXN5c3Jvb3Qvc3lzcm9vdC1wcm92aWRlcnMvdS1i
b290LWFzcGVlZA0KREVCVUc6IFJlbW92aW5nIG1hbmlmZXN0OiAvaG9tZS92ZWx1L2J1aWxkdGVz
dC9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL3lvc2VtaXRldjItb3BlbmJtYy1saW51eC1nbnVlYWJp
L29ibWMtcGhvc3Bob3ItaW1hZ2UvMS4wLXIwL3JlY2lwZS1zeXNyb290L3N5c3Jvb3QtcHJvdmlk
ZXJzL3ZpcnR1YWxfYm9vdGxvYWRlcg0KREVCVUc6IFJlbW92aW5nIG1hbmlmZXN0OiAvaG9tZS92
ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL3lvc2VtaXRldjItb3BlbmJtYy1s
aW51eC1nbnVlYWJpL29ibWMtcGhvc3Bob3ItaW1hZ2UvMS4wLXIwL3JlY2lwZS1zeXNyb290L3N5
c3Jvb3QtcHJvdmlkZXJzLw0KTk9URTogSW5zdGFsbGVkIGludG8gc3lzcm9vdDogWyd1LWJvb3Qt
YXNwZWVkJ10NCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFsn
ZHRjLW5hdGl2ZScsICdrZXJuLXRvb2xzLW5hdGl2ZScsICdwc2V1ZG8tbmF0aXZlJywgJ21rbGli
cy1uYXRpdmUnLCAnbGRjb25maWctbmF0aXZlJywgJ3JwbS1uYXRpdmUnLCAnY3Jvc3MtbG9jYWxl
ZGVmLW5hdGl2ZScsICdjcmVhdGVyZXBvLWMtbmF0aXZlJywgJ2djYy1jcm9zcy1hcm0nLCAndS1i
b290LXRvb2xzLW5hdGl2ZScsICdrbW9kLW5hdGl2ZScsICdiaXNvbi1uYXRpdmUnLCAncGlnei1u
YXRpdmUnLCAnbWFrZWRldnMtbmF0aXZlJywgJ3NxdWFzaGZzLXRvb2xzLW5hdGl2ZScsICd4ei1u
YXRpdmUnLCAnbHpvcC1uYXRpdmUnLCAnb3MtcmVsZWFzZScsICdkZXBtb2R3cmFwcGVyLWNyb3Nz
JywgJ29wa2ctdXRpbHMtbmF0aXZlJywgJ3ByZWxpbmstbmF0aXZlJywgJ2xpbnV4LWFzcGVlZCcs
ICdiaW51dGlscy1jcm9zcy1hcm0nLCAnYmMtbmF0aXZlJywgJ29wa2ctbmF0aXZlJywgJ3FlbXV3
cmFwcGVyLWNyb3NzJywgJ3F1aWx0LW5hdGl2ZScsICd1cGRhdGUtcmMuZC1uYXRpdmUnLCAnbXRk
LXV0aWxzLW5hdGl2ZScsICdkbmYtbmF0aXZlJywgJ3N5c3RlbWQtc3lzdGVtY3RsLW5hdGl2ZScs
ICdkZWJpYW51dGlscy1uYXRpdmUnLCAnb3BlbnNzbC1uYXRpdmUnLCAncWVtdS1uYXRpdmUnLCAn
YXV0b2NvbmYtbmF0aXZlJywgJ2F1dG9tYWtlLW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdn
bnUtY29uZmlnLW5hdGl2ZScsICdnZXR0ZXh0LW1pbmltYWwtbmF0aXZlJywgJ3NoYWRvdy1uYXRp
dmUnLCAnZWxmdXRpbHMtbmF0aXZlJywgJ2RidXMtbmF0aXZlJywgJ2RiLW5hdGl2ZScsICdiemlw
Mi1uYXRpdmUnLCAncHl0aG9uMy1uYXRpdmUnLCAnZmlsZS1uYXRpdmUnLCAncG9wdC1uYXRpdmUn
LCAncGVybC1uYXRpdmUnLCAnbGliYXJjaGl2ZS1uYXRpdmUnLCAnbnNzLW5hdGl2ZScsICdwa2dj
b25maWctbmF0aXZlJywgJ2NwaW8tbmF0aXZlJywgJ3psaWItbmF0aXZlJywgJ2ZsZXgtbmF0aXZl
JywgJ21wZnItbmF0aXZlJywgJ2xpbnV4LWxpYmMtaGVhZGVycycsICd0ZXhpbmZvLWR1bW15LW5h
dGl2ZScsICdsaWJtcGMtbmF0aXZlJywgJ2dtcC1uYXRpdmUnLCAnZ3RrLWRvYy1uYXRpdmUnLCAn
Z2xpYmMnLCAnZ2NjLXJ1bnRpbWUnLCAncHl0aG9uMy1pbmlwYXJzZS1uYXRpdmUnLCAnbmluamEt
bmF0aXZlJywgJ2NtYWtlLW5hdGl2ZScsICdsaWJkbmYtbmF0aXZlJywgJ2xpYnJlcG8tbmF0aXZl
JywgJ2xpYmNvbXBzLW5hdGl2ZScsICdjdXJsLW5hdGl2ZScsICdnbGliLTIuMC1uYXRpdmUnLCAn
bGlieG1sMi1uYXRpdmUnLCAnc3FsaXRlMy1uYXRpdmUnLCAnZXhwYXQtbmF0aXZlJywgJ2F0dHIt
bmF0aXZlJywgJ2x6NC1uYXRpdmUnLCAnbHpvLW5hdGl2ZScsICdiaW51dGlscy1uYXRpdmUnLCAn
cmVhZGxpbmUtbmF0aXZlJywgJ2xpYnNvbHYtbmF0aXZlJywgJ3V0aWwtbGludXgtbmF0aXZlJywg
J2UyZnNwcm9ncy1uYXRpdmUnLCAnYWNsLW5hdGl2ZScsICdtNC1uYXRpdmUnLCAnbGlibnNsMi1u
YXRpdmUnLCAnZ2RibS1uYXRpdmUnLCAnbGlidGlycGMtbmF0aXZlJywgJ2xpYmZmaS1uYXRpdmUn
LCAnbnNwci1uYXRpdmUnLCAnbGliZ2NjJywgJ3B5dGhvbjMtc2l4LW5hdGl2ZScsICdyZTJjLW5h
dGl2ZScsICduY3Vyc2VzLW5hdGl2ZScsICdqc29uLWMtbmF0aXZlJywgJ2dvYmplY3QtaW50cm9z
cGVjdGlvbi1uYXRpdmUnLCAnbGliY2hlY2stbmF0aXZlJywgJ2xpYm1vZHVsZW1kLXYxLW5hdGl2
ZScsICdzd2lnLW5hdGl2ZScsICdncGdtZS1uYXRpdmUnLCAnZ2V0dGV4dC1uYXRpdmUnLCAnbWVz
b24tbmF0aXZlJywgJ2xpYnBjcmUtbmF0aXZlJywgJ2xpYmNhcC1uZy1uYXRpdmUnLCAncHl0aG9u
My1zZXR1cHRvb2xzLW5hdGl2ZScsICdsaWJ5YW1sLW5hdGl2ZScsICdsaWJncGctZXJyb3ItbmF0
aXZlJywgJ2xpYmFzc3Vhbi1uYXRpdmUnLCAndW56aXAtbmF0aXZlJ10NCkRFQlVHOiBQeXRob24g
ZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkDQpERUJVRzogRXhlY3V0aW5n
IHB5dGhvbiBmdW5jdGlvbiBkb19nZW5lcmF0ZV9zdGF0aWMNCkRFQlVHOiBFeGVjdXRpbmcgc2hl
bGwgZnVuY3Rpb24gZG9fbWtfc3RhdGljX25vcl9pbWFnZQ0KMzI3NjgrMCByZWNvcmRzIGluDQoz
Mjc2OCswIHJlY29yZHMgb3V0DQozMzU1NDQzMiBieXRlcyAoMzQgTUIsIDMyIE1pQikgY29waWVk
LCAwLjA1NTg1MDcgcywgNjAxIE1CL3MNCkRFQlVHOiBTaGVsbCBmdW5jdGlvbiBkb19ta19zdGF0
aWNfbm9yX2ltYWdlIGZpbmlzaGVkDQpERUJVRzogQ29uc2lkZXJpbmcgZmlsZSBzaXplPTIzNjI4
MCBuYW1lPS9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMvYnVpbGQvdG1wL2RlcGxveS9pbWFn
ZXMveW9zZW1pdGV2Mi91LWJvb3QuYmluDQpERUJVRzogU3Bhbm5pbmcgc3RhcnQ9MEsgZW5kPTUx
MksNCkRFQlVHOiBDb21wYXJlIG5lZWRlZD0yMzYyODAgYXZhaWxhYmxlPTUyNDI4OCBtYXJnaW49
Mjg4MDA4DQoyMzArMSByZWNvcmRzIGluDQoyMzArMSByZWNvcmRzIG91dA0KMjM2MjgwIGJ5dGVz
ICgyMzYga0IsIDIzMSBLaUIpIGNvcGllZCwgMC4wMzM2OTU4IHMsIDcuMCBNQi9zDQpERUJVRzog
Q29uc2lkZXJpbmcgZmlsZSBzaXplPTM5NDEyNTYgbmFtZT0vaG9tZS92ZWx1L2J1aWxkdGVzdC9v
cGVuYm1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL3lvc2VtaXRldjIvZml0SW1hZ2Utb2JtYy1w
aG9zcGhvci1pbml0cmFtZnMteW9zZW1pdGV2Mi15b3NlbWl0ZXYyDQpERUJVRzogU3Bhbm5pbmcg
c3RhcnQ9NTEySyBlbmQ9NDg2NEsNCkRFQlVHOiBDb21wYXJlIG5lZWRlZD0zOTQxMjU2IGF2YWls
YWJsZT00NDU2NDQ4IG1hcmdpbj01MTUxOTINCjM4NDgrMSByZWNvcmRzIGluDQozODQ4KzEgcmVj
b3JkcyBvdXQNCjM5NDEyNTYgYnl0ZXMgKDMuOSBNQiwgMy44IE1pQikgY29waWVkLCAwLjAyNTM4
NjQgcywgMTU1IE1CL3MNCkRFQlVHOiBDb25zaWRlcmluZyBmaWxlIHNpemU9MjY5ODQ0NDggbmFt
ZT0vaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL3lvc2VtaXRldjIt
b3BlbmJtYy1saW51eC1nbnVlYWJpL29ibWMtcGhvc3Bob3ItaW1hZ2UvMS4wLXIwL2RlcGxveS1v
Ym1jLXBob3NwaG9yLWltYWdlLWltYWdlLWNvbXBsZXRlL29ibWMtcGhvc3Bob3ItaW1hZ2UteW9z
ZW1pdGV2Mi5zcXVhc2hmcy14eg0KREVCVUc6IFNwYW5uaW5nIHN0YXJ0PTQ4NjRLIGVuZD0yODY3
MksNCkRFQlVHOiBDb21wYXJlIG5lZWRlZD0yNjk4NDQ0OCBhdmFpbGFibGU9MjQzNzkzOTIgbWFy
Z2luPS0yNjA1MDU2DQpFUlJPUjogSW1hZ2UgJy9ob21lL3ZlbHUvYnVpbGR0ZXN0L29wZW5ibWMv
YnVpbGQvdG1wL3dvcmsveW9zZW1pdGV2Mi1vcGVuYm1jLWxpbnV4LWdudWVhYmkvb2JtYy1waG9z
cGhvci1pbWFnZS8xLjAtcjAvZGVwbG95LW9ibWMtcGhvc3Bob3ItaW1hZ2UtaW1hZ2UtY29tcGxl
dGUvb2JtYy1waG9zcGhvci1pbWFnZS15b3NlbWl0ZXYyLnNxdWFzaGZzLXh6JyBpcyB0b28gbGFy
Z2UhDQpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX2dlbmVyYXRlX3N0YXRpYyBmaW5pc2hlZA0K

--_004_PS2PR04MB354432E1908672CE27203758FDAA0PS2PR04MB3544apcp_--
