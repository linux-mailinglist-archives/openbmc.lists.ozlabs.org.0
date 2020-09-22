Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C92748F3
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 21:18:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwrgY2t5mzDqVx
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 05:18:17 +1000 (AEST)
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
 header.s=facebook header.b=OOKBwk3e; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Se+X1lLD; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwrdl3ChRzDqX6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 05:16:35 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MJFTeH013815; Tue, 22 Sep 2020 12:16:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EwRT9U1bUcKwxRfUyY01RyzdwYxapLH5U65AxF1UVGE=;
 b=OOKBwk3eurfnzA8u2WYX5U66MMtO0nxVYvHJenzUjfry2BmhcYn4ziCxVpSH+3v4dKJs
 3rdnB9fKGxiEWNdnQC0C2UbKWWGig9VvbdwYtZaa2icTCAfpKJVgh4c0K8T7kbjMXeQN
 4CUDONv9EMbVzK55E+1XsWQZ/Yf+yrroRyo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33p226mpvc-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 12:16:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 12:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTjSmBMNGd5DEfU+Cp8EDU08L9ApKUuUzcUn4IU+Gn/wrTwlhko57gCKgfMgGS6wUtEzhUPyDYlNYRW9m7sDfH5BmmCl7Eagc4WjKmnxQhzg2OMgqpNHo5spPhTwxbRl+x3nozdzeOpgduIB+mFVxzeeJH5yP239V5GAaMntgSq1QCXBBkBFEjlY3UKoisQwvFoVUHpwGnqTAWmQqc5lrYcs2Ujp5oToa74lh3fm7s9rnFD/cJNFV9AwIC2IMnulMmiV1umlaNirwXoIPTeBzS1QhXLM7KYKThFCGupOiAgUrHQyRKJwrzt3WvKfYfpVOHUAE6IlGTCGmfOZZd0c+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwRT9U1bUcKwxRfUyY01RyzdwYxapLH5U65AxF1UVGE=;
 b=DdEDLJvPN11UingG00zCaJ8FQ/U1OZYxy94EQjQk7/tvZ3sDfeqlVrw1ofSqdmIamR3EEvW1K0HC9UY1fPx9iwqo88Waac1jo/SeI94dUjmNH9i3lq1BsAOzBIT813kBaY3uMV0fnxmvhgPH9QH0YFh/brK7KUDmwapkdYogh46wuBi8Qnc0Wr/5W47Sst2e3cwpRgmZjqtO4KU3gFxtMNUJg1EIHiMyUDc6J/0O3zNLvTx2GsALbDRA4mRYhcWO+6m2FEkTBlr5sxeW7TeQjYSb2fl/MG+BCWYA909pYwSLQUg+XAanrGGj610RjytGyQDNSqiipJgnN0Gc7UaNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwRT9U1bUcKwxRfUyY01RyzdwYxapLH5U65AxF1UVGE=;
 b=Se+X1lLD1s3i6ajIcouwxjv3FXq9FB1fs2ROwZbEFrtRQbCBGZ2iSumUNlCR7F9EN+UC0L9P8GbVPmQUfRLPx9zfMbGRoJJuf0i+0e8HWyxj7Su0L3Bj82CBYEi22/ulTe4igS6kGhMjY9hp+TQAVo1wC//ptwJw9op0fwnyUf8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4087.namprd15.prod.outlook.com (2603:10b6:a02:bd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 19:16:26 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 19:16:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wA
Date: Tue, 22 Sep 2020 19:16:25 +0000
Message-ID: <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
In-Reply-To: <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d51d5637-6497-4b8f-59f5-08d85f2c0039
x-ms-traffictypediagnostic: BYAPR15MB4087:
x-microsoft-antispam-prvs: <BYAPR15MB4087724F2F82938E7BE1FDF5DD3B0@BYAPR15MB4087.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0asCUYiiYCRof9jHTDVEfF5xpBMWjkQFygj3ldJA3VMixcAT3Wp9OAebjnZTUQTWDRbbAwxDd/7Y3gfE0X7USXEbN0WJeUXqzq0+X+hFw4tSykKLQjfB7v7ocgQsYVeH+Qk8mCLyZdBINW6hcXvL9b/uIKlmJoWfh2HT6a48AMCgqcFhHP9aM4RV8Ip83hAATZG7wpsNtt8NG25JZ0i2jms/9ve7OxSbxa39tGu+NOu84TFI7u68kH5HUEGDAw0eIKrEqMpGaf87jsYdjMeGT9K3NVoQ1ohq93VmZraPrymKqeR5B+MdG58X6fzmZjK5oD1eKjt1kP2YmdHFSNJx9hcVTiYlE6+RBJy9bZPuI9+tzeeFTd0T0dq7l4yvmjRHRkth20r43Cxx4lbenS6Kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(186003)(2906002)(76116006)(86362001)(36756003)(478600001)(83380400001)(91956017)(2616005)(66946007)(66446008)(66556008)(64756008)(66476007)(966005)(4326008)(6486002)(316002)(8936002)(6512007)(7116003)(3480700007)(8676002)(5660300002)(71200400001)(6506007)(6916009)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: F9bzmdSoWm9xQk5zI2b2bfEY8vzqaxC7ckAADohUgh+m6H+1uAtM3Zx5h2pjCTv4BJXzxy6JKwupIbrupkHNOUm4QPwnE48SOWR5VypV9bL4eTrxQjlX7EHfLxt9QBwQHQnga7nCuNXIFT5UvcjPdD3Tf6yraU1vJ8+ZuyjcBnRNpuU9e+iVdbgngSCugvyxCjElGjr5sbYsrXXv++6rp25FMbSsFa5vWYf9uS+1+gDdCRW8q8zntE1a0EwhTVOd1x0HeyuKd+b4xe3/NQXpvfcbt3y2WrsPziaylRkNJ3S0RPy/FMNu7DvdcOYJ8Izu9D6VOBKn0yEv1l3YxD3DSPgfYTO+OM/fZ75vO9OhVhAQh8gBv/VJK1UHYkD84NJVsNvo5QM9SPSiYCSVai5vndZrW7+PjNslh+zFYcXoh3hU7Q2+V9qUJlyAEJKVrOd9h4yDl2d1aX41UDSF+7g5M83COTwhHZitlmAq3fDrWRo34vYsSVCcYcxB/D/7lvtN+Oc/XM4gz5eldtVN9hnp+Jf68/q5gC/Oi2rilE0RnB4hlhOXjtiFKJbmCM+PRuca3ZkrHbvG2DGQpmU0A6Qo6gHFfw2255vG9eYgUe0fPB/8MOLlT4niGOF2BY8htoDfY1Y1uMSzAZlWK8HxzPBiQofUdP+7a1NKw2pgFOXU9KU9HQ8GWIDwlra31tZhXp8I
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <33EC7B4B080BA5418A99F841E81CBC83@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51d5637-6497-4b8f-59f5-08d85f2c0039
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 19:16:25.8804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+m9QpE0TUUWnCNT1m7jhiD0CANxtyZPmfTS0v8Bae2F4PLa3fZxzlSwVZj4kbFbpEwlEKwOmMMugpFj+XHY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4087
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_17:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220149
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

QWZ0ZXIgYSBiaXQgb2Ygc3R1ZHkgb24gcmVkZmlzaCwgSSBnb3Qgc29tZSBiYXNpYyBkZWZpbml0
aW9uIGZvciBjaGFzc2lzIGZyb20gcmVkZmlzaCBkb2N1bWVudCAgYXMgYmVsb3cuDQpodHRwczov
L3JlZGZpc2guZG10Zi5vcmcvc2NoZW1hcy92MS9DaGFzc2lzLnYxXzEzXzAuanNvbg0KICAgICAg
ICJDaGFzc2lzIjogew0KICAgICAgICAgICAgImFkZGl0aW9uYWxQcm9wZXJ0aWVzIjogZmFsc2Us
DQogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiVGhlIENoYXNzaXMgc2NoZW1hIHJlcHJlc2Vu
dHMgdGhlIHBoeXNpY2FsIGNvbXBvbmVudHMgb2YgYSBzeXN0ZW0uICBUaGlzIHJlc291cmNlIHJl
cHJlc2VudHMgdGhlIHNoZWV0LW1ldGFsIGNvbmZpbmVkIHNwYWNlcyBhbmQgbG9naWNhbCB6b25l
cyBzdWNoIGFzIHJhY2tzLCBlbmNsb3N1cmVzLCBjaGFzc2lzIGFuZCBhbGwgb3RoZXIgY29udGFp
bmVycy4gIFN1YnN5c3RlbXMsIHN1Y2ggYXMgc2Vuc29ycywgdGhhdCBvcGVyYXRlIG91dHNpZGUg
b2YgYSBzeXN0ZW0ncyBkYXRhIHBsYW5lIGFyZSBsaW5rZWQgZWl0aGVyIGRpcmVjdGx5IG9yIGlu
ZGlyZWN0bHkgdGhyb3VnaCB0aGlzIHJlc291cmNlLiAgQSBzdWJzeXN0ZW0gdGhhdCBvcGVyYXRl
cyBvdXRzaWRlIG9mIGEgc3lzdGVtJ3MgZGF0YSBwbGFuZSBhcmUgbm90IGFjY2Vzc2libGUgdG8g
c29mdHdhcmUgdGhhdCBydW5zIG9uIHRoZSBzeXN0ZW0uIiwNCiAgICAgICAgICAgICJsb25nRGVz
Y3JpcHRpb24iOiAiVGhpcyByZXNvdXJjZSBzaGFsbCByZXByZXNlbnQgYSBjaGFzc2lzIG9yIG90
aGVyIHBoeXNpY2FsIGVuY2xvc3VyZSBmb3IgYSBSZWRmaXNoIGltcGxlbWVudGF0aW9uLiIsDQoN
CkluIG15IHVuZGVyc3RhbmRpbmcsIGNoYXNzaXMgcmVzZXQgc2hvdWxkIGJlIHRyZWF0ZWQgYXMg
Y29tcGxldGUgcG93ZXIgY3ljbGUgb2Ygd2hvbGUgY2hhc3NpcyBhbmQgd2UgY2FuIHVzZSByZWRm
aXNoIGNvbW1hbmQgIkZvcmNlUmVzdGFydCBvciBQb3dlckN5Y2xlIg0KDQpBcyBwZXIgb3VyIGlt
cGxlbWVudGF0aW9uIGluIGJtY3dlYiwgd2UgaGF2ZSBpbXBsZW1lbnRlZCAyIGludGVyZmFjZSAo
c3lhdGVtIGFuZCBjaGFzc2lzKSB3aGVyZSB3ZSBkZWFsIHdpdGggY2hhc3NpcyByZXNldA0KMS4g
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9iLzY4NGJiNGI4OWY4OGIzOTRi
MDBiMTQwZDcxYzE2MTE0MzM5M2Y4MGIvcmVkZmlzaC1jb3JlL2xpYi9zeXN0ZW1zLmhwcCNMMTc1
NA0KSW4gdGhpcyBzeXN0ZW0gaW50ZXJmYWNlIGV2ZXJ5IHJlc2V0IHR5cGUgZXhjZXB0IEZvcmNl
T2ZmIGlzIGNhbGxpbmcgYWN0aW9uIGZvciBob3N0IGFuZCBmb3IgRm9yY2VPZmYgY29tbWFuZCwg
aXQgaXMgY2FsbGluZyBjaGFzc2lzIHBvd2Vyb2ZmLg0KDQoyLiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9ibWN3ZWIvYmxvYi82ODRiYjRiODlmODhiMzk0YjAwYjE0MGQ3MWMxNjExNDMzOTNm
ODBiL3JlZGZpc2gtY29yZS9saWIvY2hhc3Npcy5ocHAjTDU4NQ0KSGVyZSB3ZSBvbmx5IGltcGxl
bWVudCAiUG93ZXJDeWNsZSIgY29tbWFuZC4NCg0KV2h5IGRpZCB3ZSBpbXBsZW1lbnQgY2hhc3Np
cyByZXNldCBjb21tYW5kIGF0IDIgZGlmZmVyZW50IGludGVyZmFjZSwgSSBtaWdodCBiZSBtaXNz
aW5nIHNvbWV0aGluZyBoZXJlLg0KDQpBcyBwZXIgeDg2LXBvd2VyLWNvbnRyb2wsIGluIGJvdGgg
YWJvdmUgY2FzZXMgY2hhc3NpcyBjb21tYW5kIHBvaW50IHRvIGFjdGlvbiBvbiBob3N0IG9ubHkN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9sL2Jsb2IvZTYzZGVh
MDg3NWE3MGZmNTBmNDMwYTRiZGM4NGI2NDZhNTZiOWNlNy9wb3dlci1jb250cm9sLXg4Ni9zcmMv
cG93ZXJfY29udHJvbC5jcHAjTDIzODkNCg0Kd2hlcmUgY2FuIHdlIGltcGxlbWVudCBhY3Rpb24g
b24gY2hhc3Npcy4NCg0KQ2FuIEkgYWRkIEZvcmNlUmVzdGFydCBmb3IgY2hhc3NpcyBpbiByZWRm
aXNoIGNoYXNzaXMgaW50ZXJmYWNlIGFzIGNoYXNzaXMgc2xlZCAoY29tcGxldGUgcG93ZXIgcmVt
b3ZhbCBhbmQgcmVzdG9yZSkNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9i
LzY4NGJiNGI4OWY4OGIzOTRiMDBiMTQwZDcxYzE2MTE0MzM5M2Y4MGIvcmVkZmlzaC1jb3JlL2xp
Yi9jaGFzc2lzLmhwcCNMNTg1DQoNCkkgdW5kZXJzdGFuZCB0aGF0IGl0IGlzIG5vdCB2ZXJ5IGNs
ZWFyIGZyb20gcmVmaXNoIGhvdyB0byBtYXAgZWFjaCByZXNvdXJjZSBhbmQgY29tbWFuZC4gDQoN
ClBsZWFzZSBzdWdnZXN0IGEgZGlyZWN0aW9uIGhlcmUuIA0KDQpSZWdhcmRzDQotVmlqYXkNCg0K
