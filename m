Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA8B8280
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 22:33:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z7pk38rDzDrft
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 06:33:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4165da9d14=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NEvGoHKG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="lTohUUyk"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z7nq3bx7zF3Ct
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 06:32:45 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8JKWW65010588;
 Thu, 19 Sep 2019 13:32:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=oN4D1s2mNsGyMci0XlPhl+2/no2lDu5dKNVMDCim1AY=;
 b=NEvGoHKGAbU5LsESWLkoAj5T5loH6Xcu7HeEQkS37D5gTe9uuNgSjAVWWDnAsWhufHjE
 KOotUVcgoI5pduVwfff9D8KoJnonFy3igE1Qj1uLgJDephysNB8om9hnhgHLt8w3ZwjY
 ZGvIJcCMteIcQ9QV1w8+cqHq2PoaG+kJ1v0= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2v3vaed0m0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 13:32:36 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 19 Sep 2019 13:32:27 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Sep 2019 13:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmp6ZAzOtH/SNaEyEbH3ApT2AmbI2nU1HYPvD8r+PcdRvYvoCHrmtpLZ026RGWK+DmuT4/MHx/vAc35P42rc1+BaZE5XYkuSLzj2YIX7o3Dj2yvxGVyfk3u3XndyOr6jRLPUAbYKPabJhYBDEHKwb07Q85jlJTNiPnWEukNkU7qsRp1n280K+Toe0Xlbcy90aQJRPuwOVSuQ2wUFZsV6JCb36ZZoCLQh9vg3vI61VRLAEf+KphLBtoOgI8Z1nnIlcylJJ7nPNa6/LyJJo1NZ0RF0gdsgIsu6L0x7725dxQvvqwIpVCWiRH0qgKDML6pfQ3SCohr5iCn6U3Io3E4WpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN4D1s2mNsGyMci0XlPhl+2/no2lDu5dKNVMDCim1AY=;
 b=Kof7PNK02GDmnj+cOtZeKnjWzTrxT+6IptjwGDxmoXRjGWKSgzAbX3hMI+Q9lOw5OkruFHy7oe3oiJbw9mqWZumWnrFCp7TW0J/3udssHays4yAu1oZXKQRvTB9LdaLDiWCP5nW3+EJCFU69sv+QqX+XyzwVcKAOS9ir/+s1PPb/QzY4w2gC7qdsp6OqYYrXVfKdqiJNIa4tFyvYG/vXeHO5j0vfueRfkpAFn24rp51GASTz3NXmYysxc8MGc/5ysNNJjRy1O4K0+7TzQxZ6mXPGfIJKV5McUinMaOp5vXAPqBubEyP+7pcf+VHyxp9mE3W/3XrUh1syRt8h+yo53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN4D1s2mNsGyMci0XlPhl+2/no2lDu5dKNVMDCim1AY=;
 b=lTohUUyku24Dw9xdFFozUzy3GB6ZsEqtvKn7/Sx3d82FCaBEijq32EMtDAw/iEXK7BSX3hpTApDdyXW1aqoYUeVUW2F5XZM7GPdRVwGzfKb4XLag7A5bAobKbU2C6KOoxZOq9oEaUZAlAuIb2DM2/INgcVVz+rc0Lofgp6l9ONs=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3650.namprd15.prod.outlook.com (52.133.253.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.16; Thu, 19 Sep 2019 20:32:26 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 20:32:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: add zeus to layer compatibility
Thread-Topic: add zeus to layer compatibility
Thread-Index: AQHVbwl7SY2eBCGOOUC0sqfLlmAbc6cy/0WA
Date: Thu, 19 Sep 2019 20:32:26 +0000
Message-ID: <5891C141-6870-4F27-AB6B-96D8CD9253CA@fb.com>
References: <637583D1-F0AD-4853-A0E1-860FAC93AC22@fuzziesquirrel.com>
In-Reply-To: <637583D1-F0AD-4853-A0E1-860FAC93AC22@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:ace7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 963ef8af-d1ef-46db-3ad0-08d73d407c0d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3650; 
x-ms-traffictypediagnostic: BY5PR15MB3650:
x-microsoft-antispam-prvs: <BY5PR15MB3650E12ECBF87F1702A8EE99DD890@BY5PR15MB3650.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(46003)(446003)(110136005)(76176011)(11346002)(8936002)(476003)(5660300002)(76116006)(66476007)(14444005)(6512007)(8676002)(64756008)(33656002)(66556008)(6486002)(91956017)(305945005)(86362001)(486006)(6436002)(66446008)(66946007)(14454004)(81166006)(229853002)(478600001)(2616005)(71190400001)(25786009)(4744005)(7736002)(256004)(81156014)(99286004)(186003)(6246003)(6116002)(102836004)(2906002)(316002)(36756003)(6506007)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3650;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YqrsPF2tJDUflKo70dgxRc4GyuJgaG6kUEvGAo85IiLsiUXQ1wt67SioIiSp2PxkGTPjRctl+YSO8nPO5lBwKLe6gyqF3TjEc04j3xUG5HIe3WxVFvq+9JkjTjpqpTCn66V0zNoFQo/OxtLe5cucqia8WN2NnkAkavpwV/nEEgwCgrG4BZTJhcUM7U6VakSxckvgZ4nhHoFF34KmNXIFuYjphd/Z5VEGgNjTwl5XvevYD9rYsjspS4It1SyrCuqS7MVEPy7zc7r2BbOGuENCNIcdwXTEX/FilLZZhkPsnfAcObANtlOKeGTTZQCeRGV87+mXsC4La1Y6DHye05ASuRktWR0vI7eEmVXvUE2wvWviq195GMyd4+YY+sQaMb4bfND+kdwFNDiUUS/C/1TafxqI6fPccMTh7gKMZxfyAQQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <770E019CF0F3A84FA8AD6294CA0A3B3D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 963ef8af-d1ef-46db-3ad0-08d73d407c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 20:32:26.2748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hU3ZYgll63UmdRp9ADsilReFv8y14Ul8GHkBlqeY1h9FvJCBT2RJqW2sudQQvYRof+eNQoBdoo8+OGe/9NGl0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3650
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_05:2019-09-19,2019-09-19 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=583 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909190174
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

DQoNCu+7v09uIDkvMTkvMTksIDk6NDQgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCcmFkIEJp
c2hvcCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgYnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCg0KICAg
IFRoaXMgaXMganVzdCBhIHF1aWNrIHJlbWluZGVyIHRvIGFkZCB6ZXVzIHRvIHlvdXIgTEFZRVJT
RVJJRVNfQ09NUEFULiAgIA0KICAgIERvaW5nIHRoaXMgYWhlYWQgb2YgdGltZSAobm93KSB3aWxs
IHNhdmUgeW91IGZyb20gYSBsYXN0IG1pbnV0ZSBzY3JhbWJsZSAgDQogICAgd2hlbiBJIHB1bGwg
aW4gT0UtQ29yZSB0aGF0IGRyb3BzIHN1cHBvcnQgZm9yIHdhcnJpb3IuDQoNClRoYW5rcyBCcmFk
LA0KSSB3aWxsIHNlbmQgcGF0Y2ggZm9yIG1ldGEtZmFjZWJvb2suDQogICAgDQogICAgdGh4IC0g
YnJhZA0KICAgIA0KDQo=
