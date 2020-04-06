Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA41A0007
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 23:16:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x3HL3WYRzDqyw
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 07:15:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=13651fff6e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=mMsxhS9N; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PkVWKDcD; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x3GR0nZtzDqxL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 07:15:00 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036JdgHq003600; Mon, 6 Apr 2020 12:41:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=sZYYB7i27FaxM8GjDrVB3QFVOIB/5uLCoI1gFbktD2I=;
 b=mMsxhS9Ns7qsShm2Yjqcm9rXP5/CVoPM/ZRp2r5QdgeKmAn+N0IPwPdS1NsyV6ytO5JV
 LmRoWmjCOc3l83u+uUobBMoifdNbT/YUPJc9w9U9xR8rJva1YyWudRVWgnN6YeF03zwy
 jP+GAifT6GdLYroPZmdhv9wXv1AVc8zCHfo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3089k2gdxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Apr 2020 12:41:30 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 6 Apr 2020 12:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IldWGOzySgjtixV/pl3N2hCJS4hQJQnE8YzdX/FYloqtUSbYgPeYR+S3g1DbIafoigqGJ0VlAeXfXFKlTmdgeNrV2WpA/o+K7QZY+413D4rGRR82zwtJjtS3vTNHu060Bm3F+S3trApuZIAH/8oT01nWeKjlfg9QS7YLFLm6yI8LRMD0cBCcB/Zh0ekLTD8MUWudd6rkNpaRuBWH0gWe4VgeG7zPpQlgvejmr1mSUWCg11B1Ft8J5mTTW5sQEDEsSqkb9n5lfvFzeC4KwYZ+XsEOEQfwkDUPwQ8rX2IYuJuuL6YxeGeYaInZtbETvWMbVvamsiJYV7FHESR17gpp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZYYB7i27FaxM8GjDrVB3QFVOIB/5uLCoI1gFbktD2I=;
 b=EiHT5VZXPNbGduxxH/+EPpPHeRt3OZFdNffKJfFtF7mnJRoBST/fm1G+JAo2Tc76vqAB9FbWTQIxCWsXwRosYQ3zIYQq1LQidh1wEqQYAtSCKysXvkkvLKl3Tp27qfgK1+nol80iTn6X2D4q68tyoJRE7QnaETzZtQtT8jqmqezZ5vCoNVAgkSDWuNE7WhVkIWaPOU9cGLN8/1z6yTbakbm3aacMhc64aY+SeWrV6qQAo7CObI6FrIK1gCLDtBykSwt1PGore5BFze5emAOX6lE2+35PvpT5p7oSE/hFfxN4ChkvCrX+/MalvtLC1HSBvsvDiVKfW1Z6VG4JqLxycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZYYB7i27FaxM8GjDrVB3QFVOIB/5uLCoI1gFbktD2I=;
 b=PkVWKDcDmGkSUPJfzwqshTEcDWQw/UVn/ux5jrP3mX1AcCdL0cGMarIrFocvzmVlbnLwK0BTlfgXvugOk0U8iwATh+d9r2BJoGgR+LthW9NAs9+7Wv3UdgaO0KDRuFVQrSR8GjImW/gtFj91xIrUWRZN+9e9I+T9pV89vAAMpNM=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3996.namprd15.prod.outlook.com (2603:10b6:303:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Mon, 6 Apr
 2020 19:41:29 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2878.021; Mon, 6 Apr 2020
 19:41:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: objc console new design
Thread-Topic: objc console new design
Thread-Index: AQHWCgBPwdBJh2WrEU2ViFQA6gD9zqhqcoWAgAGa3AA=
Date: Mon, 6 Apr 2020 19:41:28 +0000
Message-ID: <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
 <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
In-Reply-To: <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:ab2a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7894e45-1780-447a-d5eb-08d7da62804c
x-ms-traffictypediagnostic: MW3PR15MB3996:
x-microsoft-antispam-prvs: <MW3PR15MB3996C92011612BD8E6AD9950DDC20@MW3PR15MB3996.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0365C0E14B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(39860400002)(346002)(136003)(396003)(376002)(6506007)(8936002)(66556008)(64756008)(81166006)(33656002)(71200400001)(2616005)(86362001)(66446008)(66476007)(5660300002)(8676002)(6486002)(81156014)(3480700007)(6512007)(4326008)(66946007)(966005)(6916009)(76116006)(316002)(186003)(2906002)(36756003)(478600001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6AGT+AT5qNZCgD6iyEAZFRbxCTLBAvYyPSiPA9wBGMZBqww7btnm99NowWkBDavpmiS7gT51p3PIWgkI5JbWT+D26zL+etZH04a1ORY0/peIspI1yDyDuiz+7DoXDxo596h+QXQMAeKVVWwT4cXtlpksFrEc581S/1kk2WS3ajnT5jbg33zIHiD8LTrr73PQuyUIhlykAQRCmhgQs4XVIDL8WiMuouIsBYFXHryVwYiTdc4uI9GMpABMBg0ti5d0hvwl/3gTQHTVtrx0tdnjSRkSvjyQ/YRx5RPyGV/5wuLBT/tDX1jViiYB1GIpFMXt3o1QQfVPHxnFb6Br8oTRgmADDBeO6bavgT3j78BJycZWEcFu+N/W3pI7mZrrgj+PZ4rwJmuyiFWfCghT50INwN6oltA/voNNkUOcL8RxxXVpIom12MxLJR/wBF41rAI3SRBB+dln0Sng+h6DxvRE/vucxzeU7U32H+k9+EaI5elV0w8JJjkpABIcUDCrSLLaq9IKWpeRnNjbaOEmIMDvGw==
x-ms-exchange-antispam-messagedata: /PVda6wiFmjdJrFDfJswDLWVkw0M5f/TlWHkqg0YckLPT9krD6ypMdb+D+pn+pxcS2N9aL9IEyodxtxlmtqXFv1eenHdwPODHvjtrtbTwcDQ8KPc5Gq0VVGPxpGJrKtBbe+G+eL9mb3QsG5h+OUZCdBKQfm+dtHtHVnIMegdnZDq0/QzxcewXQpzv9B6uCuS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C88EB745D73A14EA4C2D3EED17292AB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d7894e45-1780-447a-d5eb-08d7da62804c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2020 19:41:28.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iq7ES3G3+DJJYvTTkQ7TdgT1yLA2oAIvnNSQ9RSRTL5qnmdwiQNSseYANYokYCaf/gYJGN5COefUf1cRSeTHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3996
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_10:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060153
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

DQoNCu+7v09uIDQvNS8yMCwgNToxMCBBTSwgIkFuZHJldyBKZWZmZXJ5IiA8YW5kcmV3QGFqLmlk
LmF1PiB3cm90ZToNCg0KICAgIA0KICAgIA0KICAgIE9uIFNhdCwgNCBBcHIgMjAyMCwgYXQgMDg6
MDksIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+ICANCiAgICA+IEhpIEFuZHJldywNCiAgICA+
IA0KICAgID4gSG93IGlzIHNlcnZlciBsYXVuY2hlZCBhcyBwZXIgbmV3IGRlc2lnbiBjb2RlLiBX
aXRoIGxhdGVzdCB1cGRhdGUsIA0KICAgID4gY29uc29sZSBzZXJ2ZXIgaXMgbm90IGxhdW5jaGlu
ZyBpbiBvdXIgcGxhdGZvcm0uIEkgc2F3IGNvbmZpZyBvcHRpb24gDQogICAgPiDigJxPQk1DX0NP
TlNPTEVfSE9TVF9UVFkgPz0gInR0eVZVQVJUMCIg4oCcIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBi
YiBmaWxlIA0KICAgID4gYW5kIGFsc28gdGhlcmUgaXMgbm8gdHJpZ2dlcmluZyBwb2ludCBpbiBv
Ym1jLWNvbnNvbGUtc3NoIHNvY2tldCBhbmQgDQogICAgPiBzZXJ2aWNlIGxpa2UgZWFybGllciBX
YW50cz1vYm1jLWNvbnNvbGVAe09CTUNfQ09OU09MRV9IT1NUX1RUWX0uc2VydmljZSANCiAgICA+
IDxtYWlsdG86V2FudHM9b2JtYy1jb25zb2xlQCU3Yk9CTUNfQ09OU09MRV9IT1NUX1RUWSU3ZC5z
ZXJ2aWNlPi4NCiAgICA+IA0KICAgID4gDQogICAgPiBJIHNlZSB1ZGV2IHJ1bGVzIGFkZGVkIGlu
IGxhdGVzdCBwYXRjaCBmb3IgbGF1bmNoaW5nIHNlcnZlciB3aGljaCBuZWVkcyANCiAgICA+IGNv
bmZpZyBkZWZpbml0aW9uIG9mIHVkZXYsIGRvIHdlIG5lZWQgdGhpcyBmb3IgbGF1bmNoaW5nLCBw
bGVhc2UgYWR2aXNlLg0KICAgIA0KICAgIFllcywgb2JtYy1jb25zb2xlIG5vdyBzaGlwcyBhIHVk
ZXYgcnVsZXMgZmlsZSB0aGF0IGxhdW5jaGVzIG9ibWMtY29uc29sZS1zZXJ2ZXINCiAgICB2aWEg
YW4gYEVOVntTWVNURU1EX1dBTlRTfWAgZGlyZWN0aXZlOg0KDQpJZiB0aGlzIGlzIG1hbmRhdG9y
eSB0aGVuIHdoeSBkbyB3ZSBuZWVkIHRvIGVuYWJsZSBVREVWIGNvbmZpZyBhcyBpdCBzaG91bGQg
YmUgZW5hYmxlZCBieSBkZWZhdWx0Lg0KICAgIA0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL29ibWMtY29uc29sZS9jb21taXQvZmRmMWE3MTAyZjgwMDcxMWRhYWRmYzM4OTVmYzhmZWVm
ZmE3M2MwZSNkaWZmLTQxNmRiYThiODhhYWQyMjkxZDljMzE0Y2ZhN2E3NWYxDQogICAgDQogICAg
SSBzYXcgb24gSVJDIHlvdSBuZWVkIHRvIGxhdW5jaCBvYm1jLWNvbnNvbGUtc2VydmVyIGZvciBV
QVJUcyBvdGhlciB0aGFuIHRoZQ0KICAgIFZVQVJUUyAtIHBsZWFzZSBzZW5kIGEgcGF0Y2ggdG8g
dGhlIHJ1bGVzIGZpbGUgaW4gb2JtYy1jb25zb2xlIGFkZGluZyB0aGUNCiAgICBVQVJUcyB5b3Ug
bmVlZC4gQXMgbm90ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHN5c3RlbWQgd2lsbCBvbmx5IGF0
dGVtcHQNCiAgICB0byBzdGFydCBvYm1jLWNvbnNvbGUtc2VydmVyIGZvciB0aGUgVUFSVHMgdGhh
dCBoYXZlIGNvbmZpZ3VyYXRpb24gZmlsZXMgaW5zdGFsbGVkDQogICAgb24gdGhlIHN5c3RlbSwg
c28gd2UgY2FuIGluIHRoZW9yeSBzdXBwb3J0IGFkZGluZyBydWxlcyBmb3IgZWFjaCBVQVJUIHdp
dGhvdXQNCiAgICBuZWdhdGl2ZSBlZmZlY3RzLg0KICAgIA0KICAgIEhvcGUgdGhhdCBoZWxwcywN
CiAgICANCiAgICBBbmRyZXcNCiAgICANCg0K
