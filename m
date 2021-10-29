Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0843F940
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgbkC64r7z2yxL
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 19:50:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=fMf5teaM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=5936856f4c=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=fMf5teaM; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgbjf66yvz2xYD
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 19:50:29 +1100 (AEDT)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SKICQO023600; 
 Fri, 29 Oct 2021 08:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=ufJvDgbFHahwvwWvWc0NW9M+IVVcgi5yoLj6m6Jodbc=;
 b=fMf5teaMcdQ6lW3ZLoIDrZB7VknR/H2HiZqTh27sVKk2U0B4wDlSBDkJpdh2W+pLxJFS
 Fc2rU2MARrqoCfg3xoT8pjMZavK764klKbcnau7UxwWJjqsl/yHcLxTbPTZZIhRxldxF
 8BZVi/Xl44nXCJkl6OjohTFPeYoxLcpTCL9Dru+Rm9oycnY6aQb2X4dbUsy/VOF4lGal
 0OL/oVoqJRjp6mMelda/HlsW1mWUJIY903j+bZpXw/BEJZWLNmtKlHOBDTFNYCOoFeJH
 g+U/iZVlTP275SBHwotTyn2H9v3+Avz+llAEGCgr3pemPieG3zP+I7SgSEI0u1EDkpKm ig== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx07-002d6701.pphosted.com with ESMTP id 3c02sc340y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 08:50:25 +0000
Received: from BN9P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::32)
 by SJ0PR08MB7783.namprd08.prod.outlook.com (2603:10b6:a03:3d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 08:50:22 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::e5) by BN9P220CA0027.outlook.office365.com
 (2603:10b6:408:13e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 08:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.76)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.76 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.76; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.76) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 08:50:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnXua6yDp6hH+f3ZDA9UJjbkLP+jUOrQo1oDv6DhBRWY3GKh40gMEaKswrWz9OrYFc9LUGXMyayUVqXKpCnHPfeTCuZLlEdANnnmIcL95pW1RTjgB6avrPvkxL7LO9sMhd4JP4fruvef3L0wRPHCSK4gPB5PRKOc/P8QbMoRDdJy70/iKvOi7q8j0VIlvXkwJfOiQoD+5tX4fEu2VHXhuL/68VZzRuftQ4wlVz+CEp6koe84hA/GO+aVkQzeV0aJH9i36kSYQK9n4QIyQprCYvSlEJFsOteMogBdGEzudEw9DY70eQKHFYfOBZu8eB+sAu1gijzj3DdjDpeGv9VKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufJvDgbFHahwvwWvWc0NW9M+IVVcgi5yoLj6m6Jodbc=;
 b=llorNyhjMH/Kh6YozwcllWbf1FDgx0P7weszC1BjQQ/wLou5OYRp1wN8gvm+Ti70fPkRvV+vEG+6bGLfVy8NVmmzJJGC0MiS+2IOdhzRtMsnct1TFYvyCVdRFqctJqU577l+KPopBYz95/N4yOosWypkQNfDrbHOnzkrU8UskI7DA1JuDMjRBuRSz+m/uOqcH7HBBlXqBhCvqDGtfIGr94MOqqj8hNUCtr2iaZ2tCMbpD0gNp0fBXWiWrPLhGYSruXObaIxdM5TIJGoSrHmXeUrUzHRqu09KME0I2ADGWPTcpA3cG0Lxh+L/koNuwZPnaciifXnJ4KV1cSPm8RyEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR0801MB3734.namprd08.prod.outlook.com (2603:10b6:4:76::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Fri, 29 Oct
 2021 08:50:20 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 08:50:20 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?ks_c_5601-1987?B?/N7c3TogW2VudGl0eS1tYW5hZ2VyXSBRdWVzdGlvbiBhYm91dCB0?=
 =?ks_c_5601-1987?Q?emperature_sensor_stops_update?=
Thread-Topic: [entity-manager] Question about temperature sensor stops update
Thread-Index: AdfMmz3NOQzNV/g/Qrqy2k/lLM6/kQABG20AAAAUydw=
Date: Fri, 29 Oct 2021 08:50:20 +0000
Message-ID: <DM6PR08MB5514F7D9632896C305F0CCFDDC879@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514480BAD48B0B200646011DC879@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8c73fd80b5e4672e7dcac777cd5d46bc5d6bf0e1.camel@yadro.com>
In-Reply-To: <8c73fd80b5e4672e7dcac777cd5d46bc5d6bf0e1.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 9d32b0be-d3e9-cef3-5ce2-bb89d4b1459b
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 525ee324-1274-4c90-645a-08d99ab924c0
x-ms-traffictypediagnostic: DM5PR0801MB3734:|SJ0PR08MB7783:
X-Microsoft-Antispam-PRVS: <SJ0PR08MB778317259C9E6482DB9EBCCADC879@SJ0PR08MB7783.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 875BXVNj6e9AyIiLvMg5YIClr7/YqcwsWeqUnVY7L4pI88ELSPN2VMTs3Efk3wS+EPDa5p6BF7Bc5YoRpe9egQxzNO4WWBpTOb+ufBUoxDLHVzqC0p0iuRdmK5T5wP4QoQsRp8JFyXvRHdFtU3AlBam6IcV3b3o/R0SIGWVdgu94Rgk1I8jNE625Gjgl2zT6aw1gXmq4tZJknTPeiPPdTJhY0fSJ62As8tSDGkZfCNoj1pJL1qvBjkq5zo5rXosmdtT6WrrOiLlY6bxqwS4lWy4SSElotfy+6K6Gk2JtJvgUZDIxqPuQCf7Wyx987k29KfGYHjoZR40LXP64t85VXrKQJ8pmQMBhPqsn/z1N3vbSrTgtFVoP7EbMJLytiR3FbBbsns2l0NM3IQkCsCxM9NfI8QZFmxBWjymGdOMqTAH4/t4leCB77bW5Mtaifdxq6L3O8IlRIIxcgTOjuKIJ1pue4JVEfA1UElf5QteSu9PffkWGIrJEFz5/74vAVO3uykHaWM0lb/xcV07AqAsTnQay+rZ5ljYbdQhUV4bf1bGaxz+kFEIjLs/Gm7q0r5n19r66UN3sC1+O2FFFmXUzWxY7bk/Zc6g1sU33uc8vwJ/1KrE7pZhvxxQ2VE1b1MmdOIx8kK0Q3bB8tMv/26CnaRXGKG8yRqxEqo1TQtL+GBmebZ/WCzLMgNZ/nYlVD+1BlQuV7uqPTkrOHS/YOFcH5Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(52536014)(19627235002)(66446008)(316002)(38100700002)(64756008)(86362001)(15650500001)(186003)(9686003)(55016002)(33656002)(122000001)(8936002)(38070700005)(83380400001)(5660300002)(7696005)(508600001)(76116006)(4001150100001)(2906002)(66946007)(91956017)(110136005)(66476007)(224303003)(6506007)(19627405001)(66556008)(71200400001);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514F7D9632896C305F0CCFDDC879DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3734
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6a452167-0316-487e-da17-08d99ab92373
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7TrNJxPOHQBZ7Ft8w+6lIlCBi+N8Bl8zsb38esP7hwjFoCdmbcAN5ak6/YuqbPn7SUfdNFyVmLTrxXAz+k/+73ayqz8GUrgNGe28wMt0mRnCu4hUOdNdT2liRCT615TCZwpr7oDZ+MovP6NyOe/8vWjR+fzPQkwqR3nnPU900TZUj6wvfpXyivV0L1BRP4hd8WMxBEWjDf9r8w0bH0aM1mwlvsgZe+Y+QvaRsQRJp3DkYeg2ar3AhW8HOAEBm5BKbyYtKe1lAjze/lLiHwXeu1w067XrMeNIsQh6YmULKYwcogX+wBfCLH3EbvqIM0qDM92+2IeGXVDuex19wdzkPbj/WiDBWyoscdfwPMdZdHlMyArfif0qoFdjIeSFHmcpKTNG2yry6ob2GYpvQi8T2NGPHY9cIDgdE8A+QVOD7u+3lqaiw73Mz/3YOUji4Zoh0h+ouMJVVL3LFlGLDOkX0o9Lma10ZquhSuGh5bHYDAD1ckVa5TY+P8eGBZgKIqxPK+Uwg9TQbTIc1s7VGIL7KCL1xgI/rKmFJzzocub6nDZsCfbZVUFcaZAuyQAW1ZEJexSvTCfBw1UjdNiDFTLLY8DCfESHuW6mQYtG5aQOpUdHBga6Aix2E0SSXmy1xylj8aJylOe/50s4GMA96NpljUg1pi2GGuDkTy1Ao9I9mQGokw1Od2k/os7Hm6GEI2GgaCcngW179YTXQ8UxeTnBEVTCucr1yjtYO8oTV9a/6w=
X-Forefront-Antispam-Report: CIP:144.49.247.76; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(4001150100001)(83380400001)(82310400003)(336012)(5660300002)(33656002)(8936002)(52536014)(36860700001)(508600001)(47076005)(55016002)(9686003)(70206006)(86362001)(70586007)(224303003)(7696005)(316002)(186003)(4186021)(26005)(2906002)(110136005)(6506007)(19627235002)(19627405001)(81166007)(356005)(15650500001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 08:50:22.3222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525ee324-1274-4c90-645a-08d99ab924c0
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.76];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7783
X-Proofpoint-GUID: DVzO8bx7T-08sTo-D9k9PBHegTY0QM1f
X-Proofpoint-ORIG-GUID: DVzO8bx7T-08sTo-D9k9PBHegTY0QM1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290050
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

--_000_DM6PR08MB5514F7D9632896C305F0CCFDDC879DM6PR08MB5514namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgQW5kcmVpLA0KDQpUaGFua3MgZm9yIHlvdXIgcHJvbXB0IHJlcGx5IGFuZCB0aGUgZXhwbGFu
YXRpb24gb2YgIzIsIEkgdW5kZXJzdG9vZCBub3cuDQoNCkZvciBxdWVzdGlvbiAjMSwgbGV0IG1l
IHJlcGhyYXNlIGl0LCBwbGVhc2UuIEkgbWVhbiB0aGUgdGVtcGVyYXR1cmUgdmFsdWUgSSByZWFk
IGlzIGFsd2F5cyB0aGUgc2FtZS4gVGhlIHZhbHVlIGFsd2F5cyBzaG93cyA0MC4xODcsIGl0IHdv
dWxkbid0IGJlIGNoYW5nZWQgZXZlbiBJIHJlYWQgaXQgYWdhaW4gYWZ0ZXIgYSB3aGlsZS4gQnV0
IGlmIEkgZGVjbGFyZSB0aGUgdGVtcCBzZW5zb3JzIG9uIHRoZSBJMkMgYnVzIG5vZGUgaW4gbXkg
ZHRzLCB0aGUgdmFsdWUgd2lsbCBjaGFuZ2UgYWxsIHRoZSB0aW1lLiBEbyB5b3UgaGF2ZSBhbnkg
aWRlYSBhYm91dCB0aGlzPw0KDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQrQ9svs7bo6IEFuZHJlaSBLYXJ0YXNoZXYgPGEua2FydGFz
aGV2QHlhZHJvLmNvbT4NCtD2y+zs7dGiOiAyMDIx0rQxMOrFMjns7SD5u+ftIDA0OjMzDQripcvs
7bo6IENocmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQrxq/KpOiBSZTogW2VudGl0
eS1tYW5hZ2VyXSBRdWVzdGlvbiBhYm91dCB0ZW1wZXJhdHVyZSBzZW5zb3Igc3RvcHMgdXBkYXRl
DQoNCkhlbGxvLA0KDQpJIGRpZG4ndCBjYXRjaCwgd2hhdCBpcyB5b3VyIHByb2JsZW0uIEFzIEkg
c2VlIGZyb20gdGhlIGxvZ3MsDQpldmVyeXRoaW5nIGlzIGZpbmU6IHRlbXAgc2Vuc29ycyBpbnN0
YW50aWF0ZWQsIGRidXMgb2JqZWN0cyBjcmVhdGVkLA0KcmVhZGluZ3MgcHJlc2VudC4gV2hhdCdz
IHdyb25nPw0KDQpBcyBmb3IgRnJ1RGV2aWNlOiB5ZXMsIGl0J3Mga2luZCBvZiB3ZWlyZCBiZWhh
dmlvdXI6IGl0IGV4cG9zZXMgbm90DQpvbmx5IGFjdHVhbCBGUlUgZGV2aWNlcyBidXQgYWxzbyBv
dGhlciBJMkMgZGV2aWNlcy4gWW91IGNhbiBpbnRyb3NwZWN0DQp0aGF0IG9iamVjdHMgYW5kIHNl
ZSB0aGF0IHRoZXkgZXhwb3Nlcw0KeHl6Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuSXRlbS5J
MkNEZXZpY2UgaW50ZXJmYWNlIGluc3RlYWQgb2YNCnh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2
aWNlDQoNCk9uIEZyaSwgMjAyMS0xMC0yOSBhdCAwODowMiArMDAwMCwgQ2hyaXMgQ2hlbiAoVFBJ
KSB3cm90ZTpGcnVEZXZpY2UNCj4gSGkgZXZlcnlvbmUsDQo+DQo+IEFjdHVhbGx5LCBJIGhhdmUg
MiBxdWVzdGlvbnMgYXMgYmVsb3c6DQo+ICAgIDEuIEkgZ290IHVuZGVyc3Rvb2QgZnJvbSBvdGhl
cnMgb24gdGhlIG1haWxpbmcgbGlzdCwgdGhhdCBJIGRvbid0DQo+IGhhdmUgdG8gZGVjbGFyZSBF
RVBST00gb3IgdGVtcCBzZW5zb3JzIG9uIHRoZSBJMkMgYnVzIG5vZGUgaW4gbXkgZHRzLA0KPiBh
bmQgaXQgc2hvdWxkIGJlIGZpbmUgZXZlbiBJIGRpZCBpdCBhdCB0aGUgYmVnaW5uaW5nLiBTbyBJ
IHRyaWVkIHRvDQo+IHJlbW92ZSB0aGlzIGRlY2xhcmF0aW9uIGluIGR0cywgdGhlbiB0aGUgc2Vu
c29yIHZhbHVlIEkgZ290IGlzIGZpeGVkLA0KPiBubyB1cGRhdGUuIENhbiBzb21lb25lIGhlbHAg
dG8gdGFrZSBsb29rIGF0IHdoeSBpdCBpcz8NCj4gICAgICAgICAgICAgIEhlcmUgYXJlIHNvbWUg
bG9ncyB0aGF0IGFwcGVhcmVkIGF1dG9tYXRpY2FsbHkgYWZ0ZXIgdGhlDQo+IHN5c3RlbSBib290
ZWQgdXAuICBJdCBsb29rcyBsaWtlIHRoYXQgZW50aXR5LW1hbmFnZXIgd29ya3MgZmluZS4gQW5k
DQo+IHRoZSBjb21tYW5kcyBJIHVzZWQgdG8gY2hlY2sgdmFsdWUuDQo+ICAgICAgICAgICAgICA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gICAgICAgICAgICAgIFsg
ICAyMy43MTM1OTZdIGxtNzUgNi0wMDQ5OiBod21vbjE6IHNlbnNvciAndG1wNzUnDQo+ICAgICAg
ICAgICAgICBbICAgMjMuNzE4ODk0XSBpMmMgaTJjLTY6IG5ld19kZXZpY2U6IEluc3RhbnRpYXRl
ZA0KPiBkZXZpY2UgdG1wNzUgYXQgMHg0OQ0KPiAgICAgICAgICAgICAgWyAgIDIzLjcyODUyMF0g
bG03NSA2LTAwNGM6IGh3bW9uMjogc2Vuc29yICd0bXA3NScNCj4gICAgICAgICAgICAgIFsgICAy
My43MzM3NzldIGkyYyBpMmMtNjogbmV3X2RldmljZTogSW5zdGFudGlhdGVkDQo+IGRldmljZSB0
bXA3NSBhdCAweDRjDQo+ICAgICAgICAgICAgIFsgICAyMy43NDM3MDddIGxtNzUgNi0wMDRkOiBo
d21vbjM6IHNlbnNvciAndG1wNzUnDQo+ICAgICAgICAgICAgIFsgICAyMy43NDkwNDJdIGkyYyBp
MmMtNjogbmV3X2RldmljZTogSW5zdGFudGlhdGVkIGRldmljZQ0KPiB0bXA3NSBhdCAweDRkDQo+
DQo+ICAgICAgICAgICAgICAjIGJ1c2N0bCBpbnRyb3NwZWN0IHh5ei5vcGVuYm1jX3Byb2plY3Qu
SHdtb25UZW1wU2Vuc29yDQo+IC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1
cmUvRElNTV9QMV9FRkdIDQo+ICAgICAgICAgICAgICB4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNv
ci5WYWx1ZQ0KPiAgaW50ZXJmYWNlIC0gICAgICAgICAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0NCj4gICAgICAgICAgICAgIC5NYXhWYWx1ZQ0KPiBwcm9wZXJ0eSAg
ZCAgICAgICAgIDEyNyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdHMt
DQo+IGNoYW5nZQ0KPiAgICAgICAgICAgICAgLk1pblZhbHVlDQo+IHByb3BlcnR5ICBkICAgICAg
ICAgLTEyOCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0cy0NCj4gY2hh
bmdlDQo+ICAgICAgICAgICAgICAuVW5pdA0KPiBwcm9wZXJ0eSAgcyAgICAgICAgICJ4eXoub3Bl
bmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZS5VbmkuLi4gZW1pdHMtDQo+IGNoYW5nZQ0KPiAgICAg
ICAgICAgICAgLlZhbHVlDQo+ICBwcm9wZXJ0eSAgZCAgICAgICAgNDAuMTg3ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbWl0cy0NCj4gY2hhbmdlIHdyaXRhYmxlDQo+DQo+ICAg
ICAgICAgICAgICAjIGNhdCAvc3lzL2J1cy9pMmMvZGV2aWNlcy82LQ0KPiAwMDRkL2h3bW9uL2h3
bW9uMy90ZW1wMV9pbnB1dA0KPiAgICAgICAgICAgICA0MDE4Nw0KPiAgICAgICAgICAgICA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gICAgMS4gRnJvbSBteSB1bmRl
cnN0YW5kaW5nLCB0aGVyZSBpcyAiZGV0ZWN0aW9uIGRhZW1vbiIgd2hpY2ggc2NhbnMNCj4gSTJD
IGJ1cyBsb29raW5nIGZvciBFRVBST01zIHdpdGggSVBNSSBGUlUgZGF0YS4gSG93ZXZlciwgSSBm
b3VuZCBhbGwNCj4gZGV2aWNlcyBvbiB0aGUgSTJDIGJ1c2VzIHdvdWxkIGJlIGxpc3RlZCwgbm90
IG9ubHkgRnJ1IGRldmljZXMsIHdoZW4NCj4gSSB1c2VkIHRoZSBjb21tYW5kIGJlbG93LiBJcyB0
aGlzIGNvcnJlY3Q/DQo+ICAgICAgICAgICAgICMgYnVzY3RsIHRyZWUgeHl6Lm9wZW5ibWNfcHJv
amVjdC5GcnVEZXZpY2UNCj4gICAgICAgICAgICAgYC0veHl6DQo+ICAgICAgICAgICAgICAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdA0KPiAgICAgICAgICAgICAgICAgYC0veHl6L29wZW5ibWNfcHJv
amVjdC9GcnVEZXZpY2UNCj4gICAgICAgICAgICAgICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVj
dC9GcnVEZXZpY2UvMF84MA0KPiAgICAgICAgICAgICAgICAgICB8LS94eXovb3BlbmJtY19wcm9q
ZWN0L0ZydURldmljZS8wXzg4DQo+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1jX3By
b2plY3QvRnJ1RGV2aWNlLzJfMTA4DQo+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1j
X3Byb2plY3QvRnJ1RGV2aWNlLzJfMTEyDQo+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVu
Ym1jX3Byb2plY3QvRnJ1RGV2aWNlLzJfNjgNCj4gICAgICAgICAgICAgICAgICAgfC0veHl6L29w
ZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMl83Mg0KPiAgICAgICAgICAgICAgICAgICB8LS94eXov
b3BlbmJtY19wcm9qZWN0L0ZydURldmljZS8zXzIyDQo+ICAgICAgICAgICAgICAgICAgIHwtL3h5
ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzNfNTANCj4gICAgICAgICAgICAgICAgICAgfC0v
eHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvNF81Ng0KPiAgICAgICAgICAgICAgICAgICB8
LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS81XzQ4DQo+ICAgICAgICAgICAgICAgICAg
IHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzVfODENCj4gICAgICAgICAgICAgICAg
ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvNl83Mw0KPiAgICAgICAgICAgICAg
ICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS82Xzc2DQo+ICAgICAgICAgICAg
ICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzZfNzcNCj4gICAgICAgICAg
ICAgICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvN184MA0KPiAgICAgICAg
ICAgICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS83Xzg4DQo+ICAgICAg
ICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzhfMTAxDQo+ICAg
ICAgICAgICAgICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS9odWRzb25i
YXkgICAgqawNCj4gdGhpcyBpcyB0aGUgcHJvYmUgbmFtZSB3ZSBkZWZpbmUgaW4gSlNPTiBjb25m
aWd1cmF0aW9uDQo+DQo+IFRoYW5rcy4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXMgQ2hlbg0KPiBM
ZWdhbCBEaXNjbGFpbWVyIDoNCj4gVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1l
c3NhZ2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kDQo+IGNvbmZpZGVudGlhbC4NCj4gSXQgaXMgaW50
ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9t
IGl0DQo+IGlzIGFkZHJlc3NlZA0KPiBvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRl
ciBvZiB0aGlzIG1lc3NhZ2UgaXMgbm90IHRoZQ0KPiBpbnRlbmRlZCByZWNpcGllbnQsDQo+IGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBp
biBlcnJvciwNCj4gcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxl
dGUgb3IgZGVzdHJveSBhbnkgY29weQ0KPiBvZiB0aGlzIG1lc3NhZ2UhDQoNCi0tDQpCZXN0IHJl
Z2FyZHMsDQpBbmRyZWkgS2FydGFzaGV2DQoNCg0K

--_000_DM6PR08MB5514F7D9632896C305F0CCFDDC879DM6PR08MB5514namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your prompt reply and the explanation of #2, I understood now.&n=
bsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
For <span style=3D"background-color:rgb(255, 255, 255);display:inline !impo=
rtant">question #1, l</span>et me rephrase it, please. I mean the temperatu=
re value I read is always the same. The value always shows 40.187, it would=
n't be changed even I read it again
 after a while. But if I declare the temp sensors on the I2C bus node in my=
 dts, the value will change all the time. Do you have any idea about this?
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=D0=F6=CB=EC=ED=BA:</b> Andrei =
Kartashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=D0=F6=CB=EC=EC=ED=D1=A2:</b> 2021=D2=B410=EA=C529=EC=ED =F9=BB=E7=ED 04=
:33<br>
<b>=E2=A5=CB=EC=ED=BA:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=F1=AB=F2=A9:</b> Re: [entity-manager] Question about temperature sensor=
 stops update</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hello,<br>
<br>
I didn't catch, what is your problem. As I see from the logs,<br>
everything is fine: temp sensors instantiated, dbus objects created,<br>
readings present. What's wrong?<br>
<br>
As for FruDevice: yes, it's kind of weird behaviour: it exposes not<br>
only actual FRU devices but also other I2C devices. You can introspect<br>
that objects and see that they exposes<br>
xyz.openbmc_project.Inventory.Item.I2CDevice interface instead of<br>
xyz.openbmc_project.FruDevice<br>
<br>
On Fri, 2021-10-29 at 08:02 +0000, Chris Chen (TPI) wrote:FruDevice<br>
&gt; Hi everyone,<br>
&gt; &nbsp;<br>
&gt; Actually, I have 2 questions as below:<br>
&gt; &nbsp;&nbsp;&nbsp;1. I got understood from others on the mailing list,=
 that I don't<br>
&gt; have to declare EEPROM or temp sensors on the I2C bus node in my dts,<=
br>
&gt; and it should be fine even I did it at the beginning. So I tried to<br=
>
&gt; remove this declaration in dts, then the sensor value I got is fixed,<=
br>
&gt; no update. Can someone help to take look at why it is?<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Here are some log=
s that appeared automatically after the<br>
&gt; system booted up.&nbsp;&nbsp;It looks like that entity-manager works f=
ine. And<br>
&gt; the commands I used to check value.<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.71359=
6] lm75 6-0049: hwmon1: sensor 'tmp75'<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.71889=
4] i2c i2c-6: new_device: Instantiated<br>
&gt; device tmp75 at 0x49<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.72852=
0] lm75 6-004c: hwmon2: sensor 'tmp75'<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.73377=
9] i2c i2c-6: new_device: Instantiated<br>
&gt; device tmp75 at 0x4c<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;[ &nbsp; 23.743707=
] lm75 6-004d: hwmon3: sensor 'tmp75'<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;[ &nbsp; 23.749042=
] i2c i2c-6: new_device: Instantiated device<br>
&gt; tmp75 at 0x4d<br>
&gt; &nbsp;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # busctl introspe=
ct xyz.openbmc_project.HwmonTempSensor<br>
&gt; /xyz/openbmc_project/sensors/temperature/DIMM_P1_EFGH<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; xyz.openbmc_proje=
ct.Sensor.Value &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;<br>
&gt; &nbsp;interface - &nbsp; &nbsp; &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .MaxValue &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; 127 &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;emits-<br>
&gt; change<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .MinValue &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; -128 &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; emits-<br>
&gt; change<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Unit &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;<br>
&gt; property &nbsp;s &nbsp; &nbsp; &nbsp; &nbsp; &quot;xyz.openbmc_project=
.Sensor.Value.Uni... emits-<br>
&gt; change<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Value &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
<br>
&gt; &nbsp;property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp;40.187 &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; emits-<br>
&gt; change writable<br>
&gt; &nbsp;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # cat /sys/bus/i2=
c/devices/6-<br>
&gt; 004d/hwmon/hwmon3/temp1_input<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;40187<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &nbsp;&nbsp;&nbsp;1. From my understanding, there is &quot;detection d=
aemon&quot; which scans<br>
&gt; I2C bus looking for EEPROMs with IPMI FRU data. However, I found all<b=
r>
&gt; devices on the I2C buses would be listed, not only Fru devices, when<b=
r>
&gt; I used the command below. Is this correct?<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;# busctl tree xyz.=
openbmc_project.FruDevice<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;`-/xyz<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-/xyz/open=
bmc_project<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; `-/x=
yz/openbmc_project/FruDevice<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/0_80<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/0_88<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/2_108<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/2_112<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/2_68<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/2_72<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/3_22<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/3_50<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/4_56<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/5_48<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/5_81<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/6_73<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/6_76<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/6_77<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/7_80<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/7_88<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbs=
p; |-/xyz/openbmc_project/FruDevice/8_101<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nb=
sp; `-/xyz/openbmc_project/FruDevice/hudsonbay&nbsp;&nbsp;&nbsp;&nbsp;=A9=
=AC<br>
&gt; this is the probe name we define in JSON configuration<br>
&gt; &nbsp;<br>
&gt; Thanks.<br>
&gt; &nbsp;<br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and<br>
&gt; confidential. <br>
&gt; It is intended to be read only by the individual or entity to whom it<=
br>
&gt; is addressed <br>
&gt; or by their designee. If the reader of this message is not the<br>
&gt; intended recipient, <br>
&gt; is strictly prohibited. If you have received this message in error, <b=
r>
&gt; please immediately notify the sender and delete or destroy any copy<br=
>
&gt; of this message!<br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB5514F7D9632896C305F0CCFDDC879DM6PR08MB5514namp_--
