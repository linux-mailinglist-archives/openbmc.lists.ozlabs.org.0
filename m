Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A43B2389
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 00:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Hn64mRkz30Cn
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 08:22:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YWeV3lSX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.103;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YWeV3lSX; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2103.outbound.protection.outlook.com [40.107.101.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8yFB3mMZz2xvP
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 19:11:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtrfFk9CUTD2cdO5CYSW0Opec7tLFoHLAjn71runxOODgpR8LevSo6p6iBGI5aQcMROogZpY1z9dVZcuq8vGBahABSDxivFnTlHtcXPvdnLwL/TLfYeLrQCDJaMD95DU7nWCb94OiNHO550bSr+zjhRhs/HRtm0zApfFJKcKffxlP6zK4PUn8boVkVg+j8kVTohQHdaXHkkK6+cjJTCwHcrJVU3KXf+fGx8WsUjpj5KINkby8YP5Q0/iCccfyehIMpIi4qYKPqA9qxA7KEfo0bmoIpPZ9ewO6SJ3maV2Ih0jSp9thjpoo25qYckmdR+3bFtrvyFocJdyT6u2Bn/KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKd8o0Uu7QUdCqxN86o59zJKl4DkpR5ITr3BNIvBnEA=;
 b=E3kuSNe4iUIEK0aB3ngM9Hpi6tIqjZUs/cod5VjeopYQnhCPSXI8ongIumRAC4OF/QMjKpy/skaIk1Z7bA54yp4Cc2DUrFP3gjyELSePE88eZutE+ISCwqjDZyzDrwOcwQIDErGf+VLuhn8ulI668B39lDTvYmv1jaF+jjC3mbK1CmymVkTLWiPdSx8MXQHS2r4twgTWHGEYN+ZTbXVvUNHzg5Pt5VMGCTb3hVFVMzn/gKRogCi4eR3sGNDA+NiJNLVZwUWef3QvtIkPZHijiZkrE6gd+rUgjqq45uM6FcZdh9IT9GUebUTa2NmgRr8Z/GedcWo9J/a6Mc76/YWctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKd8o0Uu7QUdCqxN86o59zJKl4DkpR5ITr3BNIvBnEA=;
 b=YWeV3lSXrvDkUGoA2TtdbYLcicj7nxx96p8jYr5xDeiCts7SQ9ojtOEHO+FeJA3tx91zCrpdUlO3S8PVKEyFcQ6zbFAboI3wIsHeYYgYwnrJ+1NX2B30BqBbcc0ucmghp+/v/aexfZdZi4kCSD0Mim9qi3z0DRE3pVFo7Irmg7s=
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 SN6PR01MB4286.prod.exchangelabs.com (2603:10b6:805:ae::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.23; Wed, 23 Jun 2021 09:11:31 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::dcda:7e10:9eb9:490a]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::dcda:7e10:9eb9:490a%5]) with mapi id 15.20.4264.019; Wed, 23 Jun 2021
 09:11:30 +0000
From: Chanh Nguyen OS <chanh@os.amperecomputing.com>
To: "bjwyman@gmail.com" <bjwyman@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: [Phosphor-power] psu-ng: Add method to get PSU conf from D-Bus.
Thread-Topic: [Phosphor-power] psu-ng: Add method to get PSU conf from D-Bus.
Thread-Index: AQHXaAtSaiMSW5wbfkSg3pOz4C+znA==
Date: Wed, 23 Jun 2021 09:11:30 +0000
Message-ID: <SN6PR01MB4973940AAE8F62B61613C2BB95089@SN6PR01MB4973.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2001:ee0:191:e3ae:3888:f67:2229:3bbd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8108b4f2-6529-40b3-5954-08d93626e3ec
x-ms-traffictypediagnostic: SN6PR01MB4286:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR01MB4286BDD2CF75F30F9A957EAE95089@SN6PR01MB4286.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d21a/X1Mimu6hMEHbvdxPkDYKenzdDNBjQVnBt89ucL095L6aDBnBySj50COpy8h78cRxZDBrppHypxqoOm5hfzn33lK358beOpUoRz4WeyBhwrqV/ySsuvYTMFQHGMjTpr4x62o4DM4wN9LCxyItCXVHf2+qwcw8vDEZV4W/MO2u6yrkf5pj/ioVMsvBck/IIEy6VQcppOpIBiU4nLyyjdQL1hasAJPdSWAJez0MM4RJ0u7RUiRpPgbVB7lr62M11vUcMm5lCqzWzkSA7QNmHjCmpCmOhijppWCIaJ0EyiVPRsOmvcTtmeozfA7skn7MMOQ8/vqGl2TqO/+qNiIpzzW390QNFMLsVlC/m7lu5OiBJYJxE1/eemmPnx/dUbdHNJDD/30U3TdC3UuQYjNfzTWqpn2rszK/oCOyIigrUoMCnUC/ETiFFw9l3tpoMw5SqxR1PgyGpZ6pWo9kzXB67EnUSor03TuLTDW5WqKPZu1EerPnobPw6vauRQnyx97nQBGCX/TrM0/+OVFptQcZgW+piE5HueBZzspx6IvGxnkQdm53FCgH/GLZzK1HUBFw6le81uVv/ESZv01cC1f2LgIIeshKJQYCyhbqKqUfUGuY+ld1BsPoQCCAA8+5GNaNumvxY48P8N/SPRWvHoQkm0d8MOMMmCnTZ5zSfnMb1/xUwqRUkDDqLYEBfRocM1+COBjBLpxwlobjtc3GCgFvYWvQmbprERqUphKaEHcFULEzH77M+Peqk3MscV5NJyL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4973.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39830400003)(346002)(376002)(8936002)(7696005)(4744005)(66556008)(19627405001)(66946007)(76116006)(186003)(6506007)(52536014)(66476007)(64756008)(66446008)(478600001)(5660300002)(91956017)(71200400001)(38100700002)(166002)(4326008)(122000001)(8676002)(86362001)(33656002)(2906002)(316002)(9686003)(110136005)(55016002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aLD3JA7nBrcnPhj4rd5REa5X0Y8nxprTOjn/Q91vdvoIZQMe9zke1IGRxD?=
 =?iso-8859-1?Q?qwU42gnw16Xh0jdssCoyoE+6mlLRTzW7OZ8kMKSigsyJ4EkedblGYNKC6o?=
 =?iso-8859-1?Q?jr17Npx0zYyZl7t/UjsUnkQ52p8zixds0oJf5/XsYIMjWwRY843w25duRi?=
 =?iso-8859-1?Q?i0cYhrOcfO3tdX356hRSzVJRS94bNGAOMWTVAEyb3l8rrjt6JN6rfJtlVG?=
 =?iso-8859-1?Q?Qy0ezCoUnXPsIgNQsTEFa5VebfKv4V7hilmHaKDBkA8/7jLca5S6wSGa6d?=
 =?iso-8859-1?Q?3jM9M19XA1C8WLIPTgbyiOkhqABMuLemuVFDqwFcL9pnU0rYUdF4lPHL3V?=
 =?iso-8859-1?Q?AfKCUg4T2ZWKFFlu0JRkqFkfWf0pPy3g1SC2R04WBASKwKib6a9Y8NKy5E?=
 =?iso-8859-1?Q?AZIREB49OHh7uWSJOf4230iygx3TOBFAKg/CFxpFB+G5sx0GVjJmsXMQzE?=
 =?iso-8859-1?Q?nYnAAdVPsokrDpuqlcFW6icvWsgjUKRKnBMfFEMhXwff0fARbakaOQA5ho?=
 =?iso-8859-1?Q?D7SqgYsiZxWu2St/NxSyavhQTgtvAe6oYu0CSuPN+hChwvYi7xi5v3DzrK?=
 =?iso-8859-1?Q?JNqg7KyhBjKBOQ0jw7XBncKq0CcxzGwX+lPVIqLKpjCrdcbdMa9JDfnzvY?=
 =?iso-8859-1?Q?LrE/CmSBW1+eIgKOzaphZJcvOX3HC9nIOCU7X8tuOXMcWs7ZJpZipEWypy?=
 =?iso-8859-1?Q?W7DVV7deGX3MRFFCIJGzsxQkzIqoG77m/+FgH84PsVUtRx8hNCbESusTe7?=
 =?iso-8859-1?Q?emOQiMRx6kNxRos1ps7bqg8+utwB+lS9yAlHvFTyl+vY7N72dlkQNaLuk6?=
 =?iso-8859-1?Q?ZmSofjMkLEbK2Ts4N19xYUH43KfYbE1kNKi5FYLm2hLbnBwVB9ggSHDkoq?=
 =?iso-8859-1?Q?DiPYR2aKs81elmRp7dL3BfWtQTIN/BW7CfvLS6eugEBsHC6Kfjc1pHWsFq?=
 =?iso-8859-1?Q?aJud9fAc694dC7hpWV3NHkENTEmQQKnjZfOdg/2PfWlmiJifllkhCaEl9X?=
 =?iso-8859-1?Q?rNPQ9PwtdwX6V7bSvV294VdOF68uK47bcIHSo0ZqMnTctF+GWD+dcs0iue?=
 =?iso-8859-1?Q?iDoOBJqxERCtnpb899l8Xj2rmpqpFk7Gxwal3lIaFO5ifir47SqlgfMbxT?=
 =?iso-8859-1?Q?g6s5stgOSycQfKEWuZx1uIycPfxMhwx5D5gAqX4KIUNiUO10LaEm8rBjD3?=
 =?iso-8859-1?Q?Gumd8sgjDXXSCV6u1DICyYOlKEbqr7/2Jr3CtoVwPYQd/+piJweZbbMh1l?=
 =?iso-8859-1?Q?vyOIcU+j94/+MtXTDBUKpB8MrzvScsf8m35/kJ2CeBRv5TxRX0S7IFfyOm?=
 =?iso-8859-1?Q?YR0t4CnMOiY/lHPoJAR0c7A6t/gX/BXtKFyJbxZL5gySDEfrGLQXj28Kec?=
 =?iso-8859-1?Q?/TCnDInt1Zz+JneNmONXZWX0gOnwfyHeiDCvQd0/XY2WscxNitPt0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR01MB4973940AAE8F62B61613C2BB95089SN6PR01MB4973prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8108b4f2-6529-40b3-5954-08d93626e3ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 09:11:30.6842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +in/manYZJBNdDAUJ0qVGPKBh8gAnf8U7mTR+k5OtZkJZ8/ahzO4T/MmA3gwpSwbeog63LIo/oOWZqHmueb6J5E3yRf/wnZkCksypksU5Va+tC0Qin0A574gNiSCc68j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4286
X-Mailman-Approved-At: Thu, 24 Jun 2021 08:21:48 +1000
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
Cc: "spinler@us.ibm.com" <spinler@us.ibm.com>,
 Thang Nguyen <thangqn@amperecomputing.com>,
 "shawnmm@us.ibm.com" <shawnmm@us.ibm.com>, Phong Vo <pvo@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR01MB4973940AAE8F62B61613C2BB95089SN6PR01MB4973prod_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi B. J. Wyman,

I'm using the psu-ng to monitor the PSU. I used the pmbus (https://github.c=
om/openbmc/linux/blob/dev-5.10/Documentation/hwmon/pmbus.rst) driver to sup=
port hardware monitoring for the PSU, don't use the ibm-cffps driver (https=
://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-cffps.rst=
)

I don't clear why we fix to use the IBMCFFPSInterface (https://gerrit.openb=
mc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/ps=
u_manager.cpp#16) ?

Thanks,
Chanh Nguyen


--_000_SN6PR01MB4973940AAE8F62B61613C2BB95089SN6PR01MB4973prod_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi&nbsp;<span style=3D"color: rgb(33, 33, 33); font-family: var(--header-fo=
nt-family); font-size: var(--font-size-h3); font-weight: var(--font-weight-=
h3);">B. J. Wyman,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(33, 33, 33); font-family: var(--header-font-famil=
y); font-size: var(--font-size-h3); font-weight: var(--font-weight-h3);"><b=
r>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(33, 33, 33); font-family: var(--header-font-famil=
y); font-size: var(--font-size-h3); font-weight: var(--font-weight-h3);">I'=
m using the psu-ng to monitor the PSU. I used the
</span><span style=3D"color: rgb(33, 33, 33); font-family: var(--header-fon=
t-family); font-size: var(--font-size-h3);"><b><i>pmbus</i></b></span><span=
 style=3D"color: rgb(33, 33, 33); font-family: var(--header-font-family); f=
ont-size: var(--font-size-h3);"><span style=3D"font-weight: var(--font-weig=
ht-h3);">
 (</span><a href=3D"https://github.com/openbmc/linux/blob/dev-5.10/Document=
ation/hwmon/pmbus.rst" id=3D"LPlnk" style=3D"font-weight: var(--font-weight=
-h3);">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/p=
mbus.rst</a><span style=3D"font-weight: var(--font-weight-h3);">)
 driver to&nbsp;</span><span style=3D"color: rgb(36, 41, 46); font-family: =
-apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-seri=
f, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; background-co=
lor: rgb(255, 255, 255); display: inline !important;"><span style=3D"font-w=
eight: var(--font-weight-h3);">support
 hardware monitoring for the PSU, don't use the </span><b><i>ibm-cffps</i><=
/b><span style=3D"font-weight: var(--font-weight-h3);"> driver (</span><a h=
ref=3D"https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/i=
bm-cffps.rst" id=3D"LPlnk396586" style=3D"font-weight: var(--font-weight-h3=
);">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-=
cffps.rst</a><span style=3D"font-weight: var(--font-weight-h3);">)</span></=
span></span></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I don't clear why we fix to use the&nbsp;<b>IBMCFFPSInterface (<a href=3D"h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosp=
hor-power-supply/psu_manager.cpp#16" id=3D"LPlnk923907">https://gerrit.open=
bmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/p=
su_manager.cpp#16</a>)</b>&nbsp;?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chanh Nguyen</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_SN6PR01MB4973940AAE8F62B61613C2BB95089SN6PR01MB4973prod_--
