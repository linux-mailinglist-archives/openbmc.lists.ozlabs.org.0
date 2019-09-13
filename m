Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D9B1DE2
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 14:54:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VFvF2h2pzF5VS
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 22:54:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41592e3fcd=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="X4oOpKMi"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="BjdPAwgu"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VFsw2cHNzF5VM
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 22:52:44 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DCoN48010222
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 05:52:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=SdDRO5mjCRH1ir1uStyTOhfbiSVNn4kdMYw0b7lTuDI=;
 b=X4oOpKMiYb+ekJ+jYIsXJOF3QfqBd/4kVroc9nTqBdtGmdtNprsEgY14IpCDMuqet79t
 3Qq5WGMQfkhoDsPkMGMq5L1A7ttOyjrADCu3tDfUSuaIhFI6fUYEhd+wYIfbu1blOrpB
 SYssR+cmMIfdLVSox9dmS+aD5ELtZsaoMSs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uytdg3wbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 05:52:39 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Sep 2019 05:52:38 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Sep 2019 05:52:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Sep 2019 05:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wx2GiblnGwKUX6WrTt+3reLhyUDUd4ibO+g713fKnWrI7OARkesHZUa6AhSUM13LieSBzMVJ4BQb9nEk2h5y0ydUd+xDRaKFYNnifyli3t76voPnXY01Mt5LW7d7JH46K8WMUE0s+pTqWlvv77Isj9OjVMrQSLrplOHx5HP8opo2sYxs6hnMm7SV+xhbsaV/qR/d/gGGFHnfNGdJMnbbhExFBNNtePuNcTzvOqvMW6YT/3Bc4JHFcF0PvSYg1gWo4XxSzVc68q5Op00kIIA0TroJ+CnOMjC0tz9STFpEtgBGuN2PS5RdQfi7+0YH8uoTG/EJCDYjl2DqoyQgbFXvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdDRO5mjCRH1ir1uStyTOhfbiSVNn4kdMYw0b7lTuDI=;
 b=MVGDTS20Mu3rNtoDCdfBFBxVgzLLwvkPBzue+W1Qeu51Cb8lH/71EmmEi+7akQlqnsUeVQCGokzXYKivLsWOQh2KZ5CxDnzXLNcCPXyW/dadGAR5tK7efoVKAJQ6V+Z75uO9w9XOzj7IahCZK0tmZI4MNd6v926cm98E3wKBy3Aa8WNXLFF4v/XMFLcd9YeHBIMYtEDhjwb+jS4IQ59/7cOE7m1ggBooxFKbOnRV4s/nKF9sxpbNdRd+78I/XcsqJYmXWg9tnJ2bUynCAsQMep8BjZijq9I+q7/QRWjxiNsMNrpm92XLnLJk3MYtRSK1by0x4g117LR1nbLukiPJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdDRO5mjCRH1ir1uStyTOhfbiSVNn4kdMYw0b7lTuDI=;
 b=BjdPAwgurO1+JpA3YcUqpBKcm3or+vdlyCVLy/vcfLUC3ad+rcdmH4EeXZ8rV6JlA79VnctvIZsTx311s3UJENx3twaP4UaPSQiZDmKXmXyzsHgDbLJhjHPp/7fZXDYslbtniStbQBN5Z5ejDaAeOYbCGQgh5reMWzGapfZsURM=
Received: from BN6PR15MB1810.namprd15.prod.outlook.com (10.174.115.23) by
 BN6PR15MB1409.namprd15.prod.outlook.com (10.172.150.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Fri, 13 Sep 2019 12:52:36 +0000
Received: from BN6PR15MB1810.namprd15.prod.outlook.com
 ([fe80::88a2:b916:be78:e602]) by BN6PR15MB1810.namprd15.prod.outlook.com
 ([fe80::88a2:b916:be78:e602%9]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 12:52:36 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Current Minimal Binary Size
Thread-Topic: Current Minimal Binary Size
Thread-Index: AQHVajIeyf+yWFxwZUugNXVdz/Jv4Q==
Date: Fri, 13 Sep 2019 12:52:36 +0000
Message-ID: <B01C7B99-DEFC-4252-A402-38903C016238@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [24.4.169.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fb3da70-5352-4eb9-dfca-08d7384940c8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR15MB1409; 
x-ms-traffictypediagnostic: BN6PR15MB1409:
x-microsoft-antispam-prvs: <BN6PR15MB1409755AC94E5B56C5F45DFBBDB30@BN6PR15MB1409.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(136003)(346002)(366004)(199004)(189003)(6916009)(8936002)(66446008)(91956017)(64756008)(6486002)(53936002)(316002)(66066001)(36756003)(26005)(4744005)(81166006)(3846002)(6512007)(71200400001)(71190400001)(6436002)(1730700003)(81156014)(186003)(6116002)(25786009)(5640700003)(8676002)(5660300002)(33656002)(305945005)(256004)(99286004)(2906002)(2501003)(486006)(3480700005)(478600001)(2351001)(76116006)(6506007)(86362001)(14454004)(66556008)(102836004)(66476007)(66946007)(2616005)(476003)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR15MB1409;
 H:BN6PR15MB1810.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yz0R/ANBW+FBzkBmSvPCIdzAYanc4wCTcjoT9M23NdWZZgmNNbQBKIlWn9nC4rEL/3wf0VIcjHVOE9vlx3UuPSRBdt/mqzAoo0Zyk3AE/HLiLtNPqdM/VG9BRqa/ZnKoV0oIDRtVrmhXDj/eofWdusrqJnb7SM8m5NMZHVFMr4IgF1sRjI/RSq61nbvQ0QVYS+jmrTN3ni2IupAEyJDqCF0JlUcucBBIRL4z5wyJClQLPQsPHN2kZ96pI/4Fwg30z/FAR3LUmlpZZdMSlcmIJ9vsRUFlRMbzix0ew4NMTwjXTccmyJkn2/K+c06qT1iVpoyEG09nk11BcckVlxCAUSc4/exzOSnz9rbgAo84X4YAHPjEL5NnG8dUj1AqRsanGTx/Sz1BM1yhIV2BDAJiLjLicMGz6fZgcI/RaI/InFE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <194224320BAA2D49A5E6F7BC162648D4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb3da70-5352-4eb9-dfca-08d7384940c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 12:52:36.5809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Wj/yLnyHdQPKIOVMOVYitni8/X5mQV1nD3HbLHqEvpYPD0DcLwPZCX0YJBvkIcxOrbBlKJltr+6jI+CihZrKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1409
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_06:2019-09-11,2019-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=608
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909130125
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

VGhlc2UgdmFsdWVzIG1heSBiZSBvZiB1c2UgdG8gc29tZW9uZSBlbHNlLiBJ4oCZdmUgYmVlbiBw
dXR0aW5nIGVuZXJneSBpbnRvIHJlZHVjaW5nIGNvZGUgc2l6ZSBsYXRlbHkuIFRoZSBmb2xsb3dp
bmcgYXJlIGFsbCB3aXRoIC1PcyBlbmFibGVkLg0KDQpTbWFsbGVzdCAuU08gKG9uZSBmdW5jdGlv
biB3aXRoIG5vIHN0YXRlbWVudHMgaW4gdGhlIGJvZHkpIC0gOC4ySw0KU21hbGxlc3QgZXhlY3V0
YWJsZSAobWFpbiB3aXRoIG9ubHkgYSByZXR1cm4gc3RhdGVtZW50KSAtIDEySw0KU21hbGxlc3Qg
ZXhlY3V0YWJsZSB3aXRoIGEgcHJpbnRmIGFuZCByZXR1cm4gLSAxNEsNClNtYWxsZXN0IGV4ZWN1
dGFibGUgd2l0aCBhIHN0ZDo6Y291dCBhbmQgcmV0dXJuIC0gMTAzSw0KDQpGb3IgY29tcGFyaXNv
bjoNCiBTbWFsbGVzdCBleGVjdXRhYmxlIHdpdGggYSBwcmludGYgYW5kIHJldHVybiBvbiB4ODYt
NjQgLSA4LjJLDQogU21hbGxlc3QgZXhlY3V0YWJsZSB3aXRoIGEgc3RkOjpjb3V0IGFuZCByZXR1
cm4gb24geDg2LTY0IC0gNDJLDQoNCg0K
