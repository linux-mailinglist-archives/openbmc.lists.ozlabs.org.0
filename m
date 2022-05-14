Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3C526F9A
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 09:40:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0cqY2WB5z3cC5
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 17:40:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=Xgnp1xiR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6133f6f1dd=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Xgnp1xiR; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0cq62N0hz3bcp
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 17:39:40 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24E7W2iO006475;
 Sat, 14 May 2022 00:39:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=BDPype1fJMkl2QWlrhCqwp309lGQmYMsI48hFDDGmaE=;
 b=Xgnp1xiRUQQ6OY7xI+JXIErjsBV29susuvvbp1lL34MClpa7iEhRypTvx7qsoCgbdIPI
 ctFDpqxcYTeiQ+HdRjxMjsjFLTUbgBZN5osI7qVcMos4YMzaOCJbNkAiUjcCxks/01cd
 LJDziqS4ocH0lhyQUeCoaK2gxjn/K+2AkBk= 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by m0001303.ppops.net (PPS) with ESMTPS id 3g283w00ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 May 2022 00:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpoKxx1d3gNZoOSCfECwGXcSaMvBSHDZl3Fs6IbhIfuLi6x+k5By3ICfyJwMqlWqYOfe6qOx4vix7pkkZxerMA/xsqdn6SL3/hjKG3f43ziSEIVkIQPl53ec+z2WYYJc8+GEjdksG4JMUdC62f/UMLAhfsbwsZVtMhKlHKsC/St68bWHkijQaokf96yXMgElJwpPnmQkO1mpnTjTP632Dis9FXlsa1EVL+WIAHrpUffaCetttLBQnQrhkgpQEf6D0bw2/k8qCNsqSDqHGp1UglybeO3TqQvBeY8R5iqZ+cxIPseyXwqHTHvuU/uuV3S4blhNIIctFr4K52RdXllo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDPype1fJMkl2QWlrhCqwp309lGQmYMsI48hFDDGmaE=;
 b=HYXBEeVeu0rqVLdr3XvaHQNKQ4cSt9PE4hA/wN1R5wZrICGgb7BKKyBoF2Eaw1F8Ipco9W0lmi83FrsyvIF8MfjN+AWauCHNocT648TdmxNf0nr8uojdOTipCo3aWEHXMo/5rpwbjyfexXThAu6zXOtZEs1+2oNaAyymWzsSXnyOKXEbfaDRxbyGBBSnqIt7RWZBtEB+Q256ZVTL6jSuhuiwdCAxEJAtbJKuk1vwlljUSKV235vrQZ+YiazK5QceweeCX+LwWkLkGHTTJHR689CaaD97pSW6DIA/OYtv5XV/lma9cYTxBVwCSScbX9Yz9sbX6XBFio0Y5vyjXuqKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4154.namprd15.prod.outlook.com (2603:10b6:a03:2ca::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Sat, 14 May
 2022 07:39:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.016; Sat, 14 May 2022
 07:39:24 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Thread-Topic: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Thread-Index: AQHYZn6gmAj+rDnxXEK+xCqfrr3YeK0cSHIAgAEF34CAAK2jgIAAAoSA
Date: Sat, 14 May 2022 07:39:24 +0000
Message-ID: <5CBDFE96-B354-4EE6-BEA3-48E4CC68FBA5@fb.com>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
 <bcc23f78-e81c-f4b7-3dae-17c216eb9afd@kaod.org>
In-Reply-To: <bcc23f78-e81c-f4b7-3dae-17c216eb9afd@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76216363-83f3-4e52-f600-08da357cddf6
x-ms-traffictypediagnostic: SJ0PR15MB4154:EE_
x-microsoft-antispam-prvs: <SJ0PR15MB415496BED3972057F3457CEFACCD9@SJ0PR15MB4154.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HjqOylOnhds6FDFgWQSLRqME+L2GOnluUIvN8cHQuZXW7rfJjmqCGiCdz1N4U5GeygMuF0Qlf6mnm5r6Rzms0Z787O5xX58a4eUshdYniFVg4dBgdtPPo+rPCBKY6YPDR/XEGAAeZe1jEn9RUTYrFQBDicrmWchnvXOjj+K2S6WHnmWBX32QgjNY3L6HLQ7sTDz4uPoydIeDhcIB1Up06tLUDRTwC9Udc7Tn7PQ6Smd95HiWjfQ+tZsA4gmkjMZJnec65XCBXJcpeGW0uogKtDKK7E5d5HVKIM6NJe8+W8asoB9XG9Y8KGG6lMt8/3ldZKpfGcNXi/ez/mYB3K8ZDfeesBag/0vFUXuyjkDhCzKKOiEcYBk9jFgECtugzrmSfXueIhyCNAdRJu56w6sFopmEQJ9vaoEXASMsYI0zjNWJ28KlmkX6TQuRSed9StD7l/xhJoQCaZToCeS7IvcH50+tO/OAMYXluoLkQ+a/DLozXUzbbf1RG1QfhBloQWXnS5RvXCLMAHPVJzbMf10mG4juLKhqWlCCYwocVzUCxvLIDKhPkPRHN4QgN7lquk0WVg0Pyc1SUWjH3FyuTuw+SfOXq0ObtqPIS+jCvpHZDvuLVrdVLsl2sV3prEW8C5UFkyvYDrmkwDoNgNZtC9nbAwBLU/cHUo8K3CmlA0ZwpEt/knNf7lWzjSGNTzgc4uec6zjdZ3/qoaj4Sh1IEk9uMYZ2ARMo8MDq24xbUJp9bIdrSmrrcXogpEJ4+nzIPPwFfFTEbd6YyyBSd6/ViSJJ6maLM0B1EYdkV9xnJ3YWgwI5SNdHwWTnvsDcMS0cx8sW9FtyTIopcSt+TKEH5ZzVvKQGWAqU1CHufWT5nDVFAv4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(186003)(71200400001)(2616005)(6512007)(83380400001)(38100700002)(316002)(8936002)(966005)(6486002)(33656002)(66574015)(38070700005)(86362001)(76116006)(8676002)(64756008)(66476007)(5660300002)(2906002)(4326008)(66446008)(66556008)(91956017)(66946007)(109986005)(36756003)(6506007)(122000001)(508600001)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzlpY1VtRFg5Z0gzMCtST2VyZkx3bmxXYmg2WGljYWozU1JGV1BMbjNXZVZC?=
 =?utf-8?B?S1VvdFd1dExCSXlsb0svQ25zSFB4aU5jWG1UQXJUcmVwOW9veG1QY2FUUXFP?=
 =?utf-8?B?M3V5YTNKRG5tbThpalB4NlFtSEc1MlNBYjE4STlPVW5WRGNQM0xOT2h4SjZl?=
 =?utf-8?B?TWtwQVFhNURmRkw5dXdUc2FwRGtpNG40RHU2RW5pbllxSmRxTzhPbXljSThT?=
 =?utf-8?B?NytRanlVTmQ0Z2RsenFPM2ZhT3JHMlluZ0VsaGc3eFpRckc3ajBTa1QyNXNN?=
 =?utf-8?B?Y0FMWnA5LzV5eDYvSldlVXBTOHlMaldML0ZYOUxXbUJkQkRuQ1NhcWNNd0VD?=
 =?utf-8?B?MWl6SGRpU3EyNnExUkppRXJ4NmFCd3Rva042N2NrWUNPMzdjL3pmRm9yZkpN?=
 =?utf-8?B?eGFFYzhDMjNRVnorT3N3UndyeXdGN2lXc1JMZm5nYS9kdFNjMjJpYlEvdktS?=
 =?utf-8?B?djdGLzhRNHNZRGFZdkpqOEdXUENrM2kySWpYQThCK0h2bCsza0xaS1F0dkRR?=
 =?utf-8?B?N294L3N2L0JNdTE0MUpSVDNFdnl6cG4rNy8vSkpoZUhPU0kvUDk5VmtZb3Vz?=
 =?utf-8?B?Nit5S1FSaE1QdGRIOGswSVhSK0dQNGFNTGM5Y3ZQYmtENUsrT0xId1BmMk9m?=
 =?utf-8?B?aktGb3VyTHdSaS9tOUhObGVlVDFzZnRVREVFNlViZlRsN2lRVWxSeGhhaXB3?=
 =?utf-8?B?TDZiZEdUWUF6VFZhdmVOYTdBaUJzalhKSjVxeHoveFk0c3g5VjJCN0tYL2px?=
 =?utf-8?B?Y1BvVWVvakFQMm1UYndkL09CWlJJdVJ4L0ZSdXhGakNodnhkTWhjMThLcExu?=
 =?utf-8?B?WUdhcStvSzVBNXl3RjVFTzEyK0pjR0NDakE1Zk5OQVB6V0h2YW5IbjNBOGNX?=
 =?utf-8?B?bzk1VDNtaDRlQ2hRZU5hTFpYOFJSeGltSHJyc0lhcUZNV3FKMEhiL3RRbDZN?=
 =?utf-8?B?YXh5c2ZqUk9BSlZ0dTBaNS9zeFNJeXZYSDdFWVI0Ky8zdzlNelBaMzRQK0tm?=
 =?utf-8?B?dHlpVjNvUG5nWXZWTU85TnhGVHJnWlJyYmd6M2tEMXJDNE53L2IrY3RHWjJu?=
 =?utf-8?B?aEV1MlhXSXRZQ002bWZXZ1RQVHJPYXVoQ2F1aWlPN0FuYzZqSWI1Y2NQaUhU?=
 =?utf-8?B?eXRQWTlHcHVxVGpGUzZqcGRWYXBOVlBkYkFqMzlNZ1JhTE1hM0RUTVR2Q2Zu?=
 =?utf-8?B?NnBhcmdDZ0tPWjBia0dFVkxud3c4cmFyQU5UUFJTZGV5RnFSS09jNUQ0Tmdw?=
 =?utf-8?B?ZTcxdnQ4dTNjNXhrNXNvS2hscG1MYkhHV3VNU2Zicm9aQXBNMGxPa2NxUGhY?=
 =?utf-8?B?UHFmL0Z4M3IxbHl2c2l5bnpndWY4NmJoZUk5Q1A5NGtDaERqSUFjaVRRSmNq?=
 =?utf-8?B?Rk83UXBkZWIzeXQydG4wSGU1Wk5kY0EvUWloUWJXMCszQ2YvbEgyYWltOWtm?=
 =?utf-8?B?N2FQWi9TbWFISmxrSHMwNGdLWFJBN0VQWThxN2NNNWxSejRaMHphakc1S3gy?=
 =?utf-8?B?QVVIcDAwQ2xHRkl4eUJBb0hjeEJPeVBrd09SOVNGdnZkWWJWNkZnQW5pbG5r?=
 =?utf-8?B?U3VWUmMxUjY2Zm1QSkNGMkUrS20yY01nbTZoZ29oYjlSd1E2LzRVUDZ4by9k?=
 =?utf-8?B?VlZYMTlROVRYazNDck5sOVBzQ1B6RWprN2hoYXJzZlJHUmxyV0ZVVDlGL0Jn?=
 =?utf-8?B?WVAyM0VYWWFSVURmN2FsV0pGVkR1bDMxMzZBbDZJUmRYVnVuUHQySGNsRldw?=
 =?utf-8?B?d1BXN1VZNzFMb2orR1JmNGxoeHRqVEoyTFpXRGxRb1Q1b1ZRZ3VmK254d1VN?=
 =?utf-8?B?dmNqa21XeDhZMlBzbUU0S0NmRjkzaC9rQVpIWWtSbXJVc3BPL21adkdmU240?=
 =?utf-8?B?eHFaYUtFM1VrTC94WFFuR0MzSTNLY2FsM0lGU0YxMnF5TGpFT0wrMisyT3hn?=
 =?utf-8?B?ZC9NMUlZOWNjVWZnSThydnpESzVOb2l3bnhkSEZvRXNNZWRNWVlIVFV5NVVq?=
 =?utf-8?B?clcxckx0d0tCYzZ0UU1OR0xKcWpBTnZlSVVJaFdDcVJYK2FaQ1dvVzBKaUpD?=
 =?utf-8?B?UTFZSGlqS2VManNRSW9ZUkJ1WXBRUUpiN0RuNkJEb1lmTndmQ211R1lhNUl1?=
 =?utf-8?B?Y1loRHlMSzBHQXhXUE9nbVdpeStTdjd4WTUrNW5uUCtwaVByMWo4M2d3MEJ2?=
 =?utf-8?B?OFFuaE5DYTJ2TStMc28wYlJYM0JKT1dPSUNkM3VyQnZEczY0aFFnZHVoYWxq?=
 =?utf-8?B?RTZlOTdNSHNiRG9EdGNsNTV6QU5WcWtsTUVxeGdMaHo2QWM1ZVZTQnhUeHAy?=
 =?utf-8?B?VjZ1ZE1QOEo3cnBEdk1QZExpSWE3ZHdyWE1uYlNUNDhsY1ZBTGg1alRUWVdR?=
 =?utf-8?Q?BL36Hl09g5/Ts1k0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6906615CB3AFCF43956A8A8FD694D7C8@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76216363-83f3-4e52-f600-08da357cddf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2022 07:39:24.2044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DgpjG36K1Go3r/lhbiCM2bXRN3xC1to2+9zn4gmdON6FADwDR9jmvcXYxYJsWlq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4154
X-Proofpoint-GUID: RARtqDShZepIanc876mFhd8zW2-b1Y-q
X-Proofpoint-ORIG-GUID: RARtqDShZepIanc876mFhd8zW2-b1Y-q
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-14_02,2022-05-13_01,2022-02-23_01
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, Iris Chen <irischenlj@fb.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTWF5IDE0LCAyMDIyLCBhdCAxMjozMCBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA1LzEzLzIyIDIzOjA4LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4+IE9uIE1heSAxMiwgMjAyMiwgYXQgMTA6MzEgUE0sIEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDUvMTMvMjIgMDY6MDIs
IFBldGVyIERlbGV2b3J5YXMgd3JvdGU6DQo+Pj4+IFVzdWFsbHksIFFFTVUgdXNlcnMganVzdCBw
cm92aWRlIG9uZSBzZXJpYWwgZGV2aWNlIG9uIHRoZSBjb21tYW5kIGxpbmUsDQo+Pj4+IGVpdGhl
ciB0aHJvdWdoICItbm9ncmFwaGljIiBvciAiLXNlcmlhbCBzdGRpbyAtZGlzcGxheSBub25lIiwg
b3IganVzdCB1c2luZw0KPj4+PiBWTkMgYW5kIHBvcHBpbmcgdXAgYSB3aW5kb3cuIFdlIHRyeSB0
byBtYXRjaCB3aGF0IHRoZSB1c2VyIGV4cGVjdHMsIHdoaWNoIGlzDQo+Pj4+IHRvIGNvbm5lY3Qg
dGhlIGZpcnN0IChhbmQgdXN1YWxseSBvbmx5KSBzZXJpYWwgZGV2aWNlIHRvIHRoZSBVQVJUIGEg
Ym9hcmQgaXMNCj4+Pj4gdXNpbmcgYXMgc2VyaWFsMC4NCj4+Pj4gTW9zdCBBc3BlZWQgbWFjaGlu
ZXMgaW4gaHcvYXJtL2FzcGVlZC5jIHVzZSBVQVJUNSBmb3Igc2VyaWFsMCBpbiB0aGVpcg0KPj4+
PiBkZXZpY2UgdHJlZSwgc28gd2UgY29ubmVjdCBVQVJUNSB0byB0aGUgZmlyc3Qgc2VyaWFsIGRl
dmljZS4gU29tZSBtYWNoaW5lcw0KPj4+PiB1c2UgVUFSVDEgdGhvdWdoLCBvciBVQVJUMywgc28g
dGhlIHVhcnRfZGVmYXVsdCBwcm9wZXJ0eSBsZXRzIHVzIHNwZWNpZnkNCj4+Pj4gdGhhdCBpbiBh
IGJvYXJkIGRlZmluaXRpb24uDQo+Pj4+IEluIG9yZGVyIHRvIHNwZWNpZnkgYSBub25zdGFuZGFy
ZCBzZXJpYWwwIFVBUlQsIGEgdXNlciBiYXNpY2FsbHkgKm11c3QqIGFkZA0KPj4+PiBhIG5ldyBi
b2FyZCBkZWZpbml0aW9uIGluIGh3L2FybS9hc3BlZWQuYy4gVGhlcmUncyBubyB3YXkgdG8gZG8g
dGhpcyB3aXRob3V0DQo+Pj4+IHJlY29tcGlsaW5nIFFFTVUsIGJlc2lkZXMgY29uc3RydWN0aW5n
IHRoZSBtYWNoaW5lIGNvbXBsZXRlbHkgZnJvbSBzY3JhdGNoDQo+Pj4+IG9uIHRoZSBjb21tYW5k
IGxpbmUuDQo+Pj4+IFRvIHByb3ZpZGUgbW9yZSBmbGV4aWJpbGl0eSwgd2UgY2FuIGFsc28gc3Vw
cG9ydCB0aGUgdXNlciBzcGVjaWZ5aW5nIG1vcmUNCj4+Pj4gc2VyaWFsIGRldmljZXMsIGFuZCBj
b25uZWN0IHRoZW0gdG8gdGhlIFVBUlQgbWVtb3J5IHJlZ2lvbnMgaWYgcG9zc2libGUuDQo+Pj4+
IEV2ZW4gaWYgYSB1c2VyIGRvZXNuJ3Qgc3BlY2lmeSBhbnkgZXh0cmEgc2VyaWFsIGRldmljZXMs
IGl0J3MgdXNlZnVsIHRvDQo+Pj4+IGluaXRpYWxpemUgdGhlc2UgbWVtb3J5IHJlZ2lvbnMgYXMg
VUFSVCdzLCBzbyB0aGF0IHRoZXkgcmVzcG9uZCB0byB0aGUgZ3Vlc3QNCj4+Pj4gT1MgbW9yZSBu
YXR1cmFsbHkuIEF0IHRoZSBtb21lbnQsIHRoZXkgd2lsbCBqdXN0IGFsd2F5cyByZXR1cm4gemVy
bydzIGZvcg0KPj4+PiBldmVyeXRoaW5nLCBhbmQgc29tZSBVQVJUIHJlZ2lzdGVycyBoYXZlIGEg
ZGVmYXVsdCBub24temVybyBzdGF0ZS4NCj4+Pj4gV2l0aCB0aGlzIGNoYW5nZSwgaWYgYSBuZXcg
T3BlbkJNQyBpbWFnZSB1c2VzIFVBUlQzIG9yIHNvbWUgb3RoZXINCj4+Pj4gbm9uc3RhbmRhcmQg
VUFSVCBmb3Igc2VyaWFsMCwgeW91IGNhbiBzdGlsbCB1c2UgaXQgd2l0aCB0aGUgRVZCIHdpdGhv
dXQNCj4+Pj4gcmVjb21waWxpbmcgUUVNVSwgZXZlbiB0aG91Z2ggdWFydC1kZWZhdWx0PVVBUlQ1
IGZvciB0aGUgRVZCLg0KPj4+PiBGb3IgZXhhbXBsZSwgRmFjZWJvb2sncyBXZWRnZTEwMCBCTUMg
dXNlcyBVQVJUMzogeW91IGNhbiBmZXRjaCBhbiBpbWFnZSBmcm9tDQo+Pj4+IEdpdGh1YlsxXSBh
bmQgZ2V0IHRoZSBzZXJpYWwgY29uc29sZSBvdXRwdXQgZXZlbiB3aGlsZSBydW5uaW5nIHRoZSBw
YWxtZXR0bw0KPj4+PiBtYWNoaW5lIHR5cGUsIGJlY2F1c2Ugd2UgZXhwbGljaXRseSBzcGVjaWZ5
IHRoYXQgd2Ugd2FudCBVQVJUMyB0byBiZQ0KPj4+PiBjb25uZWN0ZWQgdG8gc3RkaW8uDQo+Pj4+
IHFlbXUtc3lzdGVtLWFybSAtbWFjaGluZSBwYWxtZXR0by1ibWMgXA0KPj4+PiAtZHJpdmUgZmls
ZT13ZWRnZTEwMC5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgXA0KPj4+PiAtc2VyaWFsIG51bGwgLXNl
cmlhbCBudWxsIC1zZXJpYWwgbnVsbCAtc2VyaWFsIHN0ZGlvIC1kaXNwbGF5IG5vbmUNCj4+Pj4g
U2ltaWxhcmx5LCB5b3UgY2FuIGJvb3QgYSBGdWppIEJNQyBpbWFnZVsyXSwgd2hpY2ggdXNlcyBV
QVJUMSwgdXNpbmcgdGhlDQo+Pj4+IEFTVDI2MDAgRVZCIG1hY2hpbmU6DQo+Pj4+IHFlbXUtc3lz
dGVtLWFybSAtbWFjaGluZSBhc3QyNjAwLWV2YiBcDQo+Pj4+IC1kcml2ZSBmaWxlPWZ1amkubXRk
LGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4+Pj4gLXNlcmlhbCBudWxsIC1zZXJpYWwgc3RkaW8gLWRp
c3BsYXkgbm9uZQ0KPj4+PiBUaGlzIGlzIGtpbmQgb2YgY29tcGxpY2F0ZWQsIG9mIGNvdXJzZTog
aXQgbWlnaHQgYmUgbW9yZSBuYXR1cmFsIHRvIGdldCByaWQNCj4+Pj4gb2YgdGhlIHVhcnRfZGVm
YXVsdCBhdHRyaWJ1dGUgY29tcGxldGVseSwgYW5kIGluaXRpYWxpemUgVUFSVCdzDQo+Pj4+IHNl
cXVlbnRpYWxseS4gQnV0LCBrZWVwaW5nIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgYW5kIHRoZSB3
YXkgbW9zdCB1c2Vycw0KPj4+PiBrbm93IGhvdyB0byB1c2UgUUVNVSBpbiBtaW5kLCB0aGlzIHNl
ZW1zIHRvIG1ha2UgdGhlIG1vc3Qgc2Vuc2UuDQo+Pj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
ZmFjZWJvb2svb3BlbmJtYy9yZWxlYXNlcy9kb3dubG9hZC92MjAyMS40OS4wL3dlZGdlMTAwLm10
ZA0KPj4+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL29wZW5ibWMvcmVsZWFzZXMv
ZG93bmxvYWQvdjIwMjEuNDkuMC9mdWppLm10ZA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBE
ZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IGh3L2FybS9hc3BlZWRfYXN0
MTB4MC5jIHwgMTQgKysrKysrKysrKystLS0NCj4+Pj4gaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMg
fCAxMCArKysrKysrKystDQo+Pj4+IGh3L2FybS9hc3BlZWRfc29jLmMgfCAxMCArKysrKysrKyst
DQo+Pj4+IDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4+Pj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWRfYXN0MTB4MC5jIGIvaHcvYXJtL2FzcGVl
ZF9hc3QxMHgwLmMNCj4+Pj4gaW5kZXggZjY1ZGMxMzlkYS4uNWU2ZjNhOGZlZCAxMDA2NDQNCj4+
Pj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9hc3QxMHgwLmMNCj4+Pj4gKysrIGIvaHcvYXJtL2FzcGVl
ZF9hc3QxMHgwLmMNCj4+Pj4gQEAgLTIxNSwxMCArMjE1LDE4IEBAIHN0YXRpYyB2b2lkIGFzcGVl
ZF9zb2NfYXN0MTAzMF9yZWFsaXplKERldmljZVN0YXRlICpkZXZfc29jLCBFcnJvciAqKmVycnAp
DQo+Pj4+IHFkZXZfZ2V0X2dwaW9faW4oREVWSUNFKCZzLT5hcm12N20pLA0KPj4+PiBzYy0+aXJx
bWFwW0FTUEVFRF9ERVZfS0NTXSArIGFzcGVlZF9scGNfa2NzXzQpKTsNCj4+Pj4gLSAvKiBVQVJU
NSAtIGF0dGFjaCBhbiA4MjUwIHRvIHRoZSBJTyBzcGFjZSBhcyBvdXIgVUFSVCAqLw0KPj4+PiAt
IHNlcmlhbF9tbV9pbml0KGdldF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbQVNQRUVEX0RF
Vl9VQVJUNV0sIDIsDQo+Pj4+IC0gYXNwZWVkX3NvY19nZXRfaXJxKHMsIEFTUEVFRF9ERVZfVUFS
VDUpLA0KPj4+PiArIC8qIFVBUlQgLSBhdHRhY2ggODI1MCdzIHRvIHRoZSBJTyBzcGFjZSBmb3Ig
ZWFjaCBVQVJUICovDQo+Pj4+ICsgc2VyaWFsX21tX2luaXQoZ2V0X3N5c3RlbV9tZW1vcnkoKSwg
c2MtPm1lbW1hcFtzLT51YXJ0X2RlZmF1bHRdLCAyLA0KPj4+PiArIGFzcGVlZF9zb2NfZ2V0X2ly
cShzLCBzLT51YXJ0X2RlZmF1bHQpLA0KPj4+IA0KPj4+IFRoYXQncyBhIGZpeCBmb3IgYXNwZWVk
X2FzdDEweDAgdGhhdCBzaG91bGQgY29tZSBmaXJzdC4NCj4+IEdvb2QgcG9pbnQsIEnigJlsbCBz
ZXBhcmF0ZSB0aGlzIGludG8gYW5vdGhlciBwYXRjaCBpbiB0aGUgc2VyaWVzIGluc3RlYWQNCj4+
IG9mIGRvaW5nIGl0IHJpZ2h0IGhlcmUuDQo+Pj4gDQo+Pj4+IDM4NDAwLCBzZXJpYWxfaGQoMCks
IERFVklDRV9MSVRUTEVfRU5ESUFOKTsNCj4+Pj4gKyBmb3IgKGludCBpID0gMSwgdWFydCA9IEFT
UEVFRF9ERVZfVUFSVDE7IGkgPCAxMzsgaSsrLCB1YXJ0KyspIHsNCj4+PiANCj4+PiAnMTMnIHNo
b3VsZCBiZSBhIEFzcGVlY1NvQ0NsYXNzIGF0dHJpYnV0ZS4gVGhlIG51bWJlciBvZiB1YXJ0cyB2
YXJpZXMNCj4+PiBkZXBlbmRpbmcgb24gdGhlIFNvQyBtb2RlbCBhbmQgd2UgbWlnaHQgd2FudCB0
byBtb2RlbCB0aGF0IG9uZSBkYXkuDQo+PiBUcnVlLCBJ4oCZbGwgYWRkIGEgcGF0Y2ggdG8gdGhl
IHNlcmllcyB0aGF0IGluY2x1ZGVzIHRoYXQuDQo+Pj4gDQo+Pj4+ICsgaWYgKHVhcnQgPT0gcy0+
dWFydF9kZWZhdWx0KSB7DQo+Pj4+ICsgdWFydCsrOw0KPj4+PiArIH0NCj4+PiANCj4+PiBTaG91
bGRuJ3Qgd2UgdGVzdCBzZXJpYWxfaGQoaSkgdmFsaWRpdHkgPw0KPj4gSSB3YXMgYWN0dWFsbHkg
aW50ZW50aW9uYWxseSBza2lwcGluZyB0aGF0LiBJZiBzZXJpYWxfaGQoaSkNCj4+IGRvZXNu4oCZ
dCBleGlzdCwgdGhlIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIE5VTEwuDQo+PiBDaGFyZGV2ICpzZXJp
YWxfaGQoaW50IGkpDQo+PiB7DQo+PiBhc3NlcnQoaSA+PSAwKTsNCj4+IGlmIChpIDwgbnVtX3Nl
cmlhbF9oZHMpIHsNCj4+IHJldHVybiBzZXJpYWxfaGRzW2ldOw0KPj4gfQ0KPj4gcmV0dXJuIE5V
TEw7DQo+PiB9DQo+PiBTbyB0aGVuLCB0aGUgc2VyaWFsIGRldmljZeKAmXMgQ2hhckJhY2tlbmTi
gJlzIOKAnENoYXJkZXYgKmNocuKAnQ0KPj4gd2lsbCBiZSBpbml0aWFsaXplZCBhcyBOVUxMLiBM
b29raW5nIGF0IGFsbCBvZiB0aGUNCj4+IHVzYWdlIG9mIHRoaXMgYXR0cmlidXRlIGluIOKAnGh3
L2NoYXIvc2VyaWFsLmPigJ0sIEkgdGhpbmsNCj4+IHRoYXTigJlzIG9rLCB0aGUgcmVhZC93cml0
ZSBmdW5jdGlvbnMgd2lsbCBqdXN0IGJlIG5vLW9wcy4NCj4+IFRoZXkgYWxsIGhhdmUgZ3VhcmRz
IGZvciDigJxjaHIgPT0gTlVMTOKAnS4gVGFrZSB0aGlzIG9uZQ0KPj4gYXMgYW4gZXhhbXBsZToN
Cj4+IGludCBxZW11X2Nocl9mZV93cml0ZShDaGFyQmFja2VuZCAqYmUsIGNvbnN0IHVpbnQ4X3Qg
KmJ1ZiwgaW50IGxlbikNCj4+IHsNCj4+IENoYXJkZXYgKnMgPSBiZS0+Y2hyOw0KPj4gaWYgKCFz
KSB7DQo+PiByZXR1cm4gMDsNCj4+IH0NCj4+IHJldHVybiBxZW11X2Nocl93cml0ZShzLCBidWYs
IGxlbiwgZmFsc2UpOw0KPj4gfQ0KPj4gT24gdGhlIG90aGVyIGhhbmQsIG1vc3Qgb2YgdGhlIHJl
c3Qgb2YgdGhlIHNlcmlhbCBkZXZpY2UNCj4+IGNvZGUgd2lsbCBydW4sIGluY2x1ZGUgc2V0dGlu
ZyBhbmQgY2xlYXJpbmcgdGhlIGxpbmUNCj4+IHN0YXR1cyByZWdpc3RlciBhbmQgc3R1ZmYgbGlr
ZSB0aGF0LiBJbiBzb21lIEZCIGNvZGVbMV0gdXNpbmcNCj4+IFVBUlTigJlzLCBwcm9jZXNzZXMg
d2lsbCBhY3R1YWxseSBnbyB0byAxMDAlIENQVSB1c2FnZSBpbiBRRU1VDQo+PiBwb2xsaW5nIHRo
ZSBsaW5lIHN0YXR1cyByZWdpc3RlciBpZiBpdCBkb2VzbuKAmXQgaGF2ZSB0aGUNCj4+IHRyYW5z
bWl0dGVyLWVtcHR5IGJpdCBzZXQsIG1vc3RseSBiZWNhdXNlIHRoZSBhdXRob3IgZGlkbuKAmXQg
d3JpdGUNCj4+IGZhdWx0LXRvbGVyYW50IGNvZGUsIGJ1dCBhbHNvIGJlY2F1c2UgaXQgZG9lc27i
gJl0IGFsaWduIHdpdGggaG93DQo+PiB0aGUgaGFyZHdhcmUgYmVoYXZlcyBieSBkZWZhdWx0IChJ
IHRoaW5rKS4gU28sIHRoYXQgd2FzIG15DQo+PiBtb3RpdmF0aW9uIGZvciBpbml0aWFsaXppbmcg
c2VyaWFsIGRldmljZXMsIGJ1dCBub3QgYWx3YXlzDQo+PiBjb25uZWN0aW5nIGEgY2hhcmRldiBi
YWNrZW5kLiBCdXQgSeKAmW0gb3BlbiB0byBvdGhlcg0KPj4gaW50ZXJwcmV0YXRpb25zIG9mIGhv
dyB0aGluZ3Mgc2hvdWxkIGJlIHNldHVwIHRvby4NCj4+IElmIHlvdeKAmWQgbGlrZSBtZSB0byBv
bmx5IGluaXRpYWxpemUgYSBVQVJUIGlmIGEgY2hhcmRldiBiYWNrZW5kDQo+PiBpcyBwcm92aWRl
ZCBmb3IgaXQsIHRoZW4gdG8gc2F0aXNmeSBteSB1c2UgY2FzZSwgSSB3b3VsZA0KPj4ganVzdCBh
bHdheXMgbWFrZSBzdXJlIG91ciB0ZXN0IGluZnJhc3RydWN0dXJlIHJ1bnMgUUVNVQ0KPj4gd2l0
aCBhbGwgc2VyaWFsIGRldmljZXMgY29ubmVjdGVkIHRvIGNoYXJkZXZzLiBTbywgZWl0aGVyIHdh
eSwNCj4+IHRoaXMgY2hhbmdlIGlzIHN0aWxsIHVzZWZ1bCwgYW5kIHdpbGwgc2F0aXNmeSBteSBy
ZXF1aXJlbWVudHMuDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGl0IGlzIGJyZWFraW5nIGNv
bXBhdGliaWxpdHkgd2l0aCBwcmV2aW91cyBRRU1Vcy4NCg0KSXQgaXM/IFdlIGNhbiBzdGlsbCBy
dW4gdGhpbmdzIHRoZSBvbGQgd2F5IHRvbywgSSBzcGVjaWZpY2FsbHkNCndyb3RlIHRoaXMgd2l0
aCB0aGUgaW50ZW50aW9uIHRoYXQgaXQgd291bGQgc3VwcG9ydCBiYWNrd2FyZHMNCmNvbXBhdGli
aWxpdHkuDQoNClRoZSBmaXJzdCDigJwtc2VyaWFs4oCdIGFyZ3VtZW50IGlzIGNvbm5lY3RlZCB0
byB0aGUg4oCccy0+dWFydF9kZWZhdWx04oCdIFVBUlQuDQoNClRoZW4gdGhlIHJlbWFpbmluZyDi
gJwtc2VyaWFs4oCdIGFyZ3VtZW50cyAoaWYgdGhleSBhcmUgcHJlc2VudCBhdCBhbGwpDQphcmUg
Y29ubmVjdGVkIHNlcXVlbnRpYWxseSB0byB0aGUgcmVtYWluaW5nIFVBUlTigJlzLg0KDQpJZiBv
bmx5IG9uZSAtc2VyaWFsIGFyZ3VtZW50IGlzIHByb3ZpZGVkLCBvciBhIHVzZXIgdXNlcyAtbm9n
cmFwaGljL2V0YywNCnRoZW4gaXQganVzdCBkb2VzIHdoYXQgaXQgaGFzIGFsd2F5cyBkb25lLiBJ
dCBzaG91bGQgYmUgY29tcGxldGVseSBvcHRpb25hbC4NCg0KVGhlIG9ubHkgY2hhbmdlIGluIGJl
aGF2aW9yIGlzIHRoYXQgbm93IG1vcmUgVUFSVOKAmXMgd2lsbCBiZSBpbml0aWFsaXplZCwNCnNv
IGlmIHNvbWUgZ3Vlc3QgT1Mgd2FzIGRlcGVuZGluZyBvbiB0aGUgbGluZSBzdGF0dXMgcmVnaXN0
ZXIgZm9yIGFuDQp1bmNvbm5lY3RlZCBVQVJUIGFsd2F5cyByZWFkaW5nIOKAnHRyYW5zbWl0IGJ1
ZmZlciBub3QtZW1wdHnigJ0sIHRoZW4NCnRoZXkgd2lsbCBiZSBpbiB0cm91YmxlLiBCdXQgdGhh
dOKAmXMgbm90IGhvdyB0aGUgaGFyZHdhcmUgd291bGQNCndvcmsgbm9ybWFsbHkgYW55d2F5cy4N
Cg0KPiBXZSBjYW4gbm90IGNoYW5nZSB0aGUgY29tbWFuZCBsaW5lIHRvIDoNCj4gDQo+IHFlbXUt
c3lzdGVtLWFybSAtbWFjaGluZSBwYWxtZXR0by1ibWMgXA0KPiAtZHJpdmUgZmlsZT13ZWRnZTEw
MC5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgXA0KPiAtc2VyaWFsIG51bGwgLXNlcmlhbCBudWxsIC1z
ZXJpYWwgbnVsbCAtc2VyaWFsIHN0ZGlvIC1kaXNwbGF5IG5vbmUNCj4gDQo+IFdoYXQgYWJvdXQg
YWRkaW5nIGEgbWFjaGluZSAidWFydCIgb3B0aW9uID8gbGlrZSB3ZSBkaWQgZm9yIHRoZSBmbWMv
c3BpDQo+IG1vZGVscw0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCg0K
