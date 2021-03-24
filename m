Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FE3485DD
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 01:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5QwB1PnZz30KR
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 11:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=lauwsMvb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=prashanth.giri@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=lauwsMvb; dkim-atps=neutral
X-Greylist: delayed 12631 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 11:29:15 AEDT
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5Qvv3ljfz301j
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 11:29:13 +1100 (AEDT)
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OKqR6g012158
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=smtpout1;
 bh=nv2pwuca64DhDu+OY3r8ZYnL+s9vdRU6iuQSUPC1Lpk=;
 b=lauwsMvbXX8rwFwQ0PUKNlBGfhgYJEqMuj0LGVNkm+v7RJJl149OIrWlV0pw9OV56Pk5
 DNI00YYXOl+9fUxRXz/jXMgpN5jIRZGLl40feKDyIwx58j0U9URNej0iwkv40cEunSjL
 eR5ydXZ/4QPjfQUphp3XnRkpmMxJooryrokAg4uZcCPcIpMaSKJEMv9UbyVlxbyXRoTW
 fuuVSGvlB9oH5zgyrq2CEgGwXPL8QDo6hrnSO94Y0U7mMJBOIiwnCSGxAj97G767PXIN
 pW2ZBFljcNTzTyvYrflR9TcoepSsxQ+TS/rT8yBSTub3jir7UoFTJVg3EQifo7Ce3zzg 6Q== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 37dcchfp2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:58:38 -0400
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OKt1FW016033
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:58:37 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0b-00154901.pphosted.com with ESMTP id 37dxcafhqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:58:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFjia1yrQlkq6wDirR5Q2Kiyiep0BlTOLDNmQgvAzfvTN4P82h+o6UT08FG5v/hfVEuke/st9zWSzamUpUgFHVMxmsZ6ITRPtux8y291O0M//zmUz3Sg7MPNWRLoE3KZgnwoaCQ70r/W1NyOPCu4X3umwKZThzMlPqqTnn5t0YlTm+xWzcr5IyRICGWYhp9fwhYr76hjxZl643nIqaG4fi/VDw2zCDW4Kbtv3Tp1DWmYH3syJjMudbdShP7dYOmRlCfHSAfCSAr3aNgFvKhqaO45nmHWEnV4laMP29Ws3+lndN9F3AmQ05m/T4bM6J2nEcCnyyuCn6XDNHLuaV6Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv2pwuca64DhDu+OY3r8ZYnL+s9vdRU6iuQSUPC1Lpk=;
 b=a2lwYQtbK65/32HdQqnK/kQ7Yb4Hyb08Y2PLw6h+/Kscku3TCQ0w0KUhVWty/xGq6J10COWtzPbrB3ESeaYreL7CBN94Go3Ed9TgOJej1GQlEX0I/Rf1nqyV7hPY+NUyr7nYlIGt9Hv8jdDrxHPTJyqrzz+pw/zTuDJVDvX0NWwr+UTOo9Ss+8wqjPgSBWs5nWcNx9BHyQQhAVo+uuYG+JUuV2iXrOMbQi01JRmYME5qYeweFgUveSQcwj0FRnovGMWRiw4qu3thmrf1/eX3ZN4/gPvgGLXkxj3OZ1fn08zttbiGnuspumJ+omQtah/8kZyTuKxBO+YgTzmrNlgnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3417.namprd19.prod.outlook.com (2603:10b6:5:18d::30)
 by DM6PR19MB3738.namprd19.prod.outlook.com (2603:10b6:5:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 20:58:27 +0000
Received: from DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3]) by DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:58:26 +0000
From: "Giri, Prashanth" <Prashanth.Giri@dell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: License of generated code by sdbus++
Thread-Topic: License of generated code by sdbus++
Thread-Index: Adcg8CNwtb6flRC2TFKefB3mCSU/7A==
Date: Wed, 24 Mar 2021 20:58:26 +0000
Message-ID: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prashanth_Giri@Dell.com; 
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-24T20:54:59.6244127Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=76f77ab5-9071-418b-864c-bf8d853fc29c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [65.36.111.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3134d02e-0b02-44ac-1aea-08d8ef0791f4
x-ms-traffictypediagnostic: DM6PR19MB3738:
x-microsoft-antispam-prvs: <DM6PR19MB3738143D04416189EEC49AE795639@DM6PR19MB3738.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yoKlfQ20uJ92L0Cove2P9UBqhSu0w20D52Faxl1oT9GVVyjLTQRe5Kpk/B0FpZ3uQMuzwOaEa8Y5ElcT5Yi/UZxSH8GNj8EvS+YMsgC+let/JNp4CHckWgaHECDyhT4P+GdDTtxRXGrZn4jUO+4p2YRt/uPTSPeN6ik/doL/i+46/REDmq/9NkBC33CWQ7bnnPSCWrDE4DambiHWWD05jMlfcrIG4irBWpkJz9htxrk//pZ3vvCffo2EKPpisfHdEYmZmbtE8SlsQnOWbsNusnh6fHcLShR1qS9l/o53MHin5DbIi59F1jasjHiQ/qeU8ZleBztC3OY4zsm4uCpXdwwdHAhCMN3NF27Em6crAFUV0+wOdVbMIXcqShnodz2CvRG+yw1t1uMlK9jZ+GEEYSQF0l0iNUGUlFy6EbfL4Qs98oEV1X66LE2IWZ/DmFsTx42Lfl2NIcRUDgDpJ8AQ6Z8J0ktxpTCI2VgIE7mHC8wvd7s234G9r17QhWjiG6C9JgaMSPhJ/wWUZc4kWna97lrGAMlCrYbabs5iSqZTZIjgS1GSDe/2lRLzK1QTnMvIniBmYG4gokEUNrNUQkJtkLK7JUJMDsGzxGhxMIx2IdpXPFfvYU7cNH1srIV8H0qu9/ysW8aXwwNWHlSbPR0qFeX7vZo4Q8QSOMIu3t4FCu0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3417.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(55016002)(66476007)(66556008)(316002)(83380400001)(9686003)(2906002)(6506007)(8936002)(86362001)(52536014)(6916009)(786003)(5660300002)(8676002)(478600001)(33656002)(4744005)(9326002)(76116006)(26005)(66946007)(7696005)(71200400001)(66446008)(64756008)(38100700001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+0aVVORJ9cX+HT4rWd1nTWkkeWwyq/3GkGgwZcTHurpt/PVckYaZntA/5V1U?=
 =?us-ascii?Q?8tyq5gntES4K+oV/4bJgSKO4WpQUQYWI5Alznqdk94ZKJMF84JxrO/8esK9i?=
 =?us-ascii?Q?uALRwfpkrpRKq5hFbfn2ChVWelqvUis7fJlKmgnxuN4F4fMN13yJ9wSJ0KzH?=
 =?us-ascii?Q?prC+RV9IZ+PKoSnt8Qph7U8+CdtdmMXbeeX2sywD2PmondLflh13qwSfwQb6?=
 =?us-ascii?Q?YwojuCoOTIibYIywGvq0Gb3PcY1gReVEseg3kQlLxB7WZUdFurHeVVdi+lpT?=
 =?us-ascii?Q?AL6++CnCMNu2Yc36VfZT1rxHl0TH3erYRkkrzj/T/ib1fYhz5CvSprPRiSC8?=
 =?us-ascii?Q?0jUGuq2BIv1KRwn51qtJrEMtNwWhOhD9EEI9UTuqFe8DIUqCW/3GGLd23h2i?=
 =?us-ascii?Q?mJQYiw0q/TEir6Y4XbrsVoPP+ZTBZZZnzJhq1c+usKw75yk0icqK7aZ3/qLd?=
 =?us-ascii?Q?NDws1cFgbdAHaRw5dSYkblNePREfjfoiMpH6ex1sUQKoYDVH0EgUnkJTEpWe?=
 =?us-ascii?Q?TxHTBqfcMmQvfubYLWyHDVPxDurxynEAWx2muxGRVuwkx4b8M0QMB78ZVt8D?=
 =?us-ascii?Q?GQfJh20EmgqyTnVtYJRD3Jv1uyBbeCQDHpS1ZKhoI6FVSOmRVyobhF1zBL9l?=
 =?us-ascii?Q?pxN3r6cHTj5lvd+ybuMKGg7MBTLCVpYfOHzoJP1/XWDRalQcXINgQEuGKmOe?=
 =?us-ascii?Q?jSi9LTNAIZuexmpWQSsDG9goQxsn4xfF4WM55z+lFHra5hMhbrayOAsZhLi3?=
 =?us-ascii?Q?GvMV/JD7m+FDHups+lxV8yezVNG7t0SyiMaDWTsvQQF4kMl4FyCFWHuq551n?=
 =?us-ascii?Q?zkM9Mz/g5TUMMqAplBmJgZGeGzauBJX2TSp+g4RROyqmDSCe53dGEIObWE0i?=
 =?us-ascii?Q?Du6H5RsgLAnYqE1U8UD0IW0eUn/wPVpSWE4hHg706/5Irfk/HuxEvvx4KEjO?=
 =?us-ascii?Q?R/LVbVXQpxziqGeVgy9aoNQYLE0VxM5MBYN5lyhPbWZ/IR4UVk3Vtr35Pdcs?=
 =?us-ascii?Q?uHc3cN+JLcDnex3ZMH16eIVwf6K3k9J1LmO4KyBhN9+5PCmhFppxgrE3oYlA?=
 =?us-ascii?Q?msZIYfLL4ARnKlnTGwQQzXHLfeayqB31ijPHB6wQnjU3x+pr7/E+Izg/xY+l?=
 =?us-ascii?Q?ROgSRpim1Cv4LQKgXgIWHKWBZ0eoexx/MOGLNMvGknxpGiZvPgQexk1JYY1U?=
 =?us-ascii?Q?2kkgMKZJhWBaxmBdlMwgrGrzecV+1+WCwoWc9gFcesqbfAwbIOHk25dj+SDh?=
 =?us-ascii?Q?+KlL0iM+pmeN0IAtLCEppGp+I1yaL+qq05LLCEtV2ACddk4HLb2V7T+KORcY?=
 =?us-ascii?Q?tS4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR19MB34172FAC6C40C87026A7C68495639DM6PR19MB3417namp_"
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3417.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3134d02e-0b02-44ac-1aea-08d8ef0791f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 20:58:26.4119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/8VIhCRVrsJScT1oBYg6SWkW4jwvcb6UEtKU3fE9IJavLC33qStPJrQCHK0SGEb1GpJ4t/yNZpI+vVrYi9c9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3738
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240152
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

--_000_DM6PR19MB34172FAC6C40C87026A7C68495639DM6PR19MB3417namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I see the sdbusplus library repo itself is Apache Licensed. Am wondering if=
 the auto generated code from sdbus++ is also Apache ?  Did not find any sp=
ecial wording on the generated code in the license file in the repository.
Is it safe to mix the generated code with closed (proprietary) sources ?

Please advise.

Thanks in advance,

--Prashanth

--_000_DM6PR19MB34172FAC6C40C87026A7C68495639DM6PR19MB3417namp_
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
<p class=3D"MsoNormal">I see the sdbusplus library repo itself is Apache Li=
censed. Am wondering if the auto generated code from sdbus++ is also Apache=
 ? &nbsp;Did not find any special wording on the generated code in the lice=
nse file in the repository.<o:p></o:p></p>
<p class=3D"MsoNormal">Is it safe to mix the generated code with closed (pr=
oprietary) sources ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please advise.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--Prashanth<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR19MB34172FAC6C40C87026A7C68495639DM6PR19MB3417namp_--
