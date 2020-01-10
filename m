Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B013641F
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 01:03:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v39W3yWRzDqVW
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 11:03:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82783ba05e=zhdaniel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=kGmKXVoV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=cDEtu6ZO; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v38X4QfmzDqb1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 11:02:46 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00A01KiP029873; Thu, 9 Jan 2020 16:02:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Ixn9jTkkedLig00c9X1Vtl/N1sCVs7PcQS/e6EGYTpY=;
 b=kGmKXVoVcb6wXcFU7zFuPHtKnUFLut+d0OkR+5Suw5etG7CJM7ILmRzANJlBA3xOAN0d
 0meWpq0HWI0mHw3xh02ROaKN+zcIUmyAcziAh48MTUTCfGYA4e1HHrlyRccgVAsxRaCw
 JGNICizLKy1e/JtZw+fElxfcA0a6Y4LLX8U= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xdrj8pmd7-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Jan 2020 16:02:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 16:02:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S40eYakKq2pyM60Nv3VK0pLvCD6rdCVlhVSdvqpaQMsWuwXZ+YkNnvBUDEZ8wxaTsryyf0qVLwdIkHH9nM2bCEGAxhfxUVNtdnCzNz+2eEcV6jwPSKfBwTvU6+cGDkAsliedSz/br2j8Qf8FxzOYwlxdz8PvRRVHkXnyVWa+RqrQhEHDj38xKXOBqPjQo8h8skD2fp43IYLKBdfgxX24mJM2yScqSd9TU1Z60oWFVVvexISbgqgD7KQUZYndJ6C0hOgs0b5x0rUP8w8jThJBL2o0FIPIdUya+ojneD89ZynEeC6TJOWh05/MerhzTYla+0oCLHHpr3f/lQYcCFVT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixn9jTkkedLig00c9X1Vtl/N1sCVs7PcQS/e6EGYTpY=;
 b=gsEhcw8Lnto0BltNuBm0MNW+bsw4CQKSpJPbZ3sjeoCVZHZtp048gLYdvSfcFcRc/VOBx6fgK1DL8t7zjgYi7aTBk0WzGNDa6UESCXr0xLI/gl0bhUyDWvmMfq1RFO19ptxWWJCAwCv9+Bny4CS3xTWxHV8qsGSaGq4AHm5Z3HMO9JgoPZhEdXhrS17NmFSUSvVdMGMc5uRphFWbEy2znjexLMTtpzo9/LesWywLix2EHSciWlm30owSyK3/icbQVPz1TIlcE87SW3xrhCbtd7jKG/nuQiIIvUt3fFPbhWwQ9wxNGRP28JpOO5AgXQEITsOm6qgZpRtELtzaPxCeEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixn9jTkkedLig00c9X1Vtl/N1sCVs7PcQS/e6EGYTpY=;
 b=cDEtu6ZOhSsJd2amnVJFRqqKqfkWm1nwpZiHvoYstAV1BFzkjmW4UE6JUenKYyDfs4hZhJKKPkxQ83F7ewI1uaFasOHD0XFKGtUTZAklVNnZ5RD79t8hd9uxpSkLQP64zi3ZSZcbudbspIMhToW2HZDCK2dPbQ7P6WJKKnmvTqo=
Received: from MWHPR15MB1549.namprd15.prod.outlook.com (10.173.235.22) by
 MWHPR15MB1358.namprd15.prod.outlook.com (10.173.232.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Fri, 10 Jan 2020 00:02:29 +0000
Received: from MWHPR15MB1549.namprd15.prod.outlook.com
 ([fe80::7123:feb5:8cee:5ac4]) by MWHPR15MB1549.namprd15.prod.outlook.com
 ([fe80::7123:feb5:8cee:5ac4%5]) with mapi id 15.20.2623.008; Fri, 10 Jan 2020
 00:02:29 +0000
From: Dan Zhang <zhdaniel@fb.com>
To: Joel Stanley <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>
Subject: RE: U-Boot upstream, patch and maintain model and plan for OpenBMC
Thread-Topic: U-Boot upstream, patch and maintain model and plan for OpenBMC
Thread-Index: AdXHNhf5EgApGSb3T+yH5WiidBR37QAA05IAAAJJX+A=
Date: Fri, 10 Jan 2020 00:02:28 +0000
Message-ID: <MWHPR15MB154997F41CF7C0FD58CED465A8380@MWHPR15MB1549.namprd15.prod.outlook.com>
References: <MWHPR15MB154906E39EEC026958D2EB42A8390@MWHPR15MB1549.namprd15.prod.outlook.com>
 <CACPK8XejhEWROY_CKCDDytnq-Po6Mr8h2zrNt5CDRhsCvoaVqg@mail.gmail.com>
In-Reply-To: <CACPK8XejhEWROY_CKCDDytnq-Po6Mr8h2zrNt5CDRhsCvoaVqg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:1baa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45e09520-8167-4e32-3803-08d79560620b
x-ms-traffictypediagnostic: MWHPR15MB1358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB1358F21177BA615A17B15CDBA8380@MWHPR15MB1358.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02788FF38E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(13464003)(52536014)(966005)(71200400001)(54906003)(110136005)(6506007)(186003)(5660300002)(86362001)(33656002)(316002)(66574012)(53546011)(66446008)(81156014)(8936002)(7696005)(2906002)(64756008)(76116006)(66946007)(66556008)(66476007)(478600001)(55016002)(9686003)(4326008)(8676002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1358;
 H:MWHPR15MB1549.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zVYWhB6gNlcCIqIyEBTAroxq5H5wwE8BFCy1MXL0HUVKg54XDCEsWZCfP2U7fUQi09RKj/Ugl7NaKBTUl6R6Ja7n6FkPjLa8yIn/p1WxSsMuDvYQEV+qQH9oNarh4wxNv0oGP1HzltjCZKvKompV7KTQh/YpFVLMbSslSZWvgZtmQXcxXBzce/dK4V9f916t5UaewNsaZDs245r3uBXyI9CXMDxcF8I8LkTnAR81GSFRN27ENiB9LQJ3uD8oooVfKk2tiDl8P6DqGAYeV6AOGgdDzSoKxTewVtaDHc87Rr/VjxkwfldaFdj34fCfieZfLwOXGrhdTX9FkoHEsj5lkU7wXxSb2tTXfAU1VcNidvjibpfyMpZFctf/v5ODrXBRgdxJHc1EVVNUdlqDUstaH53DwfITzVm7g2QLOlgeA64+N++ZUiunIHClYN85WznjPifkEyJvM3LJfpkUBOILOyt9cB2ggmC7DbsiaW2fJoFHYfzLYn208iuSza2WyfgbeXTRcSgFTfYp5XCdMCPjn4ljhD3+cHWK81tQ4AK1P8AqnkJdwXxtRd2XaTXN7525
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e09520-8167-4e32-3803-08d79560620b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2020 00:02:28.8656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMJScSkbMSFRDOQdJA2vDIM0nQWZCCH854e8fCz5E179yG8wtNJ3RCV/0EkZye4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1358
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_06:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001090201
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDIw
IDI6MDkgUE0NCj4gVG86IERhbiBaaGFuZyA8emhkYW5pZWxAZmIuY29tPjsgQ8OpZHJpYyBMZSBH
b2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgQW5k
cmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCj4gU3ViamVjdDogUmU6IFUtQm9vdCB1cHN0
cmVhbSwgcGF0Y2ggYW5kIG1haW50YWluIG1vZGVsIGFuZCBwbGFuIGZvcg0KPiBPcGVuQk1DDQo+
IA0KPiBIaSBEYW4sDQo+IA0KPiBPbiBUaHUsIDkgSmFuIDIwMjAgYXQgMjE6NTEsIERhbiBaaGFu
ZyA8emhkYW5pZWxAZmIuY29tPiB3cm90ZToNCj4gPg0KPiA+IEkgYW0gd3JpdGluZyB0byBzZWUg
aG93IGNhbiBJIGFsaWduIGFuZCBjb250cmlidXRlIHRvIHRoZSBVLUJvb3QNCj4gZGV2ZWxvcG1l
bnQgZm9yIE9wZW5CTUMuDQo+IA0KPiBHcmVhdCB0byBoZWFyIGZyb20geW91IGFnYWluLiBJIGtu
b3cgd2Ugc3Bva2UgYWJvdXQgdGhpcyBhdCBPU0ZDLA0KPiBhcG9sb2dpZXMgZm9yIG5vdCBmaW5k
aW5nIHRpbWUgdG8gY2hhdCBzaW5jZSB0aGVuLg0KPiANClRoYW5rIHlvdSBmb3IgeW91ciBwcm9t
cHQgcmVwbHkgYW5kIHNoYXJpbmcgeW91ciBwbGFuLiBJdCBpcyBuaWNlIHRvIGhlYXIgZnJvbSB5
b3UgYWxzby4NCg0KPiA+IE9wZW5CTUMgc3VwcG9ydGVkIHBsYXRmb3JtcyAoIElCTSB3aXRoZXJz
cG9vbjogdGFjb21hIGFuZCByYWluaWVyKSBhcmUNCj4gdXNpbmcgbmV3IEFzcGVlZCBTREsgKGh0
dHBzOi8vZ2l0aHViLmNvbS9Bc3BlZWRUZWNoLUJNQy91LQ0KPiBib290L3RyZWUvYXNwZWVkLWRl
di12MjAxOS4wNCkuDQo+ID4gSW4gbXkgbmV3IHByb2plY3QsIEkgYW0gcGxhbm5pbmcgdG8gdXNl
IHRoaXMgU0RLIGFsc28uDQo+ID4gSSBiZWxpZXZlIGl0IHdpbGwgYmUgYmVuZWZpdCB0byBhbGln
biB3aXRoIGFuZCBjb250cmlidXRlIHRvIE9wZW5CTUMNCj4gY29tbXVuaXR5IHJlZ2FyZGluZyB1
cHN0cmVhbSwgcGF0Y2ggYW5kIG1haW50YWluIHRoaXMgbmV3IFNESy4NCj4gDQo+IFllcywgdGhh
dCB3b3VsZCBiZSBncmVhdC4NCj4gDQo+ID4gVGh1cywgSSBoYXZlIHNvbWUgb3BlbiBxdWVzdGlv
bnMgYWJvdXQgT3BlbkJNQyBjb21tdW5pdGllcycgdS1ib290DQo+IGRldmVsb3BpbmcgbW9kZWwg
YW5kL29yIHBsYW46DQo+ID4gMS4gV2lsbCBVLUJvb3QgYWxzbyBmb2xsb3cgS2VybmVsJ3MgZGV2
ZWxvcGluZyBtb2RlbCBmb3IgT3BlbkJNQz8NCj4gPiBLZXJuZWwgZGV2ZWxvcGluZyBtb2RlbCAo
IG15IHVuZGVyc3RhbmRpbmcgKQ0KPiA+IGluZGl2aWR1YWwgY29udHJpYnV0b3IgYWN0aXZlbHkg
YWxpZ25lZCB3aXRoIE9wZW5CTUMgYWJvdXQgdGhlIGtlcm5lbA0KPiBwYXRjaCB1cHN0cmVhbWlu
ZyBwbGFuIGFuZCBzdGF0dXMsDQo+ID4gYW5kIE9wZW5CTUMga2VybmVsIG1haW50YWluZXJzIHdp
bGwgcHVsbC1pbiBhbmQvb3IgYmFja3BvcnRzIHRoZSBhY2NlcHRlZA0KPiBwYXRjaGVzIHRvIGFs
bCBzdXBwb3J0ZWQga2VybmVsIHZlcnNpb25zLg0KPiANCj4gSSB0aGluayB0aGlzIG1ha2VzIHNl
bnNlLiBXb3VsZCB5b3UgYmUgaGFwcHkgZm9sbG93aW5nIHRoaXMgbW9kZWw/DQpZZXMsIEkgYW0g
aGFwcHkgdG8gZm9sbG93IHRoaXMgbW9kZWwuDQoNCj4gDQo+ID4gQWxsIHN1cHBvcnRlZCBrZXJu
ZWwgdmVyc2lvbnMgd2lsbCBiZSBtYWludGFpbmVkIG9uIGNvcnJlc3BvbmRpbmcgYnJhbmNoZXMN
Cj4gaW4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXggIE9wZW5CTUMgZm9yay4NCj4g
Pg0KPiA+IDIuIFdpbGwsIGV2ZW50dWFsbHksIHUtYm9vdCBjb2RlIG9mIE9wZW5CTUMgYmUgbWFp
bnRhaW5lZCBpbg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy91LWJvb3QgT3BlbkJNQyBm
b3JrPyBvciBrZXB0IGluIEJTUC9TREsNCj4gdmVuZG9yJ3MgdS1ib290IGZvcms/DQo+IA0KPiBF
dmVudHVhbGx5LCB3ZSBob3BlIHRvIGhhdmUgYWxsIG9mIG91ciBjb2RlIHVwc3RyZWFtLCBhbmQg
bm90IHJlcXVpcmUNCj4gYW4gb3BlbmJtYyBmb3JrLiBXaGlsZSB0aGlzIGlzIGEgd29yayBpbiBw
cm9ncmVzcyBJIHN1Z2dlc3Qgd2UgdXNlDQo+IG9wZW5ibWMvdS1ib290LCBidXQgd29yayBjbG9z
ZWx5IHdpdGggdGhlIHZlbmRvcnMgdG8gZW5zdXJlIGZpeGVzIGFuZA0KPiBuZXcgZmVhdHVyZXMg
YXJlIHNlbnQgdXBzdHJlYW0gYW5kIGFwcGxpZWQgdG8gdGhlIG9wZW5ibWMgdHJlZS4NCj4gDQpB
Z3JlZS4gDQoNCj4gSSBoYXZlIHNwZW50IHNvbWUgdGltZSB3b3JraW5nIG9uIGEgcGF0Y2hzZXQg
c3VpdGFibGUgZm9yIHVwc3RyZWFtDQo+IHRoYXQgc3VwcG9ydHMgdGhlIGFzdDI2MDAuIEl0IGNv
bnRhaW5zIHN1cHBvcnQgZm9yOg0KPiANCj4gIC0gZHJhbSB0cmFpbmluZw0KPiAgLSBjbG9ja2lu
Zy9yZXNldA0KPiAgLSBwaW5tdXgNCj4gIC0gZ3Bpbw0KPiAgLSBmdGdtYWMxMDAgd2l0aCBwaHkN
Cj4gDQo+IEkgYW0gc3RpbGwgd29ya2luZyBvbjoNCj4gDQo+ICAtIG5jc2k6IEkgc2VlIGJyb2Fk
Y2FzdCB0cmFmZmljLiBEZWJ1Z2dpbmcgd2h5IHRoZSBOSUMgZG9lcyBub3QNCj4gcmVzcG9uZCB0
byBOQ1NJIHBhY2tldHMNCj4gIC0gc3BpLW5vcjogcGF0Y2hlcyBmcm9tIENlZHJpYywgYnV0IEkg
aGF2ZSBub3QgaW50ZWdyYXRlZCB0aGVtIGludG8gbXkgdHJlZQ0KPiANCj4gV2UgaGF2ZSBtbWMg
c3VwcG9ydCB1cHN0cmVhbS4gSSBoYXZlIG5vdCB0ZXN0ZWQgdGhpcyB5ZXQuDQpJIHdvdWxkIGxv
dmUgdG8gaGVscCBvbiB0ZXN0IHRoaXMuIFdlIHdpbGwgaGF2ZSBlTU1DIHN1cHBvcnQgaW4gYm90
aCBBU1QyNTAwDQphbmQgQVNUMjYwMCBwbGF0Zm9ybXMuDQoNCj4gDQo+IEkgd2lsbCBwdWJsaXNo
IHRoaXMgdHJlZSBpbiB0aGUgY29taW5nIGRheXMsIGFuZCBzZW5kIGl0IHRvIHRoZSB1LWJvb3QN
Cj4gbGlzdHMgZm9yIHJldmlldy4gQXMgbG9uZyBhcyB0ZXN0aW5nIGdvZXMgd2VsbCwgd2Ugd2ls
bCBzd2l0Y2ggdG8gdGhhdA0KPiBmb3IgdGhlIGFzdDI2MDAgcGxhdGZvcm1zIGluIE9wZW5CTUMu
DQpHcmVhdCwgSSB3aWxsIGtlZXAgZXllIG9uIHUtYm9vdCBsaXN0ICwgYW5kIHdpbGwgYmUgaGFw
cHkgdG8gaGVscCBpbiByZXZpZXcuIA0KDQo+IA0KPiBJIHByb3Bvc2Ugd2Ugc3VwcG9ydCB0aGUg
YXN0MjUwMCBwbGF0Zm9ybXMgd2l0aCB0aGUgc2FtZSB0cmVlLg0KPiANCj4gSSB3b3VsZCBhc2sg
dGhhdCBzb21lb25lIHN0ZXAgZm9yd2FyZCB0byBhZGQgYXN0MjQwMCBzdXBwb3J0LCBhbmQgaW4N
Cj4gdGhlIG1lYW4gdGltZSBpdCB3aWxsIHVzZSB0aGUgZXhpc3RpbmcgdHJlZS4NCj4gDQo+IEhv
dyBkb2VzIHRoaXMgcGxhbiBzb3VuZCB0byB5b3U/IElzIHRoZXJlIGFuIGFyZWEgeW91IHdvdWxk
IGxpa2UgdG8NCj4gdGFrZSBvd25lcnNoaXAgb2Y/DQpZZXMuIE15IG9yaWdpbmFsIHBsYW4gaXM6
IEluIGFkZGl0aW9uIHRvIEFTVDI2MDAgcGxhdGZvcm0sIG1pZ3JhdGUgb3VyIEFTVDI1MDAgcGxh
dGZvcm1zIA0KdG8gdXNlIHRoZSBuZXcgU0RLIGFsc28uIEF0IHRoZSBzYW1lIHRpbWUgcHJlcGFy
ZSBwYXRjaGVzIHRvIHVwc3RyZWFtIHRoZSBuZXcgU0RLLiANCkFzIHlvdSBoYXZlIGJlZW4gd29y
a2luZyBvbiB1cHN0cmVhbWluZyBuZXcgU0RLLiBJIHRoaW5rIEkgY2FuIGJlIGhlbHAgaW4gaGF2
ZSB5b3VyIHVwc3RyZWFtaW5nDQpwYXRjaHNldHMgdG8gc3VwcG9ydCBhc3QyNTAwIHBsYXRmb3Jt
cy4NCg0KQXMgZm9yIHN1cHBvcnQgQVNUMjQwMCwgdGhpcyBpcyBpbiBteSB3b3JrIGxpc3QgYWxz
bywgYnV0IHF1aXRlIGxvdyBwcmlvcml0eS4gDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IEpvZWwN
Cg==
