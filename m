Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62880BBEED
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 01:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cgM32FkhzDqLk
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 09:21:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=416993214f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="h+cAtMB3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="HV444DLK"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cgLL5GNNzDqLH
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 09:21:09 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8NNK74a007315; Mon, 23 Sep 2019 16:21:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=75WVz6tI+d8ner4sexFEV5GKlGxWygWkuPtmlGq+QYY=;
 b=h+cAtMB3I/XWMc3gVM5g+M+yywmOJskIpyADdfgbGUSPHhtVK+2nrJ5h3X6M2XzGwbcD
 F7UKOc+wi5LkaSONJsCdcHpqD0RjwHsn0NNq9xZny5FNdZEcnwLvH5lrLB4rG4kwTcVs
 v0zDX8quvx0KjkOfNZyh5+0UPjjZr34scbs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v6rmpmfju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 Sep 2019 16:21:02 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Sep 2019 16:21:01 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Sep 2019 16:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEQFPeQ/9qEZQC806jjg26QAUNEjYQXABlu53/rlCkiLGJzuMpL0gp/8IrqdV5AGeErb/OCFZYpMo/9doslpeM1FSOMiugtx6Sp6ePCT9/4UbrKyKGeeNYvP3DEjzaTnH6wGawmhzAU7TzkW6OY9uzEhgNv0MGpZtExbtYSjqqkWBlX5xoFWPZNcUhXgU0jmKqSaMbeqTBY019j4uOkKLAgDiBxx2Z6rGxOdNDeZ7tmxGNYxDNZiSkRm/pzRqeeVbw6MBEnATmmDvcq9Mqv+4PD1UZvshbQUOzPKtfPB/o9vPkEgiG3GaMFKwvxzZIvDvXx1IO7R5xdZ8hbRE7VIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75WVz6tI+d8ner4sexFEV5GKlGxWygWkuPtmlGq+QYY=;
 b=MDxRouwzb2U0Ii/RZo5eo5ZK4TPx4KpA8PNt8C9Jh03lMgyhRBKjv3MEo5Gka5YW4yFBw5WOCoH8KBgYRgjQZp7XyfBcfOQbVhvn3VgfuWSGM6lCManDER+8rZGbQlAlR/IRR4Qc0y6BgX0Is7f4bZusM41mMBF2utmFf9fOi+ESVrzJh3R8LsmkZiGF+7MtrXmbt/uC06N+2/UQS8xvV3T2eHBjZL5n2WIbLBMU8VgcgMZIjWXMjtpYDCN1fF7YZQEg8kVuopnYa7mJUPAB+DkFWTMSHN0FIxanX5Oi2iJHG3wmu4w85OiyfrMKaly4voblA28VHjJE2KacrsUzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75WVz6tI+d8ner4sexFEV5GKlGxWygWkuPtmlGq+QYY=;
 b=HV444DLKIe13YCJzO2NQpcvCmMPMFPHUJNHvMZsYCcQ9k483ELtQhVp7keOjauUcX+JrRzYTFFbWH8YiJUYMadf+FqBARXNnFMZfPdI8XI5tqInTuzrre7dVtCVazgBOfDad1TOY9B1BuXMCoFn9uhB5By8mbqxxPPUB0zpRJSU=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3699.namprd15.prod.outlook.com (10.255.245.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 23:21:00 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 23:21:00 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
Thread-Topic: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
Thread-Index: AQHVcUL6JK8gh2V3p0OgbbFXYuhIUqc5cz6A
Date: Mon, 23 Sep 2019 23:20:59 +0000
Message-ID: <FE94089C-4420-4D02-920F-C9BFFDE35F5D@fb.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-3-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3750]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dd20b44-42a0-42d5-dea1-08d7407cb1e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3699; 
x-ms-traffictypediagnostic: BY5PR15MB3699:
x-microsoft-antispam-prvs: <BY5PR15MB36999C7F97795E47F09D6C4FDD850@BY5PR15MB3699.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(14454004)(2501003)(6506007)(229853002)(66946007)(186003)(8936002)(66476007)(76176011)(2906002)(76116006)(91956017)(86362001)(8676002)(66446008)(66556008)(25786009)(6116002)(4326008)(5660300002)(256004)(99286004)(6486002)(64756008)(36756003)(446003)(6246003)(305945005)(110136005)(71190400001)(33656002)(46003)(81156014)(6436002)(81166006)(478600001)(11346002)(6512007)(476003)(2616005)(71200400001)(102836004)(7736002)(486006)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3699;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QWZczVrYae86MAKjitGMuQHD79zBaJoUAUqtiAMVtxh4T5JX68tfjP3twy9DRQu5HDbDQwv7mnGHPFX8emFX34xF278ATKrCH69w0os0fL3yc/dC74DBYSmhkyV0LPwfjRR3YjY96nMcBBCBmxvzNsl8eCViPYFeHeKmMZE7tjR1fp7zj8AixsDCiMnSTT0dRG6gS7KGPSMqHbmPJ5J/2HRH27z1B8PM0FeQQOsneEkZGGLN8xKO666axaEOxolevZE7OGuew9prKxEBEY9W0NcNpxup3HGWQJ8hEtacAfv5+cYqOPGhy7nJfsxi81JNgR/fSJoGBH+1ub95oFhewsvMDXVt2tLWupHzK1kXIiywYBIcu/8KpNU6nhMycZ8r/PFJPRnDCxcc0pXaqxRoXW2YMLd8EeC498/W4T3Ozdo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C191DFD9140DCC4692ABE5C1BFC84DDA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd20b44-42a0-42d5-dea1-08d7407cb1e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 23:20:59.9561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GpdFfRvVLBFH4Z6HkAt4/4NAYa/7lH3Jno8y4v2/A6BZ1s2YhyzIfPIuHuzn477jN/JhSuQpTx6S1usmZLEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3699
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-23_08:2019-09-23,2019-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909230199
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

DQoNCu+7v09uIDkvMjIvMTksIDU6NDAgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBbmRyZXcg
SmVmZmVyeSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgYW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCg0KICAgIENyaXRpY2Fs
bHksIHRoZSBBU1QyNjAwIHJlcXVpcmVzIHVuZ2F0aW5nIHRoZSBSTUlJIFJDTEsgaWYgZS5nLiBO
Q1NJIGlzDQogICAgaW4gdXNlLg0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQogICAgLS0tDQogICAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvZnRnbWFjMTAwLnR4dCB8IDYgKysrKysrDQogICAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCiAgICANCiAgICBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0DQogICAgaW5kZXggMDRjYzAx
OTFiN2RkLi5jNDQzYjBiODRiZTUgMTAwNjQ0DQogICAgLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0DQogICAgKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0DQogICAgQEAgLTI0LDYgKzI0
LDEyIEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQogICAgIC0gbm8taHctY2hlY2tzdW06IFVzZWQg
dG8gZGlzYWJsZSBIVyBjaGVja3N1bSBzdXBwb3J0LiBIZXJlIGZvciBiYWNrd2FyZA0KICAgICAg
IGNvbXBhdGliaWxpdHkgYXMgdGhlIGRyaXZlciBub3cgc2hvdWxkIGhhdmUgY29ycmVjdCBkZWZh
dWx0cyBiYXNlZCBvbg0KICAgICAgIHRoZSBTb0MuDQpUaGlzIGlzIHN0aWxsIHVzZWQgZm9yIElQ
VjYgYXMgaHcgY2hlY2tzdW0gZm9yIElQVjYgcGFja2V0cyBpcyBzdGlsbCBicm9rZW4gaW4gYXN0
MjUwMA0KDQogICAgKy0gY2xvY2tzOiBJbiBhY2NvcmRhbmNlIHdpdGggdGhlIGdlbmVyaWMgY2xv
Y2sgYmluZGluZ3MuIE11c3QgZGVzY3JpYmUgdGhlIE1BQw0KICAgICsgIElQIGNsb2NrLCBhbmQg
b3B0aW9uYWxseSBhbiBSTUlJIFJDTEsgZ2F0ZSBmb3IgdGhlIEFTVDI2MDAuDQogICAgKy0gY2xv
Y2stbmFtZXM6DQogICAgKw0KICAgICsgICAgICAtICJNQUNDTEsiOiBUaGUgTUFDIElQIGNsb2Nr
DQogICAgKyAgICAgIC0gIlJDTEsiOiBDbG9jayBnYXRlIGZvciB0aGUgUk1JSSBSQ0xLDQogICAg
IA0KICAgICBFeGFtcGxlOg0KICAgICANCiAgICAtLSANCiAgICAyLjIwLjENCiAgICANCiAgICAN
Cg0K
