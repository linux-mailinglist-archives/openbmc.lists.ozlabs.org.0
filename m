Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79B284937
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 11:20:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5BlM3tZszDqKT
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 20:20:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=66.46.24.197;
 helo=smtp5.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=Hybd3AVm; 
 dkim-atps=neutral
Received: from smtp5.synnex.com (smtp5.synnex.com [66.46.24.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5BkP205VzDqKL
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 20:19:39 +1100 (AEDT)
Received: from GSC-EXCH6.synnex.org ([10.84.32.34])
 by smtp5.synnex.com  with ESMTP id 0969JZEI030107-0969JZEK030107
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 6 Oct 2020 05:19:35 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by GSC-EXCH6.synnex.org
 (10.84.32.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 6 Oct 2020
 05:20:09 -0400
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.53) by
 gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 6 Oct 2020 05:20:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5XACMDkFkkz/iPz998UwxP67vlMj8D/4R0a6VEoEJO1vdZO26NF8/OSCrnLKBc//0n1gpMvYbp1/qrvs+jKSSm43glqWUnw3JM4OoNmDfG75fVONxqtBMC9bgVY9+tIdvidmhDJ8kc2lQyK5CT3Yl0314xXmX72skShik97LMFY2CjSJ1Xa1d9/Pqm08dOolAPyqpikzP+wtRWMIoyGtq5Hc+7QNVf7hXQNjyXjiD30XW4w+9tpPhnySEaAOs3bBHyKC6m7W9E3ja/6Xl1rTGgwtsdaod0777+u0Fi/e3D9x1yMNwIjHhcXPIvdI44DaGViwku7lF4hWPgyiGbVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvE2BYFAb0sYDilqeVgyBMe4YCH1Yv1PdFS3deVPlbQ=;
 b=AXaf6wAxdBc9aUdsUgM8xW6lWZkS7WQtwnNLxaKywfICDyKHB4Y0EIbuxpIWoMBQOvKdt6LTcmZogDKGdWSBNdnC7CR0oESJX/NqMQDjNprMzOg22gdqpZTwE/y+BidbvNYVpYu7oDhr+yJeQWfs2ZAJ0OVHeh94SjE5xjAyxCgJybW/Fk7yz8eBjyk0ibVBrJUhYuchqYJ0H/8Pochcl+m7VBDt/h3mbC6nQsRbV0tLf8eWEizYYAfFYLixpD4vqT6eMf2+4IjIOyUKMWvWysnBXCUW6NLLiyPgqFKly9Ic6eqBtp53bVlUCLY8Ry0QyV9SBxVGcIOzBZGpC5fngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvE2BYFAb0sYDilqeVgyBMe4YCH1Yv1PdFS3deVPlbQ=;
 b=Hybd3AVmc1CywrGEVCcc/jug6FM1420zgr1lwml9+Hk5wBW+OJDRsfzVh6MQ65PUxmGz0HRheyMzuHwM/lME7cNqo5qUooBGYiOqMTH9g4jkozHSY1hGGU/z2wk7VoV1oQqgs4Uryi5eJ0KDz3gI5xecbWJ7YvcFhFe3FISbSrw=
Received: from CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14)
 by CY4PR0401MB3587.namprd04.prod.outlook.com (2603:10b6:910:8d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.43; Tue, 6 Oct
 2020 09:19:33 +0000
Received: from CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150]) by CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150%6]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 09:19:33 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Virtual Media return InternalError
Thread-Topic: Redfish Virtual Media return InternalError
Thread-Index: AdabwQovvDxZ0hPaSxCdO4+IIXE1eQ==
Date: Tue, 6 Oct 2020 09:19:33 +0000
Message-ID: <CY4PR04MB1033E4D796F88C0BA457B3AEB90D0@CY4PR04MB1033.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 267c4e7a-ef85-44f8-880b-08d869d8f01e
x-ms-traffictypediagnostic: CY4PR0401MB3587:
x-microsoft-antispam-prvs: <CY4PR0401MB358702F7A830CEB2ECD5474BB90D0@CY4PR0401MB3587.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sxe9NbDMhK8WIWUYOZ9kG9iGz/8I5wVxGkqib07sO+fpxoDOXjR9URv8L81ul95qUKAA89LxkEVvsQeMwBxdn/J/ajT4HHFO5Ms39MwW55pxulsa+pS6PftLYYgClgVFIO/nKik9binCdqSd360H0C5N2/4fMmFXV5dCnU8nez1ieob9fsDpZLucnIhodlrIJI+SLWotoseDH0/6knbDZm6WM7BW0diwA3Xo6VeR5FW3NJiElD2DwAKNXNQ4K0piiwCAgy9TH36YSZqIaIS1SK33ktJAaPV/ibq+gs1r/fc8Y+TN1zqawnMBk0KA53+f1HDqa4w6noGgfkcsXyLoyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB1033.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(33656002)(6506007)(8936002)(55016002)(66476007)(66446008)(66946007)(76116006)(7696005)(66556008)(2906002)(8676002)(64756008)(86362001)(71200400001)(83380400001)(316002)(52536014)(4744005)(9686003)(966005)(5660300002)(9326002)(478600001)(186003)(6916009)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4CQ5aBTvPAibCSFcvwMhpdD6uPhvr1xO7HbEiX/zMYSg905wMAf/RKWaOmSkSzWZ8nCJzdYb4Bvlplusi19rEPNgIkkgJ1LMpOTU3bNsPNqmzisddre5JKCePx2NNxT3Qwok65SQwhVp3lS+kjszI9xCWNd5qxr2IQL/kf3YBq3wxg4fRLTUb7R2Du/LSCC76ih6QkV5t0hz3y//OKQIJFNo590omQ/V1IlzgaTawmkyQuxZ8pecYXDz/RNY3tvksMtb/PDzd9yhNCcbZfN6mTTUcgpvtOVE9O93r1ivWd+IkGTHZcxXm6pElg4gnihujDAyq4AzADNAhFimMKvhJ2skttOkk/a3+DPHpv4SY0I+YPjmkV2vWFzeAh2+BloU5wBP36uU2UvRlfgXzP6eL28+t85FIoGJR/TtDuovIIGVqmhSdGeg1Le223f9E4Mi0xFTU01vacwFKvfgBVHFpgN9yc6rU4rP01BFAHbysogmCEzBEqVDDC8lrtOrg0PFMpSm4PfB1ovb8iSFYS9OqkRj8MAI9UkAJyINMEA2vFEA8Us0av5L+3tqw3CXGJva4T0lQqSkMEzJSKRmbZTcBbxyo46POd0+pE6MSqJyEl1Pxx8OxuPAm/lNt6PO6hHmpS49lu7PkSUJcTIp5TbGPA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR04MB1033E4D796F88C0BA457B3AEB90D0CY4PR04MB1033namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB1033.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267c4e7a-ef85-44f8-880b-08d869d8f01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 09:19:33.3241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qf41MOWYGvbVAUiUYCnhQmGVwlVSDrXnZjDmUjGUGIVt8uuJxEJmKiUG8SUSYy7Giq/rrr1B1srdDgnUuS++Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3587
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Policy-ID: 6:1:1:SYSTEM
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

--_000_CY4PR04MB1033E4D796F88C0BA457B3AEB90D0CY4PR04MB1033namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I enable the "DBMCWEB_ENABLE_VM_NBDPROXY" flag in bmcweb by bbappend it :
EXTRA_OECMAKE_append =3D " \
    -DBMCWEB_ENABLE_VM_NBDPROXY=3DON \
"

Then try to use redfish virtual media.
But I got an error return when get into the collection :

$  curl -k -H "X-Auth-Token: $token" https://${bmc}/redfish/v1/Managers/bmc=
/VirtualMedia
{
  "@odata.id": "/redfish/v1/Managers/bmc/VirtualMedia/",
  "@odata.type": "#VirtualMediaCollection.VirtualMediaCollection",
  "Name": "Virtual Media Services",
  "error": {
    "@Message.ExtendedInfo": [
      {
        "@odata.type": "#Message.v1_0_0.Message",
        "Message": "The request failed due to an internal service error.  T=
he service is still operational.",
        "MessageArgs": [],
        "MessageId": "Base.1.4.0.InternalError",
        "Resolution": "Resubmit the request.  If the problem persists, cons=
ider resetting the service.",
        "Severity": "Critical"
      }
    ],
    "code": "Base.1.4.0.InternalError",
    "message": "The request failed due to an internal service error.  The s=
ervice is still operational."
  }
}


Any idea ?



--_000_CY4PR04MB1033E4D796F88C0BA457B3AEB90D0CY4PR04MB1033namp_
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
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">I enable the &#8220;DBMCWEB_ENABLE_VM_NBDPROXY&#8221=
; flag in bmcweb by bbappend it :<o:p></o:p></p>
<p class=3D"MsoNormal">EXTRA_OECMAKE_append =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; -DBMCWEB_ENABLE_VM_NBDPROXY=3DON =
\<o:p></o:p></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Then try to use redfish virtual media.<o:p></o:p></p=
>
<p class=3D"MsoNormal">But I got an error return when get into the collecti=
on :<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">$&nbsp; curl -k -H &quot;X-Auth-Token: $token&quot; =
https://${bmc}/redfish/v1/Managers/bmc/VirtualMedia<o:p></o:p></p>
<p class=3D"MsoNormal">{<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;@odata.id&quot;: &quot;/redfish/v1/Mana=
gers/bmc/VirtualMedia/&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;@odata.type&quot;: &quot;#VirtualMediaC=
ollection.VirtualMediaCollection&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;Name&quot;: &quot;Virtual Media Service=
s&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;error&quot;: {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &quot;@Message.ExtendedInfo&quot;=
: [<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;@od=
ata.type&quot;: &quot;#Message.v1_0_0.Message&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Mes=
sage&quot;: &quot;The request failed due to an internal service error.&nbsp=
; The service is still operational.&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Mes=
sageArgs&quot;: [],<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Mes=
sageId&quot;: &quot;Base.1.4.0.InternalError&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Res=
olution&quot;: &quot;Resubmit the request.&nbsp; If the problem persists, c=
onsider resetting the service.&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sev=
erity&quot;: &quot;Critical&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ],<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &quot;code&quot;: &quot;Base.1.4.=
0.InternalError&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &quot;message&quot;: &quot;The re=
quest failed due to an internal service error.&nbsp; The service is still o=
perational.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any idea ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY4PR04MB1033E4D796F88C0BA457B3AEB90D0CY4PR04MB1033namp_--
