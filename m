Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 048D231656
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:01:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fxgx3F3gzDqZm
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 07:01:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10541af64e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UJ5aWGRp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="N9QHf2zU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fxg46RY1zDqWR
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 07:00:28 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x4VKrU8V026909;
 Fri, 31 May 2019 14:00:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=rCcWpWXtKCnOCXNx8lOMh/kQ0msHp94dBMk2HwUCyRo=;
 b=UJ5aWGRp2Ml00cmDazCbsUrHDw+05uIxyLuXxsJ+Wdn++zpQEIIWxfABIW+lyRW9fRmM
 Y/BP1PupD2Ew3QyPwPzsv37BRA7bbpety6pcwG5aDKbxIzYUT3BO3glyuSMo+Kj9hy2L
 xKhFvNou5Nmw6Kyn84WYixzd7LTo/LTtTaA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2su9rbge3v-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2019 14:00:23 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 31 May 2019 14:00:15 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 31 May 2019 14:00:11 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 31 May 2019 14:00:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCcWpWXtKCnOCXNx8lOMh/kQ0msHp94dBMk2HwUCyRo=;
 b=N9QHf2zURZ4/T3HwgiZopzh0c5DzJuf6tvb9PfOl6cc2R+lt94A/SkBWOn1dexDCvn+rIuGaDlTdNmBg2spEQqRdXjU1tclkEZxR+v1hmSYIfbUkijZPHJM5c7mvb9LUG5Q+AL8ngAG9wrz8N1UB1lyfRVectNvcPVVLrh7TT5Y=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1271.namprd15.prod.outlook.com (10.172.178.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Fri, 31 May 2019 21:00:10 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f%3]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 21:00:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgIAGJ+UAgATbwQCAABC4AIACzgEAgACe5ACAGKHfgA==
Date: Fri, 31 May 2019 21:00:10 +0000
Message-ID: <0AA4F6A3-830C-4F62-A8B5-7D26BF65A16C@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
 <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
 <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
In-Reply-To: <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:83b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c81f5cd0-ab80-4085-67f3-08d6e60af817
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1271; 
x-ms-traffictypediagnostic: CY4PR15MB1271:
x-microsoft-antispam-prvs: <CY4PR15MB127184EFAEE490CEC75D396ADD190@CY4PR15MB1271.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(189003)(199004)(316002)(6436002)(6512007)(66946007)(446003)(76116006)(5660300002)(186003)(3480700005)(110136005)(82746002)(99286004)(478600001)(46003)(14454004)(66556008)(476003)(73956011)(4326008)(2906002)(91956017)(229853002)(11346002)(64756008)(66476007)(66446008)(2616005)(6246003)(7736002)(486006)(83716004)(305945005)(102836004)(256004)(81156014)(76176011)(36756003)(6486002)(8676002)(68736007)(53936002)(71190400001)(6116002)(6506007)(7116003)(33656002)(8936002)(25786009)(71200400001)(86362001)(14444005)(81166006)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1271;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QY167OBahzw7mOVyNjvgckbem6ijxvowDJaTIzrkguX0BTWEcvNxKFLssN8Z+WqFmCmGlOMc4L0UZIUfIH/1kZ/WfsG5C1k1ZzH5plankbE1SXaDSCv3IzcV9Rfr/Y9Q37MG7sah35n1ovZ8xG80MdeDWUxtYxmhmOV9PHOtZbZKptlagfp3JB/sNaitf3GQAiV/X3rQ3guRaSe/Ro+kLm85yppAGnPu/aYfJUh4HTbzLnkjvh9e4c/FrYIKSGDJr4mtL3lxeY8PtNYpyBsmtxeRWYIYp5y3Ddgl9FVAgdD/l548N9MGGh+wTws4g1FXK9i+yIbos8vbBnY/WAYFZ2avezCoX0cGCwAAcV6ZHcmGs4uw65+IFxwi4IzMjf//rk2oSXhMOMj8hTbc1AEKd7+nfao++c0YS/ZuTZMdIy8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <582CF78A598C114E98E95A3A8770B2A5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c81f5cd0-ab80-4085-67f3-08d6e60af817
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 21:00:10.4827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1271
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905310127
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

DQoNCu+7v09uIDUvMTUvMTksIDI6NTAgUE0sICJFZCBUYW5vdXMiIDxlZC50YW5vdXNAaW50ZWwu
Y29tPiB3cm90ZToNCg0KICAgIE9uIDUvMTUvMTkgMTI6MjEgUE0sIFZpamF5IEtoZW1rYSB3cm90
ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBFZCwgcGxlYXNlIHNlZSBpZiBmb2xsb3dpbmcgZGVj
bGFyYXRpb24gaW4gZW50aXR5IG1hbmFnZXIgd291bGQgd29yayBhcyBJIGFtIG5vdCBkZWZpbmlu
ZyBhbnkgcGlkIHZhbHVlcyBoZXJlLg0KICAgID4gICAgICAgICB7DQogICAgPiAgICAgICAgICAg
ICAiQ2xhc3MiOiAiZmFuIiwNCiAgICA+ICAgICAgICAgICAgICJJbnB1dHMiOiBbDQogICAgPiAg
ICAgICAgICAgICAgICAgIk1CX0ZBTjBfVEFDSCINCiAgICA+ICAgICAgICAgICAgIF0sDQogICAg
PiAgICAgICAgICAgICAiTmFtZSI6ICJNQl9GQU4wX1RBQ0giLA0KICAgID4gICAgICAgICAgICAg
Ik91dHB1dHMiOiBbDQogICAgPiAgICAgICAgICAgICAgICAgIlB3bSAxIg0KICAgID4gICAgICAg
ICAgICAgXSwNCiAgICA+ICAgICAgICAgICAgICJUeXBlIjogIlBpZCIsDQogICAgPiAgICAgICAg
ICAgICAiWm9uZXMiOiBbDQogICAgPiAgICAgICAgICAgICAgICAgIlBpZCAxIg0KICAgID4gICAg
ICAgICAgICAgXQ0KICAgID4gICAgICAgICB9LA0KICAgID4gICAgIA0KICAgID4gICAgID4+DQog
ICAgPiAgICAgPj4gUmVnYXJkcw0KICAgID4gICAgID4+IC1WaWpheQ0KICAgID4gICAgID4+DQog
ICAgPiAgICAgDQogICAgPiANCiAgICANCiAgICBJJ20gYXNzdW1pbmcgeW91IGxvYWRlZCB0aGlz
IG9uIGEgc3lzdGVtLiAgSWYgaXQgZ2F2ZSB5b3UgdGhlIGJlaGF2aW9yDQogICAgeW91J3JlIGxv
b2tpbmcgZm9yLCB5b3UncmUgZG9uZS4gIElmIGl0IGRpZG4ndCwgaXQncyBwcm9iYWJseSB0aW1l
IHRvDQogICAgc3RhcnQgZGVidWdnaW5nIGFuZCB0dW5pbmcuDQpUaGlzIGNvbmZpZyBpcyBmYWls
aW5nIHdpdGggYmVsb3cgbWVzc2FnZS4NCkFwciAxMiAyMzozMjozOSB0aW9nYXBhc3Mgc3dhbXBk
WzEzMTBdOiB0ZXJtaW5hdGUgY2FsbGVkIGFmdGVyIHRocm93aW5nIGFuIGluc3RhbmNlIG9mICdz
dGQ6Om91dF9vZl9yYW5nZScNCkFwciAxMiAyMzozMjozOSB0aW9nYXBhc3Mgc3dhbXBkWzEzMTBd
OiAgIHdoYXQoKTogIF9NYXBfYmFzZTo6YXQNCg0KSXMgdGhlcmUgYW55IGRlZmF1bHQgZGF0YSB3
aGljaCBJIGNhbiBiZSB1c2VkIGZvciBjb25maWcgYnV0IGhhcyBubyBpbXBhY3QgaW4gaXRzIGFj
dGlvbj8NCiAgICANCiAgICBJIHJ1biBteSBzeXN0ZW1zIGluIHRoZSBjYXNjYWRlIGNvbnRyb2xs
ZXIgc2V0dXAuICBJZiB5b3UncmUgZGV2aWF0aW5nDQogICAgZnJvbSB0aGF0LCB5b3UnbGwgbGlr
ZWx5IGZpbmQgc29tZSBwbGFjZXMgdGhhdCBuZWVkIGJldHRlciBkb2N1bWVudGF0aW9uDQogICAg
YW5kIGNvZGUgaW1wcm92ZW1lbnRzLg0KICAgIA0KDQo=
