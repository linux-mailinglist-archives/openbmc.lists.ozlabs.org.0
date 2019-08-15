Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB038F1A1
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 19:11:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468XzF3ypTzDrBG
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 03:11:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3130004482=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="SCbECUg5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="KnKSitx1"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Xwj4dqpzDr9T
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 03:08:52 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FH4lg7000613; Thu, 15 Aug 2019 10:08:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=eASMcGfc0eSzcJk2uokf2B3EsssrLUCmVyIa5561R0g=;
 b=SCbECUg5y6GUxONwS9L3qouN05mtetq5J4rmUnnbMtkG8MXKqmXCDsSGQyzfi3dr4/US
 s2mlxUIByvVkQcyGe4RSxQoMRbRm0Rhz9m1D3+R5L128royZBVh7iPrE0X3suSFv1Qhz
 ooQ9QZKzO8YFwuIKwQxK3VQkwPZsIYz3Ol4= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2udak3r9d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 10:08:49 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 15 Aug 2019 10:08:48 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 15 Aug 2019 10:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaVgjCaAK0YMYHaNnHZL3hVEOWLVwctVVvcJPvm//cV93YiUen5RQuEIUBr1ccXrFDwbhWa3qy2pnstk3blddpMpH1wcQKKS7OKZKCpPfXNh7+u9xaqsie4Ss1vbXjPj1qc3q6/Bqai4neK294YuchhMh9Jg2IMF3l20jXida0rxu9PmyFT80HvFij7LUUw9VrbkVICGX6pIFbLccIsXVrT5I7L+IHunbFbM5GlhJUPMXrJdlV7iwpQUpJzxZqF4G5oWzLPlKLRqH0SM9ckKNKrnJfzO/FIAZVsHv5KRr0vLDM3u3aVRw0ld4rj5k/cP+6ZXCap509AC0me5DqfeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eASMcGfc0eSzcJk2uokf2B3EsssrLUCmVyIa5561R0g=;
 b=KcCj0M3fdP022H7hglG6/yDlbejBZNqY8EY6QflU4GVMayst3iXYxxLBV4NDCm1oRHY81UXFiCrw9ZIRiQDqXHKnACNARv44nv5qaprGbvGKbhC3pePTgipLmnmo8dreSkQTGQhzRmC7UWQ76VkC5yqem3ytO1ohe54NXDp4hxb1acwF0mvYfGj5aYvCns7Veg8F10SR9aBNyUHgd5MFiq4SqIAJjiGiwk6r6LHGs5ngiGAuEc1dfjJBXywaxQsvdDEvsGcM4JEtaaPIdJDoCmt/1qxo/qtA47Srlbjm/gLGZrfh+kR4ZGYvfLbGGRgIR+1H7LbEYiNSQzrepzzFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eASMcGfc0eSzcJk2uokf2B3EsssrLUCmVyIa5561R0g=;
 b=KnKSitx1SXgccnRJ5vdwN7oUzLxjTJTpjM+blwqiKS1/xWp6daOhVkkhM0A8wLLiOk9j76CVaKGqympTvK8h3cMfnGumVMO0stFk5CSnqcbtUfiEVxuQnlxOYyYD1WiwRBf7VraM/ML5BCgXVFRbYucpDFDxKOmxxlRY/e0VPzc=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB2798.namprd15.prod.outlook.com (20.179.144.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 17:08:46 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 17:08:46 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Policy on Tools Posting
Thread-Topic: Policy on Tools Posting
Thread-Index: AQHVUXIgQSRlsTKwM0GgAlElzpdXaqb8LnUAgABG14A=
Date: Thu, 15 Aug 2019 17:08:46 +0000
Message-ID: <668549D6-5649-41E7-85B1-C9D73713118B@fb.com>
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
 <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
In-Reply-To: <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.201.64.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7572cab3-cb67-44bc-404b-08d721a33bd9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB2798; 
x-ms-traffictypediagnostic: MN2PR15MB2798:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR15MB27987F91411A8B0827EC0882BDAC0@MN2PR15MB2798.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(136003)(396003)(39860400002)(189003)(199004)(51874003)(8936002)(71190400001)(71200400001)(256004)(66446008)(66476007)(486006)(66556008)(64756008)(476003)(66946007)(446003)(2616005)(33656002)(11346002)(76116006)(305945005)(91956017)(14444005)(7736002)(6916009)(1411001)(26005)(81156014)(81166006)(14454004)(8676002)(25786009)(6306002)(86362001)(6246003)(102836004)(76176011)(53546011)(6512007)(5660300002)(316002)(6116002)(186003)(36756003)(99286004)(478600001)(229853002)(3846002)(6506007)(3480700005)(53936002)(66066001)(6436002)(2906002)(6486002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB2798;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zNevLH10k9vfr1sQVwca8FjLeo2eaIViWEhDlf5vHc87FBtSCAJViqSalvZKTC2eQ4A0huhkmV0490i+wVA9QIKEMkCzxfWdCpRNxiemWhnEa8pLpv70WX2b1X4pznGeljtj+RoqIDZMCFT+4pTXPTSPVhR7vlz1nERs7eAidzaXORs3UfNlHCyVfkTBdzHICl955uNE6oXXXF3EW9IQmDQhyO8DVJtFoZASDaprpq7kOTGMxnrvWLf26CzrIWsWoaStQIOZPd8bUKn2l5V5oyj258zhloi6sCPoSucyIzm+do0UAPq+adpxw7vYJUqIXjf1cimPnmxRWHmNipD4/YAeyZGJ96xzSnTA3queBLN1C4JuG+KRr32yY59yqYJ9/xgGQB0U9t98kbNnZPHkL6luDsVUO0H8Y3V+VS7C2Vw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A10764DC61E08469E368825D440D29A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7572cab3-cb67-44bc-404b-08d721a33bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 17:08:46.1934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbRxlD12W8ze8N4IwT1P4TXRAK0wTFvQ78BTESYqOBhj8Otx2u8nt/BompEle26Sonm/k9ztA5DRWtU4jQ0pZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2798
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150165
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

VG8gd2hhdCBleHRlbnQgSXMgdGhpcyBhbiBhY3Rpb25hYmxlIOKAnHJ1bGluZ+KAnSB2cyDigJx0
aG91Z2h0cyBvbiB0aGUgbWF0dGVyLuKAnSANCg0KV2hpbGUgbGFyZ2UgdmVuZG9ycyBjYW4gZWFz
aWx5IGFzc2lnbiBzb21lb25lIHRvIGNyZWF0ZSB1dGlsaXRpZXMgbGlrZSB0aGVzZSwgd29u4oCZ
dCBsZXNzIHdlbGwgc3RhZmZlZCB2ZW5kb3JzIGJlIHNlcnZlZCBieSBoYXZpbmcgYSBjb2xsZWN0
aW9uIG9mIHV0aWxpdGllcyB0byBjaG9vc2UgZnJvbT8gSWYgbm90aGluZyBlbHNlLCBJIHdvdWxk
IHRoaW5rIGp1c3QgaGF2aW5nIHRoZSBleGFtcGxlcyBhdmFpbGFibGUgZm9yIHRoZWlyIGFkYXB0
YXRpb24gYWRkcyBzaWduaWZpY2FudCB2YWx1ZS4gU2hvdWxkIGV2ZXJ5b25lIG5lZWQgdG8gd3Jp
dGUgdGhlaXIgb3duIHV0aWxpdHkgdG8gc2VuZCBhIG1lc3NhZ2UgdG8gTUU/DQoNCklzbuKAmXQg
RnJ1RGV2aWNlIGEgd2VsbC1hZG9wdGVkIGludGVyZmFjZT8gSXBtYkJyaWRnZT8gDQoNCkkgc3Vw
cG9zZSBJ4oCZbSB1bmNsZWFyIG9uIHRoZSBwcm9qZWN0IGF1ZGllbmNlLCBzbyBwbGVhc2UgZ3Vp
ZGUgbWUuIEFyZSB3ZSBwcm92aWRpbmcgaG9iYnlpc3QgcGFydHMgdGhhdCBhIGJpbGxpb24tZG9s
bGFyIGVudGVycHJpc2Ugd2l0aCBwZXJzb24taG91cnMgdG8gYnVybiBjYW4gdXNlIHRvIGNyZWF0
ZSBhIHByb2R1Y3Rpb24gc3lzdGVtIG9yIGEgbmVhci1jb21wbGV0ZSBzb2x1dGlvbiB0aGF0IHJl
cXVpcmVzIGEgZmV3IGRheXMgb2Yg4oCccm91Z2hpbmcgaW7igJ0gYW5kIGN1c3RvbWl6YXRpb24g
YnkgYSB0aHJlZS1wZXJzb24gdGVhbSBpbiBFYXN0IENhbmJlcnJhPyBJcyBPcGVuQk1DIG1vcmUg
bWluaW1hbGlzdCDigJxBbHBpbmUgTGludXjigJ0gb3IgZnVsbHkgbG9hZGVkLCByZWFkeS10by1n
byDigJxVYnVudHXigJ0/DQoNCldoYXTigJlzIHRoZSBkaXZpZGluZyBsaW5lIGJldHdlZW4g4oCc
Q29yZSBPcGVuQk1D4oCdIGFuZCDigJxzdHVmZiB5b3UgbmVlZCB0byBmaW5kIG9yIGJ1aWxkIHlv
dXJzZWxm4oCdIHdoZXJlIHRoZSBPcGVuQk1DIGNvbW11bml0eSBpcyBhd2FyZSwgYnV0IGhhbmRz
LW9mZj8NCg0KUGFyZG9uIG1lIGlmIHRoZXJl4oCZcyBhIGRvY3VtZW50IHNvbWV3aGVyZSB0aGF0
IHN0YXRlcyB0aGlzLCBpbiB3aGljaCBjYXNlIGEgbGluayB3b3VsZCBiZSBhcHByZWNpYXRlZC4N
Cg0KSXMgdGhlIHNhZmVzdCBiZXQgZm9yIHRoZSBtb21lbnQgdG8gZm9sbG93IHlvdXIgbWluaS1k
ZXNpZ24gZG9jIHBhdGggYW5kIGhvc3QgaW4gRmFjZWJvb2vigJlzIHB1YmxpYyBHaXRodWIgYXMg
ZGVzY3JpYmVkIGluIHlvdXIgbGFzdCBwYXJhZ3JhcGg/DQoNCkFnYWluLCBwYXJkb24gbXkgaWdu
b3JhbmNlIGFzIGEgbGF0ZWNvbWVyIGhlcmUuDQoNCldpbGZyZWQNCg0KPiBPbiBBdWcgMTUsIDIw
MTksIGF0IDU6NTUgQU0sIEFuZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDc6NTggUE0gV2lsZnJlZCBTbWl0
aCA8d2lsZnJlZHNtaXRoQGZiLmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gMS4gQXJlIHRoZXJl
IGd1aWRlbGluZXMvcHJvY2VkdXJlcyBzcGVjaWZpYyB0byBzdWJtaXR0aW5nIGNvbW1hbmQgbGlu
ZSB0b29scyBhbmQgdXRpbGl0aWVzPyBJIGhhdmUgaGVhcmQgdGhhdCB0aGVyZSBtYXkgYmUgYSBy
ZXBvc2l0b3J5IGFuZC9vciBwYXRoIGRlZGljYXRlZCB0byBDTEkgdG9vbHMuDQo+IA0KPiBUaGUg
Y29tbXVuaXR5IGhhcyBkZWZpbml0ZWx5IHRlbmRlZCB0byBsaW1pdCB3cmFwcGVyIHRvb2xzIHdp
dGhpbg0KPiBPcGVuQk1DLiBXZSBoYWQgYSBkaXNjdXNzaW9uIGEgd2hpbGUgYmFjayB0aGF0IHdl
J3JlIG9wZW4gdG8gc29tZSBidXQNCj4gdGhlIEFQSSdzIHRvIHRoZW0gcmVhbGx5IG5lZWQgdG8g
YmUgdGhvdWdodCBvdXQgYW5kIHJldmlld2VkIGJlY2F1c2UNCj4gY29tbWFuZCBsaW5lIHRvb2xz
IGJlY29tZSBjdXN0b21lciBBUEkncyAoaS5lLiBwZW9wbGUgc3RhcnQgd3JpdGluZw0KPiBzY3Jp
cHRzIG9uIHRvcCBvZiB0aGVzZSB0b29scyB0aGF0IHRoZW4gYmVjb21lIGtleSB0byB0aGUNCj4g
bWFudWZhY3R1cmluZyBwcm9jZXNzIG9yIHNvbWUgb3RoZXIgY3JpdGljYWwgYXJlYSkuDQo+IA0K
PiBBbnl0aGluZyB0aGF0IGdvZXMgaW50byBPcGVuQk1DIG5lZWRzIHRvIHN1cHBvcnQgT3BlbkJN
QyBpbnRlcmZhY2VzLg0KPiBGb3IgZXhhbXBsZSwgSSdtIG5vdCBmYW1pbGlhciB3aXRoIGZydWlk
LXV0aWwncyBELWJ1cyBzZXJ2aWNlDQo+IHh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2aWNlLiBB
ICJidXNjdGwgdHJlZQ0KPiB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5NYW5hZ2VyIHwg
Y2F0IiBzaG93cyB0aGUgaW52ZW50b3J5IGl0ZW1zDQo+IG9uIE9wZW5CTUMuDQo+IA0KPiBPbmUg
aXNzdWUgd2UgaGF2ZSB3aXRoaW4gT3BlbkJNQyBpcyB0aGVyZSBtYXkgYmUgZGlmZmVyZW50DQo+
IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgRC1idXMgQVBJJ3MgZm9yIGEgZ2l2ZW4gYXJlYS4gRm9y
IGV4YW1wbGUsDQo+IEludmVudG9yeSBoYXMgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBzbyBJ
J20gbm90IHN1cmUgd2hpY2ggcmVwbw0KPiB3b3VsZCBiZXN0IGZpdCB5b3VyIHRvb2wuIFRoYXQg
dHlwZSBvZiBpc3N1ZSBsZWFkcyBtZSB0byB3b25kZXIgaWYgd2UNCj4gc2hvdWxkIHB1dCB0aGUg
dG9vbHMgd2l0aCB0aGUgaW50ZXJmYWNlIGRlZmluaXRpb25zIGluDQo+IG9wZW5ibWMvcGhvc3Bo
b3ItZGJ1cy1pbnRlcmZhY2VzPyBPciBtYXliZSBhIHNlcGFyYXRlIHBob3NwaG9yLXRvb2xzDQo+
IHJlcG8gd291bGQgYmUgbW9yZSBsb2dpY2FsIGZvciB0aGVzZS4NCj4gDQo+IEVpdGhlciB3YXks
IEkgdGhpbmsgY29tbWFuZCBsaW5lIHRvb2xzIHNob3VsZCBlYWNoIGdldCB0aGVpciBvd24NCj4g
bWluaS1kZXNpZ24gZG9jDQo+IChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2Iv
bWFzdGVyL2Rlc2lnbnMvZGVzaWduLXRlbXBsYXRlLm1kKQ0KPiB3aXRoIHJlcXVpcmVtZW50cyBh
bmQgaW50ZXJmYWNlcyBjbGVhcmx5IGRlZmluZWQgZm9yIHJldmlldyBieSB0aGUNCj4gY29tbXVu
aXR5LiBJZiB3ZSBjYW4gZmluZCBhIGdlbmVyaWMgdG9vbCB0aGF0IG11bHRpcGxlIHBlb3BsZSBm
aW5kDQo+IHVzZWZ1bCwgd2UgY2FuIHRoZW4gZmluZCBhIHBsYWNlIHRvIHB1dCBpdC4gT3RoZXJ3
aXNlLCB5b3UgY291bGQgaG9zdA0KPiB5b3VyIHRvb2xzIG91dHNpZGUgb2Ygb3BlbmJtYy8gZ2l0
aHViIGFuZCBqdXN0IHB1bGwgdGhlbSBpbnRvIHJlY2lwZXMNCj4gZnJvbSB3aXRoaW4geW91ciBt
ZXRhLWZhY2Vib29rIGxheWVyLg0KPiANCj4+IFRoYW5rcyBpbiBhZHZhbmNlLA0KPj4gDQo+PiBX
aWxmcmVkDQoNCg==
