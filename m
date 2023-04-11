Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D16DE6A8
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 23:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwzvp4Wggz3cdD
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 07:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ZK0Wz32K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=0465b6211c=bradley.tanner@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ZK0Wz32K;
	dkim-atps=neutral
X-Greylist: delayed 700 seconds by postgrey-1.36 at boromir; Wed, 12 Apr 2023 07:36:25 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwzgF02bvz3bhZ
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 07:36:23 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BI36WN020364
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 21:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=efO6uPuoLQFy/50fVIjRiYxAxixFwFLOZI8jy8bSPqk=;
 b=ZK0Wz32Kzrf9MCJuzLIVXJqcPJlHEQJjCSrG/g1fbmAZzfrfdXlCHCe9U5WEhpC0UU2Y
 +aLbrxYOnJ0j9BuSrO0gOO6ROYrC7CwjZgM5rIqZXnhYlak8rilWdP7sGbgQOOzzKrn0
 gwc3w3mMQHsZ0MetN00OzryN2QBM/z2Q6umjAHTxnEDgvAn8yxsYSOdRhBqQ8rn8JQSq
 51RebtCyqPspQZvoSnPPiJRgmAITletkl9aHucOoklJRxmqMwHAmw0QIk28O0AVqHDuj
 ZDh16FJif8NYwYW1cikCvUhAPZMFu/5COLCLh3vDq6HadFuHCdBuPbqnioAsHWLIcUiN 5g== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3pwcfwsjv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 21:24:39 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 852901305A
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 21:24:38 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 09:24:38 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 09:24:37 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Tue, 11 Apr 2023 09:24:37 -1200
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 09:24:37 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko9cZ0kr2XVQxjTDO7+YfFfyOjTMGkq5ScuW5udebSJhoNlQWmoyVDwi6Ouham76i8EI5trBMRVWvGtsOVJ6Eps7StORIQwCwDZ0LpYSWYUW2e3THMiikzSEwCVdJrU1N08Xe+Lcl10uN7D7+fXGTnRgP8kN6G7/rYq8y4v7tR0HW7qyOE5ON60Bda7lu3co7DP5z+6sHjwQ33dRXJ6dZkDj6pPruTczadQIYRADwlqr5WC5RvHCTj1t4xoc8REQEwOI0ROLzw4X40nZJzlUaJUrSO2+8dKurW5nG6A/bpkI3RnkWsxSH43U9XCX4aLfitPhOLm9hPjGGQsotB8EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efO6uPuoLQFy/50fVIjRiYxAxixFwFLOZI8jy8bSPqk=;
 b=SxHpI6cD8M/+3mAyEteRWidrbeLqlX66UA8k1t+myz2U6GuJxyDDuvOtoCG5ckcw+vmwBkqVQN7zURMhno+hnnqAhpNHJJD3H2WQ6OGx29zT9ug2WuVoKe0iQS+FEK7q34hk5W6h84+IjUhorS9QYxkdlo1VyXfFo9iiMTG2gUEtBHr0q+FRNk/u9BbbPbS/fT/E8Ao/XclS2xSuEs5eSUPle4L0tltUjWrneFPupkGX/K4VH/WJhViadGO2qKjlQdZ7lBBVxeE+51ns+8U5WW0taw5FP/AaoQfbrw0luUxwMmK24557y5pykaAeop3qtKzycfrDmfpHTL4D1jKsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4c::21) by
 MW5PR84MB3273.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1cb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Tue, 11 Apr 2023 21:24:36 +0000
Received: from DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::bec0:dcc0:6d8e:2033]) by DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::bec0:dcc0:6d8e:2033%5]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 21:24:35 +0000
From: "Tanner, Brad (EXL Ft Collins)" <bradley.tanner@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: GetConnectionUnixUser
Thread-Topic: GetConnectionUnixUser
Thread-Index: Adlsu4wSycyMQTZJRbWmJh0VOQxweQ==
Date: Tue, 11 Apr 2023 21:24:35 +0000
Message-ID: <DM4PR84MB18298F75FC611301D02500A8819A9@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1829:EE_|MW5PR84MB3273:EE_
x-ms-office365-filtering-correlation-id: 88351388-35a6-4677-02a5-08db3ad3264c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SlC823HG7R5aBnQibUfKSCGdmDrgOY4BKXMtf23OWB1vMyusKxTtmaSMVHY4pl8V9WBEyD97uJ4AFFrUBEH0nPI0q5GDSDi1yoDQ3aIkFdu26AtVK88OwrdcGmxyQS8EJ4xgthWJm+XJJd9vKEZu1UNDyp4fi2QvRRgTiW5nuePKT+kgWrO9VdXWGCuWjaWihgR78pEgJf2BigJJmHhddQpjF+NXaAk/7Nk8ZEiker5TqP6T3U/QYdNk5CongOqSvgnv6r3BuWRZ0D6GycgBFlClNqSc6L0KguecCHldvNppDGDGtjhw2CNaToJCbQu2h2hTrQQ1p7DzcLU6esqq1h6pcldyDIx8SbsPLO2P0OQ9iPcIgMhD00BHwnn8nQSRMt5FJbIYrmnDglICRkfp5JS2C9mNe8EfbKO2YQ8ZtgBaGn0zLzD9+6epCGf51JEkLwG5zMMtGiMwIcmtuzeRBlNYLnGbFXz+fj/aG5ESlw+OTxE+XJNGy7c+udZ+4g5SqdrdX58XVzcit5ws4hxzX2MxwRmwFqeHo2TLjJICacF2kSdn5iPvht/ug8i8BwMPt58bnOF0woJS48Z6JruVW/rpR9KcWzF2olm9q+wuR2af0p376cVlkBKLUJClqKIccW+5LQvy7+in6r7zRHWaEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(33656002)(86362001)(7696005)(41300700001)(76116006)(316002)(478600001)(6916009)(71200400001)(64756008)(66476007)(66556008)(66946007)(8676002)(66446008)(82960400001)(55016003)(5660300002)(2906002)(8936002)(7116003)(38070700005)(3480700007)(52536014)(38100700002)(122000001)(186003)(6506007)(26005)(9686003)(83380400001)(132573001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CjW7ls//JV38d1Js/KqJ4SfEO7BjeVIuFRzTxFpWz7ibVzt5uLTPZVfigzJa?=
 =?us-ascii?Q?poDukdWWTLkv68+MPTF0S2IUnIA83p6yzfomSI+kZFUeH4YYoJd4SzpKeJeE?=
 =?us-ascii?Q?xjoei1n/hiM3y9Jp8JqD/rHh0TZW3gJi1J+q940kjdfvg88VtZq2E2oIdnVj?=
 =?us-ascii?Q?85kqp/9PMrT5P6t6R8a0ypYWexXBN9VBY9HVXweygJN3GaZw7Ue0AKSeTGe7?=
 =?us-ascii?Q?jC1PS3U+IOATzwDBKI/XCV8X6MuxB+vZIq16TBTgWbZOKc7NgZlZOdpz2r96?=
 =?us-ascii?Q?GQS3goNsWm9SyNu0IxYVKYg6lIQgOvqXAfjWE+9eZfBNKzdJhP41/O6OKYPN?=
 =?us-ascii?Q?ka1gGNA/dN3Hvwld0ELQcqyn/rmNnXjqAhAKhOICmoacwRkxtyxy6vRUP9hR?=
 =?us-ascii?Q?BsMIn0hC/Q+IVeFyI6hwsYoewtJ+pquAiNzAi4fxYJ7amEyAFlCYM7hqVJi7?=
 =?us-ascii?Q?kkD9A56jpoctUOtgB3NbPb4IRgegnGeBDvzhHO2Dz4jlpkw/N9iWhS8WGnim?=
 =?us-ascii?Q?6rvc8EMhs76c4RQ6uYGsyQNvnHCGLncXTci9l5OgRNO5tDYZhUBqMan8BqTU?=
 =?us-ascii?Q?7Dd6IO3Bo6bPSpbgXh8tOY7Q4AeE9otCoeMXgeZk6zsb2C0H+c1gHxmHaoxK?=
 =?us-ascii?Q?YEbBssX4Hu2bsp1HB/qHCUIm454ypzLkOGOM0gDdwSAj+JkzAmzludwXM7+g?=
 =?us-ascii?Q?vQ/VFBFLpgfwzIJr3+dALhl9KbBW7oUQukrZ0u25Z2oQrelSaG5LRSxsniIs?=
 =?us-ascii?Q?JilTVgkOiVTVifPeie1dvFr2tOyxnp9hXNlGLFKztcaoNPHVowXjzmrW06Gy?=
 =?us-ascii?Q?K35re+qHL1I1XzBpGexBGQdtoWxh+Q0EI4/wKW9aH8bT6UcIAsIxxxrKNwx6?=
 =?us-ascii?Q?KPEJ7L+2sX2StZQNjbmYHZEYa5wBKLNt5BnGe+ssBxy4Izcc7ZJQciE1w0RD?=
 =?us-ascii?Q?y2jxRTZq3Q1Rw3nblXCIWbthNTDNXqP2ySb8kbqsozw+ti+JUqNHHxRumgRP?=
 =?us-ascii?Q?5h57txdpY1PbXxrUfQZwQ5o6yJTsFTeEs9tcRT2xxQAw1ov21VLU9zmCvZFE?=
 =?us-ascii?Q?ktkhdE0vuZSy11JYwWxVr0r6laKG+DDiLrornfNSj/qM0O1WWS+ioLiA/5SX?=
 =?us-ascii?Q?OYXFSF3GnmAEB2dOrYHfTo28KpXVVcBn442ZGgMDv1IbvtyrXRTGZJtWEayL?=
 =?us-ascii?Q?U3/y8FWbqW/9Sd9/s6fZKtTM0A4kwQGB0qWlA0FLJdT0ATNXz1zrYV0J85Hy?=
 =?us-ascii?Q?yVLwLKW4+Bfr+kQCVHOXn2c6Y9Eo75b6Djyhja5tLrB1eQnrQYwLXhk4We6Z?=
 =?us-ascii?Q?NZfLD9NmZzV31YVe0LzAQqdCrvj1+yxUNxgBbZYZw35o4LxWzaxF7SETVj6a?=
 =?us-ascii?Q?mJGZT7Q446j/+uFo/mUkVofVUfGfmSqmS9PDl/nkkbl+QQjmiVOQfaz4NRI+?=
 =?us-ascii?Q?1SS6OpXBvSm3R8ds/sZth33UWc7JtDlR09aFF5Ldv1Dk5yDSpXhunA/8J6jG?=
 =?us-ascii?Q?NGhf+0Mg3IxxU+1kiEh4tsLTP5rlwCobtcSwVXVcKfUCgoDsjpM5pAwbfyWC?=
 =?us-ascii?Q?/G6PQnIhiIQ9GqKM8voeZ2P9A6zHY76FC2VXmAtU?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR84MB18298F75FC611301D02500A8819A9DM4PR84MB1829NAMP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88351388-35a6-4677-02a5-08db3ad3264c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 21:24:35.7610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMogiIkRV96qBRQfdZtsDa/PZPsY5MxFtshCmrU6zzXdIXOa2DR3dI5iMLBwhjWSoLj4dvtmSf2CFgPjNV99HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB3273
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: g_GuIcI-EChM2S6K1F368H6MA2EVtL81
X-Proofpoint-GUID: g_GuIcI-EChM2S6K1F368H6MA2EVtL81
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_14,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=75 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011 mlxlogscore=-47
 mlxscore=75 priorityscore=1501 lowpriorityscore=0 spamscore=75 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110192
X-Mailman-Approved-At: Wed, 12 Apr 2023 07:45:59 +1000
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

--_000_DM4PR84MB18298F75FC611301D02500A8819A9DM4PR84MB1829NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


We use externalsensor to host dbus objects and publish the values with cust=
om code. During busy times on our BMC, the Property Set method takes a long=
 time to complete. I noticed with monitor that every Set is accompanied by =
a method call to GetConnectionUnixUser, which must complete before the resp=
onse to the Set is sent. It may be

Type=3Dmethod_call  Endian=3Dl  Flags=3D0  Version=3D1 Cookie=3D2  Timestam=
p=3D"Fri 2023-04-07 18:32:28.483676 UTC"
  Sender=3D:1.81  Destination=3Dxyz.openbmc_project.ExternalSensor  Path=3D=
/xyz/openbmc_project/sensors/temperature/TestSensor  Interface=3Dorg.freede=
sktop.DBus

Type=3Dmethod_call  Endian=3Dl  Flags=3D0  Version=3D1 Cookie=3D26  Timesta=
mp=3D"Fri 2023-04-07 18:32:28.484291 UTC"
  Sender=3D:1.56  Destination=3Dorg.freedesktop.DBus  Path=3D/org/freedeskt=
op/DBus  Interface=3Dorg.freedesktop.DBus  Member=3DGetConnectionUnixUser

Type=3Dmethod_return  Endian=3Dl  Flags=3D1  Version=3D1 Cookie=3D-1  Reply=
Cookie=3D26  Timestamp=3D"Fri 2023-04-07 18:32:28.484468 UTC"
  Sender=3Dorg.freedesktop.DBus  Destination=3D:1.56

Type=3Dmethod_return  Endian=3Dl  Flags=3D1  Version=3D1 Cookie=3D28  Reply=
Cookie=3D2  Timestamp=3D"Fri 2023-04-07 18:32:28.485179 UTC"
  Sender=3D:1.56  Destination=3D:1.81

Is there a way to prevent this extra dbus traffic?

Thanks,
Brad Tanner

--_000_DM4PR84MB18298F75FC611301D02500A8819A9DM4PR84MB1829NAMP_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We use externalsensor to host dbus objects and publi=
sh the values with custom code. During busy times on our BMC, the Property =
Set method takes a long time to complete. I noticed with monitor that every=
 Set is accompanied by a method call
 to GetConnectionUnixUser, which must complete before the response to the S=
et is sent. It may be
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Type=3Dmethod_call&nbsp; Endian=3Dl&nbsp; Flags=3D0&=
nbsp; Version=3D1 Cookie=3D2&nbsp; Timestamp=3D&quot;Fri 2023-04-07 18:32:2=
8.483676 UTC&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Sender=3D:1.81&nbsp; Destination=3Dxyz.openbm=
c_project.ExternalSensor&nbsp; Path=3D/xyz/openbmc_project/sensors/temperat=
ure/TestSensor&nbsp; Interface=3Dorg.freedesktop.DBus<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Type=3Dmethod_call&nbsp; Endian=3Dl&nbsp; Flags=3D0&=
nbsp; Version=3D1 Cookie=3D26&nbsp; Timestamp=3D&quot;Fri 2023-04-07 18:32:=
28.484291 UTC&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Sender=3D:1.56&nbsp; Destination=3Dorg.freede=
sktop.DBus&nbsp; Path=3D/org/freedesktop/DBus&nbsp; Interface=3Dorg.freedes=
ktop.DBus&nbsp; Member=3DGetConnectionUnixUser<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Type=3Dmethod_return&nbsp; Endian=3Dl&nbsp; Flags=3D=
1&nbsp; Version=3D1 Cookie=3D-1&nbsp; ReplyCookie=3D26&nbsp; Timestamp=3D&q=
uot;Fri 2023-04-07 18:32:28.484468 UTC&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Sender=3Dorg.freedesktop.DBus&nbsp; Destinati=
on=3D:1.56<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Type=3Dmethod_return&nbsp; Endian=3Dl&nbsp; Flags=3D=
1&nbsp; Version=3D1 Cookie=3D28&nbsp; ReplyCookie=3D2&nbsp; Timestamp=3D&qu=
ot;Fri 2023-04-07 18:32:28.485179 UTC&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Sender=3D:1.56&nbsp; Destination=3D:1.81<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a way to prevent this extra dbus traffic?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Brad Tanner<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR84MB18298F75FC611301D02500A8819A9DM4PR84MB1829NAMP_--
