Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD149B8E8
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 01:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Fd493hMJzDrQm
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 09:32:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3138b0672c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="S9Ql1Q9p"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="aSaKL+9N"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Fd3H4pZhzDqyB
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 09:32:10 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7NNUEri012065; Fri, 23 Aug 2019 16:32:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=2UfbGb/DZQLgW/U8dIRTppm09W0a9goJ0VkbmMrxgPg=;
 b=S9Ql1Q9pG0sH7BZHnMz0g5mfz7EClDSzgF7PHGIioUrFHFx78OhmulHukZxdQzjC/Nis
 slq7wL0KUdzwXihZGvOAY0vhmqnummwainY5DoBNRkPsk8/RvsbRrg8MAI0Cqc05vnx5
 /qDD7yEBE/vrKtFq5joUb3nIRXfk+UmBPmA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ujm2k1mp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 23 Aug 2019 16:32:01 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 16:31:47 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 16:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoUUaypaRp9LHsvgUhxU0r3sreYKUCCJQPDxTd0TBSKoZa3g87F6iCYaW35FXhaM07iJyXhGEMfEjVDFuLb0pRSQocOShv3nOjKqJXig3RJMt6yxwRclp8wwazDBnc+Rt3JnrhTh6cBmq4MfUuaKfw3y/jEKyMqqLQrXQKTB4ePHiZQpzzAIBCjYuszG2Nycd2m+utfr9kBYYGROFNNYSGmz+R1z9TLNwS6XdfLqVr4A7OQ3jb/YM60r1406QfF/PvlxcxGOlgYNo8z18CgGrgxiWebyAu+b/gCe0ikxpWzW8tX2YYpSNk0D50J/asIxlcIDRFOKfky0dARc0XayrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfbGb/DZQLgW/U8dIRTppm09W0a9goJ0VkbmMrxgPg=;
 b=bE38ah3K388GHk7mxWvcJ+X+msjlPS+LidHos+TnkHbRBdlNu5fMFv9oa+XgtXQRkMnL4oO4m59dOUo4cfiLLCQqmXSRvl2ld3cl0X8ZLTbx2lmtH3JiKq9SfqEvSb2FYzqRP+ntJn7hLKf0T28og5JuH2cAY5jnpnM+cIrZ637AKdZOgAKNupIfG20C9QACE8nbY5yEsc0xWjwbsnpShXyOtY8ShamWxnT16ceSxIePP6urtSw5cO3Kh1Q5S8YQsa+zULXtlVTqHRQdtKhwyH7en/E6ouNnpcY9hp23VdUt7EFH/I7RerBMnKSaG6dlFHqZakQR+X1Op8QdGIQoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfbGb/DZQLgW/U8dIRTppm09W0a9goJ0VkbmMrxgPg=;
 b=aSaKL+9NV0SeSXHK8COF1t/2jXUYQM72XPb2/vUzdb/YSomFomFPljaQw0yg57HM3lYsptNlVwvH0ZPnEYC5l27xgEzpdWmDv2P+bIAlKHZjTxOQ4//rF7yf873JgVXRZg4oNMwvMv4355dqwqThoN7vfYc9Kdtne+eSeJjGIr4=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1447.namprd15.prod.outlook.com (10.172.155.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 23:31:46 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 23:31:46 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: A new repo for objc-debug-tools
Thread-Topic: A new repo for objc-debug-tools
Thread-Index: AQHVV5kKLN6QAtb1ZEi45DtoHhELI6cEvC8AgAQ1IQA=
Date: Fri, 23 Aug 2019 23:31:46 +0000
Message-ID: <C922504E-A0F8-4E2E-A14A-47D72F1AEB03@fb.com>
References: <9788269D-C3EB-45AC-8591-888907C4D145@fb.com>
 <96a33d95-b42b-4a45-9a02-b14de0aa947d@www.fastmail.com>
In-Reply-To: <96a33d95-b42b-4a45-9a02-b14de0aa947d@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4aac]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f419893d-d905-41d0-72e1-08d72822108b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1447; 
x-ms-traffictypediagnostic: CY4PR15MB1447:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR15MB14470D181B6317A7FE5299E8DDA40@CY4PR15MB1447.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(76116006)(6506007)(81166006)(229853002)(2906002)(102836004)(86362001)(11346002)(5660300002)(446003)(2616005)(4326008)(66556008)(110136005)(91956017)(25786009)(66946007)(66446008)(66476007)(476003)(46003)(186003)(316002)(33656002)(76176011)(53936002)(6512007)(478600001)(64756008)(305945005)(6116002)(6306002)(8936002)(7736002)(966005)(6246003)(8676002)(6486002)(14454004)(6436002)(81156014)(71200400001)(36756003)(71190400001)(486006)(99286004)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1447;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nk+jPh6CLkvMNUVatiIKr/1jHYH53iUZ0ORRBXXE0InS0Ljj7ID627i45q3kKKgn0yuU/yFqzYnhB2RqOQ9ZC2VYCMcq5oc0rpNPaPj+TkcSWysck/nhgWZ2IQb/kyKHvQaDdTHL+fHT3S0jBIq937j7pa7wuXXN/xkUIVh64tF73YPRQ4NaScfDn40oNykITLufwymxUsaK5whmeFibaN92+yu8rbdeu6OrMqTSvKywjyMbMsVHtrp33nGJKqiqbpT0CMQYuo8iF48VfBvPM0fnRsulUA3Frv2U4738FWYHJgA8TcCKc0eJtKkIWW3QGQA1IoJXCFLLqQn+GYDVDV7CGvvz1kqkPuZyLaSZLRcuo+aKb9sUzcUt7ILhkxzx4qTwcj2crErzAJNKm5KLspzEoaAqxWvxVBSJJVOaPZg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C10426F3890E2F4D97CEE9AEFED436D0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f419893d-d905-41d0-72e1-08d72822108b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 23:31:46.6238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oXQdp/vlaIwtccQJelaYzO8Zldjt0hDE9bX3ZCSzuo8XJCMlFDx2RzGjv8M/prkKHhf4DUSkWqsX3w3Zqunzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1447
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=659 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230223
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

DQoNCu+7v09uIDgvMjAvMTksIDU6MTYgUE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5p
ZC5hdT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiBXZWQsIDIxIEF1ZyAyMDE5LCBhdCAw
NjoyMiwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gIA0KICAgID4gSGkgQnJhZCwNCiAgICA+
IA0KICAgID4gQ2FuIHlvdSBwbGVhc2UgY3JlYXRlIGEgbmV3IHJlcG8gZm9yIG9ibWMtZGVidWct
dG9vbHMuIEkgaGF2ZSBwdXQgYSANCiAgICA+IHNpbXBsZSBkb2N1bWVudCBoZXJlIGFuZCB3aWxs
IGVsYWJvcmF0ZSBsYXRlci4NCiAgICA+IA0KICAgID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29m
cG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6
Xy0yM19jX29wZW5ibWNfZG9jc18tMkJfMjQ1OTFfJmQ9RHdJQkFnJmM9NVZEMFJUdE5sVGgzeWNk
NDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT02
ejJ1NEVVajY0U0RQVzdvbEJ3TjJicl9OOWsxY19yNE1Mb3pGVnFTRDlFJnM9R0lWR2VTcjhfMEZD
UHlubmZ1bjJJZ2J4anlzUXlGNGJuY25HT0ZfQ3lYNCZlPSANCiAgICANCiAgICBUaGUgZG9jdW1l
bnRhdGlvbiBzdWdnZXN0cyB0aGVzZSB0b29scyBhcmUgcHJpbWFyaWx5IGZvciBkZWJ1Z2dpbmcN
CiAgICBwdXJwb3Nlcy4gVGhpcyB3YXNuJ3QgY2xlYXIgdG8gbWUgcHJldmlvdXNseSAtIEkgbm93
IHRoaW5rIHdlIHNob3VsZA0KICAgIGp1c3QgaG9zdCB0aGVtIGluIHRoZSBvcGVuYm1jLXRvb2xz
IHJlcG8gd2hlcmUgd2UgYWxyZWFkeSBob3N0IGENCiAgICBidW5jaCBvZiBvdGhlciBzY3JpcHRz
IGZvciBkZWJ1Z2dpbmcuIElmIHlvdSB3YW50IHRvIGluc3RhbGwgdGhlbSBpbiB0aGUNCiAgICBp
bWFnZSB0aGVuIHdlIGp1c3Qgd3JpdGUgdGhlIHJlY2lwZXMgbmVjZXNzYXJ5Lg0KSSBzZWUgaW4g
b3BlbmJtYy10b29scyByZXBvLCB0aGVyZSBhcmUgc2VwYXJhdGUgZGlyZWN0b3JpZXMgZm9yIGlu
ZGl2aWR1YWwgdXNlcg0KQW5kIGl0IGNvbnRhaW5zIG9ubHkgc2NyaXB0cy4gSSB3b3VsZCBsaWtl
IHRoaXMgZGVidWcgdG9vbHMgdG8gYmUgYnVpbGRhYmxlIHZpYQ0KY21ha2UgYW5kIHdlIHNob3Vs
ZG4ndCBkb3dubG9hZCB3aG9sZSByZXBvIGlmIHdlIG5lZWQgb25seSB0aGVzZSB0b29scy4gDQpX
b3VsZCBwcmVmZXIgdG8gaGF2ZSBhIHNlcGFyYXRlIHJlcG8gZm9yIGFsbCB0b29scyB3aGljaCBj
YW4gYmUgdXNlZnVsLg0KICAgIA0KICAgIEFuZHJldw0KICAgIA0KDQo=
