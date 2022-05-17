Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37D52A5D9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 17:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2fsV1lfyz3c7s
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 01:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=CyHmlfRK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=61362a5906=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=CyHmlfRK; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2fs51Y2qz2yK6
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 01:18:26 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HEAnXX013887;
 Tue, 17 May 2022 08:18:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=J2qwM/QUi6A4kKHZx4kR4alxmjjkS46E1/EnxCP8d6k=;
 b=CyHmlfRKb6Up3ReRJBxF7wzU5I7HOoLPZN/4kSjJbJUo/itOjVRTqq/cZFYIoYOtQ1q7
 Lf6wDFtsXK3hLnbZ8Rc01odOKsfznlcd3IOuwnkDEOncnvW+mmNKH7O48MqsqVCiNlKw
 swAY/xbCW1wFWYmzP9QT0P9iE8SgMD1280U= 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g4d81rfu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 08:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfqFxsOm9MjlWjO7bJc7PXF0Dp54I8Ny8tpeMwoTId8zJE7vdNBuVO0e9W84NEK7LpTn8P4ZjOZU0R2kJmrqvupKvVfiJNh9WPZUMNd32U4F4DAOfDsL1zVrOBqvZA2J7PEzd4FFKavZjNL+sEjlQkIYYCgjVbKPWY89etM+EwfsS/Yfbakm0Pa1jyz9R+jI16/8yHzldAM904ensSlnaMMYK3F5f8SSpF+kVV1hRjXDjw5kFvecQOaUGw7d2HChkXBjh/ULVY5Bjov4aVKXSNXT6h/4jU9mKibs7ibhZWNQweeCIALOyaAcd8pB31630mkHoO3jRmYBA5pHjdqVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2qwM/QUi6A4kKHZx4kR4alxmjjkS46E1/EnxCP8d6k=;
 b=gIlkWVk2X+Ejy5wWA6gYjsCrNA6V4ROMzkzp9hrs3RY9w1TCAgpt1ClOcaNUCLpRqQJikwUPXMrh632zCFwpD6WcSaXDoMDsAqVm/oW9iGcsVkW5OP2FJUCp0X8sW4yMR3mcWD/XOwieiwmOAHNWapuamLMjc+jjTWpe50Wb55jj17LKZwcLQVrfD4ojYqNVsC9Tdcoj74MwEYTg7UMLP3Zh96uD8DPh40xRZtg2Cf1v2zmmjE20Zs7t5CDO/dVsJBnv6I2kdYMPCmAtKvK1FD7AQglcJU5payOzdYagtQ+EWoyoeZBUbWIT6sI9Sb++rFGck/kHM2SQ89wps6kUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4517.namprd15.prod.outlook.com (2603:10b6:a03:376::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:18:13 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:18:13 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: [PATCH] libslirp: ncsi: Add Mellanox Get MAC Address Handler
Thread-Topic: [PATCH] libslirp: ncsi: Add Mellanox Get MAC Address Handler
Thread-Index: AQHYagFTC3f320YP5U67FrRx8118Vg==
Date: Tue, 17 May 2022 15:18:13 +0000
Message-ID: <15BA17CB-BDE6-4B34-B5F2-EBD1EA4BFEAF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb0aee7c-b184-47b7-3701-08da381875e8
x-ms-traffictypediagnostic: SJ0PR15MB4517:EE_
x-microsoft-antispam-prvs: <SJ0PR15MB45173091D03FA2ADEDF2EEACACCE9@SJ0PR15MB4517.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: No8Da3FlPhItu5P2uzc6ZPbqqjdFXFAhp6+EJoyynwnEp6dT1SVgRed26bltIOCcoI/Do7MhseZ6vDhuBYrXVB30lWZBV5da1bUn1bQ6UOiXrdZRBmew8p9ojchjaOkHU3Go5HEP0/78kYdK0rlWgb/3llQcVMEUu5yfCk3c8SwDmRpx3+qbTm7kjxJJZwNHip3/gIaYr8goqksWdlNFEB2oC5MQQpgRA88dpdHCuzi6MUwZhpNax5L+umxo5CjZukEdWKRnQKfB/5YcsL2+7e2Pvl8llOIUjq4thh7BOEiraCF5043K8gm64/xWsQAeLFDov3IdSXFAhLscsd6YF3gEwwBrjfRFpi3F8Wd/gXyvRRZacsZW5HThw4qw1oBhvpVcbNlQr+Ji97jVp3j7Pz0DN8R+T4eHUiPj+KU0wb93+McBV5R2nBtRN1V5VXi1lr7NfqgrMHXHELgTqTX83DshlQ52pVGvBcMqVhpvP7WBIJSKhr8u3Li/teXg9bTSGeCMDL/iOA+jnybs2X1h/naSWcJVcqUFH41bU0zLecSn1OC8N4jWul6oRFpzQV6qPn4tufalNM01qqCzpo3B7iwJ3zm/5RlIyHrnl5462njZxUmnpAJWs70/jKFCkFqG1IjwanCXepESJa5YPdjJ6Svhye6hmiyh5OUvUyL8NlwOadhZ5kLe+MC/hlYIegzbNk2iVsLsJIPl2bh4yjVa82Jn1JGlcj4L8qRHUr6/4+iB/OFHXRMuqOZpZVF7IFzY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(54906003)(4326008)(66476007)(122000001)(38070700005)(38100700002)(186003)(33656002)(66946007)(36756003)(66556008)(8936002)(66446008)(6512007)(4744005)(64756008)(6506007)(966005)(6486002)(5660300002)(508600001)(76116006)(86362001)(83380400001)(109986005)(2616005)(2906002)(8676002)(71200400001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0pWRm9aUXJDNlNEVGkvcUh1T2lIQ09zZndRMEdvUmltMXJzekROMzNPb0pn?=
 =?utf-8?B?VkZxL1E2THJtSHJjbWQ3K096OTRXWlhTdVNSd01NTkZpeFFkSFJneE1iUTds?=
 =?utf-8?B?c1hGRFlZMklOVFNvdDZkamk2OC9oWFhrY1I0T1pVanRNU29xcXJyTTJzZVgx?=
 =?utf-8?B?bVhxNzlnWHVsYlIzdTd6VXpmUEdwcU9wY2ZLZFl4NVppakRVVzcwNHoxbFlV?=
 =?utf-8?B?K3g4MytZMFlhVFBhc2wwdE11dlpCOWc1cDlIZGU4TlB3d3htWm5ERUJMeW1w?=
 =?utf-8?B?Y2RzR29qdlRXZnpUWkxTM3hmZzQzYTNLYnlSWUtreWdFK2o5eHZRWmZaMVdG?=
 =?utf-8?B?K2YyNnQ5RlQvcWxVY1pDTFJ1TlpiSWxGN1pTRXlhREtiUzBlb2NuUW9YZ2lR?=
 =?utf-8?B?am1vNkZsSUViR2RpejJyNnFRRldPYUFZWGpxcWEwZU0rbXlKc3Zqb0xWcElR?=
 =?utf-8?B?enc3K0hoMDhxQWFFTXY0ODJScFMyajJ1QVRRa3dmdklJaTVSdE91QUh2Q0do?=
 =?utf-8?B?WVE5MVY0dm5DZHgvcTFMdFlabHlxMDh1MEpnMCs0TXVjNVNiK2tKSEg2R3I3?=
 =?utf-8?B?aFRza1FHYkV4cng2V05VbC8yKzJvcTBhcFo3dHJwUlBibG5RRmFReDlGcGtP?=
 =?utf-8?B?S2xwZVRtN0pFSEZKczFCVHd2SHNQZDUrNkN4YnlwOXEzTm90UlM2WHZQMytm?=
 =?utf-8?B?UWszOGVDVkJkRUNhbzZROHRnT3k0REVQckNWWWloRmZCZTRzQ2VvZmMvb0ZI?=
 =?utf-8?B?YnpGckZWSGY2Nk16WXo2SDZmdzBYN0JvUllseFRMd3FyVUxRQ0hLNWE4d2ht?=
 =?utf-8?B?SFdaSkk5OC90OVlmaldOeXFjdWtqelYzWkp0MWs2Ri9EOW5aQnpiQ2Fyb09Z?=
 =?utf-8?B?OXp5R1hGWWhyLzlrM1VibDZHb1JLejdIY3c4QVdKbzNQMlVxaFNiSmdMSVkw?=
 =?utf-8?B?d2ErZFVjaWJDTUJvc2dMSjNOMWE1Mmp3MTBlUFJUa1ZZd3o2SnRObmYvRHpF?=
 =?utf-8?B?clNnY3VtRE53MSsySnJLWlpNa1Z0Y0paUVE0WThqdEZOMi9BdmZ4bEdTaGVU?=
 =?utf-8?B?aE85QU9lbEw0YmZxeTRrQkJ5TGlUazdHK0tUTnhmR0w5di9yK1dZa0tuS1Iz?=
 =?utf-8?B?c1kyQjZ3S3VyK1NST3RON1NQOU5GVER6bTQ5TzdpMFhSNUtVdjBmT09WcmJP?=
 =?utf-8?B?ekVRSm9YakFDOW44c0ZMUmZ5NXZkVEt0ZkhkM0h3MGhicmtkQTBDbnZ2OWc3?=
 =?utf-8?B?elprODNaRzFacVlDM0dKTi9URFlxOXNqdmJhWW5YTURmYm5SQ1o0VnpETWpw?=
 =?utf-8?B?bHQwRUtwM0lqcTkyZ0l1ZUJ5eTR1ak1EcTIyRGhlbTJqMzFGV2lteTFhbmI1?=
 =?utf-8?B?Rit2Zzd4bkp3bFVndS9ZbGRyd2d2TVJiVno1U1c0N1J1MkR5QzJEMmF5MWFZ?=
 =?utf-8?B?TkdPZDdnOEliY3NYZVhMVTIxUmJFSnVKUjFpRzJkdlNNYVdJaHp3ZkNMWTB5?=
 =?utf-8?B?b0tWTVpxekcvOExzZXA4MEtiaDAxVzE3emxXMjJEcnFpZ2xFTnZJYmdUYldo?=
 =?utf-8?B?RnhualhIZWN4UUF3ZEZ5bE1mcjVNanJHUWoxUmJ6b2kyclI4SC9JQjl1T0VM?=
 =?utf-8?B?QVBFS2FYWmJGOUsxaWlXWnBBWGhHVzFIYTdaNm9hckVrQjhXMGMwQWdjc3Bh?=
 =?utf-8?B?TVVtOWcxR3hsN2ZsM2JyQUprUkRJVk1maDgzcUMwZDJlVkg0RzllSmY4eG5s?=
 =?utf-8?B?cU1QampiL21wZlBBeHJKQnFVMUNQTHJ4Yk55eWhuNTRNTHF1TmRVQzVJaEFv?=
 =?utf-8?B?cFFUSzk5UWlKcGpmdlBhQ1ZXbllkQVF1dE5IWnVqbVkwN1A2QWJZN0F2VnRX?=
 =?utf-8?B?enRvMXNjb09VTmpVbFp3cWVHZ084aWxNYTh3SmcvbHBEdTlJTER4YVpIbUVv?=
 =?utf-8?B?ZlIvSDdRZGd5S3FyNGpSQkQ1M1huSThheFcvR0VzZDJoVXVBWlJjOGJqTzRD?=
 =?utf-8?B?ZHJjTVlDRmNOVm9KNEY4a2xHOFF3TTE5T0Z5emM0blBEZkk4Sk1WbVdTZFlz?=
 =?utf-8?B?cFFoV3ZFM2N5eDVmWThvZms4QlpQU3JEM1NkSWkzNm8ycStHdjNrM2h5NlND?=
 =?utf-8?B?U3N6c3pxeEgzREhTbUdXMGg1eklWUGNyaEc5SjREYWZETFJ1dmRXaXBIMytj?=
 =?utf-8?B?RHo3OFRhLzdGZUJseWRNZGJveWtaWlZSZnN2cXg5UU1zcU91Ky9TNWNSaGxS?=
 =?utf-8?B?WXM4TjJVUnArY0NZUjVJSW40SllvallTR3dpbi84RmNsaWF5ZUo2RDd5Tys5?=
 =?utf-8?B?SkVIQjNCNk81NEFCTUhBbGNQNCtvRGtrdEw1bG1RSG8xbDhiWk84blFIcXV0?=
 =?utf-8?Q?/E2d5tkDPGIOYnQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDC5CB97EB0ECE4BBB81E476CDB46B68@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0aee7c-b184-47b7-3701-08da381875e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 15:18:13.4869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACKQvS2WExatN7nSy45zkDsmhBl7X4051waSNeNtsTm5KpNUeXi2OCapi/oHiRCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4517
X-Proofpoint-GUID: URpChRq-nq-ptnMFhjI1coiHnfgt4Vwt
X-Proofpoint-ORIG-GUID: URpChRq-nq-ptnMFhjI1coiHnfgt4Vwt
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_03,2022-05-17_02,2022-02-23_01
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
Cc: "slirp@lists.freedesktop.org" <slirp@lists.freedesktop.org>,
 OpenBMC List <openbmc@lists.ozlabs.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGV5IENlZHJpYywNCg0KU2luY2UgeW91IHdlcmUgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGUg
TkMtU0kgY29tbWFuZCBoYW5kbGluZyBpbg0KbGlic2xpcnAsIEkgd2FudGVkIHRvIGluZm9ybSB5
b3Ugb2YgdGhpcyBtZXJnZSByZXF1ZXN0IEkgbWFkZQ0KdG8gZXh0ZW5kIGl0IHRvIHN1cHBvcnQg
YW4gT0VNIOKAnEdldCBNQUMgQWRkcmVzc+KAnSBjb21tYW5kLg0KDQpodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvc2xpcnAvbGlic2xpcnAvLS9jb21taXQvNDY0MDk0NDJiZWE0NzllZDk4
Y2U0OGFkZjBlNDhkYTU0Njc3ZmE3Yw0KDQpBbHNvIG5vdGlmeWluZyBQYXRyaWNrLCBoZSBoYWQg
YSBjaGFuZ2UgaW4gT3BlbkJNQyB0aGF0IGhlIGNvdWxkbuKAmXQNCnRlc3QgaW4gUUVNVSB3aXRo
b3V0IHRoZXNlIGNoYW5nZXMuIFRoZXNlIGNoYW5nZXMgbGV0IHlvdSB0ZXN0IG91dA0KT3BlbkJN
QyBNQUMgYWRkcmVzcyBwcm92aXNpb25pbmcgdGhyb3VnaCBOQy1TSSB3aXRoaW4gUUVNVSwgYW5k
IHRoZQ0KdHJhbnNpdGlvbiBmcm9tIHVucHJvdmlzaW9uZWQgdG8gcHJvdmlzaW9uZWQuIFRoZSBt
ZXJnZSByZXF1ZXN0IGNvdmVyDQptZXNzYWdlIGhhcyBhbiBleGFtcGxlIG9mIHRoaXMuDQoNCklm
IGV2ZXJ5b25lIHdvdWxkIHByZWZlciwgSSBjYW4gc3VibWl0IHRoaXMgcGF0Y2ggc2VyaWVzIHRo
cm91Z2ggdGhlDQptYWlsaW5nIGxpc3QgaW5zdGVhZCBvZiBhcyBhIEdpdGxhYiBtZXJnZSByZXF1
ZXN0Lg0KDQotIFBldGVy
