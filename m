Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19CB6F11
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 23:49:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YYXm20WYzF38T
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 07:49:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4164fb3d32=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="YIFmK9P/"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UUOvxZ0F"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YYWr5q0hzF0dj
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 07:48:32 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ILdbDu026259
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 14:48:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=FQXXCEteVRCeBXg987upJNiDX2xZSqL0UYJGlydMnCw=;
 b=YIFmK9P/CKjz4fsOCqggqArb+PnrG88XZ1Cz0Q04KgA1HSwyMFsnTzZlpcUOfcwxSDvk
 NO0IcS2Q6ZB8iSnlwi0qvX/ng6oaxaziCBeVFNri6wN7wupANFxPv6unsOyVfOGdSQPD
 V5c9mlxgUYYrjTvk1k8T4Ck+obiZNxEmdL0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v3vdq03kh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 14:48:30 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 14:48:29 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Sep 2019 14:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPR47t0cwky+dwjq4Ckgc19fkkjkqrpKPZGG0apncQaxQTrHDDoFmjlVqiATAFFPTswOE8IMuVmN7Z9IHJ4IRdzfK+QL2GQCZGBC1BpPhBCjO0maa7G4jqBwDzCTCs7jf43xbCHhvDzG/XuFQY7cfGm/eSW0TJrl/vOaG8W3+l/e0V1pGP0yL4l6hzjIZmyFfO29LBijqcUEX7TXR5VpMmLFHrqEdBbVq9fz95sf0nshESxc0Tn3XlTFuBoQ1Qdzh9paYsM0agKOd9Kg9rP7svg80nxMjwFuxkk2Uhqd9gYkF5Ru+F29AexamkzF7SykZjlUd2vZAKj0TIpGRCb9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQXXCEteVRCeBXg987upJNiDX2xZSqL0UYJGlydMnCw=;
 b=JgulyP7j5xxIcN7+oiXmeWxURONOaCSTaKYDES24JpSKiKZLtcyq5DuV+CSC2t/3UQWqd4ZZOUjc1bFsJG7H3bWBNzzpqq31DG3bFaZi/0jGB4yrUKCcOUcdl1hxTMOlIQmKypWaHBMe+Vea0eBJZBhGff8/bn1mOcQ30/utqmOWtJFwsQW3FZ1ER7UQemvbQlkwG0o/jrYeLZLnq3MeHr/nqdxYRYnS8ZwpGQe+vvBRCpnHw7QWrT9gOC5NIKqa/SnvG65bFzvWGNt+y6DnD+Ayzs6X7IZ6Vs/f8OS+Eeg25bo4to6GNBCIWhYFThRjGuasSI8JsNYjqCXVasr4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQXXCEteVRCeBXg987upJNiDX2xZSqL0UYJGlydMnCw=;
 b=UUOvxZ0FIr5w37gVacDlLCTpX9TCctCEvYuVSZ6wZ5yeZlv44RkZOS+zgqgGQ8iyTcqAbwlVMMDuj5qXHtvOV5/LTRYdC16hqGq3oNsvVnzpJ/GfrKNahg/TjdKvtrr7Bg52iniQykIuVoDnSzeNP3Z12XbCUelLvm1fXQsji1M=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1614.namprd15.prod.outlook.com (10.175.140.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Wed, 18 Sep 2019 21:48:28 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 21:48:28 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Some Recipes Randomly Fail
Thread-Topic: Some Recipes Randomly Fail
Thread-Index: AQHVbmrOSxyADrTcmEGNsZClaoz4Rw==
Date: Wed, 18 Sep 2019 21:48:28 +0000
Message-ID: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::1:6c8c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 593cad7e-f590-4122-3a0c-08d73c81f0ab
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1614; 
x-ms-traffictypediagnostic: MWHPR15MB1614:
x-microsoft-antispam-prvs: <MWHPR15MB16144FE5F13A1C78BBE48EDABD8E0@MWHPR15MB1614.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(71200400001)(256004)(86362001)(5660300002)(7736002)(6436002)(486006)(2906002)(6486002)(476003)(36756003)(14454004)(2351001)(186003)(25786009)(5640700003)(2616005)(46003)(6116002)(1730700003)(102836004)(81156014)(498600001)(3480700005)(71190400001)(99286004)(66556008)(66476007)(6512007)(66946007)(8936002)(8676002)(66446008)(6506007)(305945005)(81166006)(2501003)(76116006)(64756008)(6916009)(91956017)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1614;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wOuX6aLzrKhzZUb68uqUfan3cpnz9VPMXAMAoaeSjARLg5T8O2KVP3aQeFiY6WwQMzwHLbHVVa5tosSliSdDnRSCaV6hLaa4/7BC9eXjv6vvuvr3NiZ89+VsqV9lyUaZ7ll1ungTAKBfNCToACpNsQyY7LokZOiZ90g5Py/lQPsJziAOrocUTli5IGBYWWAgyhXCxB5mQVn+O5DtCsKIuqixwuMyVVWDY7044GxrtA/8BL9+bVTFAIh5ot8HaGp6+HBE584mvUAMXTTqvd4sRSbP22+sl94aMv3Lx1GBdWtr9D6oYz9phUJkoKDbPiebLaeOJdAX6hAhukibFqL+EvQBBIVlXCUW6DGznNmEcBSB9s2vcNwZRV7yQCtUsjMmbVS4TCE1pQPxp0niBzXr73YjUXYaPJxpmt5rSWZyPSA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B69335BDE9BB44E888F98EF41FF29BF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 593cad7e-f590-4122-3a0c-08d73c81f0ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 21:48:28.0646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kw9NzfiimxV28goFUrw3uFLCA5lLLWQIXzykvW+9fcOEx4dcycVP3tAp8HOiYcJezmt+mc5yFC0zMqSvgzSXuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1614
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_10:2019-09-18,2019-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=665 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180184
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

UGVyaGFwcyBpdOKAmXMgc29tZXRoaW5nIHRoYXQgSeKAmW0gZG9pbmcgd3JvbmfigKYNCg0KTXkg
Q2VudE9TIDcgYnVpbGQgVk0gaGFzIDE0R0IgUkFNIHdpdGggMiBHQiBhbGxvY2F0ZWQgZm9yIHN3
YXAuIEFsdGhvdWdoIEkgbmV2ZXIgcGFzcyAxMkdCIFJBTSBvciA1MjAgTUIgb2Ygc3dhcCwgYSDi
gJxCaXRiYWtlIG9ibWMtcGhvc3Bob3ItaW1hZ2XigJ0gd2lsbCBvZnRlbiBmYWlsIGEgcmVjaXBl
IHdpdGggY29tcGlsYXRpb24gZXJyb3JzIHRoYXQgZ28gYXdheSBpZiBJIHJlYnVpbGQgdGhhdCBw
YXJ0aWN1bGFyIHJlY2lwZS4gTm9ybWFsbHksIHRoZSBmYWlsaW5nIHJlY2lwZSBpcyBzb21ldGhp
bmcgbGlrZSBlbnRpdHktbWFuYWdlciwgZGJ1cy1zZW5zb3JzIG9yIGJtY3dlYiwgYWxsIHRocmVl
IG9mIHdoaWNoIGFyZSBsYXJnZXIgYXBwbGljYXRpb25zLiBJZiBJIHNwZWNpZmljYWxseSBCaXRi
YWtlIHRoZSBmYWlsaW5nIGFwcGxpY2F0aW9ucywgdGhlbiBnbyBiYWNrIGFuZCBidWlsZCB0aGUg
aW1hZ2UgcmVjaXBlLCBJIHdpbGwgdHlwaWNhbGx5IGdldCBjbG9zZXIgdG8gYSBjb21wbGV0ZWx5
IHN1Y2Nlc3NmdWwgYnVpbGQuIFNvbWV0aW1lcyBpdCB0YWtlcyBtdWx0aXBsZSByZXBldGl0aW9u
cywgYnV0IGl0IGFsd2F5cyBjb252ZXJnZXMgdG8gYSBzdWNjZXNzZnVsIGJ1aWxkLg0KDQpJdCBj
b25jZXJucyBtZSB0aGF0IHRoZXNlIGFyZSByYW5kb20gY29tcGlsYXRpb24gZXJyb3JzIGluIGNv
ZGUgdGhhdCwgcHJlc3VtYWJseSwgd29ya3MgZmluZSBmb3IgbW9zdCBldmVyeW9uZSwgYW5kIHRo
YXQgdGhlIGVycm9ycyBhcmUgdHJhbnNpZW50Lg0KDQpGV0lXLCBJ4oCZbSBhbGxvY2F0aW5nIGFs
bCA4IHRocmVhZHMgKDQgY29yZXMpIG9mIG15IE1hY0Jvb2sgUHJvIHdoZW4gYnVpbGRpbmcuIFRo
aXMgaXNzdWUgb2NjdXJzIHdpdGggYm90aCBQYXJhbGxlbHMsIFZpcnR1YWxCb3ggYW5kIFZNV2Fy
ZSBGdXNpb24sIGJ1dCB0aGUgZmluYWwgYnVpbGQgaW1hZ2UgYWx3YXlzIHNlZW1zIHRvIGZ1bmN0
aW9uIHJlYXNvbmFibHkgd2VsbC4gSSBoYXZlIG5vdCBzZWVuIGFuIGlzc3VlIHdpdGggYW55IG9m
IHRoZSBzbWFsbGVyIHJlY2lwZXMuDQoNClRob3VnaHRzIGFwcHJlY2lhdGVkLiBBbHNvLCBwbGVh
c2Ugc2F5IHNvbWV0aGluZyBpZiB5b3Uga25vdyB0aGUgcm9vdCBjYXVzZSBvciBoYXZlIHNlZW4g
dGhlIHNhbWUgaXNzdWUuIA0KDQpXaWxmcmVk
