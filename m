Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C4B6F68
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 00:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YZmP0DHmzF3fJ
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 08:44:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4164fb3d32=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="TaifzJ4W"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fTG0gs+E"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZlg16jpzF1jP
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:43:58 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8IMdE0Q000745; Wed, 18 Sep 2019 15:43:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Q7ftdccp1i2bQd97vgBjj2ItCSzjh4RLedB881OuWxg=;
 b=TaifzJ4WZgCqUFNqgKK2+PLO+ySCLahHLMGXiHeEF2ImOrvzOsNa0+HDdGuO9Mt3hV/y
 quHOVIn2HsvXHgUKyv2wXRcdj+lYePB9/scvsayUPGtWuhLqCj1412OYDGkQFw7BIi1Y
 iC23NmxBOlHW14zB8TXTBa0yi8U47pT56Uk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v3vdq0arp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 18 Sep 2019 15:43:54 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 15:43:54 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Sep 2019 15:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3hkQgu7XSoQjELaQLKpy8U9VKv0djT/mpIlUGcpYnLdY2F0HTusow9ZN5lnm8dXsEIavIiFOAhsXOBF3Da63yGeWOwNDDlZnX3yxfHB0vf/i4Yl2rqSaN+qhvrsKXr9SQhNB+sEXDXx40dKpiC0m+v0+DdeF2gjf/UsWbAlJlT80JCC9hve5vrBzfTVJ3JeJ57V5aTZHhmYhtlA3eBrMcbFT8TLD5HpNRXiSwgpyuiFo6vofz5X3ODLmoBd+PFiJpd0m3T8vEFl4TKZVRjzzEL3Y/S7YCAc3+ryz/yW9M94ZwNea/Mlf8J5P1Xfhe9nDDgxdioQU0TQkgTN0dHyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ftdccp1i2bQd97vgBjj2ItCSzjh4RLedB881OuWxg=;
 b=OitRbxAePwY6TU61499DamTReTOAPSdpZMzTyhnfg40tENgJgr+aaSvSxLGoBd/qH7VJIEfs/6z9PmC8NWRkG1DuO1o8ha/Fy4Lu9UJ16xIWysJHg67SPnKFzbpigHEeLuIUYhR/VItDrjf8qVETZC1kZB/14Tj8z+Q4ENFp29E2Cf8FSdy9EgAV3Le+qFlT6Slp90OMoVgoR4Im4DUD0d6deUBKLdwvcfWtqU8ladqMOOsfbAwxYf/wiNo/PS/NzOZ6nLto/1omHqxGis37BLIRQOsy8QSJqJZ2g+CaiVJqJx7hWgcEGcP5oml9h1w2RwvOjNZX4H4sGPlA6CLOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ftdccp1i2bQd97vgBjj2ItCSzjh4RLedB881OuWxg=;
 b=fTG0gs+EbzBZIbWoMJlJPQg+4Q7VNs1S0vlYLywwSzmGyv66T8G2VUUAzTCjJduNS9TEzKHGRn7sJBg8rBoCAoxjkxWwjptP8jhY/TNLdmn7HBZmj98p4GhHBBA6yp2OS7ACMoUla7elZj/3aV3pDhWLPx55UkiPhAsyaCXjoWA=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1678.namprd15.prod.outlook.com (10.175.137.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 22:43:53 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 22:43:52 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: src-uri-bad in flashd and chassisd recipes
Thread-Topic: src-uri-bad in flashd and chassisd recipes
Thread-Index: AQHVbmtCgiUCOu2MpU6hpLxoTQfgy6cyAOOAgAAHXQA=
Date: Wed, 18 Sep 2019 22:43:52 +0000
Message-ID: <BE45DB48-278B-4D7A-AEA4-4D227484788A@fb.com>
References: <1558DF2D-BC3C-489C-AC4A-9DF7F8332E01@fb.com>
 <277CCA1F-5D7F-4CC1-B7D3-4D7CAAA9593F@fuzziesquirrel.com>
In-Reply-To: <277CCA1F-5D7F-4CC1-B7D3-4D7CAAA9593F@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:9834]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a13df1-38b9-4a2a-11a9-08d73c89ae5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1678; 
x-ms-traffictypediagnostic: MWHPR15MB1678:
x-microsoft-antispam-prvs: <MWHPR15MB1678002F8DF7F725F4E8DC1ABD8E0@MWHPR15MB1678.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(136003)(396003)(346002)(366004)(199004)(189003)(55674003)(71200400001)(4326008)(6246003)(5660300002)(64756008)(66556008)(446003)(66946007)(66476007)(25786009)(53546011)(6486002)(6436002)(102836004)(46003)(33656002)(99286004)(76176011)(229853002)(186003)(66446008)(2906002)(6512007)(6506007)(6116002)(316002)(6916009)(8676002)(7736002)(71190400001)(8936002)(81166006)(81156014)(86362001)(476003)(11346002)(76116006)(256004)(14454004)(486006)(36756003)(478600001)(305945005)(14444005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1678;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GmlyaVyyTfAjMCrol2LIIp7TtwyH/cOV9I75OPdiYTpCoA2flCZE/SCIvCIDVPCur2gsWDglhRaSHK81/fVhlhhqCohwB3/gyy0hFJs4vCgf1uGaxpqreLoNbSx/UMzpx9N3pPlWYjZzi9zMQQe9xgDf16XCwx4wXCmH/NskG/fISHj2AVbLAnhepa98Xl0z/8Mi1osDE7v8W28b5GGk3MUv8aaLwWPPMkYUbhTxha+Q2cdUxwgSWSHuwWbek/2zbAdn4+9E3isJgJP7DwAuUhjlaIOa1UragifUPrrjka/3X2f1yr5kEmI6LdJMJBqwuNK+Qvwkwzhd9GSlaz3ccRW8HHeRiXG77caa19XQM0M+szq6YPpj4cDQ4CYZpIlr2wfiYSe7GP0fW18WYV/mqRAbg+yGGfbVLINdxgivUCo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1969FCEC54C9BE4D91E81D5ED9F8FDD6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a13df1-38b9-4a2a-11a9-08d73c89ae5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:43:52.8179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+yR5gUYILmRXcliYycAZHOLmL30NZSNXz4Wa6kciBOH9fCzGKrKSenRHh8ZmmOmV4FVcZqdgKJWnQMSkoStqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1678
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_10:2019-09-18,2019-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=800 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180190
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

QnJhZCwNCg0KSeKAmXZlIHNlZW4gYSBmZXcgb3RoZXJzIGxpa2UgdGhpcyBidXQgaGF2ZSBpZ25v
cmVkIHRoZW0uIA0KDQpJIGNhbiBtYWtlIHRoZSBjaGFuZ2VzIGFuZCBjb25maXJtIGEgYnVpbGQg
YW5kIG5vdGhpbmcgcGVjdWxpYXIgb24gbXkgVGlvZ2EgUGFzcywgYnV0IEkgaGF2ZW7igJl0IHBs
dW1iZWQgdGhlIGJvd2VscyBvZiB0aGVzZSBjb21wb25lbnRzOyBhbGwgSSBjYW4gZG8gaXMgY3Vy
ZSB0aGUgd2FybmluZyBhbmQgbWFrZSBCaXRiYWtlIGhhcHB5LiBJdCB3b3VsZCBiZSBnb29kIGZv
ciB0aGVpciBhdXRob3JzL21haW50YWluZXJzIHRvIGNoZWNrIHRoYXQgSSBoYXZlbuKAmXQgZG9u
ZSBhbnl0aGluZyBzdHVwaWQgZHVyaW5nIHRoZSBjb2RlIHJldmlldy4NCg0KV2lsZnJlZA0KDQo+
IE9uIFNlcCAxOCwgMjAxOSwgYXQgMzoxNyBQTSwgQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enpp
ZXNxdWlycmVsLmNvbT4gd3JvdGU6DQo+IA0KPiBhdCA1OjUxIFBNLCBXaWxmcmVkIFNtaXRoIDx3
aWxmcmVkc21pdGhAZmIuY29tPiB3cm90ZToNCj4gDQo+PiBJ4oCZbSBiZWVuIHNlZWluZyB0aGVz
ZSB3YXJuaW5ncyBhZnRlciBhIOKAnGdpdCBwdWxs4oCdLiBBcmUgdGhlc2Ugd2FybmluZ3MgZXhw
ZWN0ZWQ/IElzIGl0IG9rYXkgdG8gYXR0ZW1wdCB0byBjdXJlIHRoZW0gb3IgYXJlIHRoZXkgc2lt
cGx5IHRyYW5zaWVudCB3YXJuaW5ncz8NCj4gVGhleSBhcmUgZGVmaW5pdGVseSBub3QgdHJhbnNp
ZW50Lg0KPiANCj4+IA0KPj4gV2lsZnJlZA0KPj4gDQo+PiBXQVJOSU5HOiBvYm1jLXBob3NwaG9y
LWZsYXNoZC0xLjAtcjEgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IG9ibWMtcGhvc3Bob3ItZmxh
c2hkOiBTUkNfVVJJIHVzZXMgUE4gbm90IEJQTiBbc3JjLXVyaS1iYWRdDQo+PiBXQVJOSU5HOiBv
Ym1jLXBob3NwaG9yLWNoYXNzaXNkLTEuMC1yMSBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogb2Jt
Yy1waG9zcGhvci1jaGFzc2lzZDogU1JDX1VSSSB1c2VzIFBOIG5vdCBCUE4gW3NyYy11cmktYmFk
XQ0KPiANCj4gRldJVyB0aGVzZSB0d28gcmVjaXBlcyBzcGVjaWZpY2FsbHkgYXJlIHNvbWUgcHJl
dHR5IG9sZCBzYW1wbGUgcmVjaXBlc+KApml0IHdvdWxkIGJlIGdyZWF0IHRvIHNvbWVkYXkgZ2V0
IHJpZCBvZiB0aGVzZSBlbnRpcmVseS4gIEJ1dCBpbiB0aGUgbWVhbnRpbWUsIEkgd291bGQgbG92
ZSBhIHBhdGNoIHRoYXQgY2hhbmdlcyBQTiB0byBCUE4gZm9yIHRoZXNlIG9yIGFueXdoZXJlIGVs
c2UgeW91IHNlZSBhIHdhcm5pbmcgbGlrZSB0aGlzLg0KPiANCj4gLWJyYWQNCg0K
