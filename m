Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC71A8A6B
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 21:02:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491vxP1r4nzDqvt
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 05:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=137338503b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=AiFA/Y5A; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=cYDtpU4r; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491vwS5BywzDqtV
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 05:01:23 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EIwGaT023028; Tue, 14 Apr 2020 12:01:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=zJeOhfqXq5vprgZeTNLo4Ht7C0qOOv33uqPpmSTEb+M=;
 b=AiFA/Y5Ax6g/tAvuEmGcC+a+jpeMD/rTkWpJtJHCxG7QR6djX51Hxm1bCeBmlxnuouFF
 mgDpm9ujaaM+RyF3Fw/0P/gZmgNJG9BGGvk5pJCshFXxhcPJn3v/N4COGnarOFceHTyh
 eK6U8iybPb/mhQV4tiXOMIB6w0xZwXDNyBQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30cbux1k2p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Apr 2020 12:01:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 14 Apr 2020 12:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0sMNg1qSMZnpRUcMlj5qjbDN712Z96UkfcMWrA28W20MUxjpVpl67G9c2R9O7iSz78cgtg69EvSERYRceXa1zryLf3/gDke8tJ/SixNrNcKrdf/L+CbOAMNZKyfUIpvaNNy3oFYoAmAFXkg/xxY2qfQjJ43rXBVAKj372i+ffvpo8BqReCsUZk+g5c0es3D8SXtoyius7laSosT3Rn3c9WDewc906TH9mwivfUv8nP3mzQX4VkIWrModWRcPIXOZMdqFF+W7QzxUYk+p5rAYyDCLYBVLdC1lJeAckRanDpTjM+8OEjTEF18icy+P9VzBnV5M5glBMPvYlDnh/F3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJeOhfqXq5vprgZeTNLo4Ht7C0qOOv33uqPpmSTEb+M=;
 b=ey5rONTaryV33GKoIn/4RMbp+ZEKUsvUzw+6jY5dVUhg9fxbtvOmS5LkKCLm8XL83RvgNYZCS8AbtXaTCJzZ4BmSE6QJ281E1tPMb9Gi1FNgnYce6P+xO9cld4yBGId8VrcYsQbSgYHufnq18xN3U94XLQJohXiqQOtiUPZTBvCdmesYHW73tkxJo8MC6kj/e4HPx7MT4ZVadEaroZEkMZF5ciu32ul2SiGz9/l4bo2UbDj4gq6GUlLnDeKMPIqoGLPQ8elXEzgtjBZFQajygs/+nIG+6nIo4cZqAV5Ec5HXB73HxqolOYE7uk59cawyachQs8/CPcgwa+gj/VHhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJeOhfqXq5vprgZeTNLo4Ht7C0qOOv33uqPpmSTEb+M=;
 b=cYDtpU4ri3sJwejQRBZTpx5X+R8r1LKvmclfuuIExTYyAWMThwJhM/1qq1hT3cc3EFc1vaRwsbE3IyKZN7Te2XDWsDENiodNUJeilBR+gBJbl51OdKkcVFllkoFvnOOU6EBr1iU0oh5+HZ8+W49uBmefu401LoPZv2PbGLkIgq0=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3980.namprd15.prod.outlook.com (2603:10b6:303:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Tue, 14 Apr
 2020 19:01:12 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:01:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>
Subject: Re: Sensor history
Thread-Topic: Sensor history
Thread-Index: AQHWBs4VmN6lX3CS6Uq7IxtJ4cK5Bahy6IqAgASxEACAAQGQgA==
Date: Tue, 14 Apr 2020 19:01:11 +0000
Message-ID: <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
In-Reply-To: <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:523e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44a1f2c8-df64-4678-a6e9-08d7e0a632f8
x-ms-traffictypediagnostic: MW3PR15MB3980:
x-microsoft-antispam-prvs: <MW3PR15MB3980C604E9C9D4BF2B78940EDDDA0@MW3PR15MB3980.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(366004)(396003)(4744005)(33656002)(4326008)(6486002)(966005)(86362001)(2906002)(81156014)(8676002)(3480700007)(36756003)(6512007)(71200400001)(8936002)(478600001)(2616005)(76116006)(110136005)(66556008)(7116003)(186003)(66476007)(316002)(5660300002)(53546011)(66446008)(6506007)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDM3uzcprNZ6wjHAwAWljIujxINV6dIGAOrPUwyY0IFJE3PPjXJ6kvcz1VQNSg5zlDcFpM6C7CnwYlo5CiVs6hFvrIuRfyQe0HTlQaotmFvvr8k5Y0U4DBcebBT2Wypyd2j8dOsO7hZLCFChcL7LFaizYjSTTobiSQRL9j9N5zk2jxK075f4V30xQ22o0+onXnv3w2MlvTfVCICsd7hE4GOT9vck8kNbyZHpArhfil2/+Wd35Pe/Qg1NXfd19ENf/NkCA77C0t1cvOWDDbaLT1eklAUJs9arKXwRSdQtD/7MfDfZIA7L4GG6+Uhi4F0z9uI8TZAxHjtfM0FS2pZrsbx+l4o84hI6YRvQLAmpK/QNIF3j1eo0qjQI+PfPl7SzMQqWJO+E/1oGGbv7PBXVnobx36ZFMRb+Px1HNoqoFgpSwnO2og9geMK7P9qWqwtbnyLS1u7aFWtPXUSUPrRK8ExKf1M7Hl4XNy7+hsOu1CDPYzh/t88WVPTbKXQi4qo+p+XA4b2ZVCRJ9CdrTem0aQ==
x-ms-exchange-antispam-messagedata: tu5powUD+Ymc1pOHQ0+E06LD1MJ5x8ChVjgyPzcBnGpbPQmx9lrWjSnjP8+dkvGmrqo9OYvZEjU8HPSx9RwjySz5Vz2G5dW0L4R4ZLBUCZFaiUveInwVEIvfk9cYFWeFm1IAcur/MtMsn/gdNuO/YxWRfstxgW4iqw7+GY8+LQYJA1c+Wg0ChvAKSo+zJbwJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <34D571F149D47E4C9C586FF55D5401D5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a1f2c8-df64-4678-a6e9-08d7e0a632f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 19:01:11.9140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNRCKBZBfsTU1s9yQS9gTvX9uFMpEx16dr+ZbzEmOGQPfjbhdMbOq8xyQTfUbK4OqQJdxmAPpXVkp4aziweeUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3980
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_09:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=821 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140134
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMTMvMjAsIDE6MzkgUE0sICJCcmFkIEJpc2hvcCIgPGJyYWRsZXliQGZ1enpp
ZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoNCiAgICBhdCA1OjAwIFBNLCBWZXJub24gTWF1ZXJ5IDx2
ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQogICAgDQogICAgPiBPbiAzMC1N
YXItMjAyMCAwODowMiBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4+IElzIHRoZXJlIGFu
eSBpbXBsZW1lbnRhdGlvbiBmb3IgcmVhZGluZyBzZW5zb3IgaGlzdG9yeS4gUGxlYXNlIHBvaW50
IG1lICANCiAgICA+PiB0byB0aGUgcmVwbyBvciBjb2RlIGJhc2UuDQogICAgPiBJIGRvIG5vdCBi
ZWxpZXZlIHRoYXQgdGhlIEJNQyBpcyBzdG9yaW5nIGFueSBzZW5zb3IgaGlzdG9yeS4NCiAgICAN
CiAgICBUaGVyZSB3ZXJlIHNvbWUgaW50ZXJmYWNlcyBhZGRlZCB0byB0aGUgb3BlbnBvd2VyIG5h
bWVzcGFjZSBmb3IgdGhpcyBraW5kICANCiAgICBvZiB0aGluZy4gICANCiAgICBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1kYnVzLWludGVyZmFjZXMvdHJlZS9tYXN0ZXIvb3Jn
L29wZW5fcG93ZXIvU2Vuc29yL0FnZ3JlZ2F0aW9uL0hpc3RvcnkNCiAgICANCiAgICBUaGUgYXBw
bGljYXRpb24gaW1wbGVtZW50aW5nIHRoZW0gaXMgaW4gdGhlIHBob3NwaG9yLXBvd2VyIHJlcG9z
aXRvcnkgIA0KICAgIChwb3dlci1zdXBwbHkpLg0KICAgIA0KICAgID4gVG8gZ2V0IHRoaXMsIHlv
dSB3b3VsZCBuZWVkIHRvIHBvbGwgdGhlIHNlbnNvcnMgYW5kIHN0b3JlIHRoZSB2YWx1ZXMgb24g
IA0KICAgID4gYW5vdGhlciBtYWNoaW5lLg0KICAgIA0KICAgIFRvIGltcGxlbWVudCB0aGUgUmVk
ZmlzaCBUZWxlbWV0cnkgc2VydmljZSB3b3VsZCB3ZSBuZWVkIHRvIHN0b3JlIHRoZW0gb24gIA0K
ICAgIHRoZSBCTUMgYXMgd2VsbD8NCkl0IHdpbGwgYmUgbmljZSBpZiB3ZSBjYW4gc3RvcmUgaXQg
aW4gUkFNIGF0IGxlYXN0IHdpdGggbGFyZ2VyIGRhdGEgYW5kIHNvbWUgZGlza3NwYWNlIA0KV2l0
aCBzbWFsbCBsb2cgcm90YXRlLg0KICAgIA0KICAgIC1icmFkDQogICAgDQoNCg==
