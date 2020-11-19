Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A597B2B89DA
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 02:54:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2m113Z4zDqYK
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 12:54:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.59; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=MCqckCza; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320059.outbound.protection.outlook.com [40.107.132.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc2hg5VMqzDqXZ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:51:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4LggynQ8h06E1kDP0o2fOcDdaxdJY5BNgUBMWjKtmHHAHLN0zdvFrfTpQGTkuDwiwGFgObKJyuXN3Sawd4BPwwydfzOL1+C5nMxuppPf/MEuu79fIudn03ReZnj1/eV4VMC1SORLfUVhSBJ9xSme5cd8iLQRsMkkC1qu9DkXWffP/K3ngmWcCKmhg7Yt9HNClwAjy/hcj03Iz9B5Wl+fDX8CFPAhj6qi7fjZ/QI7dntMD/FnrIkz3d0tR/k82oL4Y5hIaM4rAy7PKzMj6zAmKdlevhGWMWIsl7S1a5FKXMcVXuoaQK0MiEqIT+m5APLsKs5xVHZ1HfCG5Dtsniayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0LaYZ4eVmbLgonUWGvRmC7wPOr6uj4VEaeGzWC6uUE=;
 b=Rs/jAKFwBGCVN+rPt9jGUqYkvXehS+Z54edmSc+i/DGzhdyBGlX3AC7Ow388ZOyewGKIAVYqOQffWpBPAksgxc/af8Ji9eaq1REa4OdOBALMZpZfBrSUMAWMzP8x96oCr1xO4JjEX30d+SswYGB9GSsmo0/GIR+0AXZEKBqxhmZ56Bg0RFbC3vi5LE0Udjyje0BU2N0ObVXBmzyZX9YUkAdH2L0LhBatSLc4zSJikJzrSiUdLSCx8oqNsPkZV3oBaOnWGFMWOAXmE4f8GItJu4u4QXGbeo/g30Qai+h7j/WYXH0Fx37zR2m+0/g+nGyq5t0roiUwsOpl231kItlxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0LaYZ4eVmbLgonUWGvRmC7wPOr6uj4VEaeGzWC6uUE=;
 b=MCqckCzaVn/YOeqYa6uD2Xm2abedI5iJVTmyr+FVugGu2MyLv/dhwPjuPXF7uvTlSzPgtuh/zB9aqp44kR2aPLm4ZqzvQo4qbkXZISDNG+ZMrH1U50/ZXQVIwqUV/PZcu4A6iRCwGO4MrD3CAQOmn4NfWW8YYmYYBqPtxePB+F0=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK2PR03MB4260.apcprd03.prod.outlook.com (2603:1096:202:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.16; Thu, 19 Nov
 2020 01:51:05 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::8403:27f:5d08:49dc]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::8403:27f:5d08:49dc%3]) with mapi id 15.20.3611.009; Thu, 19 Nov 2020
 01:51:05 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: "anoo@us.ibm.com" <anoo@us.ibm.com>, "OpenBMC (openbmc@lists.ozlabs.org)"
 <openbmc@lists.ozlabs.org>
Subject: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp Upload
 Image.Install Same Image Two Times
Thread-Topic: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp
 Upload Image.Install Same Image Two Times
Thread-Index: Ada+EccgOITEwJM7T+WVPH6/zFAEOw==
Date: Thu, 19 Nov 2020 01:51:05 +0000
Message-ID: <HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 064fbec3-26ea-4724-bcb5-08d88c2d940b
x-ms-traffictypediagnostic: HK2PR03MB4260:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB4260F86D7B309F092563F8CCCFE00@HK2PR03MB4260.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bdmZiJVYGKjEKTM/9syka0J0WtrcCn2gpTPy9ddusmT60Vh9QZdjX9RLjO3qgSKYGJPK32LzEzkd2gEggxKYXUEbQOeDXsZTlBX5gV180TzYinbxKgxVvdSoEs4EYSS6ZVyPJvtJ5u1UzKS4CA3dFLXH/BEax6pciLY6VTVYPXdr76vqs4v0KgeYMYBZx1guUZA+Mf+SJJGv2Rf3qpc77Vf3b6QkT6EI96qwVzGEtxTZpv/3aKPPFUsJR0JA75F1iTNdB3Qxln2ad3NWnbundZqJbmrQ1QeGuECeripdZX9pVuFAcPVjymSSNM5gpF49p5mZAorTlXd2kvm5cPJi9OKKBqgXIzZVswP/NEBJspop3iEvUzbNs7tMIGYlDOSncYirVXti52F0Puj2otl0og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39850400004)(376002)(346002)(83380400001)(966005)(76116006)(166002)(26005)(8936002)(7696005)(8676002)(66946007)(66446008)(66476007)(15650500001)(66556008)(64756008)(478600001)(2906002)(86362001)(316002)(9686003)(5660300002)(186003)(4326008)(71200400001)(6506007)(52536014)(55016002)(33656002)(110136005)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KoyIIvgdSZFWuVrK/EwSLlxzymFUf8r98RGBvQwQ5HXZGllIibp36qU8uWv3q5gTN5F05Dbt4N02KBtWZmH5YGB97IEn+1D2LKXx8j/gOoDW359oVBw69Xn1gfEK2udIAESBmtoP6RTRHgg44opDNM3bNYacZt5xN/HVp1yLdQto6tCFeU8FWRN+xrMLtov/BhX6iqOLQRR/TGoXcPWKIMrYzm68xk8AXLo4AOGQ26hBu6YK1G76+/rloI0WE1DqQsP5eyZV23QZk+2t0k62ssO8XUZ4T59DXTWC9Kkz6n/Ua1Nbn7tZiqKmUrN9M/a9HZsdZ3De7dGHeOI2A6CoDwo7l2erfr7IyxamJSscPOj5Op7reB3pPZm9s0c+nP1YE6ObhfJrkJYySskqn7sDck0/ttq6VPTMbk5DcGAt8of5rzWi0Vr3Lv8zOVn/eC9ZiTHPxyp+a4mDQ9vIzPDrFX1e9nGKs5yKng1stbkDl5rf0hMKF+/jDz9CDNRRgVeBtTKaMeJPoclqk48IA9SyN8OHYFTAgA39Ju6rFA9k3SZYiWVNv7LPI6P0cQ7Lljxvg8TaCNDRB5JW9TeqfJMwbyEpQw9mE4eoIn5wx3XkmEnQpzyu7TJm3T1OGwJveCpXz5gLBDAbfgMqanqVMlfDrdX/TCSSQdpU1b9CsVZRDdb2G7P0rue03YoAvzTiR+qBIK9jo2+1mj95j1mQefysM59RvPzgixBqeu8UrQHQodFcGGp3uFp01+0FXHb+BfQkqs35KqGua562BSlfDjn1zQQ8QxZdDitfMZigaNN1fnmx+41oqH0YfDQfVr6n2NQwhJVu0tsWuS6gHB22Tw07fdOz7buJEMupiIZCIUn9RWT6HUqsu/XXYCF3Vy3vzc3fpQ1AVnAYTOkg84cjTmdcBA==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064fbec3-26ea-4724-bcb5-08d88c2d940b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 01:51:05.7169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVRjGgvD4blQYHcy7ujyW7x29VTs6hAP+Tmrf6YwQBpuo0tFqTejNhpUuLvXGtjj2KUl9BvMA1CQNZ1FSaZAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4260
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
Cc: CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Recently, we met 1 test item fail "Test Firmware Tftp Upload Image.Install =
Same Image Two Times" in Update Service of OpenBMC Test Automation.
After checking the log, we found that due to phosphor-software-manager merg=
ed this commit
https://github.com/openbmc/phosphor-bmc-code-mgmt/commit/13e0991160ac73915b=
7dc1bd031fbf7424093cb0

Quote:
image_manager: Delete image dir if same version exists
If the uploaded version already exists, no version D-Bus object is created,=
 but the directory in /tmp/ with the image files remain even though there i=
s no use for it,
also there is no way for the user to delete it except rebooting the BMC. Th=
is takes up space and may cause subsequent uploads to fail with out-of-spac=
e.
Delete it if the version already exists.

Currently, we just skip this test item due to that against the latest phosp=
hor-software-manager design.
Did you have any idea about this issue symptom? Is it need to remove this t=
est item?

Hi Adriana,

According your commit, I understand this is a good fix to clear no use imag=
e files in /tmp folder.
But, it seems against test item of update service in openbmc test automatio=
n.
The test script will check if the existing firmware is functional according=
 image_id in /tmp folder, if existing then it's not allow to update same im=
age two times.
However, after your commit then test script will fail due to image_id dir b=
e deleted. Did you have any suggestion for this symptom?

Sincerely,
Tim
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

--_000_HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00HK0PR03MB5090apcp_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
	{mso-style-type:export-only;}
/* Page Definitions */
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Recently, we met 1 test item fa=
il &#8220;Test Firmware Tftp Upload Image.Install Same Image Two Times&#822=
1; in Update Service of OpenBMC Test Automation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After checking the log, we foun=
d that due to phosphor-software-manager merged this commit<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-bmc-code-mgmt/commit/13e0991160ac73915b7dc1bd031fbf7424093c=
b0">https://github.com/openbmc/phosphor-bmc-code-mgmt/commit/13e0991160ac73=
915b7dc1bd031fbf7424093cb0</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Quote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">image_manager: Delete image dir=
 if same version exists<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If the uploaded version already=
 exists, no version D-Bus object is created, but the directory in /tmp/ wit=
h the image files remain even though there is no use for it,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">also there is no way for the us=
er to delete it except rebooting the BMC. This takes up space and may cause=
 subsequent uploads to fail with out-of-space.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Delete it if the version alread=
y exists.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Currently, we just skip this te=
st item due to that against the latest phosphor-software-manager design.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Did you have any idea about thi=
s issue symptom? Is it need to remove this test item?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Adriana,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">According your commit, I unders=
tand this is a good fix to clear no use image files in /tmp folder.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But, it seems against test item=
 of update service in openbmc test automation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The test script will check if t=
he existing firmware is functional according image_id in /tmp folder, if ex=
isting then it&#8217;s not allow to update same image two times.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However, after your commit then=
 test script will fail due to image_id dir be deleted. Did you have any sug=
gestion for this symptom?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim<o:p></o:p></span></p>
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

--_000_HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00HK0PR03MB5090apcp_--
