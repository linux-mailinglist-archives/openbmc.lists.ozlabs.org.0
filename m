Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE0E274A19
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwtCZ6D7pzDqX0
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:27:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6534d30414=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=nS3cI13k; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=dvqXU9kk; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwtBm2Hq6zDqQt
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:26:54 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MKN58P020010; Tue, 22 Sep 2020 13:26:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=3reOVNYbm6OMTVvs4xq+YE1j1m3gxMTuC3l1mCLcKsY=;
 b=nS3cI13k+R0fpo+uovgKjXEZBSko2ausslSmrWsd1Hjdj18sIyCWc9/q3nPSpfCx06um
 9YhHcKcoD3ufPgEKAwsfNYXCTgwegtcMdN7UebbjnfcunhJ+/H4jc3M5VZTUuqAyQPzz
 KWtEjkuzSz/1Sj65kCJQ5NCukczPj3CQm+0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33p1tjw4p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 13:26:48 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 13:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrmoc5p918gc/EO/5FYtHdLM+gqtCgXjxda4mAGepEQZjtStpRYu13Q7vIt17EbiXQuAlWjySVFE2xGg60B9YRjj7fdSSRyAQefbwN0n+AhZG0MDAyuo/imWabbDTxuBjOdNpq5Hqde9x1ZQRp+Sblw1ivFQ+NxGd5bJ55UxBhv+IFzd42HNqc0FfLQhhraVhcIgYCGX+HOMZcRrReAn98nXPzIns+FmsHJxdprii4tmBeLPd1cFSi3xhVD93CqV3nNEfguk3+qRkuhHU4nO6nYowhZxZjWj68XxsbsLq/F3GEVsrfCJP6C0Yf/piGKpndKA2KZVhyohUp0MCNh76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3reOVNYbm6OMTVvs4xq+YE1j1m3gxMTuC3l1mCLcKsY=;
 b=gVf01nS8tHpZaXEDTzOMgxiWVeObkJdLq3GOL9zRhU16TwUaKaHm+LMBcnm1esogl/HJ6MV7oGg8zAQ6MOOuQtPXU8tXJx0YTBmVyBWwYO5HYrE3hqTStsl38HMUawkHZTKOu+6rZ9nZIHTxbN63Iq/0q7DBTZHxO4NQaOjIpkWrypTWLL2I0iqMre90+Td7GeFL9i0AIqp3tNwqoROFiwCbMQke9upKZHDe/y5vW//Y1Qmm0Cg4fcWBGCcERB66wKarn+MAevJFEgM2pS+IiXr4fDmN2jru8KmmUIi6Aeu0jkZ9PXMNo3xZzFSz9JH7NWbGJ83oltZ7703BMwEz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3reOVNYbm6OMTVvs4xq+YE1j1m3gxMTuC3l1mCLcKsY=;
 b=dvqXU9kkvd7Umadrtzl3ndgqSn5vqXiVpHBB+X1nEuvvcOYgW/dp7iT+JULdeLI9YEEx4+dmA0IQ84M4Vyn6JD63YU8ckysPr1wx3JUvSoLkm6/Muuukoz5W1HyFjjOfZpGj0G4WNmjAFK6HsWADiQovHrVVg5DAOK0DfgT+ABI=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2886.namprd15.prod.outlook.com (2603:10b6:a03:f7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 20:26:46 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 20:26:46 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAAAvawUAAA92WAD//4x0gA==
Date: Tue, 22 Sep 2020 20:26:46 +0000
Message-ID: <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
 <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
In-Reply-To: <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e686c1b2-4935-45b5-6dc5-08d85f35d3f9
x-ms-traffictypediagnostic: BYAPR15MB2886:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2886219901E0A1C943EE864EDD3B0@BYAPR15MB2886.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ecXrfJtJF0eBDvgvuPl7VhurfKtprbUR5XrnuYHmjgoATwjseM1/R4Yoe65rNaXeIL1XSmHOT8V7/QkyPyPRqWcPLuar1mzjIJ5Knma8RhHvL9n8mKHnLeT6G+ZkxiSHUopHOzdvkQs6duI5qYe0ZMPlQLzF6ObV9S/yAXhyNnh1It7/v9wWqRtXMyws8SBEnxAZacqlvxq+fqubus+pghSybuYhKn2PR55s6AyH9zxLqtjKjxSX3ZuCaDb6lcY1BlrqmFJEJErA+6MmixDcOQMf5HA43drwNUrFvbla0KWQLf16w276tWygEud2w7Xdwb7JE1uMd5ZvFjq5veXmdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39860400002)(376002)(396003)(478600001)(76116006)(33656002)(91956017)(2906002)(66946007)(36756003)(86362001)(316002)(4326008)(53546011)(6506007)(6512007)(54906003)(2616005)(8676002)(5660300002)(186003)(66446008)(83380400001)(64756008)(6486002)(71200400001)(8936002)(66556008)(66476007)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nk7LUN9rEkWrhWKbWSOAyVNp2lu967UJQu6Luby0X7y3tr6c+E3u5iGqCeyKKxCgr7Qp7D+M9EOsfFIVHPyZ3/dcgZE+pWztCYGZLx/V6sEIROaIZ6F12oOj5hR7GEMlHQZekIBEeP1giWG6l+YmPR/5/Arby5U12Uh5T08uh8iZsJ9x61DVbiKPZXpexl6R1lFXPz3Eo8Qj8Ebqqj/PjvJBJ/n1erBVd0hyadNtinCEBPBdwr361/3Aobs+cU4f1y1Y/mtEECG8G7iT25/8r/+4rPbeevqIXEOlUgCH55cbP9Nnk/7OtsK9ZpsYeT+okyGdLlLU+ASGFKHQCcfrYNYumGUNisj4Msf5zM5zeYlLOZi2ICi7Qof1OUzDnbEgFRXAHiH9oHgqXEjoTXRyoCw/tv1M3URw+Q7FSGE8rwwA4GRWX6xRcTn9HL8Q2mWXFVzf8wTsAsksCPPIZzfoyHiobb1GQRgdjBl4TULIO+CdnXpuzjhJGwQUgmFUDLiSeZW4DIXDg6BAVku4fvSrR2CXXWLN8q64YJBTUOZwL2q86ZdyCRCbaPfPBnzjyr8OeoBp+Yialyn1craU3ibgl2SYFPy/RMinA7NEYyPwIUYtOUj8LwpwNRgzbrTWRa8BVPsSJE+xPb9WlRZQ16Bd2iZd0m8yOZgxjeHOBmIiuYE21sQvAPpGMXCEtGAsGF+6
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD45E17BD69B584DB5297D128072ED6F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e686c1b2-4935-45b5-6dc5-08d85f35d3f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 20:26:46.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWHBjX9cVHu0WK/cBBYOUNEApcLcn4yVJ9g3/8pKwc73Shjl+4khlNNEieqoMP5iDGH6B5O+kCNqKjlpY6EcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2886
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_18:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220159
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kumar Thangavel <thangavel.k@hcl.com>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjIvMjAsIDE6MjAgUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFR1ZSwgU2VwIDIyLCAyMDIwIGF0IDEyOjU3IFBNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+
IE9uIDkvMjEvMjAsIDk6NDUgQU0sICJLdW1hciBUaGFuZ2F2ZWwiIDx0aGFuZ2F2ZWwua0BoY2wu
Y29tPiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgQ2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5h
bA0KICAgID4NCiAgICA+ICAgICBIaSBBbGwsDQogICAgPg0KICAgID4gICAgICAgICAgICAgICAg
IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMuDQogICAgPg0KICAgID4g
ICAgICAgICAgICAgICAgIEFzIHN1Z2dlc3RlZCwgd2UgYXJlIHBsYW5uaW5nIHRvIGltcGxlbWVu
dCBhIG5ldyBwcm9jZXNzL3NlcnZpY2UgbGlrZSAgeHl6Lm9wZW5ibWNfcHJvamVjdC5JUE1CLkZy
dURldmljZSBpbiBlbnRpdHkgbWFuYWdlciBtb2R1bGUgdG8gc3VwcG9ydCBIb3N0IEZSVSB0aHJv
dWdoIGlwbWIgcmF0aGVyIHRoYW4gdXNpbmcgZGJ1cy1zZW5zb3JzL2lwbWJzZW5zb3JzIGZpbGUu
DQogICAgPg0KICAgID4gICAgICAgICAgICAgICAgIEZvbGxvd2luZyBhcmUgdGhlIGFkdmFudGFn
ZXMsIGlmIGhvc3QgRlJVIGhhbmRsaW5nIGluIGVudGl0eSBtYW5hZ2VyIHJlcG8uDQogICAgPg0K
ICAgID4gICAgICAgICAgICAgICAgIDEuIEFsbCB0aGUgRlJVIGluZm9ybWF0aW9uIGlzIGhhbmRs
aW5nIGluIHRoZSBzYW1lIHJlcG8uDQogICAgPiAgICAgICAgICAgICAgICAgMi4gRW50aXR5IG1h
bmFnZXIgUHJvYmUgY2FuIHdvcmsuDQogICAgPiAgICAgICAgICAgICAgICAgMy4gQWxsIHRoZSBG
UlUgRnVuY3Rpb25zIGFyZSBpbiB0aGUgc2FtZSByZXBvLiBXZSBjYW4gdHJ5IHRvIHJldXNlIG1v
c3Qgb2YgdGhlIGZ1bmN0aW9ucy4NCiAgICA+ICAgICAgICAgICAgICAgICA0LiBBZGRpbmcgRnJ1
IG9iamVjdCB0byBkYnVzIGhhbmRsaW5nIGFyZSBkb25lLg0KICAgID4gICAgICAgICAgICAgICAg
IDUuIEFsbCBGUlUgdmFsaWRhdGlvbnMgYXJlIGRvbmUgaGVyZSBsaWtlIEZvcm1hdCBmcnUsIHVw
ZGF0ZSBmcnUgcHJvcGVydHksIHZhbGlkYXRlIGhlYWRlciwgRnJ1IEFyZWFMZW4gYW5kIGNoZWNr
c3VtLiBXZSBjYW4gdHJ5IHRvIHJldXNlIHRob3NlIHZhbGlkYXRpb25zLg0KICAgID4NCiAgICA+
IFdoYXQgd2lsbCBoYXBwZW4gaWYgdXNlciBpcyBub3QgdXNpbmcgZnJ1LWRldmljZSBmcm9tIGVu
dGl0eSBtYW5hZ2VyLCByYXRoZXIgY2hvb3NlIHRvIHVzZSBwaG9zcGhvci1pcG1pLWZydS4gSGVy
ZSB5b3UgYXJlIHJlc3RyaWN0aW5nIHVzZXIgdG8gdXNlIGZydS1kZXZpY2Ugb25seS4NCg0KICAg
IHBob3NwaG9yLWlwbWktZnJ1IGlzIG5vdCBjb21wYXRpYmxlIHdpdGggSVBNQiBGcnVzLCBhcyB0
aGUNCiAgICBzcGVjaWZpY2F0aW9uIHJlcXVpcmVzIHRoZW0gdG8gYmUgZHluYW1pY2FsbHkgc2Nh
bm5lZCBiYXNlZCBvbiB0aGUNCiAgICBTRFIuICBJIGd1ZXNzIHlvdSBjb3VsZCBoYXJkY29kZSB0
aGVtLCBidXQgeW91J2Qgc3RpbGwgaGF2ZSB0byBoYXZlDQogICAgc29tZSBhdXhpbGlhcnkgImRv
ZXMgbXkgZGV2aWNlIGV4aXN0IiBzY2FubmluZyB0aGF0IHN0YXJ0cyB0byBsb29rIGENCiAgICBs
b3QgbGlrZSBlbnRpdHkgbWFuYWdlci9mcnUgZGV2aWNlLiAgSXMgdGhlIHVzZSBjYXNlIHlvdSBw
cmVzZW50IGENCiAgICByZWFsIG9uZSwgb3IgaHlwb3RoZXRpY2FsPw0KDQogICAgPg0KICAgID4g
ICAgICAgICAgICAgICAgIEZvciBzY2FubmluZyB0aGUgL2Rldi9pcG1pLSogbm9kZXMsIHdlIGFy
ZSB0aGlua2luZyB0byB1c2UgaXBtYi1jaGFubmVscy5qc29uIGNvZmlnIGVudHJpZXMgaW4gZW50
aXR5IG1hbmFnZXIgcmVwbyBzaW5jZSB0aGlzIGNvbmZpZyBmaWxlIGhhcyB2YWxpZCBzbGF2ZSBw
YXRoIGFuZCBidXMgYWRkcmVzcy4NCg0KICAgIFBsZWFzZSBkb24ndC4gIEVudGl0eS1tYW5hZ2Vy
IGlzIGR5bmFtaWMsIGFuZCB0aGUgY29uZmlnIHNob3VsZCBiZQ0KICAgIGJhc2VkIG9uIGEgZGV0
ZWN0ZWQgZW50aXR5LiAgTWl4aW5nIHRoZSBkeW5hbWljIGFuZCBzdGF0aWMgdXNlIGNhc2VzDQog
ICAgaW4gdGhpcyB3YXkgd291bGQgbWVhbiB0aGF0IHdlIGdldCB0byByZXdyaXRlIGFsbCBvZiB0
aGlzIHdoZW4gd2UgaGF2ZQ0KICAgIHRvIHN1cHBvcnQgSVBNQiBhZGQtaW4tY2FyZHMsIHdoaWNo
IGFyZSA5OSUgdGhlIHNhbWUsIGJ1dCBuZWVkIHRvIGJlDQogICAgZGV0ZWN0ZWQgaW5zdGVhZCBv
ZiBoYXJkY29kZWQuDQogICAgSWYgeW91IHdhbnQgdGhpcyB0byBiZSByZWxhdGl2ZWx5IHN0YXRp
YywgYXR0YWNoIGFuIGV4cG9zZXMgcmVjb3JkIHRvDQogICAgeW91ciBiYXNlYm9hcmQgY29uZmln
IHRoYXQgaGFzIHRoZSBpbmZvcm1hdGlvbiB5b3UgbmVlZCAoaWYgeW91ciBJUE1CDQogICAgZGV2
aWNlcyBhcmUgb24gdGhlIGJhc2Vib2FyZCkuDQoNClJhdGhlciB0aGFuIGhhdmluZyBoYXJkY29k
ZWQgY29uZmlnLCBjYW4gd2UgY2FuIHNjYW4gYWxsIGF2YWlsYWJsZSBpcG1iDQpkZXZpY2VzIHVu
ZGVyIC9kZXYvaXBtYi0qIGFuZCBzZW5kIHByb3BlciBpcG1iIGNvbW1hbmQgdG8gZ2V0IGZydQ0K
ZGF0YS4NCg0KICAgID4NCiAgICA+ICAgICAgICAgICAgICAgICBQbGVhc2Ugc2hhcmUgeW91ciBj
b21tZW50cyBpZiBhbnkuDQogICAgPg0KICAgID4gICAgIFRoYW5rcywNCiAgICA+ICAgICBLdW1h
ci4NCiAgICA+DQogICAgPg0KDQo=
