Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254C350CB4
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 04:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9nHr0NTXz30Dq
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 13:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=vdE7E/gt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.130;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=vdE7E/gt; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310130.outbound.protection.outlook.com [40.107.131.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9nHX4d0Qz2yZ8
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 13:31:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lie1Ta9y8g57bwp4HkCOxC8cIgF15GwBhJz/fxFSQeENKciUx7W1Ae0qDB9GTei1zQZPQmQODQM3D77UAot+ECyXm5Z0mqipWQX+oW7fmPFeYNFqkjY7VhuUMBtXJyvwMvAS5vuZwqkbV+qbl4lclE9jCOAb6kvTQY61CDCxZb0R6bt4G1To7PCV+FdT2dFfah1SAadFE/w9swQE201DEeBCE3Cmq3MCxOjVsPyL7dixHv1oYZ8Awf0WHzc4QxYlkUFoxu5Y5KnX5EpzORYaSwUtn2Grgx3JvfA+CumGQWviFo9PhhpUREEIhrH9wmqaYzvRHhmJsWZ/DAK7sR2OdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxiap4GhGSmzMmSxNjnM84XfjgbLwAZVArwyv5+T9sA=;
 b=chLLN3RnxndCckTJMB9tu2xrZYtSisbuWzRh85aES0Rrs5uy4yeto6wdItAUnU87CiPYrlgWZRH2MM+My1gvGj82u9upFX8gpu23c0dN3V+isYOYnrNXWGTCB5c6b/lXgba8d9+6Iw1YqqWTyKLLF0hetvVs+PrDqacnoqwjQ3tuE0iDCFmLgvX2lpe0q77H5X9mz86rxmaK1BFSjAQ8aKLSQw0Kv1n3eyayW+VWVOVO+FEZggJLrlnfbszSZzBd/STHUXQlixa+UC7sfXEbA7KqXnL+rH3/6DK2e7KdbDEEU4vOxAdBmtUh4UjmbIgLuBRoaEAtyuKEDmkIw2MJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxiap4GhGSmzMmSxNjnM84XfjgbLwAZVArwyv5+T9sA=;
 b=vdE7E/gtlcBQ8cnG1On5WISplR2zMu39UvMukCFlYyucxWKisQAhWHY+mcFKP4n5m/fTbVaUTa5zbK2J69nnQHQl2RGv7aIknW2obSYaThuzJeSzuDgZ27tCTpN+RmYWIlLK9wBB7OzfCC2AMMPJ8N5FjoghTv4otX4C2yKC/bs=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSBPR02MB4328.apcprd02.prod.outlook.com (2603:1096:301:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 02:30:55 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cf0:75b0:2bff:8982]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cf0:75b0:2bff:8982%3]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 02:30:55 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmitool lan interface
Thread-Topic: ipmitool lan interface
Thread-Index: AdcmnmU+6NyvYbF5TKCYp+Baa2H77g==
Date: Thu, 1 Apr 2021 02:30:55 +0000
Message-ID: <PS2PR02MB35419891478889D090BD2BB6907B9@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [2601:647:5b80:8dd0:b908:200b:781d:fde9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d570cee-2de4-46c8-b1c8-08d8f4b62d50
x-ms-traffictypediagnostic: PSBPR02MB4328:
x-microsoft-antispam-prvs: <PSBPR02MB43285EBF037F5C827326BF03907B9@PSBPR02MB4328.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iBaJ987HcKdejAZxjsHpJRW+ymCKG0suUwDBhEKqNy04M6+celXutCjf3o0e3OSINfiExF4DayKO2IvB9lhQACpKFs8Qn61BSGgEyV51bZreMfUvH6insjCMLv+22VGkgZ26NHi900L1oD9Z0KXfZZPxixtuudlh6kYJR5Sem69J12FsBVUfGOc2C9CDq/Ty6dLu5lWh1QYlcexn0aldDNBfDU4t4HAbdh2tTX7ewS2Bw07Ez5VpqvCvMNIqp2ryRL8RMf7XA57949Ey4Go4ZQpngyOqgZMo5wDjG7HaWpfWBvBYaRuSMigrEXq8oXwoe48eby9XW+/1kEkPM0J4GHN71LH/98tdbZhmGuAPPiciBV/5LlbqnNBL/4VXiqdKoYSXx1WMIUCrPKPodjzes1AJQFkxsgavUp/fYIoS95hq1EWdoJm7jEL/yO5Ia3tymdSYFeaa2NXT5z3g9hHpPfHZ2eugku+iArrxn6mbu87yY4ia7AbYMuHmNZJ3qgoX7g2hh7fNopFoFuGB2RcO+svegssaBCSCTKfeHXyc3Zmh0Az7cdd2w8TYvuXRtYW/eysDlkqA89CG2TTiV6SxvkFqjriQlnItbCtn8wMXQkgft5B/7Jp39GFFkkm2oq28n+Xc2JvqsHkBI9Vja1ppUqkV5DhebgXqPqGItJls6ow=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(76116006)(5660300002)(52536014)(6916009)(38100700001)(316002)(186003)(9686003)(7696005)(3480700007)(478600001)(8936002)(86362001)(33656002)(6506007)(71200400001)(558084003)(9326002)(66556008)(8676002)(55016002)(64756008)(66476007)(2906002)(66946007)(7116003)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rZzgb9ji8ZSdI2YIZXn345g2o3VA9DFEJORRxq9I41dfKyp7s775vFVFbJZA?=
 =?us-ascii?Q?ZR3mrH04E5ujCYDKff38Fw9tYIPkIV4XDOFwm6DdJFnUilVorbteeHqwhFru?=
 =?us-ascii?Q?7mjesyuFhVKBtEkDd+rO4wDANQWfuKG6xZm+fJMKUrVF6WOD1ktnGmjozhTT?=
 =?us-ascii?Q?UxQpR4iXS9JhLG74Pai63HMo20WvQGGaQYl8zzE3W8NDPtTH0cT238PHGC5K?=
 =?us-ascii?Q?4ktIE0VyAFoV/C9Fi80jjqZCrANpyloVDsGM+PavkcrZU2H1UoiZLmHr7qep?=
 =?us-ascii?Q?0obRIfEsnGKnASb48MKHj+yKb0eVuiYmL2AG7uH0xan9n7cROofA/NGtJMrm?=
 =?us-ascii?Q?GLvms2opg331xiIhEVATGxJWENdde7VhXUR/2SzyQOHbKIqyzQVsVr/3gpFi?=
 =?us-ascii?Q?pr4nd7J2ujED9NdGVyWBZlZq83WU84TBh+AaEE+AkhRA+wcDYuqFMc6biZOn?=
 =?us-ascii?Q?Zl7fuEBz66rga2NLIsVYwoQjDOzdbs3SIHKi+bzwBpm/j9gocSoGl8VjjiYn?=
 =?us-ascii?Q?4dTqDxuXqIaoJU370tY/QkxaUHrl8qTbc5/KhVGTub1QGyt/xkx+it1FJZcd?=
 =?us-ascii?Q?CgDuFbma+1vRfwlxIUKOA0cQxXyoklXQyTvmBZ/zGrKd/9nvyjlucTiodMiR?=
 =?us-ascii?Q?W5oQB6ppCVpbqbKU7NNP0bSJlDQELOCZVPyzgy4Ql+8t+CyQIjb8FMZw9hDM?=
 =?us-ascii?Q?Aah8xOhmNuL3nzMNl+SyVZ0NdF4D1xsykBri1bKi6BK1tN1xy7ZD0hvbFI1m?=
 =?us-ascii?Q?SLXJgCKav9hSxQGxHE/6qGDRRpu5BMHDKidV3ZoyNUvLJnQ3YIVx8xv6drbq?=
 =?us-ascii?Q?9AM+w4CbCWERQjwNTofRTjDXKCwoGUZ735Ck397D8lRg9mT7rpryD8FiwtVB?=
 =?us-ascii?Q?rkB5W9HNq+0ytqWBwSaZQyKoloOiNW4y9PafF7UQEVnEY/LGDZjvvkvEC9Rw?=
 =?us-ascii?Q?VSXy0wu/K9l7LBUgVHnPRd16Z+DsBr4rpBjbDwq+SOwcMBG9HqX9ZvBUF+FP?=
 =?us-ascii?Q?aUlugdVMz9pGGRkk56hT/gk+H21o4cxRwaamUO0WnALOUyJlk/giBz5cFeu2?=
 =?us-ascii?Q?iViLuWQdYPfPt/3/aEiHtJYSa+gBeKF/RDEuDaFApWMY4YFPzmu8JuRRFnmg?=
 =?us-ascii?Q?JHUZeHR/K1ePuQSh8aS6dQUNWsyf0fubqq2DSji/VYS6BldAdJ/QXhse48K9?=
 =?us-ascii?Q?5OpBzax4cgR/ap+pTWA6RZfhtsVoStackQMtwJtG817ev1Nqm7vJdeOmJlsJ?=
 =?us-ascii?Q?EFYnJ3AXmEvTOO+2isXeGr2h47uh3CjOJprAQqn5yE95Q1D+2n7+DnF5f8g+?=
 =?us-ascii?Q?mInso7CiQ6CtaYtpCAV2y2QBCxnvvLR2p2h0X8MsgXWP4jheDJTh3wG9QUBy?=
 =?us-ascii?Q?+8SgAlg6AGBE0rPiJsPpyMjVPt6D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB35419891478889D090BD2BB6907B9PS2PR02MB3541apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d570cee-2de4-46c8-b1c8-08d8f4b62d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 02:30:55.3304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m55pYTNFEdi7R4qWFUXopJUd3i2C4+5hWLT4e9HhiuDO++rsjdCiT7557V0qe2nObHafvBMtDI4ZWIRqEYQxjIzQbyVwpSRLShsRbds38PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4328
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

--_000_PS2PR02MB35419891478889D090BD2BB6907B9PS2PR02MB3541apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

Currently, in openbmc lanplus is supported. For testing purpose, is it poss=
ible to have lan interface enabled too ?
What changes are needed to have lanplus and lan interfaces both working? An=
y inputs please?

Thanks


--_000_PS2PR02MB35419891478889D090BD2BB6907B9PS2PR02MB3541apcp_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently, in openbmc lanplus is supported. For test=
ing purpose, is it possible to have lan interface enabled too ?<o:p></o:p><=
/p>
<p class=3D"MsoNormal">What changes are needed to have lanplus and lan inte=
rfaces both working? Any inputs please?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PS2PR02MB35419891478889D090BD2BB6907B9PS2PR02MB3541apcp_--
