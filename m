Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1DC1003F
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 21:21:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44trx50jpxzDqSr
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 05:21:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0023ab73f8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="d7y4ZMN5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="CynK6x8V"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44trw64MrnzDqSC
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 05:20:37 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UJI9BY025092; Tue, 30 Apr 2019 12:20:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=60TEQWtBOZdBNcBKIerF7BeiKRBnlhfa8Wab0F3eJ6k=;
 b=d7y4ZMN5TGtlwbh2GA6tqtKGE87Yt9g7pfKGIdSDOaxX0JnjtieECLg1g0vw62riFcOF
 TH5PmhnIADvbR4qsWK2pmiIONZP4Do/28SH+2w/0xs2xbWgzrLC+6lFkwkyggOqc4zxM
 HSgAT8vb4+8/v2XZLs6xz9+dWFA3bBrMzXg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2s6pd69ddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Apr 2019 12:20:29 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 30 Apr 2019 12:20:28 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Apr 2019 12:20:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60TEQWtBOZdBNcBKIerF7BeiKRBnlhfa8Wab0F3eJ6k=;
 b=CynK6x8V7ozq3bbRls071yQ9xVWsUy2OFPY1a/zBmhkMoX1q1S0GLa3nQ9jXz54ASscqgFsN7KRLOCP/WiP3LfJnx68v0IZrLTKr9KHyCEgokDZWvGbX78h2/p4+Qz55l474QClrsCz0jpNRIYhtxJld52Vpr9GNDh2zNfIOab8=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1653.namprd15.prod.outlook.com (10.175.116.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 19:20:26 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 19:20:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
Subject: Re: Phosphor pid control
Thread-Topic: Phosphor pid control
Thread-Index: AQHU/4KY0BYzgrKEY0CYtw90dRuDdKZVBrOA//+Nf4CAAHrEgP//kDKA
Date: Tue, 30 Apr 2019 19:20:26 +0000
Message-ID: <71BFF33B-20DA-428A-979F-A896011142AE@fb.com>
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
 <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
 <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
In-Reply-To: <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::c9a8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c0c626e-f06b-4312-24e4-08d6cda0e69c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1653; 
x-ms-traffictypediagnostic: CY4PR15MB1653:
x-microsoft-antispam-prvs: <CY4PR15MB16536771F2EA911F4F79063BDD3A0@CY4PR15MB1653.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(36756003)(46003)(2906002)(91956017)(86362001)(71190400001)(33656002)(71200400001)(53936002)(97736004)(76176011)(11346002)(446003)(6486002)(83716004)(6116002)(66556008)(93886005)(6512007)(76116006)(82746002)(73956011)(7116003)(64756008)(66946007)(6246003)(66476007)(14454004)(8936002)(81156014)(81166006)(3480700005)(4326008)(66446008)(486006)(6436002)(2616005)(476003)(7736002)(99286004)(186003)(5660300002)(229853002)(8676002)(68736007)(316002)(14444005)(256004)(25786009)(54906003)(478600001)(305945005)(53546011)(6506007)(6916009)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1653;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VKwlMQsOBNn0vwieIeppNtBUhkdF+wDgzIWEG+TBADB3WF0/P9uLfus459BiCNs/mAg24TjKlqKQ7mD3XNj/vFS5Lo/Otk9ZpAiV8hTlZlMNisHVbdDG6H5o881hxwByIXxFKR6DBTHyL1aSc6ncfEawlJ/ziF7DsLW3sZOeEXHzx0f7pFakqese5Hq8aRH7v4N+u9AWsBPoRJ2edZQEsy2WVddZiWz46PVZLl8nSsQFGfkjA28lW3TsUAeDqHVivqc1LyjgLTdbzDfn+6lVZ4RjSVC7glhccGtEesqMADSbXhjBll5DL+L2YOocP2h4B9XqStC58s5OTSwLUF7hpMZQ2rdOij9CDmMX5v6E2+EevYJsCNPigJCaL5XnmXeUTYY9biIO+rHnr7tDe5vhoWd6jNdrvRG1QXWjxhjpUI0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27EA0EDE0D4B624C8686134B4F371365@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0c626e-f06b-4312-24e4-08d6cda0e69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 19:20:26.5486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1653
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300115
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMzAvMTksIDEyOjAxIFBNLCAiUGF0cmljayBWZW50dXJlIiA8dmVudHVyZUBn
b29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDExOjQxIEFN
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBJ
IGNoZWNrZWQgaW4gY29kZSBhbmQgbG9va3MgbGlrZSAvdXNyL3NoYXJlL3N3YW1wZC9jb25maWcu
anNvbiBmaWxlIGlzIG1pc3NpbmcuIFdoZXJlIGRvIHdlIGdldCB0aGlzIGZpbGUgZnJvbSBvciB3
aGVyZSBpcyBleGFtcGxlIGNvbmZpZy5qc29uIGZpbGU/DQogICAgDQogICAgSWYgeW91J3JlIHVz
aW5nIHRoZSBlbnRpdHktbWFuYWdlciB0byBjb25maWd1cmUgaXQsIHlvdSB3b250JyBuZWVkDQog
ICAgdGhhdCBmaWxlLCBidXQgeW91IHdpbGwgbmVlZCB0byB0ZWxsIHN3YW1wZCB0aGF0IGl0J3Mg
aW4gdGhhdCBtb2RlDQogICAgZHVyaW5nIGNvbmZpZ3VyYXRpb24uDQogICAgDQogICAgWW91IGNh
biBhZGQgdGhpcyB0byB5b3VyIHN3YW1wZF8lLmJiYXBwZW5kOg0KICAgIA0KICAgIEVYVFJBX09F
Q09ORl9hcHBlbmQgPSAiIC0tZW5hYmxlLWNvbmZpZ3VyZS1kYnVzIg0KWWVzIGl0IGlzIGVuYWJs
ZWQgaW4gcmVjaXBlcy1waG9zcGhvci9mYW5zL3Bob3NwaG9yLXBpZC1jb250cm9sXyUuYmJhcHBl
bmQgZmlsZS4NCiAgICANCiAgICA+DQogICAgPiBPbiA0LzMwLzE5LCAxMTozMSBBTSwgIlBhdHJp
Y2sgVmVudHVyZSIgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gICAg
ICtKYW1lcyBGZWlzdCB0byBwcm92aWRlIGFzc2lzdGFuY2UuDQogICAgPg0KICAgID4gICAgIE9u
IFR1ZSwgQXByIDMwLCAyMDE5IGF0IDExOjMwIEFNIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FA
ZmIuY29tPiB3cm90ZToNCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBJIGhhdmUgZW5hYmxlZCBw
aG9zcGhvci1waWQtY29udHJvbCBpbiBteSBpbWFnZSBhbmQgSSBzZWUgZm9sbG93aW5nIGxvZw0K
ICAgID4gICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPg0KICAgID4gICAgID4gQXByIDEy
IDIzOjIyOjQzIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBTdGFydGVkIFBob3NwaG9yLVBpZC1Db250
cm9sIE1hcmdpbi1iYXNlZCBGYW4gQ29udHJvbCBEYWVtb24uDQogICAgPiAgICAgPg0KICAgID4g
ICAgID4gQXByIDEyIDIzOjIyOjQ2IHRpb2dhcGFzcyBzd2FtcGRbMTA3Ml06IHRlcm1pbmF0ZSBj
YWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3N0ZDo6cnVudGltZV9lcnJvcicN
CiAgICA+ICAgICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjI6NDYgdGlvZ2FwYXNzIHN3YW1w
ZFsxMDcyXTogICB3aGF0KCk6ICBPYmplY3RNYXBwZXIgQ2FsbCBGYWlsdXJlDQogICAgPiAgICAg
Pg0KICAgID4gICAgID4gQXByIDEyIDIzOjIzOjA0IHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBbWzA7
MTszOW1bWzA7MTszMW1bWzA7MTszOW1waG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBNYWlu
IHByb2Nlc3MgZXhpdGVkLCBjb2RlPWtpbGxlZCwgc3RhdHVzPTYvQUJSVFtbMG0NCiAgICA+ICAg
ICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MDQgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFtb
MDsxOzM5bVtbMDsxOzMxbVtbMDsxOzM5bXBob3NwaG9yLXBpZC1jb250cm9sLnNlcnZpY2U6IEZh
aWxlZCB3aXRoIHJlc3VsdCAnc2lnbmFsJy5bWzBtDQogICAgPiAgICAgPg0KICAgID4gICAgID4g
QXByIDEyIDIzOjIzOjEzIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBwaG9zcGhvci1waWQtY29udHJv
bC5zZXJ2aWNlOiBTZXJ2aWNlIFJlc3RhcnRTZWM9NXMgZXhwaXJlZCwgc2NoZWR1bGluZyByZXN0
YXJ0Lg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEFwciAxMiAyMzoyMzoxMyB0aW9nYXBhc3Mg
c3lzdGVtZFsxXTogcGhvc3Bob3ItcGlkLWNvbnRyb2wuc2VydmljZTogU2NoZWR1bGVkIHJlc3Rh
cnQgam9iLCByZXN0YXJ0IGNvdW50ZXIgaXMgYXQgMS4NCiAgICA+ICAgICA+DQogICAgPiAgICAg
PiBBcHIgMTIgMjM6MjM6MTYgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFN0b3BwZWQgUGhvc3Bob3It
UGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERhZW1vbi4NCiAgICA+ICAgICA+
DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MTYgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFN0YXJ0
ZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERhZW1vbi4N
CiAgICA+ICAgICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MTcgdGlvZ2FwYXNzIHN3YW1w
ZFsxMTQ1XTogTm8gZmFuIHpvbmVzLCBhcHBsaWNhdGlvbiBwYXVzaW5nIHVudGlsIHJlYm9vdA0K
ICAgID4gICAgID4NCiAgICA+ICAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9nYXBhc3Mgc3dhbXBk
WzExNDVdOiBOZXcgY29uZmlndXJhdGlvbiBkZXRlY3RlZCwgcmVzdGFydGluZw0KICAgID4gICAg
ID4NCiAgICA+ICAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9nYXBhc3Mgc3dhbXBkWzExNDVdOiAu
DQogICAgPiAgICAgPg0KICAgID4gICAgID4gQXByIDEyIDIzOjIzOjI3IHRpb2dhcGFzcyBzeXN0
ZW1kWzFdOiBwaG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBTdWNjZWVkZWQuDQogICAgPiAg
ICAgPg0KICAgID4gICAgID4gQXByIDEyIDIzOjIzOjMyIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBw
aG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBTZXJ2aWNlIFJlc3RhcnRTZWM9NXMgZXhwaXJl
ZCwgc2NoZWR1bGluZyByZXN0YXJ0Lg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEFwciAxMiAy
MzoyMzozMiB0aW9nYXBhc3Mgc3lzdGVtZFsxXTogcGhvc3Bob3ItcGlkLWNvbnRyb2wuc2Vydmlj
ZTogU2NoZWR1bGVkIHJlc3RhcnQgam9iLCByZXN0YXJ0IGNvdW50ZXIgaXMgYXQgMi4NCiAgICA+
ICAgICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MzMgdGlvZ2FwYXNzIHN5c3RlbWRbMV06
IFN0b3BwZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERh
ZW1vbi4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MzMgdGlvZ2FwYXNz
IHN5c3RlbWRbMV06IFN0YXJ0ZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZh
biBDb250cm9sIERhZW1vbi4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6
MzQgdGlvZ2FwYXNzIHN3YW1wZFsxMTgzXTogTm8gZmFuIHpvbmVzLCBhcHBsaWNhdGlvbiBwYXVz
aW5nIHVudGlsIHJlYm9vdA0KICAgID4gICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPg0K
ICAgID4gICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBJIGhhdmUgY29uZmlndXJhdGlv
biBkZWZpbmVkIHRocm91Z2ggZW50aXR5IG1hbmFnZXIuIFdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRv
IGRlYnVnIHRoaXMgYW5kIG1vZGlmeSBjb25maWd1cmF0aW9ucy4NCiAgICA+ICAgICA+DQogICAg
PiAgICAgPg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IFJlZ2FyZHMNCiAgICA+ICAgICA+DQog
ICAgPiAgICAgPiAtVmlqYXkNCiAgICA+DQogICAgPg0KICAgIA0KDQo=
