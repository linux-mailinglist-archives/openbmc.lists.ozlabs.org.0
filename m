Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D196E32
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CpJv4cL4zDr9w
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:22:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=313618a0cd=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="G3g6qr2Z"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jTIMrv88"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CpGH4TpCzDrHq
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:20:16 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L0K4TB004817; Tue, 20 Aug 2019 17:20:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ePVbStuCXA8Bv85rPonD2lWg/JdQ5vW8GYR/zSOge1I=;
 b=G3g6qr2ZQyyXjgU/5EU9I121o1FtdyTMAp9BP0P4VDmLlDokKXtNnOGBJ9l96U9jsSXj
 ormOnBi4oh7ZPR9cLE1Bwqzn1nYHRLxI5Ib3YOTOz/MNy0vuU/6UbaUK0l/8m8ifzkb9
 Z8gMPEBrkm85tZ+ofQP+sTPd10pO1CtHed8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ugrv7rm5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Aug 2019 17:20:05 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 17:20:04 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 17:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGHLeASWK17CrScORRLuUL8GBgW5gYtod0kyXJtXcz9xFhCQ0MOoHSsq5v24pNpSslc0lm/dWuThaqPtT7vcmf0CHQ2CYIxYhFx+SbYFhRgx4s2M+dV5ZputJcOptvQQZMrpu/SovqHfH4i7fKlllyLIf/ZKYswdpys5F69tFhCek66Ak0xpEEd6Rd6PpYwYhFdmAt2EqdzWHMcu5+Y1PS4NYJ7rC3kRIVdk0owhj1nBjHfaYHR9gQFssaJy0XJnb5VWnipFstIYFtMkwzH+ciVo6OpiJUTHN+UgNTn2TTLa0Xv5owNmZ6JV2Q5soYUuxGVWiyhZr4v3C6jkHJVl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePVbStuCXA8Bv85rPonD2lWg/JdQ5vW8GYR/zSOge1I=;
 b=jZbXOXVy/JKgdfsdKz/1M8nDJMHqW1vVh3BUoEOmuOcp4Xo/V2ErM28fcj6QFF4Bm5Vpv93vuO+vB2uHh0ucDCGP6LLkgT+p8GNBI1rvw4pJtvDCYpBQZTMKwUzH1ui1KPNJuMZ5hKbhF4zjBCuVuwHi4AuNlOGm5zC1oFTdBIR2q3H9o1zgy7977NGFqzcaVBzZ2MgBV/rw3GWWLDlCYQUE9LNzHznlXH7rykQP133L0nIcnqwSAHTnvR5Oxc32cK6cyGXtwjDCrkPJ3Dvtw85Mj6DdEK4KTxbN6qrlt7bjQT2T+UTfoWiS5wINFnl3zAM1lZzfZb8W0ZgaN+ZyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePVbStuCXA8Bv85rPonD2lWg/JdQ5vW8GYR/zSOge1I=;
 b=jTIMrv88ofri11fqos3LYI/69SwqAhOanireGGdFoL+2RYDOTRPo8yipjB9AMHjMQv4gbqRoaCCFWm3ADQFiiJJP6QyF17MmjItJ2vBQwOWYecjS05lZymrwcsfGtH8rwZJYyrDwFKz0Il9Z4+elHEhvEojPrgIKRz2KNVkCBc4=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1888.namprd15.prod.outlook.com (10.174.100.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 00:20:03 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 00:20:03 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAAAO5AA==
Date: Wed, 21 Aug 2019 00:20:03 +0000
Message-ID: <b4f82e5a-98a3-ad8b-9265-31a4bcbd4d16@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
In-Reply-To: <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::17) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:7d53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb222229-88c7-40a0-8871-08d725cd4f9c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1888; 
x-ms-traffictypediagnostic: MWHPR15MB1888:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB1888790D1BB9941DF0F7A1A6B2AA0@MWHPR15MB1888.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:193;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(136003)(346002)(366004)(376002)(189003)(199004)(71190400001)(71200400001)(31696002)(2906002)(14454004)(99286004)(110136005)(58126008)(6506007)(53546011)(66946007)(66476007)(66556008)(64756008)(66446008)(6486002)(386003)(229853002)(36756003)(476003)(966005)(6116002)(14444005)(256004)(11346002)(86362001)(2616005)(478600001)(446003)(486006)(6306002)(2501003)(6512007)(53936002)(31686004)(6246003)(186003)(45080400002)(46003)(25786009)(7736002)(5660300002)(6436002)(305945005)(316002)(8936002)(65806001)(65956001)(8676002)(81156014)(81166006)(102836004)(76176011)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1888;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7WKwIByB0XroH+XrtClJplYXvdzdhTu4ONtJLg4FIfiK4qlQuXV4fCouRBXUlDoiX6UBaPbDo2JGXe61SYZSartXDnh4h8HAYlhQG8e7taBhDc/cHvPI6UrKKVG4JSclbq3WC6QoQQbCvdWKu1CFNhm/xMHEzSUcZIywM2xbKhdKBZ3M66aqhuShIJnVK0Naepk81Ds1dw+woKoosanS+MqDwUBMMdRNzb11Mtr2ysWoeamgAZCL6UiDwb/k6QNoGD1AOdKQ5VpTyo/lo8Une7F3garK5CbHH2G1K5CP2kkFCFvgA1DauDOD1QlQooz4Qhq1aUprXbrtD2Ig8ihAm/tAIMWn3hC67P/MILG4KZLBJmjiRpI9rNNqxPxzRXtaLFCKrRQUH90RqCYzZI71WhNMfMk+1i4AqBb4YrBziaY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ED6C9820081404C9409C62E80049E92@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb222229-88c7-40a0-8871-08d725cd4f9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 00:20:03.3115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEh7LX2vhHfJ3A0c7qp8OkwmnEXyXdYI+sldu/VRM66X/+g5lYR6KW5nHPEDzGlq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1888
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210002
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

T24gOC8yMC8xOSA1OjA2IFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4gDQo+IA0KPiBPbiBX
ZWQsIDIxIEF1ZyAyMDE5LCBhdCAwODo0MiwgVGFvIFJlbiB3cm90ZToNCj4+IE9uIDgvMjAvMTkg
NDowOSBQTSwgVGFvIFJlbiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IEkgaGl0IGZvbGxvd2lu
ZyBqZmZzMiBidWcgd2hpbGUgcnVubmluZyBMaW51eCA1LjAuMyBvbiBDTU0gKEFTUEVFRDI1MDAp
IEJNQyBwbGF0Zm9ybS4gSGFzIGFueW9uZSBzZWVuIHRoZSBpc3N1ZSBiZWZvcmU/IEFueSBzdWdn
ZXN0aW9ucz8gDQo+Pj4NCj4+PiBbICAgNDYuMDI0MDE3XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJl
IF0tLS0tLS0tLS0tLS0NCj4+PiBbICAgNDYuMDc5MTc4XSBrZXJuZWwgQlVHIGF0IC9kYXRhL3Vz
ZXJzL3Rhb3Jlbi9vcGVuYm1jL2J1aWxkLWNtbS90bXAvd29yay1zaGFyZWQvY21tL2tlcm5lbC1z
b3VyY2UvZnMvamZmczIvZ2MuYzozOTUhDQo+Pj4gWyAgIDQ2LjIwNDA3Nl0gSW50ZXJuYWwgZXJy
b3I6IE9vcHMgLSBCVUc6IDAgWyMxXSBBUk0NCj4+PiBbICAgNDYuMjYxMzc4XSBNb2R1bGVzIGxp
bmtlZCBpbjogZXh0NCBtYmNhY2hlIGpiZDIgY3J5cHRvX2hhc2gNCj4+PiBbICAgNDYuMzI5MDkz
XSBDUFU6IDAgUElEOiAxMTgxIENvbW06IGpmZnMyX2djZF9tdGQzIE5vdCB0YWludGVkIDUuMC4z
LWNtbSAjMQ0KPj4+IFsgICA0Ni40MTEzNDNdIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgRFQgYmFz
ZWQgc3lzdGVtDQo+Pj4gWyAgIDQ2LjQ2ODY4NV0gUEMgaXMgYXQgamZmczJfZ2FyYmFnZV9jb2xs
ZWN0X3Bhc3MrMHg2ZjQvMHg3MzQNCj4+PiBbICAgNDYuNTM1MzIyXSBMUiBpcyBhdCBqZmZzMl9n
YXJiYWdlX2NvbGxlY3RfcGFzcysweDZmNC8weDczNA0KPj4+IFsgICA0Ni42MDE5NzddIHBjIDog
Wzw4MDJjMjkyYz5dICAgIGxyIDogWzw4MDJjMjkyYz5dICAgIHBzcjogNjAwMDAwMTMNCj4+PiBb
ICAgNDYuNjc2OTU5XSBzcCA6IGFmM2NkZWQwICBpcCA6IGI1NmE3NWMwICBmcCA6IGFmM2NkZjI0
DQo+Pj4gWyAgIDQ2LjczOTQ2M10gcjEwOiBiNDA2MTE0MCAgcjkgOiBiNTdhMzkwMCAgcjggOiBi
NTU1ZDRhYw0KPj4+IFsgICA0Ni44MDE5NjhdIHI3IDogYjU1NWQ0YWMgIHI2IDogYjQwMzUwMmMg
IHI1IDogMDAwMDAwMDAgIHI0IDogYjQwMzUwMDANCj4+PiBbICAgNDYuODgwMDczXSByMyA6IGI1
NmE3NWMwICByMiA6IDAwMDAwMDAwICByMSA6IDAwMDAwMDAwICByMCA6IGI0MDM1MDJjDQo+Pj4g
WyAgIDQ2Ljk1ODE3N10gRmxhZ3M6IG5aQ3YgIElSUXMgb24gIEZJUXMgb24gIE1vZGUgU1ZDXzMy
ICBJU0EgQVJNICBTZWdtZW50IG5vbmUNCj4+PiBbICAgNDcuMDQzNTYxXSBDb250cm9sOiAwMGM1
Mzg3ZCAgVGFibGU6IGI1Nzc0MDA4ICBEQUM6IDAwMDAwMDUxDQo+Pj4gWyAgIDQ3LjExMjMxOV0g
UHJvY2VzcyBqZmZzMl9nY2RfbXRkMyAocGlkOiAxMTgxLCBzdGFjayBsaW1pdCA9IDB4NTQzNzJm
ZmUpDQo+Pj4gWyAgIDQ3LjE5MjQ5MF0gU3RhY2s6ICgweGFmM2NkZWQwIHRvIDB4YWYzY2UwMDAp
DQo+Pj4gWyAgIDQ3LjI0NDYwMV0gZGVjMDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMDAwMDAwMDAgODBhMDcwMjggODAwYWQ2YzkgMDAwMGZmMmMNCj4+PiBbICAgNDcuMzQy
NDY4XSBkZWUwOiBhZjNjZGVmYyBhZjNjZGVmMCA4MDEyNWNkNCA4MDEyMzEzYyBhZjNjZGYyNCA4
MDBhZDZjOSA4MDEyNjE0YyBiNDAzNTAwMCANCj4+PiBbICAgNDcuNDQwMzMxXSBkZjAwOiBmZmZm
ZTAwMCBhZjNjYzAwMCBhZjNjYzAwMCBiNDAzNTAwMCA4MDJjNTA5YyBiNDE5ZGQxOCBhZjNjZGY3
NCBhZjNjZGYyOA0KPj4+IFsgICA0Ny41MzgxOTZdIGRmMjA6IDgwMmM1MTc0IDgwMmMyMjQ0IGZm
ZmZlMDAwIDAwMDAwMDAxIDAwMDAwMDAwIGZmZmZlMDAwIGI1N2IwOTQwIDAwMDAwMDAwDQo+Pj4g
WyAgIDQ3LjYzNjA1OF0gZGY0MDogZmZmZmUwMDAgYjQwMzUwMDAgODAyYzUwOWMgYjQxOWRkMTgg
YWYzY2RmNzQgODAwYWQ2YzkgYjU3NTM5ODAgYjU3NTM5ODANCj4+PiBbICAgNDcuNzMzOTIzXSBk
ZjYwOiBiNTdiMDk0MCAwMDAwMDAwMCBhZjNjZGZhYyBhZjNjZGY3OCA4MDEzNGQ1OCA4MDJjNTBh
OCBiNTc1Mzk5OCBiNTc1Mzk5OA0KPj4+IFsgICA0Ny44MzE3ODddIGRmODA6IGFmM2NkZmFjIGI1
N2IwOTQwIDgwMTM0YzBjIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAw
MDAwDQo+Pj4gWyAgIDQ3LjkyOTY0OF0gZGZhMDogMDAwMDAwMDAgYWYzY2RmYjAgODAxMDEwZTgg
ODAxMzRjMTggMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4+PiBbICAgNDgu
MDI3NTEyXSBkZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KPj4+IFsgICA0OC4xMjUzNzZdIGRmZTA6IDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwDQo+Pj4gWyAgIDQ4LjIyMzIzMF0gQmFja3RyYWNlOiAgDQo+Pj4gWyAgIDQ4
LjI1MjQ4OV0gWzw4MDJjMjIzOD5dIChqZmZzMl9nYXJiYWdlX2NvbGxlY3RfcGFzcykgZnJvbSBb
PDgwMmM1MTc0Pl0gKGpmZnMyX2dhcmJhZ2VfY29sbGVjdF90aHJlYWQrMHhkOC8weDFhYykNCj4+
PiBbICAgNDguMzc1Mjk0XSAgcjEwOmI0MTlkZDE4IHI5OjgwMmM1MDljIHI4OmI0MDM1MDAwIHI3
OmFmM2NjMDAwIHI2OmFmM2NjMDAwIHI1OmZmZmZlMDAwDQo+Pj4gWyAgIDQ4LjQ2ODk4NV0gIHI0
OmI0MDM1MDAwDQo+Pj4gWyAgIDQ4LjQ5OTI4MV0gWzw4MDJjNTA5Yz5dIChqZmZzMl9nYXJiYWdl
X2NvbGxlY3RfdGhyZWFkKSBmcm9tIFs8ODAxMzRkNTg+XSAoa3RocmVhZCsweDE0Yy8weDE2NCkN
Cj4+PiBbICAgNDguNjAzMzU4XSAgcjY6MDAwMDAwMDAgcjU6YjU3YjA5NDAgcjQ6YjU3NTM5ODAN
Cj4+PiBbICAgNDguNjU4NTkwXSBbPDgwMTM0YzBjPl0gKGt0aHJlYWQpIGZyb20gWzw4MDEwMTBl
OD5dIChyZXRfZnJvbV9mb3JrKzB4MTQvMHgyYykNCj4+PiBbICAgNDguNzQ1MDAxXSBFeGNlcHRp
b24gc3RhY2soMHhhZjNjZGZiMCB0byAweGFmM2NkZmY4KQ0KPj4+IFsgICA0OC44MDU0MjhdIGRm
YTA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwDQo+Pj4gWyAgIDQ4LjkwMzI5Nl0gZGZjMDogMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDANCj4+PiBbICAgNDkuMDAxMTU3XSBkZmUwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAxMyAwMDAwMDAwMA0KPj4+IFsgICA0OS4wODAzMDVdICByMTA6MDAwMDAw
MDAgcjk6MDAwMDAwMDAgcjg6MDAwMDAwMDAgcjc6MDAwMDAwMDAgcjY6MDAwMDAwMDAgcjU6ODAx
MzRjMGMNCj4+PiBbICAgNDkuMTc0MDAwXSAgcjQ6YjU3YjA5NDANCj4+PiBbICAgNDkuMjA0Mjc1
XSBDb2RlOiBlNTlmMDA0NCBlYmZhMjVjYiBlMWEwMDAwNiBlYjBlODg4ZCAoZTdmMDAxZjIpDQo+
Pj4gWyAgIDQ5LjI3NzE4OF0gLS0tWyBlbmQgdHJhY2UgNmJhYTdhZjBhOTBkMTVhYiBdLS0tDQo+
Pj4gWyAgIDQ5LjMzMjM5NV0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2Vw
dGlvbg0KPj4NCj4+IEJUVywgYmVsb3cgYXJlIGFsbCB0aGUgbWVzc2FnZXMgcHJpbnRlZCBieSBq
ZmZzMiBiZWZvcmUgc3lzdGVtIGNyYXNoOg0KPj4NCj4+IFsgICAyMS4wNzg0MzNdIGpmZnMyOiB2
ZXJzaW9uIDIuMi4gKFNVTU1BUlkpICDCqSAyMDAxLTIwMDYgUmVkIEhhdCwgSW5jLg0KPj4gWyAg
IDM5Ljc3NjIwN10gamZmczI6IG5vdGljZTogKDExODApIGpmZnMyX2J1aWxkX3hhdHRyX3N1YnN5
c3RlbTogDQo+PiBjb21wbGV0ZSBidWlsZGluZyB4YXR0ciBzdWJzeXN0ZW0sIDAgb2YgeGRhdHVt
ICgwIHVuY2hlY2tlZCwgMCBvcnBoYW4pIA0KPj4gYW5kIDAgb2YgeHJlZiAoMCBkZWFkLCAwIG9y
cGhhbikgZm91bmQuDQo+PiBbICAgNDAuMDE2NTc0XSBqZmZzMjogd2FybmluZzogKDExODEpIGpm
ZnMyX2RvX3JlYWRfaW5vZGVfaW50ZXJuYWw6IG5vIA0KPj4gZGF0YSBub2RlcyBmb3VuZCBmb3Ig
aW5vICMxNDANCj4+IFsgICA0MC4xMjI5NjRdIGpmZnMyOiBub3RpY2U6ICgxMTgxKSBqZmZzMl9k
b19yZWFkX2lub2RlX2ludGVybmFsOiBidXQgDQo+PiBpdCBoYXMgY2hpbGRyZW4gc28gd2UgZmFr
ZSBzb21lIG1vZGVzIGZvciBpdA0KPj4gWyAgIDQzLjU3OTM2MV0gamZmczI6IHdhcm5pbmc6ICgx
MTgxKSBqZmZzMl9nZXRfaW5vZGVfbm9kZXM6IEVlcC4gTm8gDQo+PiB2YWxpZCBub2RlcyBmb3Ig
aW5vICMxNDEuDQo+PiBbICAgNDMuNjc5NDA0XSBqZmZzMjogd2FybmluZzogKDExODEpIGpmZnMy
X2RvX3JlYWRfaW5vZGVfaW50ZXJuYWw6IG5vIA0KPj4gZGF0YSBub2RlcyBmb3VuZCBmb3IgaW5v
ICMxNDENCj4+IFsgICA0My43ODU2NjFdIGpmZnMyOiBSZXR1cm5lZCBlcnJvciBmb3IgY3JjY2hl
Y2sgb2YgaW5vICMxNDEuIEV4cGVjdCANCj4+IGJhZG5lc3MuLi4NCj4+IFsgICA0NC4wMjE4MjVd
IGpmZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZG9fcmVhZF9pbm9kZV9pbnRlcm5hbDogbm8g
DQo+PiBkYXRhIG5vZGVzIGZvdW5kIGZvciBpbm8gIzE1NA0KPj4gWyAgIDQ0LjEyODE5MV0gamZm
czI6IG5vdGljZTogKDExODEpIGpmZnMyX2RvX3JlYWRfaW5vZGVfaW50ZXJuYWw6IGJ1dCANCj4+
IGl0IGhhcyBjaGlsZHJlbiBzbyB3ZSBmYWtlIHNvbWUgbW9kZXMgZm9yIGl0DQo+PiBbICAgNDQu
MzE0ODYyXSBqZmZzMjogd2FybmluZzogKDExODEpIGpmZnMyX2RvX3JlYWRfaW5vZGVfaW50ZXJu
YWw6IG5vIA0KPj4gZGF0YSBub2RlcyBmb3VuZCBmb3IgaW5vICMxNTUNCj4+IFsgICA0NC40MjEx
NTJdIGpmZnMyOiBub3RpY2U6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2ludGVybmFsOiBi
dXQgDQo+PiBpdCBoYXMgY2hpbGRyZW4gc28gd2UgZmFrZSBzb21lIG1vZGVzIGZvciBpdA0KPj4g
WyAgIDQ0LjYwNzM3OF0gamZmczI6IHdhcm5pbmc6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2Rl
X2ludGVybmFsOiBubyANCj4+IGRhdGEgbm9kZXMgZm91bmQgZm9yIGlubyAjMTYzDQo+PiBbICAg
NDQuNzEzNjkyXSBqZmZzMjogbm90aWNlOiAoMTE4MSkgamZmczJfZG9fcmVhZF9pbm9kZV9pbnRl
cm5hbDogYnV0IA0KPj4gaXQgaGFzIGNoaWxkcmVuIHNvIHdlIGZha2Ugc29tZSBtb2RlcyBmb3Ig
aXQNCj4+IFsgICA0NC44OTk5OTFdIGpmZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZ2V0X2lu
b2RlX25vZGVzOiBFZXAuIE5vIA0KPj4gdmFsaWQgbm9kZXMgZm9yIGlubyAjMTY0Lg0KPj4gWyAg
IDQ1LjAwMDEwN10gamZmczI6IHdhcm5pbmc6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2lu
dGVybmFsOiBubyANCj4+IGRhdGEgbm9kZXMgZm91bmQgZm9yIGlubyAjMTY0DQo+PiBbICAgNDUu
MTA2MzcwXSBqZmZzMjogUmV0dXJuZWQgZXJyb3IgZm9yIGNyY2NoZWNrIG9mIGlubyAjMTY0LiBF
eHBlY3QgDQo+PiBiYWRuZXNzLi4uDQo+PiBbICAgNDUuOTM0MjgyXSBqZmZzMjogSW5vZGUgIzEw
NiBhbHJlYWR5IGluIHN0YXRlIDAgaW4gDQo+PiBqZmZzMl9nYXJiYWdlX2NvbGxlY3RfcGFzcygp
IQ0KPiANCj4gTG9va3MgbGlrZSBhIGxhY2sgb2Ygcm9idXN0bmVzcyB0byBmaWxlc3lzdGVtIGNv
cnJ1cHRpb24gdG8gbWUuIExXTg0KPiBwdWJsaXNoZWQgYW4gYXJ0aWNsZSBvbiB0aGUgdG9waWMg
anVzdCB5ZXN0ZXJkYXkhDQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cHMtM0FfX2x3bi5uZXRfQXJ0aWNsZXNfNzk2Njg3XyZkPUR3SUZhUSZjPTVW
RDBSVHRObFRoM3ljZDQxYjNNVXcmcj1pWUVsVDdIQzc3cFJaM2J5VnZXOG5nJm09Vkk3czdGblFQ
ME9vZTZ0RUpQdHBqYWp3R0ROaDRGaFFqVGdpUmJXOGhtayZzPW9iclVnUDN3bzd6Q3RNVGs4Y25F
TVhoeGFGOVZTSm15MWlKZVN4S0htdDgmZT0gDQo+IA0KPiBBbmRyZXcNCg0KVGhhbmsgeW91IGZv
ciB0aGUgc2hhcmluZywgQW5kcmV3LiBMZXQgbWUgY2hlY2sgb3V0IHRoZSBhcnRpY2xlLi4NCg0K
DQpDaGVlcnMsDQoNClRhbw0K
