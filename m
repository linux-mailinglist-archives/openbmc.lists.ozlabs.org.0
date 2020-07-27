Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71D22E665
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 09:19:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWQg5C5RzF18f
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:19:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0477dec11c=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWMf1lryzF0VV
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 17:16:53 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R784SJ032438; Mon, 27 Jul 2020 07:16:49 GMT
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com
 [15.241.140.78])
 by mx0b-002e3701.pphosted.com with ESMTP id 32gcrkk92a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:16:49 +0000
Received: from G9W8453.americas.hpqcorp.net (g9w8453.houston.hp.com
 [16.216.160.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3425.houston.hpe.com (Postfix) with ESMTPS id A723BAA;
 Mon, 27 Jul 2020 07:16:48 +0000 (UTC)
Received: from G2W6309.americas.hpqcorp.net (2002:10c5:4033::10c5:4033) by
 G9W8453.americas.hpqcorp.net (2002:10d8:a0d3::10d8:a0d3) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 27 Jul 2020 07:16:48 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G2W6309.americas.hpqcorp.net (16.197.64.51) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 27 Jul 2020 07:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKxOoqpuQpbDpBsOIxitHmkALuv8NYunriz++9famjLaD6exzehqjvbPi+xrC92r4O7LujgyB4d2xJXu1JmI1CtzqqkdUVIuCAiN9AmCTOdECkc6qNh46Tzer59H56itfgPK0sEw5ghu9rwJRwvuX9Jnv097pGQNjlC4UedxS185+dI1QctYpOtMSUpAN++4iRmDxa9oJZM9sAqJyRK71PQ4QZAX9DUhFJrBZzaZ51wP6wBlCQlY+a710UdrIQQejq22hdZhbwH1MvcrqzEujXOv2eCQHqlPaecZUccr7w8IKujrsH8YGmk1oXOUaK5dHJTs7jpwva6hDaN0tAlk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUgxnG2G2BVi+LoqvuZeX40uo5w4V3E6XzLf6ZBMeBs=;
 b=OWnLuto5cZUPk5DgGtvPandZiJuvCqAMaO6s8W85oLdI++Kdzu+Hv1J/2g1v8PyHsVSPUWqrPxGhw9pufKTSrJljOudTzX7mRAhO6K3c97xl+cRSLD5jN9XFvK/+tG+0lo8LyEKw+Kbf74g2iPXasu0qBQw3h0R8Hi5kw6QNwqVkKIT+K/4aus/32Z1Ykv9mtc5OvufQpYKWeV5LTMy4p19uspD6hLHljAj3bWs+FIr6L2MMcDx22ITXLGpFrAqncESydEQkrCQ7Tewbg+NHIxQJte7iRfoJPsAKQjwc0uRiTMpnrrXt2TWA0Q3A9zLMe401nXQHVyf1cHZl3Ympiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB0776.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 07:16:47 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 07:16:47 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Subject: RE: Question about OpenBMC Remote BIOS configuration proposal
Thread-Topic: Question about OpenBMC Remote BIOS configuration proposal
Thread-Index: AdZgyrFMz0kBQ4JpRYCZI6XSJUYpdAAB/0kAAAVhxTAAAsTXgAC8TSoA
Date: Mon, 27 Jul 2020 07:16:46 +0000
Message-ID: <CS1PR8401MB114411126A8EC39A653DB283FF720@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
 <CS1PR8401MB11443999B40B22F4B97689EEFF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <e2bf675a-2668-4228-fde5-2c1fbd0f9caa@linux.vnet.ibm.com>
In-Reply-To: <e2bf675a-2668-4228-fde5-2c1fbd0f9caa@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none; linux.vnet.ibm.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [16.242.247.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 04736939-884e-46b0-d985-08d831fd0603
x-ms-traffictypediagnostic: CS1PR8401MB0776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CS1PR8401MB07768A997A1EC6D9A225D17BFF720@CS1PR8401MB0776.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LcyFxJnRZ90WZoBxZRtqBiN9dXXYSdABZU6wgqZI86Km9yqWOlZWqh1HYLcUYJmj0yQSSvS5vUe/r+GGVybpjsu0QQK/MOG/9Zr/wSM9JWg9mgOCU/M4BNgr9IqwXDRzxkUQ4drembVW3Gijj1y4CsOICacwXiDbjRJmmrm+Hp4UO6HEK3xZx/gs5JSIF083GCcku0a6dzHD1jsYrmqiCSIxdokcPxbN2IAQ93/ikNNYuQxg75722J+29Pz7E9dBnmRS2TpnXbFwxLWe3glEA5+ObfVt3AUKafR0RWbVTD/YKhTvn3ZT+mK2SZrOsbTYxW36KmoZNsWQWn9CDEyat/pCbfpBx5ecHlc3SerWpntL7ZhpP3euVXQEe9Y2cRO4zPinHGOiJKWAie/ba9C7kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(6506007)(9686003)(8936002)(53546011)(478600001)(52536014)(110136005)(4326008)(186003)(316002)(5660300002)(33656002)(26005)(54906003)(8676002)(76116006)(66556008)(64756008)(66446008)(2906002)(86362001)(66476007)(83380400001)(7696005)(966005)(55016002)(71200400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dnZ2YNZSUmLesVICGTGwpvPuMnHfBPEdb8aDlFidLN7HgzqAmfyz+e0qOFncPVzaY6z24hGwKFu3iM1Jd0gmiypYZQe2UTIHsSxT5QtWio7zxd2AtYF+zVuxv2gEvxTZ0XayMaAdR6UOHGus0LzNKpMzTXcTM27YHW8wjxFQ7u5mCQGD7mJGu8LIUqdLN0gPjyZnoDk3Euv/yGm0sZsCRwE/5GuiXSkgfEVdn4FPCwf4GE7JdK1ZB2ob7pAtgR6js7BU2O9G8gdICu25ns2s9lxnfcCI3R+MnBkfTFA0gAHelKQYZldH1hgmBssknvRkwmlQ9TfZTqWluv7Y/spu1iW88At7aneTcJIUYidOnaVbAMX8zxSxMw9k9v6bj35cPLGCi9I9w1CUgRAI13Qg12tGoRxMvaRugrvEVGqM1BjyefgGt2d6M3uy+UxS3PLk2nqLHjE4m7WmgfQFM4kVX83JXfuu+mwDjj48XYaB59ywfM20qlL4yGfpfTZcT8lR
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04736939-884e-46b0-d985-08d831fd0603
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 07:16:46.8918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j6WbLdsQz0z3Azj4X9Sy61zY8WtuSNuMLqosZj6CtI7LoOsuha/htpCxNHAW0SxlbsYrSeDxeU1LooY6w2HD6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0776
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270051
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu, Frank \(ISS
 Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIERlZXBhaywgSSB0aGluayBJIGFtIGdldHRpbmcgbW9yZSB1bmRlcnN0YW5kIHRoZSBw
cm9wb3NhbCBkZWxpbmVhdGVkIGluIHRoaXMgZmlndXJlLg0KDQpSQkMgZGFlbW9uIGFuZCBELUJ1
cyB0byBSQkMgYXJlIHN0YW5kYXJkaXplZC4gSG93ZXZlciwgdGhlcmUgYXJlIHR3byBpbXBsZW1l
bnRhdGlvbiBzYW1wbGVzICBtZW50aW9uZWQgaW4gdGhpcyBEb2MgKGZvciBCSU9TIHByb3Zpc2lv
bmluZy9jb25zdW1lIGFuZCBtb2RpZnkgc2V0dGluZ3MpIGJhc2VkIG9uIHRoZSBSQkMgZGVzaWdu
LiBPbmUgaXMgdGhlIHByb3ByaWV0YXJ5IGZvcm1hdCBpbiBYTUwgb3ZlciBJUE1JLCBhbm90aGVy
IGlzIFBMRE0gb3ZlciBNQ1RQLiBBYm92ZSBhcmUgbm90IHN0YW5kYXJkaXplZCBhbmQgY291bGQg
YmUgcmVwbGFjZWQgYnkgT0VNL1ZlbmRvciBpZiB0aGV5IGRvbid0IGxpa2UgZWl0aGVyIG9uZS4g
IFBMRE0gZGFlbW9uIGlzIG5vdCB0aGUgc3RhbmRhcmQgbmVpdGhlciwgdGhhdCBpcyBvbmx5IG5l
Y2Vzc2FyeSBmb3IgUExETSBzb2x1dGlvbi4NCkZvciB0aGUgaW1tZWRpYXRlIHVwZGF0ZSBzY2Vu
YXJpbywgaG93IEJNQyBpbmZvcm0gQklPUyB0byB1cGRhdGUgQklPUyBjb25maWd1cmF0aW9ucyBp
cyBub3Qgc3RhbmRhcmRpemVkLiBTTUkgb3Igb3RoZXIgbWV0aG9kcyBjb3VsZCBiZSB1c2VkIHRv
IGFjaGlldmUgaW1tZWRpYXRlIHVwZGF0ZS4NCkFueXRoaW5nIEkgbWlzc2VkPw0KDQp0aGFua3MN
CkFibmVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGVlcGFrIEtv
ZGloYWxsaSBbbWFpbHRvOmRrb2RpaGFsQGxpbnV4LnZuZXQuaWJtLmNvbV0NCj4gU2VudDogVGh1
cnNkYXksIEp1bHkgMjMsIDIwMjAgOToxNSBQTQ0KPiBUbzogQ2hhbmcsIEFibmVyIChIUFMgU1cv
RlcgVGVjaG5vbG9naXN0KSA8YWJuZXIuY2hhbmdAaHBlLmNvbT47DQo+IHN1cnlha2FudGguc2Vr
YXJAbGludXguaW50ZWwuY29tDQo+IENjOiBHYXJyZXR0LCBNaWtlIChIUEUgU2VydmVyIEZpcm13
YXJlKSA8bWlrZS5nYXJyZXR0QGhwZS5jb20+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7
IFd1LCBGcmFuayAoSVNTIEZpcm13YXJlKSA8ZnJhbmsubC53dUBocGUuY29tPg0KPiBTdWJqZWN0
OiBSZTogUXVlc3Rpb24gYWJvdXQgT3BlbkJNQyBSZW1vdGUgQklPUyBjb25maWd1cmF0aW9uIHBy
b3Bvc2FsDQo+IA0KPiBPbiAyMy8wNy8yMCA2OjI5IHBtLCBDaGFuZywgQWJuZXIgKEhQUyBTVy9G
VyBUZWNobm9sb2dpc3QpIHdyb3RlOg0KPiA+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uIERl
ZXBhaywNCj4gPg0KPiA+IEkgYW0gYWZyYWlkIHRoYXQgb25jZSBzb21lIGNvZGUgaXMgY29udHJp
YnV0ZWQgdG8gdGhlIG9wZW4gc291cmNlLCB0aGVuDQo+IHRoYXQgY29kZSBjb3VsZCBiZWNvbWUg
dGhlIHN0YW5kYXJkIGltcGxlbWVudGF0aW9uIGFuZCB1c2VkIGJ5IEJNQw0KPiB2ZW5kb3JzLiBU
byBzdXBwb3J0IFBMRE0gb3Igb3RoZXIgcHJvdG9jb2xzIGJldHdlZW4gQklPUzwtPkJNQyByZXN1
bHQgaW4NCj4gdGhlIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgZnJvbSBCTUMgdmlldyBwb2lu
dC4gU2hhbGwgd2Ugc3RhbmRhcmRpemUNCj4gdGhlIHNwZWMgYW5kIHRoZSBpbXBsZW1lbnRhdGlv
biBhcyB3ZWxsPyBJZiB3ZSB3b3VsZCBsaWtlIHRvIGdpdmUgdGhlDQo+IGZsZXhpYmlsaXR5IHRv
IHN1cHBvcnQgQklPUyA8LT4gQk1DIHByb3RvY29scyBmb3IgdGhlIHJlbW90ZSBCSU9TDQo+IGNv
bmZpZ3VyYXRpb25zLCBzaGFsbCB3ZSBhYnN0cmFjdCBzb21lIGxheWVycyBiYXNlZCBvbiBSZW1v
dGUgQklPUw0KPiBjb25maWd1cmF0aW9uIHByb3Bvc2FsPyBUaHVzIE9wZW5CTUMgY2FuIHByb3Zp
ZGUgdGhlIGdlbmVyaWMgKHRoZSBiYXNlDQo+IGltcGxlbWVudGF0aW9uKSBjb2RlIGZvciBCSU9T
IDwtPiBCTUMgcHJvdG9jb2wgYW5kIE9FTSBwcm92aWRlcyB0aGUNCj4gaW1wbGVtZW50YXRpb24g
b2YgYWJzdHJhY3QgZHJpdmVyL2xpYnJhcnk/DQo+IA0KPiBIaSBBYm5lciwNCj4gDQo+IEkgdGhp
bmsgdGhlIGludGVudCBvZiB0aGUgcmVtb3RlIGJpb3MgY29uZmlnIGFwcCBpcyBhbGlnbmVkIHdp
dGggd2hhdCB5b3UNCj4gbWVudGlvbiBhYm92ZS4gVGhlIGFwcCBpc24ndCB0aWVkIHVwIHdpdGgg
YW55IG9mIHRoZSBwcm90b2NvbHMgLSBJUE1JLCBQTERNLA0KPiBSZWRmaXNoIGV0Yy4gVGhlIGFi
c3RyYWN0aW9uIHRoZSBhcHAgcmVsaWVzIG9uIGlzIEQtQnVzLCB3aGljaCBpcyB0aGUgdGhlDQo+
IGFic3RyYWN0aW9uIGZvciBzZXZlcmFsIG90aGVyIE9wZW5CTUMgYXBwcy4gVGhpcyBhcHAgd2ls
bCBpbXBsZW1lbnQgdGhlDQo+IGZvbGxvd2luZyBELUJ1cyBpbnRlcmZhY2UgLSBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1kYnVzLQ0KPiBpbnRlcmZhY2VzL2Jsb2IvbWFzdGVy
L3h5ei9vcGVuYm1jX3Byb2plY3QvQklPU0NvbmZpZy9NYW5hZ2VyLmludGVyZmENCj4gY2UueWFt
bC4NCj4gVGhpcyBtZWFucyBhcHBzIGxpa2UgdGhlIElQTUkgYW5kIFBMRE0gZGFlbW9ucyBoYXZl
IHRvIGNvbnZlcnQgdGhlaXIgb3duDQo+IEJJT1MgZm9ybWF0cyB0byB0aGlzLCBhbmQgYXBwcyBs
aWtlIHdlYnNlcnZlciB3aWxsIGNvbnZlcnQgYmV0d2VlbiB0aGlzIGFuZA0KPiBSZWRmaXNoLg0K
PiANCj4gVGhlIEQtQnVzIEFQSSBJIHBvaW50ZWQgdG8gYWJvdmUgd2FzIHJlY2VudGx5IG1lcmdl
ZCB2aWEgdGhpcyBjb21taXQgOg0KPiBJTlZBTElEIFVSSSBSRU1PVkVEDQo+IDJEcHJvamVjdC54
eXpfLTIzX2Nfb3BlbmJtY19waG9zcGhvci0yRGRidXMtMkRpbnRlcmZhY2VzXy0NCj4gMkJfMTgy
NDJfJmQ9RHdJQ2FRJmM9QzViOHpSUU8xbWlHbUJlVloyTEZXZyZyPV9TTjZGWkJONFZnaTQNCj4g
VWxrc2t6NnFVM05ZUk8wM25IcDlQN1o1cTU5QTNFJm09SkpISmRsSU5WU3VtTHR0cXMwQU90MFZu
ZzRfbEZVDQo+IHI3QURaU1ZnbjlBbG8mcz1LSVVwbU5zZUVIc2JmUjlPemllN2U5anFWNXFRQlZW
MVo1TFpYVWRCN3VvJmUNCj4gPQ0KPiANCj4gUmVnYXJkcywNCj4gRGVlcGFrDQo+IA0KDQo=
