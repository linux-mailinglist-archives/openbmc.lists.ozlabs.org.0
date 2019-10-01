Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1BC42CF
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 23:37:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jXgB269WzDqSx
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 07:37:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=517720bcb2=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kaHe1uPf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LXxkZ7mp"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jXfT6dXczDqMN
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 07:37:01 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x91LYcTG005134;
 Tue, 1 Oct 2019 14:36:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=niLr6PIyrWwEn3jDPmR9BJaToC1fVeOT538z8ZgrX/k=;
 b=kaHe1uPfp6x3aV4L+EEOw3WLBcIX+QWRxJIzV6jVGXXmyKKwjlsrAwxzGvpDxH5dQW9l
 g6/uhFfjyyMCI3QRL/5hfaL8eDBCeKfuziBvJIJSFppx5gA9z++kky9t0VXxY/bK2Pdf
 Ownp/fjc8CaCr8TyEbawMgCoc7ulsK2QlcA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2vbq6ge2ev-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:36:53 -0700
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 1 Oct 2019 14:36:50 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 1 Oct 2019 14:36:50 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Oct 2019 14:36:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU64GyZnyPSThb7DzmbRCaLN06n3cvjWUdgCWuQkv9fhdsDHR2j58ia9LZANxFIKxQUPHY7zpKP2I1KunEk4e7+701iKHshdrS6upCfv6nPnKDTOZfP6/C1prQMNxm71/gKiubcLDtXLYoA8da+VVyG4VFq+I4VbYAR/iZNqyTu6agJEq6lafwIBroLpk2sdoJg5IguVmniYO4tbkc7uujmQDeS5xDX0M9nPZjUiXKLEu8ZYFoQUV7gfV2YCX316vq7xC2wYCdGAl0YiQDRxcjqaK1d6PwCbBrQNlNS03+V51PKpKMsyiNtJmz8GGo5/7x1w5IjvnoVHCEwNmtWnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niLr6PIyrWwEn3jDPmR9BJaToC1fVeOT538z8ZgrX/k=;
 b=LTG0r3wapRiNy2lNuhonRVIg9GdAJ8kJe4HeETX0ireeS6hHwZq2UhjMzWgwWSDhi9tB/g8Y8MDA08NhySTVNdk5Kyo85jhx/4i+6zHpnH53WIszEKJDdfhTPcZsa87Ucz39PLxPWih6CcvDR+zPeIbINmN+kHwOB+quqETLsQkRdkEZ35Nq4B0G9pP+rh259iP7fGfR29kdoN4K8fNfJ/eFZqIqBhCnq3mEJT/Ly4nFyAlHAoKfMR2uBg1+IVWCtIUn24B6o2yMbFat+4sDdDCJzuNaEFLxJyPjDYDKBsxQ3gzDG3tZvxhuj+OkqmIm16myA96ZmvuECaTKI8Yr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niLr6PIyrWwEn3jDPmR9BJaToC1fVeOT538z8ZgrX/k=;
 b=LXxkZ7mpAa/T9YyMpprXpC3lUHr8h78e4RA4Y76JZA0UnVZQkdWV0lTyon7wtPpYjvLNBGS2Cwo4tWHwO5qsIcbNNF4ut6x5Nqm6bPbAlchruDXfaIct3WagSvB6bYxb5L1YN6lrL9zUp5ZPy0W60wHQpa4g/M81+Bhi8lW7TrY=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3602.namprd15.prod.outlook.com (52.133.252.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:36:49 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 21:36:49 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Tao Ren <taoren@fb.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Re: i2c-dev wrapper
Thread-Topic: [Potential Spoof] Re: i2c-dev wrapper
Thread-Index: AQHVeKBU/TT4IKivmUS6dY5+nlVMYg==
Date: Tue, 1 Oct 2019 21:36:49 +0000
Message-ID: <686CD1F4-2558-48BB-B364-E44C482143CA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:1813]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afb322a1-95c6-4df1-d895-08d746b77791
x-ms-traffictypediagnostic: BY5PR15MB3602:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB360279EA6F2C366D48C986EDDD9D0@BY5PR15MB3602.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(136003)(366004)(376002)(199004)(189003)(486006)(186003)(81156014)(110136005)(476003)(5660300002)(53546011)(71200400001)(316002)(305945005)(81166006)(46003)(8676002)(71190400001)(6246003)(8936002)(86362001)(4326008)(2616005)(102836004)(4744005)(6506007)(7736002)(66476007)(66556008)(33656002)(66946007)(478600001)(25786009)(6116002)(2906002)(91956017)(99286004)(6512007)(966005)(256004)(76116006)(14454004)(6486002)(66446008)(64756008)(229853002)(6306002)(6436002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3602;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ctdduo8IzwPxph81KwAxv9I1mny5qkEJdHvLAnfHIalfQxQ/1a78EpWC2l9fl8nNpZlpDG/YCBFOjEI62KyooI3jpCVuhgajVb4/db7fvoqtJRI7Zyd4otN0rSfdN3qfIsMC5EIotK7F/wpvHxCNSzeEQXEgvf8hjdHJfNH0ywQFFXUeBGsMxdpHs+Xwg8bZfrF8pRtLyAKMFf6eaT4PpQsZgQwXwfARMXCpSLVwuqGiEfMagBm+zuMU4r3zEi055riqEdpnPrcIU+P6K3IHN6X8HRW83Xfj09bZVb87Ip76gWH42qVUo9D9Fkkhaa2F9TTw9vNsO8UcmVkb1GvujqDmDi6uIECJi0Xxbq7oKBb01zhSjOnm/8LbDfKA8z6GJlv57JhBZQQscEVeW1c9+z8cfLbDZa50porr67/gwOzuay1m52TZGWgiLV80gMNOVBfgWShlOR3tJx5539YC/g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F03C508CC348FC4D8C9EDF3D6A162FB0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: afb322a1-95c6-4df1-d895-08d746b77791
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:36:49.3212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5iOMoWG2fFm9f0yPDAEdnSttF11gHEyPF5msdJ66Tnbb++TxY8yQt0PceA12Vm4+r32FQ7yg1Y+tdsxuBQDJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3602
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_10:2019-10-01,2019-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=430
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910010178
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
Cc: "shawnmm@linux.ibm.com" <shawnmm@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjkvMTksIDY6MDEgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBUYW8gUmVu
IiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9u
IGJlaGFsZiBvZiB0YW9yZW5AZmIuY29tPiB3cm90ZToNCg0KICAgIE9uIDkvMjcvMTkgNDo1NCBB
TSwgQnJhZCBCaXNob3Agd3JvdGU6DQogICAgPiBEb2VzIGFueW9uZSBoYXZlIGEgZmF2b3JpdGUg
aTJjLWRldiBBUEkgd3JhcHBlcj8gIFByZWZlcmFibHkgYnV0IG5vdCBuZWNlc3NhcmlseSBpbiBD
Kys/DQogICAgDQogICAgaTJjLXRvb2xzIChiZWxvdyB1cmwpIHByb3ZpZGVzIHNldmVyYWwgZWFz
eS10by11c2UgQVBJcy4gTWF5YmUgeW91IGFyZSBsb29raW5nIGZvciBtb3JlIEFQSXM/DQogICAg
DQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2kyYy10b29scy9pMmMt
dG9vbHMuZ2l0L3RyZWUvaW5jbHVkZS9pMmMvc21idXMuaA0KDQpCcmFkLCBXZSBhcmUgdXNpbmcg
dGhlbSBpbiBlbnRpdHkgbWFuYWdlciBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHkt
bWFuYWdlci9ibG9iL21hc3Rlci9zcmMvRnJ1RGV2aWNlLmNwcA0KDQogICAgDQogICAgDQogICAg
Q2hlZXJzLA0KICAgIA0KICAgIFRhbw0KICAgIA0KDQo=
