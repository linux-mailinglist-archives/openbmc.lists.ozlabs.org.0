Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB826396C
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 02:17:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmzwM5XZvzDqZ3
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 10:17:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0520f53b0d=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=dH05iEnd; dkim-atps=neutral
X-Greylist: delayed 2103 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Sep 2020 08:57:46 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmLCG6xtDzDqRW
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 08:57:44 +1000 (AEST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088MLgpK007785; Tue, 8 Sep 2020 22:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=Ra+GN8X1HIXO7yFIGrXXlyWZ9pEI/f03VeKMQYfrzsg=;
 b=dH05iEndPWwvxbVOkEPBZqxVjona0pTRtN8Pg+Iibc3jSpsDKo1vEscICHRdabd+d00p
 oxRICxk0je7+WE1VigjIPm9G4Q/flBZs5ridLar+gBZCSXtyJHfR9R0su4kYTDEbcEIJ
 OhhQB6j+qB6bGJsqJPFbwXrrYp2ldh+9Q7PsKorO+ImIRBrwgnodTitGIHemV3P1Kg7l
 SO8XuFWj1xhP9rsEjCKHYO5cSDex4/nxVG+YbWLu6duo0OKRy7xuAtGaiXL/oscFnqHD
 RQPlqGoQ4LU327N87UiWkuq3qwRK/q4bG+KOQC8kvsOSsnknVljsq9OywsI06Njv6c/l 9w== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 33cmd5edkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 22:22:35 +0000
Received: from G1W8107.americas.hpqcorp.net (g1w8107.austin.hp.com
 [16.193.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 470EF74;
 Tue,  8 Sep 2020 22:22:34 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 22:22:34 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 8 Sep 2020 22:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVfyMUiqPAu2CrPYduz25FRYfLfKZONqAwNKIoRDURpmQjKYnFhNqIhLjQWcYfgHqJaRHpV2iFv6osHuXebWgXPSVXh4pcoisqXExJH6xV+wpvQwtbiLdhGqNWDNIAC/AnCrAb19B2dWVz+jro7FSPmi0W3H5AINa5EIstC9W4uzQTKdKRdRoPYLHGdln4sfAgi9FayHwoSJ4Zx5bTq56g8jpQvySNGs31SuNOxWdApF0ljG+LHTqbtW+05HYxA7qkPDeI/Rs5+5k72+B0scLifX0X1AwncoJECxxxAxlYpNFLQ/XqHwGgmvCd66gyhaf2hijWRcPJ0qOZOkgYjwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVFedwUeufoXec7liZayyHANqsE0W1mdDkGx2LzHBU0=;
 b=mrFs1ycavzpL0OKK/YTCn1162k4Ig/4AAfRg571XmnnTUsHifx7LCzK9mCJ0wJuSBcw/Ab09lREtxGzcBLxgt7Yh1E8FCOACADAhdceWA5NNUyS/RJVbyRJMzEJlSv26/u7295TQy3Cd0/XsTUtUGpn14hBgiW8hQFEj7NZFbQbWbpIO+q/AHrrbthpPNq/HhlKCf5XzAbqYQcuABEnRlioJ46MOp1DjFzL/Jn0j7QbTlPcjSfxeHvffTGbPYPyTAdU650uWQySNmAkrgbzCl9fHMirJ2oZW8ncNk3tVQN+0NejyjeZk21s9AGOxUAxJLWT7BMstBax0Txz05ts0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742a::14) by AT5PR8401MB1172.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 8 Sep
 2020 22:22:33 +0000
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c]) by AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c%7]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 22:22:33 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Gunnar Mills
 <gmills@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: How to comprehensively search the OpenBMC Archives
Thread-Topic: How to comprehensively search the OpenBMC Archives
Thread-Index: AdaCT4037hVOiC8xQnSMcBhx9fHJOgDwZReAAAVb8wAAAA1MkA==
Date: Tue, 8 Sep 2020 22:22:32 +0000
Message-ID: <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
In-Reply-To: <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2001:8003:79bf:e900:4c64:b428:2252:500f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7347ad47-6711-4acf-1d1e-08d85445ae87
x-ms-traffictypediagnostic: AT5PR8401MB1172:
x-microsoft-antispam-prvs: <AT5PR8401MB11722A60AB76879ED6A2279AD8290@AT5PR8401MB1172.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DeEBCHPd5Bn1V4LLDKpSihtZurt1FzqDMRE30Fd0lPq4kX3tZ8sPP2/Y9fc6prYfurWQHQlz6LmiGfmIDUmOTEal8b0xQUjeRxdIgwt6TiIkx9DzbtB53BC697gU/vC6LimCa9YoWzEQx9IbcNvPlmJK/GQfZGpIVLr5NyiSI1SijMQ2WQTuQyesjxz09Kr/Zx/xsNzxwB0U/QeBpXLpQBeWGsSHbMXkKEH62pNBfKIluHSdADFFpw11WSOGxP0ASrwskp9b/ec+XA0LsOE5G79po+IZveZJtlBrMdwgow8U46JcY5GN35+G8kPwrGd3dWq4qLi+VhPLYp8c2DcpNucxshLrMY7hda1asX9v/ESlr5TtE7fzefAIA7TajfYsg3C6S6A1YRgdgwTr5VbbOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39860400002)(136003)(396003)(66446008)(66476007)(8676002)(966005)(2906002)(7696005)(55016002)(19627235002)(6506007)(53546011)(110136005)(83380400001)(316002)(76116006)(64756008)(86362001)(9686003)(66946007)(66556008)(478600001)(71200400001)(186003)(52536014)(8936002)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nyEPFSTOWR04t2vWGB5qD8dh4N3p9WLPf2Bs/CLhAz1KwRJ6i3HdkEkPmLfa6dJNU1ZVw5ujmErlwyz0S3hgT3HX9XOk2P8OeoSfa5acDCspO9Dc7l2Xv+LEtxZS7ltEMdAODVlPdi1w+VdtKgHD6hC39WBF2amToZScT+Vsse4soBYV/kVf3U4oSqJMayIX3EkZqKR5MFTXeNmIZERYqB9OkuZbmbayaqSM9JSoLXMn6Kv0L//FHBE4PNxBrmnafK44cnkpGNvv6BTJwVHuuHBUW8kllbLLBNN4uxgGuZaoTuGbi4dBrCvO3IoctrhyCqIIebt0HeBy42vuafqtdslUyKB4c1heYBIs5l0ioNCnaLGcb82eI2f5V1jdJXnh9oTumixNlXgTe+ib8ivLcnamrhx9SjNdVrX7/6KU9oaRLaIQWX1Y151WVMd9hrWqgFrHxT33GrpMRRcI4lNfiNvdDRyt97Gnq+vu4a7h0tZgf3X0EN07S+3/R/ZP8EThgS5ccFvyIVKG3duZGvg4WcyIonvVkSOkIxjQvYZbbiQhEbJ6IFIrFXYRVo7ht9SjO2HMDOSQ0+XkcJiwnrm/LjFY260FBKWcUyhY5E1LcYP3H08cY1H/1vxutAHiPh+AAQ2muPvaMpSgu7XD+ppJfRSIAOx+vPkJ1vTQxEkjKumV9Zv4xdOF+keeOtYrQCLb5S1ts6Xn/BnnYxiY3uA9nw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7347ad47-6711-4acf-1d1e-08d85445ae87
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 22:22:32.9802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYLBMgkdiIIYjPWZjbCHxuaoo7CzONKv7vGS0e3pPMfCpAQIjd/bJEm4L+Uku/ca8i3yzFubE8ge7mBDXYzd52vU0XmgTGPijQVzyKdMT6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB1172
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_09:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080199
X-Mailman-Approved-At: Thu, 10 Sep 2020 10:16:27 +1000
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

I am impressed Joseph!  Thank you.  That certainly highlights the lengths o=
thers have gone to for a comprehensive search feature.

There is a lot of very valuable content locked up in these archives.  I'm h=
opeful admins will agree that comprehensive searching of the archives needs=
 to be made easier and more accessible to the masses.

Matt.

> -----Original Message-----
> From: Joseph Reynolds <jrey@linux.ibm.com>
> Sent: Wednesday, 9 September 2020 7:25 AM
> To: Gunnar Mills <gmills@linux.vnet.ibm.com>; Muggeridge, Matt
> <matt.muggeridge2@hpe.com>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>
> Subject: Re: How to comprehensively search the OpenBMC Archives
>=20
> On 9/8/20 1:51 PM, Gunnar Mills wrote:
> > On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
> >>
> >> Is there a more comprehensive/reliable way to search through these
> >> mamil archives?
> >>
>=20
> I used the following (bash) script to download the entire openbmc email
> archive to my workstation's storage.=A0 (And then I use my local search
> capability (grep,=A0 spotlight search, Windows-f, etc.) to locate the des=
ired
> content.
>=20
> - Joseph
>=20
> wget --no-check-certificate
> INVALID URI REMOVED
> 3A__lists.ozlabs.org_pipermail_openbmc&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> OhYZN2fNFoROxHeM&s=3DoUgen4rG7u90Uby5812hA_y0dDnG41oD1ZuA4K7K
> NiU&e=3D
> set -x
> for f in $(grep '<td>.*.txt.gz' index.html | cut -d\" -f2); do
>  =A0 wget --no-check-certificate
> INVALID URI REMOVED
> 3A__lists.ozlabs.org_pipermail_openbmc_-24f&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> OhYZN2fNFoROxHeM&s=3DAVV8sFghgocf1nC9Vf7UGQtg9m1A63Yeux7DAywt
> cRs&e=3D
>  =A0 gunzip "$f"
> done
>=20
>=20
> > +1. Could we look at moving to Mailman v3 and like
> > INVALID URI REMOVED
> 3A__docs.mailman3.org_projects_hyperkitty_en_latest_&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> OhYZN2fNFoROxHeM&s=3DHWwrQzEzVNtANfa8DBfvdGnK_2nRlSp-
> peNmEl1y6n0&e=3D  ?
> >
> >
> >> I have been using google to search the archives, but have noticed the
> >> results are not complete.
> >>
> >>
> >

