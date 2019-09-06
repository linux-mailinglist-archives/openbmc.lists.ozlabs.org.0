Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34526AC1E2
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 23:14:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q9LJ6fJHzDrCT
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 07:14:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41527672ed=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="QjG/ce12"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NliuyhKU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q9KR4wV1zDr8m
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 07:14:01 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x86L7WQZ032573;
 Fri, 6 Sep 2019 14:13:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=WaAGUkpIVX/u/zd5K9P6mJYuM1BZOI74kgOHxvXp4ZQ=;
 b=QjG/ce12GqP0d1d0WVU3TywR8FXUtVL/8Sf8y6m+bJNL5DPd1SFF2XW5C5tPzBsfsSGj
 dMqB5X19EmZaZ3tCo72zsPLCyPmUY7BIDRvD7RsBxCN9MlEtvYYkqlRPzHbjv6GWl9yF
 SuYELhOXJl+q0h1IHr2ioqdjDmEifUguWZE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2uuquajd49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2019 14:13:53 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 6 Sep 2019 14:13:52 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 6 Sep 2019 14:13:52 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 6 Sep 2019 14:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLf8iYONsiljhHwlXDqc5TcMgXNZOhckISgyEqlz9VCc1L3y3fUeexatjypeHLWO0JU3mhH+jIa3kun0819OAxh4IT5kTl4plYK0g7UvhZI+HhtazyPeLdwEG6cIuq7Bo7uetgAI3rWsEFYDBdloNOi5v4z/qKq5J9IAWNLDhqIBW4dK9BtOO4mxr2GbdPvDQAOWm3LNkFlWhnAry6sIp1+YVZsqRQ9+HMmBm/3zhK+EdteskXxapJGUfjzWacjh5/8gVk3oslVclXfpHz5mAW+B2KseTTOdxnSjEVVj5Lnrb4i1fbr8e83O5877xF52qWXBSejP4iaAq7XyiRQ8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaAGUkpIVX/u/zd5K9P6mJYuM1BZOI74kgOHxvXp4ZQ=;
 b=JyMsHrFcpfLeeYkNQQnEJBNk0Bap/nXcpRkZ8QTQPB/XJvf8gHesN8t03B6w6/kr63toYpV5rvJK/hYXAFeHT7LBT9eEmTZ94WSgqZPFf40EpS9/dLWt+nFvDGh1miKZR3ZjOXTRJUGOqu2iVIkJTnUnum+0qKKNl8vYvZElHT5FRbPfRt3d4YUXXeRWzxb8Wpxk9GnbjLxhGv/DmEh+e9+pDUDq635vXE4Jh4F3WbPO57vZsHtVUCtnLxbVu/+v/yV9J3iwiwh5Ngl7Wj6TmuuIbnrdkYc5dKAtnVQeIXHEntCCtZlME4mjX10LFf/KgUwUlNan2x51KU5BcKx87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaAGUkpIVX/u/zd5K9P6mJYuM1BZOI74kgOHxvXp4ZQ=;
 b=NliuyhKUGnkxar3fmiQLXaVHD3U5xQcXmRSt2Npgsn6BADrUD87rf0M/lKL76aWwOfTY50rNnbrp+OwYhgadAqzjC8WgnfIy0b0z7lweM9STOkQFExhBPxkc83qPjkGDqSgVs+TClQR4BAAriBQn4qN0yHlwl1QNI/T5IimYjR0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1133.namprd15.prod.outlook.com (10.175.3.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Fri, 6 Sep 2019 21:13:50 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 21:13:50 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: net/ncsi: BMC gets incorrect ipv6 link-local address
Thread-Topic: net/ncsi: BMC gets incorrect ipv6 link-local address
Thread-Index: AQHVY2hm1IBug8pXl06yhf+uB/36pacfD2KAgAAZvwA=
Date: Fri, 6 Sep 2019 21:13:50 +0000
Message-ID: <63e84dd7-3d25-16c7-9e67-8b8283ec634f@fb.com>
References: <18e1fb68-1607-0e01-5b21-171a83f94bd9@fb.com>
 <CACPK8XcE+JMHCD_7TuH2EpWOyX14qGA6UGkGNFEsg3apA=sVpg@mail.gmail.com>
In-Reply-To: <CACPK8XcE+JMHCD_7TuH2EpWOyX14qGA6UGkGNFEsg3apA=sVpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:102:2::39) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:a639]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a38b741-1608-43bd-8330-08d7330f1d47
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1133; 
x-ms-traffictypediagnostic: MWHPR15MB1133:
x-microsoft-antispam-prvs: <MWHPR15MB11337BF72C61A4BFB55BE51FB2BA0@MWHPR15MB1133.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(31696002)(305945005)(6486002)(102836004)(6916009)(53936002)(65956001)(86362001)(76176011)(186003)(46003)(386003)(6506007)(53546011)(65806001)(229853002)(36756003)(99286004)(4326008)(52116002)(25786009)(66946007)(54906003)(316002)(6436002)(4744005)(58126008)(6246003)(6512007)(66556008)(5660300002)(14454004)(478600001)(66476007)(64756008)(66446008)(14444005)(256004)(71190400001)(71200400001)(6116002)(7736002)(2906002)(486006)(31686004)(446003)(81156014)(81166006)(2616005)(8936002)(8676002)(476003)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1133;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2JFpBvsHRrO0bEw5YVLYGS8TbOBdDb/PzN5mAlOvzgHPRFFVhkdKlXy2YoA0s9xvVZY1AE8E28/LSZ4oivT41sXYy+IDHeQh2/W261hoF6a4l2wHHjD4pJ9mpTrSRkJUwXiO6GHrj4AsQvaKJOs22rWbq9jNW2+JOSiZHC6il3ocfL+UYmIseUEMeaWw5qaEXiJbelPsAGPbmnpf6lhaq6waVdHLh2AgrXET4xwTTXDa0nq6S2jWbAPm3wa+OyWIMYtC+n3S+DPLorc/MRHZnPrUKFariKHz3xZRj4gofNKIlp9Xa4WGZn1FL+nLMOxRard/20pbB9WIJG3SP1b/Jk4xs3khD9SbfJx0b42LNpX7X2GdcQYD7rZeYC9KDQXWWb+EICMa917td8c6m8NBrg8FExd+S5HOyfsnggT1U9E=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC68B8A0E27C224AA200E137E67ED4E1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a38b741-1608-43bd-8330-08d7330f1d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 21:13:50.7025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoyhggvpkMj/Q+blsEckIWh9J5MGOaftE/NmVr6m1r6m3APMdyAy6REcMP5BWoaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1133
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-06_09:2019-09-04,2019-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015 mlxlogscore=983
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909060216
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
 Samuel Mendoza-Jonas <sam@mendozajonas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOS82LzE5IDEyOjQxIFBNLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+IE9uIFdlZCwgNCBTZXAg
MjAxOSBhdCAyMTozNCwgVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQo+IA0KPj4gSSBl
bmFibGVkIE5DU0lfT0VNX0NNRF9HRVRfTUFDIG9uIG15IFlhbXAgQk1DIHRvIHVwZGF0ZSBCTUMn
cyBNQUMgYWRkcmVzcyB3aGlsZSBicmluZ2luZyB1cCBldGgwLCBidXQgSSBub3RpY2UgQk1DJ3Mg
aXB2Ni1saW5rLWxvY2FsIGFkZHJlc3MgbWF5IGJlIGRlcml2ZWQgZnJvbSB0aGUgb2xkIE1BQyBh
ZGRyZXNzLCB3aGljaCBsZWFkcyB0byBESENQIGZhaWx1cmUgd2hlbiBESENQdjYgc2VydmVyIGFz
c2lnbnMgSVAgYmFzZWQgb24gaXB2NiBsaW5rIGxvY2FsIGFkZHJlc3MuDQo+Pg0KPj4gQ3VycmVu
dGx5IEkgd29ya2Fyb3VuZCB0aGUgaXNzdWUgYnkgcmVzdGFydGluZyBCTUMncyBldGgwIGludGVy
ZmFjZSAod2hpY2ggcmVmcmVzaGVzIGlwdjYgbGluayBsb2NhbCBhZGRyZXNzIGJhc2VkIG9uIHRo
ZSBuZXcgTUFDKSwgYnV0IEknbSBsb29raW5nIGZvciBhbiAib2ZmaWNpYWwiIGZpeC4gRm9yIGV4
YW1wbGUsIHNoYWxsIHdlIG5vdGlmeSBuZXR3b3JrIGxheWVyIHdoZW4gQk1DIE1BQyBhZGRyZXNz
IGlzIHVwZGF0ZWQ/DQo+IA0KPiBUYW8gYW5kIEkgaGFkIGEgbG9vayB0aHJvdWdoIHRoZSBjb2Rl
IGFuZCBjb3VsZG4ndCBmaW5kIGFuIG9idmlvdXMNCj4gY2FsbCB0aGF0IHdlIHNob3VsZCBjaGFu
Z2UuIFRoZSBOQ1NJIGxheWVyIGFwcGVhcnMgdG8gYmUgZG9pbmcgdGhlDQo+IGNvcnJlY3QgdGhp
bmcuDQo+IA0KPiBJIHRoaW5rIHRoZSBuZXh0IHN0ZXAgaXMgdG8gYnJpbmcgdGhpcyB1cCBvbiB0
aGUgbmV0ZGV2IG1haWxpbmcgbGlzdC4NCj4gDQo+IENoZWVycywNCj4gDQo+IEpvZWwNCg0KVGhh
bmsgeW91IEpvZWwuIEkgd2lsbCBwb3N0IHRoZSBxdWVzdGlvbiB0byBuZXRkZXYgbGlzdCBsYXRl
ci4NCg0KDQpDaGVlcnMsDQoNClRhbw0K
