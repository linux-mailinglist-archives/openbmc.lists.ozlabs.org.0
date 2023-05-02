Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F56F959A
	for <lists+openbmc@lfdr.de>; Sun,  7 May 2023 02:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDQSL2ykhz3bpn
	for <lists+openbmc@lfdr.de>; Sun,  7 May 2023 10:35:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ahZJkD5g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ahZJkD5g;
	dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9gY33PZYz3brK
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 23:15:00 +1000 (AEST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34289ZxS006907
	for <openbmc@lists.ozlabs.org>; Tue, 2 May 2023 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=0W9bvMRufvxdf2Bi2d/ilJh1K+V2/h31Oefy2t4JUik=;
 b=ahZJkD5gyi9pkDOF+jvtNL/NL3pa6tG6JUOAwfPNlfFzMYzqp/FPggLNBjV0d0MPSLIY
 Dsi5Eoyll1qAlKVTVeb3Q5pPvUILFNiXO+NTZQb8q2ysodP6YsqkSACr40j/QaR7r0r4
 lSQDCOAhqLD5JdoJVqoq919W/UtCN/9iNsG5Wy4amVwaUWwG9ROCmyWqByVSuBql1M9S
 gUQ2KkVhFwnFivjMcRjLXGIyPKQaDaKBHH9msmQOJdpCj8l9YnRu0Dc/fC0iaJiBAYlr
 bC5usV9ZXls7KY3wmCRcLgC6ZcJ5GsgtxR119QBJFKbUqtM3IJTlGk3Twa6gLYqv4aHq eg== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3qaxrxj9rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 13:14:56 +0000
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 70F0780020A
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 13:14:54 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 01:14:38 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Tue, 2 May 2023 01:14:38 -1200
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 01:14:38 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCDM24RAY/+E5SYRfHp+VGA+ZJQ1iTgK0yWpGtWUDMfEvhWPKzQZnVm+8dfnkariK3VVBC9mVek3uKZFmbPyNUoHyXEIvAyyz3hD6tHRhVwqSnKOwAWMaG3wllbYmRUCrMb6OTB6DPd6ohn8v+Zo9rnXsxy8S4Ahm4dnMzr8l5uEz3pIitUGtGUAjNnfPkT26ZtQFM6NpnGK4Cd+FGbLd8YsWwaKxqVcLHr09/pb3fezBOM12EHh1kaxafLWiabsIIPoZuZlNe7pNYe5COsl9/NSq7CfCaL48F4/sqDCD9Ojd/xYD/uAbXOB9RrCltTHGsK3mAl9Ebl8psZ3NF4CwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W9bvMRufvxdf2Bi2d/ilJh1K+V2/h31Oefy2t4JUik=;
 b=Sv4gjLRcTQ424cQC6bnZjnOdH4vARWtShm1KHcc/WH0Pjxkg9eYJcBvt8zVlq+vhK2bLvK4vE8iOL06/ZZYIhdgpqmavUR3j2C5YNz+OnIieov0TTM+lx+MEV0pTv8St0pDDX+J9PijwnHH4AihhrBbb+OnQW3mb5FVBZ7ckfy+7pJd5mKYhGb/NImgmrsua3v8g58ApisbgI/fPlAZe+kAkbUUf7p5B2jNTLuru0K2MO8KTAP2t+3vzeJhX16iytuJCG4sxFulTcTtJIb6Viod926/OW+rOFQjb4btYhY3vcb5qCSNte45cU7gk8jHeGbD1NxNa0nFI0kA40KxZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4f::17) by
 MW5PR84MB1817.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20; Tue, 2 May 2023 13:14:36 +0000
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e]) by DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e%6]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 13:14:36 +0000
From: "Verdun, Jean-Marie" <verdun@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Meetup in the bay : Save the date June 13th
Thread-Topic: Meetup in the bay : Save the date June 13th
Thread-Index: AQHZfPgLAZ9WvIM81kqix+teFXTBHg==
Date: Tue, 2 May 2023 13:14:36 +0000
Message-ID: <F27617ED-03D8-4B2E-B4B3-228AA055BF29@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1976:EE_|MW5PR84MB1817:EE_
x-ms-office365-filtering-correlation-id: adfde87e-731a-46b4-e60a-08db4b0f2d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: usEt0QUVhI3gsiMa3OCpQVXgdYKUm3w1w4YTOk8o6zmGofV3b3Kn+urNMeJCR2WzH/vKD+8LSdgm5HGUxinQEwuIFbNCZX87+PeD30Xl5gduw+UOqbCKNnLnXPMAss6D5kgUAzOgpbwMQQpqz2SK66460V/5BE+8e1oVqA5Udb8Pir0SRJWQVV0m7eRDx+8YYjGXYaI3dusF1MGo/pp3dvLZqr9H9z/cDDPp+65w9J26AuaI852lCjWFXNru5hoLBIMDgGGMN2+kPc22IuTjG1ruFhaQrOrhOcVizKFqM32hmwKdFTpuFUiiuvTlkJfbCX3nvR1t1cJfAUitGn87qhK8zFBLyUobmHZbqD8GXl6ujDefa9nG5vrErOOVqJWUIGz7UGT4e4hrPzavjBRG9c28ubsBQ3Qk/O8aUfxKl7Q+LasaarpqPqCzihbo4sAQEUETHGZMwOdAlcJa/IZBfsMDMlMKZSi18JTqmQkOG1Wp6IoveM1riQDPtp7NTgPoVevL38BwTfPEuQf9nW3kXpJtc8aA3rX8UcGbHrC6cYMm8b38a+oqj/EvSjVaq16+INeC9znU/ag6t2b8Fk5EvsoX3CdXbm7ZyLnC0+6wMLKOLqfmWBIhCQLKZPgkiqmMKoOp/czI6iUOPpa9YFgT7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(5660300002)(86362001)(2616005)(83380400001)(186003)(6506007)(6512007)(82960400001)(166002)(26005)(122000001)(38100700002)(38070700005)(8676002)(8936002)(9326002)(478600001)(33656002)(966005)(6486002)(71200400001)(316002)(36756003)(41300700001)(6916009)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnQ4Y0VSRFNaZTBqU2tZQXpla3NhVG1VekR6NUNKWmNDSXg5ZXNONUhSUHNK?=
 =?utf-8?B?MWpneHVGOGpEckpJcWNOOHRabnNoQm5ycGxEZGN5dm5oemlYZHBVbHA4ZlJL?=
 =?utf-8?B?aWpQME9hZk9EMzBqSm1FeHAyU1I4U0llK1dTZ3lla00xaUNyLzhRU0MzNGh1?=
 =?utf-8?B?SWlVdXZpbWVraXlqNUpSWmVPZnFRZ0tHOHh5UnlRaXBsK2V3UnpWb3VSbC9j?=
 =?utf-8?B?WC84L21ZYWNCL1BvK01wRzZaWlc3YWRlWlhLRDZyeFl1Y3ZpNTRvMG9MdFds?=
 =?utf-8?B?L1RwYlh3c3g5TnpyRUhFL3RQRnp5bG1TbTRPUk16Vy9xSjhmWVcyMGIydVc0?=
 =?utf-8?B?ZW1kYlRzNGJKUDU3WHJ1WEp2eld0ckNZVzFaenNmK08xYUswVW1ldU5IdkxB?=
 =?utf-8?B?aCtDZ2o1b2xBcmU2L1BMOXRZQnBkd3RSQmJiSHEyL0lORU1aM3YrRTlmNlBO?=
 =?utf-8?B?RWRucU9RWXZiQVFpVlVRTkFHL3BDWVFVUUgzcGQ2S2RHaFlKRkxPZWxHdklY?=
 =?utf-8?B?c0pKTERKbEZrWFBKZG83QUZXaGRkOVlvRXBPejZHTmVWWDhGQXZRQVRzS3Ix?=
 =?utf-8?B?Lzgzem5MWWVocXE2SFVDbWE4eXl0VG1KeW03eTBhSERBUDFvZE9CRkJTamps?=
 =?utf-8?B?OWpORFM5eEJoRmh0bGgwWVd1azFFZzkvaEMrdWY2VDhlTEZoTTZ4MzU5ekVR?=
 =?utf-8?B?S3J3UE1UTlVXdVBVU0RudU9VVWN2YWxsSUhHQi9pWUNFcjlPSEF2ZytINjE5?=
 =?utf-8?B?cTR5TnFCWEM1Y3p4MHJIL0lqMGlGMFRLOFVBTS94NXFEaWFYbXpIZHRvZXFt?=
 =?utf-8?B?S09CeHVKZXNmMFhXL3daQ0hKU2lNZlE0WFhFQnl6YS85NW10ZmthMlhrUkls?=
 =?utf-8?B?SFhHeGZnZDBlRVNRTmlRMFdDcDVZalNrc2M3V3hmT2NVVndsY0NpdzJYNTY3?=
 =?utf-8?B?U3g0eEZ2TGY5QjVvUGU0clBOaGQyN1lBQzgyYjRmZXVUWEhtMDM3STkzYVpu?=
 =?utf-8?B?b2V6d0EvbFJxSUlUQUFxREpBYVg2L2hTbjVDQ2FESmRma2dzdFA3R0ZiTnBu?=
 =?utf-8?B?K3RSenpFcENKcTJXZ2VIbzhWNXY2OTlNRUY2ZTkxN3dXRGJUeGUrWjNYZzVj?=
 =?utf-8?B?ZE12UzZYblZrMStaR24rbnJUTk0rQWtYakN6N0tPUWRNNitEWS9GVS8xUXRq?=
 =?utf-8?B?dm5sWHpaYm16RjU5dnF2cWRqOUtyckFpU0hlb25yOGMvU1o5R0dHUitLWUEy?=
 =?utf-8?B?MmFRcm15TUNXWmZKYXEveDFDRmt4UHd5WGE3dFQvSHZudnpuc1JTSHkwRUpE?=
 =?utf-8?B?Mzc3WDkvZjdKbk5EdFQzOW5jOUFqYlM1SnlPNExVVHR0S21ka3laU3JSUklz?=
 =?utf-8?B?ZEk5ZDluaEloelRWSnY4bWxKdVIvT2hxVmJZT0xVTE9YQUZWUkdWTWZsblpT?=
 =?utf-8?B?MW9uWDc2eFlSUy9YaHhGbE0zcmdjb1FJRk83bllrVnRUOFIwUWdEb2FsVS94?=
 =?utf-8?B?SjBGRXNvNnFOeDVUUzdEeWtmd2I5ZTRMWXRQbXUrMktJQ3lXZ1FldEtWaTZJ?=
 =?utf-8?B?SUpwWkRjVkRSVE1aeXNBYU1TSUVSMk9XVXBQUXRVMFd6YkdOSHpGN2ZXUk1Y?=
 =?utf-8?B?eUVRd0ZadmxLSkhvRU9NTzJjd0dZazBzVnpVWTIrWCtSdjBvTDQ5TEdvc3BI?=
 =?utf-8?B?TEpNSTJ6Y2N2VUZRV1RySG1RRnFjY3NKNVBtRTJ0cVgrVDlKUURXbS96RnU2?=
 =?utf-8?B?ajV4YzRYVUNKUnBMMTBKY095Ti80ZXNtNkQzK0xJSXVLUXNOQ2ZOa09RREF1?=
 =?utf-8?B?b2tOcDhiMVgxZ2l6ejk4c1YveXI3N3RseEJFT0dKdWFOcWdpR29BYTRxdXkz?=
 =?utf-8?B?K1RZVWY5Ri9Cbnd3ZjM3L2wvL2s5RUVmbFF0Y3lsOUlxSXFMTWhlaDY2OEhK?=
 =?utf-8?B?ZWZKelE3N3NEOURHR0pvMWNqKzZpbGdiRUxFYVFlMjVYQ3NCM1FJcERCenRk?=
 =?utf-8?B?cVlDbmhpcW4vVFNxNDJCRHBNeEFBTWJmai9LQk9TT1hYVTEvL2hFMGx2d0t6?=
 =?utf-8?B?cGNkNlpDMTVEZlZZTmtVT3RJQ0ZRZkV2RmFrYjZPNkRFMStSSDRDNWEwQ1BC?=
 =?utf-8?Q?PfUIJ7RQet/hIHXqkDbu0YdRp?=
Content-Type: multipart/alternative;
	boundary="_000_F27617ED03D84B2EB4B3228AA055BF29hpecom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adfde87e-731a-46b4-e60a-08db4b0f2d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 13:14:36.3553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6D35O3Cc5DjbD0WTqYpoqEIZn0e6R4BLsBpCj08ETbTFDI77BLfgnzn0Syb3PfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1817
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: zvKJXd9V9DjSKpM4cgNQ4H4llxJfsYkg
X-Proofpoint-GUID: zvKJXd9V9DjSKpM4cgNQ4H4llxJfsYkg
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020112
X-Mailman-Approved-At: Sun, 07 May 2023 10:35:01 +1000
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

--_000_F27617ED03D84B2EB4B3228AA055BF29hpecom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkkgaGF2ZSBwb3N0ZWQgeWVzdGVyZGF5IG9uIGRpc2NvcmQgdGhlIGFubm91bmNlbWVu
dCBvZiBhbiB1cGNvbWluZyBtZWV0dXAgb24gSnVuZSAxM3RoIHdoaWNoIHdpbGwgYmUgaG9zdGVk
IGF0IEhQRSBjYW1wdXMgaW4gU2FuIEpvc2UuIGh0dHBzOi8vd3d3LmV2ZW50YnJpdGUuY29tL2Uv
b3BlbmJtYy1iYXktYXJlYS1tZWV0dXAtdGlja2V0cy02Mjg2MjU5MjYwNjcNCg0KVGhhdCBtZWV0
dXAgaXMgb3BlbiB0byBhbnlib2R5LCBvbmx5IHJlZ2lzdHJhdGlvbiBpcyByZXF1aXJlZCB0byBr
ZWVwIHRoZSByb29tIGNhcGFjaXR5IHVuZGVyIGNvbnRyb2wuIFdlIHdpbGwgYmUgZXhwbG9yaW5n
IGhvdyBPcGVuQk1DIHdvcmtzIG9uIEhQRSBQcm9MaWFudCBtYWNoaW5lcywgYW5kIGRpZyBpbnRv
IHRoZSB0ZWNobmljYWwgYXNwZWN0IG9mIGl0IGluY2x1ZGluZw0KDQogICogICBSb20gY2hhbm5l
bCBjb21tdW5pY2F0aW9uDQogICogICBSb20gY29uZmlndXJhdGlvbg0KICAqICAgR1hQIEFzaWMg
YXJjaGl0ZWN0dXJlIGFuZCB3aGVyZSBkbyB3ZSBzdGFuZCByZWdhcmRpbmcgc2VjdXJpdHkgYW5k
IGxpbnV4IGRyaXZlcnMNCiAgKiAgIFNwZWNpZmljcyBuZWVkZWQgZm9yIHRoZSBQcm9MaWFudCBm
YW1pbHkNCg0KSSBhbSBvcGVuIHRvIG90aGVyIHRvcGljcyBmcm9tIG90aGVyIGhhcmR3YXJlIHZl
bmRvcnMsIG9yIGNvbW11bml0eSBtZW1iZXJzLiBQbGVhc2UgcGluZyBtZSBpZiB5b3Ugd2FudCBy
dW4gYSBxdWljayB0YWxrIGR1cmluZyB0aGF0IG1lZXR1cC4gT3VyIGNvbW11bml0eSBjYW7igJl0
IGV4aXN0IHdpdGhvdXQgeW91Lg0KDQpIb3BlIHRvIHNlZSB5b3UgaW4gdGhlIGJheSAhDQoNCklm
IHlvdSBhcmUgaW4gRXVyb3BlLCBkbyBub3Qgd29ycnkgdG9vIG11Y2ggd2Ugd2lsbCBzZXR1cCBh
bm90aGVyIG1lZXR1cCBzb21ld2hlcmUgaW4gU2VwdGVtYmVyLg0KDQp2ZWptYXJpZQ0K

--_000_F27617ED03D84B2EB4B3228AA055BF29hpecom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1850343D1791484D990605E1203B6DD4@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJcGFub3NlLTE6NSAwIDAgMCAwIDAgMCAwIDAg
MDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0x
OjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJp
Ow0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
ZjsNCgltc28tbGlnYXR1cmVzOnN0YW5kYXJkY29udGV4dHVhbDt9DQphOmxpbmssIHNwYW4uTXNv
SHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRl
eHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5Nc29MaXN0UGFyYWdyYXBoLCBsaS5Nc29MaXN0
UGFyYWdyYXBoLCBkaXYuTXNvTGlzdFBhcmFncmFwaA0KCXttc28tc3R5bGUtcHJpb3JpdHk6MzQ7
DQoJbWFyZ2luLXRvcDowaW47DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltYXJnaW4tYm90dG9tOjBp
bjsNCgltYXJnaW4tbGVmdDouNWluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJbXNvLWxpZ2F0dXJlczpzdGFuZGFyZGNvbnRleHR1YWw7
fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30N
Ci5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29y
ZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBp
biAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi8qIExp
c3QgRGVmaW5pdGlvbnMgKi8NCkBsaXN0IGwwDQoJe21zby1saXN0LWlkOjEyMDI3OTA2MzY7DQoJ
bXNvLWxpc3QtdHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxhdGUtaWRzOi0xNDk5ODUzNzM0
IC0xNzg4MTg1MTAwIDY3Njk4NjkxIDY3Njk4NjkzIDY3Njk4Njg5IDY3Njk4NjkxIDY3Njk4Njkz
IDY3Njk4Njg5IDY3Njk4NjkxIDY3Njk4NjkzO30NCkBsaXN0IGwwOmxldmVsMQ0KCXttc28tbGV2
ZWwtc3RhcnQtYXQ6MDsNCgltc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxl
dmVsLXRleHQ6LTsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVy
LXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZvbnQtZmFtaWx5OiJDYWxp
YnJpIixzYW5zLXNlcmlmOw0KCW1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OkNhbGlicmk7fQ0KQGxp
c3QgbDA6bGV2ZWwyDQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2
ZWwtdGV4dDpvOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6IkNvdXJp
ZXIgTmV3Ijt9DQpAbGlzdCBsMDpsZXZlbDMNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YnVs
bGV0Ow0KCW1zby1sZXZlbC10ZXh0Ou+CpzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZv
bnQtZmFtaWx5OldpbmdkaW5nczt9DQpAbGlzdCBsMDpsZXZlbDQNCgl7bXNvLWxldmVsLW51bWJl
ci1mb3JtYXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Ou+CtzsNCgltc28tbGV2ZWwtdGFiLXN0
b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6
LS4yNWluOw0KCWZvbnQtZmFtaWx5OlN5bWJvbDt9DQpAbGlzdCBsMDpsZXZlbDUNCgl7bXNvLWxl
dmVsLW51bWJlci1mb3JtYXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Om87DQoJbXNvLWxldmVs
LXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQt
aW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30NCkBsaXN0IGwwOmxl
dmVsNg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ6
74KnOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRp
b246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6V2luZ2RpbmdzO30N
CkBsaXN0IGwwOmxldmVsNw0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNv
LWxldmVsLXRleHQ674K3Ow0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1u
dW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6
U3ltYm9sO30NCkBsaXN0IGwwOmxldmVsOA0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxs
ZXQ7DQoJbXNvLWxldmVsLXRleHQ6bzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28t
bGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZvbnQt
ZmFtaWx5OiJDb3VyaWVyIE5ldyI7fQ0KQGxpc3QgbDA6bGV2ZWw5DQoJe21zby1sZXZlbC1udW1i
ZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgqc7DQoJbXNvLWxldmVsLXRhYi1z
dG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50
Oi0uMjVpbjsNCglmb250LWZhbWlseTpXaW5nZGluZ3M7fQ0Kb2wNCgl7bWFyZ2luLWJvdHRvbTow
aW47fQ0KdWwNCgl7bWFyZ2luLWJvdHRvbTowaW47fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxi
b2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9Indv
cmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGksPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGhhdmUgcG9zdGVkIHllc3RlcmRh
eSBvbiBkaXNjb3JkIHRoZSBhbm5vdW5jZW1lbnQgb2YgYW4gdXBjb21pbmcgbWVldHVwIG9uIEp1
bmUgMTM8c3VwPnRoPC9zdXA+IHdoaWNoIHdpbGwgYmUgaG9zdGVkIGF0IEhQRSBjYW1wdXMgaW4g
U2FuIEpvc2UuDQo8YSBocmVmPSJodHRwczovL3d3dy5ldmVudGJyaXRlLmNvbS9lL29wZW5ibWMt
YmF5LWFyZWEtbWVldHVwLXRpY2tldHMtNjI4NjI1OTI2MDY3Ij4NCmh0dHBzOi8vd3d3LmV2ZW50
YnJpdGUuY29tL2Uvb3BlbmJtYy1iYXktYXJlYS1tZWV0dXAtdGlja2V0cy02Mjg2MjU5MjYwNjc8
L2E+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGF0IG1lZXR1
cCBpcyBvcGVuIHRvIGFueWJvZHksIG9ubHkgcmVnaXN0cmF0aW9uIGlzIHJlcXVpcmVkIHRvIGtl
ZXAgdGhlIHJvb20gY2FwYWNpdHkgdW5kZXIgY29udHJvbC4gV2Ugd2lsbCBiZSBleHBsb3Jpbmcg
aG93IE9wZW5CTUMgd29ya3Mgb24gSFBFIFByb0xpYW50IG1hY2hpbmVzLCBhbmQgZGlnIGludG8g
dGhlIHRlY2huaWNhbCBhc3BlY3Qgb2YNCiBpdCBpbmNsdWRpbmc8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8dWwgc3R5bGU9Im1hcmdpbi10b3A6MGluIiB0eXBlPSJkaXNjIj4NCjxsaSBjbGFzcz0i
TXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZl
bDEgbGZvMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJvbSBjaGFubmVsIGNvbW11
bmljYXRpb248bzpwPjwvbzpwPjwvc3Bhbj48L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFw
aCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJvbSBjb25maWd1cmF0aW9uPG86cD48L286cD48L3Nw
YW4+PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDow
aW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5HWFAgQXNpYyBhcmNoaXRlY3R1cmUgYW5kIHdoZXJlIGRvIHdlIHN0YW5kIHJlZ2FyZGluZyBz
ZWN1cml0eSBhbmQgbGludXggZHJpdmVyczxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PGxpIGNsYXNz
PSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxl
dmVsMSBsZm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+U3BlY2lmaWNzIG5lZWRl
ZCBmb3IgdGhlIFByb0xpYW50IGZhbWlseTxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PC91bD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+SSBhbSBvcGVuIHRvIG90aGVyIHRvcGljcyBmcm9tIG90aGVyIGhh
cmR3YXJlIHZlbmRvcnMsIG9yIGNvbW11bml0eSBtZW1iZXJzLiBQbGVhc2UgcGluZyBtZSBpZiB5
b3Ugd2FudCBydW4gYSBxdWljayB0YWxrIGR1cmluZyB0aGF0IG1lZXR1cC4gT3VyIGNvbW11bml0
eSBjYW7igJl0IGV4aXN0IHdpdGhvdXQgeW91LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+SG9wZSB0byBzZWUgeW91IGluIHRoZSBiYXkgISA8bzpwPg0KPC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SWYgeW91IGFyZSBpbiBFdXJvcGUsIGRv
IG5vdCB3b3JyeSB0b28gbXVjaCB3ZSB3aWxsIHNldHVwIGFub3RoZXIgbWVldHVwIHNvbWV3aGVy
ZSBpbiBTZXB0ZW1iZXIuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij52ZWptYXJpZSA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_F27617ED03D84B2EB4B3228AA055BF29hpecom_--
