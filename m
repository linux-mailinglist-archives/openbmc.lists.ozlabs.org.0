Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF380233
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 23:19:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460g5G2CFVzDrGv
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 07:18:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31174f4238=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IY64WHGX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Z7cMC0un"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460g4b5C4qzDrFD
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 07:18:15 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x72LEgbC031994;
 Fri, 2 Aug 2019 14:18:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=FlqkWJoVXdyBkRaELi+6hMTs5n7vizILz+hi432+swA=;
 b=IY64WHGXjoACay2ND1UGbB+aeglXuy/iUJMKiJEidOGu4ESuy8DkjO/qCRHzRERDX4ZO
 DvtEc5o8kNkzjjI6zaP6U/KADQH2QEciIJl4SDbGaFeOIWCkRmkFxW0ptl+aPhnOyJSV
 GT7DM1rHyWyG2jgZ1b/5Oams2amaEmrAen4= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2u4sbtgt4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:18:11 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 2 Aug 2019 14:18:09 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 2 Aug 2019 14:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUX4guJj5wAbyIOzcm/3Z9W9BxBJKB8aQeX2OAbeTIIAbMum40CiyEau1DvIhX2QjjWiaUCYCplZB906DMobB6nSOeofvX27hZZ0jNCCR8XSfF1W3i9jbqucfaI+Nc2gKooBn8sLQN5ilz/J7d9R+P9uANGp/6vL2byussipbnroYWiuZZSfej7VVv8RkBZUy4ardb5zrnOHw84un05s82bi6o+t/3ZFPvue8+mH/nSn2apW4gzCXb6cKTLbGpptyfrE72M9DMZWy/GLZhaKQyYTOmbVAhRliggRIMGmEvuWQZOhm5KujLdDgPXTw2ui7F3p/3S+R3RamgVA08/qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlqkWJoVXdyBkRaELi+6hMTs5n7vizILz+hi432+swA=;
 b=Z3aeY8uLA5M70+bJ6ZsUymf1k45d/1EVJnuvsAEA1Eld8nlMo076/g7ozaZC/JTGlDLnz0Sh0SwEX0x9jG4ge2FGzfEsa7kprYumSJzFPs1kCDKytlas6h8Kqj6z99Guk9Pv3FDNHZMT0IfAViJPuMY4qsBg5MP6QnPBOMzNGN5c+X4OMn9DI1NzLch5umvSiZ4Wd31uOJ0Ti2opDvh5A/NLltIJb/gGxulBl6pxdtxquYkapwdQD6Ywqk1rfLhJBTShmC5xhr9Qv1RU8ZrJvbbR7b7blpzVsN8C1f6CBA6fjXWvxqQ9ObwG3Xu5luJOhP+LShfs25K1yG8Tx3yOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlqkWJoVXdyBkRaELi+6hMTs5n7vizILz+hi432+swA=;
 b=Z7cMC0unvrKg7Nz0fE74jC5S6PIsKEZFyotRlkcBHxpPXKHLLWDglQwCgPyHcIMyxOvWf5VZwQ2qk7+MRc7ohhYZE3Xz0N3ZT99TlKCZ5vCo1a2oTG4u5sfvNWdCNI0pMaLJKAui1NbowjcpnlZFMKZXi0zL9rwXM2PzCRkICT4=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1830.namprd15.prod.outlook.com (10.172.77.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 21:18:08 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 21:18:08 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: vishwa <vishwa@linux.vnet.ibm.com>, Lei YU <mine260309@gmail.com>
Subject: Re: Small help on trivial issue
Thread-Topic: Small help on trivial issue
Thread-Index: AQHVSKT5kxW7Xam0fk6sDPbcopY/5KbnHV+AgABH14CAAIO1gA==
Date: Fri, 2 Aug 2019 21:18:07 +0000
Message-ID: <48D01587-EBCB-4992-83C6-5D8ABC56D234@fb.com>
References: <A6540D28-604F-4057-8065-0EB20BFE92A5@fb.com>
 <CAARXrtn6OqU9P5MEbZ9znetZ5f115vyZ8NYr0e_P79PFdG1ChA@mail.gmail.com>
 <23b0b26b-2ad2-d97d-a7e5-d2518b801d6d@linux.vnet.ibm.com>
In-Reply-To: <23b0b26b-2ad2-d97d-a7e5-d2518b801d6d@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:bcd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0ac047e-cb87-4a99-7943-08d7178eea8e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1830; 
x-ms-traffictypediagnostic: CY4PR15MB1830:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB1830CF65B98A5155DFF0FCC8DDD90@CY4PR15MB1830.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(136003)(346002)(39860400002)(199004)(189003)(102836004)(7736002)(66556008)(5024004)(316002)(81166006)(81156014)(6436002)(8676002)(4326008)(14454004)(11346002)(229853002)(110136005)(68736007)(46003)(305945005)(36756003)(86362001)(53936002)(478600001)(2906002)(186003)(66476007)(966005)(256004)(66446008)(71190400001)(486006)(14444005)(6116002)(5660300002)(76176011)(6486002)(99286004)(53546011)(6246003)(33656002)(76116006)(91956017)(446003)(66946007)(71200400001)(6306002)(6512007)(2616005)(6506007)(476003)(8936002)(64756008)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1830;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6K7/ZdBG6W4wsGZGAHONmWXyrfVWRNLQH65Z0ipdgxawkIqrxEJyTUiUHK6vMNmM7IXTG752KpCI6XrhIEqOFH0e7J3pLfnrOGScdgXso/KO/xVtu+bhGtyzVhJiilPeqyxovHQ3ApUZimePZ95CB/dAook/wV3EgAxOZzB9LqOBwHGykjAAinOzFFhDHz+EkcxZlZa560Waernl+bDMqj5pNViHPKsDtgxsa6yqkZUZZogHEs19PzHdZCf8V2xBzQkTUsA/PmEJJWA24gm3l3kyOB3yi4PruKM+IP5vxyNgxZWu0DOENnc/3AmqmvBNbWOnObZsepBtqeQKMblZgPkmuJ55TV2DrSYT8aCBQVlKnRDQKgPG5dE5f1lRdXftY3rG4ha6/7Vg5mjbiSgXJbpLbxARdtx1yB13mU8EoPc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78255D800B33B247A607D2791231EEA9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ac047e-cb87-4a99-7943-08d7178eea8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 21:18:08.2515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1830
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020225
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIGEgbG90IGd1eXMsIEl0IHJlYWxseSBoZWxwZWQuDQoNClJlZ2FyZHMNCi1WaWpheQ0K
DQrvu79PbiA4LzEvMTksIDExOjI3IFBNLCAidmlzaHdhIiA8dmlzaHdhQGxpbnV4LnZuZXQuaWJt
LmNvbT4gd3JvdGU6DQoNCiAgICBIZXJlIGlzIGFub3RoZXIgaW5zdGFuY2U6IGZyb20gb25lIG9m
IG15IG9sZCBjb21taXRzLg0KICAgIA0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bo
b3NwaG9yLWhvc3QtaXBtaWQvYmxvYi9tYXN0ZXIvc3lzdGVtaW50ZmNtZHMuY3BwI0wxMzENCiAg
ICANCiAgICAhISBWaXNod2EgISENCiAgICANCiAgICBPbiA4LzIvMTkgNzozOSBBTSwgTGVpIFlV
IHdyb3RlOg0KICAgID4gSSBkaWQgbm90IGNoZWNrIHRoZSBjb2RlIGRldGFpbHMsIGJ1dCBmcm9t
IHRoZSBkZXNjcmlwdGlvbiwgaXQgaXMgbGlrZWx5IGR1ZSB0bw0KICAgID4gdGhlIGdsb2JhbCB2
YXJpYWJsZSdzIGluaXRpYWxpemF0aW9uIG9yZGVyIGluIGEgc2hhcmVkIGxpYnJhcnkuDQogICAg
Pg0KICAgID4gQmFzaWNhbGx5LCB5b3UgbmVlZCB0byBzcGVjaWZ5IGBfX2F0dHJpYnV0ZV9fKChp
bml0X3ByaW9yaXR5KDEwMSkpKWAgZm9yIHlvdXINCiAgICA+IGdsb2JhbCB2YXJpYWJsZXMuDQog
ICAgPg0KICAgID4gUGxlYXNlIGNoZWNrIGJlbG93IGNvbW1pdCBmb3IgZGV0YWlscyBhbmQgaG93
IHRvIG1hbnVhbGx5IHNwZWNpZnkgdGhlIGluaXQNCiAgICA+IG9yZGVyIGZvciBzdWNoIHZhcmlh
Ymxlcy4NCiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3QtaXBt
aWQvY29tbWl0LzRiMGRkYjY4YjRlNzY0MjAzNTg1ODkyMTNiYzQwMDE1NWZhMTJlNDMNCiAgICA+
DQogICAgPg0KICAgID4gT24gRnJpLCBBdWcgMiwgMjAxOSBhdCA0OjEyIEFNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+PiBUZWFtLA0KICAgID4+DQogICAg
Pj4gSSBhbSBoYXZpbmcgc21hbGwgaXNzdWUgb2YgZ2xvYmFsIGpzb24gb2JqZWN0IGNvcnJ1cHRp
b24gYW5kIEkgYW0gdW5hYmxlIHRvIGZpbmQgcmVhc29uIGZvciBpdC4gSSBhbSBkZWZpbmluZyBh
IGdsb2JhbCBqc29uIG9iamVjdCAobmxvaG1hbm46Ompzb24gYXBwU2VsRGF0YSkgYXQgdGhlIHN0
YXJ0IG9mIGZpbGUuIEkgYW0gaW5pdGlhbGl6aW5nIHRoaXMgb2JqZWN0IGluIHJlZ2lzdGVyIGZ1
bmN0aW9uIGFuZCBhY2Nlc3NpbmcgdGhpcyBpbiBkaWZmZXJlbnQgZnVuY3Rpb25zIGRlZmluZWQg
aW4gc2FtZSBzaGFyZWQgbGlicmFyeS4gV2hpbGUgYWNjZXNzaW5nIGluIGRpZmZlcmVudCBmdW5j
dGlvbiwgaXQgZG9lc27igJl0IGhvbGQgaW5pdGlhbGl6ZWQgZGF0YS4gVGhpcyBpcyBmYWlsaW5n
IGluIG15IHN0b3JhZ2Vjb21tYW5kcy5jcHAgZm9yIElQTUkuDQogICAgPj4NCiAgICA+Pg0KICAg
ID4+DQogICAgPj4gVGhlbiBJIGNyZWF0ZWQgYSBzZXBhcmF0ZSBuZXcgZmlsZSBzZWxjb21tYW5k
cy5jcHAgYW5kIGRpZCB0aGUgc2FtZSBvcGVyYXRpb24sIGl0IHdvcmtzIGhlcmUgYXMgZXhwZWN0
ZWQuIFNvIEkgYW0gd29uZGVyaW5nIHdoeSBpdCBpcyBmYWlsaW5nIGluIGV4aXN0aW5nIGZpbGUg
dnMgbmV3IG9uZS4gTG9va3MgbGlrZSB0aGVyZSBhcmUgc29tZSBoZWFkZXIgaW5jbHVkZWQgaW4g
ZXhpc3RpbmcgZmlsZSBpcyBtZXNzaW5nIGl0IHVwIGJ1dCBJIGhhdmUgbm8gY2x1ZSB5ZXQuIFRo
aXMgb25seSBoYXBwZW5zIHdpdGgganNvbiBvYmplY3QuDQogICAgPj4NCiAgICA+Pg0KICAgID4+
DQogICAgPj4gRm9yIHlvdXIgcmVmZXJlbmNlLCBJIGFtIGF0dGFjaGluZyBib3RoIGJlbG93IGZp
bGVzDQogICAgPj4NCiAgICA+PiBTdG9yYWdlY29tbWFuZHMuY3BwIOKAkyB3aGVyZSB0aGlzIGZh
aWxzDQogICAgPj4NCiAgICA+PiBTZWxjb21tYW5kcy5jcHAg4oCTIHdoZXJlIGl0IHdvcmtzLg0K
ICAgID4+DQogICAgPj4NCiAgICA+Pg0KICAgID4+IEkga25vdyBpdCBpcyBhIGRlYnVnIGlzc3Vl
IGFuZCBJIGhhdmUgYmVlbiBzdHJ1Z2dsaW5nIGxhc3QgMiBkYXlzIHNvIHRob3VnaHQgb2YgYXNr
aW5nIGZvciBoZWxwIHRvIHRlYW0uIEFueSBoZWxwIGhlcmUgd291bGQgYmUgYXBwcmVjaWF0ZWQu
DQogICAgPj4NCiAgICA+Pg0KICAgID4+DQogICAgPj4gUmVnYXJkcw0KICAgID4+DQogICAgPj4g
LVZpamF5DQogICAgDQogICAgDQoNCg==
