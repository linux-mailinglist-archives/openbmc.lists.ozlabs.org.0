Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E073CA768F
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 23:53:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NLL33LvNzDqpv
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 07:53:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4149b83a3f=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gv5Yw/n4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Diz1WtCn"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NLKV3dNVzDqKb
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 07:52:45 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83LnZ3R025291; Tue, 3 Sep 2019 14:52:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=QVyMGE+h/jQksZ96JlAwGWzm9bnGkcgWLKo9lriJGgQ=;
 b=gv5Yw/n4xDd97D6/pJ/x2PP0HxepUrkzs1GRF0b9OK0ZGb8/htlYdM5uta0VMO6laXrp
 Q9j3yRgqXiacYf9kXtYqwq1gRaHs8N9kfBkgHnql67fDq36d3q4nkZgBLDzIueQU0ALA
 g/2yEpKRM34Lco0HVPnSYIYqTONxAy0BePI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ustcmhu6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 14:52:40 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 3 Sep 2019 14:52:38 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Sep 2019 14:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNG2UdOiG50UMOuwcLFQhD2PMAKcJYwQf2rrgi8sPfoFR9F4ymEMuXngvHmbR2QjMw7yKlcfJiAPROOsbPfEKh8qT/vURZzHjdDdA5Mh5cobuzP6hjljG6O/jxi08cEDm2arrNThuzkSSjSqq1yz+HWh93i7FP0u/7CDW7sX4oHUPZljZIdF5dQBbn7Dxe/fjwDZn0TcNnDkK9Px/ctg78An4Rg+q28hI3aHG3+zQpQ83CzOYygL5iwJKeDGM8P4NsCpwajAH7UhdATuUu/8GLS98rSRpwrqIOi+ScZUOGjrAtu/b8OPd4uPW9iqJC9R2eZVZrH+mV1Gjzw9i4XlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVyMGE+h/jQksZ96JlAwGWzm9bnGkcgWLKo9lriJGgQ=;
 b=XxGCKHypidWnyqHU9QzZ3Ng3YMJVUga4n4eGKjOw5NjoIL2osXyL/c91fkZYMwJW9wyANPf9ShSAcHyo1jAJan/TttuumsDnWTCcWVL9wQN3owTcrqImpxeyr6kqVYFzEeimC/T3xV77wR0k8BVniOhLCcs/8imb3jIksxchrcnlbbk/7/zpIBVHRkAqJdnPXQJvrOVRWoiTsD0YVwlEwA6iPAgu3ZvfM1lTQ2tOsI+wMhGxVhkSP5ZTmuPkvzQrQ5kwNxCiFQxD0GAxVzDYMHyRHa2Uz2/vWyCpbzn4cCAFCtvur3L2sy2Wk/bv+1mQjBbXOZoxCpXQMqUL/lSo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVyMGE+h/jQksZ96JlAwGWzm9bnGkcgWLKo9lriJGgQ=;
 b=Diz1WtCnZ9Rq3dNtAOckRPjfAWI5uD3Kofyr5MdiZt7U6+91IBznlMOysJIcuCXcAgY76oPojOuctOaCd1oXnGsHNuanNaRWnMgrwRwEpQVS4aIqPg058Y/LU19ZB+MAf/DjFMFtMkvtcQl2XT8pNDOSwBz8xxesUsxsgVZ0nAg=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1727.namprd15.prod.outlook.com (10.174.96.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 3 Sep 2019 21:52:37 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 21:52:37 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: AST2500 I2C Controller got stuck in SRXD state
Thread-Topic: AST2500 I2C Controller got stuck in SRXD state
Thread-Index: AQHVYqDmxoI65lUE002/x77mu+FSg6cafh+AgAAAagA=
Date: Tue, 3 Sep 2019 21:52:37 +0000
Message-ID: <b8ededa1-60d2-f215-2b4b-35d91c056039@fb.com>
References: <7af0671b-524c-02a7-fc6c-60360b06f0db@fb.com>
 <fc49fd92-856a-456e-6be3-2ddcee16aa82@linux.intel.com>
In-Reply-To: <fc49fd92-856a-456e-6be3-2ddcee16aa82@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR12CA0072.namprd12.prod.outlook.com
 (2603:10b6:300:103::34) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::9c56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57f788a9-2803-42ae-4ea9-08d730b908dd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1727; 
x-ms-traffictypediagnostic: MWHPR15MB1727:
x-microsoft-antispam-prvs: <MWHPR15MB172726C1A140E2F3C3B47CD2B2B90@MWHPR15MB1727.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(486006)(476003)(110136005)(11346002)(31686004)(2616005)(58126008)(316002)(446003)(46003)(6436002)(36756003)(31696002)(86362001)(52116002)(6486002)(66446008)(81156014)(66556008)(305945005)(8676002)(65806001)(65956001)(66476007)(66946007)(64756008)(7736002)(5660300002)(6512007)(186003)(71190400001)(71200400001)(229853002)(99286004)(81166006)(8936002)(53936002)(6246003)(102836004)(25786009)(2906002)(53546011)(478600001)(6506007)(386003)(14454004)(76176011)(6116002)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1727;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: al+e/Nn2gIxz3iawJwe2/zEbUxqqH4l+bV13q6n47rLBJ45PzhtzKeCtyjqhSRA4/yWygW93+VAOokve5BlvIvcKALnl5HCz2QyFfMhsKeHztA535jWIOe5hc3eR1VoQOg8L+PD4ijjdPSds3Eg485duj1EziCFgRdWb8EomrSlCmXIvpFOfkhERSDPxIodQFBnhb6QuH/ENewDS6uv73KdFu3ByGXzRoJPKkzuO1+tXveZQeGQJOmOWkgq1Ve3FWfu3jBGYjecPDJ8NeKSRhSFUQe902Fq16eBFysvMtnQGeYQANAlmPY3BdjFnurTNgbIPl6XeHoRSkxct2gNybl9SjhLGHkhZrxSOHWSc2MUuF6E8yuBPPoRzyTzgjIc69aG5C/y2Lfn5RjVY9WB7+vgWlQE8s+00wj7D9Y7teBY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <507FACF7F67EE748B392F8398A96BC99@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f788a9-2803-42ae-4ea9-08d730b908dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 21:52:37.3878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bo9mnnVwqqs+ZtLYS9YI/uQ3iND9I+BHdlWxoG5xrBD5Ly44g+OriFgnyy2q71Aj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1727
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_05:2019-09-03,2019-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=883 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909030216
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

T24gOS8zLzE5IDI6NTEgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToNCj4gT24gOS8zLzIwMTkgMjo0
NSBQTSwgVGFvIFJlbiB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEkgZm91bmQgdGhlIGlzc3VlIG9u
IE1pbmlwYWNrIChBU1QyNTAwKSBCTUMgaTJjLTA6IGl0J3MgbXVsdGktbWFzdGVyIGVudmlyb25t
ZW50IHdpdGggQk1DIGFuZCBCcmlkZ2VkLUlDLg0KPj4NCj4+IFRoZSBCTUMgSTJDIGNvbnRyb2xs
ZXIgZ290IHN0dWNrIGluIFNMQVZFX1JYX0RPTkUgc3RhdGUgYmVjYXVzZSBTVE9QIGNvbmRpdGlv
biBpcyBub3QgZGV0ZWN0ZWQgZHVyaW5nIG9uZSBCSUMtdG8tQk1DIHRyYW5zZmVyLg0KPj4gQmVj
YXVzZSBvZiB0aGlzLCBhbGwgdGhlIHN1YnNlcXVlbnQgSTJDIG1hc3RlciB0cmFuc2FjdGlvbnMg
d291bGQgZmFpbCB3aXRoIHRpbWVvdXQuDQo+PiBIZXJlIGlzIEJNQyBJMkMgc3RhdGUgcmVwb3J0
ZWQgaW4gSTJDRDE0IENvbW1hbmQvU3RhdHVzIHJlZ2lzdGVyOg0KPj4NCj4+IC0gSTJDRDE0WzIy
OjE5XSA9IDAxMDBiwqAgLyogdHJhbnNmZXIgc3RhdGUgbWFjaGluZTogU0xBVkVfUlhfRE9ORSAq
Lw0KPj4gLSBJMkNEMTRbMThdID0gMSAvKiBzYW1wbGVkIFNDTCBsaW5lOiBoaWdoL2lkbGUgKi8N
Cj4+IC0gSTJDRDE0WzE3XSA9IDEgLyogc2FtcGxlZCBTREEgbGluZTogaGlnaC9pZGxlICovDQo+
PiAtIEkyQ0QxNFsxNl0gPSAwIC8qIGJ1cyBpcyBpZGxlICovDQo+Pg0KPj4gSSdtIHN1c3BlY3Rp
bmcgaXQncyBjYXVzZWQgYnkgc29tZSBmbGF3cyBpbiBCSUMgZmlybXdhcmUsIGJ1dCBjYW4gd2Ug
ZG8gc29tZXRoaW5nIGluIEJNQyBzaWRlIHRvIHJlY292ZXIgdGhlIGJ1cz8NCj4+IEZvciBleGFt
cGxlOg0KPj4NCj4+IDEpIEFzIEphZSBtZW50aW9uZWQgZWFybGllciwgZW5hYmxlIHNsYXZlIGlu
YWN0aXZlIHRpbWVvdXQgaW50ZXJydXB0IGFuZCByZXNldCBidXMgd2hlbiB0aGUgaW50ZXJydXB0
IGlzIGRlbGl2ZXJlZD8NCj4+DQo+PiAyKSBDaGVjayBJMkNEMTRbMjI6MTldIGluIGFzcGVlZF9p
MmNfcmVjb3Zlcl9idXMoKSBmdW5jdGlvbiBhbmQgcmVzZXQgYnVzIGlmIG5lZWRlZD8NCj4+DQo+
IA0KPiBIaSBUYW8sDQo+IA0KPiBJIG1hZGUgdGhlIHNsYXZlIGluYWN0aXZlIHRpbWVvdXQgc3Vw
cG9ydC4gV2lsbCBzdWJtaXQgaXQgc29vbi4NCj4gDQo+IENoZWVycywNCj4gSmFlDQoNCkF3ZXNv
bWUuIFRoYW5rIHlvdSBKYWUuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg==
