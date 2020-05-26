Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD781E2985
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 20:02:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Whcv5Cn8zDqK9
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:02:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=24151d482d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=l7kHGis/; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=J+UmtToW; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Whc43SjZzDqHx
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 04:01:37 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 04QHwb8b010445;
 Tue, 26 May 2020 11:01:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=bwUwW/MRho22u5ya3DlCZXgp9SowGgKJtp2cz4juKoE=;
 b=l7kHGis/ep/RWyl43740qhDtaEEzJEpo/G1D7rnKQ9zqj7BltzsfxeWUeaoGlW2R9nyO
 fPDQUQxYHkTBSEIsiQWTSLJ7mpTMw1oh3IqUOI4erYeAeaVmTwecgtDqwGswKw2rDw5u
 HSrMTqRKNXX2e/gcvPoiRfbqrv7dMMxR+Is= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 316ygpkgtr-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 May 2020 11:01:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 26 May 2020 11:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdEcjHjoSGSWwW7OrHd8lY2wDTk9aCLbVMrcUvb81NfPLoMuSZEmhOxrNeX1sBzcsn8QfmZnkMpcxZyDh6tmkhR5QZgQ5CDk9VHffQlgNLpI2zUA8gAtyBm4ecDojUPXUh2yG+gkiZu9x2v8RgV6cZMlConj5fBWzPLUwORAAJugDeG0G9qaUPMx6O6HNX4ZDQ7f3EFh/xmqnNn4JRTfTPVDYbV+9NvhRf+kxPA3yQd/M/E+389oQ6Ok+q/wK1NEGqAd+afmig2A4sBO7EpmmRh/Ur6inNTiziGgNTmm8sN0fE2D5iL5wmbAi+2JjvhnIa2HF0acdoTRXFSgB+hFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwUwW/MRho22u5ya3DlCZXgp9SowGgKJtp2cz4juKoE=;
 b=d7I4LPDw1w0/bi+x0QMkHjE06V2U4dbhp201HNCvntAmW9Y2RxFOPxN0fC/dpxwmz3wHuj1XSY4MJ02XTkSnSR1e2Y8caXjHsyMKmkvRLdSeL3bYIC5lgf+eMed21REHJQbiDg3pXrOZAy+hviXQX6GQtxqDQYobOVGkF4F/xy6vRyZMwV+y6Lss7YPrx5ICAc4nqXaaTkUJHL6zTunTU6SzdOQ6TMggysTEpvesMP3wpDVfZRz1Lk27yqLv9lf6CGbsEJo3QSUF5JTY/hjxJgXqXuTU6Is0nzBbDqzy3NKdlR7h+kE0wXFq/7il+sYRvPD0zDzmKp09YNXlF/SEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwUwW/MRho22u5ya3DlCZXgp9SowGgKJtp2cz4juKoE=;
 b=J+UmtToWxEP/jXNSvnU3ywSXB6HN+YrzHFX4flWIMF6zL13qkmaDWq/ots01MfCkcFUQNDoGH9cCKZ5UKINY/QfN0ruQnbEd9tEHRZSV7sv12p0to5Oipxc9ZkXy6+p22Vo5xgIjU9Q30Mss/MBM9+5ZewCnluO6v6x5TgnXQTU=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4120.namprd15.prod.outlook.com (2603:10b6:a02:c4::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 18:01:20 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:01:20 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sunitha Harish <sunithaharish04@gmail.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: Introducing IBM OEM
Thread-Topic: Introducing IBM OEM
Thread-Index: AQHWL/qWVz1h6kpCQ0WQB8Ghkf/2Zqi6OgKA
Date: Tue, 26 May 2020 18:01:20 +0000
Message-ID: <DE564558-2E18-47C1-8D35-0BDEDA8362B6@fb.com>
References: <477b1d3a-214f-0e25-2062-c2f69f06279f@gmail.com>
In-Reply-To: <477b1d3a-214f-0e25-2062-c2f69f06279f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ae29c77-5b3f-4831-5f72-08d8019ecb95
x-ms-traffictypediagnostic: BYAPR15MB4120:
x-microsoft-antispam-prvs: <BYAPR15MB41201E1147818BEE55ADDB06DDB00@BYAPR15MB4120.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0MMpf45YqcklXE0rNEDbEHcPD0RKCV3AXHQZo8tbT5izngyDG65sqUdHbdPW2DceSGX/hqMRYUTNdRW8gf5U/FPrPuv5h9xeyuNidLCY+YblqEr/JqFwYs13Tl33RSlOs7ZQnRuw3sz82q/p0Ry7vgt/Nj1pCmVojkmXnt5IQWNpacnUOOUNYXED0mXY2dNEsp3/o6Uxk9LH4erewxiQ5x5KCy3orl2NQjqGLjPI5J482ubZfwEkJtmfr3kKp6oPhaQZMjwCsr79frFwmwtbOM8uturYb8pG25vmCaKIUNwSTshRPcP8GAvpg1AjiYDh41rORk6GBAT8+mtpEOMFsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39860400002)(366004)(136003)(376002)(71200400001)(2616005)(8676002)(36756003)(6512007)(5660300002)(186003)(2906002)(8936002)(4744005)(6486002)(76116006)(33656002)(3480700007)(66446008)(66556008)(66476007)(66946007)(6506007)(64756008)(478600001)(7116003)(316002)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vC51bSsITWxU5hXnFiJSUcxciCQwb+WBLCgS8y8X4xFff1HhY0NCUfKbNAh2/HBpdLCS66Y1eaNb8kfbDQoo0b8nWDxcP/XLak03QcvlmXgwbcZacrdpnHSi7Xz0rnI5qoTgBEV6krKbRvAh4YxJN9gbQNr0fYSHjQw0bYF/N1/9UoTti3RUsL/WOeC8vLzSsz7Gd7U98gxsIGT5dK0mOPg62jD6bb2Mj7bWgOX8+i/mesYHCZe7FzsxE+RFIyGuFdT9rEe1ZT1FRtXjNqF6lBFqdvf1kCBlTU5lmFx/TIFJ/z39aXiArg/TU+2A3qMbtgiCbqI4AsBUtm9DvLZHo1Ap3GnDR/q6YqlNQoKyjbzzVTJ0/IOcAeHMZlzB8lVhqa5BEBNSCJEwp2zn6WKPAGG/BWIc/wGCWmQlqGvhVzByPCHG66wcFA+znQh1yA5cdEy/T4oHzyANoi/dK+jPRvpMqyo0w81mW4DoETrbFPbPeexBvvhz9LY0EzQeuSmg65avygbpHHGl33nOe3sPcHqSsOzStngktIE7txaq6H8C6eb/PmOHGWcZSBv6FG8k
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9DF3A990462DB49A35D4439F432D081@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae29c77-5b3f-4831-5f72-08d8019ecb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 18:01:20.3130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNYL/gQzsdLYntH4r1E5OMSdb3fBpYC44DAhzlNixEFHpUoYmwgVHsgS+y7GI8H5Zofc196OIJIcQe70ZR/TjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4120
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 cotscore=-2147483648 mlxlogscore=986
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005260139
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

SGkgU3VuaXRoYSwNCkNhbiB5b3UgYWRkIE9lbS1JQk0gaW4gdGhlIHNhbWUgcmVwbyB1bmRlciBP
ZW0tT3BlbkJNQyBhbmQgaGF2ZQ0KQnVpbGQgdGltZSBjb25maWcgdG8gYnVpbGQgd2hvZXZlciBu
ZWVkcyBpdC4gQXMgYW55b25lIG5lZWRzIGFuIE9lbSBmb3IgDQp0aGVpciBwbGF0Zm9ybSBjYW4g
YWRkIGluIHRoaXMgcmVwbyByYXRoZXIgdGhhbiBoYXZpbmcgc2VwYXJhdGUgcmVwbyBmb3INCmVh
Y2ggcGxhdGZvcm0uDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiA1LzIxLzIwLCAxMDozMyBQ
TSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFN1bml0aGEgSGFyaXNoIiA8b3BlbmJtYy1ib3VuY2Vz
K3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBzdW5pdGhh
aGFyaXNoMDRAZ21haWwuY29tPiB3cm90ZToNCg0KICAgIEhpLA0KICAgIA0KICAgIElCTSdzIG1h
bmFnZW1lbnQgY29uc29sZSBoYXMgc29tZSByZXF1aXJlbWVudHMgLCB3aGljaCBhcmUgb25seSBz
cGVjaWZpYyANCiAgICB0byBJQk0uIEZvciB0aGVzZSwgd2Ugd2lsbCBuZWVkIHRvIGFkZCBzb21l
IE9FTSBwYXJhbWV0ZXJzLiBUaGVzZSANCiAgICB1c2VjYXNlcyBJQk0gc3BlY2lmaWMuIFNpbmNl
IHRoZXNlIGFyZSBub3QgaW4gdGhlIGludGVyZXN0IG9mIHRoZSANCiAgICBjb21tdW5pdHkgLCB3
ZSBhcmUgcGxhbm5pbmcgdG8gaW50cm9kdWNlIHRoZSAiT2VtLUlCTSIgLSBzaW1pbGFyIHRvIHRo
ZSANCiAgICAiT2VtLU9wZW5CTUMiLg0KICAgIA0KICAgIEFueSBmZWVkYmFjayBpcyB3ZWxjb21l
Lg0KICAgIA0KICAgIFRoYW5rcyAmIHJlZ2FyZHMsDQogICAgU3VuaXRoYQ0KICAgIA0KICAgIA0K
ICAgIA0KDQo=
