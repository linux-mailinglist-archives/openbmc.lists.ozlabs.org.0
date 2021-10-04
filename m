Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADE421A83
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 01:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNcBj2JRYz2yNn
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 10:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=XbIFFdQv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9911214263=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=XbIFFdQv; dkim-atps=neutral
X-Greylist: delayed 5723 seconds by postgrey-1.36 at boromir;
 Tue, 05 Oct 2021 10:19:49 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNcBF5N4Yz2xtZ
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 10:19:47 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194Ke9kk014513; 
 Mon, 4 Oct 2021 14:44:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ZecR8hsx3tpWT/TZVmZraCPT5VcBAjJfosTs9x+RB+w=;
 b=XbIFFdQve3q5RpIGL15ihRJklQ8BxdNAfU6aOXNIrAqox0pGF1a+qFPc2Q7prPHPOYSo
 o46yM/KzvPW9ttmknH6uN0M9UjSdrVGVkFi7F+/ofqmR1gd/IgZhLyW5TFbpoobD2hDs
 9xq4Vf+VhYM5IWoMdDqFFI99nMLnccOmo2A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bg333t2xa-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Oct 2021 14:44:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 4 Oct 2021 14:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC8vTsr8Qs1JNXrFIZ3nLTj5IV42vl0RMOBGf//wH7BFlxPohPuA9uxs3o7VZVtyqpGcQ+95GXnLzMfQgbQTWpOITB+46MBzc/NuFqgmVOSRS72wcXERh5b5oqR7oslH28HTDLF3KbrsowI12MOL8LcUCDyMuLnMUcjP7JydOB/HNC1o2F+0a5yMLajNcbfF72FlxMwLiLFc0YmYZ0CCE8aS2KF6WlwZxdKeHBgp2g9Ln0w71a+ttLKqysyh9/gd2NvwnyfJP90UM/bl7Ry7Ny118CzWW55YWMxONT5YS4MUPYctkhXhVj+/rhQzx6scygMKJCn+XAaE+La5Sf7GuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZecR8hsx3tpWT/TZVmZraCPT5VcBAjJfosTs9x+RB+w=;
 b=DB2ctooubITi8qImUqCPYHy75/3V2PnZw/sDWALV8W+U3L1mYAEIWjnK/xVgBNQ8HekT1q9hxHPUPvEKRcsxlHsugwPjvitzAEnvUJG93y+hUgj+eMZRpK/EUPSo366DOpg4ugmIuhtri9sF7JwRizArZL0+O6eBQ+ZInEID87oq+MJRLBbcfu/7U4FYQTWV4pcLEFvUZ4t6PVzeIkllt7rtmnTFITOv6RB95R5c1+bXvWesaRitMj7OCTvAhku/JL5UldVa3Vy1YDqQba5cJSUM+HzNetTbG6OiUXePYTDdky7NCTQdMhIOPbN3yPQi5D7iC+Zdtkqh5QrmgW8ySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY3PR15MB4961.namprd15.prod.outlook.com (2603:10b6:a03:3c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 19:26:04 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 19:26:04 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: aspeed-adc driver kpanic
Thread-Topic: aspeed-adc driver kpanic
Thread-Index: AQHXuVWs1XgwjqpFhkmKBRwttGQ3DA==
Date: Mon, 4 Oct 2021 19:26:04 +0000
Message-ID: <24AC6FDD-323D-4F37-818F-C965164544BF@fb.com>
References: <YVtJTrgm3b3W4PY9@heinlein> <YVtNypUnYfp/kztP@heinlein>
In-Reply-To: <YVtNypUnYfp/kztP@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2580a2ea-c539-4f0c-2788-08d9876ccf03
x-ms-traffictypediagnostic: BY3PR15MB4961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY3PR15MB4961EEB7F4135A4D4100B0F2ACAE9@BY3PR15MB4961.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhXHjdfm+g7fPa3huZUDwy5lK0alcsHrgzAm0CYjQcOhQMAXh5KZOnrfN/us2qQuIz33jxHR/Ss/xTvBpjLliY2KMNxeUwXOBRAjyeXIBdimNVjwPOeW5x9AJzoDa9Xi51BOySGviyNsr/zhWjJKZQCCY0f5mTFPWtOuU4GulggvwSyganRvv81/FL2T/jlM2HdKc0lQLTGuo7DIHw6LCse8mutyx7Rift9y26k8nWUfn1foXRcxUYeFL6e7n0i6KXQ+7fTEacLV63nqWBnEDCNaZtPZSgi+T8n6i3k7YMY5jyjx1SG3i4F+rGYtE6oF0IvYVX24nEi4KENHugmd9wbWeEKFMZtx+9DwOd7WNrBlwwytq2oLXQgEcPdLdqW/03eppy3xa1XFtMW7jFgpu2QTSRWE0MbYrgRoOGeGeRTa9qhtFYgdokb8emk5TRMkyfcRbmAT6IMZgqkragwGaPTf7MBmV4zxM86Py98AshtwfIyzYfHWK9w3538XHZ4ddYFJQa01UBo+HDeLtwAyfijRx+Flbsl3pBhIlgkeRk4/RVE8V9by3jHrWglVVVbryPlsIG2lkuSmhSs9pylkpQGItCz2/QUeE/9jOI4WvCRgxK9y1e87sjrlYjcYFX72OUUSgmDtLrlI8xH2LGc3dNuo5Fvg/pRtGDnJT+WUCkbhyai5T8PFxOucecqzc6NYmstTytK8TAxgABi1nHrep61ukbt8gTBwF1HyfAP1PzwiTQ7KvWLDvYrSDH8V3arTlhe8K6r1NNioHUeaI+WLxKN8LRWQV6zB/MSHc9ysHOPIVUvOxtQe27YHpR2KVa6mSC2cWcz1yyqWgIZX0+YnqHBBgK60oPftRGoHMpfu1bhA4SIA3CxP1VROd4lO26ra
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(33656002)(122000001)(186003)(66946007)(966005)(64756008)(54906003)(66446008)(83380400001)(6512007)(109986005)(38100700002)(508600001)(2906002)(76116006)(2616005)(8676002)(3480700007)(316002)(71200400001)(4326008)(53546011)(6506007)(5660300002)(36756003)(26005)(6486002)(8936002)(38070700005)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkJBRlBwU2tsdGFsdW9tNWE0SWcwamIxODM1WERGYVVMMlJESmlaMVc3Q09L?=
 =?utf-8?B?N2tVTnBCMkhJUENKZWdZRk9Dc3lLVUZXRDVCWTB2TXl1Y0JHRTQ2UkZQUDdB?=
 =?utf-8?B?MnVGK21zNHJPb0xJUi81aDM4MGpGc3kwTHlpTU15ODBOdkdQUFc3SkJQY2t0?=
 =?utf-8?B?TlFLMnYxZ2dDVE50Rk5yTDZ3YysyODUwOXZRQllpdDBPY3Mra2xYWlE1Zkt2?=
 =?utf-8?B?VmFlbEhmbnc5cXFpbTBBcWozZ3Y2UXB0NTBVQk5MNmtwdTVtRWpKOG41aWFw?=
 =?utf-8?B?R3NxWFB6MmpRVEc3WWlUNHhWUkY5dHAybXNLVXhWbVVaU0hvS2RNcjNaRVY5?=
 =?utf-8?B?bjVlT0ZOaVBpNW5BTlJaZk9qc29MTTJ1Tk1pbWdYY28ydzBCYVVUK00rYXo3?=
 =?utf-8?B?Ti9pOS9iTnJoRjg2SmMvekRTamQ5VlhTUzdiYlowUEVNMjRIcStOeHVqRnc0?=
 =?utf-8?B?RzNCWUE4ZUJvdGVVYkJETGhzYkRMd2JZZVYzdEZiQkEzSE9TN0tTUTZWZ01N?=
 =?utf-8?B?cWYybFpCMXB4ZSt6NkRUV0hjQ2JIZnQ2SnZwWmZ2VXIzaWJaSWptU0ZFQ2VK?=
 =?utf-8?B?bDBQZUdmTUp5dG9QZ0tDSTlrS01ESnVKRjNzUVlRY1g5Uytwb3FPRnVJMFM2?=
 =?utf-8?B?RGx0elYvTk9NYWtGWlBxZm1FWHBXbGRMRjJ2emEyQzhVQzFyZEhGUFBlcDY0?=
 =?utf-8?B?Ny9Qb0dDL1pqM0Vqb2FWZk1iN0IrMGh6U3pqZ1dBRzQyWktpMGx3bzdKOUVX?=
 =?utf-8?B?bTRSbnEvd3A0a1pVK0NSSXRRa3Raa2RLU3IrQXdoL3RPbEpzNEFEcmlLUzV2?=
 =?utf-8?B?aFU4eDQ3KzN4ZTRkSW9nWklvWUhEU2tDc3NvQm90c0xreDRvSXVsejFuKzdG?=
 =?utf-8?B?OUNKNzc3bG5tVktGcllVOUhoQ2g5UDhveGFXREFPUTY5dHViSERSa2R4YTJH?=
 =?utf-8?B?TERjbStGSHhEamJyWXkzaDkyVHh3TjZma0NBdG9NeTFRS1B5cFlMSU5NSXJZ?=
 =?utf-8?B?ZllCeUFBMldSV2lLRjJnS1BncHVrUVdWc0J1MHMrY2ptWkdtUWxiZ29kOTR4?=
 =?utf-8?B?R1VyQzlBdG5sTnJHVXZqdEVJc1R3MGI5RitkTmNoRXNTdDd1TW40cEVjdmtk?=
 =?utf-8?B?QXJTUXhjdHU4ekZTUlNFMGxDbnhkZDRFQnZFUjIxSEZVSHJnZmRtZnhyUGJQ?=
 =?utf-8?B?LytqeW9Nck1MQzhpcFlsZ0E2N0pVUXpVaUpnaWxCUkVVRXh6N0lrcEIyT0F2?=
 =?utf-8?B?eEwxUXBQeFBiN3AzdktvRStOVHVRd2hxeUIxK21Rb1JJQ256c3BYcWdVQ01K?=
 =?utf-8?B?dGZJNDVvdzh6R0ZIR2NOZHRPbXFDR2lpSkN4QkVJb1ZwRDFqeUcvRXpiQnpx?=
 =?utf-8?B?Qlc3bm5KOUNZZWcwQWYxR0IwNTFOVERWZzZMSUsrdm9meXl3N0V0a3ZiTDBa?=
 =?utf-8?B?TFFFZEUwUXcxazJOdFBUVFhCTHR5VFpjdGNUL0ZYOU0xclFxaFhGNHorZjl4?=
 =?utf-8?B?RXJwQVFtZTFkREpMdU1DWkI3dVBuUFQ0SnJadllXd1EwVngzYmtlbGJFYkVs?=
 =?utf-8?B?aVlsZmk5ZVR6eVoxVnpNdWNFTHFNZG5vM1VrNVk5L0kzRFgvTFFINlFPVk5S?=
 =?utf-8?B?TXdkai9sZjlwYmFpaXpzNjhDajQvSGxUN3FDZDY4MFc5UWkzNXl0WWxES2lq?=
 =?utf-8?B?eFJtRXZhKzE3aHRXK1dxSEpGOFJFZlVhWWFJN1k1eEtUZStXNEtkMFVFczZs?=
 =?utf-8?Q?W4CWBhP6GEO5+AQGBCFASO73YV4HKLaOAX78EVt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4EE7C977D27EE4781715A579402616C@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2580a2ea-c539-4f0c-2788-08d9876ccf03
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 19:26:04.7804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7YGJ6uBPQAWtapKA6g2QmuQYXxGAtOB3XGrB7bn1BC2E3xrUFMBuZDa8ZFhkHh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4961
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: u7QkCoEtw1_rWee7Q8ItDXfy06MvwuWT
X-Proofpoint-ORIG-GUID: u7QkCoEtw1_rWee7Q8ItDXfy06MvwuWT
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110040144
X-FB-Internal: deliver
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gT2N0IDQsIDIwMjEsIGF0IDExOjU0IEFNLCBQYXRyaWNrIFdpbGxpYW1zIDxwYXRy
aWNrQHN0d2N4Lnh5ej4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE9jdCAwNCwgMjAyMSBhdCAwMToz
NDo1NFBNIC0wNTAwLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3RlOg0KPj4gSGkgQmlsbHksDQo+PiAN
Cj4+IFdoZW4gSSBydW4gdGhlIGxhdGVzdCBsaW51eC01LjE0IG9uIFFFTVUgd2l0aCB0aGUgV2l0
aGVyc3Bvb24gY29uZmlnLCBJIGVuZCB1cA0KPj4gd2l0aCBhIGtlcm5lbCBwYW5pY1sxXS4gIEkg
dGhpbmsgdGhlcmUgaXMgYW4gb3JkZXJpbmcgcHJvYmxlbSBpbiB0aGUgYXNwZWVkX2FkYw0KPj4g
ZHJpdmVyLiAgDQo+PiANCj4+IFNlZSBbMiwzXS4gIFRoZSBjb2RlIHJlZ2lzdGVycyB3aXRoIGRl
dm0gYSBwb2ludGVyIHRvIHRoZSBwcmVzY2FsZXIgb2JqZWN0IHdoaWNoDQo+PiBpcyBub3QgeWV0
IGNyZWF0ZWQuICBJIHRoaW5rIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIHN0cnVjdCB2YWx1ZSBj
b250YWlucw0KPj4gdW5pbml0aWFsaXplZCBkYXRhIGFzIHdlbGwuICBDYW4geW91IHBsZWFzZSB0
YWtlIGEgbG9vayBhdCB0aGlzPw0KPj4gDQo+PiAxLiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS93
aWxsaWFtc3BhdHJpY2svNGEwZjBkMWUwY2E2ZjU0ODE2NDYxYThkZjA5ZTZjYjgNCj4+IDIuIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuMTQvZHJpdmVycy9paW8v
YWRjL2FzcGVlZF9hZGMuYyNMNTEzDQo+PiAzLiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9s
aW51eC9ibG9iL2Rldi01LjE0L2RyaXZlcnMvaWlvL2FkYy9hc3BlZWRfYWRjLmMjTDUyNw0KPj4g
DQo+PiAtLSANCj4+IFBhdHJpY2sgV2lsbGlhbXMNCj4gDQo+IEFsc28sIFBldGVyIEQuIGhhcyBi
ZWVuIHdvcmtpbmcgb24gZ2V0dGluZyB0aGUgUUVNVSBjb2RlIGZvciB0aGUgQURDIHdvcmtpbmcN
Cj4gYW5kIEkgY2hlcnJ5LXBpY2tlZCBoaXMgY29tbWl0c1sxXSBhbmQgdGhlIGNvZGUgZ2V0cyBm
YXJ0aGVyIGJ1dCBjcmFzaGVzIHdpdGgNCj4gd2hhdCBzZWVtcyBsaWtlIGEgbWVtb3J5IGFsaWdu
bWVudCBpc3N1ZSBpbiBhIHJlYWQgYXQgWzJdLiAgTmV3IGdpc3Qgb2Yga2VybmVsIHBhbmljDQo+
IGF0IFszXS4NCg0KT2ggeWVhaCwgdGhpcyBpcyBwcm9iYWJseSBub3QgdGhlIGRyaXZlcuKAmXMg
ZmF1bHQsIHRoaXMgaXMgdGhlIGZhdWx0IG9mIG15IFFFTVUNCnBhdGNoZXMuIEkgb25seSBhbGxv
d2VkIDMyLWJpdCBhbGlnbmVkIHJlYWRzLiBJIGJldCBpZiB5b3UgYXBwbHkgdGhpcyBhZGRpdGlv
bmFsDQpkaWZmLCBpdCB3b27igJl0IGNyYXNoLCBidXQgaXTigJlsbCBwcm9iYWJseSByZXR1cm4g
dGhlIGNoYW5uZWwgMCB2YWx1ZXMgd2hlbiB5b3XigJlyZQ0KdHJ5aW5nIHRvIHJlYWQgY2hhbm5l
bCAxIHZhbHVlcywgY2hhbm5lbCAyIGluc3RlYWQgb2YgY2hhbm5lbCAzLCBldGMuIEkgdGhpbmsg
b25seQ0KdGhlIGRhdGEgcmVnaXN0ZXJzIHJlcXVpcmUgdGhlIDE2LWJpdCByZWFkIGFjY2Vzcywg
YmVjYXVzZSAyIGNoYW5uZWxzIGFyZSBwYWNrZWQNCmluIGVhY2ggMzItYml0IGRhdGEgcmVnaXN0
ZXIsIGJ1dCB0aGUgYm91bmRzIGFuZCBoeXN0ZXJlc2lzIHJlZ2lzdGVycyBhcmUNCjEgY2hhbm5l
bCBwZXIgcmVnaXN0ZXIuDQoNCmRpZmYgLS1naXQgYS9ody9hZGMvYXNwZWVkX2FkYy5jIGIvaHcv
YWRjL2FzcGVlZF9hZGMuYw0KaW5kZXggZmNkOTNkNjg1My4uNThlM2YxOGM2YyAxMDA2NDQNCi0t
LSBhL2h3L2FkYy9hc3BlZWRfYWRjLmMNCisrKyBiL2h3L2FkYy9hc3BlZWRfYWRjLmMNCkBAIC0y
MzQsOSArMjM0LDkgQEAgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhc3BlZWRfYWRjX2Vu
Z2luZV9vcHMgPSB7DQogICAgIC53cml0ZSA9IGFzcGVlZF9hZGNfZW5naW5lX3dyaXRlLA0KICAg
ICAuZW5kaWFubmVzcyA9IERFVklDRV9MSVRUTEVfRU5ESUFOLA0KICAgICAudmFsaWQgPSB7DQot
ICAgICAgICAubWluX2FjY2Vzc19zaXplID0gNCwNCisgICAgICAgIC5taW5fYWNjZXNzX3NpemUg
PSAxLA0KICAgICAgICAgLm1heF9hY2Nlc3Nfc2l6ZSA9IDQsDQotICAgICAgICAudW5hbGlnbmVk
ID0gZmFsc2UsDQorICAgICAgICAudW5hbGlnbmVkID0gdHJ1ZSwNCiAgICAgfSwNCiB9Ow0KDQpJ
IGludGVuZCB0byByZXNvbHZlIHRoaXMgYnkgcmVzdWJtaXR0aW5nIEFuZHJldyBKZWZmZXJ54oCZ
cyBwYXRjaCBmb3Igc3VwcG9ydGluZw0KMTYtYml0IGFuZCA4LWJpdCByZWFkcyB0cmFuc3BhcmVu
dGx5IHRvIHRoZSBRRU1VIG1vZGVsLCBidXQgbWF5YmUgSeKAmWxsIGFsc28NCnJldmlzZSBteSBw
YXRjaCB0byBzdXBwb3J0IHRoZSAxNi1iaXQgcmVhZHMgKGV2ZW4gd2l0aG91dCBBbmRyZXfigJlz
IHNwZWNpYWwNCm1lbW9yeSBwYXRjaCkuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUt
ZGV2ZWwvMjAxNzA2MzAwMzAwNTguMjg5NDMtMS1hbmRyZXdAYWouaWQuYXUvDQoNCkNlZHJpYyBq
dXN0IGFwcHJvdmVkIHdoYXQgSSBoYWQsIGJ1dCBpdCBoYXNu4oCZdCBiZWVuIHB1bGxlZCB5ZXQ6
IGlmIHlvdSB3YW50LA0KZmVlbCBmcmVlIHRvIGNvbW1lbnQsIEnigJlsbCBwcm9iYWJseSBjb21t
ZW50IGFib3V0IGl0IG15c2VsZiB0b28uDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUt
ZGV2ZWwvNGQ3YzU1ZDQtMjVmZC01MjBjLTk3YWEtOTgwMzZmZTZmZDFhQGthb2Qub3JnLw0KDQpU
aGFua3MhDQpQZXRlcg0KDQo+IA0KPiAxLiBodHRwczovL2dpdGh1Yi5jb20vcGV0ZXJkZWxldm9y
eWFzL3FlbXUvdHJlZS9hZGMtc3VwcG9ydC12Mg0KPiAyLiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9saW51eC9ibG9iL2Rldi01LjE0L2RyaXZlcnMvaWlvL2FkYy9hc3BlZWRfYWRjLmMjTDI0
OA0KPiAzLiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS93aWxsaWFtc3BhdHJpY2svNzY4MjdjOTll
MmRiOGZjZTM4NWI5YTg3Zjc1MjZkMzMNCj4gDQo+IC0tIA0KPiBQYXRyaWNrIFdpbGxpYW1zDQoN
Cg==
