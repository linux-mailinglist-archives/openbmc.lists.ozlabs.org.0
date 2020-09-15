Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0626AD39
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:13:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrXtg49kgzDqTk
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:12:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=652724fd9d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=m054eB+u; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=h241EKAH; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrXsm4DgdzDqHX
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:12:11 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FJ4mA0018785; Tue, 15 Sep 2020 12:12:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=pKaBA46tZTcPyxbLHq6GYPCqzlc07WH/Wm0ZT6OoPlo=;
 b=m054eB+u+zqgsjGOXrUsqvFYUm5R88zvz/Zk9zyKAIziyuwD6CE+NBsUe91YYaecEnxs
 wUhE/RwhVFjzA/+0GKQVbCg8aKQuBgYE+dmRQzuUnFUBy3cZWQetLnC0RT9y7AHJC+mj
 opBBtzk8NF/LslVsYmREWrnSyFGzjFUeydw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33j50e234d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Sep 2020 12:12:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 12:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDo320g9nzODdbUkLMI7oF6dcWjnjHkDhiWewUulZmhzb+KyqA33pIJMsF84RzikPwp0i8/T6m5ZeXVYRYl0g4szlhIdUcX6VseBWzvuQu44O9HohGCO2kqfFttpQdBcaPFhEa/6lPpM0E1xqeupA4rQLSG3XQ5gK4uvJZS5JQOEBcnf/kNo1FMWNo0vmebUjLCj4yBt771uIFm1t2JTSf0cTK6hkpmuZGSs+2M8/5Qn4TvK83EFMWgU++mj4G0MKheDFy9xu/Pwq7TSeKOFlC8AKh+M1sUlcFiQ6sI9sj1/GcIdzezU6BWMwPNFGWrDJnDw2GuDvVvCGzcAfbb64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKaBA46tZTcPyxbLHq6GYPCqzlc07WH/Wm0ZT6OoPlo=;
 b=kqpODvFA1QdwdzRfVC9sHI2l/mzEU43I6k1qGtU2XclsaTsbEChFjbpLLwh1/BMdRpDY6IMwLqnGoDwYdSN1frSk4gOQHuq+9c0rc8LzVfQiEFSoEz/MymLBUTlBwTUVFrcDAGKM1qUWzuTzHoVXuFSso8sf/FudvM0cZz0WnLUiw12vxoVsK29iMztMdBIppdOl8EmEeUeStlA+Hd1yhxBUQMI4u2wsvBihkWUs61PlXU+MONlExhtAoZJ/N5oiK/dSC6mX7CyVqo3Ubq8SXsATKvJocs9yFWQ/LpZW8imdtgPM7xJat9wvVIqKgomfKONFIphmAJq30/IyIF3sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKaBA46tZTcPyxbLHq6GYPCqzlc07WH/Wm0ZT6OoPlo=;
 b=h241EKAHkJ7HtI6HS4pYwQ7IzSvTylAZ/W5R30ee51MuxdzriF2Xzb9F+fzc8YfH8Pvx4ZkBMEeWtqLjB35ySgFatSiPv5cXV70/N6RZMMfOjCXgjpuQ5T0ipp9VlsSSlwmmgDdce0baoGkaBakv/jrqImxLbsRx/hIh6zXnzMk=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4120.namprd15.prod.outlook.com (2603:10b6:a02:c4::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 19:12:07 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 19:12:07 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, Neil Bradley
 <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mTOgP/mwW7Q/8yCMAD/mIeqQP8wEaiA/mAhSYD8uz7p0Pl07x2Q8uozLAA=
Date: Tue, 15 Sep 2020 19:12:07 +0000
Message-ID: <1275D156-D9C8-4C93-A31E-1F2733540396@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <ba0c0f989f1045f98a5186a57917c4b6@SCL-EXCHMB-13.phoenix.com>
 <E2ECF617-0F2B-4526-A2F9-20F343F317A3@fb.com>
 <b6891a4662b04509ae5ed0f8c54777ce@SCL-EXCHMB-13.phoenix.com>
 <868F639F-7878-4B90-8CAE-7C95EB57B26E@fb.com>
 <9b4d083d50ad4feba14f5c8848540ade@SCL-EXCHMB-13.phoenix.com>
 <37DC42F0-56AD-477E-A5E0-29F8FB466D63@fb.com>
 <0e51a98472f34f5d8626a54dd2107479@SCL-EXCHMB-13.phoenix.com>
 <F30B4C21-5AF7-4E59-8353-944BD1C9F39B@fb.com>
 <e7456a8f3f004855829dfa746cd70780@SCL-EXCHMB-13.phoenix.com>
 <DDCDB096-458F-4AC6-BFE8-C1670ADC12C8@fb.com>
 <22A8A752-CE83-4E7E-9C0A-24828D6FDBFA@fb.com>
 <b7acd0b0fff646f4b6804fb0d6d020d0@SCL-EXCHMB-13.phoenix.com>
 <c918ddbd1e23412086ba8da789616838@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <c918ddbd1e23412086ba8da789616838@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:88de]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20f72509-8863-4b24-66c7-08d859ab3d29
x-ms-traffictypediagnostic: BYAPR15MB4120:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB4120976999159D49F9CA55BEDD200@BYAPR15MB4120.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +/UAMNvFJlq1FhAWawvBW0vUuupVWI/aOPz99CsvWBhCtKg2XlHLhuFR4tutOITTGyZcxo0sogevGZ57zkhK3nOh8ZAQLJu6VdmQGu2kf7P9blzKvJa58H8yldffy+khSUpo9YbKqiUzuTcPcHVLhLJerrZVW6OYQ0THplhOHY0JgehlbVm4u3MEoq5Q0mTe9Md9Te8VMJ8HGPg0eqfbP2LIY9sf8amOpFHOrjVaGyuy6PGmDhzhV7Yg+9oVlqsjvaaj5+IGcEOinRMXnmnaPQk265zi86gXP6Rn+aDahuO6Eb8KadulN6suwkfmyBehgmYLZ+EQWpNkDnkrf5oxRlynuWJLCbSdxEfnxto1L1NlQDy0HQ2x0pASxpib3Bum
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(376002)(39860400002)(136003)(316002)(6512007)(6506007)(33656002)(2906002)(53546011)(64756008)(8936002)(76116006)(86362001)(91956017)(36756003)(66476007)(66556008)(66946007)(66446008)(7116003)(5660300002)(2616005)(83380400001)(4326008)(110136005)(186003)(71200400001)(6486002)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hKSliJrFCQB4Fb97/AW1JURq0Gp2rw4la9KzC4u7Z8oqdzBrc9szv2/UydqsKjNp4xQZel80721kWmAWlZuNyrkShDw1deNODKLPG5hvnPK6+xiboTCpDAcaQxuNBj4MN3WeeKR8C/eGTnhezT/Voi/tyJPF59olCT+kI9MeACZ9GWx0X4TPcxc55Mus0Wyju+9qRdIUUBK0QBnfbjKNFg8ELN1UoqDrcdlMTabNTCHHW2kBraBHPoC5UOOPxTVvwVPBA5q7wSCnnoIfKx5hY53lzsDsvxmysj9TVa7/ONumokTUsNo5+nMoJr0c/Y8UHb92DnMNJhPb9iAmBSYKL3AcunpfJH9kQOFU0CK8IJryKu3QiyB7gbIJYr9FUWVe5hpS1ISH0vIDLFIUkHceJ1dOtd1zOEoZLOy0cTP36FAjPlpBKEyQFWlf3eUbf4G4kbKHkNw0WyLt/dyopA9COa79z6wdOWX3CBUlWKm87i5fi0GK5+yDRjCtQxboFyzd2iR1ArFS2wy5j5rTJEvxdT5q2d4iU+Ec0qZsAxw4Laguerj2MkYyZuWbjFPwi4asRe+e2wuG6b8yvmyP9kXZ5j+S8kk+c8IYiEJETA709P4te1iUZogkuUIkxH1G92ercb4ocxA+VicFpObWECbW8WXIYnhM9OCaXP/ChIVZn6gOuXu2EVpNcbvg7h/Mn7/K
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3A374905DE6E145B69EB74E44282891@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f72509-8863-4b24-66c7-08d859ab3d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 19:12:07.2059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C539onehNZxv+ZQse04V5BQbQXUmFGCQSq/1uQbbL7In6wemj1/bZQ8Sygbf6pZimo0zMNlorxVzbcweRwTGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4120
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150150
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhlcmUgaXMgQk1DX1JFQURZIGdwaW8gd2hpY2ggbmVlZHMgdG8gYmUgc2V0IGJ5IEJNQyBiZWZv
cmUgaXQgY2FuIGNvbW11bmljYXRlIHdpdGggaG9zdCwgdW50aWwgdGhpcyBncGlvIGlzIG5vdCBz
ZXQgSG9zdCBiaW9zIHdpbGwga2VlcCB3YWl0aW5nIGFuZCB3aWxsIG5vdCBib290IGNvbXBsZXRl
bHkuDQoNCu+7v09uIDkvMTUvMjAsIDEwOjE5IEFNLCAiUGF0cmljayBWb2Vsa2VyIiA8UGF0cmlj
a19Wb2Vsa2VyQHBob2VuaXguY29tPiB3cm90ZToNCg0KICAgIFRoZSBtYWluIGlzc3VlIEknbSBo
YXZpbmcgaXMgdW5kZXJzdGFuZGluZyB0aGUgYmFyZSBtaW5pbXVtIHJlcXVpcmVtZW50cyBmb3Ig
Qk1DIGludm9sdmVtZW50IGluIFRpb2dhIFBhc3MgcG93ZXIgb24uICBJJ3ZlIGZvdW5kIHRoZSBy
ZWNpcGUgZmItcG93ZXJjdHJsIHdoaWNoIHNldHMgYSBjb3VwbGUgb2YgR1BJT3MgYnV0IGJleW9u
ZCB0aGF0IEkgY2FuJ3QgZmlndXJlIG91dCBob3cgdGhlIEJNQyBpcyBlbmFibGluZyBwb3dlciBv
bi4gIEknbSBtaXNzaW5nIHNvbWV0aGluZy4NCg0KICAgIElzIHRoaXMgc29tZXRoaW5nIHlvdSBj
YW4gaGVscCB3aXRoPw0KDQogICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgID4g
RnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtDQogICAgPiBib3VuY2VzK3BhdHJpY2tfdm9l
bGtlcj1waG9lbml4LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YNCiAgICA+IFBh
dHJpY2sgVm9lbGtlcg0KICAgID4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMTQsIDIwMjAgMTA6
MzAgQU0NCiAgICA+IFN1YmplY3Q6IFJFOiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44DQogICAgPiAN
CiAgICA+IFdoYXQgd291bGQgYW4gYXBwbGljYXRpb24gbmVlZCB0byBkbyB0byBjb250cm9sIHBv
d2VyIGZvciB0aGUgaG9zdD8gIFBvd2VyDQogICAgPiBjb250cm9sIHdoaWxlIGluIHUtYm9vdCBf
c2hvdWxkXyBiZSBhcyBzaW1wbGUgYXMgZW5hYmxpbmcgdGhlIHBvd2VyIGJ1dHRvbg0KICAgID4g
cGFzc3Rocm91Z2guDQogICAgPiANCiAgICA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CiAgICA+ID4gRnJvbTogVmlqYXkgS2hlbWthIFttYWlsdG86dmlqYXlraGVta2FAZmIuY29tXQ0K
ICAgID4gPiBTdWJqZWN0OiBSZTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIuOA0KICAgID4gPg0KICAg
ID4gPiBTbyBpZiBCTUMgaXMgbm90IHJ1bm5pbmcgdGhlbiB5b3UgY2FuIGNvbnRyb2wgcG93ZXIg
bWFudWFsbHkgYnkgcG93ZXINCiAgICA+ID4gYnV0dG9uIG9yIHJlc2V0IGJ1dHRvbi4gQXMgZmFy
IGFzIEkga25vdyBUaGVyZSBpcyBubyBhcHBsaWNhdGlvbiBpbiB1Ym9vdA0KICAgID4gPiB3aGlj
aCBjYW4gY29udHJvbCBwb3dlciBmb3IgaG9zdCwgSXQgaXMgZG9uZSB0aHJvdWdoIEJNQyB3aGVu
IGl0IGlzIGJvb3RlZA0KICAgID4gPiB0byBsaW51eCBhbmQgcG93ZXIgY29udHJvbCBpcyBydW5u
aW5nLg0KICAgID4gPg0KICAgID4gPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5n
IGFueXRoaW5nIGhlcmUuDQogICAgPiA+DQogICAgPiA+IFJlZ2FyZHMNCiAgICA+ID4gLVZpamF5
DQoNCg==
