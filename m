Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC8528A26
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 18:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L24Hm1yYDz3c9N
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 02:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=bjzI5jkG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=bjzI5jkG; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L24HK1y1Hz3bw7
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:20:39 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G9mgmF023274;
 Mon, 16 May 2022 09:20:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Mx4UokU8QULsLMn+9dF1baGoj751ibY8V4qqr4pfNhA=;
 b=bjzI5jkGKcUg3sBnGpOGqLxxjshM8yHDU/g8NdZno4709Cqi+4KUQ1DMns5ASYvTXA4F
 X+iunYi9g71qU8qXwPhukZOV+vi2Elkbon+UVZwGWfzxBW10BKnfcPV3k62PYhc7ItLt
 6WNN/AIzYfdbyNs8R6LjhnMHVHZEe52FVoE= 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g3maaj743-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 09:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB+AB36ywRu6rNG9I1M+H3CAXJHyToQiwh5JEBtHZ/aZ9Mqwt9fUZuQLllkDmPsB4fNS8RRaT8ra+uNTFQ1IK2/sMDTB5qeJk6yKXJGV5zeCzJ4Z5+F4/tPDkSTZOM6YqyhH8ydNA336ZnF1Lp9041Rr5Idc/Qf/iFjtJmnVWkkZc2lehgetdclkaHpCSKkDyveaYiOp+Vnvu9E0Q6mNhSxX2bHP52o12kQGZuV7n4HJfBZ194LyQGiLpStqFyVLHzhsmFIPx6bPAEAegn6vGXwqLEwl8sEtJBvi+uhZtWZGUbP3v9vS0LjMZIE9tXl1bp8TWa0q7xEZHHW398vJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1UE8L4zrYochje2NfMTawW2mhxhIWoT9iJvbi3Vk44=;
 b=h8OjkSPxFqgE1kJYj2mNqCjvcFHNARydCZlACdfdUtSD6tb6/Qyg5YwUF71tunRMaBq60F6xWKPBCOSIMDIxTtaIK7UBkyWRmT+/zKpTPt1+Z/c7U//3f0jROtfOKe4/OImUp6mDCFnw2c3/HQ1E4Xaj5sAHPDcBXM+vYFk92KwoxIVUKKTjNynJnz6a7QcTtadWWwl2Fw3lX3vFx6DbuMOoMfOx1gKBAbBesZV36xT6IsmQeTtUbZWR93LAy3xh48t85/eKNdYrWLhwq/rvK8bWvXz2ixoEAnqaZ5Bt83JJnRz8ADh3F0NQ3egL3Yma6HidxIuAB7rl5VSBQLB7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB2553.namprd15.prod.outlook.com (2603:10b6:5:1a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 16:20:16 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 16:20:16 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Thread-Topic: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Thread-Index: AQHYaO19buTVwfVVsE6j3iDLBjiL1q0hGIEAgACXSoA=
Date: Mon, 16 May 2022 16:20:16 +0000
Message-ID: <FC790CD5-03E2-41DB-B7F2-4F5046B37641@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
In-Reply-To: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efdfee42-7d30-4de0-8f9e-08da3757f6c7
x-ms-traffictypediagnostic: DM6PR15MB2553:EE_
x-microsoft-antispam-prvs: <DM6PR15MB2553F53544EF96A9FE47F88EACCF9@DM6PR15MB2553.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +w9kihJL9iznfwbkAarJEG+0R9glgiiCfOfug/KjRa5BA3OR3syLj2A9VqdcA9gjXB6iE+pAxhrrtdsy4ji6I6owbLFA3/v76eBOq7meKAx+iZJqVN8mBIPHsZw+Vo0yvsQzVmgknWOm6u1Vq65MtwyKjQbzVDwArF1XGw4Zakoqzv40SGUhVVBmOExmwK80ISH8IfO46ExHRLGCFuc9oRWpWrZuXsBtH4ahl/mdUbvbT0uBk/KA7R7qyE4E8nlSuNK11NXqnCj4+wnPx7lUTfHd8V/3Q85oi3eW9zyhY2rPYqBqc2qrxqTlCZx4UHZH6fu/XeSrEwsGckz/11C5i75FvZtJrK/YIsxbyOQNurF8ZKgDxf/eOB7wLEfMQOgSO7McyAo1BDJzZkDjkV9DmbLM8k0S/jxTy2jX9HxxkqNekwghupM3ZbD/USoRCE/dxrJTLzcr17uou26u4KkM9AOWd9I9GA6CmrM5gcCDaz810id1K/0XtvolbVALrOLt07xlV3kczkuf6TA8d6iywNfMWDaszlAnhqxOK1ppix5FqlTx4Gqka3t6SkHr/vtUlrV1igHfPAgNuIunqIARPafXqyDA4Z1iLnPT0bhAmPFrkrfmTdsA77m588q1pD+IN/zhDB36vannIr0dHC3QZ6AoQRa1epZUMG5BxcZUXvAwC1plI4TRfbk5Fnh25ag0dR+MTdgSy9R9sK/N1/FRHBfR4veSWiIlcKdBCuQRZEzUDDQabCfkbNQ5K3nwBeyurGeJmkVbsFuzd7G9AstZRkamBmfwblNnVJmE5OOs92v9BYi4CZkYjWXu/HQf1fxnihsDks9cxrv3iYPW7dAHMxfP5SkNYDjx9z54LWZiXgU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6506007)(71200400001)(186003)(53546011)(508600001)(54906003)(316002)(966005)(6486002)(6512007)(2906002)(38070700005)(38100700002)(66476007)(64756008)(76116006)(66946007)(66446008)(8676002)(4326008)(66556008)(33656002)(122000001)(2616005)(109986005)(8936002)(5660300002)(83380400001)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1VCRWk4TTBUWmt5T1BLQjRrSDF1czV4T1p5VExXeUFXdzBCVTNNQzlvSk95?=
 =?utf-8?B?NnJSLy9GWW5lUlI5SEF6N25kMzFkNjFxRlBJeEVJL1M1c1VLWkFVeHdmTTVo?=
 =?utf-8?B?dVJ0YUIyWWV6ek5lNldwcUp2cHAvOTBPcnVkcWJxRk52YW1ZSmdDVW1MOG9m?=
 =?utf-8?B?Qm5Gci9kQytUcTlKT2FVYlJMSDdxR3BmQS8vWnVMcllCVENHb0QzNmFWK3hB?=
 =?utf-8?B?RWd4elNYNTdGTkUrZWhodWxrZHJObWtFamV1akVKQnYyN3o3MkpMVjV3R1pT?=
 =?utf-8?B?L01ESlEzU25jWlVSeTc4cm9LaDJUQ21sT21SN1VYUjBtL1NNU1JaUFI3cGlC?=
 =?utf-8?B?c0JXSFhwRVZ0M0R0MlpwUWljU2JvN3lJb1I0TGwzaTFnQUVLMi93Y3NJUUFa?=
 =?utf-8?B?ZVd6YVZlSFE5RnNaRzVqdTcwYlE1MkdxdERJMW1SUjhEZ1MzSzhYTnp3VlFZ?=
 =?utf-8?B?bWFXWFRSL0xaNnE0SHVWeEM2Yk1WL2lYczN4TE9JZmJxUy8vK2ZnbnBxTFRa?=
 =?utf-8?B?aUxPRU5jUExPdWduZWpuS2M2dG9uYzRIQmUrWEhudUhCRlc4MkNlV1ZrL1Jw?=
 =?utf-8?B?VnVDSVdmWTdTbTVxUmNFdVVMYVFLeWJCYm9NR0ZRTzBNYkJFWUlVUjEwVE8r?=
 =?utf-8?B?K0V0dHFmYWdPM3Z2ODZkcFppVVhpelh4NjgzNGpLTDBxcjJsRi9lNlUwZkdD?=
 =?utf-8?B?QytUYjNQMFJZUmZiR1JIVFFLTVFZeWV3Z0pKWDhOT2dDOFJSV0p4Sysyd2RS?=
 =?utf-8?B?YzkybHRLMDBrNDhKajh4TGtLaDZta1labWREZE9QZnQ5a09iWGpuQmU0L1Bv?=
 =?utf-8?B?Ujdoai93TnhOM0lzWU82NzdoTzVlWnhIcWh2TVhNOTE0RVNTbTl1Rm5CMHZh?=
 =?utf-8?B?RVllTEpWVm1HcHZwUjFzQ0tpSWgrMVNFUjVIY25mVmhRL1kvUHJaTnlVdTFy?=
 =?utf-8?B?UWJNc295Wld1TjNNYm5BakRsZGtxZno2NnNhelVVYzhIMDRrWisrZnBMZUtl?=
 =?utf-8?B?ZlZsVDR6MktwTWJlS3ZmNlY5YjNZT0FoeTRJMGQrb2IyWW8wckgxb2lzcUY5?=
 =?utf-8?B?c0JjYUpsMWJ4WlNCemtabVFrdmZCdDRwNkJja2ErbW43VXBBSC9kblZ0WmJK?=
 =?utf-8?B?UGR6dGFZOXhTczIvbWNzNGk0WjFBOEFZM2VHNW1KZ0JhZDRkR3owRy9xc1hN?=
 =?utf-8?B?TkFucEZ5dU5rdVdYTlR0d2dCMGdaM04vL0VqTmR3eVZGQmpDZE9oU2VIMmJP?=
 =?utf-8?B?UEY5UUFTUFZqYUQ0NUNSMHhXVC9idERuTWJSbXNKdWRIYnY5dGdQdFc1eTZy?=
 =?utf-8?B?YWt6OVpEZzBDRUFlUHhtSEFYeUk4K2hTam5Gd3NmdDA4NndQamVoRVZ4eVRF?=
 =?utf-8?B?WlB1dXNGTGk5SG9ja0pVQysxK3ltR2tZTjVPdGIweE1XbkY1Q2lvSEROWjE2?=
 =?utf-8?B?UlFkR21hMkFPeXd2OHVCcy9FUXBrUzhNTTN4V0dwYWt6dSswWmNrcVgwL3RV?=
 =?utf-8?B?ek1YOFdJeGxqNFA1NnBKUHNSL2FFeHpMVytEMlJUVGIyaEtwTjdLM0FCeUtl?=
 =?utf-8?B?dk9sYVVMTG9pdFdnRklvRUdWQkxnOXAvWXF0VGlCVDJ1WGFENkZnZStVbjN3?=
 =?utf-8?B?c295THhuZmgyOVlHNERxQy9LQStHSGkwZ1dLaFRMM1M4RUhKRnVEb3BkMTZW?=
 =?utf-8?B?d1VvWEpFbWFkZlBrVjVNNEd1ek01cHVBdWVXbGxYV1krTzk1Z2ZFS29URC9k?=
 =?utf-8?B?U21FZlN6VDRJQjRXTjR3NWFaYzg0WUlmK3BDcEVGaDQ2ZElta2cybFErSHdY?=
 =?utf-8?B?NUVLSE1OMkpVK1dwRVIwbktYY1pjQlhhc2xBRXZoYmkzRWpFOHVpcjdXMmZZ?=
 =?utf-8?B?Rnc0TmtqYkZwMTVtV2U4QWVRQS9KSnZsTW1ZdlRyZ1NIN25uQk42WnIydWhl?=
 =?utf-8?B?NjhSUU0zZTFZbE5qamdtaGpQMmJ0YTVwSVRJUHRGRXhnd1h0QjBIdmQyeHlB?=
 =?utf-8?B?ekhaUW1JckxwK0RtR0g5ZDJmcWlHTUJRMW5vOVBKWVhZVzNJUWJpSTBxUWN4?=
 =?utf-8?B?WVVLaGd6enRBYkNEQ0h0Z3BCdHFGcXhYTGZuMUY5a2wwM0lFRUNTQUZsTjFM?=
 =?utf-8?B?ODI2N3gzazRJYUkxdk5LSVV4QUtmaUJaenNQeVAxRkRUT2ZnTkprQWk3eTRV?=
 =?utf-8?B?MlUvblhRc1M5alJQOTZwbGdZRmM2NVFVdkQrSnpIMWYwdUNTVXVqanExelFS?=
 =?utf-8?B?UGMxK2lJM1o1aWh2NEdTQy9SR0xETDRuczRTb1FwdllJd0ZDZU1TcE1BN1Bh?=
 =?utf-8?B?ZlVoMjBkODFFMDN6NnY4K3kzNUV3cjlDVGRIcEg1aEwwcXh5aTRUSkVpWkh2?=
 =?utf-8?Q?HcE40uYuG8oKelrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C8DCF218F03114D9E08AFC30B253A13@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdfee42-7d30-4de0-8f9e-08da3757f6c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 16:20:16.7833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzNK7VKrDwk10WSGzKuseN3YFJI1H+1uRaduB493gN1mTiYjbNleZpQVBzcE6KL6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2553
X-Proofpoint-ORIG-GUID: CBtA1DfQ6FCK0rROelXA4FSt2m6VbakC
X-Proofpoint-GUID: CBtA1DfQ6FCK0rROelXA4FSt2m6VbakC
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_15,2022-05-16_02,2022-02-23_01
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
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, Iris Chen <irischenlj@fb.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTWF5IDE2LCAyMDIyLCBhdCAxMjoxOCBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA1LzE2LzIyIDA4OjIzLCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gdjI6DQo+PiAtIFJlYmFzZWQgb24gQ2VkcmljJ3MgaXJxIHByb3Bvc2Fs
LiBbMV0NCj4+IC0gQWRkZWQgIkludHJvZHVjZSBjb21tb24gVUFSVCBpbml0IGZ1bmN0aW9uIiBw
YXRjaA0KPj4gLSBBZGRlZCAiQWRkIHVhcnRzX251bSBTb0MgYXR0cmlidXRlIiBwYXRjaA0KPj4g
LSBSZXdyb3RlIGxhc3QgY29tbWl0J3MgbWVzc2FnZSBmb3IgY2xhcml0eQ0KPiANCj4gTG9va3Mg
Z29vZCB0byBtZS4NCj4gDQo+PiBJIHRyaWVkIHRlc3RpbmcgdGhpcyBieSBydW5uaW5nIGFjY2Vw
dGFuY2UgdGVzdHMsIHBhcnRpY3VsYXJseSB0aGUNCj4+IGJvb3RfbGludXhfY29uc29sZS5weSBm
aWxlLCBidXQgSSBoYWQgdG8gZGlzYWJsZSB0aGUgcmFzcGkyX2luaXRyZCBjYXNlLg0KPj4gSXQn
cyBub3QgcmVsYXRlZCB0byBteSBjaGFuZ2VzIChBL0IgdGVzdGVkIGFuZCBpdCBmYWlscyBvbiB1
cHN0cmVhbS9tYXN0ZXINCj4+IHRvbyksIGJ1dCB0aG91Z2h0IEkgd291bGQgbWVudGlvbiB0aGF0
Lj4NCj4+IEkgYWxzbyBtYW51YWxseSB0ZXN0ZWQgc2V2ZXJhbCBtYWNoaW5lczoNCj4+IEFTVDI0
MDA6IGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzL2Rvd25sb2Fk
L3YyMDIxLjQ5LjAvd2VkZ2UxMDAubXRkDQo+PiBBU1QyNTAwOiBodHRwczovL2dpdGh1Yi5jb20v
ZmFjZWJvb2svb3BlbmJtYy9yZWxlYXNlcy9kb3dubG9hZC92MjAyMS40OS4wL2ZieTMubXRkDQo+
PiBBU1QyNjAwOiBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy9yZWxlYXNlcy9k
b3dubG9hZC92MjAyMS40OS4wL2Z1amkubXRkDQo+PiBBU1QxMDMwOiBodHRwczovL2dpdGh1Yi5j
b20vcGV0ZXJkZWxldm9yeWFzL09wZW5CSUMvcmVsZWFzZXMvZG93bmxvYWQvb2J5MzUtY2wtMjAy
Mi4xMy4wMS9ZMzVCQ0wuZWxmDQo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1k
ZXZlbC8yMDIyMDUxNjA1NTYyMC4yMzgwMTk3LTEtY2xnQGthb2Qub3JnLw0KPiBJIGhhdmUgcXVp
dGUgYSBmZXcgaW1hZ2VzIHdoaWNoIEkgcnVuIG1hbnVhbGx5LiBPcGVuQk1DIGlzIHByb3ZpZGlu
Zw0KPiBpbWFnZXMsIEFzcGVlZCBhbHNvLiBKb2VsIGRpZCBhIHNtYWxsIHRvb2wgZm9yIHRoZSBJ
Qk0gcmFpbmllciA6DQo+IA0KPiAgaHR0cHM6Ly9naXRodWIuY29tL3NoZW5raS9xZW11LWJvb3Qt
dGVzdA0KPiANCj4gSGF2aW5nIGFuIGF1dG9tYXRlZCBmcmFtZXdvcmsgZm9yIEFzcGVlZCBtYWNo
aW5lcyBwdWxsaW5nIGltYWdlcw0KPiBmcm9tIGRpZmZlcmVudCBwbGFjZXMgd291bGQgYmUgbmlj
ZSBidXQgd2UgY2Fubm90IHB1dCBhbGwgdW5kZXINCj4gUUVNVS4NCj4gDQo+IA0KPiBJIGxpa2Ug
dGhlIGJ1aWxkcm9vdCBDSSB1c2luZyB0aGUgUUVNVSBib2FyZHMuIFNlZSBhIHBpcGVsaW5lIGV4
YW1wbGU6DQo+IA0KPiAgaHR0cHM6Ly9naXRsYWIuY29tL2xlZ29hdGVyL2J1aWxkcm9vdC8tL3Bp
cGVsaW5lcy81Mzk1NTkyMDkgDQo+IGJ1dCB0aGF0J3MgYnVpbGRyb290IG9ubHkgYW5kIGludGVn
cmF0aW5nIGEgY3VzdG9tIHVib290IG1pZ2h0IGJlDQo+IGRpZmZpY3VsdC4NCj4gDQo+IEZvciBt
eSBwcGMgbmVlZHMsIEkgZGlkIGEgcXVpY2stYW5kLWRpcnR5IG5vbi1yZWdyZXNzaW9uIHRlc3Qg
c3VpdGUgOg0KPiANCj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRlci9xZW11LXBwYy1ib290
DQo+IA0KPiANCj4gQW55d2F5LCBJIGhhdmVuJ3QgZm91bmQgYSBzb2x1dGlvbiBub3Igc3BlbnQg
bXVjaCB0aW1lIG9uIGl0IGJ1dA0KPiBJIGFtIGludGVyZXN0ZWQgIQ0KDQpPaCB0aGFua3MgZm9y
IHRoZSBsaW5rcywgSeKAmW0gc29tZXdoYXQgaW50ZXJlc3RlZCBpbiBsb29raW5nIGludG8gdGhp
cyBmdXJ0aGVyLg0KDQo+IA0KPiANCj4gQy4NCj4gDQo+IA0KPiANCj4gDQo+PiBQZXRlciBEZWxl
dm9yeWFzICg1KToNCj4+ICAgaHc6IGFzcGVlZDogQWRkIG1pc3NpbmcgVUFSVCdzDQo+PiAgIGh3
OiBhc3BlZWQ6IEFkZCB1YXJ0c19udW0gU29DIGF0dHJpYnV0ZQ0KPj4gICBodzogYXNwZWVkOiBF
bnN1cmUgQVNUMTAzMCByZXNwZWN0cyB1YXJ0LWRlZmF1bHQNCj4+ICAgaHc6IGFzcGVlZDogSW50
cm9kdWNlIGNvbW1vbiBVQVJUIGluaXQgZnVuY3Rpb24NCj4+ICAgaHc6IGFzcGVlZDogSW5pdCBh
bGwgVUFSVCdzIHdpdGggc2VyaWFsIGRldmljZXMNCj4+ICBody9hcm0vYXNwZWVkX2FzdDEweDAu
YyAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4gIGh3L2FybS9h
c3BlZWRfYXN0MjYwMC5jICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4g
IGh3L2FybS9hc3BlZWRfc29jLmMgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQ0KPj4gIGluY2x1ZGUvaHcvYXJtL2FzcGVlZF9zb2MuaCB8IDEwICsrKysrKysr
KysNCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQ0KPiANCg0K
