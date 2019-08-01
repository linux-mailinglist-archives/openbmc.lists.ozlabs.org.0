Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6177E4B1
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 23:15:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46033q36hlzDqjL
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 07:15:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3116f30347=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="b1xIKH6h"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="SMUctI4+"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46033B6N6zzDqVD
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 07:15:00 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x71LAJ5Q027078
 for <openbmc@lists.ozlabs.org>; Thu, 1 Aug 2019 14:14:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=ITRQHICj67vBlXc9HwPg03Oe9QnPTyuVUqrIYHx4esc=;
 b=b1xIKH6h8+YtgUpaGSG9q/zP9TuwKSPrHzphkmwnXR8t5p9d16YZyIcy8gjN5f86co2/
 PmrE53Knz8s64C6cRsxCvh+Mt9DbgqHolJax4dGYOrS5/hCfa/XmBuYfa1UQtXzJTDsd
 TUukcKFzcRQ6BbgE+m6xinT1Km060iv9Rgc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u430ys8hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 14:14:57 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Aug 2019 14:14:56 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Aug 2019 14:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRf2497kOUwCWuWeMqc+gbI1POxbS6HdaUmkurkpFLvv/Y/K7ZqWmAHWe8jUVaYHn8xj9asrmhWblF96CNDZ2BVAQIfyjmuCHMS8MVnGeS/8GqoVxeBigq039gkk+XtzAKvgYxktU4A7pZYjQibZFD6E5k2bk0csD7ogVsPSR4+1aGPsyPoMKMAi4dh7emBDvBkwCLxB/+w08duAW6nO7zCwIQfvz3ZSaqYhnCCX8BF1roA97h/RfTMl+g60D7ZnWqxFn99aO5yW9kIN2CYv3P7sFmrpOFLy1rzmaMqO/g6WwZiyj+0T44hPBAAwdg1ACLHXIB9DyCwjEsAoFfDVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITRQHICj67vBlXc9HwPg03Oe9QnPTyuVUqrIYHx4esc=;
 b=Gegz+x30u4kV0yRI1EXuGo8/R7XAXFaCVfE5ESfwsuloGG630UX1oDyVnEimxQsS8o4pzUfP5FpopuI2r/JwF7MVMphf/9v87+uuiV89CVWp8NIB4xEAhV2V5q98HhPHRWeBsflLFFpIKVCZNotW13Bc9GToYinDGG/ud4dghJyH5Ispg1mlVcCUMSVnV96DBUnpTrw5W5iFiMgN44FgRncP3jzt1WZyIIuvTj71c5atSuzcKXXvscpSg3EEgzIp/DL1YdDQ7me8Upujn/EZB8QI9IOCVIvTU9Er/hxEsDzq69osyi+ltKcnVTxGbuHQQwGiNmP3TrOmFphjeDZWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITRQHICj67vBlXc9HwPg03Oe9QnPTyuVUqrIYHx4esc=;
 b=SMUctI4+woFKjk7qDcqYksjHCr2uEG/1bMJm4edikVTNwrV7xKrcjv4RufCHCsZrvhasiL+Hc87NA6O+17uVc1lh22UNYGMiVzA4tgWC09oUpDe3rWffTJJJnUF2qAFi5ND+RywVvN9Dko6tBECAPbAu07Say5lB9El691owfy0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1917.namprd15.prod.outlook.com (10.174.98.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 1 Aug 2019 21:14:55 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c%8]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 21:14:55 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Topic: Calculate BMC MAC address from NCSI NIC's base MAC
Thread-Index: AQHVSK4qIl7Q3ku170eKu7iGIPh5UQ==
Date: Thu, 1 Aug 2019 21:14:55 +0000
Message-ID: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR22CA0058.namprd22.prod.outlook.com
 (2603:10b6:300:12a::20) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:9fbd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4a20801-a47c-4d68-bd29-08d716c54cd3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1917; 
x-ms-traffictypediagnostic: MWHPR15MB1917:
x-microsoft-antispam-prvs: <MWHPR15MB19174223E29046A3F9DE118DB2DE0@MWHPR15MB1917.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(376002)(346002)(136003)(189003)(199004)(6436002)(86362001)(31696002)(52116002)(6916009)(64126003)(2906002)(6116002)(7736002)(305945005)(5660300002)(65806001)(58126008)(65956001)(4744005)(65826007)(478600001)(25786009)(14454004)(99286004)(71200400001)(71190400001)(6506007)(8676002)(81156014)(81166006)(102836004)(53936002)(386003)(6486002)(316002)(256004)(68736007)(66476007)(66556008)(31686004)(476003)(8936002)(66946007)(486006)(6512007)(186003)(66446008)(46003)(2616005)(64756008)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1917;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3TD0qD7Cxj94p3VUSoL3oT+Y8R9uz21KvW5PqQYd/UsVrw+JGh5WR2oyOX8jQw6xvmXKfM6DfDYBgzP7s6wS6umGBWhRdy4Ll2/cJSBdKlwjwIecG49Q9Xsph+bCzRNRlCs5Pocn3tyKtmtU+A1vz6waBMKcU7BT4wGZEaEDgAdfsxdqWkiYjbo6Ig+mm7Qv8CMmB9a7E7g8Scm0yT8UneBDE7Ea7iOznLB25trwTF78OKjUu5XsvNkBxYMLbZdaR3HEfr8PtSm44v8gUuImdqMZNUKwA0qIxN9mAwtK6NIHOLJxt7tmQ1oey+zd+sL/dQxtlIbjOBmstJXV+HZOGbpIe4h0kz5vXNCI5si+ZVh4IdfNOsQqE7ZeOk7Z8WFYye3iqMGKJykUdCb2+Rgikpe4YtmaOZeddK/b5PukdWo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <505B60FA0DD87E4D956C5220D9F26C69@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a20801-a47c-4d68-bd29-08d716c54cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 21:14:55.1889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1917
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=880 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010224
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

SGksDQoNCkknbSBydW5uaW5nIEZhY2Vib29rIFlhbXAgQVNUMjUwMCBCTUMgYW5kIGl0cyBNQUMg
aXMgY29ubmVjdGVkIHRvIEJyb2FkY29tIE5DU0ktTklDLiBXaGVuIENPTkZJR19OQ1NJX09FTV9D
TURfR0VUX01BQyBpcyBlbmFibGVkLCBCTUMncyBNQUMgYWRkcmVzcyBpcyBjYWxjdWxhdGVkIGJ5
IGFkZGluZyAxIHRvIE5DU0ktTklDJ3MgYmFzZSBNQUMuDQoNClRoaXMgYWRkaW5nLW9uZSBsb2dp
YyBkb2Vzbid0IHdvcmsgZm9yIFlhbXAgYmVjYXVzZSBIb3N0LUJNQyBNQUMgb2Zmc2V0IG5lZWRz
IHRvIGJlIDIuIFdoYXQgd291bGQgYmUgdGhlIHByZWZlcnJlZCB3YXkgdG8gZml4IGl0PyBGb3Ig
ZXhhbXBsZToNCg0KMSkgYWRkaW5nIGEgZGV2aWNlIHRyZWUgbm9kZSAoc3VjaCBhcyAibmNzaS1i
bWMtbWFjLW9mZnNldCIpIGFuZCBzZW5kIGl0IHRvIG5jc2kgc3RhY2sgd2hlbiBjYWxsaW5nIG5j
c2lfcmVnaXN0ZXJfZGV2Pw0KDQoyKSBhZGRpbmcgYSBkZXZpY2UgdHJlZSBub2RlIHRvIGJlIHBh
cnNlZCBpbiBuY3NpIHN0YWNrIGRpcmVjdGx5Pw0KDQozKSBhZGRpbmcgYSBLQ09ORklHIG9wdGlv
biBzbyBpdCBjYW4gYmUgcGFyc2VkIGluIG5jc2ktcnNwLmMgZGlyZWN0bHk/DQoNCg0KVGhhbmtz
LA0KDQpUYW8NCg==
