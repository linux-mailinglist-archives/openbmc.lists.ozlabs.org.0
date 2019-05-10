Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C01A472
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 23:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45137F2vh8zDqSg
	for <lists+openbmc@lfdr.de>; Sat, 11 May 2019 07:21:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0033f38a6f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="KuQAnfWz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Q7OTpc3X"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45136C1f6xzDqSN
 for <openbmc@lists.ozlabs.org>; Sat, 11 May 2019 07:20:46 +1000 (AEST)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4ALJH6U011857; Fri, 10 May 2019 14:20:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=X5eM9xmsknKxzB/Eq461GlJgdE4A/E4o+uChkrQg9Lo=;
 b=KuQAnfWza9SW/KaYGPZdy5pFzZd9znjtp378hPQDLYdUzSQEL147vBDbACtfhAVQn531
 0MyVvv9iECjzpOARd9RhRrk3c3XrvAuiLPxTRmlV5IoM/d/CqcaICJpqshA7ZranxmiX
 HDkvdxdLPtEyHDp/Nu85w74A9Q531jDnxWU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2sdcy7saet-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 May 2019 14:20:41 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 May 2019 14:20:39 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 10 May 2019 14:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5eM9xmsknKxzB/Eq461GlJgdE4A/E4o+uChkrQg9Lo=;
 b=Q7OTpc3XYw/+29fSX+MDkuzAri78iELzguPH74BWklM5oo05S0OFmYwMLNh15ZW2RyaIeQnQiCKZXNG8rPLvxoM1iQ3erYfaRbvdCcslAtbpPI25Lyojp6J8hvHj3iThrp7P4/0FUPXQMngvNV4csfcOGKRs9buZ7Pio+g/UdoI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1702.namprd15.prod.outlook.com (10.174.52.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 10 May 2019 21:20:38 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 21:20:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgIAGJ+UA
Date: Fri, 10 May 2019 21:20:38 +0000
Message-ID: <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
In-Reply-To: <1b82951d-4293-0525-a562-000899544c2e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:c3be]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b5e51a8-d16e-47b0-b9c5-08d6d58d5983
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1702; 
x-ms-traffictypediagnostic: CY4PR15MB1702:
x-microsoft-antispam-prvs: <CY4PR15MB17025E3BF0938312A35459F5DD0C0@CY4PR15MB1702.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(39860400002)(396003)(346002)(199004)(189003)(71190400001)(2501003)(53546011)(8936002)(316002)(81166006)(476003)(6506007)(76176011)(14454004)(36756003)(53936002)(81156014)(486006)(3480700005)(8676002)(68736007)(25786009)(102836004)(46003)(5660300002)(186003)(82746002)(2616005)(6116002)(66446008)(6246003)(2906002)(86362001)(76116006)(4744005)(71200400001)(446003)(66556008)(83716004)(6512007)(11346002)(73956011)(91956017)(478600001)(66946007)(64756008)(229853002)(14444005)(6486002)(256004)(33656002)(99286004)(305945005)(7116003)(7736002)(110136005)(66476007)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1702;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: abDRPboJnZTg4pvZqpP9Tf15G0W+qhB7A5nEAlZNK8vCXI1cUd64aigXkZVdVvXP++miWARwQ8wPZvsyEP7/uMD2VPiC1yH9yLgsaDpRMVJXlYYYFkIKfONOd6hCoirC3i1io1FBmoptvvFJdi0LDlF7zzLzW208+5WW6xeFEhzBXKaAVTNddSAYfqISQPAlHw1y/nqGH5HdzB21oCErfILOL1wNS9gx63iBvorLw7s+S3uhzp9MUAli//g0Tqj+vRiI4KiYX6CkJsRuF8TCbB+3Tu1ZdZ+VKhJb+epI7jE03RHOv5aOUF9+MPksoZoMv0n3UGP4vVvHs/HP8AERJX2GQC+MUlHk4deil1U+tdf6DGIC3jzA8yhcFmYFFAnzNdzAI21X9Mn1isJ0cgOVNfGaZ9okx1Zl9JZCIYKLaeM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C906005ECA44B348ACC6E806584863C6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5e51a8-d16e-47b0-b9c5-08d6d58d5983
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 21:20:38.7763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1702
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-10_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=791 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905100136
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

DQoNCu+7v09uIDUvNi8xOSwgOToyMCBBTSwgIkVkIFRhbm91cyIgPGVkLnRhbm91c0BpbnRlbC5j
b20+IHdyb3RlOg0KDQogICAgT24gNS8yLzE5IDQ6MjQgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToN
CiAgICA+ICBNeSB1bmRlcnN0YW5kaW5nIGhlcmUgaXMgcGlkIGRhdGEgYXJlIG9ubHkgZGVmaW5l
ZCBmb3IgdGVtcCBzZW5zb3JzIHdoaWNoIHdpbGwgZ2VuZXJhdGUgcHdtIHZhbHVlcyBmb3IgZmFu
Lg0KICAgID4gDQogICAgDQogICAgVGhlIGFib3ZlIGlzIG5vdCBob3cgcGhvc3Bob3IgcGlkIGNv
bnRyb2wgb3BlcmF0ZXMuICBUaGUgdGVtcGVyYXR1cmUNCiAgICBjb250cm9sbGVycyAicmVxdWVz
dCIgYSBnaXZlbiBmYW4gUlBNLCB0aGVuIHRoZSBmYW4gUElEIGNvbnRyb2xsZXINCiAgICAod2hp
Y2ggaXMgc2Nhbm5lZCBtdWNoIG1vcmUgcXVpY2tseSB0aGFuIHRoZSB0ZW1wZXJhdHVyZSBjb250
cm9sbGVycykNCiAgICBhdHRlbXB0cyB0byBkcml2ZSB0aGUgZmFuIHRvIHRoYXQgc3BlZWQuICBU
aGlzIGVuZHMgdXAgYmVpbmcgYSB0d28gc3RhZ2UNCiAgICBmZWVkYmFjayBsb29wIHRoYXQgY2Fu
IHBlcmZvcm0gYmV0dGVyIHRoYW4gYSBzaW5nbGUgUElEIGxvb3AuDQogICAgDQpFZCwgd2UgYXJl
IG5vdCB1c2luZyBjYXNjYWRlIGNvbnRyb2wgaGVyZSBpbiBmYWNlYm9vay4gV2Ugb25seSB1c2Ug
b3V0ZXIgbG9vcCB3aGljaCBnaXZlcyBkYXRhIGZvciBmYW4gdG8gZHJpdmUuDQpJcyBpdCBwb3Nz
aWJsZSB0byBzdGlsbCBydW4gUGhvc3Bob3IgcGlkIGNvbnRyb2xsZXIgd2l0aCBzaW5nbGUgbG9v
cD8NCg0KUmVnYXJkcw0KLVZpamF5DQoNCg==
