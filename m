Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE538C1BA
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 21:55:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Njf5zKkzDqcM
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 05:55:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3128538ed9=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WpjFmQ1X"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="eGWBgNSP"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Nhk6x1KzDqcM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 05:54:25 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DJqNLL016201; Tue, 13 Aug 2019 12:53:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uFxBKRTqB+irMD772kGf4UMQ5vdGd+FYhIIktJBUMNM=;
 b=WpjFmQ1Xe3sP5DD4t8CIkOMF9Ng4vzHmZOemWhG6QJ1nagkAED9Ppl90eDrNWZqzQt9r
 PftHpO6rndIuOoTvmFGDXEsNyzB9pAhbBugmjx7ObvJzw6bdXKgFm/SfgrNYQDVQvTXK
 Wd+S4RErTJZb0bV+v14l814egGIkbzF9cAc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uc1xvghf5-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Aug 2019 12:53:18 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Aug 2019 12:53:00 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Aug 2019 12:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H45XVrjAwANoQenGXep4AkSPBHqdepLoHT3SK3/xrdqrFOpfBKUmkmsAnfNRASlLCWOzSwhoc3yOhLFk1vIPWBgalyD9QY5eC47jfOcnVVSNWn06Hcgo7Y7QMSd31oS1L+yk2QH5LU657sxS2PLcl4w/WL6RHFG0mf59q67sni2YBRBtycvPh5JjnbBqXGrW4GfG8maYzzTvnWYD4bCJ4fuegBs9F7p2UJB469JWBgiRPw40oTjKBkOVFz/AiXhnWNjEIQiubwUU31xcuXgQJZc6Tkkcx6Jp6/D3Rdzs6IK8VvYrb7fzvw5kvP2XWE8iGTFdzsBuQUxDc/Ws6iMcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFxBKRTqB+irMD772kGf4UMQ5vdGd+FYhIIktJBUMNM=;
 b=BHvMpnD4ynsR6nLKBNw8BUeX3XAd6tXNPe7zlOa8spn7Z0ADMOiOEcVegt56lEnvYRafdSoXrt/yrz4EO2ChH8lytUVrwULmfvlfdNZMVTsFCs0e5Q/63u3ohxv5X3YXYHHyAMH7f0ICFbhp4Q3cZ84WOMNaBxhhXyzzrX6XPckoDCQE3fnETvHdOU5FjevOWbAaSKRzKcMO8fQwuinx/SAugTvDIk4tP4UaVD/BeNkwIRxEz58cSEe5LwgSgw5zEVcHMq2xmJ4cRQhrORKnwOgecAYJTu3jCpRmCf0+EHCsklTn5XEZY/0drMfhradOxfPcAA9qapFXHJTmcJ9MnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFxBKRTqB+irMD772kGf4UMQ5vdGd+FYhIIktJBUMNM=;
 b=eGWBgNSP2/NRotB34VBF46NHFyWqpi0EJHFsUckLuc/yexr/GSTEJ1HSgqo45WEzODT08I9xzoC/xik7BKsN1Q9JgZR9+2TsoQ9JwpUFQ1nxhMZqKg9e8RO5hNncGcpT6wp/KDZo/nJ9HD7sDA6XJfbZsVQPfgIhAGo5K8L19Lw=
Received: from CH2PR15MB3686.namprd15.prod.outlook.com (10.255.155.143) by
 CH2PR15MB3607.namprd15.prod.outlook.com (52.132.228.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 19:53:00 +0000
Received: from CH2PR15MB3686.namprd15.prod.outlook.com
 ([fe80::9d88:b74a:48ea:cf6c]) by CH2PR15MB3686.namprd15.prod.outlook.com
 ([fe80::9d88:b74a:48ea:cf6c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 19:53:00 +0000
From: Ben Wei <benwei@fb.com>
To: Tao Ren <taoren@fb.com>, Terry Duncan <terry.s.duncan@linux.intel.com>
Subject: RE: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Topic: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Index: AQHVTLYXvEPb5D4KhEGV/bPPR833MKbwAYEAgAAEloCAADQnAIABB7CA///nDgCAAJqugIAAE4WAgAAKTAD///adAIAHd5c0gAAgs4CAABGJYA==
Date: Tue, 13 Aug 2019 19:52:59 +0000
Message-ID: <CH2PR15MB3686B3A20A231FC111C42F40A3D20@CH2PR15MB3686.namprd15.prod.outlook.com>
References: <20190807002118.164360-1-taoren@fb.com>
 <20190807112518.644a21a2@cakuba.netronome.com>
 <20190807184143.GE26047@lunn.ch>
 <806a76a8-229a-7f24-33c7-2cf2094f3436@fb.com>
 <20190808133209.GB32706@lunn.ch>
 <77762b10-b8e7-b8a4-3fc0-e901707a1d54@fb.com>
 <20190808211629.GQ27917@lunn.ch>
 <ac22bbe0-36ca-b4b9-7ea7-7b1741c2070d@fb.com>
 <20190808230312.GS27917@lunn.ch>
 <f1519844-4e21-a9a4-1a69-60c37bd07f75@fb.com>
 <10079A1AC4244A41BC7939A794B72C238FCE0E03@fmsmsx104.amr.corp.intel.com>
 <bc9da695-3fd3-6643-8e06-562cc08fbc62@linux.intel.com>
 <dc0382c9-7995-edf5-ee1c-508b0f759c3d@linux.intel.com>
 <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
In-Reply-To: <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:dcae]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84280920-8f2b-466d-7102-08d72027d83f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR15MB3607; 
x-ms-traffictypediagnostic: CH2PR15MB3607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR15MB3607C76CB5A0250F2121E923A3D20@CH2PR15MB3607.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(6246003)(53936002)(14454004)(305945005)(74316002)(55016002)(186003)(7736002)(5660300002)(46003)(316002)(99286004)(229853002)(8676002)(53546011)(54906003)(9686003)(76176011)(86362001)(110136005)(52536014)(7696005)(4326008)(102836004)(33656002)(6506007)(71200400001)(66446008)(71190400001)(256004)(66946007)(8936002)(11346002)(446003)(64756008)(66556008)(25786009)(2906002)(76116006)(476003)(81156014)(478600001)(6116002)(6436002)(81166006)(66476007)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR15MB3607;
 H:CH2PR15MB3686.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D/rJXyA5wBFFisBYKgol8QCHgJYWMPD6d5yo09iM1xGJAFWa9PiESPCyW6XC1SU7yTAfy6hI9xYqyRb/nS3oEN0UETploW6hvNNS+C5el9F81vn1cIBOR2/9lN6CnS80L+qoxRcSClsvGLYHTnSgFnxVDG2TLShxJB6+hmhx9Wu6f06MHF4dd7fC5hJ0XV4UTnr9lWbuyM50CUFW5JHzDoTxOU+2ZC+49Cgn4Sv6omfvIcuw5gzVeVQQXzmeeyFBHyfKDUODfO+tUxgDQ8XpCPoIN2QUgmDbyXxfP7ZlM170zodHwVeS0tojCCVu/ihWsS7Fw8R0GfBKB193dAYMPcI6VoAAEDh472Yhaf7t05+HFAqSuWexfCqcM+gUYWCXv0Usd/w77d/kFTpVVQrh3WCJ+KcQqb035Gz/Q7VjIsk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 84280920-8f2b-466d-7102-08d72027d83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 19:52:59.8794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wWRNpBuReBbg002O62fhdaoNtovTYfER8veGiolotWtwmeR07SA2PVVMvzP9nNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3607
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130187
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <jakub.kicinski@netronome.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S.Miller" <davem@davemloft.net>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiA4LzEzLzE5IDk6MzEgQU0sIFRlcnJ5IER1bmNhbiB3cm90ZToNCj4gPiBUYW8sIGluIHlv
dXIgbmV3IHBhdGNoIHdpbGwgaXQgYmUgcG9zc2libGUgdG8gZGlzYWJsZSB0aGUgc2V0dGluZyBv
ZiB0aGUgQk1DIE1BQz/CoCBJIHdvdWxkIGxpa2UgdG8gYmUgYWJsZSB0byBzZW5kIE5DU0lfT0VN
X0dFVF9NQUMgcGVyaGFwcyB3aXRoIG5ldGxpbmsgKFRCRCkgdG8gZ2V0IHRoZSBzeXN0ZW0gYWRk
cmVzcyB3aXRob3V0IGl0IGFmZmVjdGluZyB0aGUgQk1DIGFkZHJlc3MuDQo+ID4gDQo+ID4gSSB3
YXMgYWJvdXQgdG8gc2VuZCBwYXRjaGVzIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgSW50ZWwgYWRh
cHRlcnMgd2hlbiBJIHNhdyB0aGlzIHRocmVhZC4NCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gDQo+
ID4gVGVycnkNCj4NCj4gSGkgVGVycnksDQo+DQo+IFNvdW5kcyBsaWtlIHlvdSBhcmUgcGxhbm5p
bmcgdG8gY29uZmlndXJlIEJNQyBNQUMgYWRkcmVzcyBmcm9tIHVzZXIgc3BhY2UgdmlhIG5ldGxp
bms/IEJlbiBXZWkgPGJlbndlaUBmYi5jb20+IHN0YXJ0ZWQgYSB0aHJlYWQgIk91dC1vZi1iYW5k
IE5JQyBtYW5hZ2VtZW50IiBpbiBvcGVuYm1jIGNvbW11bml0eSBmb3IgTkNTSSBtYW5hZ2VtZW50
IHVzaW5nIG5ldGxpbmssIGFuZCB5b3UgbWF5IGZvbGxvdyB1cCB3aXRoIGhpbSBmb3IgZGV0YWls
cy4NCg0KSGkgVGVycnksIA0KRG8geW91IHBsYW4gdG8gbW9uaXRvciBhbmQgY29uZmlndXJlIE5J
QyB0aHJvdWdoIHVzZSBzcGFjZSBwcm9ncmFtcyB2aWEgbmV0bGluaz8gIEknbSBjdXJpb3VzIGlm
IHlvdSBoYXZlIGFkZGl0aW9uYWwgdXNlIGNhc2VzLg0KSSBoYWQgcGxhbm5lZCB0byBhZGQgc29t
ZSBkYWVtb24gaW4gdXNlciBzcGFjZSB0byBtb25pdG9yIE5JQyB0aHJvdWdoIE5DLVNJLCBwcmlt
YXJpbHkgdG8gbG9nIEFFTnMsIGNoZWNrIGxpbmsgc3RhdHVzIGFuZCByZXRyaWV2ZSBOSUMgY291
bnRlcnMuICANCldlIGNhbiBjb2xsYWJvcmF0ZSBvbiB0aGVzZSBpZiB0aGV5IGFsaWduIHdpdGgg
eW91ciBuZWVkcyBhcyB3ZWxsLiAgDQoNCkFsc28gYWJvdXQgSW50ZWwgTklDLCBkbyB5b3Ugbm90
IHBsYW4gdG8gZGVyaXZlIHN5c3RlbSBhZGRyZXNzIGZyb20gQk1DIE1BQz8gSXMgdGhlIEJNQyBN
QUMgaW5kZXBlbmRlbnQgb2Ygc3lzdGVtIGFkZHJlc3M/DQoNClRoYW5rcywNCi1CZW4NCg==
