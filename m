Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F195B7E467
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 22:46:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4602Q25tjtzDqlp
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 06:46:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=311651850f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BXxdhkFN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="koIg42HU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4602PK4fkvzDqWh
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 06:45:40 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x71KgmYA007023
 for <openbmc@lists.ozlabs.org>; Thu, 1 Aug 2019 13:45:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=2DGwzkypSr97Ib67HrVZ+uXgoDEBpULLWREjDyDZNrc=;
 b=BXxdhkFN+SZLZG6HxKaivyxgc/MUDNhRhhDTO5mE2O8fhVjUTFWKqA40Ru1IQrEXJd5p
 4aCh1knXDOhN2IZyl0xtbGM4PrqdnhdLslgV8sN6PJVfkBJMsOP9tTEjWVvSWU2uBdw2
 i6K1pvIwK0EciYvDZ0dORUleNC1bfXfYDBg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u438rh2q8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 13:45:37 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 1 Aug 2019 13:45:37 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 1 Aug 2019 13:45:36 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Aug 2019 13:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDXvB4ev2KYYsIbBO9pm9or2yYeAVrxnuM58wh6FF02KCUgrYjdjmBvPI2VoK06I95O3h0vB63kshBV50NRZJJ9kUQCe76FWQRkbwD+/lAFdfIKtJmfkFFVYeh/hweR7MCJhtQH/dNCQj/aCKpMBwXPzBWncKD+FkzKtUBy4LeORct3lr3qsdhMINtjIV1sCx/JfuPA+/5wruiOIPp8AP0+HLc1rg//tIDR8mEx748as7ywrmqImJ4M+iP5CMoLjc6dMPTNPkxOLfV0/KQVxS+sBhZo7IlVpFziOt5Cehc8C1IxlNnHkoCJfEOJuqt6T7rFSbTqVuQCk0GqOcPJd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DGwzkypSr97Ib67HrVZ+uXgoDEBpULLWREjDyDZNrc=;
 b=clyFshwhu6Y0Semq28CU8UDVM+fXAva3eH1a7G3MPEorHTV2RKeaYPJz54X5fdiFbjtfb4J8DzeL3WOf0tg131iYL49upzLNqWzHkLdgalEHU1X6hQx4lR5hmOvM6b8epKUprjGCNrbM8pptaApfYyox0BnrTpxZ2I7y5nYAqA3c7xJXG2/EWzrgW3FBPYDh5D/JyqBdLg9fU0iIoatekh904PIHW5lj5euWisffNqsd48hg2Yb/aVQOE+uoM1EgZrtE3XL98usyx0WDNWjjMz7aY5fezgP+8HWrOCqsG/ZXJzALYtzSLpmtCKXex8tsIVv7vWlVCSfLUj3h/Us6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DGwzkypSr97Ib67HrVZ+uXgoDEBpULLWREjDyDZNrc=;
 b=koIg42HUZxJpFxh3YjfZuQI5TQw7cy2/d1tF/NkAb6845CtwtzKZ0DAdmfA8E3gyPx6xAvzXDZ3KRN3m2iWSvfrBd15pe8N91O2Frm1vSgU7WOdi+Q5XQNxH7u2R+GJnAPTevjCS0Ey+Idk9iSkWf+imWy0Sk8TnlTCVVP0uTHE=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1288.namprd15.prod.outlook.com (10.172.179.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 20:45:36 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 20:45:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Small help on trivial issue
Thread-Topic: [Potential Spoof] Small help on trivial issue
Thread-Index: AQHVSKoRVqOzy+M9U0CpnRcKd7ajpQ==
Date: Thu, 1 Aug 2019 20:45:35 +0000
Message-ID: <EBF5870C-9CDC-43F9-958D-4FC685B41906@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:b2a0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4cb0bc6-0ec8-4299-db5d-08d716c13474
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1288; 
x-ms-traffictypediagnostic: CY4PR15MB1288:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB12884EFF238B922DCCA4C8C2DDDE0@CY4PR15MB1288.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(316002)(606006)(86362001)(2616005)(53936002)(66556008)(91956017)(5024004)(66476007)(68736007)(66946007)(36756003)(486006)(476003)(66446008)(64756008)(14454004)(966005)(76116006)(5660300002)(2906002)(46003)(25786009)(81166006)(6486002)(478600001)(102836004)(7736002)(54896002)(6116002)(33656002)(8676002)(71190400001)(71200400001)(6506007)(6436002)(81156014)(53546011)(6916009)(256004)(6306002)(99286004)(6246003)(186003)(229853002)(6512007)(8936002)(236005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1288;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mq7x8GutI2/r7Lgmzbeel48RahSRw8piTR7RiLbyX+zNqgpMQw7/OtnRjtCeTxiRwo+gF5UXGmUmWKXEgBjXNYtUBb6WTgUVMeJPN6ageHfKHZbDF9ru2lCzAQKqXYK/TqDpxvdQwz+PMbh/drY2LBRY4od1g+IgW7UuGR83lZ1bPVfPqgjGA1jTCaN4Jve1/w/GFR4QBbtpY49NSGevR58UEqnHfE3D/JRkC7cEpR+rTcCxrfIymZKtKBIDnIKpzx11nUceRYB+uGTRnQB7NYCxmv3cpLQ3sRLJ5JygEz+jgU4CAK1irRcABHrOOp+iAI8Vp7zBuENZvmhuiCC27rJ72IiRs7gsih+6XSoUK48/PMw8DwLVkN6myXqlWewQLvJxDD1eBlHUwKRO2kvi+HUWcJKoUEE+0iuI7oZdNgE=
Content-Type: multipart/alternative;
 boundary="_000_EBF5870C9CDC43F9958D4FC685B41906fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cb0bc6-0ec8-4299-db5d-08d716c13474
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 20:45:35.9617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1288
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010218
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

--_000_EBF5870C9CDC43F9958D4FC685B41906fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TG9va3MgbGlrZSBmaWxlIGF0dGFjaG1lbnQgaGFzIGJlZW4gc2NydWJiZWQuIEkgaGF2ZSBhZGRl
ZCBhIGdlcnJpdCByZXZpZXcsIHBsZWFzZSBjaGVjayBsaW5rIGJlbG93Lg0KDQpodHRwczovL2dl
cnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9mYi1pcG1pLW9lbS8rLzI0MDkyDQoN
Cg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxp
c3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZi
LmNvbT4NCkRhdGU6IFRodXJzZGF5LCBBdWd1c3QgMSwgMjAxOSBhdCAxOjEyIFBNDQpUbzogT3Bl
bkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogW1BvdGVu
dGlhbCBTcG9vZl0gU21hbGwgaGVscCBvbiB0cml2aWFsIGlzc3VlDQoNClRlYW0sDQpJIGFtIGhh
dmluZyBzbWFsbCBpc3N1ZSBvZiBnbG9iYWwganNvbiBvYmplY3QgY29ycnVwdGlvbiBhbmQgSSBh
bSB1bmFibGUgdG8gZmluZCByZWFzb24gZm9yIGl0LiBJIGFtIGRlZmluaW5nIGEgZ2xvYmFsIGpz
b24gb2JqZWN0IChubG9obWFubjo6anNvbiBhcHBTZWxEYXRhKSBhdCB0aGUgc3RhcnQgb2YgZmls
ZS4gSSBhbSBpbml0aWFsaXppbmcgdGhpcyBvYmplY3QgaW4gcmVnaXN0ZXIgZnVuY3Rpb24gYW5k
IGFjY2Vzc2luZyB0aGlzIGluIGRpZmZlcmVudCBmdW5jdGlvbnMgZGVmaW5lZCBpbiBzYW1lIHNo
YXJlZCBsaWJyYXJ5LiBXaGlsZSBhY2Nlc3NpbmcgaW4gZGlmZmVyZW50IGZ1bmN0aW9uLCBpdCBk
b2VzbuKAmXQgaG9sZCBpbml0aWFsaXplZCBkYXRhLiBUaGlzIGlzIGZhaWxpbmcgaW4gbXkgc3Rv
cmFnZWNvbW1hbmRzLmNwcCBmb3IgSVBNSS4NCg0KVGhlbiBJIGNyZWF0ZWQgYSBzZXBhcmF0ZSBu
ZXcgZmlsZSBzZWxjb21tYW5kcy5jcHAgYW5kIGRpZCB0aGUgc2FtZSBvcGVyYXRpb24sIGl0IHdv
cmtzIGhlcmUgYXMgZXhwZWN0ZWQuIFNvIEkgYW0gd29uZGVyaW5nIHdoeSBpdCBpcyBmYWlsaW5n
IGluIGV4aXN0aW5nIGZpbGUgdnMgbmV3IG9uZS4gTG9va3MgbGlrZSB0aGVyZSBhcmUgc29tZSBo
ZWFkZXIgaW5jbHVkZWQgaW4gZXhpc3RpbmcgZmlsZSBpcyBtZXNzaW5nIGl0IHVwIGJ1dCBJIGhh
dmUgbm8gY2x1ZSB5ZXQuIFRoaXMgb25seSBoYXBwZW5zIHdpdGgganNvbiBvYmplY3QuDQoNCkZv
ciB5b3VyIHJlZmVyZW5jZSwgSSBhbSBhdHRhY2hpbmcgYm90aCBiZWxvdyBmaWxlcw0KU3RvcmFn
ZWNvbW1hbmRzLmNwcCDigJMgd2hlcmUgdGhpcyBmYWlscw0KU2VsY29tbWFuZHMuY3BwIOKAkyB3
aGVyZSBpdCB3b3Jrcy4NCg0KSSBrbm93IGl0IGlzIGEgZGVidWcgaXNzdWUgYW5kIEkgaGF2ZSBi
ZWVuIHN0cnVnZ2xpbmcgbGFzdCAyIGRheXMgc28gdGhvdWdodCBvZiBhc2tpbmcgZm9yIGhlbHAg
dG8gdGVhbS4gQW55IGhlbHAgaGVyZSB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0KUmVnYXJkcw0K
LVZpamF5DQo=

--_000_EBF5870C9CDC43F9958D4FC685B41906fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <BDB79E9C367EE046B4ED3436F6F35141@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6eD0idXJuOnNjaGVtYXMtbWljcm9z
b2Z0LWNvbTpvZmZpY2U6ZXhjZWwiIHhtbG5zOm09Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5j
b20vb2ZmaWNlLzIwMDQvMTIvb21tbCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1JFQy1o
dG1sNDAiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9
InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8bWV0YSBuYW1lPSJHZW5lcmF0b3IiIGNvbnRl
bnQ9Ik1pY3Jvc29mdCBXb3JkIDE1IChmaWx0ZXJlZCBtZWRpdW0pIj4NCjxzdHlsZT48IS0tDQov
KiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlh
IE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBm
b250LWZhY2UNCgl7Zm9udC1mYW1pbHk6TWVubG87DQoJcGFub3NlLTE6MiAxMSA2IDkgMyA4IDQg
MiAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3Jt
YWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7
DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBz
cGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojOTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBs
aS5tc29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7
DQoJbXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFy
Z2luLWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjExLjBw
dDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUx
OA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KcC5wMSwgbGkucDEsIGRpdi5wMQ0KCXttc28tc3R5
bGUtbmFtZTpwMTsNCgltYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250
LXNpemU6OC41cHQ7DQoJZm9udC1mYW1pbHk6TWVubG87DQoJY29sb3I6YmxhY2s7fQ0Kc3Bhbi5z
MQ0KCXttc28tc3R5bGUtbmFtZTpzMTt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlw
ZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0K
CXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0K
ZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9o
ZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4N
CjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+TG9va3MgbGlrZSBmaWxlIGF0dGFjaG1lbnQgaGFzIGJl
ZW4gc2NydWJiZWQuIEkgaGF2ZSBhZGRlZCBhIGdlcnJpdCByZXZpZXcsIHBsZWFzZSBjaGVjayBs
aW5rIGJlbG93LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xh
c3M9InMxIj48YSBocmVmPSJodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3Bl
bmJtYy9mYi1pcG1pLW9lbS8mIzQzOy8yNDA5MiI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9q
ZWN0Lnh5ei9jL29wZW5ibWMvZmItaXBtaS1vZW0vJiM0MzsvMjQwOTI8L2E+PG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9InAxIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlk
ICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNw
YW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3Zp
amF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgVmlqYXkg
S2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlRodXJz
ZGF5LCBBdWd1c3QgMSwgMjAxOSBhdCAxOjEyIFBNPGJyPg0KPGI+VG86IDwvYj5PcGVuQk1DIE1h
aWxsaXN0ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDog
PC9iPltQb3RlbnRpYWwgU3Bvb2ZdIFNtYWxsIGhlbHAgb24gdHJpdmlhbCBpc3N1ZTxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5UZWFtLDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFtIGhhdmluZyBzbWFsbCBpc3N1ZSBvZiBnbG9i
YWwganNvbiBvYmplY3QgY29ycnVwdGlvbiBhbmQgSSBhbSB1bmFibGUgdG8gZmluZCByZWFzb24g
Zm9yIGl0LiBJIGFtIGRlZmluaW5nIGEgZ2xvYmFsIGpzb24gb2JqZWN0IChubG9obWFubjo6anNv
biBhcHBTZWxEYXRhKSBhdCB0aGUgc3RhcnQgb2YgZmlsZS4gSSBhbSBpbml0aWFsaXppbmcgdGhp
cyBvYmplY3QNCiBpbiByZWdpc3RlciBmdW5jdGlvbiBhbmQgYWNjZXNzaW5nIHRoaXMgaW4gZGlm
ZmVyZW50IGZ1bmN0aW9ucyBkZWZpbmVkIGluIHNhbWUgc2hhcmVkIGxpYnJhcnkuIFdoaWxlIGFj
Y2Vzc2luZyBpbiBkaWZmZXJlbnQgZnVuY3Rpb24sIGl0IGRvZXNu4oCZdCBob2xkIGluaXRpYWxp
emVkIGRhdGEuIFRoaXMgaXMgZmFpbGluZyBpbiBteSBzdG9yYWdlY29tbWFuZHMuY3BwIGZvciBJ
UE1JLg0KPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGVuIEkg
Y3JlYXRlZCBhIHNlcGFyYXRlIG5ldyBmaWxlIHNlbGNvbW1hbmRzLmNwcCBhbmQgZGlkIHRoZSBz
YW1lIG9wZXJhdGlvbiwgaXQgd29ya3MgaGVyZSBhcyBleHBlY3RlZC4gU28gSSBhbSB3b25kZXJp
bmcgd2h5IGl0IGlzIGZhaWxpbmcgaW4gZXhpc3RpbmcgZmlsZSB2cyBuZXcgb25lLiBMb29rcyBs
aWtlIHRoZXJlIGFyZSBzb21lIGhlYWRlciBpbmNsdWRlZA0KIGluIGV4aXN0aW5nIGZpbGUgaXMg
bWVzc2luZyBpdCB1cCBidXQgSSBoYXZlIG5vIGNsdWUgeWV0LiBUaGlzIG9ubHkgaGFwcGVucyB3
aXRoIGpzb24gb2JqZWN0Ljwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+Rm9yIHlvdXIgcmVmZXJlbmNlLCBJIGFtIGF0dGFjaGluZyBib3RoIGJlbG93IGZpbGVzPC9z
cGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPlN0b3JhZ2Vjb21tYW5kcy5jcHAg4oCTIHdoZXJlIHRoaXMgZmFpbHM8
L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+U2VsY29tbWFuZHMuY3BwIOKAkyB3aGVyZSBpdCB3b3Jrcy48L3Nw
YW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkga25vdyBpdCBpcyBhIGRl
YnVnIGlzc3VlIGFuZCBJIGhhdmUgYmVlbiBzdHJ1Z2dsaW5nIGxhc3QgMiBkYXlzIHNvIHRob3Vn
aHQgb2YgYXNraW5nIGZvciBoZWxwIHRvIHRlYW0uIEFueSBoZWxwIGhlcmUgd291bGQgYmUgYXBw
cmVjaWF0ZWQuPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdh
cmRzPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_EBF5870C9CDC43F9958D4FC685B41906fbcom_--
