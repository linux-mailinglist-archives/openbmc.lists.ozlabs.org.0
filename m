Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767B28E46C
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 18:28:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBHs430wWzDqsb
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 03:28:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=7556387d4b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=JYYbV1HS; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=a8ag7q8E; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBHqp6ZXNzDqrW
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 03:26:56 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EGK6TF004249; Wed, 14 Oct 2020 09:26:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-id : content-type
 : content-transfer-encoding : mime-version; s=facebook;
 bh=WFEHYemVcYUGQYnutLZj3V+6mVMylh2HDXQN3FLK9KU=;
 b=JYYbV1HS3S8X9PwmkV4WC1lTibL6oswUAAQ1fkXwWX3HhK0vdxKsAHgWoXI6zFwWGZZJ
 rp9titstyp++2BJZ2g1SY6qfwGfNV51Qj0sMR3pvZOfbaf5SC7W0pA1YqNGpvvzQhovi
 ze3G23CGVfDYrZbh7rbDpvsKsW7hvViTXyU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 345p2cv3ka-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Oct 2020 09:26:49 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 14 Oct 2020 09:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHeXl5Fl3/1gdD8ILgDuareHixmZXxewmhnL6o9pdT7rz+K8NfZiEKqZSxZBw8S37VOu109K00F5YE8TqP81gWYETtVkl2wUylmcprmsnpC/pe0GE0sc3aIb+lyiyklK69j+qu54714Y9Ji+Pey+x6BzzORPOj1DImGHFuM75hESwLfkByt9h4dWP9VbzQlIiuK3mY6/59vo5iLDvfRebKgimyB75BfjlbBpnvU4jp8QSX8w7L//4g9T7wep2kBx/m1Lvy02LidNPDVg9AUbmaExqonAM9/eYD4kzvJhqkpV7UeiBQvjXUjt/g7Ou45UZlr0r8MGAO13GpvdZget5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C7VHVGUBxgnCHV3q3s+MJvk3PBzDT8htQaj4TziK+o=;
 b=SVtqOySqGhEizHR1tdmzxukfzLFKNxzz/ydW003UueyswA+AGgYQh3FA1bK85qrRephRTcKWfZicDDQfld7Pzi0ylHTiLhwtTCFaukIr3ytdxCnzAU63WWbITyuJS4nCRXHnGxuUVtrVyFXcGT3PmAMKhxttuNSwlVxE/RBQGeirZjRrH6DTiLpyZvDxX7q/dgruRfQpBrz/acuN89HSPJC3Ty48hUOPm9fT0eLZb7TfkzrgU8LbEVj2XbIJGl/BD6N5wzle1Nc+ZPn/Ey2KN1HtkHqF1AIFT47bCH6BvvdutVmhh3HxzxyD+2I749HPFYozXshjGUwu2U0Uq5J3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C7VHVGUBxgnCHV3q3s+MJvk3PBzDT8htQaj4TziK+o=;
 b=a8ag7q8EjsB3BTCS99mw6g913QWxaJfv4/HOwbBnsmn5KWFJ08SM41kNPdrUi+TPVpYi5M5C1R/QluuV4dfA5OvMW6W8jLNRbp1YRQHXQ+dCn59Kg17ZLMzLRglrlR0twffQOy9XL8v15J1D0iTAX3Imu/JbaIqM8vSPXMq/ozA=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BY5PR15MB3729.namprd15.prod.outlook.com (2603:10b6:a03:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 16:26:47 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:26:47 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, Lei Yu <yulei.sh@bytedance.com>, 
 "Li, Yong B" <yong.b.li@intel.com>, Ed Tanous <ed@tanous.net>
Subject: Re: How to list all sensors through redfish?
Thread-Topic: How to list all sensors through redfish?
Thread-Index: Adae5vuofLXC5NmxTy21mi+Xpir4ZQCIAyiAAB3JEwAAI31jgA==
Date: Wed, 14 Oct 2020 16:26:47 +0000
Message-ID: <ABEC0074-953E-42FE-8897-D3375A17E32F@fb.com>
References: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
 <CAGm54UFuP60G6-2BYerdK_+ssuWh0BYUBVdBCSaBHrHbHD0MFQ@mail.gmail.com>
 <c9fc71c8-aa5a-d00d-81f7-40d8ca2d5e63@linux.vnet.ibm.com>
In-Reply-To: <c9fc71c8-aa5a-d00d-81f7-40d8ca2d5e63@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:9a77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07f2c45c-1765-4a29-d5ef-08d8705df26d
x-ms-traffictypediagnostic: BY5PR15MB3729:
x-microsoft-antispam-prvs: <BY5PR15MB372905CF30437A567B3DFC63DD050@BY5PR15MB3729.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DW8kQlerSp8R2h9bSS4+NWIqezNKzj0x1va2MUi5+6KGNc6/nD5C+bi2oeMjdbOSKMinWB5i85DCADx5JA679KSm7XFEGPlopq2dYus0a1ZIB8Y9Iiw4Q8obyyNkMby9jlquKEwBi20NOtJwQiNqjxdysdEa4VAZ/bSdwU3IE/6wdTTpUkHzvWBVXot2rcNpYrtMtU/I83MlPg6A9UYjbGF52NjGbADkkGqLyQ82gNcfJ7E7hXr8mtXnO2obzow5lafxyaa3zOfYNZSOweIQMunBYQ512s2W1unK2RKeKv94qRyfk192pXeF/w3Po+oWlKaOxKctDB7AR9M1Kj8hhwC4f6I6NWzl+i3eBBvYK09P+1zqBsTeymgshyvGMRfOFOs6oRjVwZIzHJa51KS1Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(366004)(39860400002)(136003)(2906002)(83080400001)(8676002)(86362001)(4326008)(110136005)(54906003)(966005)(8936002)(53546011)(6506007)(33656002)(186003)(6486002)(71200400001)(64756008)(36756003)(76116006)(6512007)(478600001)(83380400001)(66476007)(66446008)(2616005)(5660300002)(66556008)(66946007)(316002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jbNNgIOwnFDI10Alf7OYbkZkJIMkHUS29WCtNi/1Etz98Y8svvjJZHckX5enl+JxBa3qYOmcmYSj5MrlMuntC1xOoFJYWpQ9qaDv9zKwMy/2hhmFmFPXFUqIplO0dccV6kS1rvGLmmT5sIoJw9cJR/d2fRoLxqgrpU/J/HyLWA0pmyR3aqg08yyajOIrMkt1c9p+SsJXt9kBEMwo9e0uAuQbIbuXHFzj09Y1ThRyCTabNpLeLOrJlIIAsxv0oc3uvHt3Xo69OfSrq8M/zZLGMd9PLJon78w2rn0Ms5zz3dMqKT4ELJ382yZ0ntjwUdfijpHu6Zd/jwRTDNG+seO43yU/B+GBiBMkLHrZIZ3C0ayJ8sFnIUqlWfo9bTe0WctCGrLdDr2tBFwuUXrZz48mXm9oKI8PIn3IGWekqvqPwjNKIl5bSCa/0sIQt6LSMGzoS9uvskW1yin46Qoq2Ur+Az1VNrV6R7hTvs9xxEp3IXDj79SFYzzam6AvN1HYFcM/co00hYHN2mvRZKGZSXN3CQZozFFYZOnSiHeG7s/LwssyQPtaY43Ps72rf/+aS7qj38cK7D0EB5INGbPhNKYDGZpjmiEcqzrAhTD5bw7vC0fbkPAxnLzL9ZRGnIISpu+KKhmQCaegX5hM6q3E2CGfKwftSXNilOhfmKj5Hjj83p0=
x-ms-exchange-transport-forked: True
Content-ID: <3CDC08A949BF8749A0DCDA63B5C7B529@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f2c45c-1765-4a29-d5ef-08d8705df26d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 16:26:47.3869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/hnrB4Ylam8dKYE6tQxwnnovYU+dDgz4mpj/ChNX4UYsKTKhlAnFjki8F0OY4JeStq6HsLhsFq6Rgjs40fRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3729
X-OriginatorOrg: fb.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_09:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 clxscore=1011 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140116
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "feistjj@gmail.com" <feistjj@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEwLzEzLzIwLCA5OjMyIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgR3VubmFy
IE1pbGxzIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBnbWlsbHNAbGludXgudm5ldC5pYm0uY29tPiB3cm90ZToNCg0KICAg
IE9uIDEwLzEyLzIwMjAgODoxNyBQTSwgTGVpIFl1IHdyb3RlOg0KICAgID4gT24gU2F0LCBPY3Qg
MTAsIDIwMjAgYXQgOTowNiBQTSBMaSwgWW9uZyBCIDx5b25nLmIubGlAaW50ZWwuY29tPiB3cm90
ZToNCiAgICA+Pg0KICAgID4+IEhpIEFsbCwNCiAgICA+Pg0KICAgID4+IEJhc2VkIG9uIHRoZSBj
dXJyZW50IGJtY3dlYiBpbXBsZW1lbnRhdGlvbjoNCiAgICA+Pg0KICAgID4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9iL21hc3Rlci9yZWRmaXNoLWNvcmUvbGliL3NlbnNv
cnMuaHBwI0w2MQ0KICAgID4+DQogICAgPj4gVGhlIGJlbG93IFVSTCBvbmx5IGxpc3QgdGhlc2Ug
cG93ZXIvY3VycmVudC91dGlsaXphdGlvbiBzZW5zb3JzOg0KICAgID4+DQogICAgPj4gcmVkZmlz
aC92MS9DaGFzc2lzLyRjaGFzc2lzL1NlbnNvcnMNCiAgICA+Pg0KICAgID4+IEp1c3Qgd2FudCB0
byBrbm93IHdoeSBub3QgbGlzdCBhbGwgcnVubmluZyBzZW5zb3JzPyBJcyBpdCByZXF1aXJlZCBi
eSByZWRmaXNoIHNwZWM/DQoNCiAgICBXZSBhc2tlZCB0aGlzIHF1ZXN0aW9uIGluIHRoZSBSZWRm
aXNoIGZvcnVtIHRocmVhZCBiZWxvdyBhbmQgUmVkZmlzaCANCiAgICBzYWlkICJmb3Igc2Vuc29y
cyB0aGF0IGFyZSBub3QgY292ZXJlZCBlbHNld2hlcmUgaW4gdGhlIG1vZGVsIC0gbWVhbmluZyAN
CiAgICBkb24ndCBkdXBsaWNhdGUgUG93ZXIgYW5kIFRoZXJtYWwiLg0KDQpPbmUgY2xhcmlmaWNh
dGlvbiBuZWVkZWQsICJwb3dlciIgaW5jbHVkZSAgcG93ZXIgYW5kIHZvbHRhZ2Ugc2Vuc29ycyBh
bmQNCiAic2Vuc29yIiBhbHNvIGluY2x1ZGUgcG93ZXIgYWxvbmcgd2l0aCBjdXJyZW50IGFuZCB1
dGlsaXphdGlvbiBzZW5zb3JzLiBJc24ndA0KdGhpcyAgYSBkdXBsaWNhdGUgb2YgcG93ZXIgaGVy
ZT8NCg0KICAgID4+DQogICAgPj4NCiAgICA+PiBJcyB0aGVyZSBhbnkgd2F5IHRvICBsaXN0IGFs
bCBzZW5zb3JzIHRocm91Z2ggcmVkZmlzaCBpbnRlcmZhY2U/IExpa2UgdGhlIOKAnGlwbWl0b29s
IHNlbnNvciBsaXN04oCdIGNvbW1hbmQ/DQogICAgPj4NCg0KICAgIE5vdCBpbiBvbmUgY29tbWFu
ZC4gWW91IHdpbGwgaGF2ZSB0byBjYWxsIHRoZSBUaGVybWFsLCBQb3dlciwgYW5kIA0KICAgIFNl
bnNvcnMgc2NoZW1hcyBsaWtlIHRoZSB3ZWJ1aSBkb2VzOiANCiAgICBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy93ZWJ1aS12dWUvYmxvYi9lOWE1OWM3NTY3MDQ2MWE4MDE1NjU1NGE0ZGZhMDRi
YWI1ZWFmNDJjL3NyYy9zdG9yZS9tb2R1bGVzL0hlYWx0aC9TZW5zb3JzU3RvcmUuanMjTDIyDQoN
CiAgICBJbiAyMDIwLjQsIHRoaXMgY2hhbmdlcyBhbmQgYWxsIHNlbnNvcnMgd2lsbCBiZSBpbiBv
bmUgbG9jYXRpb24uIDopDQoNCiAgICA+IA0KICAgID4gSSBqdXN0IHNhdyBzb21lIGRpc2N1c3Np
b24gaW4gdGhlIElSQyBieSBHdW5uYXJNIHF1b3RlZCBhczoNCiAgICA+IA0KICAgID4+IC9zZW5z
b3JzIGlzIHNlbnNvcnMgdGhhdCBhcmVuJ3QgaW4gUG93ZXIvVGhlcm1hbCBodHRwczovL3JlZGZp
c2hmb3J1bS5jb20vdGhyZWFkLzE5MC9zZW5zb3Jjb2xsZWN0aW9uLWNvbnRhaW4tYWxsLXNlbnNv
cnMtY2hhc3NpcyANCiAgICA+PiBGb3IgMjAyMC40IHRoaXMgY2hhbmdlcywgYWxsIHNlbnNvcnMg
d2lsbCBiZSB1bmRlciAvc2Vuc29ycyB3aXRoIG9ubHkgYSBsaW5rIHRvIHRoZSBQb3dlci9UaGVy
bWFsL0Zhbi9Qb3dlcnN1cHBseSBzY2hlbWFzDQogICAgPiANCiAgICA+IEJ1dCBmcm9tIHRoZSBS
ZWRmaXNoIHNwZWMgaXQgZG9lcyBub3Qgc2F5IC9zZW5zb3JzIHNob3VsZCBleGNsdWRlIHRoZQ0K
ICAgID4gb25lcyBpbiBQb3dlci9UaGVybWFsLCBpbnN0ZWFkIC9zZW5zb3JzIGlzICJ0aGUgbGlu
ayB0byB0aGUgY29sbGVjdGlvbg0KICAgID4gb2Ygc2Vuc29ycyBsb2NhdGVkIGluIHRoZSBlcXVp
cG1lbnQgYW5kIHN1Yi1jb21wb25lbnRzIg0KICAgIFllYWggdGhlIHNwZWMgc2hvdWxkIGhhdmUg
Y2xhcmlmaWVkLiBQcm9iYWJseSBpc24ndCB3b3J0aCBjbGFyaWZ5aW5nIGluIA0KICAgIHRoZSBz
cGVjIG5vdyBiZWNhdXNlIHRoaXMgY2hhbmdlcyBpbiAyMDIwLjQgYW5kIHRoYXQgd291bGQgYmUg
dGhlIA0KICAgIHJlbGVhc2UgYW55IHVwZGF0ZWQgc3BlYyBpcyBhdmFpbGFibGUuDQoNCiAgICA+
IFNvIEkgYW0gZXhwZWN0aW5nIHRoYXQgaXQgc2hvdWxkIGNvbnRhaW4gYWxsIHRoZSBzZW5zb3Jz
IGluIHRoZSBzeXN0ZW0uDQogICAgPiBJbiBPcGVuQk1DLCB0aGlzIGNvdWxkIGJlIGRvbmUgYnkg
cmV0dXJuaW5nIGFsbCB0aGUgb2JqZWN0cyB0aGF0DQogICAgPiBpbXBsZW1lbnQgdGhlIHh5ei5v
cGVuYm1jX3Byb2plY3QuU2Vuc29yLlZhbHVlIGludGVyZmFjZS4NCiAgICA+IA0KDQogICAgV2Ug
aW1wbGVtZW50ZWQgdGhpcyB3YXkgYmVjYXVzZSBvZiB0aGF0IHRocmVhZC4gRmVlbCBmcmVlIHRv
IHJlcGx5IG9uIA0KICAgIHRoYXQgdGhyZWFkLg0KDQogICAgVGhhbmtzLA0KICAgIEd1bm5hcg0K
DQo=
