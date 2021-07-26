Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F573D5AC5
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 15:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYLyB6xHdz30FK
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 23:54:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=LbRlg2DG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0841f3dd56=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=LbRlg2DG; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYLxr0X9Fz2xgJ
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 23:54:04 +1000 (AEST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QDmaD3031679; Mon, 26 Jul 2021 13:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=sHpGe14M0N/gwiOV00RkL8m1fUCOJignC8rvDyujJWk=;
 b=LbRlg2DGhHHaXab6hNMwdVP4AWodrJnqi2Q5URT9CvHKcPmnwHCTFOR4Rf0DbN97aJAE
 uDQj46NxgfkZC0E8v9D3oaHX97tgIQTzhyaGQ9mlZWK15iG0DYpy7YV7dL3eRUEmXq2I
 +BF15OkYQgQpfWg9nGgPheS9Ux5i3GyuSLGnWfltW0wRu9Gaf+41DuP6FkKIeXI5LnlJ
 HEta46KHo9CXF9V25bTZvdEBm8eP2lLDye8NCe528m6CbgSm/cm5IeB4tVQuG7SFiOsJ
 u+B5JuvwY1xbzbb45Njbn2jpD5ZTOVtK74yRzMGaykTK2AxMjEvFJjX7n8o9r5btKonO BQ== 
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 3a1vdes3f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 13:53:51 +0000
Received: from G9W8454.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.216.161.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2353.austin.hpe.com (Postfix) with ESMTPS id 91D1B6D;
 Mon, 26 Jul 2021 13:53:50 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 13:53:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.241.52.10) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Mon, 26 Jul 2021 13:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB6TC3E10SZdYx660gXLm5REC+Axy5YjoYiSy3mNmOulJLgwIrXq92vQWtWCEnEJF1TlZTzEWyNbMS9ZIfMRB+dK14tckNpcIgwFPn9QTJAuHYBYT+4YVUD8xY5T4Rsh6JgJPHlzGUUmY06RBw4f+Ys+aWgnIbCoDelMWvzfWo0r/FUD/v+pcomDgm/xN4G3pQUTlHWCG+ZaEkiIjeJpFPbBvefwdzsITFwg2AuPSTkl+r1nym1eKpmNKFetl6JQXcbSf4/0dxKpEaPypKmno53MMutxG9dbp7fVWXorM8HUVusmu/NbcqzSaPa2FoQiRfF08LJxJgOdX2LLUYreOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHpGe14M0N/gwiOV00RkL8m1fUCOJignC8rvDyujJWk=;
 b=CY+3UbygKNS6Du/GEZGXTr0OXMy8TsOugQkWgAnB0x5aj/ghrdiwFna6YxaRSf0/nZyecfjQzxZSG6qGoSwJi3y1xAhhOxs2lXrKikgCeEAsABSPRWnmuVfZ42tpVuCB2zCxDujxTZuozcnl3/6RFHzjggVSqxKJk5lK1XVncUKWH86szkfyfH/S+oMin39bhLGfa+m7YU7lUWhbfFWWfZKkZrr19HIRh8MWb6uIQzjlemJvMQMpcamDzqYSvN4fbz+gnG5PIK33LM9zaDQR7GkzSEgRmnjW5ie5BSCRTks6KBgGj4y5tRq9guoRUV5erOLYA26jUanNqS8MEBbU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB1131.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7613::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 13:53:49 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 13:53:49 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Ed Tanous <edtanous@google.com>, Deepak Kodihalli
 <deepak.kodihalli.83@gmail.com>
Subject: RE: RDE Enablement
Thread-Topic: RDE Enablement
Thread-Index: AddeNQks2n5bD9svT5WNVI3gUyZzFAAAqgIAB/TfnQAADDPhAAD6PYXg
Date: Mon, 26 Jul 2021 13:53:49 +0000
Message-ID: <DF4PR8401MB0634736D1564778F52DA52138FE89@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <CAM=TmwWJ58RaUhjW9axXdyPDSsePG0zQsnxh-FKSj4C5nZG0Kg@mail.gmail.com>
 <CAH2-KxCxy0G6cYRPkOKe+YQBX1h7No--fn7JLDz4yskwTMjyOw@mail.gmail.com>
In-Reply-To: <CAH2-KxCxy0G6cYRPkOKe+YQBX1h7No--fn7JLDz4yskwTMjyOw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2579ffd5-c815-44d9-74c1-08d9503ccb9f
x-ms-traffictypediagnostic: DF4PR8401MB1131:
x-microsoft-antispam-prvs: <DF4PR8401MB11311DBF9F68280491945C388FE89@DF4PR8401MB1131.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BnML/nhPZfYdXLPbyMwS+A5sHLztVbQpZ0t1EO/m2MakP3nVDHxhb8mapGgsIyBeLrMtpcF1ecV6yfI0UGKAVEfOJEwFmhhWug0tcCQ4RRsB+PwyhsKSK7dvEkt8kJYI+0NMKCGxLt6bk6OdosmGjl2My1ts/Luemi3tO1qHPyWoNpgqWc10W/gx0QOGhZjaWN8xLaVRTO+SpZqAfcVEOkoZegMWbkxksC3VIgYOE+bsr8ytNdGFK2KGGfpgt4aW5jvLJK8I1JV7GMmWHddWlY12OmTiC8j7G2f0m+wBuzB+ZoXBKR+uFgNhSS/162vhqEresIDapGA2tmNJgKGN1Qlv1uDltTfMFGp2PBy2ukiZiMrMQ3WTYSWRyh9AM9JGujS80k7rwfa/F6dzRMHB9i3MIoS1u74ZBP4lcWk+zM4RYd4tFpJ+fr0UezxP0AW6sNQzH5tiuS2v+bOLmRN8v5FPPKPBWay9rxf2dtxiQqkN52qoe9pkFy8k4asvobgBKJrJryklwkcJT6KFkRyxSNAQ2r7XB88S5vWNMj5dNx3gEEH6JpMxhT85pdjFUVJUcU1LJHbzjwmOTSd+4BzvhUHrYSbHvJHsuWi2OW9ZAs3c2A2bGMvHNiAMcfdyvFpOiHcVwwO3N3UHMa7wF9z8SPwWgVyIBRtIn6BUwffoEekm2XISRbdmqyW53O5iuTUcGTSOmpA8KKcCKg6t7S4GDZX7Ku+00dJJGr7yGFXeaDY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39860400002)(376002)(396003)(366004)(66946007)(316002)(7696005)(71200400001)(86362001)(110136005)(66556008)(66446008)(76116006)(66476007)(186003)(3480700007)(55236004)(2906002)(6506007)(26005)(83380400001)(478600001)(7116003)(52536014)(53546011)(33656002)(8676002)(122000001)(9686003)(55016002)(64756008)(38100700002)(5660300002)(8936002)(4326008)(367364002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW9uaXdlaDI5UzIzU3Y4MlR6Q0h6eWJLeDh6ZCtrcStSR3RRL3dQdkhUcGVL?=
 =?utf-8?B?cTlqRm9tVVN0QjdDSEtHN3Jhd0preXFCVm5QUUUxN3R5WVRCQ08zMm9EeTJx?=
 =?utf-8?B?aHAwS0pVcG5GSFdmT1lKQWZtMUpIODVBd1RJdExGVmcxQzNHZzZVQlNxQjZn?=
 =?utf-8?B?Vjg5em93Q3pUYjYxZFNQek1sdC8za3lkODdLYzRqZmZZRGZpSWU4VnFZa3J1?=
 =?utf-8?B?TzFlem5paTYwSFcvTlRvYVM4YTVpRVhmQnA3UDEvR1c0aWJlVjdXMm0xUit6?=
 =?utf-8?B?Um9vVDBaSUFLelNFOHVzbkxWSThSUzNSek1IdERRV0hjdXZnMnpXREtUMnBG?=
 =?utf-8?B?MlJsVzRwK3FvWGM0NnNuY2Y1eXpDTlYvQktIVm9KYVBuVEtpSGVJeDI4ZTJR?=
 =?utf-8?B?bGo1WGNuakNjelpBb25IR1RsY1VwK3hyS1VFQzF6azRRM0I4ZWh0cTZPcjZ4?=
 =?utf-8?B?RWxYdHBkZ0M5RDdCaHFaTGd0REliZ1NHT2N4NEFkRUdYT2N4R0dEU3p1WDBR?=
 =?utf-8?B?NkZ3WklVN0MxbFVicjZPa0FWbG9VR0RkelorWkhaamhQaXNmNFF2ZUdGS01K?=
 =?utf-8?B?Zm9JYzRjU1ZPc2t0UjI0Ri9JMzc0RmZCbkowYy9WNGJtd1JYc1ZSQWlsMEt6?=
 =?utf-8?B?Z1g5UGZvQUtSTGRoWjhMZUxQZ1dyUERyTVZEWWtqUXBleWlhblRHeGdQTDYw?=
 =?utf-8?B?VkNGTDhXN2JRLzEvaVRDbit4YkJUU09LcWQwZGQ0OWF1cWV4TE1SbUMxcmgw?=
 =?utf-8?B?YVdRb1NZNnVFVEtFeXY1c25PL1phbGRPandhMEZrVWpXNjhBblQ4cU9hVXUx?=
 =?utf-8?B?bC9nR2FGWjZYeG9sVHZtOXFnMXVxRlBNTEVITUhiczRneGs1cm5hU2RueFFS?=
 =?utf-8?B?dmFkNlo5bFRZajR5aXBtVEhPOEtBaTRZYXg1N2lLVG9KODFTcGdQK0M5d09Y?=
 =?utf-8?B?WVpmSjlNSUk4NFhEUlowVHI0Zmxra3UwWi9TYXA0NjlzQXo0ZlNJazNOMHR6?=
 =?utf-8?B?Mm8yODNJN0REMXcwRHpobFBCMlppOUxYYUFXdXlLU2pvNmFkdDRHOVJMdzdo?=
 =?utf-8?B?ZXRxeDk4ZEFlK1NNQXkrTGtTRFVoZUJFMk5tTGpBZklBZnVvdWtiVjVJbUdk?=
 =?utf-8?B?WUp2UG5wcUdFS0dxUkhlaStsZXhnaEFsR0VCOFhjb3I4UFFoWTJHak53aTFT?=
 =?utf-8?B?ZWVGak9UcDJYQW9KQmpYVGNoN2lnMXVWNE9PN1ROUWZnQUdzMDBxWGV0UjZV?=
 =?utf-8?B?OCtSaHNpWFMvaWpueGcxdEIwVjluVlVINm9qQzRXZXdFVWQ5WDhRSnlwV0d5?=
 =?utf-8?B?VmRKWG0wVS85ZnFDZTlqd0JYUDA1QXIyS2xJZ0hXS0Y3a0RydXR6aTBqWHRE?=
 =?utf-8?B?OWlWR2pORFZZb3V2dzZjaW9OcWFpSVBrUUVGT3ptcThnRzU2dHNzVmt6bk5W?=
 =?utf-8?B?WUxCZnRvUGVNc1NWSzdlTG5hNEN6OUZWRlpPaXZsUHRteXhwWkY4NmIxN3dS?=
 =?utf-8?B?eFVGc05QMTFybjRrbnRpclJEUzdVUFE3ZElLMlpQTXMzVThxL3J1aUJBWUlJ?=
 =?utf-8?B?MlZHQXFkMGR3RnNsZjRhVFM0cDNRNVI4VGVleXhDdUhwQVFvcGZva3BkVjc2?=
 =?utf-8?B?ZFFpT1FBYjBLNWxSbkI5RXZhUG5BZjNxb2V6ckEraW5oS3E5d0VXa2lvbGZa?=
 =?utf-8?B?ZFVURUkzeUxLTVVMUTNOTmt2cDJOODJoQ0Z4OWsySGQwdno3TXlBYXRoWE9r?=
 =?utf-8?Q?9q2WD0v90Qsk10X5kVjGgFJuzkF1i40J8tBSIk/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579ffd5-c815-44d9-74c1-08d9503ccb9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 13:53:49.2761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRbhknlZYMB8en1aZQWUH8a3oTAt+j3Y8B2VPCYVMoyAndC8xrCxH5Q8nCVLrU0O0UGYj45gEyjX0fWGnaGY5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1131
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: iQhj-EvGdeCM5wwvbuGC4bIxL_WEJ7gY
X-Proofpoint-ORIG-GUID: iQhj-EvGdeCM5wwvbuGC4bIxL_WEJ7gY
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_06:2021-07-26,
 2021-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1011 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260078
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

U29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlIGJ1dCBjb21tZW50cyBpbmxpbmUuDQoNClRo
YW5rcywNCg0KTWlrZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEVk
IFRhbm91cyA8ZWR0YW5vdXNAZ29vZ2xlLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIx
LCAyMDIxIDk6MjQgQU0NCj4gVG86IERlZXBhayBLb2RpaGFsbGkgPGRlZXBhay5rb2RpaGFsbGku
ODNAZ21haWwuY29tPg0KPiBDYzogR2FycmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkg
PG1pa2UuZ2FycmV0dEBocGUuY29tPjsNCj4gT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KPiBTdWJqZWN0OiBSZTogUkRFIEVuYWJsZW1lbnQNCj4gDQo+IE9uIFdl
ZCwgSnVsIDIxLCAyMDIxIGF0IDE6MzQgQU0gRGVlcGFrIEtvZGloYWxsaQ0KPiA8ZGVlcGFrLmtv
ZGloYWxsaS44M0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4g
T24gRnJpLCBKdW4gMTEsIDIwMjEgYXQgMjowMiBBTSBFZCBUYW5vdXMgPGVkdGFub3VzQGdvb2ds
ZS5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIFRodSwgSnVuIDEwLCAyMDIxIGF0IDE6MjYg
UE0gR2FycmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkNCj4gPiA+IDxtaWtlLmdhcnJl
dHRAaHBlLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEdyZWV0aW5ncywNCj4gPiA+ID4N
Cj4gPiA+ID4gSSdtIGFtIGludGVyZXN0ZWQgdG8ga25vdyBpZiB0aGVyZSBoYXMgYmVlbiBhbnkg
b3JnYW5pemVkIGRpc2N1c3Npb24gb3INCj4gZGV2ZWxvcG1lbnQgb24gUmVkZmlzaCBEZXZpY2Ug
RW5hYmxlbWVudCAoUkRFIC0gRE1URiBEU1AwMjE4KSBmb3INCj4gbW92aW5nIGVuY29kZWQgUmVk
ZmlzaCBkYXRhIGFjcm9zcyBQTERNL01DVFAgaW50ZXJmYWNlcy4gIFdlIGFyZQ0KPiBpbnRlcmVz
dGVkIGluIHByb21vdGluZyB0aGlzIHN0YW5kYXJkIGFuZCBhcmUgd2lsbGluZyB0byBsZWFkIGEg
cmVmZXJlbmNlDQo+IGltcGxlbWVudGF0aW9uIGZvciBPcGVuQk1DIGlmIHRoZXJlIGlzIG5vdCB5
ZXQgc29tZXRoaW5nIGluIHByb2dyZXNzLiAgSWYNCj4gdGhlcmUgaXMgc29tZXRoaW5nIGluIHBy
b2dyZXNzLCBjYW4geW91IHBvaW50IG1lIGF0IHRoZSB3b3JrIGJlY2F1c2UgSQ0KPiB3b3VsZCBs
b3ZlIHRvIHNlZSBpdC4NCj4gPiA+DQo+ID4gPiBXZSBhcmUgaW50ZXJlc3RlZCBpbiB0aGlzIGFz
IHdlbGwsIGFsdGhvdWdoIHdlIGFyZSBpbiB0aGUgZWFybHkNCj4gPiA+IHN0YWdlcyBvZiBsb29r
aW5nIGludG8gaXQuICBJZGVhbGx5IHdlJ2QgbGlrZSB0byBoYXZlIE9wZW5CTUMNCj4gPiA+IHN1
cHBvcnQgYWRkIGluIGNhcmRzIChOSUNzLCBBY2NlbGVyYXRvcnMsIGVjdCkgdGhhdCBzdXBwb3J0
ZWQgdGhpcw0KPiA+ID4gZnVuY3Rpb25hbGl0eSwgYW5kIG1ha2UgdGhhdCBkYXRhIGF2YWlsYWJs
ZSB0byB0aGUgbm9ybWFsIE9wZW5CTUMNCj4gPiA+IGNoYW5uZWxzIChSZWRmaXNoL2lwbWkvZWN0
KS4NCj4gPg0KPiA+IEkgaGFkIGEgY291cGxlIG9mIHF1ZXN0aW9ucyBvbiBSREUsIGFuZCBJIHdv
bmRlciBpZiB0aGlzIGhhcyBjcm9zc2VkDQo+ID4geW91ciBtaW5kIGFzIHlvdSBzdGFydGVkIGxv
b2tpbmcgYXQgUkRFLCBvciBpZiB0aGlzIGlzDQo+ID4gbWlzdW5kZXJzdGFuZGluZyBvbiBteSBw
YXJ0Og0KPiANCj4gQXMgYSBwcmVmYWNlLCB5b3UgbWlnaHQgY29uc2lkZXIgYXNraW5nIHRoZXNl
IHF1ZXN0aW9ucyBvbiB0aGUgRE1URiBmb3J1bXMNCj4gaWYgdGhleSdyZSBub3Qgc3BlY2lmaWMg
dG8gT3BlbkJNQy4gIFRoZSBhdXRob3JzIG9mIHRoZSBSREUgc3BlYyBhcmUgcHJlc2VudA0KPiBp
biB0aG9zZSBwbGFjZXMgYW5kIGdlbmVyYWxseSBoYXZlIGdvb2QgYW5zd2VycyBmb3Igd2hhdCB0
aGUgImludGVudCIgd2FzLg0KPiANCj4gPg0KPiA+IDEpIEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxl
bSBSREUgdHJpZXMgdG8gc29sdmUgaW4gdGVybXMgb2YgYXZvaWRpbmcNCj4gPiBoYXZpbmcgZGV2
aWNlLXNwZWNpZmljIGtub3dsZWRnZS9jb2RlIG9uIHRoZSBCTUMsIGJ1dCBkb2Vzbid0IFBMRE0N
Cj4gPiBhbHNvIHNvbHZlIGEgc2ltaWxhciBwcm9ibGVtPyBGb3IgZXhhbXBsZSwgaWYgYSBkZXZp
Y2Ugc3VwcG9ydGVkIFBMRE0NCj4gPiBUeXBlIDIgKGFuZCBvdGhlciBQTERNIHNwZWNzIHN1Y2gg
YXMgdGhlIG9uZSBmb3IgRlJVLCBldGMpLCB0aGUgQk1DDQo+ID4gY291bGQgY29udmVydCBQTERN
IHRvIFJlZGZpc2guIEkgdW5kZXJzdGFuZCB0aGlzIG1heSBub3QgYmUgYXMNCj4gPiBjb252ZW5p
ZW50IGFzIFJERSBidXQgaXQgc3RpbGwgc29sdmVzIHRoZSBkZXZpY2Utc3BlY2lmaWMgY29kZQ0K
PiA+IHByb2JsZW0sIFBMRE0gYmVpbmcgYSBzdGFuZGFyZCBwcm90b2NvbCBhcyB3ZWxsLiBBbSBJ
IG1pc3NpbmcNCj4gPiBzb21ldGhpbmcgaGVyZT8gSXMgaXQganVzdCB0aGF0IFJERSBpcyBtb3Jl
IGNvbnZlbmllbnQgdGhhbiBQTERNIHRvDQo+ID4gUmVkZmlzaCBjb252ZXJzaW9uLCBvciBpcyB0
aGVyZSBtb3JlIHRvIGl0IC0gZm9yIGV4YW1wbGUsIFBMRE0NCj4gPiBjYW4ndC9pc24ndCBpbnRl
bmRlZCB0byBiZSBjb252ZXJ0ZWQgdG8gUmVkZmlzaCwgaW4gYW4NCj4gPiBlZmZlY3RpdmUvbG9z
c2xlc3Mgd2F5Pw0KPiANCj4gRnJvbSBteSBsaW1pdGVkIGtub3dsZWRnZSwgaXQncyBiZWNhdXNl
IFJERSBjYW4gYmUgbG9zc2xlc3NseSBjb252ZXJ0ZWQgdG8NCj4gUmVkZmlzaCwgYW5kIHRoZSBC
TUMgY2FuIHRha2UgdGhlIGZvcm0gb2YgYSBwcm94eWluZyBhZ2VudC4gIEluIHRoZSBQTERNIHRv
DQo+IFJlZGZpc2ggbW9kZWwsIHRoZSBCTUMgd291bGQgbmVlZCB1cGZyb250IGtub3dsZWRnZSBv
ZiBldmVyeSBpbnRlcmZhY2UNCj4gaW4gUExETSwgYW5kIGhvdyBpdCBtYXBzIHRvIHRoZSBSZWRm
aXNoIHRyZWUsIHdoaWNoIGNvdWxkIGdldCBvbmVyb3VzLiAgSW4NCj4gdGhlIFJERSBtb2RlbCwg
ZW1iZWRkZWQgY29udHJvbGxlcnMgZW5kIHVwIHRha2luZyB0aGUgc2FtZSBmb3JtIGFzIGFuDQo+
IGluZGl2aWR1YWwgc2VydmVyIHdvdWxkIHRvIGEgcmVkZmlzaCBhZ2dyZWdhdG9yLCB3aGljaCBp
cyBhZHZhbnRhZ2VvdXMgaW4gdGhhdA0KPiBhbGwgdGhlIGFnZ3JlZ2F0b3IgY29kZSBjYW4gYmUg
cmV1c2VkIChpZiBPcGVuQk1DIGhhZCBhbiBhZ2dyZWdhdG9yKS4NCj4gDQpbTWlrZUddIA0KSSBh
Z3JlZTogIEZpcnN0IG9mIGFsbCwgUkRFIGlzIFBMRE0gKHR5cGUgNikuICBQTERNIHR5cGUgMiBp
cyBhIGdvb2Qgc29sdXRpb24gZm9yIHNlbnNvcnMsIGJ1dCBSREUgYWJzdHJhY3RzIG1hbnkgb2Yg
dGhlIG90aGVyICJub24tc2Vuc29yIiBhc3BlY3RzIG9mIGRldmljZSBtYW5hZ2VtZW50IGluY2x1
ZGluZyAiYWN0aW9ucyIuICBGb3IgZXhhbXBsZSwgUkRFIGNhbiBlbmFibGUgYSBCTUMgdG8gcHJl
c2VudCBhIHN0b3JhZ2UgY29udHJvbGxlcidzIGxvZ2ljYWwgdm9sdW1lcywgY29tcGxldGUgd2l0
aCB0aGUgYWN0aW9ucyBuZWVkZWQgdG8gY3JlYXRlIG5ldyB2b2x1bWVzLCBvciByZW1vdmUgdGhl
bS4gIFNvbWUgYWRhcHRlcnMgbWF5IG9ubHkgbmVlZCBUeXBlIDIgc2Vuc29yIGluZm9ybWF0aW9u
LCBidXQgbWFueSBhZHZhbmNlZCBhZGFwdGVycyBoYXZlIGEgbXVjaCBtb3JlIGNvbXBsZXggbWFu
YWdlbWVudCBpbnRlcmZhY2UsIGFuZCBhIFJlZGZpc2ggbW9kZWwgdG8gbWF0Y2guICBJbiB0aGVz
ZSBjYXNlcywgYSBzb2xpZCBSREUgaW1wbGVtZW50YXRpb24gd2lsbCBwcm92aWRlIGEgd2F5IHRv
IG5vdCBoYXZlIHRvIGxpbmsgaW4gYWRhcHRlci1zcGVjaWZpYyBvciB2ZW5kb3Itc3BlY2lmaWMg
bWFuYWdlbWVudCBsaWJyYXJpZXMgdG8gdGhlIEJNQy4gIEFkZGl0aW9uYWxseSwgc2luY2UgdGhl
IFJlZGZpc2ggbW9kZWwgY29tZXMgZnJvbSB0aGUgYWRhcHRlciwgaXQgc2hvdWxkIGJlIG1vcmUg
Y29uc2lzdGVudCB3aGVuIHRoYXQgYWRhcHRlciBpcyBpbnNlcnRlZCBpbnRvIHZhcmlvdXMgc3lz
dGVtcyB3aXRoIGRpZmZlcmVudCBCTUMgaW1wbGVtZW50YXRpb25zLCBhbGxvd2luZyB0aGUgYWRh
cHRlciB0byBoYXZlIG1vcmUgY29udHJvbCBvdmVyIGl0cyBSZWRmaXNoIHByZXNlbnRhdGlvbi4g
IEZpbmFsbHksIFJERSBpbmNsdWRlcyB0aGUgY2FwYWJpbGl0eSB0byBzaWduYWwgUmVkZmlzaCBl
dmVudHMgdG8gdGhlIEJNQywgd2hpY2ggY2FuIHRoZW4gYmUgdHJhbnNtaXR0ZWQgdG8gc3Vic2Ny
aWJlcnMuDQoNClRoZSAiZ29vZCIgaXMgdGhhdCB0aGVvcmV0aWNhbGx5LCBSREUgb2ZmZXJzIHZl
cnkgaGlnaCBmaWRlbGl0eSBSZWRmaXNoIG1hbmFnZW1lbnQgb2YgYW4gYWRhcHRlciB3aGlsZSB0
aGUgQk1DIG1vc3RseSBwbGF5cyBhIHBhc3N0aHJvdWdoIHJvbGUuDQpUaGUgImxlc3MtZ29vZCIg
aXMgdGhhdCBmb3Igc29tZSBhc3BlY3RzIG9mIG1hbmFnZW1lbnQsIHRoZSBCTUMgd291bGQgbmVl
ZCB0byBwYXJzZSB0aGUgZGF0YSBhbmQgYWRkIGl0IHRvIGRidXMgZm9yIHRoaW5ncyB0aGUgQk1D
IHdpc2hlcyB0byBhZ2dyZWdhdGUgKGUuZy4gdGhlIHNlbnNvciBtb2RlbCkgLSB0aGluZ3MgVHlw
ZSAyIGRvZXMgd2VsbC4NCg0KDQo+ID4NCj4gPiAyKSBJcyBSREUgc3BlY2lmaWMgdG8gYSBjbGFz
cyBvZiBkZXZpY2VzPyBTb21lIG9mIHRoZSBkb2N1bWVudHMgSSBzZWUNCj4gPiBzdHJlc3Mgb24g
SS9PIGFkYXB0ZXJzLiBXb3VsZCBiZSBpdCBvZGQgdG8gaW1wbGVtZW50IFJERSBvbiBkZXZpY2Vz
DQo+ID4gbGlrZSBBY2NlbGVyYXRvcnMsIENQVSwgZXRjPw0KPiANCj4gUkRFIGlzIG1lYW50IGZv
ciBkZXZpY2VzIHdpdGggYSBzbWFsbCBmb290cHJpbnQuICBUaGVyZSBoYXMgYmVlbiBkaXNjdXNz
aW9uIGluDQo+IHRoZSBwYXN0IGFib3V0IGFsbG93aW5nIGl0IG9uIHRoZSBob3N0IGludGVyZmFj
ZSBmb3Igc3RhbmRhcmQgb3V0IG9mIGJhbmQNCj4gY29tbXVuaWNhdGlvbiwgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhhdCBldmVyIG1hdGVyaWFsaXplZC4gIFB1dHRpbmcgaXQgb24NCj4gYWNjZWxlcmF0
b3JzIG9yIENQVXMgc2VlbXMgbG9naWNhbCB0byBtZSBnaXZlbiB0aGF0IHRoZWlyIGNvbnRyb2xs
ZXJzIGFyZSBzbWFsbA0KPiBmb290cHJpbnQuDQo+IA0KW01pa2VHXSANClJERSBpcyBub3Qgc3Bl
Y2lmaWMgdG8gYSBjbGFzcyBvZiBkZXZpY2VzLiAgSXQgaXMgYXBwcm9wcmlhdGUgd2hlbiBhIGRl
dmljZSBpcyAiYmVoaW5kIiBhIEJNQyBhbmQgaGFzIGEgUmVkZmlzaC1kZWZpbmVkIGRhdGEgbW9k
ZWwgdGhlIEJNQyBuZWVkcyB0byBwcmVzZW50IHRvIGNsaWVudHMuDQoNCj4gPg0KPiA+IFRoYW5r
cywNCj4gPiBEZWVwYWsNCg==
