Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE271AB0DE
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 20:51:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Wf21cNTzDr9w
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 04:51:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1374acb622=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=PVpZSrVM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=iX1yDXW9; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Wcm5zs7zDr9T
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 04:49:59 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FIiJI4023578; Wed, 15 Apr 2020 11:49:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5cdG45nYe1r6jzipYPlXWOmXNi4k44S0noe87Dqmhjk=;
 b=PVpZSrVMaw/pLPv+u7d0klOoXrpIh+zJASw4qQkqhspe9uP5wmPI+AJpSbYxnz+Ssmjj
 JLUPLWq7BUYxAD2TasZ0WeTTWn94VYQdX95g3Jvm2z6D3V4PmGnmf8KhiSAU8ltXzwG0
 7GxGPtIh3rrBP+w15oR+YW4zauocselJDfk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn7fyk48-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Apr 2020 11:49:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 15 Apr 2020 11:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ruo0kt5R0U3b5SHSv5PEFQx0rGqreFZEjkWJvUbOCuteofsBSGWAsDFsaY2EGC0RvZzo7TTxLXbnzylikFel09EkcL6O8QHcxxnqhIiHqp+PDFzVZ1gyDk/xWvAJhZo1/afXWB3E6xiHdrg8Pd09uuIEguIiAI3+cY/PvcY8nlw79mSk8JthcHcKob3m6WjUubqxVx504HWvPzhfCjcVXfgWzDteu+i0944krDVrH33m5j5oidZtW9ZRahkeieRPOPqGQ83SSwD04T3rvD4KjStusEFQQVK6QXV5R7ME4yf7aLCwuRvYOPLH+Rp5AuoNRgoBsh5Gn8PUQczFp0I1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cdG45nYe1r6jzipYPlXWOmXNi4k44S0noe87Dqmhjk=;
 b=VE9t7c6qYfOD4+BFOuZz6aa8x0gOvCbdv80OuDtanRCRaNTauyHre4Dh8VS3eEQLdulfgMeuv+byb/65I7br7fcvjjkaPS9r5znP/I26RDRZpB5c4YOF9HFoRpx8TM5X1MPZwJijEfzIMWQmFbUI4Q7mQVOzXvD5jogVR00vYW2lZBYPczKTSMy/tac+qQL+Lu6Ch9zxUuxnwdTdZUvO+VWXkfVtaekGEAUFbk5SA5smxGjARrTinGk/LBVm+AAbQE+HI3XktPOYib5HEap+SB0kTc04rGX7PV80TPsP/1vOgEk2BLlJJvfd2kzaOzm31AL+CA6391b3bvJ5tLtHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cdG45nYe1r6jzipYPlXWOmXNi4k44S0noe87Dqmhjk=;
 b=iX1yDXW9Lxzy/UiOOD6ImsgR+iaM2n/NYX02XKm+AEl2HjdkMVaAZcMr7Eq0CTub3fXiJBst2GaDsZpgBRe3ctvAe0/rrrFhkwBu/btopOhqx/CLBU0uiT4edOl25kX6gEFFZ77JcxXjx96aYGTMo4w8TR+RGdFUs+xci9SfigE=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3079.namprd15.prod.outlook.com (2603:10b6:a03:f5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Wed, 15 Apr
 2020 18:49:55 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 18:49:54 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Neeraj Ladkani <neladk@microsoft.com>, "james.feist@linux.intel.com"
 <james.feist@linux.intel.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAA==
Date: Wed, 15 Apr 2020 18:49:54 +0000
Message-ID: <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26f332bb-bfaf-4cd1-2fcb-08d7e16dc9d0
x-ms-traffictypediagnostic: BYAPR15MB3079:
x-microsoft-antispam-prvs: <BYAPR15MB3079BE5D05C0CA254D4E96CCDDDB0@BYAPR15MB3079.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(376002)(136003)(346002)(366004)(4326008)(53546011)(110136005)(4744005)(66476007)(8676002)(316002)(7116003)(81156014)(64756008)(66556008)(76116006)(66446008)(8936002)(6486002)(71200400001)(66946007)(2906002)(478600001)(36756003)(186003)(3480700007)(33656002)(5660300002)(6506007)(86362001)(6512007)(2616005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vySHAdaVs6WTuVZtvfHWtMRiRaT5iQovGP+JT1ylFjyq20WvbJp8/Fa+cURTEO0BieqE0PoyFqPEXjSPOoFfPySSfLTOUM4Zug5G3hia1ybe6ZDqOdkHo62/ga6M6eRkVk9SY9cvFi3FDJn6oy5X5SnPAiBfQm9Fml0cm89/P/2yzVHpsgaT8vmTG7dXN2Yn36d0iJ/berzF1ZOpEBZX5pYt5/o46qhw3W+AT+jGG0D/csaoJjRKternqATOxVgB94jYptHV0mTM+DEGHCjL1wFKPjA3HwDvQzwah6ny7KJoNXAkQYPsgdnjPwiCKUp2ji6qTNm99Ss1z8OpNou/5ODUNhGWTIBH6MaxzHmr21nHstS6XQ0Ecfz1J9VGsnqgrEDFUQW2xFq9xqvJ4E8w49YSOmlxLyblTFxqx1OCBqKvS0N66cw2IosMs9HgJdIe
x-ms-exchange-antispam-messagedata: r1EAZ1lZ7/m2+4XalKbR0dt169nphp36IzNIjHiUQFQHf5dlf6P57iiCj4N9PqueQPCF9mOcYV/lB7RFU3gFuvGuw+O6XEjaI8FircimKJOx6wiPzatYtJ3htCwjFBRICR1mBXYtHNjWRbGU6ufWY2NH6Qnn83jOVwmqXXRAV7lrwp+6oW9cFu+lJnnkKqeMQheVu5C2FSil3r2HLU2EBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3264BEF5641BF846A536F114F016A947@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f332bb-bfaf-4cd1-2fcb-08d7e16dc9d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 18:49:54.8514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pf2Uoq6sZoW91fxPLtuJ/iwkDDazy4HHvqVPmI6kOoPNpuVK7ToGwQLXMBWbjP8bsbcvlTKHcHK/nVfH/UXWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3079
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_06:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004150138
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

WWVzIHRoZXJlIGlzIGEgc3VwcG9ydCBmb3IgTUNUUCBhbHNvIGluIGNvZGUgYnV0IEkgaGF2ZSBu
b3QgdGVzdGVkIHRoaXMgZmVhdHVyZSBzbyBjYW4ndCBjb21tZW50Lg0KDQrvu79PbiA0LzE1LzIw
LCAxMDo1OSBBTSwgIk5lZXJhaiBMYWRrYW5pIiA8bmVsYWRrQG1pY3Jvc29mdC5jb20+IHdyb3Rl
Og0KDQogICAgSGkgVmlqYXksIA0KICAgIA0KICAgIEFyZSB0aGV5IGltcGxlbWVudGVkIG92ZXIg
TUNUUCBvdmVyIFNNQlVTPyANCiAgICANCiAgICBOZWVyYWoNCiAgICANCiAgICBGcm9tOiBvcGVu
Ym1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9y
Zz4gT24gQmVoYWxmIE9mIFZpamF5IEtoZW1rYQ0KICAgIFNlbnQ6IFdlZG5lc2RheSwgQXByaWwg
MTUsIDIwMjAgNToyOCBBTQ0KICAgIFRvOiBqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20NCiAg
ICBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQogICAgU3ViamVjdDogW0VYVEVSTkFMXSBS
ZTogbnZtZSBzZW5zb3JzDQogICAgDQogICAgU29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcywgSSBm
b3VuZCBOVk1FIGluIGRidXMtc2Vuc29ycy4gSSBuZWVkZWQgdG8gdXBkYXRlIHJlcG8gaW4gbG9j
YWwgd29ya3NwYWNlLg0KICAgIA0KICAgIFJlZ2FyZHMNCiAgICAtVmlqYXkNCiAgICANCiAgICAN
CiAgICBGcm9tOiBWaWpheSBLaGVta2EgPG1haWx0bzp2aWpheWtoZW1rYUBmYi5jb20+DQogICAg
RGF0ZTogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCBhdCA1OjA3IEFNDQogICAgVG86ICJtYWls
dG86amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tIiA8bWFpbHRvOmphbWVzLmZlaXN0QGxpbnV4
LmludGVsLmNvbT4NCiAgICBDYzogIm1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxt
YWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KICAgIFN1YmplY3Q6IG52bWUgc2Vuc29y
cw0KICAgIA0KICAgIEhpIEphbWVzLA0KICAgIERvIHdlIGhhdmUgc3VwcG9ydCBmb3IgTlZNRSBz
ZW5zb3JzIGluIGRidXMgc2Vuc29ycz8gSSBzZWUgcGhvc3Bob3ItbnZtZSByZXBvIHdoaWNoIG5l
ZWRzIGNvbmZpZ3VyYXRpb24gZnJvbSB5YW1sIGZpbGUsIGlzIGl0IHBvc3NpYmxlIHRvIGludGVn
cmF0ZSB0aGlzIHdpdGggZW50aXR5IG1hbmFnZXI/DQogICAgIA0KICAgIFJlZ2FyZHMNCiAgICAt
VmlqYXkNCiAgICANCg0K
