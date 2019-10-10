Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50398D345C
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 01:26:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q6g00gGVzDqRr
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 10:26:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5186784b43=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Wo1hxnCp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="S2OxQGVQ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q6fG3HgPzDqGt;
 Fri, 11 Oct 2019 10:26:12 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9ANNROd005073; Thu, 10 Oct 2019 16:24:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=TRIewUvync1SJoAo8UC7iBP5UbiXhdBQ/e+GciTXOqU=;
 b=Wo1hxnCpc5OZjWLZeWYgmoHS4Gz3/MbcWKqz6QhL5VMEXkaGMrnFPt/97KVSZwLDzEzd
 Gf+jg3HO9au5f7CzOhPYkm2dKKviUApy9ajZ3jD+MYwWoQDudjK1QoqaBGyZrzKGZyU8
 J+RKONbvcIYJMwZXG2PKt/SlFNOi2uGbGQI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vjdvfr36e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Oct 2019 16:24:48 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Oct 2019 16:24:47 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Oct 2019 16:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1KqRsfDnUqujFbySiMYCnYR7eGPHHKv6arYloN4ebP7Xt0NIPuYJn/M8nlKBGd9q2ZfjYhjpNoDYXbpm6adAKDENNawxnCCXsJgT2lgVOIAb2E/kod6iA0lnpGpStnYjZ7sxl36nHYW4rUbelSh164c/AEkM/LfuTu83/X6rxEAtkeAb1a9LgEgixpvGN/VelGsKR1GuTY/Pq7ycNU07Yc6i2/ZLTv4Ei7SV0DrVh7gokdJiMMWXH582EPi3i1Lu3orDits9jN+dmwaeT6ghzWiyV5JSNQQOBYQXjArqW3N/WFOdyJj3lv7dsWgh3byPYbAT3WNE38L0AJ80JOElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRIewUvync1SJoAo8UC7iBP5UbiXhdBQ/e+GciTXOqU=;
 b=EFyaJdzPXxYC0va2rzrFyjYvUrv7EYHMMW+cyTDTrdGypH0+rokX7yBC2qyITPYTRF7DeZN/ojCOePoUPNUBAQYBH1rq2BVRpFXEGgqvg/4qEpKyrEFVhxCQXRT3j16qnRt3swp8XkyfS1O7XMec7y6qmOQzecQtKhu2ciMkJkaINtaXLdh3n6QT0f8nBjrScJORqmPfLs8+4it/kKIRRJ/+YD/o21XsHGK11ecjh4lIZdBml2laoWum8V+/hYbWv0HiyCej/E9jqPtfUpW4TrzYiYcx+R60s5lnzsNygeVMSazptOWTUmWx4f3/W9SbBhUlECP+TP2G6FLroPLq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRIewUvync1SJoAo8UC7iBP5UbiXhdBQ/e+GciTXOqU=;
 b=S2OxQGVQACvl+8oJnEenv4IPJpstHlERzDo0ez8+yAqyMsBccpQMbvxvAmemgJ0eEX+9wTtmR+sJQ1lkmDn8Fkk4ErUsR1Y0lzNTAV3TlRHpsrHjpEymcXkRPBofLtHt3vJZjBsqGAV8XKvF4mKjhg1xFNtOKJJg4g5BA197gYo=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1534.namprd15.prod.outlook.com (10.173.235.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 10 Oct 2019 23:24:46 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 23:24:46 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Andrew Jeffery" <andrew@aj.id.au>, Cedric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfud35WuTlVbA0UqacW6NAtrttKdT7goAgACBZACAABLhAIAAAVGAgAACWgA=
Date: Thu, 10 Oct 2019 23:24:45 +0000
Message-ID: <dd0c44f7-4e90-998b-e8c7-d272c593f55c@fb.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
 <637d4b8b-5113-b07b-f99f-ce66dbe6948c@linux.intel.com>
 <5ce20a28-21ed-ff0c-9e31-bcac3cd7a5fb@fb.com>
 <69296b93-8fc6-c056-ab9b-ae190dc5eea1@linux.intel.com>
In-Reply-To: <69296b93-8fc6-c056-ab9b-ae190dc5eea1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:a83d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fb5d886-606d-451f-e58b-08d74dd90974
x-ms-traffictypediagnostic: MWHPR15MB1534:
x-microsoft-antispam-prvs: <MWHPR15MB1534A0800E7FF1544FC1B16CB2940@MWHPR15MB1534.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(51914003)(76176011)(6486002)(4326008)(486006)(446003)(476003)(6512007)(31696002)(5660300002)(52116002)(86362001)(229853002)(6436002)(11346002)(102836004)(2616005)(8936002)(53546011)(6506007)(386003)(65956001)(65806001)(46003)(36756003)(99286004)(31686004)(14454004)(81166006)(81156014)(14444005)(256004)(54906003)(6116002)(8676002)(7736002)(71200400001)(71190400001)(305945005)(58126008)(478600001)(25786009)(66946007)(186003)(66556008)(66476007)(66446008)(64756008)(6246003)(7416002)(2906002)(110136005)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1534;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4mP1VI0CxjZevp3lm/1/3ZqJIMvBxK3D3ynF6lna3mIz+69iJTw6PkFe/QHVv+ffrEmNC6H91WUdsFNK7x/Qg//0JTTGpmqpxgell0GdA4X/ib2dnAIUuivhwt/z+mgnrOeYS0JELuo6zUSzMtgsgbx+Q2tbBNJRJARlywatddlU0wEWXLG4hQJBiNHfYO/YiLXKrQyZ4mSR3Uz3eCYKFSIUeMygZW3a5GDBgVGUqXz3W2zFcsuhL+TJYuqvAoijPt+tEQUpUOUhn9lpT/AyGJ51JOsUTlw5xxVlLyTDoxKDcpszRy2jPLKBLjtrpKtCuPrvb34x8xnKsBxA8+tp8IZYyuW5lxmE5QGTcyOXw2yuvP3Tt8ptcBRDvj/80QtNJZsy4Jl3NwD+ekzSCH2JhFI3+nzb4AIFCvHREwewfU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C6FCE86516E3D44B1BF2CA410337367@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb5d886-606d-451f-e58b-08d74dd90974
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 23:24:46.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUlue1ppCDfC2U0APuiE2meFFuvwCrZwvSilq0zPguDWOL12OpamATRHSZ0g6LLs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1534
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_09:2019-10-10,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100204
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvMTAvMTkgNDoxNiBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBPbiAxMC8xMC8yMDE5
IDQ6MTEgUE0sIFRhbyBSZW4gd3JvdGU6DQo+PiBPbiAxMC8xMC8xOSAzOjA0IFBNLCBKYWUgSHl1
biBZb28gd3JvdGU6DQo+Pj4gT24gMTAvMTAvMjAxOSAyOjIwIFBNLCBUYW8gUmVuIHdyb3RlOg0K
Pj4+PiBPbiAxMC85LzE5IDI6MjAgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToNCj4+PiBbLi4uXQ0K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBJZiBhIHBlZXIgbWFzdGVyIHN0YXJ0cyBhIHhmZXIgaW1tZWRpYXRlbHkgYWZ0ZXIgaXQg
cXVldWVzIGENCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgICogbWFzdGVyIGNvbW1hbmQsIGNoYW5n
ZSBpdHMgc3RhdGUgdG8gJ3BlbmRpbmcnIHRoZW4gSC9XIHdpbGwNCj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgICogY29udGludWUgdGhlIHF1ZXVlZCBtYXN0ZXIgeGZlciBqdXN0IGFmdGVyIGNvbXBs
ZXRpbmcgdGhlDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIHNsYXZlIG1vZGUgc2Vzc2lvbi4N
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWFzdGVyIGNvbW1hbmQsIGNsZWFyIHRoZSBxdWV1
ZWQgbWFzdGVyIGNvbW1hbmQgYW5kIGNoYW5nZQ0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBp
dHMgc3RhdGUgdG8gJ3BlbmRpbmcnLiBUbyBzaW1wbGlmeSBoYW5kbGluZyBvZiBwZW5kaW5nDQo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGNhc2VzLCBpdCB1c2VzIFMvVyBzb2x1dGlvbiBpbnN0
ZWFkIG9mIEgvVyBjb21tYW5kIHF1ZXVlDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGhhbmRs
aW5nLg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHVubGlrZWx5KGlycV9zdGF0dXMgJiBBU1BFRURfSTJDRF9JTlRSX1NMQVZF
X01BVENIKSkgew0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKHJlYWRsKGJ1
cy0+YmFzZSArIEFTUEVFRF9JMkNfQ01EX1JFRykgJg0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB+QVNQRUVEX0kyQ0RfTUFTVEVSX0NNRFNfTUFTSywNCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19D
TURfUkVHKTsNCj4+Pj4NCj4+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIGNvbW1lbnRzIChqdXN0IG5v
dGljZWQgdGhpcyBsaW5lIHdoaWxlIHRlc3RpbmcgdGhlIHBhdGNoKToNCj4+Pj4NCj4+Pj4gSSBh
c3N1bWUgdGhpcyBsaW5lIGlzIGFpbWVkIGF0IHN0b3BwaW5nIHRoZSBydW5uaW5nIG1hc3RlciBj
b21tYW5kcywgYnV0IGFzIHBlcg0KPj4+PiBBU1QyNTAwIGRhdGFzaGVldCwgaXQncyBOT1AgdG8g
d3JpdGUgMCB0byBNQVNURVJfU1RPUC9NQVNURVJfUlgvTUFTVEVSX1RYIGJpdHMuDQo+Pj4+IE1h
eWJlIGFsbCB3ZSBuZWVkIGlzIHdyaXRpbmcgMSB0byBNQVNURVJfU1RPUCBmaWVsZD8NCj4+Pg0K
Pj4+IFRoZXJlIGNvdWxkIGJlIHR3byBwZW5kaW5nIGNhc2VzOg0KPj4+IDEuIE1hc3RlciBnb2Vz
IHRvIHBlbmRpbmcgYmVmb3JlIGl0IHRyaWdnZXJzIGEgY29tbWFuZCBpZiBhIHNsYXZlDQo+Pj4g
wqDCoMKgIG9wZXJhdGlvbiBpcyBhbHJlYWR5IGluaXRpYXRlZC4NCj4+PiAyLiBNYXN0ZXIgZ29l
cyB0byBwZW5kaW5nIGFmdGVyIGl0IHRyaWdnZXJlZCBhIGNvbW1hbmQgaWYgYSBwZWVyDQo+Pj4g
wqDCoMKgIG1hc3RlciBpbW1lZGlhdGVseSBzZW5kcyBzb21ldGhpbmcganVzdCBhZnRlciB0aGUg
bWFzdGVyIGNvbW1hbmQNCj4+PiDCoMKgwqAgdHJpZ2dlcmluZy4NCj4+Pg0KPj4+IEFib3ZlIGNv
ZGUgaXMgZm9yIHRoZSBsYXR0ZXIgY2FzZS4gSC9XIGhhbmRsZXMgdGhlIGNhc2UgcHJpb3JpdHkg
YmFzZWQNCj4+PiBzbyB0aGUgc2xhdmUgZXZlbnQgd2lsbCBiZSBoYW5kbGVkIGZpcnN0LCBhbmQg
dGhlbiB0aGUgbWFzdGVyIGNvbW1hbmQNCj4+PiB3aWxsIGJlIGhhbmRsZWQgd2hlbiB0aGUgc2xh
dmUgb3BlcmF0aW9uIGlzIGNvbXBsZXRlZC4gUHJvYmxlbSBpcywNCj4+PiB0aGlzIEgvVyBzaGFy
ZXMgdGhlIHNhbWUgYnVmZmVyIGZvciBtYXN0ZXIgYW5kIHNsYXZlIG9wZXJhdGlvbnMgc28NCj4+
PiBpdCdzIHVucmVsaWFibGUuIEFib3ZlIGNvZGUganVzdCByZW1vdmVzIHRoZSBtYXN0ZXIgY29t
bWFuZCBmcm9tIHRoZQ0KPj4+IGNvbW1hbmQgcmVnaXN0ZXIgdG8gcHJldmVudCB0aGlzIEgvVyBj
b21tYW5kIGhhbmRsaW5nIG9mIHBlbmRpbmcgZXZlbnRzLg0KPj4+IEluc3RlYWQsIGl0IHJlc3Rh
cnRzIHRoZSBtYXN0ZXIgY29tbWFuZCB1c2luZyBhIGNhbGwgb2YgYXNwZWVkX2kyY19kb19zdGFy
dCB3aGVuIHRoZSBzbGF2ZSBvcGVyYXRpb24gaXMgY29tcGxldGVkLg0KPj4NCj4+IFRoYW5rcyBm
b3IgdGhlIGNsYXJpZnksIEphZS4gSSBtZWFuIGNsZWFyaW5nIHRoZXNlIGJpdHMgaGFzIG5vIGVm
ZmVjdCB0bw0KPj4gaGFyZHdhcmUgYWNjb3JkaW5nIHRvIGFzcGVlZCBkYXRhc2hlZXQ7IGluIG90
aGVyIHdvcmQsIG1hc3RlciBjb21tYW5kIGNhbm5vdA0KPj4gYmUgcmVtb3ZlZCBmcm9tIGNvbW1h
bmQgcmVnaXN0ZXIgYnkgdGhpcyBzdGF0ZW1lbnQuDQo+Pg0KPj4gRm9yIGV4YW1wbGUsIGJlbG93
IGlzIHRoZSBkZXNjcmlwdGlvbiBmb3IgTUFTVEVSX1NUT1BfQ01EKEkyQ0QxNCwgYml0IDUpOg0K
Pj4NCj4+IMKgwqAgMDogTk9QDQo+PiDCoMKgIDE6IElzc3VlIE1hc3RlciBTdG9wIENvbW1hbmQN
Cj4+IMKgwqAgVGhpcyByZWdpc3RlciB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgY2xlYXJlZCBieSBI
L1cgd2hlbiBTdG9wIENvbW1hbmQgaGFzDQo+PiDCoMKgIGJlZW4gaXNzdWVzLg0KPiANCj4gSXQn
cyByZW1vdmluZyBiZWZvcmUgSC9XIGZldGNoZXMgdGhlIHRoZSBjb21tYW5kIHNvIHRoZSBwZW5k
aW5nIGNvbW1hbmQNCj4gaXNuJ3QgY2xlYXJlZCBieSBIL1cgYXQgdGhlIHRpbWluZy4gSWYgd2Ug
c2VuZCBhIHN0b3AgY29tbWFuZCBhdCBoZXJlLCB0aGUgYnVzIHdpbGwgYmUgbWVzc2VkIHVwLg0K
DQpJIHNlZS4gSSBkaWRuJ3Qga25vdyB3ZSBjb3VsZCBjbGVhciB0aGUgYml0cyBiZWZvcmUgaGFy
ZHdhcmUgZmV0Y2hlcyB0aGVtLg0KDQoNCkNoZWVycywNCg0KVGFvDQo=
