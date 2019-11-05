Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A01DCEF205
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 01:34:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Vz66x5LzF3F9
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 11:34:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=62128af700=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="VWnV2cCs"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="MoN/3oco"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476VyP1lpWzDsMP
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 11:33:27 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA50TVI1028038; Mon, 4 Nov 2019 16:33:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=roc2v0PSxHVvqUHIN6Bl0RLtdhmNSaMzIzSRubLf/cg=;
 b=VWnV2cCsVvgYeR69I2TwFl7aWmBeYYPHCYQbKQhmQGC9jYIu7Wb/R2tGkIzG+1Z4d0ET
 UoI7YM0E2jp3P82B0NfPf5csJcS+EucCa7v55E9pafMavt3t4FC3YtKuh9XxSBalDAfN
 qKA8nTQrZqoatIknWyjPqyG3An3Rgx11qFA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w17hq38g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2019 16:33:20 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 4 Nov 2019 16:33:19 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 4 Nov 2019 16:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBvjUeumQQkHzcyp8RDTMu31XTNmCQIga5vt3lr54S9MDIb2sQYD5a3IH4xDJOWJuM6AQH/XzVVnAHLNvmbDWmwhmkbiTTMSgYzLnzw5tZtkt4kWVVrD8Q6SLLSpTYipy2S3kMUzPK9haGWNRNTC5hkVopD8Wltng7TPffNhzfUZLY1d5pY2bXUKEARZmsX86J4qIlz6HwPf38tJn85KBxOhXL8FxIyCUXdI7DA+2Nk98CQPC/rYrVSzxuq0+033HaBUbAVsccpvL1hrXQMs6Nzs/H0FbiDktqVY4V5EWDzdpDUr/sQHH5F5FtAKkafgnshb3567RJRJC2GNjkwgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roc2v0PSxHVvqUHIN6Bl0RLtdhmNSaMzIzSRubLf/cg=;
 b=JokXaCvfbgcFzDvXGd74xmWby/XfL7gN6oktgP50nXTDP567NXsgGBIziwRYx7VwEiP2l9qGOGSKIUG2cL91HjMnXEjnUBDkdGnZYZT4yuG3iwbyWX0RfWAFCWqvRoKF/9yDONfZmUC0/2Tct7q2HRjwoWpNEQF7UcKkpoEWpNLMd1zY84oujRhP0ZyV+Ucda4St8ZAf4BaWchBsq2Xp7b3+1/Ozjg1Qj/2xH95SMU17v9R6VpSr1uYpG4RgWVfFO9YisVzAQ1bVWMfnf0UMOhkiWMSo/vkUNSMgMtCwAnoAhPxBB9TU1Fl6TrV5005MiGlV0bB/Aa/gPGBryPmsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roc2v0PSxHVvqUHIN6Bl0RLtdhmNSaMzIzSRubLf/cg=;
 b=MoN/3ocoa0s3AEr+W+QTfLZ1DsmfwzN4u6xA7+8PuD6B/W5sccHuRVvwg4FsLu3ty3XyaMgHdP772e0T6JIoMNUbNYhCi5yXOPG7/2CoTK5dRRBLFMSGrDf6ftFLiRvPeGiqtDV5mGWksyxSlNXH66/mFRAoWYjrwzgGxjAmySY=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3620.namprd15.prod.outlook.com (52.133.252.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 00:33:18 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 00:33:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVkRUpEDaqjstP4kSB8KQL9Y7+Lqd7cIyA///IZoA=
Date: Tue, 5 Nov 2019 00:33:16 +0000
Message-ID: <0DC0CA35-B218-4A6B-8133-0249FA929BB2@fb.com>
References: <D2637F4F-E67C-424E-86FF-D20E0415CB43@fb.com>
 <c663ed26-8d49-b35d-ea8e-d80c04427e00@linux.intel.com>
In-Reply-To: <c663ed26-8d49-b35d-ea8e-d80c04427e00@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:1bc5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee5d0cec-a32f-4449-108c-08d76187bfe6
x-ms-traffictypediagnostic: BY5PR15MB3620:
x-microsoft-antispam-prvs: <BY5PR15MB362002BE0F07E17257017514DD7E0@BY5PR15MB3620.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(81166006)(14454004)(81156014)(476003)(8676002)(8936002)(446003)(11346002)(33656002)(99286004)(486006)(25786009)(6486002)(186003)(6116002)(76176011)(316002)(305945005)(6506007)(53546011)(102836004)(2616005)(229853002)(7736002)(5660300002)(46003)(71200400001)(71190400001)(86362001)(110136005)(66476007)(66446008)(66556008)(256004)(6436002)(36756003)(478600001)(2906002)(2501003)(64756008)(6246003)(6512007)(66946007)(91956017)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3620;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MyUsJHBUSvBvda+QouvrSZTqMxp40u9t0dTWmcUnwgXrdwY63UhZUFVQ4JTc1ndsb52Zf8nbrKdHFMfSY+5w+zPl4SfViDbFL8qzFLq4lBhT4pD3aOumqUaXANbljnT9eOTKZhDMxXf0c3/N+tHQ3x/lkBYclPetsOWnKtfV7V71PAp3dAwf4zOjQcYZekL50wsgKO9TUPzmCoz11D6XBW6c65/ur9AXB+wuA1qKm5pjN9aRhYhLfM8EO7mL5HAfoCIm/RPuATz08Tr7UEa+xl4l0pDUYzseo/s0TgVl0L6Pd3in8W3pJzPy4hwj6JsuT+Bek8nHzWFiuREaMUzN99YaLHMmXqNDwK92voC6YT6APYkE0cDWIcPgXGPZvjeN+tIKvXqXAW9Aw4xcIek2Q5XvQI6CE4O0W3+4Q8Vbps38mU89qYPQD9TpeM75r5w/
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6A252977F2D164AA527FBB40656CA4D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5d0cec-a32f-4449-108c-08d76187bfe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 00:33:16.2760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qqrdHBCi1cRbSleQeI5Vyy5xBZIzBy6xWH52fGlRPcg4DXtMMjaoLQytW3am+LMigWe6lLJwh49cry3wXvbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3620
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_12:2019-11-04,2019-11-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 mlxlogscore=910
 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1911050001
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

DQoNCu+7v09uIDExLzQvMTksIDExOjUzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMs
IEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToN
Cg0KICAgIEhpIFZpamF5LA0KICAgIA0KICAgIE9uIDExLzEvMjAxOSA1OjMzIFBNLCBWaWpheSBL
aGVta2Egd3JvdGU6DQogICAgPiBIaSBKYXNvbi9KYW1lcywNCiAgICA+IEkgc2VlIHNvbWUgbGlt
aXRhdGlvbiBpbiBjdXJyZW50IHg4Ni1wb3dlci1jb250cm9sIGFzIHdlIGRvbuKAmXQgaGF2ZSBO
TUlfT1VULCBOTUlfQlVUVE9OIGFuZCBJRF9CVVRUT04gdXNhZ2UuIEFuZCBJIGFtIG5vdCBzdXJl
IHdoeSB0aGVzZSBhcmUgYmVpbmcgdXNlZC4gU28gaWYgSSBkb27igJl0IGRlZmluZSB0aGVzZSBp
biBEVFMgdGhlbiB0aGlzIHByb2dyYW0gZmFpbHMuIFNvIFBsZWFzZSBob3cgdG8gZGlzYWJsZSB0
aGVzZS4gVGhlc2Ugc2hvdWxkIGJlIG9wdGlvbmFsLiBJIGhhdmUgZm9sbG93aW5nIG9wdGlvbnMg
dG8gZGlzYWJsZSB0aGVzZS4NCiAgICA+IA0KICAgID4gMS4gTm8gcmV0dXJuaW5nIC0xIGlmIHdl
IGRvbid0IGZpbmQgbGluZSBuYW1lLCBzaW1wbHkgbW92ZSBvbi4gSSBoYXZlIHRvIHNlZSBpbXBh
Y3Qgb24gcmVzdCBvZiBjb2RlLg0KICAgID4gMi4gTWFrZSBpdCBjb21waWxlIHRpbWUgZmxhZyBh
bmQgc2hvdWxkIGJlIGluY2x1ZGVkIHRocm91Z2ggYmJhcHBlbmQgbGlrZSAtRE5NSV9PVVQgZXRj
Lg0KICAgIEkgY2hhdHRlZCB3aXRoIEphbWVzIGFuZCBJIHRoaW5rIHdlIGxpa2UgdGhpcyBvcHRp
b24gdGhlIGJlc3QuICBJZiB5b3UgDQogICAgc2V0IGEgYnVpbGQgZmxhZyB0aGF0IGlzIGVuYWJs
ZWQgYnkgZGVmYXVsdCwgaXQgd2lsbCBsZXQgeW91IGRpc2FibGUgdGhlIA0KICAgIGZlYXR1cmVz
IHlvdSBkb24ndCBuZWVkIGluIGEgLmJiYXBwZW5kLiAgVGhpcyB3aWxsIGxldCB5b3UgcmVtb3Zl
IHRoZSANCiAgICBwaW5zIHlvdSBkb24ndCB1c2UgYW5kIHN0aWxsIGFsbG93IGZvciBlYXNpZXIg
ZGV0ZWN0aW9uIHdoZW4gYW4gZXhwZWN0ZWQgDQogICAgcGluIGlzbid0IHdvcmtpbmcuDQoNClRo
YW5rcyBKYXNvbiwgSSB3aWxsIHdvcmsgb24gcGF0Y2ggYW5kIHNlbmQgaXQgZm9yIHJldmlldy4N
CiAgICANCiAgICBUaGFua3MsDQogICAgLUphc29uDQogICAgDQogICAgPiAzLiBIYXZlIGNvbmZp
ZyBKYXNvbiBmaWxlIGFuZCBlbmFibGUgb3IgZGlzYWJsZSBncGlvIGxpbmUgdG8gYmUgdXNlZC4N
CiAgICA+IA0KICAgID4gDQogICAgPiBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciB0aG91Z2h0IGFu
ZCBob3cgc2hvdWxkIHdlIGFwcHJvYWNoLiBJIGFtIGZpbmUgd2l0aCBjaGFuZ2luZyB0aGlzIGNv
ZGUgYW5kIHN1Ym1pdCBwYXRjaC4NCiAgICA+IA0KICAgID4gUmVnYXJkcw0KICAgID4gLVZpamF5
DQogICAgPiANCiAgICANCg0K
