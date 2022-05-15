Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CE527ACD
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 00:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1d653wpnz3bdg
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:56:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=o6LoSX9I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=613436fd99=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=o6LoSX9I; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1d5d3qNDz2xrZ
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 08:55:46 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24FLUOfN018054;
 Sun, 15 May 2022 15:55:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=yLh1uVgzRYbaGqDDJi6csPPe0eSzJP+o/WonCNoD/7c=;
 b=o6LoSX9IXYav4dlA2X/e2uzhWw1u/pgB8wsp0vonbwNYiXiZlHzNYaWJ+bff5uOU0vAY
 AZOofLnlSAHdfyg1VXJS83jra+XhJGT9DTW6n9uF3Y+O6Af5ou9wU7s9hdFcXywDQAJt
 szsp4ZATWWIXzJuQ9hm+q9oykod5abCC1BE= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by m0001303.ppops.net (PPS) with ESMTPS id 3g283w6d4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 May 2022 15:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQE7SxA9MS2cV8WlkAZXtbU2C8JLdimDlLl3Ax8TXeq3PlV2qS3TOIq28sA235aTBJQhsof5MHAQ1K+VP7JNVZLQydCc9IDYJi5fxPurIebUBPMJUX5p18nSoHz8LUGllaqh75o2Klpm3ZVIg/YNrnWOuq5rbksVj4tNtlox50lmBamD33qbZk/redi/UviBM7UMPhdod0NTl8YRP4dBPELi+sUFDCEHSJQlCWkrEAyb47j0KpWd3JH9me65b1ObK8/5hh2T7s8L8Vc1LFE+BE11BuUAkIDM3amTGrK92A9l8okcAS83VbLwByZLJhhmBPJaAyiAs4MsEn3+9TWgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLh1uVgzRYbaGqDDJi6csPPe0eSzJP+o/WonCNoD/7c=;
 b=kUtC9u+oUKDPhmFp3nLP4GM2MitDt5uZMS+wPxf16SvcCGkJrQiMRtg7WyH0fxzdFkPAMiNavt7WSBTQeDVdmZG2AzyhO6pzFN+s97pMdPPWPtUHBEkTK3LevszRI+3dxa1dUBQcKdQFW7osdF9RBqdqmDp0rfazcWdhyR+9v5ZObjzik1bCk2rpZXccSa4z2H7EmoVPnTjxwc7/6NTirz+0RhNA0JWzm5YbD1hP2RqgSJaLALMgvpDXhi3IxZ7jxI5oQeJsHQ0kjas4Oxv4ufmXeGeq9Tmbv6KNBzE1HOS+cLcx5GZVI4acBQZ/ntQOh8OjLhmXTkk+cEKQVvzGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SA1PR15MB4435.namprd15.prod.outlook.com (2603:10b6:806:196::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sun, 15 May
 2022 22:55:28 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 22:55:28 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Thread-Topic: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Thread-Index: AQHYZn6gmAj+rDnxXEK+xCqfrr3YeK0cSHIAgAEF34CAAK2jgIAAAoSAgAJ3cwCAABrUgA==
Date: Sun, 15 May 2022 22:55:28 +0000
Message-ID: <F01557BD-FC48-47DD-8EED-9845EBB987F1@fb.com>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
 <bcc23f78-e81c-f4b7-3dae-17c216eb9afd@kaod.org>
 <5CBDFE96-B354-4EE6-BEA3-48E4CC68FBA5@fb.com>
 <7187a877-354e-5e79-7ad1-a6e368678002@kaod.org>
In-Reply-To: <7187a877-354e-5e79-7ad1-a6e368678002@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad0c9fbf-85e9-4033-2afc-08da36c601cb
x-ms-traffictypediagnostic: SA1PR15MB4435:EE_
x-microsoft-antispam-prvs: <SA1PR15MB4435F329DD6FA90AFB4F9B8CACCC9@SA1PR15MB4435.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6WInFqK+h3vvWsupWjeCOkqlEXH82qTrYiszrP+mJx2rDUjsZeja/hj0wiKsRVCQLGsicbRyj78OmxQGMxwvBM8blhGWzgR2tdZ0JbahYjIkUNMyEZhvOXbkCngDyPlSBrpL+1aq36+SHj837Ofun13l18gQn/wEx3QqKnFdQGydPISG+2Ru/Rucl8gudVw4CIqw9tF6YdfUF/zfD2KgobtW8wgOo3t5VxGkyy420EfwraEAw/TZm3tpxUOjyGj+mrirC34BfdfCBMiz7oI+hrSv0vfeb6XtCVn0yzL7T+xLmMbfn6Rl5CtkyI4yXb9sPOm/9WfXAP96kvbcTyo/+rZ5oxd6QliLrxji4DnipSl2860XgefY1NDjr0n++ueKpMVOhtABLAkgiJ84DK7MkGMhbqWbfk6VWi7pdqJj6uT42suKuRvDgUN+lWhWp6eqdf1RaOKKD5+PuyVOsVJAuFiprvINJeBY9dgaObD952n0bkNSS0RWHl9rEidlvRDo1ch/f1EiA683gax11SbeetLWHC4O7Tiag386zkXRtzqTGli+gzZi3le0zQ2+pHUFxpQ2Q/lcJb94mzGYvRvWtr/vAtnPPOoxeTKYF0kx2++q52ODqVk5IK/gPkOau3EeGY8q2wfUIRLf5d9JdqOe/R6Cn7zVCWdlTrjwaB7jvCQcVn5ZJar3O2MT/bvVmHir8pU26ssHV2qSPhQ049Hvv0yHgXO7GzSuUfU+m5skeRi10V7+plOSPFIMu2v+QsW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(4744005)(5660300002)(71200400001)(54906003)(508600001)(66574015)(186003)(38070700005)(38100700002)(86362001)(122000001)(6506007)(36756003)(76116006)(4326008)(66446008)(8676002)(66476007)(64756008)(2906002)(109986005)(6486002)(33656002)(2616005)(8936002)(53546011)(66556008)(316002)(66946007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1JtcVVOU2Y2V0tCeXNMbFFsM0dvcHY4VjFOYnBZWEFDaStMaVlCL0JKbGtW?=
 =?utf-8?B?MnkvYldzdDVPTmlWU09pZlAyM0M1TXlZVVFsc2Zad1RpZEovSjlmS0NXNGtV?=
 =?utf-8?B?Nm5oWU5SWVM2aWY2cktyOXJFSVA3WWpuWjlvY0R6S29JNjdpVGFyd2RCOENk?=
 =?utf-8?B?R2VZK0lvYlcwcVhZeXg5L1YvbEFYU3d6a1BIM3F0Vmh0cXhZTGhYSTJVTERL?=
 =?utf-8?B?TGJnb2g1Qy9SenV4QnRpZ0xkRFduVFIzcGpnYVlmWW5GakFHVFd4UjZVQzhB?=
 =?utf-8?B?M25venBuOG5JTTF3WDdPUHdwZUV3eGZGQ1p1L0Y0a3l3TWNabzFzSzYwQ1Vt?=
 =?utf-8?B?Yzc5bHpWZ1hoZys5TVhQb2JlK1Uva2ZEUnpWbXZGRlJ0czdjM05BMG00Q2RL?=
 =?utf-8?B?dVFpam9FemlwRjhoaGJFb2FJd2ZoR01DNC84SjdIUnB3cXV6czZTU0JIa3By?=
 =?utf-8?B?bG5CNDBnTVYxSHhLTDhYUFc0THB6VzFBRkJpS3EycU9nSUViQXczU3VEREhw?=
 =?utf-8?B?OE1BdHYxc25BUlAxTnZwMEc1OXlXaWxoZTBPQnlDcXl3N050SVVpNWNqMm05?=
 =?utf-8?B?SXF6MkprV3RaSWNuTnllL1NTY3R3ZTJzVXBkMGRnZzNnYVBhM2F4MVVFT3I0?=
 =?utf-8?B?eGRNQ29pTkxUS2t2dS94ZUx3OHYrVWRoNm5NUHlTK1V0eGlsYWZWdEJMRGtF?=
 =?utf-8?B?Vnd3UFVhNGRpbmc4a2F4K2lYT2ZXcWFzcGFoTng1b01mci9hb29nY3VjeGdB?=
 =?utf-8?B?djhjMnNFOTNVLzhMUGp4SzdvSW5lNDdjeXR6RFM1Y0lXYXVsaHZzc1ZPL2c4?=
 =?utf-8?B?SENUa1ZHRFo5MWtzbnlsaDB6YzJDdUpheDJ4RjkxeWNFMnFubUNXbGY0Q0lE?=
 =?utf-8?B?U0p6djRucVA2ejNHUEYzUXBqMzlGaGlkQUhYZitxWTUzUHVaTG5GeU04OGhY?=
 =?utf-8?B?WWZzRjFxbXV6c0trbkpvVW5HYnZrMDB0RWdFeVdNa0VFQ3JkeWlqM0VGZlpm?=
 =?utf-8?B?UEQ0Z1ZnQ2lYSHYyRHk1MUIzZ0VBSzlwK0NJSkM1UlAyL3FQY1NqbklITWtn?=
 =?utf-8?B?bHh2R2F6RGZLb0VOTkNyak56eXdkMkRWNXIzZGIyVVA2b0hvQkxmNVJrYTB4?=
 =?utf-8?B?eFBSbFlYMnYyK1NlODA3WmVHRW5XcXc5Rkt1N2h1aTZtQWIwc2lWNDByWmZE?=
 =?utf-8?B?S2lUNGNkYXpMcm5vVURhWURqdWF2aGNJSVUwNEp4aHRjTi9nQW9HbzFnTlh1?=
 =?utf-8?B?bzNJWUZTbTFUL0VROC9qM2xxZ1B6dlRPNzRBQUgrdUxjbVFBdktGQlc3YWds?=
 =?utf-8?B?UXE1amlud1ZpM2pySmZ5OVZDSWEwUmN0U0gyUm9lbS93aGd1dnZMUGRaa0t6?=
 =?utf-8?B?c0daaUh3K0lUWS9xZ0R0b1lCR1VXT1d5MU5BWXJtam9xWmlIMXNmVjdHK0dM?=
 =?utf-8?B?Q0FqMndCVFdSb3RuaE9XelZaNWc0N2xubHU2MUM1NGZMMjBkK1I3RjI4NWlK?=
 =?utf-8?B?SVNZcmZ2YlhTeEdSNGdiam1zYm9KS1kydlFHNDR3SFhVbFQ4T2h1VkhjLzR4?=
 =?utf-8?B?WTVkTnBkanN0S3ZGWnFERnFhYjF4Ym9mMjR6SUw3RUZReHJ1WmtneldvR29H?=
 =?utf-8?B?QWtrcXQvTGh2MEtiQmU5bjZJM1ROcjJ5V1lwSWRLVkhBa0FFYUxsek9EZmNr?=
 =?utf-8?B?Z3BnYk54cm81OUFwWnp1Q3BRb2hMZm43clFWdXZGSXBtK0h3WXlsWG1FZjRu?=
 =?utf-8?B?cDhrQnQ0UnY1V2NZQnEyd3JpeEhOSFhVdWJjeGVHTS9DL3A0QmlCcVRvbEdZ?=
 =?utf-8?B?ME9aRkwyang1N01ONDFBMUJOQldkMzZ3QTE1dXJ2OE9xcUlCTEtJQ0dHOHRy?=
 =?utf-8?B?OGIyNjQ2cVFwTG5jeUozZWZpdklaVWVQbVZXcWk1UktBTnMxaVA4V0pLb1cx?=
 =?utf-8?B?dUVUVDN4eElNbGJuMFRjK3FickhCK3l3ZHc2YzRZbzFPTlpyaW5zV3BSUkdt?=
 =?utf-8?B?RmhGNWlya2dCQ3lNMERKckhpR0x6TGs4alN3L01MOWFhK3pEVEJyQXhpSE5C?=
 =?utf-8?B?QS9MaExiTGc0SGliQXJrMW5RRitWbFQrV3VGVVpRNDMzaTNOYU8vcVRBM0xk?=
 =?utf-8?B?TjZzYVdrMVZrSFFtQThCNmpSUGRlYlJ0eGlGR2hZTTFyc2QyYm4xYVF1RHpv?=
 =?utf-8?B?a0hmVkYxamwxcmJleGNiL3ZUWnZOcXpMQ3FWSnY3QVZ1V3Evb1JkNzVqSTRX?=
 =?utf-8?B?azk4RWVkZDdhZ2t5RCtYb1VYMFhlcFU3Mm0yKzM3S0h3SzFpeXlDTzVPeEtU?=
 =?utf-8?B?cVFneTJEaTVXKzFUVlBWdjhTYnM0R0V1ZVZDcy9VTmNGUDZaY1FYL1N0bGJM?=
 =?utf-8?Q?BJ0XQV1rycuh4lhI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E51C0D7704E2BE4FBFC648A530E1FC00@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0c9fbf-85e9-4033-2afc-08da36c601cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2022 22:55:28.7238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhgFsWxsx+B+u3pf/EqnNWvOhuaSw95bUgBRP61HSxJQNzdZ+VHkJI1rIbMkTnCd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB4435
X-Proofpoint-GUID: DjDRk_tepodnXLeaCJLgthZ5EC7QdhAB
X-Proofpoint-ORIG-GUID: DjDRk_tepodnXLeaCJLgthZ5EC7QdhAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
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
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTWF5IDE1LCAyMDIyLCBhdCAyOjE5IFBNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IFsgLi4uIF0NCj4gDQo+Pj4gVGhlIHByb2JsZW0gaXMg
dGhhdCBpdCBpcyBicmVha2luZyBjb21wYXRpYmlsaXR5IHdpdGggcHJldmlvdXMgUUVNVXMuDQo+
PiBJdCBpcz8gV2UgY2FuIHN0aWxsIHJ1biB0aGluZ3MgdGhlIG9sZCB3YXkgdG9vLCBJIHNwZWNp
ZmljYWxseQ0KPj4gd3JvdGUgdGhpcyB3aXRoIHRoZSBpbnRlbnRpb24gdGhhdCBpdCB3b3VsZCBz
dXBwb3J0IGJhY2t3YXJkcw0KPj4gY29tcGF0aWJpbGl0eS4NCj4gDQo+IFlvdSBhcmUgcmlnaHQu
IExldCdzIHN0YXJ0IHdpdGggeW91ciBwYXRjaHNldC4gV2UgY2FuIGFkZCB0aGUgInVhcnQiDQo+
IG1hY2hpbmUgb3B0aW9uIHdoZW4gdGhlIG5lZWQgYXJpc2VzLg0KPiANCj4gSSBoYXZlIHNlbnQg
YSBzbWFsbCBjbGVhbnVwIG9mIGFzcGVlZF9zb2NfZ2V0X2lycSgpIHRoYXQgc2hvdWxkIGF2b2lk
DQo+IHRoZSBkdXBsaWNhdGlvbiBvZiB0aGUgc2VyaWFsIGluaXQgaW4gdGhlIGRpZmZlcmVudCBT
b0MgbW9kZWxzLiBQbGVhc2UNCj4gZ2l2ZSBpdCBhIHRyeS4NCj4gDQoNCk9oIHRoaXMgaXMgZmFu
dGFzdGljLCB0aGFua3MhIEnigJlsbCBnbGFkbHkgcHV0IHRoZSBzZXJpYWwgaW5pdCBjb2RlIGlu
dG8NCmEgZnVuY3Rpb24gZGVjbGFyZWQgaW4gYXNwZWVkX3NvYy5oIHRoZW4uDQoNCj4gVGhhbmtz
LA0KPiANCj4gQy4NCj4gDQoNCg==
