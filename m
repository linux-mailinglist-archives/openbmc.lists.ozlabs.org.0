Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5AB5854
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 01:01:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xz9s50f4zF3Wy
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 09:01:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4163b828c8=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gdyFbeqX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="H5+VIVKF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xz911Nc2zF3Wy
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 09:00:13 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HMuNcb013991
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 16:00:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=OH2FfTAQLlo6wjp9unqiVHl6PC9lJiEpcI9NIqyH6mI=;
 b=gdyFbeqXrnYDRxK6QAmk5C7tecAjNoD/43MxH29jarBpOkrdIqDZscMfo7YQgnvMqT+f
 udqN4i7yhpudhD54rOOqy9Ib/V07po3HTgF3O35rc2+DmSvS15LS0NArz2g/2GR/+27y
 GR61py0xCTBVMGfMcSo1G4o+150Gy5435Dg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v37n2899x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 16:00:10 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 17 Sep 2019 16:00:10 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 16:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJvlo24d1mFkBfCEQ0Q+lfr931WuhbuEa3/1cdm9uO1jKLqIuDfcb6AR4d8jP8/vKiFOos/BXJJIHepxXIfEpAgVlA2gd77VfFp72n9f7vJSKC3e8N/vekhaZ+xT/pV/KqABoXVwkxVszJ3RqRCiSq8Ravh3eN1/vKloc+/G9zuXqc4924a3mNmQ90Rf2goCs15zSbBfHI2TRV2ughRYplEhKANlJmZ0qDKkAk4QW6dnUNyRGJjN6y9GFFNh8BZbbHNwXP/xuvuFbRLVmIvV++6hsKm0tlxiyjJebrFK9PRNIGg3t/FVw0mv+4FOmxVOJflaNUhNMF22Y6YveNnxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH2FfTAQLlo6wjp9unqiVHl6PC9lJiEpcI9NIqyH6mI=;
 b=Ru4qon4DJidU7h75SVrNOjHw0RPb8yVuAxwm0tRXBF3tA45rGSXImPN1/jybLqbXZyc4yP9IgRrP9NHUQHLNP7A7QEsxtMG3+XQcnWf9gqVLqJWFWuipiUo4PBtXrxOzMY7GBHG7Mm87hWJxYiSfbe8X9v0RUAIgZG2sO2YtwvXf1kH9QJYouCwEJo/Qdex2ckSyAlnCbdqo8p+EsnV+jJcwKI+fAjvUXrEVcdYA4PAI+l3c8EYrpM5yRMG3A917rClXy7hRUkiqIqoVmxd9vzBOMYyIsVewpRx+H1cSJztVVOPc5QuHx7jJ80EIKhpr8i05vcqhypAhh9cfdjZAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH2FfTAQLlo6wjp9unqiVHl6PC9lJiEpcI9NIqyH6mI=;
 b=H5+VIVKFgCQSpT8RO+v6SYaQ+FFVBel0jJwwhZAhpR1tnng1S5puPU4FgBzVpf2AxU8EFpAR3mDnZG5Lvt2vSHwU1c5h5qMQM8Ds/m/1piBnNSALzsefhK7yZ7Rgc8nyoQNKxbvbkijyopX1HS7vgzSskXmZW3kK3xFSCJsRFP0=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1486.namprd15.prod.outlook.com (10.173.228.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 23:00:09 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 23:00:09 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BitBake Apache License and Packaging for OpenBMC Components
Thread-Topic: BitBake Apache License and Packaging for OpenBMC Components
Thread-Index: AQHVbaun2lbn9/VSK0ShlMGlfsRgtQ==
Date: Tue, 17 Sep 2019 23:00:09 +0000
Message-ID: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:2ec0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe33746e-3211-4101-3dfc-08d73bc2ca0e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1486; 
x-ms-traffictypediagnostic: MWHPR15MB1486:
x-microsoft-antispam-prvs: <MWHPR15MB14866C7990066882B1C3E7F0BD8F0@MWHPR15MB1486.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(376002)(366004)(39860400002)(346002)(51874003)(189003)(199004)(14454004)(6436002)(76116006)(6486002)(476003)(5640700003)(2351001)(2906002)(236005)(6916009)(486006)(33656002)(54896002)(2501003)(6116002)(71190400001)(71200400001)(316002)(478600001)(1730700003)(81166006)(8676002)(25786009)(6512007)(36756003)(2616005)(46003)(64756008)(66476007)(66446008)(81156014)(66556008)(99286004)(256004)(66946007)(8936002)(86362001)(186003)(5660300002)(6506007)(102836004)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1486;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 91FxocA7djppNVrem2LwnMKXzHYge7Tggl7XOoYyQ0yCPAnDq/v73KTfrezdYiqoq736IU0jCnlbPHSBxtORmhySjzd4oO7CZSZI59sYZsm3CjZrLDDsITsKZGstcteylvyKmwbCZjj7gvYTvCwDM7jfd50AOETFyVKJPCMJI0Dn0UF9O8mlVLH2bP7Oyejo2V9s33x3mdZzX6tBm4TqONNpNNMYdJsxqJlSvD/fBBINgJ18j6ZNd4GPGxjbZwoQREHWSfGAL7xUmOY55rTe2UuNZIm0ZLC43xZ2mqTmAlwT7Q8TIGAoaMFUfrkIDpqc3PtVvzKYdbKJdr3hwEJ5wMxO3GWHv7Wv7dm33duoZ6ch0pm+zZVZsEsjR8Wlj882aISLmEthtruNfqz/2a/v+qWQY3yim2ZX+HwFm1EpwTo=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DECB9459108C40DFAB1865A38169223Dfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe33746e-3211-4101-3dfc-08d73bc2ca0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 23:00:09.4660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiHYKACID/5E45V4LUkOqssaueOc1O6H8k3+XgI2JMZtlvVKu6jozRwfgiySYdeUGLyyy8WEqv69oiRP336auw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1486
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_12:2019-09-17,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909170215
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

--_000_DECB9459108C40DFAB1865A38169223Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2hhdCBpcyB0aGUgcmVjb21tZW5kZWQgd2F5IHRvIGhhbmRsZSBsaWNlbnNlIGZpbGVzIGZvciBP
cGVuQk1DIGNvbXBvbmVudHM/DQoNCkkgcHJlc3VtZSB0aGF0IGFueSBuZXcgY29kZSBjb21taXR0
ZWQgdG8gdGhlIHJlcG9zaXRvcmllcyBzaG91bGQgYmUgQXBhY2hlIDIuMCB1bmxlc3Mgc3BlY2lh
bCBwZXJtaXNzaW9uIGlzIGdyYW50ZWQuIEJhc2VkIG9uIGEgY29udmVyc2F0aW9uIHJlZ2FyZGlu
ZyBjcmVhdGluZyBhIFN0YWNrRXhjaGFuZ2UgZm9ydW0gZm9yIE9wZW5CTUMsIEkgcHJlc3VtZSBN
SVQvT3BlbkJTRC1zdHlsZSBsaWNlbnNlcyBhcmUgdmVyYm90ZW4gd2l0aG91dCBzcGVjaWFsIHBl
cm1pc3Npb24uDQoNCigxKSBXaGF0IHNob3VsZCB0aGUgbGljZW5zZSB0YWcgYmU/IChMSUNFTlNF
ID0g4oCcQXBhY2hlIDIuMOKAnT8pDQooMikgU2hvdWxkIGEgTElDRU5TRSBmaWxlIGJlIGNyZWF0
ZWQgaW4gdGhlIHJvb3QgZGlyZWN0b3J5PyBBIENPUFlJTkcgZmlsZT8gU2hvdWxkIHdlIHBvaW50
IHRvIGEgY29tbW9uIGxpY2Vuc2UgZmlsZT8gV2l0aCBhIGNoZWNrc3VtPyBJZiBzbywgd2hpY2gg
b25lPw0KKDMpIEFyZSB0aGVyZSBwYXJ0aWN1bGFyIHJlcXVpcmVtZW50cyBvciBzdWdnZXN0aW9u
cyByZWdhcmRpbmcgaG93IHRvIHBhY2thZ2Ugc3R1ZmY/DQooNCkgSSBwcmVzdW1lIFNSQ19VUkkg
ZmlsZTovLy8gbGlua3MgYXJlIG9rYXkgc2luY2UgdGhlIGdpdCBsaW5rcyBhcmUgdW5rbm93biBh
bmQgYnJva2VuIHVudGlsIHRoZSBmaXJzdCB2ZXJzaW9uIGlzIGNoZWNrZWQgaW4uDQooNSkgSG93
IHNob3VsZCBJIGhhbmRsZSBiZWluZyBpbiBhIHN1YmRpcmVjdG9yeSBvZiBhIHJlcG9zaXRvcnk/
IFRoZSBjb2RlIEnigJltIGNoZWNraW5nIGluIHdpbGwgZ28gaW50byBvcGVuYm1jLXRvb2xzLiBI
b3cgZG9lcyB0aGF0IHdvcmsgZm9yIENJPw0KDQpJ4oCZbGwgZ28gc2NhbiB0aHJvdWdoIHRoZSBk
b2NzLCBidXQgSSBkaWRu4oCZdCBmaW5kIG11Y2ggY29tbWVudGFyeSBvbiB0aGVzZSB0b3BpY3Mg
d2l0aCBsaWdodCBza2ltbWluZy4gSnVzdCB0cnlpbmcgdG8gZ2V0IGl0IHJpZ2h0IHRoZSBmaXJz
dCB0aW1lLg0KDQpUaGFua3MgaW4gYWR2YW5jZSwNCg0KV2lsZnJlZA0K

--_000_DECB9459108C40DFAB1865A38169223Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <03B876ACE957DC418A4E5B7A7677D1D7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCldoYXQgaXMgdGhlIHJlY29tbWVuZGVkIHdheSB0
byBoYW5kbGUgbGljZW5zZSBmaWxlcyBmb3IgT3BlbkJNQyBjb21wb25lbnRzPyZuYnNwOw0KPGRp
diBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+SSBwcmVzdW1l
IHRoYXQgYW55IG5ldyBjb2RlIGNvbW1pdHRlZCB0byB0aGUgcmVwb3NpdG9yaWVzIHNob3VsZCBi
ZSBBcGFjaGUgMi4wIHVubGVzcyBzcGVjaWFsIHBlcm1pc3Npb24gaXMgZ3JhbnRlZC4gQmFzZWQg
b24gYSBjb252ZXJzYXRpb24gcmVnYXJkaW5nIGNyZWF0aW5nIGEgU3RhY2tFeGNoYW5nZSBmb3J1
bSBmb3IgT3BlbkJNQywgSSBwcmVzdW1lIE1JVC9PcGVuQlNELXN0eWxlIGxpY2Vuc2VzIGFyZSB2
ZXJib3Rlbg0KIHdpdGhvdXQgc3BlY2lhbCBwZXJtaXNzaW9uLjwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+KDEpIFdoYXQgc2hvdWxkIHRo
ZSBsaWNlbnNlIHRhZyBiZT8gKExJQ0VOU0UgPSDigJxBcGFjaGUgMi4w4oCdPyk8L2Rpdj4NCjxk
aXYgY2xhc3M9IiI+KDIpIFNob3VsZCBhIExJQ0VOU0UgZmlsZSBiZSBjcmVhdGVkIGluIHRoZSBy
b290IGRpcmVjdG9yeT8gQSBDT1BZSU5HIGZpbGU/IFNob3VsZCB3ZSBwb2ludCB0byBhIGNvbW1v
biBsaWNlbnNlIGZpbGU/IFdpdGggYSBjaGVja3N1bT8gSWYgc28sIHdoaWNoIG9uZT88L2Rpdj4N
CjxkaXYgY2xhc3M9IiI+KDMpIEFyZSB0aGVyZSBwYXJ0aWN1bGFyIHJlcXVpcmVtZW50cyBvciBz
dWdnZXN0aW9ucyByZWdhcmRpbmcgaG93IHRvIHBhY2thZ2Ugc3R1ZmY/Jm5ic3A7PC9kaXY+DQo8
ZGl2IGNsYXNzPSIiPig0KSBJIHByZXN1bWUgU1JDX1VSSSA8YSBocmVmPSJmaWxlOi8vLyIgY2xh
c3M9IiI+ZmlsZTovLy88L2E+Jm5ic3A7bGlua3MgYXJlIG9rYXkgc2luY2UgdGhlIGdpdCBsaW5r
cyBhcmUgdW5rbm93biBhbmQgYnJva2VuIHVudGlsIHRoZSBmaXJzdCB2ZXJzaW9uIGlzIGNoZWNr
ZWQgaW4uPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPig1KSBIb3cgc2hvdWxkIEkgaGFuZGxlIGJlaW5n
IGluIGEgc3ViZGlyZWN0b3J5IG9mIGEgcmVwb3NpdG9yeT8gVGhlIGNvZGUgSeKAmW0gY2hlY2tp
bmcgaW4gd2lsbCBnbyBpbnRvIG9wZW5ibWMtdG9vbHMuIEhvdyBkb2VzIHRoYXQgd29yayBmb3Ig
Q0k/PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj5J4oCZbGwgZ28gc2NhbiB0aHJvdWdoIHRoZSBkb2NzLCBidXQgSSBkaWRu4oCZdCBmaW5k
IG11Y2ggY29tbWVudGFyeSBvbiB0aGVzZSB0b3BpY3Mgd2l0aCBsaWdodCBza2ltbWluZy4gSnVz
dCB0cnlpbmcgdG8gZ2V0IGl0IHJpZ2h0IHRoZSBmaXJzdCB0aW1lLjwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+VGhhbmtzIGluIGFkdmFu
Y2UsPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj5XaWxmcmVkPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DECB9459108C40DFAB1865A38169223Dfbcom_--
