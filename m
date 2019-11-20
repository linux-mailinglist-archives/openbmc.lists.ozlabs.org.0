Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB94104311
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 19:13:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J9mC47B7zDqt0
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 05:13:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6227b5757c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iBRqlWsU"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="bALcBaAf"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J9hP6N9SzDqcT
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 05:09:55 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xAKI9Keg005674;
 Wed, 20 Nov 2019 10:09:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=dwxHrb8pSTgt+H9vocQjLZ5Lb6jBh/RJIwrSs/3guOg=;
 b=iBRqlWsU0muxLfS9Xha8NwrXPESinhB6xPikE39A5PjUqoiKIksj9H9BS1kLOj81SX9N
 go2wDcLOVcUg9HvFmHFTpDWiz6uDybPdYLg+2xTcbeZZ3uWumYl6RS+VzucJl1ctwnwv
 etP/xvGDS6jiWTCUSUbfY0fln4kFfn6gEwg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2wd63q1dm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 10:09:20 -0800
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 20 Nov 2019 10:08:43 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 20 Nov 2019 10:08:42 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 20 Nov 2019 10:08:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2l0dAIDo2ZkGhmK3dgWDofCaMaYFwj+0HmQ2OZTDbeaHscierq+G2Gb+cDsgmsbAVMd5wlCWVBzkN0J9clKb9by9rfr/5ca9GJvseBF3DYmtbjuIoBYmnPtKxNGwBn0ARqgsv3xH0gcvWQOSK6Od2MgPjXpylhiwOf55+CxI8apWTtjqhG6CNVpCIbxLhhuKwermjeTrt+2Say/sRakCx8hYsllVpVoUHvRSq02JwdUcL3mfZX3GJ7uFxQyZ9BoaQYCU732UibX0uXZkxiGM7elc8ERrJPUbxwEK1hH+cxqgs7JGqJxDUNFye8HupWuRVVqX28mEnyr7C1TiG1fRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwxHrb8pSTgt+H9vocQjLZ5Lb6jBh/RJIwrSs/3guOg=;
 b=S4/M0WBkBfldsinqiW8PYVCjxfr9D6r62qlW93DOnvF42h+cNmww4eWKLoR5vLW9xLp52LUbeaR9C3On4HRfUjbzpQIcsHyahyD1RL1nYarRCYX3Wa9WySJxZFftEEc8edHgE7W80QgZYqrMHGFM0DkBEK8urZ86mIfi+5kkwjzXs0nABdk+OuVC7gNMjHJPrtlXdz5o5OISkAYe4F2RVtOyblBMhAt/tozuNkBH+HsTrvpzQOFJtnu6aTbBXFonYr90JGVg7erwizq3Vt4nnLtquy8XYZ34mPugvLTIf7feu1/sYzD78kIQDKThv8YFijUptssx57M0rfZM/eyTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwxHrb8pSTgt+H9vocQjLZ5Lb6jBh/RJIwrSs/3guOg=;
 b=bALcBaAfFnD785Y4ZzWbmSc634yI8s81K+7NpkL5Sf/RjoDhDTinb0GpPgEv7HpcoY2iMb/9eIsWNUclcv0Qz24uw+4nyyWAFs4+Q5T0MTKxD6pwwaQqhtAwqTxTf7ZvM8Q+tBzQfgcOsE9shqIZaY0QtqTib725H7xfNmh5kxw=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3556.namprd15.prod.outlook.com (52.133.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Wed, 20 Nov 2019 18:08:40 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 18:08:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, www <ouyangxuan10@163.com>
Subject: Re: Add build date to image
Thread-Topic: Add build date to image
Thread-Index: AQHVn8EwsAJJV1fgb0SFW7b+GvaubKeT1XQA
Date: Wed, 20 Nov 2019 18:08:40 +0000
Message-ID: <C7E32DAD-2454-4AF6-89C4-630DBC6898D9@fb.com>
References: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
 <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
 <136be35a.269c.16e7c360818.Coremail.ouyangxuan10@163.com>
 <17d14e7a-1dc8-3375-a8a6-ea61c60e3bb7@linux.ibm.com>
 <67ca8d1c.28cc.16e8141d457.Coremail.ouyangxuan10@163.com>
 <0592b224-ccbc-30ad-d2aa-5c39f6481989@linux.ibm.com>
In-Reply-To: <0592b224-ccbc-30ad-d2aa-5c39f6481989@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7579]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75859a0e-0012-496a-065a-08d76de4ac5f
x-ms-traffictypediagnostic: BY5PR15MB3556:
x-microsoft-antispam-prvs: <BY5PR15MB3556A016DC79CBF233E06102DD4F0@BY5PR15MB3556.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(396003)(366004)(39860400002)(199004)(189003)(36756003)(6506007)(76176011)(229853002)(66946007)(53546011)(446003)(33656002)(102836004)(478600001)(6116002)(14454004)(5660300002)(71200400001)(71190400001)(6246003)(256004)(14444005)(186003)(6512007)(4326008)(6436002)(2906002)(6486002)(99286004)(81156014)(8676002)(76116006)(81166006)(8936002)(316002)(86362001)(7736002)(305945005)(46003)(25786009)(64756008)(66446008)(66476007)(486006)(11346002)(66556008)(110136005)(476003)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3556;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /XMg3/UTh8mmcRbrbeHzQV6kS0P8jf8n8OP6O2i9CU7ySCNxIYFLN6k4rP584YfueeO5Maqts318haPnxktc1s64DjdS5oWFLEehamCHFIzsfjPL4Rohl5+ieNpQFO4s4oX3D9cy9w3oK22m9ezcAQdw3rQeKfr9qRSAYz8yPjVETTUL0xlqfJpRlIY/uf7RRnaCofrZqoF3efYfXiyQ58XEOl1orWo7Zh94GIW2YAYYi2KEQz8kGCY1eeO6ff+4GlRbtpGVSnWdAVzXQutIJ1cnbD7Va6sov8QPmW6pDyMpvOafHGoP4Z3HKGOtEYt6hklPr2FdUZu7+n0cz9JqM+6qd2P3d9vby81ImthnDBS4ZIuamMm0NP56I7S7pKapYMzswvwlXC4CY31S5Ph88oZzIo8V9Wc1hMMv/cvWj1FSkq39p2TIz6uZ1ly+x4fG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <53D85C1CFD0F7C4B9D77578BBE27AA06@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75859a0e-0012-496a-065a-08d76de4ac5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 18:08:40.6725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EisTRI7/d8eGjEEJRoMIOLh3vWIhGUQ/yfy5854zZSmlygn2ETsBflaxObEaC74J7XmRyoIyTCo2euDGt+o9jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3556
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_05:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911200153
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

DQoNCu+7v09uIDExLzIwLzE5LCA4OjQwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9zZXBo
IFJleW5vbGRzIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBqcmV5QGxpbnV4LmlibS5jb20+IHdyb3RlOg0KDQogICAgDQog
ICAgT24gMTEvMTgvMTkgNzoyMyBQTSwgd3d3IHdyb3RlOg0KICAgID4gRGVhciBKb3NlcGjvvIwN
CiAgICA+DQogICAgPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGhlbHAuIEkganVzdCB3
YW50IHRvIHNob3cgdGhlIGNvbXBpbGUgDQogICAgPiB0aW1lIG9mIGZpcm13YXJlIHRvIHRoZSB1
c2VyLiBJZiAgb25seSBzaG93IHRoZSB2ZXJzaW9uLCBpdCBjYW4ndCANCiAgICA+IGNvcnJlc3Bv
bmQgdG8gdGhlIHRpbWUuIFdoZW4gYm90aCBhcmUgZGlzcGxheWVkIGF0IHRoZSBzYW1lIHRpbWUs
IHRoZSANCiAgICA+IGluZm9ybWF0aW9uIHdpbGwgYmUgY2xlYXJlci4gdGhhbmtzIGFnYWluLg0K
ICAgID4NCiAgICANCiAgICBCeXJvbiwgdGhhbmtzIGZvciB0aGF0LiAgSSB0aGluayBJIHVuZGVy
c3RhbmQgeW91ciB1c2UgY2FzZS4gSG93ZXZlciwgDQogICAgZG9lcyB0aGlzIHByYWN0aWNlIGFz
c3VtZSB0aGUgYnVpbGQgZGF0ZSBpcyBjbG9zZSB0byB0aGUgZGF0ZSB3aGVuIHRoZSANCiAgICBz
b2Z0d2FyZSB2ZXJzaW9uIHdhcyBjcmVhdGVkPw0KICAgIC0gRm9yIGV4YW1wbGUsIEkgYXNzdW1l
IHlvdSdsbCBtZXJnZSBhIGdpdCBjb21taXQgdG8gY3JlYXRlIGEgbmV3IA0KICAgIHNvZnR3YXJl
IHZlcnNpb24sIGFuZCB0aGVuIGJ1aWxkIGFuIGltYWdlIGJhc2VkIG9uIHRoYXQgY29tbWl0LiAg
SW4gdGhpcyANCiAgICB3YXksIHRoZSBidWlsZCBkYXRlIGNvcnJlbGF0ZXMgY2xvc2VseSB3aXRo
IHRoZSB2ZXJzaW9uLg0KICAgIC0gSG93ZXZlciwgaWYgeW91IGJ1aWxkIGFuIGltYWdlIGZyb20g
YW4gb2xkZXIgY29tbWl0LCBvciB3YWl0IGEgbG9uZyANCiAgICB0aW1lIGJlZm9yZSBidWlsZGlu
ZyBhbiBpbWFnZSwgdGhlIGJ1aWxkIGRhdGUgd2lsbCBub3QgY29ycmVsYXRlIGNsb3NlbHkgDQog
ICAgd2l0aCB0aGUgdmVyc2lvbi4gIFRoaXMgY2FuIGJlIG1pc2xlYWRpbmcgYW5kIGxlYWQgdG8g
ZXJyb3JzIGluIGhhbmRsaW5nIA0KICAgIGltYWdlcy4NCg0KSSBndWVzcyBidWlsZCBkYXRlIHNo
b3VsZCBiZSB0aGUgZGF0ZSB2ZXJzaW9uIHdhcyByZWxlYXNlZCBvciBjcmVhdGVkLg0KICAgIA0K
ICAgIElzIHRoYXQgYSBjb25jZXJuIGZvciB5b3U/DQogICAgDQogICAgLSBKb3NlcGgNCiAgICAN
CiAgICA+IHRoYW5rcywNCiAgICA+IEJ5cm9uDQogICAgPg0KICAgIC4uLnNuaXAuLi4NCiAgICAN
CiAgICANCg0K
