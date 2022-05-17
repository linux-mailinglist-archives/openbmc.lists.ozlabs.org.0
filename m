Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C552A5E9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 17:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2fth20YTz3c7K
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 01:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=dH627MFT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=61362a5906=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=dH627MFT; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2fsw6Rcfz3cFb
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 01:19:16 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24H8JLqN008641;
 Tue, 17 May 2022 08:19:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=erVnR4yGlXsYHIE6IhG0vccg1c5wlq1/QbOYYYkrcV0=;
 b=dH627MFTuRBCgu0Wx8zh4pzzLe5PjSoeGT8qU4NGB09zM1kQ/WqBfmz/Lcr58+nTBAdh
 oSiTcBJ037uvPULpPm5MT/sAEYafc3ZZShnOSaLDwg7o3OJL91Qy0qKTzTaaIvqjQpcU
 G57OZ54jQePQVsHpiKvpVL4uAa+y7jhner0= 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g4836jdbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 08:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR/zdNpUygMnNvCHOUcpNddX4zwUTQ8UO7g/aNkp056y8gIAz6ylb3TTutSOpIP7lteOz6HUB/rIV5oUzSO05GPIDoLZ7Nqc5Fhx7PS9bCvhOjM3H0Wc2+BfMUscuRaGfN60H1TeNIavPTXLT9q1YiILmtt7FkMpfqFGVlo77T3YYOSVhl/0zKwZsxx2SL6ISxjSCCsrr5dImCLLhLTPr21j5pTsOyIMHFdzg6a4hud69vKwv4/uy7zvYjnJmr6g9oP1DT6YJjQwN1QsXOjJSTzOdCDCB//U0JASlIpeRgZkE3F5Qd+CZ0kAGf/AXgBBo0StESwyBBZBVoJ/Nnq4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erVnR4yGlXsYHIE6IhG0vccg1c5wlq1/QbOYYYkrcV0=;
 b=WGDYftfBZ2M40lev7tNeEYqKU8IdqHC3F/5TJCR1H3p3ztzgUjOXUSxK85Q/+9Lp+HJ7DEhT7IOBZAWSAt/RvkcpCfJorsmTBx30XLVuJnnfpvppSyjW6JRwl2EK2f90XFIulFNSvTOlGgqGhmWhMNvPYYZ3lJHGgbGEXqitirylqxjwFXskAGlK8Cl5mMLKGz1lDelPcXdvUMCR8tx1N5vV+py1uNmgCZM0WlXIcUqTg4wDl+ORg3PzWR3NIKXVRje76rMWRUxqXolqv4nNy5Tb6rW0FUUU3iBAfm1XfYOrMNmjCdXlGurQsgFjrNIE2wZmXnKGoCQ+rNVsstlUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BLAPR15MB3858.namprd15.prod.outlook.com (2603:10b6:208:255::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 17 May
 2022 15:19:03 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:19:03 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH] libslirp: ncsi: Add Mellanox Get MAC Address Handler
Thread-Topic: [PATCH] libslirp: ncsi: Add Mellanox Get MAC Address Handler
Thread-Index: AQHYagFTI98VSIbtJEW/2RY8vmMQDK0jLt+A
Date: Tue, 17 May 2022 15:19:03 +0000
Message-ID: <F458276F-A8DB-43DF-9936-8AB88ADB72C9@fb.com>
References: <15BA17CB-BDE6-4B34-B5F2-EBD1EA4BFEAF@fb.com>
In-Reply-To: <15BA17CB-BDE6-4B34-B5F2-EBD1EA4BFEAF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cb0a6fb-cd41-4408-96e3-08da381893ab
x-ms-traffictypediagnostic: BLAPR15MB3858:EE_
x-microsoft-antispam-prvs: <BLAPR15MB385828B7A02D34325E2AD3D5ACCE9@BLAPR15MB3858.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GVTbAx/SWsWk/o6syxwgZzTz91omP4cm7lDk9Z1YJj31sAxlISLOBUZJzE27Oqpc4DpmQ0QDzoVOcTCffanxHNsiP14pmcslR4QUeirUQa0MGcHK6rptMkm6dVpsY9dYzCd7X0xWf9n3RHiE3d0zj1vnCjUCB007JAOL+lKE+tQ/TuBMnxggf/kisKA6dj/HJaYZc2dQfIVenL6si0HJb51YUMkwxBn7g+FgqsLX5oGaadsK81mO7QzMdk2SXLp01+FVD+Zk0G2dcVVrSRbBDig6EDPeHwv9pG8FZVT8F7n5/NY9QiLn6bmTXeQ6xElLZIxwi5awvMLW30Vepqxyrr/VHjxjQ0wlloMbetF5U5vWeQj6jypenEnUh5ekI0tdGXyCZQ+ABaD4nCTrCgnmtuOELMWhqiwRt6aDqB+L3AXs+uVotCws3CK4cl65GJKQS5fER2P0GTXOzQ1p8+h2SguoJf40jDBvrdcFL2+D9kGxvGa8Lk4AGuUg0pY+fPUnZFzvSvOtElvNvfBYCohrES2KqeCABw27J4UC7diidyyYcnkq6ab4LbLuiGQHC50fO59HTU5cfeqEqvD0k3FS2cYLl09mJO9W9Oq+tr010jNW6GVUe/9IwvPmx3GTYqBYGDTnKs+uK4UHN/wa0/JQEPV/bN8Oqt1pSQjH8jhCV0hDdgn3eat0a9izHm7seXrQ9vxhco7gqAfpxtnRqUjvqb/MjJ5oOCews1vSXXa8+zyhxEMZrwkYjy/2AzYLEAMR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(36756003)(38100700002)(38070700005)(122000001)(316002)(8936002)(71200400001)(2616005)(109986005)(2906002)(6506007)(6512007)(5660300002)(54906003)(83380400001)(86362001)(76116006)(64756008)(66476007)(66446008)(33656002)(66946007)(66556008)(4326008)(186003)(6486002)(4744005)(966005)(8676002)(508600001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckhjd2FiN3U3cUVhRkk5ZXJ0cWdYR1FLRHc0VVp6QVFZRUpwd1NLa3NKcW9q?=
 =?utf-8?B?Z0pTWTJHdit5YWNXWDF6MFpIb2ZSVWRBZ2VBc2ZLL2dJZldQWFVVRW5PWThE?=
 =?utf-8?B?MEZZNzFIdlcrd2owY0hqZC8vNTNrT0ZKL01XdkNJc3pLVGpUTmowU3lOcFpx?=
 =?utf-8?B?ZVEvcC95bGVidmI3enRzcGJHL1F6Z05naW9SNDdzNFA0K3l0RXJpMEdFbU1B?=
 =?utf-8?B?R084Q3NObUg4MGlEYkhUU3VMcW92UHFmZnA3aUtUY3VZaFFqR0VyM1Vycm9w?=
 =?utf-8?B?UGdOZzd4UkxtTFNCUG1ra1dSUkNwM0E2RXRmK1lnUnZKS1JuZXp6QW9jdmxi?=
 =?utf-8?B?b0FFdWRaZjlGRkJmc0NFeUVMNENOY1BqaUoxNmZOUGtsSE96TGFrSms5NDdC?=
 =?utf-8?B?d1dQbjVodTBzN3JBTlZmNzZ4S2hrTTBwQW5GbTljbDFzZ1B2TFc1SHF6WVh2?=
 =?utf-8?B?Wm1YUlZ0QXYwVVp6dXBKbGtkTjBKY2pmSmJIZ2FGdTEyTjRVOTAvZGh1bUlV?=
 =?utf-8?B?YzkzWUlya3dsL3pZMU9qNkZRKzlpNWF5dE5STmRWZlNiY0t4WU96TXRjcGNr?=
 =?utf-8?B?aHI5TGZhQzVreHlNN1pZSHFBeFdJM2xWVVlzRHRmTXB3RXlFTkdaK29HakpL?=
 =?utf-8?B?N1ZHN3ZnWFI1UU5FUnBoNHRMdFpuRE9vK2RsOG1XdVEyMEFvVnVYYlM4SjVv?=
 =?utf-8?B?OU45RW5YMll2bnpBSkhEalNTb09EVUV5U28ybHdpaDVsMDE5WGtab3luM21V?=
 =?utf-8?B?c2hCektxaEFNaFNCNERzTXU4cy95dHNzWmlPenVqQjBPdDBFN2hHbjFXVGYy?=
 =?utf-8?B?d00yUXVKQ0oxbjhZalJkMUc0YlNoMldIdWQyL2trYmozSFpFdkVmbCtwNlk0?=
 =?utf-8?B?dnkxNG9pOXVUTEVFNFFGL3R2V1paZkxTd1B2dCsza2hRMmpuVU4zOGVhQlN6?=
 =?utf-8?B?NlpYYndSQngrRloxajdMekxnbnl6NmxzU2tRQkdJeDBBVmxZR2dQbENkSTM1?=
 =?utf-8?B?MHFkZE1IQWJRZlpNNk1lY2RaZ01LbU13NXFQNElXS1JsOXhub1M4MlppR3B3?=
 =?utf-8?B?dktZNExqYTF2d3VRS3lwQ3JLbGhGTTFjWDg4MWR5eHJCMDg1clk1SmN1SXZD?=
 =?utf-8?B?bG5ucHZGSHVsVnBFOU5Gd2p3bFlnK2xEdEdRMXRUL3ZNa05INXlWVVhXK3Nr?=
 =?utf-8?B?b2NQZU9ZT0ZYVGVvR0tIaTg5NjhVNEFFVXBiR3JUVXNRc2xQWU1TSDFCTjNN?=
 =?utf-8?B?ckNFRmN4VnhJYmxYTSs2bnpTZDlUS1FWai9ScFRwSENMV214Tm5XRnJsdXI3?=
 =?utf-8?B?RTRnUUVsajRjelZtRHBiOUc4MzhCZFBNVU1sZk4xbldYMWw5VnhyT0N5MEFG?=
 =?utf-8?B?Qm1vNTFYSHBxQlhsMDhhNk5IdXVjOTIrTmcxbGZLQUNVNjFucEdwN3VEQmVp?=
 =?utf-8?B?OHlKaGZNNVdCR0JtcHpEMWtoMjZCZGZINUhJeFIvUHFZU1dYMURDdFN4czNU?=
 =?utf-8?B?cUdqQTEwc3pJUFd6eHNaZXFMZVdwTlZKTzFhVmpVK2tSeVBHZC9iZGhDdWtv?=
 =?utf-8?B?cTBld0FEK0JwM09wQjJwUlZnZU51UlB5NnJBalRVV3ViQ0Z6SEMxNHpsOWtz?=
 =?utf-8?B?SHBnYkZXNStRTnZ5QWQ2bkNEaXZwSldsaEtLYm9yeVB5VW12RWthQ2RuWm92?=
 =?utf-8?B?ZTFCRldXbUFNM0dRRlJVNnNpMjh0K1JGK2ZNZDc4QVIwTjdiTXBSbnBWanF1?=
 =?utf-8?B?aFh4SmNMZ0c5OTI5V0FPZ2VqRjE1d3BDcVI5dGkwUEVVWDJaS0JrY2hkWUQy?=
 =?utf-8?B?KzJKZSs5dTJMdFovRlpOSUpmSXo4a096NU5YcExmQTNFcHVQVC9lY1BiMC9O?=
 =?utf-8?B?d3dTSndNRkRialZ0RGpDVjFRdUdLeVYxMnArM2JKNUVSRnBVVDF5clRZQk1n?=
 =?utf-8?B?U1FSdGFvQ05WSkc3clJLMXlMd0hpdXlnd2tIK2lYRzcrdmlmZ1pUQkVmYUlz?=
 =?utf-8?B?OE95V21ZZTIrZW1GNnRzd09EZDVDSUM3UFlLL2dtU2M1NXc5TStralRIU0Ra?=
 =?utf-8?B?SG5CSExWY20zc2pyZkNCZ0k1MExCR1NhekZqRUl3c3dldUVzcy93bi9jZG9r?=
 =?utf-8?B?Q0NjeXZ0TGw2dWZPSGJ0cHc2RTc2OUFyVFM1NWVCYVhnaEI5ZXp6V3pUeGZO?=
 =?utf-8?B?QnpwZ2lKRHJpbXg1aGNoOG1MS3pabklTdDdRSW1yUFZFeHpnQnBKT3R3eDhZ?=
 =?utf-8?B?Tk5EdmJtZ0RzQW5WeXMzeUdLV3lrM3JtK09qWVlOaWN6SE1TWmhFM3V3aXRl?=
 =?utf-8?B?eWlRdDJ1ZE9CTnJTNmxOK3p2Smt2ajhObzBpa3F3b3JIVUF2ZngzTG5uT21B?=
 =?utf-8?Q?Rr27C/5iTzvmNp2U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CBB29DC9DFE3A4DB79D27FA83D4719F@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb0a6fb-cd41-4408-96e3-08da381893ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 15:19:03.3900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hK0WLRgZxZ2aCR4unylLEcS7qY1CLhvGOVV4kq7Q7s+n+O/uPI0llOz05UfWjQxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR15MB3858
X-Proofpoint-GUID: jQBsxWWL8K-qR8R-vtc8fwE0k7dlE27a
X-Proofpoint-ORIG-GUID: jQBsxWWL8K-qR8R-vtc8fwE0k7dlE27a
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

DQoNCj4gT24gTWF5IDE3LCAyMDIyLCBhdCA4OjE4IEFNLCBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QGZiLmNvbT4gd3JvdGU6DQo+IA0KPiBIZXkgQ2VkcmljLA0KPiANCj4gU2luY2UgeW91IHdlcmUg
dGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGUgTkMtU0kgY29tbWFuZCBoYW5kbGluZyBpbg0KPiBs
aWJzbGlycCwgSSB3YW50ZWQgdG8gaW5mb3JtIHlvdSBvZiB0aGlzIG1lcmdlIHJlcXVlc3QgSSBt
YWRlDQo+IHRvIGV4dGVuZCBpdCB0byBzdXBwb3J0IGFuIE9FTSDigJxHZXQgTUFDIEFkZHJlc3Pi
gJ0gY29tbWFuZC4NCg0KV29vcHMsIGZvcmdvdCB0aGUgbGluayB0byB0aGUgbWVyZ2UgcmVxdWVz
dCwgSSBqdXN0IHBvc3RlZCBDZWRyaWPigJljDQpvcmlnaW5hbCBjb21taXQgbGluay4NCg0KaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNsaXJwLy0vbWVyZ2VfcmVxdWVz
dHMvMTI1DQoNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGlycC9saWJz
bGlycC8tL2NvbW1pdC80NjQwOTQ0MmJlYTQ3OWVkOThjZTQ4YWRmMGU0OGRhNTQ2NzdmYTdjDQo+
IA0KPiBBbHNvIG5vdGlmeWluZyBQYXRyaWNrLCBoZSBoYWQgYSBjaGFuZ2UgaW4gT3BlbkJNQyB0
aGF0IGhlIGNvdWxkbuKAmXQNCj4gdGVzdCBpbiBRRU1VIHdpdGhvdXQgdGhlc2UgY2hhbmdlcy4g
VGhlc2UgY2hhbmdlcyBsZXQgeW91IHRlc3Qgb3V0DQo+IE9wZW5CTUMgTUFDIGFkZHJlc3MgcHJv
dmlzaW9uaW5nIHRocm91Z2ggTkMtU0kgd2l0aGluIFFFTVUsIGFuZCB0aGUNCj4gdHJhbnNpdGlv
biBmcm9tIHVucHJvdmlzaW9uZWQgdG8gcHJvdmlzaW9uZWQuIFRoZSBtZXJnZSByZXF1ZXN0IGNv
dmVyDQo+IG1lc3NhZ2UgaGFzIGFuIGV4YW1wbGUgb2YgdGhpcy4NCj4gDQo+IElmIGV2ZXJ5b25l
IHdvdWxkIHByZWZlciwgSSBjYW4gc3VibWl0IHRoaXMgcGF0Y2ggc2VyaWVzIHRocm91Z2ggdGhl
DQo+IG1haWxpbmcgbGlzdCBpbnN0ZWFkIG9mIGFzIGEgR2l0bGFiIG1lcmdlIHJlcXVlc3QuDQo+
IA0KPiAtIFBldGVyDQoNCg==
