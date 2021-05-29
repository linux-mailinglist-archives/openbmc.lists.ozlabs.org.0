Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA5394DF2
	for <lists+openbmc@lfdr.de>; Sat, 29 May 2021 21:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FssQV725Sz2ymS
	for <lists+openbmc@lfdr.de>; Sun, 30 May 2021 05:42:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=OKLa7/BR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=OKLa7/BR; 
 dkim-atps=neutral
X-Greylist: delayed 1693 seconds by postgrey-1.36 at boromir;
 Sun, 30 May 2021 05:42:08 AEST
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FssQ811f9z2xxq
 for <openbmc@lists.ozlabs.org>; Sun, 30 May 2021 05:42:06 +1000 (AEST)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14TJDpG7005890
 for <openbmc@lists.ozlabs.org>; Sat, 29 May 2021 12:13:51 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0b-003cac01.pphosted.com with ESMTP id 38um76gb2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 29 May 2021 12:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpls3ANoltm9MSX0KA/bQORaTDFDfkJv6VsxyK8k8Di5OmSRY3OGPIX1kxjXSQt+Jz0ch5cv0aGPHT5IVf06GgpTjrNBon46sY/Au0ORZH/NI8/8wxOzZb8uUoSwbzRL+FVr9E5TQama5a1uapwd7gxlwGuNqOnh4r27dTOpJcQDIvgbuBWMFa/pVOkoJLezkarYGtQXq60DMb1dZZP6JmML9GnihsaVk6QPsKYIIl15pOq7nTDYOMKF7wdqysG5AHRVQ6BRpSoeQQJIMJgp4bhIMpAW+hsVId065iIY9g/mUBAC7DHGNSy4yYVhEsBzrPQlP5IJhgTDjiI/nej6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfiSXBvTg+6NWMyzGeTHewrmBvh5GiToxAFizsLnlc0=;
 b=G8ombvYvNEJQ20Gw5Mw33a8T7ga60+TaQ5bJtR9yb/b/BnbsTtCa54fAop3OD7oHVSZvg7PW7R4waHOm4BPSbL/y1dVEsYU8TL+zQTSRQWxiXf3InGGjxcdIMQZABZDkbHoQD6kgF29LwA4q1T0u4nV1b+rbn650IQW3opDPYbaa7zPFMJFyihn2LtS/6CRG3gZBn+RuZBWS7FCZZInsst4cDTHv1y7ShCi+Y7sQ4uA8vZFzBQPGt/ZEBvIxrJ3aW3juAGbZLFkykd4HZ86YrOQnDsKzf2OASn9kuwcIVyEs6YVTnogUGNHEBGB/dzfHvqAypiyd3kp9M4go+mTkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfiSXBvTg+6NWMyzGeTHewrmBvh5GiToxAFizsLnlc0=;
 b=OKLa7/BR6AJpOq/0g9G16fJAgiBB+iafZicJWc3biEI1Hrpvw6xAxtAa8uNXwToJG8gfak6070NGZpOgynzKKeeYNQ2nlqApWrgaLXdd1jp+GOOBmblPHTlaf1pfN9NaQxdvthp5cYxSOT7GaOlEgWvIHbaLlJN6S4kxcfII/Ec=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (2603:10b6:806:190::21)
 by SA0PR17MB4348.namprd17.prod.outlook.com (2603:10b6:806:e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Sat, 29 May
 2021 19:13:48 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c%7]) with mapi id 15.20.4173.029; Sat, 29 May 2021
 19:13:48 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: FruDevice/Entity Manager vs hwmon
Thread-Topic: FruDevice/Entity Manager vs hwmon
Thread-Index: AddUtYbuQlmqjpkgTbmHP6gPOH9bmA==
Date: Sat, 29 May 2021 19:13:48 +0000
Message-ID: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c114a3f-4c12-40fe-5e46-08d922d5e326
x-ms-traffictypediagnostic: SA0PR17MB4348:
x-microsoft-antispam-prvs: <SA0PR17MB4348265B088CC9BF8CB233C896219@SA0PR17MB4348.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3hr7b26ZE+TgJFDRUbXzbmG6OF3UXTzj7TdP/iGrMwsgdnd9R+PaZTuT4Prt/wBVBkMtfB/eMMAL+t0vcCPx3ydOjM6vF1JID1W6vAJ4glRjmAH6579VAHpqAZ+76jRJfa/T4cffUI/UHxzxZ+mAPbCS7xnwP24nOpqCoVUIdZf8RIZPnp/kvaBQGdkiYZo4V7lPQmu9OlbiXBpS9GJseJN/Ae43XpbC21Rp8P6rc0cf3f3WxsQr4dUmp49i9VnLvkHr6tyqUVsix9RCcS7qpkCE0EzIJIFqWMpxuVW0bVx19EeAI6/Lp1xShTeTMwalRPm24LZgo4E6BknwqViXc/MSLQ+mdNU/74hJCuY80rECjhT0F/qYw5mda3OK42RMT4BmphY0UtL6X9UY8RFqNFhiWKOQZT0/Cu8rBz9WOrzcPjfRUkjb11xnuVTMGdNyXY5odmakal0iESrhrYci/mBvbPYnthOEzkq+NQ9fRUCvX2EUfjPy9vlY6I5tXcvppQoVDparm5jlVCIVvg4P6RGiEhqjdYavUa1qTHh8fR/UTjpCbSww33P0DVGGGshe6drYMeP7og9kjJLd+sPggUE/VyRX1T2OEmBgf6Ok9Z8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(9686003)(71200400001)(316002)(38100700002)(122000001)(186003)(83380400001)(26005)(8936002)(3480700007)(6506007)(52536014)(7696005)(9326002)(6916009)(86362001)(5660300002)(44832011)(76116006)(8676002)(64756008)(66446008)(478600001)(66476007)(66946007)(33656002)(66556008)(2906002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sH3u5wqpC/wW/+B40ItfXqp9RafSE4HUBm1sowlK9Z5mNcMYKNeZ/6X6G7Lx?=
 =?us-ascii?Q?1ZmjOJHJzFg+EzWDRFIW8a7r2W6Xk0vkBH0rCTtAjAwVf2KS375Bre1JYH/4?=
 =?us-ascii?Q?KK2HboGqBrjH9K+lzpV4+x4gx8+qIf4f5H8KDzVwEhFBrI0YfddYRp3jevQb?=
 =?us-ascii?Q?uTA93IhvuUJlSGM8N0QytL4lUYwe/NMrYigggqBKhv/UiNevLrktbiVE9edH?=
 =?us-ascii?Q?L56aIot7pX2gcLKDEp6h5ZyTRKXU+buGq8VvRG162Zg5TIpCkh0eprEWbejk?=
 =?us-ascii?Q?6g0tCkbB/zEOrgOGMEAhBtugc+WoyrG8nr7VtgALciaHZJIBnaQWz8AsgxvF?=
 =?us-ascii?Q?uVEipGPPhmMW62ZMh6VPy4BLjIC593gFGbInMRdVk1ygBoL87QaFVJr4tEq9?=
 =?us-ascii?Q?mwSmabZG3wfodrP3lsOYKBN/FXcCG8IpnUXFoAD7icX+P5r5CY17x8OF+Tvd?=
 =?us-ascii?Q?k5P/+Y/3zD3/KuFawwdsaQ6p1Y3ndIudF4tir18FbbkvFkDPb5gv2l9LD4Z/?=
 =?us-ascii?Q?n/i04MykwbbSm/tiXoCCzRIJQrN/zK6Vi0ESWLQvwVY/7Ef3UKjhF8m9NTs1?=
 =?us-ascii?Q?Nc0Lk626+X8kwCHZ+6jxHnODVDwapBMZIXQalQCEEA6nLc54Fl9v/8hV3LCK?=
 =?us-ascii?Q?aSAdnjUBMd2Xj6oVZY81BWyQeoCF0LhXBxUxl1sQ+Vt9WW1poZVFShAhAmS8?=
 =?us-ascii?Q?t5cdaj0LBxZ+05ocaPvYDeIoLQfRKoCp+Re2Ydl7uNH15DSwSrA7rmlK48l/?=
 =?us-ascii?Q?1Kz2rnnylOyQavxnAdDqWud8+Ug/LSTV9HvJAeZmsHslq3AWwBMby9x5vpm3?=
 =?us-ascii?Q?Nrv6xCcs4oDH03Ja1r0VwKB6pmziTb1p0yzA1LdSPtsFHlDZiNSuLiRYOTuV?=
 =?us-ascii?Q?DQXFvM7tDk6U+GK/cJcOz7KvQ58ZF/UzhMeIKSUY1TsFsxr1sg1oJhDVZcAc?=
 =?us-ascii?Q?Njh3XGciFSU9LYiKkizIAOPuVciUsW8p2IAET0EgvHUnn9L5SYjg5NqqHT+l?=
 =?us-ascii?Q?I9/umr9QsO2/hmdaLXnZJllsEQPyyuIs2xI3IeRXLjYGGH77OhgJ1+ZWe+Nz?=
 =?us-ascii?Q?iGvJJV1OCTjbt+nxXe3+Vml5lJsiEw8x/+BmWQSI9pnlVc5dor6GfPt02eqY?=
 =?us-ascii?Q?LnO2sKvGOc3YLfbERsuWgARHkkjw1CIympXwIJ/10+xRWm9K8o8kvJxIlNT1?=
 =?us-ascii?Q?vq9GO1ANn8qZ7YEsllsjsnyAr7VcEm6MiJ0bQEmnH9saFMs1GQ1ti0qS1d9t?=
 =?us-ascii?Q?4zUuj9i64L7wKP05gt0MGpA3d+b0EgztQFQhnALXQgPXHFs+l9b4WtAd962K?=
 =?us-ascii?Q?+W2vz4k8RcsahSDLEBJhlf6a?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SA1PR17MB4593FB6D4BD9F4517F3333DE96219SA1PR17MB4593namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c114a3f-4c12-40fe-5e46-08d922d5e326
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2021 19:13:48.2702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ik4asmumkHw68JBYUpBtvqRoP5FdlmuTLjHMgpUvFmVXBcHrUerCXEInxaagbivj2sBp5Q+CDLULXGcxw95HKB+spVVMV8fxUjZcUsdegh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4348
X-Proofpoint-ORIG-GUID: JpJF06Of3ii42YgdhAV49JWfmsT8pOJ_
X-Proofpoint-GUID: JpJF06Of3ii42YgdhAV49JWfmsT8pOJ_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-29_09:2021-05-27,
 2021-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105290145
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

--_000_SA1PR17MB4593FB6D4BD9F4517F3333DE96219SA1PR17MB4593namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I want to define temperature sensors, fans and PSUs for our new platform.  =
Going through the documentation and sources,  I understand that there are t=
wo approaches.  One is to define them with the same i2c path as mentioned i=
n the device tree as part of the hwmon configuration, and the other approac=
h is to define a json file with appropriate probe in the entity-manager/con=
figurations folder so that the FruDevice and Entity Manager apps detect the=
 devices as per the probe and create the matching dbus objects, while the d=
bus-sensors do the instrumentation.  With entity manager approach I underst=
and that the i2c devices are created/probed when they are detected.  My que=
stions is we don't need the device defined in the device tree file if I go =
by this approach? I understand that this helps the dynamic detection of the=
 FRU.  Also we have LM73, and other temp sensor TMP431c that is not defined=
 in the FruDevice record map.  Next question is do I need to add support fo=
r the LM73 tmp75MP431C and other one in the FruDevice so that it gets creat=
ed properly? Can I use any existing strings/mapping for these sensors?  Thi=
s is not needed if I define the entries in the device tree, and integrate w=
ith hwmon I have everything needed.  I see that hwmon and FruDevice/Entity =
Manager/dbus-sensors provide similar functionality.  Can I have both of the=
se services running at the same time on the BMC? Will it cause any conflict=
s?  Please help me understand.

Thank you,
Mahesh

--_000_SA1PR17MB4593FB6D4BD9F4517F3333DE96219SA1PR17MB4593namp_
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
<p class=3D"MsoNormal">Hello, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to define temperature sensors, fans and PSUs =
for our new platform.&nbsp; Going through the documentation and sources, &n=
bsp;I understand that there are two approaches.&nbsp; One is to define them=
 with the same i2c path as mentioned in the device
 tree as part of the hwmon configuration, and the other approach is to defi=
ne a json file with appropriate probe in the entity-manager/configurations =
folder so that the FruDevice and Entity Manager apps detect the devices as =
per the probe and create the matching
 dbus objects, while the dbus-sensors do the instrumentation.&nbsp; With en=
tity manager approach I understand that the i2c devices are created/probed =
when they are detected.&nbsp; My questions is we don&#8217;t need the devic=
e defined in the device tree file if I go by this
 approach? I understand that this helps the dynamic detection of the FRU.&n=
bsp; Also we have LM73, and other temp sensor TMP431c that is not defined i=
n the FruDevice record map.&nbsp; Next question is do I need to add support=
 for the LM73 tmp75MP431C and other one in
 the FruDevice so that it gets created properly? Can I use any existing str=
ings/mapping for these sensors? &nbsp;This is not needed if I define the en=
tries in the device tree, and integrate with hwmon I have everything needed=
.&nbsp; I see that hwmon and FruDevice/Entity
 Manager/dbus-sensors provide similar functionality.&nbsp; Can I have both =
of these services running at the same time on the BMC? Will it cause any co=
nflicts? &nbsp;Please help me understand.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <o:p></o:p></p>
<p class=3D"MsoNormal">Mahesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_SA1PR17MB4593FB6D4BD9F4517F3333DE96219SA1PR17MB4593namp_--
