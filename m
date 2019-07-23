Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1172666
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:27:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tj3y12FDzDqLD
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:27:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="QuKFViF0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="N1E8zLfC"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tStd1GSTzDqMy
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 05:18:15 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NJHYZe011417; Tue, 23 Jul 2019 12:18:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=o2qkVU14ZtjQpOzB4xdKn4n/B2MfTuPVlfTdVVwCjf0=;
 b=QuKFViF05+H9q0bnylGqr9+OKwdkQHqCCy5Cp1RHC6mrROULu2iCDVgGZN7DPOZrvVyP
 CSpcg+ewcQjIb1hcdT5v8DN/tRMU9iGNX1jHR7Mn8PKXbaKoNQFJd7BuI1wLqeFTX4tw
 wQAXk97DQrH++U22seQTl635jSCHWFJ14Ig= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx60trnfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2019 12:18:12 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 23 Jul 2019 12:18:11 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 23 Jul 2019 12:18:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 12:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrHnQduPJs09GMF66ZZI/pCofIHy9WMhUXbufqLFLoBzFvkUeJq1BVgkx1jhBc+NgJcvvrpfVrZ8VKFc5kUE0UNbaP2DskC6Y/f4a3P1AqbVZrQAKiHCEY1SVSkm+zZB5rOt7GnYDVZFK0zsFUc5PsaPJNlGJQhDGKNp5f2SRL9E7czk7KHv3eJ3OJ33xyr+7/fMS3+xMmkrIqZWfuMAzAgfyElpiBLNOkhSdTWXHaEdlnjMEAg8mJOPQ02SLkpD7xuSQaQ7X9neM7eNZ9e2IaDfR1kjONgSYEwfjJXLiq6z4ItkE+k1M8fFdTbDR3MzwsHgLzpa1S56Jgc59/GKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2qkVU14ZtjQpOzB4xdKn4n/B2MfTuPVlfTdVVwCjf0=;
 b=VJNU7o8E1NC7b5hRyR3b9op6uCFzkg4LFItxhiYpzJEYKBUxvfi0FUfuWdYMvNcOp1U/eQYx4e17zEDo9eIw0YKiJviwe4jLFHoXzJfWmuBmx8DJZ8zxz20jKor0Z3aMORGZQaGlmUiC8y7umWd+DBWfwQOHeGzdZc6CYepCIpEF24HgOPi5L2DOkL9G1EV7zqsb5PfNCRa+bgy9clsYUz759KW82U5EkJBA5dN9+UEA24q8WnDXq3ovti4GFYeBbWdrxCE40n647xZEHTtQ8Drcs9REMa2SXagswa2LMqskUtsQxCayGV+nkP/SgaZVBXpDhxz2xgMy9MveHCMDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2qkVU14ZtjQpOzB4xdKn4n/B2MfTuPVlfTdVVwCjf0=;
 b=N1E8zLfCmiGfatzvP8iYn1h0CK9PVvHZG6AsBziqajj7AruSaqgho4EIMhT9PYHY93rPKaYoXy3E3N7oXKLKaXrWLSU+VkeYXuIY7blxHiv1yoce7jQ82/0W8VYBw28+fRWzekGOAT6RCwczpkw/1Xm/0s5b181whYWvtLcN9AM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1800.namprd15.prod.outlook.com (10.174.52.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 19:18:10 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 19:18:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Phil Eichinger <phil@zankapfel.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Using fru-device with 16 Bit EEPROM
Thread-Topic: Using fru-device with 16 Bit EEPROM
Thread-Index: AQHVPf84m+P7jLbKFEatfRwst8F76qbYJWKA
Date: Tue, 23 Jul 2019 19:18:10 +0000
Message-ID: <1C46D500-D62E-485B-A033-DB1791C652C7@fb.com>
References: <20190719065057.nqqmecxbalvoszlo@zankapfel.net>
In-Reply-To: <20190719065057.nqqmecxbalvoszlo@zankapfel.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:8724]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27a4691c-6f50-46ce-618c-08d70fa28027
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1800; 
x-ms-traffictypediagnostic: CY4PR15MB1800:
x-microsoft-antispam-prvs: <CY4PR15MB180022B82E75C0ADB0CA4D21DDC70@CY4PR15MB1800.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(376002)(346002)(39860400002)(165144002)(189003)(199004)(68736007)(486006)(476003)(81156014)(305945005)(2501003)(110136005)(6486002)(81166006)(316002)(8676002)(6116002)(6512007)(25786009)(11346002)(5660300002)(76176011)(14454004)(6246003)(446003)(71190400001)(8936002)(6436002)(186003)(71200400001)(2616005)(86362001)(76116006)(33656002)(91956017)(6506007)(229853002)(53936002)(256004)(14444005)(99286004)(36756003)(46003)(478600001)(7736002)(66946007)(66446008)(64756008)(2906002)(66556008)(102836004)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1800;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6wU3p/yH4WmhVGTj7fr/i478J9Cv0dxC7Sai8o8rOi6Nk0O8arxD2TrgQHDt44qusv2wQbTG46PfWMq8RW5ZBrKzpN8Opf5sbjNzfkNjSQ+RwA42CuJicrJ6ETu4jWOKofoLKGSgRcVZOe2oNvTl+w1gWsGi4ikL+TbxS6Vmkgmj6nBidnCPzJoCKMImWNz0Wdwx/E+gqXBmUt2GmITqh/heI84g7+PNWPC+H51nUxAED/9gORNtuKuoJ7g39IhKax9Or02uA1I4XJAPPZVyPLfJlUrc81S4pY8Rh393wOze2wxnGt4IgmBGMlxBqh3A4Nb3bap7SYSlL6FzXamYkm/2/WuMvgiqOqkyrCdc3EZrqI4xrLi2QZ2xBelTzochAUCFHO+98S653eE3qzfNx4WrOaVGhZ3xJxrtt13KlA0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <398354DD7BA8F14B818A7AE4462CFC08@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a4691c-6f50-46ce-618c-08d70fa28027
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 19:18:10.4378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1800
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230196
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMTgvMTksIDExOjU3IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgUGhpbCBF
aWNoaW5nZXIiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIHBoaWxAemFua2FwZmVsLm5ldD4gd3JvdGU6DQoNCiAgICBIaSAq
LA0KICAgIA0KICAgIEkgd2FzIHdvbmRlcmluZyBpZiBhbnlvbmUgaXMgdXNpbmcgZnJ1LWRldmlj
ZSBmcm9tIGVudGl0eS1tYW5hZ2VyIHdpdGgNCiAgICBFRVBST01zIHRoYXQgaGF2ZSAxNiBCaXQg
YWRkcmVzc2luZy4NCiAgICBJbml0aWFsbHkgSSBnb3QgYW4gb2ZmLWJ5LW9uZSBlcnJvciwgSSBk
dW1wZWQgdGhlIHJlYWQgaGVhZGVyIGJ5dGVzIGFuZA0KICAgIHRoZXkgbG9va2VkIGxpa2UgdGhl
eSBjYW1lIGZyb20gYWRkcmVzcyAweDAxLg0KICAgIEkgZHVnIGluIGEgbGl0dGxlIGRlZXBlciBh
bmQgSSB0aGluayB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHRoZSByZWFkDQogICAgZnVuY3Rpb24g
LSByZWFkX2Jsb2NrX2RhdGEoKSAtIGZvciAxNiBCaXQgYWRkcmVzc2luZy4NCiAgICBJIGhhdmVu
J3QgdmVyaWZpZWQgaXQgb24gYSBzY29wZSBidXQgSSB0aGluayB0aGUgaTJjX3NtYnVzIEFQSSB5
aWVsZHMgYW4NCiAgICBJMkMgdHJhbnNtaXNzaW9uIGZvciBldmVyeSBBUEkgY2FsbD8NCg0KV2Ug
YXJlIGFsc28gc2VlaW5nIHRoaXMgaXNzdWUgd2l0aCBkZXZpY2VzIHdoaWNoIGRvZXNuJ3Qgc3Rh
cnQgYXQgb2Zmc2V0IDAuDQpJZiBEcml2ZSBpcyBzZXR1cCB0byBkaWZmZXJlbnQgYWRkcmVzcyBv
dGhlciB0aGFuIDAgdGhlbiBpdCBpcyBoYXJkIHRvIGRldGVjdCBpZiBpdCANCmlzIDE2IGJpdCBv
ciA4IGJpdCBhcyB3ZSBjYW4ndCB3cml0ZSB0byBkZXZpY2UgYXQgdGhlIHRpbWUgb2YgZW51bWVy
YXRpb25zLiBBcyB0aGVyZSANCmlzIGFuIGFsdGVybmF0ZSBzb2x1dGlvbiBmb3IgdGhlc2Uga2lu
ZCBvZiBkZXZpY2VzIGJ1dCBub3Qgd29ya2luZyBjb21wbGV0ZWx5Lg0KICAgIA0KICAgIE15IEVF
UFJPTSAoTWljcm9jaGlwIDI0QzEyOCkgcmVxdWlyZXMgZm9yIHJhbmRvbSByZWFkcyBhIDIgQnl0
ZSB3cml0ZQ0KICAgIHdpdGggdGhlIGhpZ2hlciBhZGRyZXNzIGJ5dGUgZmlyc3QgLSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIGhhcyBpdA0KICAgIHZpY2UtdmVyc2EgYW5kIHNwbGl0IG92ZXIgMiB0
cmFuc2FjdGlvbnMuDQogICAgRnJvbSB0aGVuIG9uIEkgY2FuIHVzZSB0aGUgY29udGludW91cyBy
ZWFkIHdpdGggYXV0byBhZGRyZXNzIGluY3JlbWVudC4NCiAgICANCiAgICBJcyB0aGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiB3cml0dGVuIGZvciBhIGRpZmZlcmVudCBFRVBST00gcmVxdWlyaW5n
DQogICAgcmVhZGluZyB0aGlzIHdheSBvciBpcyBpdCBqdXN0IGJyb2tlbj8gSW4gY2FzZSBvZiB0
aGUgbGF0dGVyIEkgY2FuIHNlbmQNCiAgICBhIHBhdGNoLg0KICAgIA0KICAgIFdoeSBpcyB0aGVy
ZSBiYXNpY2FsbHkgYSB1c2VyIHNwYWNlIGRyaXZlciBmb3IgcmVhZGluZy93cml0aW5nIEVFUFJP
TXMNCiAgICBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBpbnRlcmZhY2UgaW4gc3lzZnMgKGllLg0KICAg
IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhiOmFwYi9haGI6YXBiOmJ1c0AxZTc4YTAwMC8x
ZTc4YTEwMC5pMmMtYnVzL2kyYy0zLzMtMDA1MC9lZXByb20pPw0KICAgIA0KICAgIENoZWVycywN
CiAgICANCiAgICBQaGlsDQogICAgLS0gDQogICAgDQoNCg==
