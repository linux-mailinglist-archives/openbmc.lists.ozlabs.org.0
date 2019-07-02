Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE95D6EE
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 21:32:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dZBM32yPzDqCB
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 05:32:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=208674a22d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="D1x7K2F3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ILE+eyF0"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dZ9l2Nn1zDqVx
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 05:31:37 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62IaZHO020477; Tue, 2 Jul 2019 11:37:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=z3YJ00yTapkGTLVmcpBmPEYWDsbLW7PsZkKwvAGJSX0=;
 b=D1x7K2F31F9kr37DNcK6ws4sZz2S3VjaCIMu+f//WmlPT9gInFxkbXK1iqBDD8sPA+R6
 r0zdsyCaaiS/HRAxPNCuQejIKWFN7wLRAos08biFED5rVEKb6NzYLursZN1dgpnSP2FG
 eR9YXEyVKgEugWsUbqyryH2bHDYxRCqtKQw= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tg9uwrrgh-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2019 11:37:17 -0700
Received: from prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 2 Jul 2019 11:37:01 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 2 Jul 2019 11:37:00 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 2 Jul 2019 11:37:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3YJ00yTapkGTLVmcpBmPEYWDsbLW7PsZkKwvAGJSX0=;
 b=ILE+eyF0VVxL0a9DJ31rkIOnF0OksZbwnGpifPUnN8EyRQ9uqkQd5Lc67JD8ZqprAde8m8Yl+b5wGrngDjhMTzAa9SQY8leAnsEIltkas1LoXk5SVG+H3WzlAK2SSBa1eiEGmZOZRzCMOXqsSM2eLAOEUFqWAZFJ/FnuKXhLovU=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1141.namprd15.prod.outlook.com (10.172.176.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 18:37:00 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 18:37:00 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: obmc console history
Thread-Topic: obmc console history
Thread-Index: AQHVLFdLPkq8+/IBqkCiQwjkzhHXQKa218OAgABkeYA=
Date: Tue, 2 Jul 2019 18:36:59 +0000
Message-ID: <D4CC6262-3320-476B-AF69-FAD4A23704EC@fb.com>
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
 <CACPK8Xfa_VWRp7_Waxx0x+xKK7kWv+ugjdFNoMcb5MziF3BUwg@mail.gmail.com>
In-Reply-To: <CACPK8Xfa_VWRp7_Waxx0x+xKK7kWv+ugjdFNoMcb5MziF3BUwg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:9af6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0367adf8-b9fd-4716-2111-08d6ff1c44f2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1141; 
x-ms-traffictypediagnostic: CY4PR15MB1141:
x-microsoft-antispam-prvs: <CY4PR15MB1141982AD240CE2975267A5EDDF80@CY4PR15MB1141.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(39860400002)(136003)(346002)(396003)(199004)(189003)(46003)(186003)(68736007)(229853002)(102836004)(6486002)(5660300002)(256004)(486006)(4744005)(64756008)(6506007)(66476007)(3480700005)(81166006)(316002)(81156014)(73956011)(71200400001)(71190400001)(14454004)(305945005)(91956017)(66556008)(8936002)(76116006)(8676002)(25786009)(7736002)(66946007)(2906002)(6916009)(7116003)(53936002)(36756003)(6436002)(6512007)(66446008)(6246003)(76176011)(6116002)(4326008)(446003)(476003)(2616005)(478600001)(11346002)(86362001)(99286004)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1141;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a580z52Pw++npJPY+NGsnzBTlH+q1q3arS6LCbFzrHtNg62hsbd78+JgPrk+7bvkgAT5GdxEh/CYCLCHkJO70oaHD0pZGvFsGfcQnFhD+bRveJWqcqszUz1XPHo4Gkbpip/9nwOieuc4WQQ14IKkIGyKELF9ezCHrjSdw4tY8KsTb3SOMxfZzNGjQ1CHwoJ5/H9R9AUTSw5IkRgZ6Ae43BB2/R/JJej0hJXwmDGKbc13nDgxfU1VDyCdR818iZ5POhuhKXqZ/AsDRd+wKEUorkbLw9wGhPm3zqAabJ3eKFb7esKmHAt7mQ1IUu9MQkhgzxHs5SJzjTmDJyt6giUbShntPqB/zE+ywQsEI/WnTJ8Q4HQpVjDXu86a8inFr5+esn1tFKFotecOEFGJUlc3gymh+eXqtj0+WqHrZv4lJaY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D18BA460C9BA44CA604D3FFA5B58A4E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0367adf8-b9fd-4716-2111-08d6ff1c44f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 18:36:59.9679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1141
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=918 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020204
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

DQoNCu+7v09uIDcvMS8xOSwgMTA6MzcgUE0sICJKb2VsIFN0YW5sZXkiIDxqb2VsQGptcy5pZC5h
dT4gd3JvdGU6DQoNCiAgICBPbiBXZWQsIDI2IEp1biAyMDE5IGF0IDE5OjQzLCBWaWpheSBLaGVt
a2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gSGksDQogICAgPg0K
ICAgID4gRG8gd2UgaGF2ZSBvcHRpb24gb2Ygc3RvcmluZyBvYm1jIGNvbnNvbGUgaGlzdG9yeSBz
b21ld2hlcmUgd2hpY2ggY2FuIGJlIHJlZmVycmVkIGxhdGVyIG9uLg0KICAgIA0KICAgIG9ibWMt
Y29uc29sZS1zZXJ2ZXIgd3JpdGVzIGEgbG9nIHRvIC92YXIvbG9nL29ibWMtY29uc29sZS5sb2cN
ClRoYW5rcyBKb2VsLCBUaGlzIGlzIGdvb2QsIEkgc2VlIGl0Lg0KICAgIA0KICAgIENoZWVycywN
CiAgICANCiAgICBKb2VsDQogICAgDQoNCg==
