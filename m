Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95D19B97F
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 02:18:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t3Yg3VCjzDrH8
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 11:17:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0360499978=jonathan.hilliard@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 2008 seconds by postgrey-1.36 at bilbo;
 Thu, 02 Apr 2020 06:50:17 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sxcn4cKmzDqXT
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 06:50:15 +1100 (AEDT)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031J8lTA015471
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 19:16:45 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com with ESMTP id 3050mm04v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 19:16:44 +0000
Received: from G1W8107.americas.hpqcorp.net (g1w8107.austin.hp.com
 [16.193.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 491CC81
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 19:16:44 +0000 (UTC)
Received: from G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) by
 G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 19:16:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.241.52.10) by
 G1W8107.americas.hpqcorp.net (16.193.72.59) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 1 Apr 2020 19:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP4KDjT+aM6IkBfE7RyMFS87F/By+WCvXT+znRFfTRS51CHSVuorjOk2tXqBKZPpeKYq1YsgxG7oAD7TKPahEmKXlTzKEqJ5yrzMxCUfWnPVaQqZg0Zgat9lU2FPC5bhXesDovSHneKUtRZBuBgniKWA9xY/oG4WQ09rI5oE5EvOgu0ynYTF9Bnthg0vdhOwbTLLfLihK0K8LnF3+HwuUyXtZk9ff9s07Tng+6GPUqkdVT9EXx5hJaCo+dVroMZyE0DbeAIHZJkLFIR3mXDX5OTowjzteP97AJY0xKpp5OlrWR3+CrMjDzlFxx5AE+KILeR3jt6linG7xrUtW3k2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MOBnAOBK+59HEqJUcmb0ARVyURIJKR+jVlNugqLAug=;
 b=KPkT6f7gTDX9st1sEHGkZJxVrz0FTm0KMZGvU4Ag+FU4Bc0xTotZtM36w2zNEu8PaJ0j49ZKD5MNRsMRadholrLBTOl8EDXf7NIQ5/CbqlCx3Dc8ukbn7tB/djUTVnhbZjk82347yP478pdCB3aXflf7nno5hRYZgDm1XlwBtXappz0Cp+5b2pddEvsW0h1LGXxduqqyUc2C/uBNz6dN+/6BMwVoHzVkBYRQ5ROiVizbxDAY1sTyk4PPDns9MEH/ea3RuL4je5vm0804fz+j+9J+3ki6dblvWRxsNBlgh+BSEU2bg/GgRMtpFr/runi66CLAx/NIzJN3bp3dQj+8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7610::17) by DF4PR8401MB0619.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 1 Apr
 2020 19:16:42 +0000
Received: from DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c187:2fb7:3ffb:2281]) by DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c187:2fb7:3ffb:2281%3]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 19:16:42 +0000
From: "Hilliard, Jonathan Blake" <jonathan.hilliard@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish events?
Thread-Topic: Redfish events?
Thread-Index: AdYIWczd/g4PtFD6RCGTifuCN8tASA==
Date: Wed, 1 Apr 2020 19:16:42 +0000
Message-ID: <DF4PR8401MB1177ED2C2AA795CF251570EAE0C90@DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [76.186.127.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29068e41-2253-4aa7-c38a-08d7d6713661
x-ms-traffictypediagnostic: DF4PR8401MB0619:
x-microsoft-antispam-prvs: <DF4PR8401MB06198E4A2CA96A551F2E3765E0C90@DF4PR8401MB0619.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(136003)(346002)(376002)(39860400002)(366004)(5660300002)(71200400001)(52536014)(86362001)(33656002)(7696005)(6916009)(186003)(3480700007)(6506007)(2906002)(316002)(558084003)(8676002)(81166006)(9686003)(8936002)(7116003)(81156014)(55016002)(478600001)(76116006)(26005)(64756008)(66476007)(66446008)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Emh8GNzQVufn7CNkjrf3klT6kN7DuzMSBSKIi0rrZBDbe0D+0xKLSOMoRV22RK8C/NJLDysdOxleQ4UIBuJIW7hh4CKU8Na0ulybB/PIXqsiYjVI/4tJi7vtCbjxEB/vkt7oVPfenUz32hrR0q/Lbt3nPi/qlJrIfFjsWkfqvVjoC4u7vXNJAddkpvhJ/3GwOlBhoXNmsDslcl7MYFpUFYgY0XSkyN/mJcXF7QrMRY7iFCXiE8aZ1ogDlVgzOzY1xiAnIk11wdsbevFEhxrD8bBi6EAMotfs/5cgZrbHPWxkaCOS9y+nOfJ7NzTf7qNSzyuiHeONb66N3eTqf3UjDULpUntcCE6onf9LG+kddbkT+HoBT6RhZf6/BaA+JcegplJwlkmGPxTCZKHrYwgtMr69jIc9ipAkfE43uWfbUCgIShbuqwSwHp9kTLHjWmUu
x-ms-exchange-antispam-messagedata: YgSVfJ7AUmsKsYT2HnpuoOXgsPglicLP1Fa+DCREmPmSFJ71cXn3HHtGJT089/IH/hGkiBOJABjZuE5aKgdfqlhDsXcWJieuPxR84afDt1W9rJPpIsgSd2YBmDh+fwehCQYnPisVMhL709egaxg0Lg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB1177ED2C2AA795CF251570EAE0C90DF4PR8401MB1177_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29068e41-2253-4aa7-c38a-08d7d6713661
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 19:16:42.6900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E06+k03gBX3i8Ym7vFgqQ1F9IhvSoG4wWsYCfvyzg/nTWjkbAOgFep2MYebzoiIsSaT1uAX5RxB+7thEY7d5zCP2qHGq2SHlhGxf82MaRHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0619
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=387 clxscore=1011
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010156
X-Mailman-Approved-At: Thu, 02 Apr 2020 11:14:57 +1100
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

--_000_DF4PR8401MB1177ED2C2AA795CF251570EAE0C90DF4PR8401MB1177_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are there any plans to support redfish events in openbmc? And if so, is the=
re a rough ETA?

--_000_DF4PR8401MB1177ED2C2AA795CF251570EAE0C90DF4PR8401MB1177_
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
<p class=3D"MsoNormal">Are there any plans to support redfish events in ope=
nbmc? And if so, is there a rough ETA?<o:p></o:p></p>
</div>
</body>
</html>

--_000_DF4PR8401MB1177ED2C2AA795CF251570EAE0C90DF4PR8401MB1177_--
