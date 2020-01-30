Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39314E4EB
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 22:39:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487tzM0Ng2zDqcD
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 08:39:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9298bfd363=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=BRUYquvx; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Fpqqjsk6; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487tyb19ZZzDqZx
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 08:38:45 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ULcTsS004216; Thu, 30 Jan 2020 13:38:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=RN8t1YhWDNEtasZrhzQLKBMvAzVtdjzw86LK1VcX5EY=;
 b=BRUYquvxX+Ips8XCzTDWZAGf+6moZe6ZQetvC5bXhlew6UGBwHMyu+LjpA6NaH5S96Lo
 HLkmWdL/0zy0IUt4ww4ogQXDX55GRhtc59DkBedsP/nLXSpUY/HRML/KTBm1Th6OC4zX
 4O/Ap8VLAzDj16z5zivUnBfaGDoZ9BN7y/Q= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xufrv6nfs-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jan 2020 13:38:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jan 2020 13:38:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X++ZDiQVHC/+/uTVz63EqEPzidQ3W1d30tKfFI0YDgY+lSET6IxKe20eFZzL3/mRj4+nCviBEUzMGnsXebx575rCxn3P2Xi8uWpFcyw3j9asbE5RGHC/JhFnzQBABWbD6s0TmQuYh1OZUKySQASUK0D2Bpgha78/KRHvQfm9zwq+QXFoR5Ua9hya4bNKkQlSHR2OlZ5xnSuFMICgroHq5BjO1DKfoZL/YN+Q9wHK7riDcytFi6hSDWPMsDOE4EjzbOcH+W8ut/k5dyMOocuKmIJxdClWKMBKW47T1hLik5mcsBd7n4w2pkDAUs+FGoOdYEBYHsT9XXQCY2cbJInWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN8t1YhWDNEtasZrhzQLKBMvAzVtdjzw86LK1VcX5EY=;
 b=DLK9rgJYpWR/Uhxk8v5hqNeqQFSKGsWvH8z9Dd93RJNaKPVkf8FrePbutXsIvbfjaW7EeFKnQgssEGc9ngPKaH2QrNNcZhU0tjboPIbnWumulJDTMgQLwOZfqkJJxAcjPS4xq1CK3uwnvdj6ZH1zdfu3A6Aq67DcyiwsLhwpwcWBJNZh3isXaxKO3ArH8Om6GyhvkLMKQCmVoh7SL+Qmcuob4vOkGbEncswcUTEfat8HW8tW5NWn7hPUqtyeiQg327DXniqHYxc3FD9NhEdIbWrvzhsu0q8bM0/qIY6cAJxUEI79an+2wkSMxd8saZ92IeXaddEkTYQK1GDfBei9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN8t1YhWDNEtasZrhzQLKBMvAzVtdjzw86LK1VcX5EY=;
 b=Fpqqjsk6uLVj1ZJw0/08a3GGJMd1aVN1zmSisGtOdppUlvVIS+h+6mB/dP8Brr0w1o/HkEuM+f2M4R0E6y5aMSIAYT5ZSC5dc8YoEJeLDMumk5a7xfU2a0m4/esYunarMD9Qa/lJSIl4AS4Y1hqdXjP4D1PZqC2AfKa7AkQvCg4=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1917.namprd15.prod.outlook.com (10.174.98.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Thu, 30 Jan 2020 21:38:19 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 21:38:19 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3ACAAK69gIAABOgA//+HZoCABQhZAP//lXuAgAId0ACAAnzCgIAAARYAgACscID//4GqAA==
Date: Thu, 30 Jan 2020 21:38:19 +0000
Message-ID: <72D25FAF-9E04-4459-90C5-910AD4E59B9D@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
 <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
 <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
 <A81FB058-4102-4774-B238-2C5484BCF938@fb.com>
 <65B9F3C8-1066-449B-B0AE-928ED1455687@fb.com>
 <0e9dbc2f-3dba-ebb7-4acc-28b43cf4e480@linux.intel.com>
In-Reply-To: <0e9dbc2f-3dba-ebb7-4acc-28b43cf4e480@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:ad60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 547d72f8-dd51-4ae7-bb47-08d7a5ccb926
x-ms-traffictypediagnostic: MWHPR15MB1917:
x-microsoft-antispam-prvs: <MWHPR15MB19176DD16017DC78DE396E61DD040@MWHPR15MB1917.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(366004)(376002)(136003)(189003)(199004)(6486002)(6512007)(6506007)(71200400001)(36756003)(478600001)(966005)(2616005)(3480700007)(186003)(86362001)(53546011)(66446008)(110136005)(64756008)(66476007)(66556008)(66946007)(8936002)(8676002)(81166006)(81156014)(5660300002)(76116006)(2906002)(7116003)(33656002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1917;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d1BQ7EKHR7jBjDObuvEP79Y1Vlac11Q/R0n21Oza5/aPye9P9Ydgtxus1xrvrLZCPlxhPMgIt+ymPntdhJZ9lHVsl88iyPFc7scvAucTNNTLp8Gy466tW77qGEcbV0tsTKYm8pIcwXJ8HXN+60fCkHClNEUblBuK501QRMewGbQwBUnxy2sLiLWttiX2yr6lPbJNau2R8PDv2NcOmYAVgWQjYjh9o3sUSF+ChwtUzCKG1fwQGnbmzlWtnO3deGIY5TMCV76jmsSGsLeT8kzNRVf28MryjI1lo8FXlbK5ywTLy1QSKbV1eD9HI1q0CbDRdnDCNETOipoM9OATz1RNezuPX2Bez47JKWXvfZvKZ4K3TMT0hhd+d6lbCClNiu6HbxHj3pq+eCHXK1uiElhV6PmSyU3926mpB6W4NLXjDt4ajTTgCaAEiofSsNyRFB8AZf5NCyDQ9/IDHyb8xXyzOz9LO75fFflUHD/0EC7kf++7v1XJc52KeeiW9xVAHUSuaxXDmepZOYKfjnlZ5zz1rQ==
x-ms-exchange-antispam-messagedata: Nhj9j37igyB9puOhLDR46PXWMATE/V7AnmDBR6QBff3nB+miKTWsPjbVfLnyavTR+n0OXcgPnn6dxbjN9TYARtA+BMNnVDkigrK7nE0cBrNf5JAAo+fpyvhwyHvfBxR615JPpJEv+hgkMaRvU2DCTZYBE9M1MLH4PQdVBjqx7vrYccikQDvjVbbwGwtXV4EH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA0619E2BE03764B9D749C2927D5ACB9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 547d72f8-dd51-4ae7-bb47-08d7a5ccb926
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 21:38:19.2630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykjAzzfgB8fZAPSsdfD7VLp+6YoOZur6soHqT8vC6aVWhFJBCE56vLIvIixX/M8Cn/NhPf3yeHmCatKHdOKHlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1917
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_07:2020-01-30,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300145
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

DQoNCu+7v09uIDEvMzAvMjAsIDE6MTAgUE0sICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmls
bHNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIA0KICAgIA0KICAgIE9uIDEvMzAvMjAy
MCAxMDo1MyBBTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gQW5kIGl0IGlzIGluY29uc2lz
dGVudCBhcyAyIHRpbWVzIHdvcmtzIG91dCBvZiA1IHRpbWUgbG9vcCB3aXRoIDMwIHNlY29uZCBk
ZWxheS4NCiAgICA+IA0KICAgID4gUmVnYXJkcw0KICAgID4gLVZpamF5DQogICAgPiANCiAgICA+
IE9uIDEvMzAvMjAsIDEwOjQ5IEFNLCAiVmlqYXkgS2hlbWthIiA8dmlqYXlraGVta2FAZmIuY29t
PiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgICBIaSBKYXNvbiwNCiAgICA+ICAgICAgVGhlIHBy
b2JsZW0gSSBhbSBzZWVpbmcgYXMgSSBhbSB1bmFibGUgdG8gc2VuZCByZXNldCBpcG1pIGNvbW1h
bmQgdG8gTUUgdmlhIElQTUIgb24gaTJjIGJ1cy4gSSB0cmllZCB0byBnaXZlIDMwIHNlY29uZCBk
ZWxheSBhZnRlciBwb3dlciBvZmYgYW5kIHNldHRpbmcgaW4gTUUgcmVjb3ZlcnkgbW9kZS4gT25j
ZSBJIGRvIGZvcmNlIHBvd2Vyb2ZmIHRoZW4gb25seSBJIGFtIGFibGUgdG8gc2VuZCBhbnkgY29t
bWFuZCB0byBNRS4gSSBkb24ndCBrbm93IHdoYXQgaXMgdGhlIHJlbGF0aW9uIG9mIHBvd2VyIHRv
IE1FIGFjY2VzcyBvbiBpMmMgYnVzLg0KICAgIEkgaGF2ZSBiZWVuIHRvbGQgdGhhdCB0aGlzIGlz
IG5vdCBleHBlY3RlZCBiZWhhdmlvciBhbmQgdGhhdCB5b3UgY2FuIA0KICAgIGZpbGUgYW4gSVBT
IHRpY2tldCBmb3Igc3VwcG9ydC4NCiAgICANCiAgICBUaGUgYmlnZ2VzdCBpc3N1ZSB3aXRoIGZv
cmNlIHBvd2Vyb2ZmIHVzaW5nIHRoZSBwb3dlciBidXR0b24gd2hpbGUgdGhlIA0KICAgIHN5c3Rl
bSBpcyBvZmYgaXMgdGhhdCBpdCB3aWxsIGZpcnN0IHN0YXJ0IGJvb3RpbmcgdGhlIHN5c3RlbSB0
aGVuIA0KICAgIGltbWVkaWF0ZWx5IHNodXQgaXQgZG93biB3aGljaCBpcyBub3QgZGVzaXJlZCBi
ZWhhdmlvci4NCiAgICANCiAgICBXaGF0IGhhcHBlbnMgaWYgeW91IHRyeSB0byBwb3dlciBvbiBp
biB0aGUgZmFpbHVyZT8gIFdpbGwgaXQgZ28gdG8gdGhlIA0KICAgIE9uIHN0YXRlIHdoZXJlIHlv
dSBjYW4gaXNzdWUgYSBGb3JjZU9mZj8NCg0KTm8sIHRoaXMgaXMgYWxzbyBpbnRlcm1pdHRlbnQu
IEFuZCBzb21ldGltZXMgaXQgcG93ZXJzIG9uIGFuZCBzb21ldGltZXMgaXQgZ2V0cyBzdHVjayBv
biBUcmFuc2l0aW9uVG9PbkZhaWxlZC4gVGhpcyBpcyB2ZXJ5IGRhbmdlcm91cyBzdGF0ZSBhcyBu
byBwb3dlciBjb21tYW5kIHdvcmtzIGFmdGVyIHRoaXMsIG5vdCBldmVuIHBvd2Vyb2ZmLiBUaGVu
IEkgaGF2ZSB0byBsZWF2ZSBhIHN5c3RlbSBmb3Igc29tZSB0aW1lIGFuZCB0cnkgbWFueSBvdGhl
ciB0aGluZ3Mgb3Igc2xlZCBjeWNsZSB0aGUgc3lzdGVtLg0KICAgIA0KICAgIFRoYW5rcywNCiAg
ICAtSmFzb24NCiAgICANCiAgICA+ICAgICAgDQogICAgPiAgICAgIFJlZ2FyZHMNCiAgICA+ICAg
ICAgLVZpamF5DQogICAgPiAgICAgIA0KICAgID4gICAgICBPbiAxLzI4LzIwLCAxMjo1MCBQTSwg
IkJpbGxzLCBKYXNvbiBNIiA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
ICAgID4gICAgICANCiAgICA+ICAgICAgICAgIA0KICAgID4gICAgICAgICAgDQogICAgPiAgICAg
ICAgICBPbiAxLzI3LzIwMjAgMTI6MzEgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+ICAg
ICAgICAgID4NCiAgICA+ICAgICAgICAgID4NCiAgICA+ICAgICAgICAgID4gT24gMS8yNy8yMCwg
MTA6NTIgQU0sICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29t
PiB3cm90ZToNCiAgICA+ICAgICAgICAgID4NCiAgICA+ICAgICAgICAgID4NCiAgICA+ICAgICAg
ICAgID4NCiAgICA+ICAgICAgICAgID4gICAgICBPbiAxLzI0LzIwMjAgMjowMSBQTSwgVmlqYXkg
S2hlbWthIHdyb3RlOg0KICAgID4gICAgICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgICAgID4g
ICAgICA+DQogICAgPiAgICAgICAgICA+ICAgICAgPiBPbiAxLzI0LzIwLCAxOjEzIFBNLCAib3Bl
bmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMsIEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlr
aGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNA
bGludXguaW50ZWwuY29tPiB3cm90ZToNCiAgICA+ICAgICAgICAgID4gICAgICA+DQogICAgPiAg
ICAgICAgICA+ICAgICAgPg0KICAgID4gICAgICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgICAg
ID4gICAgICA+ICAgICAgT24gMS8yNC8yMDIwIDEyOjU1IFBNLCBCaWxscywgSmFzb24gTSB3cm90
ZToNCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPg0KICAgID4gICAgICAgICAgPiAgICAg
ID4gICAgICA+DQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAgID4gT24gMS8yNC8yMDIwIDEw
OjI5IEFNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAg
ID4+DQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAgID4+DQogICAgPiAgICAgICAgICA+ICAg
ICAgPiAgICAgID4+IE9uIDEvMjMvMjAsIDQ6MzYgUE0sICJCaWxscywgSmFzb24gTSIgPGphc29u
Lm0uYmlsbHNAbGludXguaW50ZWwuY29tPg0KICAgID4gICAgICAgICAgPiAgICAgID4gICAgICA+
PiB3cm90ZToNCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4NCiAgICA+ICAgICAgICAg
ID4gICAgICA+ICAgICAgPj4gICAgICBPbiAxLzIzLzIwMjAgNDoxMyBQTSwgVmlqYXkgS2hlbWth
IHdyb3RlOg0KICAgID4gICAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgID4gSGkgSmFzb24s
DQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAgID4+ICAgICAgPg0KICAgID4gICAgICAgICAg
PiAgICAgID4gICAgICA+PiAgICAgID4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50IG9mIHBvd2VyIGJ1
dHRvbiBvdmVycmlkZS4gSSBkb27igJl0IHNlZQ0KICAgID4gICAgICAgICAgPiAgICAgID4gICAg
ICA+PiB4ODYtcG93ZXINCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICA+IGNv
bnRyb2wgZG9lc27igJl0IHN1cHBvcnQgdGhpcyBjdXJyZW50bHkuIERvIHlvdSBuZWVkIHRoaXMN
CiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gZmVhdHVyZXMgb3IgZG8NCiAgICA+ICAg
ICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICA+IHlvdSBoYXZlIGFueSBsb2NhbCBwYXRjaCBm
b3IgdGhpcy4NCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICBIaSBWaWpheSwN
CiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICBwb3dlciBidXR0b24gb3ZlcnJp
ZGUgaXMgdXNlZCBmb3IgdGhlICJGb3JjZSBPZmYiIGFjdGlvbnMgaW4NCiAgICA+ICAgICAgICAg
ID4gICAgICA+ICAgICAgPj4gcG93ZXIgY29udHJvbDoNCiAgICA+ICAgICAgICAgID4gICAgICA+
ICAgICAgPj4NCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMveDg2LXBvd2VyLWNvbnRyb2wvYmxvYi9tYXN0ZXIvcG93ZXItY29udHJvbC14
ODYvc3JjL3Bvd2VyX2NvbnRyb2wuY3BwI0w1MC4NCiAgICA+ICAgICAgICAgID4gICAgICA+ICAg
ICAgPj4NCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4NCiAgICA+ICAgICAgICAgID4g
ICAgICA+ICAgICAgPj4gVGhpcyB3aWxsIG5vdCB3b3JrIGlmIGN1cnJlbnQgc3RhdHVzIGlzIG9m
Zi4gVGhpcyBzaG91bGQganVzdCBzZW5kDQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAgID4+
IHB1bHNlIGluIGFueSBzdGF0dXMgb24vb2ZmLg0KICAgID4gICAgICAgICAgPiAgICAgID4gICAg
ICA+IENvcnJlY3QuICBGb3JjZSBPZmYgaXMgbm90IGRvbmUgaWYgdGhlIGN1cnJlbnQgc3RhdHVz
IGlzIG9mZi4NCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgRG8geW91IGhhdmUgbW9yZSBk
ZXRhaWxzIG9uIHRoZSBwb3dlciBidXR0b24gb3ZlcnJpZGUgYmVoYXZpb3IgdGhhdCB5b3UNCiAg
ICA+ICAgICAgICAgID4gICAgICA+ICAgICAgbmVlZD8NCiAgICA+ICAgICAgICAgID4gICAgICA+
DQogICAgPiAgICAgICAgICA+ICAgICAgPiBZZXMsIFRoaXMgaXMgcmVxdWlyZWQgdG8gYnJpbmcg
TUUgYmFjayB0byBvcGVyYXRpb24gbW9kZSBmcm9tIHJlY292ZXJ5LiBIb3cgYXJlIHlvdSBoYW5k
bGluZyBNRSBmb3IgQmlvcyB1cGdyYWRlLg0KICAgID4gICAgICAgICAgPiAgICAgIFdoZW4gaW4g
cmVjb3ZlcnkgbW9kZSwgdGhlIE1FIHdpbGwgYWNjZXB0IGEgcmVzZXQgY29tbWFuZCAoSVBNSSBy
YXcgMHg2DQogICAgPiAgICAgICAgICA+ICAgICAgMHgyKSB0byByZXNldCB0byBvcGVyYXRpb25h
bCBtb2RlLg0KICAgID4gICAgICAgICAgPg0KICAgID4gICAgICAgICAgPiBCaWxsLCBJIHRyaWVk
IHRoaXMgYW5kIHNlZSBpbmNvbnNpc3RlbnQgYmVoYXZpb3IgZnJvbSBob3N0LiBTb21ldGltZSBp
dCByZWZ1c2UgdG8gcG93ZXIgb24uIFNvIFBCTyByZXNvbHZlcyB0aGlzLg0KICAgID4gICAgICAg
ICAgSSBjaGVja2VkIHdpdGggdGhlIE1FIHRlYW0gYW5kIE1FIHJlc2V0IHRvIG1vdmUgZnJvbSBy
ZWNvdmVyeSBtb2RlIHRvDQogICAgPiAgICAgICAgICBvcGVyYXRpb25hbCBtb2RlIHNob3VsZCB3
b3JrLiAgWW91IGNhbiBmaWxlIGEgdGlja2V0IHdpdGggSW50ZWwgc3VwcG9ydA0KICAgID4gICAg
ICAgICAgdG8gaGVscCByZXNvbHZlIHRoZSBpbmNvbnNpc3RlbnQgYmVoYXZpb3IgdGhhdCB5b3Ug
c2VlIHdoZW4gZG9pbmcgdGhpcy4NCiAgICA+ICAgICAgICAgIA0KICAgID4gICAgICAgICAgSW4g
dGhlIG1lYW50aW1lLCBJIHdpbGwgbG9vayBvdmVyIHlvdXIgcGF0Y2guDQogICAgPiAgICAgICAg
ICANCiAgICA+ICAgICAgICAgIFRoYW5rcywNCiAgICA+ICAgICAgICAgIC1KYXNvbg0KICAgID4g
ICAgICAgICAgDQogICAgPiAgICAgICAgICA+DQogICAgPiAgICAgICAgICA+ICAgICAgPg0KICAg
ID4gICAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgID4NCiAgICA+ICAgICAgICAgID4gICAg
ICA+ICAgICAgPj4gICAgICA+IFJlZ2FyZHMNCiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAg
Pj4gICAgICA+DQogICAgPiAgICAgICAgICA+ICAgICAgPiAgICAgID4+ICAgICAgPiAtVmlqYXkN
CiAgICA+ICAgICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICA+DQogICAgPiAgICAgICAgICA+
ICAgICAgPiAgICAgID4+DQogICAgPiAgICAgICAgICA+ICAgICAgPg0KICAgID4gICAgICAgICAg
PiAgICAgID4NCiAgICA+ICAgICAgICAgID4NCiAgICA+ICAgICAgICAgID4NCiAgICA+ICAgICAg
ICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgDQogICAgPiANCiAgICANCg0K
