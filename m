Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD63BF9EC
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 21:16:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPn00VMwzDqsx
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 05:16:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4172407305=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mD6fyTqq"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jQD/mrLv"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fPN354DlzDqQm
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 04:58:38 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8QIt2M6015576;
 Thu, 26 Sep 2019 11:58:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=NOgIPuDrPKiHYd2zHDCjD0IpfgGu8v/mw4s18GxeE3Y=;
 b=mD6fyTqqOBv4Tr0dvGr0bi0yHqhDPdLDoJHtx1HUyz+R41touWsi2vsdnGk/msHHLqpw
 ueZ0S9YFJ22ghrsx9eOPlL45yFUcH2xSKt5zRECgyJKZFfKhh28hy29aMhXgM3+x/jTP
 EMrlQkEvun026d7hpetmR6Np4OIIOTGqIF0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2v89qgejr9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Sep 2019 11:58:30 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Sep 2019 11:58:29 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 26 Sep 2019 11:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6TsQmPAr7xahs+ikILgi62txaZTq3S1FSQjtAPPK/AxiSRw0zQc6S2wQRPcsD5lvKAgmTvtut+Q7W3zB0avzgDuAmMKutHbUocdn1rckKE+xxdaRAmC50yrrQ9jl/Uw+T1EMTVFuk7nYIRlBGxGUVt+WhVUOTs2w7X92msR63os78vFoTIJta0Cf2aY8jC7iszMCDvigFqQRLaAh0TOJiH+h/R7W+SH1JtNM6UIZPo6BRCbrFLZST+zXuY7qrZdi0o9SlJScM/PLpG2d+8lfuLrDkDhwiNsIznRWtV9Lzd0AlKCWpd0HdMhV2ergDFOacw0Rcas2UVV9Sf05thi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOgIPuDrPKiHYd2zHDCjD0IpfgGu8v/mw4s18GxeE3Y=;
 b=QaeS8FUSqQUC6tKQY8bwuUOvXDWUvZNilrKqubrZl5Y04nrwgffKXk2FiEvLIYzbHbZZ/qBa4UB8I824lRTNPuN+F6ocVntLK0zbVsNCer3nCezPvSeGt53l2xDz4HO9cm76yboFORJ7+blrYftWI7KjEzohsimUoCBENgB0eUY0O5J+hoflYx1M+LHA4mnxuJU9IhL76gGuhMUp2YJgytB/dBKHT2S5etqQYiBJxaugW3FY3clXGPH9FvR3dGg3lOUUb7dloVP3XbdDcBpwP2N++Mvdldhh4jOEQPKWFiapCyNeUlP+7FlfqlakIOs4R8GQI7Xus9h/Su/9Bfm0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOgIPuDrPKiHYd2zHDCjD0IpfgGu8v/mw4s18GxeE3Y=;
 b=jQD/mrLvwRSePIegPlKvAdh0RLypS+gCNfZuE6j0tqqJA26opKf3FMKG3Bght2WJAgtaim50ZXerLYshijEJZ6OSSQZOq+v3hoLBn4C1UY2KUN6iqMttI1+L1gKGnzqcH9aznHkOQVQ7+J4WEb4YuItNzHKv8DfkH1CjaVIxDXM=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3665.namprd15.prod.outlook.com (52.133.252.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Thu, 26 Sep 2019 18:58:28 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:58:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
Thread-Topic: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
Thread-Index: AQHVcUL6JK8gh2V3p0OgbbFXYuhIUqc5cz6AgAJbLICAAhJ4AA==
Date: Thu, 26 Sep 2019 18:58:28 +0000
Message-ID: <C042A4DD-546A-477C-B5BE-D36BF49DA073@fb.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
 <FE94089C-4420-4D02-920F-C9BFFDE35F5D@fb.com>
 <6e217a0f-6f60-4b0a-92a5-4e1dfc2332bf@www.fastmail.com>
In-Reply-To: <6e217a0f-6f60-4b0a-92a5-4e1dfc2332bf@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:5785]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97093f11-1b42-4c87-e518-08d742b3844a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR15MB3665; 
x-ms-traffictypediagnostic: BY5PR15MB3665:
x-microsoft-antispam-prvs: <BY5PR15MB366529458D4A5463C14BCCACDD860@BY5PR15MB3665.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(396003)(346002)(39860400002)(189003)(199004)(81166006)(229853002)(81156014)(478600001)(33656002)(86362001)(8676002)(6116002)(8936002)(6436002)(6486002)(14454004)(6512007)(25786009)(6246003)(2906002)(4326008)(76176011)(36756003)(53546011)(102836004)(6506007)(316002)(305945005)(110136005)(186003)(7736002)(46003)(5660300002)(446003)(486006)(99286004)(11346002)(476003)(2616005)(256004)(71200400001)(66446008)(71190400001)(66946007)(91956017)(64756008)(66476007)(66556008)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3665;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XB/inHlugTWTZJgsiCxJwgEpJ/r/lSpNaVShsfcIvoNvGcGrp1buQpFsN+faQea+1z231iYKzDv7VA4kwB5u2yRjfBk+ui8AUTcFkTlGZLbD3TnYllrEc2/V42pV9kdRLeEP8hz3tOeGMhvxZYTLnvgyuRzP8uJggr4INrQeNXJ6DSOQaxOqItxRmZWx8eL1H26+2Q8Ia//O2eBkgveF6GStrbORYS49iHEiiIPxQEo3UDPMsgD2UAVgVb/w8j3BcR4bJLFDMSVLwnS8E3yYugg/FFKCH9Nc1yjh3AI78+4WhVXce5lSXKbuTkEj1UMImII9LHlzmU3hVuGI2O0R0bhoO2ir1YXTPS5Qc8Fub6YxTQ2D5w5QECdPWQUhzEJiE1Eu+cQzmlTsAiojEi3WVZeQYflejNQK6h/fz4zvV3A=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A39AEDD736B1B4AA37DCF56CB92B987@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 97093f11-1b42-4c87-e518-08d742b3844a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:58:28.1374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aA7SjMXBl+pIziYqz/nTWBrJjC7gO2A/gQ69zOvU+zzjJ3+5Qe96IHVU6vuL7CpU8FsGvTdxEzxE4ai7abAs6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3665
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_08:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909260151
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

DQoNCu+7v09uIDkvMjQvMTksIDk6MTkgUE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5p
ZC5hdT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiBUdWUsIDI0IFNlcCAyMDE5LCBhdCAw
ODo1MCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gDQogICAgPiANCiAgICA+IE9uIDkvMjIv
MTksIDU6NDAgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBbmRyZXcgSmVmZmVyeSIgDQogICAg
PiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9u
IGJlaGFsZiBvZiANCiAgICA+IGFuZHJld0Bhai5pZC5hdT4gd3JvdGU6DQogICAgPiANCiAgICA+
ICAgICBDcml0aWNhbGx5LCB0aGUgQVNUMjYwMCByZXF1aXJlcyB1bmdhdGluZyB0aGUgUk1JSSBS
Q0xLIGlmIGUuZy4gTkNTSSBpcw0KICAgID4gICAgIGluIHVzZS4NCiAgICA+ICAgICANCiAgICA+
ICAgICBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KICAg
ID4gICAgIC0tLQ0KICAgID4gICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L2Z0Z21hYzEwMC50eHQgfCA2ICsrKysrKw0KICAgID4gICAgICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspDQogICAgPiAgICAgDQogICAgPiAgICAgZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvZnRnbWFjMTAwLnR4dCANCiAgICA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0DQogICAg
PiAgICAgaW5kZXggMDRjYzAxOTFiN2RkLi5jNDQzYjBiODRiZTUgMTAwNjQ0DQogICAgPiAgICAg
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mdGdtYWMxMDAudHh0
DQogICAgPiAgICAgKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9m
dGdtYWMxMDAudHh0DQogICAgPiAgICAgQEAgLTI0LDYgKzI0LDEyIEBAIE9wdGlvbmFsIHByb3Bl
cnRpZXM6DQogICAgPiAgICAgIC0gbm8taHctY2hlY2tzdW06IFVzZWQgdG8gZGlzYWJsZSBIVyBj
aGVja3N1bSBzdXBwb3J0LiBIZXJlIGZvciANCiAgICA+IGJhY2t3YXJkDQogICAgPiAgICAgICAg
Y29tcGF0aWJpbGl0eSBhcyB0aGUgZHJpdmVyIG5vdyBzaG91bGQgaGF2ZSBjb3JyZWN0IGRlZmF1
bHRzIA0KICAgID4gYmFzZWQgb24NCiAgICA+ICAgICAgICB0aGUgU29DLg0KICAgID4gVGhpcyBp
cyBzdGlsbCB1c2VkIGZvciBJUFY2IGFzIGh3IGNoZWNrc3VtIGZvciBJUFY2IHBhY2tldHMgaXMg
c3RpbGwgDQogICAgPiBicm9rZW4gaW4gYXN0MjUwMA0KICAgIA0KICAgIEknbSBub3QgcmVtb3Zp
bmcgaXQgOikgSSB0aGluayB5b3UndmUgbWFkZSB0aGUgc2FtZSBtaXN0YWtlIHRoYXQgSSd2ZSBt
YWRlDQogICAgaW4gdGhlIHBhc3QgYW5kIGludGVycHJldGVkIHRoZSAnLScgYXMgYSBkaWZmIG1h
cmtlciByYXRoZXIgdGhhbiB0aGUgYnVsbGV0DQogICAgbWFya2VyIGluIHRoZSB0ZXh0Lg0KDQpP
aywgZ290IGl0LiBUaGFua3MgZm9yIHRpcHMuDQogICAgDQogICAgQW5kcmV3DQogICAgDQoNCg==
