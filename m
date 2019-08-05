Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2158127F
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 08:40:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627Sj1Z5GzDqVp
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 16:40:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3120bdbce4=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gEMyqdrA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Hgq4zVLD"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46277134mWzDqS9
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 16:25:25 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x756MCqh020164; Sun, 4 Aug 2019 23:25:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=gH5/LqhQnqmOr+hBXY0kQaGKKS3AzcAjl7rnWaa9s+o=;
 b=gEMyqdrAFNpjca7PtMIOi/1L1VoDsGSF2W9bKubUhFyZl9AhWewOP6ZB3Qxk0YbZoHVt
 /4v8QvBW5xSzEiyf4wQj+cUSBSKbZ8XaoQwpGG15+Y++bOUdTW4WwW7AucNubG3x7HFj
 7hhg7MYeRM2l4dFWkjjwN+IltR951mQgEQQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0b-00082601.pphosted.com with ESMTP id 2u6a52rq1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 04 Aug 2019 23:25:20 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Aug 2019 23:25:19 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Aug 2019 23:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4IG8EcEdGS+SPLbZwkBlHF7xQpWnvFpPiGFL6DO7QAeu4ru7a4tDN2nB5QGRPcIbufgHj2LtHOHoEkWYO0NA3V0BfOPzlKJnPv26x+Ff4qgCSHtnob8yzF2BDLC7QwvscymhyhpEs0dqwARJgz0BsGJ2qz8l/U6AGB3B7BmzUacTx81z7FaXX4tjkW1fxA0QzbxdZkOeFSplLGeVJJcLvCUyqxETG7pRBu/GyKprB5dXL3yfkm913hf74OCMg+9cHNY8lq3iQzpDbzRmNPi3XM/J48w2o434i44eqpLnZRMMogHYWzn3kRc4UeX2emAJ96d4WUso3wwiKq0W7WZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH5/LqhQnqmOr+hBXY0kQaGKKS3AzcAjl7rnWaa9s+o=;
 b=HeB7V+4fbZLzbVYqr0iGF2Ce/yP0rKOEEvfnYnyBWpGETMd606LHcTVTWLPCEwmDCGnrIv8hSxX5Ael4KHDNuj47OWLBaytaqZk3Zvk73Gn+P3rZ3lzVLI64AueqSVqAK+r+vOG/pUzj+8/uxiJrtdydU8hpGPn4nJ0KIue/JlENzQfdpjA9cAUvwpMLDpB2EhASDMJo3DpcDaKSVREeGvKbeCmItp4pxUwESyNNJ4d7L3J1qs9vE4EIyR9CpTsUkukWW76F/HcPp/H6ZoJUx7Aiq0S/TZBSKVq2izKreCMtrxZjJcSHGOD9tdZvpuureAZA3vgeCfVfvldXPqqifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH5/LqhQnqmOr+hBXY0kQaGKKS3AzcAjl7rnWaa9s+o=;
 b=Hgq4zVLD6tLveKwhCAGChMaNn3N1Pq5T9jgWYRPfhv5Tb1n8v60YyS3QtWmY0hA7JdjjvuVHeRk7GVBSf2LmpS067JY4EYrRAkMb2NW6Jvcy61jNnltXWe4R9Tu6U84C0GVSND9yXRMGk5AGRYDu03ZKZzgbSaN2DdPpz8JQeU4=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1806.namprd15.prod.outlook.com (10.174.255.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:25:05 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 06:25:05 +0000
From: Tao Ren <taoren@fb.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley
 <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Topic: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Index: AQHVSK4qEQp9fTkZYki4gxm4espglabr+4CAgAAOloCAABGUAA==
Date: Mon, 5 Aug 2019 06:25:04 +0000
Message-ID: <0b6f707a-04c9-cc96-356d-5b060d9c9ee0@fb.com>
References: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
 <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
 <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
In-Reply-To: <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR2201CA0002.namprd22.prod.outlook.com
 (2603:10b6:301:28::15) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::7ac7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff8f990e-8f0b-4657-cd20-08d7196da76d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1806; 
x-ms-traffictypediagnostic: MWHPR15MB1806:
x-microsoft-antispam-prvs: <MWHPR15MB18069707B634EC89B33FC81BB2DA0@MWHPR15MB1806.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(256004)(6506007)(65826007)(110136005)(58126008)(52116002)(31696002)(36756003)(86362001)(4326008)(25786009)(76176011)(64126003)(68736007)(99286004)(6246003)(316002)(5660300002)(186003)(8936002)(53546011)(478600001)(6436002)(81156014)(81166006)(102836004)(71200400001)(31686004)(6512007)(53936002)(386003)(71190400001)(6116002)(476003)(486006)(2616005)(11346002)(7736002)(305945005)(6486002)(446003)(2906002)(46003)(65956001)(65806001)(64756008)(66556008)(66476007)(66946007)(66446008)(229853002)(14454004)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1806;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wZ1C7TFpdybBZAWDfW7oYqw3hecklfrGk1kPLLOkdOnCs/tbSHE5/SIKGDHcpaQW2aLC4y7fFDdzrY9F4wLjtMiwc9q3TN1SnV/watGT2iYzWCh3KJN3tUaX0nbSg8YBPU3scEpl8WM/8tJA4oJppeanVk/D/6HyOyHINqp3557F+eZDSKj+noyh7gpCnQMfip3xAgdg3eEhRikfLAOZbgc0JNTjYHdLQRHHcWz2B1g8PyQOlypWnJRxXbGNcH7/uw6ZV/1MzporIDIJyhwDm2yLVYrRaYkV+MJcMvooOCr3PjCQrS3npjqygZ4oGdtaw0YxGwdonDnbzJaYoZNL2hWPrnl+IAujKsCprJcbqtIYMHB1E5Zy7tzMQ6zMX9JDe2zAZapAeEmTlWbjc5dZXCfxFFfzxusaZkLTQBikcQc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E967D2B86895504FAF48E3AF77CA61B0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8f990e-8f0b-4657-cd20-08d7196da76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:25:04.9624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1806
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908050071
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC80LzE5IDEwOjIyIFBNLCBTYW11ZWwgTWVuZG96YS1Kb25hcyB3cm90ZToNCj4gT24gTW9u
LCAyMDE5LTA4LTA1IGF0IDA0OjI5ICswMDAwLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+PiBIaSBU
YW8sDQo+Pg0KPj4gT24gVGh1LCAxIEF1ZyAyMDE5IGF0IDIxOjE1LCBUYW8gUmVuIDx0YW9yZW5A
ZmIuY29tPiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IEknbSBydW5uaW5nIEZhY2Vib29rIFlh
bXAgQVNUMjUwMCBCTUMgYW5kIGl0cyBNQUMgaXMgY29ubmVjdGVkIHRvDQo+Pj4gQnJvYWRjb20g
TkNTSS1OSUMuIFdoZW4gQ09ORklHX05DU0lfT0VNX0NNRF9HRVRfTUFDIGlzIGVuYWJsZWQsDQo+
Pj4gQk1DJ3MgTUFDIGFkZHJlc3MgaXMgY2FsY3VsYXRlZCBieSBhZGRpbmcgMSB0byBOQ1NJLU5J
QydzIGJhc2UgTUFDLg0KPj4NCj4+IFRoaXMgd291bGQgYmUgYSBnb29kIHF1ZXN0aW9uIGZvciB0
aGUgTkNTSSBtYWludGFpbmVycy4gSSd2ZSBhZGRlZA0KPj4gU2FtDQo+PiBhbmQgSmVyZW15IHRv
IGNjLg0KDQpUaGFuayB5b3UgSm9lbC4NCg0KPj4+IFRoaXMgYWRkaW5nLW9uZSBsb2dpYyBkb2Vz
bid0IHdvcmsgZm9yIFlhbXAgYmVjYXVzZSBIb3N0LUJNQyBNQUMNCj4+PiBvZmZzZXQgbmVlZHMg
dG8gYmUgMi4gV2hhdCB3b3VsZCBiZSB0aGUgcHJlZmVycmVkIHdheSB0byBmaXggaXQ/DQo+Pj4g
Rm9yIGV4YW1wbGU6DQo+Pj4NCj4+PiAxKSBhZGRpbmcgYSBkZXZpY2UgdHJlZSBub2RlIChzdWNo
IGFzICJuY3NpLWJtYy1tYWMtb2Zmc2V0IikgYW5kDQo+Pj4gc2VuZCBpdCB0byBuY3NpIHN0YWNr
IHdoZW4gY2FsbGluZyBuY3NpX3JlZ2lzdGVyX2Rldj8NCj4+Pg0KPj4+IDIpIGFkZGluZyBhIGRl
dmljZSB0cmVlIG5vZGUgdG8gYmUgcGFyc2VkIGluIG5jc2kgc3RhY2sgZGlyZWN0bHk/DQo+Pj4N
Cj4+PiAzKSBhZGRpbmcgYSBLQ09ORklHIG9wdGlvbiBzbyBpdCBjYW4gYmUgcGFyc2VkIGluIG5j
c2ktcnNwLmMNCj4+PiBkaXJlY3RseT8NCj4+Pg0KPiANCj4gSGkgVGFvLA0KPiANCj4gTXkgZmly
c3QgdGhvdWdodCBpcyB0aGF0IHNpbmNlIHRoaXMgaXMgYW4gT0VNLW9ubHkgZXh0ZW5zaW9uIGVu
YWJsZWQNCj4ganVzdCBieSB0aGF0IGNvbmZpZyBvcHRpb24sIHRoYXQgcGVyaGFwcyBhIEtjb25m
aWcgb3B0aW9uIGlzIHRoZSBsZWFzdA0KPiBvYnRydXNpdmUgbWV0aG9kIHRvIGN1c3RvbWlzZSB0
aGUgaW5jcmVtZW50Lg0KPiBBbnkgdGhvdWdodHMgZnJvbSBvdGhlciB1c2Vycz8NCj4gDQo+IFNh
bQ0KDQpUaGFuayB5b3UgU2FtIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UuDQpMZXQgbWUgcHJlcGFy
ZSBhIHBhdGNoICh1c2luZyBjb25maWcgb3B0aW9uKSBhbmQgc2VuZCBvdXQgZm9yIHJldmlldyBz
b21ldGltZSB0aGlzIHdlZWsuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg==
