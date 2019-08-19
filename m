Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770B95040
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 23:56:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C76h4D9yzDqqJ
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 07:56:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3134769992=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Fv1VIhq0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dCBxnGbE"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C75z5nGnzDqXP
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 07:55:50 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JLreeH016904; Mon, 19 Aug 2019 14:55:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=g8aWv+h/SsDJ421g2mmCiaYPRJdIjxo7p/OTGgHPHlg=;
 b=Fv1VIhq04303bNcSxov/dv3OC7cYL3hedk4cr3DUGq3i9urH8T5LjqTR5s2wjn/6x7O0
 4+F3kYRoHPlQxFGLaqg+fWp9ngZ6KNwR2YziDieLTHkvToBQoKUkF6+OdbA9kWXGJht9
 eqG2CIdkquKi37BJb3cTAinHXMHn7eZjXcc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ug1940st7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 14:55:43 -0700
Received: from prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 19 Aug 2019 14:55:41 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 19 Aug 2019 14:55:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 19 Aug 2019 14:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgylaBHRkqIlwtv71ewOXpdvAkTrT72cdu0/oUxW0L7D5FI368LmwujebhKMRyFa3ZyQIGZXZgqz79MsotxjlFi1oYSezKozvcoZzVdFAdna7Zlo1EHmO97O7aLyfcvLzt5+Bp1uS25PC5IkSTY9Pf1yKhfDg2RcGwrJCJouX+X7j3Bseta9SLblVhMcfnWnKD1kEv/tEWJOmUuv5rz1eLKo7skcFjh42sfM8uamN6KoZ9RuKFQ0AhTP/FX6rQMTFJ6FosZSXr+MNEYt/8EAv6NRDTiRH9tO33VzrGh66TzCsG9NsTDcJxu7QGEi/79x9IOTLZyW2QFZ4ZgQMVoohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8aWv+h/SsDJ421g2mmCiaYPRJdIjxo7p/OTGgHPHlg=;
 b=XLdmvx7WcoCxXRB4hXGNVrAOD3hOjhZcIlsyN6MbNArNZxX+08UnHvO1gnLtEsIJ6rM5a8KLA0mKq2JZVo/XKMolA8mzvl787Y3CZILASpI0h7Tfv0BzcVjftOoBAG0y4vioKhCuCueV0kbqVGZRnEfsEZmwvhJZaDjTXZgf2FKok3dRJm1qriYFOMWvCyohYCHHP8kWptvSMsRl1CxwUxJ7UlnMscDH4m86lR4E1lwLFULutoo1SiwfIquZ+sk/iuuvDQAKcgv5D22tgZfPn7+BZBB1PKZD+NkS3SUxCn8RugJ9qXiFFDA1ythmB/ohUDNp5r5n3z1Go/i7B+hZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8aWv+h/SsDJ421g2mmCiaYPRJdIjxo7p/OTGgHPHlg=;
 b=dCBxnGbExM5P9LIR+tvsCNDfxcHQ58Y12bATbLJwBDO+qAmdztV3FRZpmXwcmix5m9F8SwO7/3gx8coJoK+TFhiyp8Yc0WWOCkCpmGuQY+QsNwgBTVW8VBej5Q/Okbj3ZAa6khJcIre8Nkde41hHdVLDuNWc85Zmi/mMIQnHor4=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 21:55:39 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 21:55:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>, Harry Sung1 <hsung1@lenovo.com>
Subject: Re: [External] Re: ipmitool FRU write question
Thread-Topic: [External] Re: ipmitool FRU write question
Thread-Index: AQHVVFzV+6eanr+jzE+Yoot8AQjEyacCk5qA
Date: Mon, 19 Aug 2019 21:55:39 +0000
Message-ID: <4ACC3BDB-7E8D-4A4E-BBA7-A7B281A705C2@fb.com>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
 <CAO=notyjqi2m5LRDqRjSkTpYBmu5m_wr4JQnBeU8Vifg9_zLzw@mail.gmail.com>
In-Reply-To: <CAO=notyjqi2m5LRDqRjSkTpYBmu5m_wr4JQnBeU8Vifg9_zLzw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2b1d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fe4eaec-1ab5-419a-5de4-08d724eff977
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1269; 
x-ms-traffictypediagnostic: CY4PR15MB1269:
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <CY4PR15MB12692D0B276C0CCCB8BDFF70DDA80@CY4PR15MB1269.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(39860400002)(376002)(199004)(189003)(71190400001)(6512007)(2906002)(229853002)(71200400001)(6306002)(316002)(25786009)(478600001)(81156014)(53936002)(476003)(446003)(2616005)(11346002)(186003)(256004)(33656002)(14444005)(486006)(966005)(86362001)(7736002)(305945005)(14454004)(8676002)(8936002)(81166006)(76176011)(6506007)(110136005)(54906003)(66476007)(99286004)(76116006)(46003)(91956017)(66946007)(53546011)(6116002)(5660300002)(102836004)(4326008)(66556008)(6486002)(6436002)(6246003)(66446008)(64756008)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1269;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UikvivjhRhrFrpPfzseVELPb8aRvPFuWlC33kCIp+09NhWYs7bfraBkIJFTVXA57YR0gV5KSEtXjjRCIgi2EN0YBPhXiYrd82ll5tfexSkPPzyhXo49QeTh8Os3XFjmtmyZ3mKEVcMnZ3iR9Mi1o9FJpsB9D/AeGFqqK3i7dTyYtJxTcxAy0FeUtsg/ldLEkWbESHOmF9oeFBenX8Je9plsyBKTtMe4hL3ZyF0S2uWE/fNa3KQX2CsqRMwHbv79sqHXnY/pnypZDwMM5B+BUCkhqXFSAAQUCwX1mNqS+aTmfzcB8pgsn+XMsX56PT+VYgd0Leo5wJgTRRkQ2ejduAO/XkaBI+f2LIhrcCn2ZvhTBfUbwxW0HphcBGzICFy5pBG0Z6nu95q2WOSLPjdFFWXjJKF2L+MbazSOWeepxzX0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE19EE10F251B9458A01187BE6DDF3D1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe4eaec-1ab5-419a-5de4-08d724eff977
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 21:55:39.6718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBq7AB+iS3asb8uzL+cj9F6szT+OCsvLToS9SJ76f2pw9psDWTIWu2vDDmGedvprx/bqIq1XhF+Px6Jw4gmxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1269
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190218
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDgvMTYvMTksIDExOjAyIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgUGF0cmlj
ayBWZW50dXJlIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiB2ZW50dXJlQGdvb2dsZS5jb20+IHdyb3RlOg0KDQogICAgT24g
RnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6NDcgQU0gSGFycnkgU3VuZzEgPGhzdW5nMUBsZW5vdm8u
Y29tPiB3cm90ZToNCiAgICA+DQogICAgPg0KICAgID4gPiBPbiA4LzE1LzE5IDY6NDkgQU0sIEhh
cnJ5IFN1bmcxIHdyb3RlOg0KICAgID4gPiA+IEhpIFRlYW0sDQogICAgPiA+ID4NCiAgICA+ID4g
Pg0KICAgID4gPiA+DQogICAgPiA+ID4gQ3VycmVudCBwaG9zcGhvci1ob3N0LWlwbWlkIGRvZXMg
bm90IHN1cHBvcnQgZnJ1IHdyaXRlIGNvbW1hbmQsIGJ1dA0KICAgID4gPiA+IGlwbWktZnJ1LXBh
cnNlciBzdXBwb3J0cyBpdC4NCiAgICA+ID4gPg0KICAgID4gPiA+IFdlIGZvdW5kIHRoaXMgZnJ1
IHdyaXRlIGNvbW1hbmQgb25seSB1cGRhdGUgdGhlIGRhdGEgdG8gZGJ1cw0KICAgID4gPiA+IGlu
dmVudG9yeSwgYnV0IGRvZXNuJ3Qgc3luYyB0aGUgZGF0YSBiYWNrIHRvIHRoZSBFRVBST00uDQog
ICAgPiA+ID4NCiAgICA+ID4gPiBEb2VzIGlwbWktZnJ1LXBhcnNlciBoYXMgYW55IHBsYW5zIHRv
IGltcGxlbWVudCBpdD8gSSB0aGluayBpdCBpcyBtb3JlDQogICAgPiA+ID4gbWFrZSBzZW5zZSB0
byBzeW5jIHRoZSBkYXRhIHRvIEVFUFJPTSB3aGVuIHdlIGRvIGZydSB3cml0ZS4NCiAgICA+ID4N
CiAgICA+ID4gVGhlIGFsdGVybmF0aXZlIEZSVSBkYWVtb24gZnJvbSBlbnRpdHkgbWFuYWdlciwg
RnJ1RGV2aWNlLCBzdXBwb3J0cyB3cml0aW5nDQogICAgPiA+IHRoZSBGUlUgZGlyZWN0bHkuDQog
ICAgPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5hZ2VyL2Jsb2IvbWFz
dGVyL3NyYy9GcnVEZXZpY2UuY3BwDQogICAgPiA+DQogICAgPiA+IEhhcHB5IHRvIHNlZSB0aGlz
IGNhcGFiaWxpdHkgYWRkZWQgdG8gaXBtaS1mcnUtcGFyc2VyLCBidXQgeW91IG1pZ2h0IGJlIGFi
bGUgdG8NCiAgICA+ID4gbW9kZWwgaXQgb2ZmIEZydURldmljZS4gIElmIHlvdSB3YW50IHRvIHVz
ZSBGcnVEZXZpY2UgYXMtaXMsIHlvdSB3aWxsIG5lZWQgdGhlDQogICAgPiA+IGFsdGVybmF0aXZl
IEZydVdyaXRlIGNvbW1hbmQgc2V0cyBmcm9tIGhlcmUuDQogICAgPiA+DQogICAgPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2ludGVsLWlwbWktb2VtL2Jsb2IvMTU5NTQ3Y2RmYmYxOTky
NzM3ZGNlY2INCiAgICA+ID4gY2IzODg4YWY3Nzk1ZjkzMGIvc3JjL3N0b3JhZ2Vjb21tYW5kcy5j
cHAjTDMxNg0KICAgID4gPg0KICAgID4gPiBBcyB3cml0dGVuLCB0aG9zZSBjb21tYW5kcyBjaGFu
Z2UgdGhlIGJlaGF2aW9yIGEgYml0LCBhbmQgZG91YmxlIGJ1ZmZlcnMgdGhlDQogICAgPiA+IEZS
VSB3cml0ZSBjb21tYW5kcy4gIFdoZW4gdGhlIGxhc3QgRnJ1IHdyaXRlIGlzIHNlbnQsIHRoZSBk
YXRhIGlzIGZsdXNoZWQNCiAgICA+ID4gdGhyb3VnaCB0aGUgRlJVIHBhcnNlciB0byBlbnN1cmUg
dGhhdCBpdCdzIHZhbGlkLCBhbmQgdGhlIHVzZXIgaXNuJ3QgZG9pbmcNCiAgICA+ID4gYW55dGhp
bmcgbmVmYXJpb3VzIChsaWtlIGNoYW5naW5nIGEgcHJvZHVjdCBuYW1lIG9yIHNlcmlhbA0KICAg
ID4gPiBudW1iZXIpIGJlZm9yZSBpdCB3cml0ZXMgdGhlIEVFUFJPTSBpbiBvbmUgY2h1bmssIGFz
IHF1aWNrbHkgYXMgaXQgY2FuIHRvDQogICAgPiA+IHJlZHVjZSB0aGUgcG9zc2liaWxpdHkgb2Yg
YSBoYWxmIHdyaXR0ZW4gRUVQUk9NLg0KICAgID4NCiAgICA+IEhpIEVkLA0KICAgID4NCiAgICA+
IFRoYW5rcyBmb3IgeW91ciBraW5kbHkgcmVwbHkhIEkgaGF2ZSBzdXJ2ZXllZCB0aGUgZW50aXR5
LW1hbmFnZXIgYmVmb3JlLg0KICAgID4gQnV0IEkgZW5jb3VudGVyZWQgYW4gaXNzdWUgd2hlbiBJ
IHVzaW5nIHBob3NwaG9yLWludmVudG9yeS1tYW5hZ2VyIGFuZCBlbnRpdHktbWFuYWdlciBhdCB0
aGUgc2FtZSB0aW1lLg0KICAgID4gQm90aCBvZiB0aGVtIGhhdmUgc2FtZSBtZXRob2QgIk5vdGlm
eSIgdW5kZXIgc2FtZSBpbnRlcmZhY2UgIiB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5N
YW5hZ2VyICIsIGJ1dCBkaWZmZXJlbnQgc2lnbmF0dXJlLg0KICAgIA0KICAgIGh0dHBzOi8vdXJs
ZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMt
MkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfaXBtaS0yRGZydS0yRHBhcnNlcl8tMkJfMjIwMjImZD1E
d0lCYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5D
Ujgwdlhra2NySWFxVTdVU2w1ZyZtPVM5dEM5WGYyTlNMVHlISkNGVGw2b0lPNDJMcGRocnRud1hi
SDBWc3NDa0kmcz1QODBWVG9mMFQ5YXNwLWtRNHFyOW1jRVkxWTNtS1RmVmotYnp0eDUtM19vJmU9
IA0KICAgIA0KICAgIFRoaXMgcGF0Y2ggYWRkcmVzc2VzIHBhcnQgb2YgaXQuDQogICAgDQogICAg
Pg0KICAgID4gcGhvc3Bob3ItaW52ZW50b3J5LW1hbmFnZXI6DQogICAgPiBOQU1FICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEUgICAgU0lHTkFUVVJFICAgUkVTVUxUL1ZBTFVF
ICAgRkxBR1MNCiAgICA+IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lk1hbmFnZXIgaW50
ZXJmYWNlIC0gICAgICAgICAgICAgLSAgICAgICAgICAgICAtDQogICAgPiAuTm90aWZ5ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1ldGhvZCAgICBhe29he3Nhe3N2fX19IC0gICAgICAg
ICAgICAgLQ0KICAgID4NCiAgICA+IGVudGl0eS1tYW5hZ2VyDQogICAgPiBOQU1FICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEUgICAgU0lHTkFUVVJFICAgUkVTVUxUL1ZBTFVF
ICAgRkxBR1MNCiAgICA+IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lk1hbmFnZXIgaW50
ZXJmYWNlIC0gICAgICAgICAtICAgICAgICAgICAgLQ0KICAgID4gLk5vdGlmeSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtZXRob2QgICAgYXtzYXtzdn19IC0gICAgICAgICAgICAtDQog
ICAgPg0KICAgID4gU28gd2hlbiBzb21lIHNlcnZpY2VzIGNhbGwgdGhlICdOb3RpZnknIG1ldGhv
ZCBmYWlsZWQgYmVjYXVzZSBvZiBnZXR0aW5nIHdyb25nIHNlcnZpY2UuDQogICAgPiBFeDogaHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaXBtaS1mcnUtcGFyc2VyL2Jsb2IvbWFzdGVyL3dyaXRl
ZnJ1ZGF0YS5jcHAjTDIwNg0KICAgID4gSGF2ZSB5b3UgZXZlciBzZWVuIHRoaXMgaXNzdWUgYmVm
b3JlPw0KICAgIA0KICAgIEkndmUgYWRkcmVzc2VkIHBhcnQgb2YgdGhpcyBpc3N1ZSBpbiBwaG9z
cGhvci1ob3N0LWlwbWlkLCBub3cgaXQgbm8NCiAgICBsb25nZXIgYXNzdW1lcyB0aGUgRlJVJ3Mg
b3duZXIuDQogICAgU2VlIHBhdGNoZXMgcmVsYXRlZCB0bzoNCiAgICANCiAgICBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkL2NvbW1pdC80NWU5M2NiYWUwYWEw
ZDBmNTM4NWQ0MGY1Njg1YjIzZTE4Zjk1MzUxDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvcGhvc3Bob3ItaG9zdC1pcG1pZC9jb21taXQvYzI2Y2M3MTdhNGVlZjE4ZmZmYzFjYTg5MWJi
NmE2MDE1NzQwYmY5Zg0KICAgIA0KICAgID4NCiAgICA+IFNob3VsZCBJIHVzZSBpbnRlbC1kYnVz
LWludGVyZmFjZXMgaWYgSSB3YW50IHRvIHVzZSBGcnVkZXZpY2UgKGVudGl0eS1tYW5hZ2VyKSBh
bmQgd3JpdGUgRlJVIGNvbW1hbmQoaW50ZWwtaXBtaS1vZW0pPw0KICAgID4gT3IgaXQgaXMgY29t
cGF0aWJsZSB3aXRoIG9yaWdpbmFsIGRidXMtaW50ZXJmYWNlPw0KICAgIA0KICAgIFlvdSB1c2Ug
Ym90aC4NClBhdHJpY2ssIEkgYW0gbm90IHVzaW5nIGludGVsLWRidXMtaW50ZXJmYWNlcywgb25s
eSB1c2luZyBkYnVzLXNlbnNvcnMuIFdoYXQgaXMgdGhlIHVzZSBvZiBpbnRlbC1kYnVzLWludGVy
ZmFjZXM/DQogICAgDQogICAgPg0KICAgID4gVGhhbmtzLA0KICAgID4gSGFycnkNCiAgICANCg0K
