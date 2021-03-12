Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEA346CDE
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 23:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mDn5mLWz30NJ
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:26:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=jSOwBUlE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.69.80;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=xiao-peng.chen@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=jSOwBUlE; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxwqd0rTrz30M6
 for <openbmc@lists.ozlabs.org>; Sat, 13 Mar 2021 06:29:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCff11QCQMjKLPmTZVrlMJVvZHHDcQNzOvSTMZXgno4I9CAYnULQz3n3DlUHC/VEbjOdPqvIkNxLrVT5TI9DuPJ/UAwJURRHnnOgd2bnC+yXA3BgF54hebzLEZtR466jnrpBOIF7tvJtDKtjQEjFgWi0D0o8uCYmKpljWQZ6rohjZuIypcg9MZumGlXI9XMygaLuJZbXhANdEVb36+toeVWYGeVi8MR3OLBPnBhAarIeC9uZ+K759R7WkstPwSLTYLVKn6n8zh9GV+71y/rQdQfRxpohziO1fJPXP5COExVYm9qmnh80wIzpwo2mQdcMdNXfkQ2K/PG69n22tHyTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7KmJVWtKSpez96A1+5hq2mvOQLjN9QuGmnKwlu2H6Y=;
 b=LhriICf7ZOr4P3/cLhm5DEqrs+tgoaV/2RrzHIu1PAsYGfrWDHeFmN8Q8MCwzALV6urAcZ4PaNNkqU7NIoo2+ab2eYs3m8chZYYwQRA6ob7bSFZlJX9AXkTlIkf8ZqqirBpuKOtt0VujwW94/86Lb98CxreOhBzAaqZRzuq3nUTcaiQna309r4icZ8zeITgrFowBkS+LmihrKNXnY3eEueUXpPpmKus1OL/vFZ7ue40YBL7v0pYMMCl6wqAK5WgLQJp6KcvFCl6atw0o7+aYTqhPYvO22izX5SNwY3pCIuurj4l4ZFbk+20XFvt+9m2eP4MXgr65RxDBGPmk1uI8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7KmJVWtKSpez96A1+5hq2mvOQLjN9QuGmnKwlu2H6Y=;
 b=jSOwBUlE1EB3yIsVoqSQ2CZRh/yJHTAmGuX1SgLIuRmhLwXHIoYbnk2/64tS6851xjcdm53QkVV6KiC41UcnsgHayhvuE2JNsjT9de7uKv7c41c4OkdiWlD1uqT13BvlH2f77mItoFn5MQfiGzqUuFuO0BkDFy8fLO06OOSjPHdtwjkRveLOdU68Pnpf7HrObcg3gsMO2Q9a8YA1MMrwfHnMdVc6tFSSLhKPsUdh/nDIq6Q08to4ly27gf0GblOIhJJDzy2xKwmMp2wTeDMN8EYqX1WHFJrszbLIqgKyTLI7cGf2HbN1CzqehZfcDwa0MU8Ylod0kWSqMPMXecx/Ow==
Received: from BYAPR08MB5207.namprd08.prod.outlook.com (2603:10b6:a03:72::33)
 by SJ0PR08MB6623.namprd08.prod.outlook.com (2603:10b6:a03:2d9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 19:29:26 +0000
Received: from BYAPR08MB5207.namprd08.prod.outlook.com
 ([fe80::210b:44b5:21c9:f38d]) by BYAPR08MB5207.namprd08.prod.outlook.com
 ([fe80::210b:44b5:21c9:f38d%4]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 19:29:26 +0000
From: XP Chen <Xiao-Peng.Chen@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: group for foxconn CI / fii oem repo 
Thread-Topic: group for foxconn CI / fii oem repo 
Thread-Index: AdcXdflGL+FGFMTlSM6XVXSLHUuYWA==
Date: Fri, 12 Mar 2021 19:29:25 +0000
Message-ID: <BYAPR08MB5207126C4F83094A41DEE01CF16F9@BYAPR08MB5207.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 624bf8b6-4d98-481e-706a-08d8e58d25dc
x-ms-traffictypediagnostic: SJ0PR08MB6623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR08MB6623C7C4EE73B0A47670DD4FF16F9@SJ0PR08MB6623.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNEWpqA9VkI/EvkhI7MlGxw2SLgdG69DtgGgGslm/b+zPTOChZ0H9sReYtHpNs90pfjole/HAOYPZKrD75FOOLu1dA4qfp/zis176HlK4/Djgi064doLl5thWfxkM9JtqBN1jLEu/0n9nx8PN2fLQJ0DAqWu53vyfLC8AfRHmthXHJCk+G0vb8dpIv+X6c/cRUSBsDn1IXBjvjW00NBRkLMqv5ixD5fCayAojqHAIa0UknO0ONA0eIpAs2JJh7Pp3S1ywp3EiTPM1HFs1jHIEuFDShiG5mTZT9cGAuDFEU2IV7b7mAC1S6hYluzLXLm4CW5Jf8+J4cH01WM0tkL4zN7Snl+rRFlYIoa0CRltNqARk9ub/U5k2hvhJPYqNo35Rjfp1IMLltXySTI/NkPBg6GxxGBW2wVyP6H0MgzkcUqOoSPW2L0HNuMzmm/DjTFpGMCACk+QfXGl1GgzaPeA33VkRQDds7wyJ+IFroJcdo9xYUSJKj1xk6cZuWzrEJRBZz20LGHOXcYBqlYAhrVDRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR08MB5207.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39860400002)(136003)(396003)(7696005)(9686003)(316002)(6506007)(52536014)(33656002)(86362001)(8936002)(66476007)(558084003)(66556008)(2906002)(76116006)(478600001)(4743002)(64756008)(4326008)(71200400001)(107886003)(5660300002)(54906003)(8676002)(110136005)(26005)(66446008)(9326002)(186003)(55016002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9u0l/lJc6srDx8/uZmgZYdTtKHvUaQJZY8PsfwreD0KmlMdMDEKiR1aLeHBA?=
 =?us-ascii?Q?f7rK6Volbp/whixt9hly6rOgYIsQos6HFrFsczms/Yj7qH7VVuAZsooun7l0?=
 =?us-ascii?Q?SjHsH1gPw39zok0YwsWN7hBNd4ni2qDI+u45v38NUAz8BFOCGlRgEQSpHfB7?=
 =?us-ascii?Q?72QB3LunsImml+CxJGGRZWIPem7IjwxmW1dt59D2rESF/uJpAP5hUsPCQ9UZ?=
 =?us-ascii?Q?sFo0nbI4X6kxcZCp/ibaKeZTNeWY/H0ZP0o6yVKLq68lHXAn9ZEVMJAsF6CN?=
 =?us-ascii?Q?krHFd9fhnXDR32JAqnWX/aSNu/yB3Ob7m/Z7H2Qx8hdjywXT7xgYlPthXK4Z?=
 =?us-ascii?Q?Y9qgTnZSZsmpQlliVIIUEgZiM0i5EDIhuFnPhwVesR8FPy9pm2OMgpD46Rwn?=
 =?us-ascii?Q?l6whqTZlULVSYxv/cbhWouxwjlbTn3fwG2YM+5NDFNHGvvvFMpYpMqc6SD5v?=
 =?us-ascii?Q?nbzOMZg31Pqa4JNVgQDflkaIM2OVWmojMl1Ai4AJEVtsUhMDkn16YuJjfinF?=
 =?us-ascii?Q?+wJqo2WAa23vxAKF/aBRZoaJYD445vR8gagT04Cbc7isfs/EXkXgovUTtJMP?=
 =?us-ascii?Q?DWoeOtTZoYy0p969dmY8lKXN8QympTV2FpfwwjA+RtPFmFmP4eTikDF2Ybl6?=
 =?us-ascii?Q?EYVjOpHleJNXqRrwF8hwGquJLxqEYG8DSPQMmI+c6+cKeU1fmIkcBoniiqcd?=
 =?us-ascii?Q?rhWaXSU07rtogDIjMJjj+5bSlUMmxPgi2DmDGbSM1Ri13gxHVsLt/j6ME+K9?=
 =?us-ascii?Q?us0vS35jojrF/AhIlpy1alXNPtymenurg2dMptjRzYJPyZoQDaD9i9poL9YU?=
 =?us-ascii?Q?GmXVUXl0ckLnjByITHLiZMJV1khJpVRs08Pf1MnkHLAg8CP096McXiZij7EM?=
 =?us-ascii?Q?mjT5eoCkFqexB1B3X0yTg9mlTGkPwrSLq13+Vm8ML7IvUme1c2p3aJ1CVu3/?=
 =?us-ascii?Q?v3OrV4edUjSbw04/7GMqTreGQMb0WYzSLIXCtpFeLPbeEvFpHXBJQCyHZX2j?=
 =?us-ascii?Q?+fGaYi7HeJrAg+JVMM/NB8J1x6m9MCt3ZTB71lo/MEGNAR21e86GEUI2aAPd?=
 =?us-ascii?Q?PE1JSFN1Qz2Sl6i2QRBIrcO+9+9FP9/9+zpdsTSaATThgPTEWFqsWGtzbE+O?=
 =?us-ascii?Q?zr0n3HOSBU7bIyipc6HhTVlDK7BBtqYkMTrh4FnufuCx1ziCOa9W4PWxetG9?=
 =?us-ascii?Q?ebR6mskAiQH0hE5U6RYo1tahB5I+d93ZMOd+H5grl86N2DQIFMA7Vz8J2Ouh?=
 =?us-ascii?Q?QkwsKThnswM7it8yNol2iSEkuon3IVC3PV3COkTgPWH7rrsAf+fW9VaxUaCq?=
 =?us-ascii?Q?6dWw1Mcn+EGrVEAzBDJGV6Be?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR08MB5207126C4F83094A41DEE01CF16F9BYAPR08MB5207namp_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR08MB5207.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624bf8b6-4d98-481e-706a-08d8e58d25dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 19:29:25.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xYb7ItMoSMLgMRdbcVIcdwg+nvmdQEnceywpOS8sdbUtbdQ5vD7GQeKApoiN2HV1SiypSnmZZQsuAx04My2GjU7v8Q/86ROpUXGjxR+e4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6623
X-Mailman-Approved-At: Wed, 24 Mar 2021 09:25:27 +1100
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 "vveerach@google.com" <vveerach@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR08MB5207126C4F83094A41DEE01CF16F9BYAPR08MB5207namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,
                How can we create Ci group on gerrit and add people to it
And we need to create new repo for the Foxconn ipmi oem

Can you please help with that


Thanks,
Xiaopeng XP Chen
BMC developer
FII USA


--_000_BYAPR08MB5207126C4F83094A41DEE01CF16F9BYAPR08MB5207namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hi Brad,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How can we create Ci group on gerrit=
 and add people to it
<o:p></o:p></p>
<p class=3D"MsoNormal">And we need to create new repo for the Foxconn ipmi =
oem <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please help with that <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Xiaopeng XP Chen <o:p></o:p></p>
<p class=3D"MsoNormal">BMC developer <o:p></o:p></p>
<p class=3D"MsoNormal">FII USA<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR08MB5207126C4F83094A41DEE01CF16F9BYAPR08MB5207namp_--
