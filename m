Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B00337B9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 20:19:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hjxp3zk5zDqS1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 04:19:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=105735806b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lX/M1kKq"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="evUGGYGK"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hjx730H4zDqJs
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 04:18:46 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53I7TYk024999; Mon, 3 Jun 2019 11:18:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=w2603mR0gwStJkwwYNCJOV6xaPtE4HihjIwnBocSkaI=;
 b=lX/M1kKqtGB5n+P4SksxeFX8ZN09RzE4qB/jkTTqki7P5FzCKsKKlubHQ40bf4/Ooqkn
 sgdGyQMt8FwqFHyqggIJ5H9dMeMlRiQiK4CS1aJAZdJSKjjLfYauuRScp1A1IprGL49W
 7GuCjTg5D23pluRQUeEdSbM4dooCsxOGl2U= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2sw2qa1d1u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 03 Jun 2019 11:18:40 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Jun 2019 11:18:39 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Jun 2019 11:18:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2603mR0gwStJkwwYNCJOV6xaPtE4HihjIwnBocSkaI=;
 b=evUGGYGKYNk5lQcw2TITlArrusyx9AxB5caeIeCWIo99Pm+2zB0gQcgt+dm5UNPL7bTc3I4hteIXcaPYBmwfRqAbm+aP2RKPsUsgMYM/K2YHu3Dcxx6W7gqUrfG5cOGgXlZTwbY6+c1/VWUCsE/O11UUOClQ6CFiuFy4qd3OtL0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1592.namprd15.prod.outlook.com (10.172.155.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 18:18:38 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f%3]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 18:18:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgIAGJ+UAgATbwQCAABC4AIACzgEAgACe5ACAGKHfgIAE9XQA//+UagA=
Date: Mon, 3 Jun 2019 18:18:38 +0000
Message-ID: <C8C27C98-73BA-41C9-88C9-A99974210D22@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
 <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
 <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
 <0AA4F6A3-830C-4F62-A8B5-7D26BF65A16C@fb.com>
 <6b61ef37-4b8b-959a-5131-488d0560ce4c@intel.com>
In-Reply-To: <6b61ef37-4b8b-959a-5131-488d0560ce4c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:5138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f699f17e-3d11-4e0c-5e06-08d6e84fe668
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1592; 
x-ms-traffictypediagnostic: CY4PR15MB1592:
x-microsoft-antispam-prvs: <CY4PR15MB1592895571B0F6E201E1A5C5DD140@CY4PR15MB1592.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(346002)(376002)(366004)(189003)(199004)(7736002)(316002)(110136005)(81156014)(8936002)(3480700005)(81166006)(446003)(8676002)(68736007)(305945005)(11346002)(2616005)(476003)(46003)(33656002)(6436002)(76176011)(14454004)(71190400001)(7116003)(83716004)(478600001)(486006)(82746002)(71200400001)(2906002)(66476007)(6486002)(256004)(102836004)(186003)(6246003)(53936002)(66556008)(6512007)(66446008)(64756008)(4744005)(53546011)(6506007)(5660300002)(14444005)(73956011)(229853002)(66946007)(86362001)(91956017)(76116006)(25786009)(99286004)(4326008)(36756003)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1592;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /gohhZUyKpLCVsHFGOZHnUZsZK+jWRJ8VEyrrXj6rlvZN+R0rppGC16HgaSp+dDGUHANHiwymwFQU4QlcNpRNWh+cenn5QzeUtgx/HhpwTGAHtmVQLsQzT+lswPky3hSdJBRyanVVF6ySqenVdJ0K/gZrCoaDViB/D3O5hrf1jJCW/LPjIyCSJuP6dTNnvVEeMP+fatzbVmJyq8LXlWMQlNddWVWbQwHXwNrbp5mApuBi0lKfWikso6rzcyDRpVjotHABJzKaBV9l9zpqHwuVguN/SvCu/j+vicqd6Vi8nk8Lnp0Ha7k4yXbUeT8PHJj0pKdcIM9WqykH0MxKzmwsihOOhA/kNgX87s43/KwG62fVkWGl7KupqBW3U+r5I2RDC6SfOtJl2ebnuPvODnjfmZA9zp/QONmydARcT4Xv2w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEE7F2A14AF6FC47BCE55A87F60F9CDC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f699f17e-3d11-4e0c-5e06-08d6e84fe668
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 18:18:38.3972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1592
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030124
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

VGhhbmtzIEVkLA0KSSB3aWxsIGRlYnVnIHdpdGggc29tZSBwYXNzdGhyb3VnaCBkYXRhLg0KDQpS
ZWdhcmRzDQotVmlqYXkNCg0K77u/T24gNi8zLzE5LCAxMDo0NCBBTSwgIkVkIFRhbm91cyIgPGVk
LnRhbm91c0BpbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gNS8zMS8xOSAyOjAwIFBNLCBWaWph
eSBLaGVta2Egd3JvdGU6DQogICAgPiANCiAgICA+IFRoaXMgY29uZmlnIGlzIGZhaWxpbmcgd2l0
aCBiZWxvdyBtZXNzYWdlLg0KICAgID4gQXByIDEyIDIzOjMyOjM5IHRpb2dhcGFzcyBzd2FtcGRb
MTMxMF06IHRlcm1pbmF0ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3N0
ZDo6b3V0X29mX3JhbmdlJw0KICAgID4gQXByIDEyIDIzOjMyOjM5IHRpb2dhcGFzcyBzd2FtcGRb
MTMxMF06ICAgd2hhdCgpOiAgX01hcF9iYXNlOjphdA0KICAgID4gDQogICAgDQogICAgSWYgSSBo
YWQgdG8gZ3Vlc3MsIHlvdSdyZSBtaXNzaW5nIGEgcHJvcGVydHkgdGhhdCdzIHJlcXVpcmVkLg0K
ICAgIA0KICAgID4gSXMgdGhlcmUgYW55IGRlZmF1bHQgZGF0YSB3aGljaCBJIGNhbiBiZSB1c2Vk
IGZvciBjb25maWcgYnV0IGhhcyBubyBpbXBhY3QgaW4gaXRzIGFjdGlvbj8NCiAgICANCiAgICBM
aWtlIEkgc2FpZCBiZWZvcmUsIEkgZG9uJ3Qga25vdyBvZiBhbnlvbmUgcnVubmluZyBwaG9zcGhv
ci1waWQgbGlrZSB5b3UNCiAgICBhcmUgaG9waW5nIHRvLiAgVGhlICJkZWZhdWx0IiBpcyB0byBy
dW4gaW4gY2FzY2FkZSBsb29wIG1vZGUsIGFuZCBhbGwNCiAgICB0aGUgZXhpc3Rpbmcgc3lzdGVt
cyBhcmUgZXhhbXBsZXMgb2YgdGhhdCBjb25maWd1cmF0aW9uLiAgSXQncyBsaWtlbHkNCiAgICB0
aW1lIGZvciB5b3UgdG8gYnJlYWsgb3V0IEdEQiBhbmQgc3RhcnQgZGVidWdnaW5nIHlvdXIgY29u
ZmlndXJhdGlvbi4NCiAgICANCiAgICBBbHRlcm5hdGl2ZWx5LCBhcHByb3hpbWF0aW5nIHlvdXIg
ZmFucyBhcyBsaW5lYXIsIGFuZCB1c2luZyB0aGF0IGFzIHRoZQ0KICAgIG91dHB1dCB0YXJnZXRz
IHdvdWxkIGxpa2VseSBnZXQgeW91IHRvIGEgd29ya2luZyB0aGVybWFsIHNvbHV0aW9uIGZhc3Rl
cg0KICAgIHRoYW4gZ29pbmcgZG93biB0aGUgcGF0aCB5b3UncmUgZ29pbmcuDQogICAgDQoNCg==
