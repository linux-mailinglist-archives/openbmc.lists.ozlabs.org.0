Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1522510F6A
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 00:54:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYcr2vTBzDqPy
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 08:54:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00246b06a9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="RLpc2dQt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="a9qMkFEM"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYbv0JRBzDqNR
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 08:54:02 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x41MqtZs028622; Wed, 1 May 2019 15:53:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=uKXDCvXmRBys0Yz/Y8d22kI3tCaObuCKbRLIpepcit8=;
 b=RLpc2dQtqMYR3d/PRTK+RWnxueCOkq6ewuFHve7ODaC6wCHvDMMXpQ512OWVyXUacrYR
 ZuJhbpGO48+rzZiRFbv0TEnM0r6rDBMNftn4q3UZxOwPdvjuFwEYi1d3II53XNhY3V19
 BymZeLEnuDhXkbXSc4Imfkv2YrNKusW7+Mo= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s7gx9gqed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 01 May 2019 15:53:54 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 1 May 2019 15:53:53 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 1 May 2019 15:53:53 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 1 May 2019 15:53:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKXDCvXmRBys0Yz/Y8d22kI3tCaObuCKbRLIpepcit8=;
 b=a9qMkFEM3j6IPmeC47gq7hklL61Ne77HtichIBXWpJ9m6cLcqWESUhBsiSELK0fEIJ0OCJCRwxt8dfqKzEeMr2qwIaqIXcgj1Gkh+i9WpB3ByqSS/P6DG8llISiFXQZ19KyE6ujaqzOTPz+ZKawJ9ymwHZNdAk7oih0QI95FvKM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1143.namprd15.prod.outlook.com (10.172.177.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 22:53:51 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Wed, 1 May 2019
 22:53:51 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>, James Feist
 <james.feist@linux.intel.com>
Subject: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgA==
Date: Wed, 1 May 2019 22:53:51 +0000
Message-ID: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:4686]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c146438-61c4-41e3-e780-08d6ce87e141
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1143; 
x-ms-traffictypediagnostic: CY4PR15MB1143:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB1143668120910B98AB2454EFDD3B0@CY4PR15MB1143.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(7116003)(256004)(33656002)(6116002)(476003)(486006)(6436002)(68736007)(6486002)(2616005)(4326008)(102836004)(186003)(25786009)(6506007)(46003)(71200400001)(71190400001)(83716004)(3480700005)(4744005)(5660300002)(64756008)(66556008)(91956017)(7736002)(66446008)(66476007)(8936002)(81166006)(81156014)(8676002)(110136005)(14454004)(316002)(478600001)(36756003)(6512007)(54896002)(6306002)(2906002)(53936002)(76116006)(73956011)(66946007)(82746002)(86362001)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1143;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fXtRHgZbNFY8N3T7PCvsBQgrYN4k7+YCrFWDRXPjGeHW2j/kc9h4Qj4oD40w6ixaYfTluPVyQp/X+yOSiGvnDICfiqmcvEWu5NIGby5Xy1J7wsEjSddngd+0PTpBuMpWP2EqytQ6QVmc5lnmaPsQJWB8NQmEhqzQqS+kc9oVsGMZjHUNyO2BXr6lTdDJ46DhHwZklvH0As9eDfU5dBKKOo3xXkDAPGcospkDHHGbTTKb/2zWuRVsMr6PCmqpphMyaXFvS3vUvPcqII0AjVugdID0nA3kXmmnv5s56pngyzWcqvUcYob05g2/eHVn/5exwGLkmgLYtcV62z4Kx4hqhYMLRzK4OQbdSkGo2glMoV9qR0qMvfEkl2G6CQvdvr2jkGPqhxcqqJnzzhAoVo45i22StsuyNPDWfL2+q4b0p1Q=
Content-Type: multipart/alternative;
 boundary="_000_96A52DC27B184F69B8E83B489BDA84C6fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c146438-61c4-41e3-e780-08d6ce87e141
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 22:53:51.3542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1143
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_96A52DC27B184F69B8E83B489BDA84C6fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUGF0cmljay9KYW1lcywNCkkgYW0gbm90IHVuZGVyc3RhbmRpbmcgaG93IHRvIGdldCB0aGVz
ZSBmb2xsb3dpbmcgZGF0YSBmb3IgY29uZmlndXJhdGlvbiBmaWxlIGZvciBwaWQuIEkgb25seSBo
YWQgcChwcm9wb3J0aW9uYWwpLCBpKGludGVncmFsKSBhbmQgZChkaWZmZXJlbnRpYWwpIHZhbHVl
cyBmcm9tIG15IHRoZXJtYWwgdGVhbS4gQnV0IHVuYWJsZSB0byBtYW9wIHRoZXNlIHRvIHJlcXVp
cmVkIHBhcmFtZXRlci4NCg0KDQogICAgInJlcXVpcmVkIjogWw0KDQogICAgICAgICJDbGFzcyIs
DQoNCiAgICAgICAgIkZGR2FpbkNvZWZmaWNpZW50IiwNCg0KICAgICAgICAiRkZPZmZDb2VmZmlj
aWVudCIsDQoNCiAgICAgICAgIklDb2VmZmljaWVudCIsDQoNCiAgICAgICAgIklMaW1pdE1heCIs
DQoNCiAgICAgICAgIklMaW1pdE1pbiIsDQoNCiAgICAgICAgIklucHV0cyIsDQoNCiAgICAgICAg
Ik5hbWUiLA0KDQogICAgICAgICJPdXRMaW1pdE1heCIsDQoNCiAgICAgICAgIk91dExpbWl0TWlu
IiwNCg0KICAgICAgICAiUENvZWZmaWNpZW50IiwNCg0KICAgICAgICAiU2xld05lZyIsDQoNCiAg
ICAgICAgIlNsZXdQb3MiLA0KDQogICAgICAgICJUeXBlIiwNCg0KICAgICAgICAiWm9uZXMiDQoN
CiAgICBdDQoNCg0KQWxzbyB3ZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2Ygc3RlcHdpc2UgYW5kIHBp
ZCB0b2dldGhlciBmb3Igc29tZSBzZW5zb3JzLCBpcyBpdCBwb3NzaWJsZSB0byBjb25maWd1cmUg
c2FtZSBzZW5zb3IgZm9yIGJvdGggdHlwZXMuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_96A52DC27B184F69B8E83B489BDA84C6fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <08094E59FEF53D46B279B418457FF1CF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNv
bXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93
dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAxDQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1hcmdp
bjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZTo4LjVwdDsNCglmb250
LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpzcGFuLnMxDQoJe21zby1zdHlsZS1uYW1l
OnMxO30NCnNwYW4uYXBwbGUtY29udmVydGVkLXNwYWNlDQoJe21zby1zdHlsZS1uYW1lOmFwcGxl
LWNvbnZlcnRlZC1zcGFjZTt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBv
cnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3Jk
U2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGlu
IDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9z
dHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0i
Izk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIFBhdHJpY2svSmFtZXMsPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPkkgYW0gbm90IHVuZGVyc3RhbmRpbmcgaG93IHRvIGdldCB0aGVzZSBmb2xs
b3dpbmcgZGF0YSBmb3IgY29uZmlndXJhdGlvbiBmaWxlIGZvciBwaWQuIEkgb25seSBoYWQgcChw
cm9wb3J0aW9uYWwpLCBpKGludGVncmFsKSBhbmQgZChkaWZmZXJlbnRpYWwpIHZhbHVlcyBmcm9t
IG15IHRoZXJtYWwgdGVhbS4gQnV0IHVuYWJsZSB0byBtYW9wIHRoZXNlIHRvIHJlcXVpcmVkDQog
cGFyYW1ldGVyLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNw
OyAmbmJzcDsgPC9zcGFuPjxzcGFuIGNsYXNzPSJzMSI+JnF1b3Q7cmVxdWlyZWQmcXVvdDs6IFs8
L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1j
b252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4g
Y2xhc3M9InMxIj4mcXVvdDtDbGFzcyZxdW90Oyw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0icDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4mcXVvdDtGRkdhaW5Db2Vm
ZmljaWVudCZxdW90Oyw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFu
IGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4mcXVvdDtGRk9mZkNvZWZmaWNpZW50JnF1b3Q7LDwv
c3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9ImFwcGxlLWNv
bnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBj
bGFzcz0iczEiPiZxdW90O0lDb2VmZmljaWVudCZxdW90Oyw8L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4mcXVvdDtJTGlt
aXRNYXgmcXVvdDssPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAxIj48c3BhbiBj
bGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
PC9zcGFuPjxzcGFuIGNsYXNzPSJzMSI+JnF1b3Q7SUxpbWl0TWluJnF1b3Q7LDwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1z
cGFjZSI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEi
PiZxdW90O0lucHV0cyZxdW90Oyw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDEi
PjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4mcXVvdDtOYW1lJnF1b3Q7LDwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRl
ZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0i
czEiPiZxdW90O091dExpbWl0TWF4JnF1b3Q7LDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJwMSI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPiZxdW90O091dExpbWl0TWlu
JnF1b3Q7LDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9
ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvc3Bh
bj48c3BhbiBjbGFzcz0iczEiPiZxdW90O1BDb2VmZmljaWVudCZxdW90Oyw8L3NwYW4+PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3Bh
Y2UiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4m
cXVvdDtTbGV3TmVnJnF1b3Q7LDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+
PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPiZxdW90O1NsZXdQb3MmcXVvdDssPC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAxIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVy
dGVkLXNwYWNlIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgPC9zcGFuPjxzcGFuIGNsYXNz
PSJzMSI+JnF1b3Q7VHlwZSZxdW90Oyw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
cDEiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj4mcXVvdDtab25lcyZxdW90Ozwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZl
cnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5dPC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+QWxzbyB3ZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2Ygc3RlcHdpc2UgYW5kIHBpZCB0b2dl
dGhlciBmb3Igc29tZSBzZW5zb3JzLCBpcyBpdCBwb3NzaWJsZSB0byBjb25maWd1cmUgc2FtZSBz
ZW5zb3IgZm9yIGJvdGggdHlwZXMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheSA8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_96A52DC27B184F69B8E83B489BDA84C6fbcom_--
