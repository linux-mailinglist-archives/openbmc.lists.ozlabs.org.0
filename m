Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C917E17
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:29:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zhlH3Qn3zDqJ5
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 02:29:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=003117c9a5=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="oE0OkWMV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gGjTR3B6"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zhkL6LhbzDq77
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 02:28:53 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x48GO58Z005000;
 Wed, 8 May 2019 09:27:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LXC9xzyTzF+dLf2hs2JLuwcfMhpL6p1qXFvfmnPurOU=;
 b=oE0OkWMVkGOfR4LJeuSHMHLluSRujl15RCiF7x/OOirxmFL4WHIviMBVJokuTVUikrDp
 DXFAdKxvq0OiMOAYA7kv40ptJGOZPLhUmJHi/EmOupo9PORDJije1NVwhm3TJLNHB8pt
 uz06hciDRnSUoa3U00mAHhKky78/cmtRuJo= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2sbyxarnk0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 08 May 2019 09:27:43 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 8 May 2019 09:27:43 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 8 May 2019 09:27:43 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 8 May 2019 09:27:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXC9xzyTzF+dLf2hs2JLuwcfMhpL6p1qXFvfmnPurOU=;
 b=gGjTR3B6wcFa0q7T/PG1bEbu5NG6jf6HrEqYFaRQeTJyM2TUzrXU7EHhSo4Ldlnq1I4DRNCQrijnAqYNcuUxBpSLNU5tUR13dN44KRsfV2PrAakOLJdgHso9keK225lbGpPdF3NDLS0MkLEYnopuZijkxrUk/hVdkH+oYdIg1w8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1663.namprd15.prod.outlook.com (10.175.141.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 16:27:41 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ada9:e958:5d54:7a9c]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ada9:e958:5d54:7a9c%9]) with mapi id 15.20.1878.019; Wed, 8 May 2019
 16:27:41 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Moving kernel to 5.1
Thread-Topic: Moving kernel to 5.1
Thread-Index: AQHVBXhLJc6qMqat9UCOinZkOdit06Zg9Z8A
Date: Wed, 8 May 2019 16:27:41 +0000
Message-ID: <B239B4B9-7F53-4F77-B794-46810815FE8D@fb.com>
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
In-Reply-To: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.18.0.190414
x-originating-ip: [2620:10d:c090:180::dc53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e24350b-bbb5-4222-df90-08d6d3d217e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR15MB1663; 
x-ms-traffictypediagnostic: MWHPR15MB1663:
x-microsoft-antispam-prvs: <MWHPR15MB1663856E731EE098E4453069B2320@MWHPR15MB1663.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(53546011)(4744005)(36756003)(8936002)(256004)(6506007)(66446008)(66556008)(64756008)(66476007)(76176011)(2616005)(46003)(476003)(6512007)(86362001)(6246003)(81156014)(186003)(4326008)(6116002)(229853002)(81166006)(53936002)(71190400001)(2906002)(8676002)(73956011)(66946007)(102836004)(76116006)(83716004)(71200400001)(99286004)(54906003)(7116003)(446003)(7736002)(14454004)(68736007)(305945005)(5660300002)(14444005)(478600001)(110136005)(6486002)(11346002)(25786009)(33656002)(316002)(486006)(58126008)(6436002)(82746002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1663;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CPyFVTutT1OkGCqU04/B7CZhsWAtdhDrewS7FR4oJzWNbflY920xa4NQ1wIO/YgJ5Olm1L58a5mVKqHYQUmgUokr5JQ0k/KVepv3xqcYU5op+WU0l67osNGyDJZNOfrSdGEgmR3NaGY7sFSoCV1u5vgBLAiz7SR+wm/uMUsd68wGM/HOUhHeymcFiYGto+ZeMifxByI7LCLpP+uI2WrDcbmidDdTI47PGwtw7xs1UH06kbeWCKXM8tpkpoWbR5MaSVgeQOVKYpMTZvVeBYNWV7Z6z3dKotXFoq7HwwECMgdN4AJRfpZsQgA632w6VPRiTW2Y9x5v1JvJTZjub3wCYOAo56pSKNJdlTTK21jLTrTQi8so8w+n/bTk/8VQA+cYxxPEwullqjFYR3ChQ3Ame+RaGvWiYLI6hjGIw1Wwb8g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9478A13764FB144A412818A5491B538@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e24350b-bbb5-4222-df90-08d6d3d217e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 16:27:41.5365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1663
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNS84LzE5LCAxOjMwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9lbCBTdGFubGV5IiA8
b3BlbmJtYy1ib3VuY2VzK3Rhb3Jlbj1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYg
b2Ygam9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQo+IExpbnV4IDUuMSB3YXMgdGFnZ2VkIGEgZmV3
IGRheXMgYWdvLiBJJ3ZlIHJlYmFzZWQgdGhlIG9wZW5ibWMgdHJlZSBvbg0KPiB0aGlzIHJlbGVh
c2UgYW5kIHB1c2hlZCBhIGRldi01LjEgYnJhbmNoIHRvIGdpdGh1Yi4NCj4gDQo+IFBsZWFzZSB0
YWtlIGEgbG9vayBhdCB0aGUgYnVtcCBjb21taXQsIGdpdmUgaXQgYSBzcGluIG9uIHlvdXINCj4g
aGFyZHdhcmUsIGFuZCArMSBpZiBpdCBsb29rcyBnb29kIHRvIHlvdToNCg0KVGhhbmsgeW91IEpv
ZWwgZm9yIHRoZSB1cGRhdGUuIExldCBtZSBib290IHVwIHRoZSA1LjEgdHJlZSBvbiBteSBCTUMg
YW5kIHdpbGwgbGV0IHlvdSB0aGUgcmVzdWx0IHNvb24uDQoNCg0KPiAqIGFzcGVlZCBzcGktbm9y
IGRyaXZlcjogdXBzdHJlYW0gaGFzIGFza2VkIHVzIHRvIHJlLXdyaXRlIHVzaW5nIHRoZQ0KPiBz
cGktbWVtIGZyYW1ld29yay4gQ2VkcmljIHBsYW5zIHRvIHdvcmsgb24gdGhpcyB3aGVuIGhlIGhh
cyB0aW1lLg0KDQpEb2VzIGl0IG1lYW4gd2UgYXJlIGdvaW5nIHRvIGNyZWF0ZSBzcGkgY29udHJv
bGxlciBkcml2ZXIgdW5kZXIgIi9kcml2ZXJzL3NwaSIgd2hpY2ggc3VwcG9ydHMgYm90aCBzcGkt
cmF3IGFuZCBzcGktbm9yIHRyYW5zYWN0aW9ucz8NCkkgd2FzIGFib3V0IHRvIGFzayB0aGUgcXVl
c3Rpb24gYmVjYXVzZSBJIGhhdmUgc29tZSBub24tc3BpLW5vciBkZXZpY2VzIGNvbm5lY3RlZCB0
byBhc3BlZWQgc3BpIGNvbnRyb2xsZXIsIGFuZCBJIGhhZCB0byBjcmVhdGUgYSBsb2NhbCBzcGkg
Y29udHJvbGxlciBkcml2ZXIgdG8gdW5ibG9jayBtZSBmcm9tIG1vdmluZyBmb3J3YXJkLg0KDQoN
CkNoZWVycywNCg0KVGFvDQogICAgDQoNCg==
