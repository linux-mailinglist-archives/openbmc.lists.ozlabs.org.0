Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 258226B0B8
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 23:02:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pCXF62fZzDqg4
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 07:02:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linkedin.com
 (client-ip=108.174.3.121; helo=mail321.linkedin.com;
 envelope-from=pmao@linkedin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=linkedin.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linkedin.com header.i=@linkedin.com header.b="B1qFfg+B";
 dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.onmicrosoft.com
 header.i=@microsoft.onmicrosoft.com header.b="Bbv7eYpS"; 
 dkim-atps=neutral
Received: from mail321.linkedin.com (mail321.linkedin.com [108.174.3.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pCWX4l9jzDqcn
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 07:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linkedin.com;
 s=d2048-201806-01; t=1563310917;
 bh=Pzzeko0RcdFhM52UIYJ+MGIMou9On36bkTcXvzr9/24=;
 h=From:To:Subject:Date:Content-Type:MIME-Version;
 b=B1qFfg+BblZh9xGYeTQGfz4bzGnnCSAMYk1QRHLC3hQ1YyyudTg4j0bM2IOJ+K0tu
 0PC0++Rgi6qaV2lElM+NL/zmwlfMiJI63S8VC1myJLidVNzSrqpyD+zrI6PPtvvBi8
 kCbP+KtjZKsMD8KIIr9o72Tuz2muqEr4Rjaf7GOLd23IJOCZasu9ikTVfjveia3+Vk
 d0KgFukcjj5ecYsSAeKuLwcOdvHH+BI4hAnsNuZi4HClDjbBq41MPktjWi7UrceNhk
 cdktyypsK5jt/7u7sDwIJI7vQkVrGe/4BQ62v9taLQ/0TeMto+IcIgZtjo9YCR85UH
 I127kIJxZFw8w==
Authentication-Results: mail321.prod.linkedin.com
 x-tls.subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com";
 auth=pass (cipher=AES256-GCM-SHA384)
Authentication-Results: mail321.prod.linkedin.com;
 iprev=pass policy.iprev="104.47.38.54";
 spf=softfail smtp.mailfrom="pmao@linkedin.com"
 smtp.helo="nam02-bl2-obe.outbound.protection.outlook.com";
 dkim=pass header.d=microsoft.onmicrosoft.com;
 tls=pass (verified) key.ciphersuite="TLS_RSA_WITH_AES_256_GCM_SHA384"
 key.length="256" tls.v="tlsv1.2"
 cert.client="C=US,ST=Washington,L=Redmond,O=Microsoft
 Corporation,CN=mail.protection.outlook.com"
 cert.clientissuer="C=BE,O=GlobalSign nv-sa,CN=GlobalSign Organization
 Validation CA - SHA256 - G3"
Received: from [104.47.38.54] ([104.47.38.54:22916]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by mail321.prod.linkedin.com (envelope-from <pmao@linkedin.com>)
 (ecelerity 3.6.21.53563 r(Core:3.6.21.0)) with ESMTPS
 (cipher=AES256-GCM-SHA384
 subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com") 
 id 63/3A-32691-54B3E2D5; Tue, 16 Jul 2019 21:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqM2z26rY/gASmrEZ8MjP9bGMNd8+MZxIIHX7jw4ges7NrfPq2fvJnRqf6txGbAceU65X5i0lFAjyuHaEuGLxWYznrXy4NOPMsi0wGQVwifXu9zM21skG5HrQHMO+O8UnWb7H5VXKLnf7mLlTIWnWGCaioYvArOXdw1x1X3h3x6I7GxqYFtXHHo8pSYB87XYMj7gHE6/WeILT/Sc2PAoNKhHEjYBsuezBRIcFWNdYEDlcaKsz77QkID/6OzzmWRV6UaNMl/bLRtnYbOd3UnayCijfvqA3bNdk/mXnfxRK4DkXoJMdv4SR0SxtiHQv55cyYGzAQUlZtn9hyv3/HJBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzzeko0RcdFhM52UIYJ+MGIMou9On36bkTcXvzr9/24=;
 b=TNK0ng1V7mtqSUJqacFDzm7JYUgyFWa7j/skq8HO+zfqQfU83IA6G8RpgFvm2dF9tmd7KGcNleWGsOAyPVn2UMCbMzOeqTiqaEeJUoawJZdFv+NRYWbcrg1X4qA+ar9RtfwC7jWHwVF1c2lqczbg37speCNWiyht4C0z+53+V4b40LfQG6cuxqXEm96HZFaBtnL0MBUgwbuAESKlJHt07wY6W/aAmzVIIdqJImt95aIWERaSgFz0EQfiebAoxE0Ez7XHL5oiFMfkTuziu05ldsHQYBkIyNmkUvSYctK8UTy5XxLRc4U9fwfKXQdHz+qKdV6/vxLgWFMqdUGptpIKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=linkedin.com;dmarc=pass action=none
 header.from=linkedin.com;dkim=pass header.d=linkedin.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.onmicrosoft.com; s=selector1-microsoft-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzzeko0RcdFhM52UIYJ+MGIMou9On36bkTcXvzr9/24=;
 b=Bbv7eYpS5rthkFHrShOGpJ//EzHP75jQIahVk/gzInafN030BkOLxeECiytIESG3PdN0hPrTjWTnWwHNsSvWC7Uuy25iZ4m8dS0Vd6ZPajm7rViRZY3m+HLniyPWyzb/2QwJOqoAGgW6rlNZHQ8hMBZ59YwgxdMlpovabuMpjvY=
Received: from MWHPR21MB0831.namprd21.prod.outlook.com (10.173.51.9) by
 MWHPR21MB0862.namprd21.prod.outlook.com (10.173.51.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.0; Tue, 16 Jul 2019 21:01:56 +0000
Received: from MWHPR21MB0831.namprd21.prod.outlook.com
 ([fe80::b172:85df:32d0:8364]) by MWHPR21MB0831.namprd21.prod.outlook.com
 ([fe80::b172:85df:32d0:8364%4]) with mapi id 15.20.2115.002; Tue, 16 Jul 2019
 21:01:56 +0000
From: Ping Mao <pmao@linkedin.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: BMC websocket
Thread-Topic: BMC websocket
Thread-Index: AQHVPAUn+oldHT3Sf0ySH/PjRZ5vYKbNqpsA//+baAA=
Date: Tue, 16 Jul 2019 21:01:56 +0000
Message-ID: <CF86FE31-BA37-4CE1-B039-5AADEB8A3E4C@linkedin.biz>
References: <82B71204-7C02-4A78-93A7-6AF55AF6C5A9@linkedin.biz>
 <e054b880-000f-2104-32de-a1377d475da2@linux.vnet.ibm.com>
In-Reply-To: <e054b880-000f-2104-32de-a1377d475da2@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f093e2d0-54fa-4166-a7e4-00006479e359;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-16T21:00:50-0800;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pmao@linkedin.com; 
x-originating-ip: [2620:119:5003:20c:591b:366c:86d1:6d7d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdb708a4-3c59-4809-63b5-08d70a30d663
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR21MB0862; 
x-ms-traffictypediagnostic: MWHPR21MB0862:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR21MB0862ECBE352FE900E3D40A1AA0CE0@MWHPR21MB0862.namprd21.prod.outlook.com>
x-o365ent-eop-header: Message Processed By - CBR_LInkedIn_Mail_To_External
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(189003)(199004)(47662002)(71200400001)(71190400001)(3480700005)(8936002)(256004)(25786009)(64756008)(36756003)(66946007)(486006)(316002)(6306002)(6512007)(66446008)(9686003)(478600001)(66556008)(66476007)(81156014)(6116002)(10090500001)(86362001)(81166006)(229853002)(99286004)(221733001)(966005)(6436002)(33656002)(5660300002)(7116003)(14454004)(476003)(305945005)(68736007)(53936002)(53546011)(46003)(6506007)(7736002)(8676002)(91956017)(110136005)(4744005)(76116006)(446003)(186003)(76176011)(11346002)(2906002)(102836004)(6246003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0862;
 H:MWHPR21MB0831.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: linkedin.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ibUxYbna6tHbD1oM3JE29H6lOutevoAM/EVF6Nlo6DsorE7s69Pqv+otsQVxMGibENyyXbBsByZ3qgaV7b+EYkARRkLp0YWB8apOPMpFiH36wRXfZlbEFlQNjuJx6SEkETICwrJUce1ObZzYXiBhnn8+L5bHpWySCQ34ZtUcIPAoGPSv+JC2K7oj54IIM2pLeRIFYBfbUDF6kL62VSDpka1p6A8b6EIXM8TROHNEel/j18KXkdNQEn7tyMfPG93PgKP5txi+v88elmQ9EatFlig1wYTXHM//wJdT/HhGlpJuOArQpZMGsTqmDlC0CTTuzWDL/J9pKwYKhTEDnwZmDzhyIg7pOaUi/tzRYwzw9i5tGBxWd6UfawZZCrb+/Z4YB93L8K/g7I/YTJMWdQP2L9rCT276+mNd8oRI2jQRRYQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6973CCDF1153464A90A3187A1EE4CEAB@namprd21.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: linkedin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb708a4-3c59-4809-63b5-08d70a30d663
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 21:01:56.6470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmao@linkedin.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0862
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

SSBkaWQsICB0cmllZCBpbiBpbmRleC5odG1sIHdpdGg6DQoNCnZhciB3cyA9IG5ldyBXZWJTb2Nr
ZXQoIndzczovLzxCTUMgSVA+L3N1YnNjcmliZSIpDQoNCk5vdCBiZSBhYmxlIHRvIGNvbm5lY3Qg
dG8gd2Vic29ja2V0LiAgIERpZCBJIG1pc3Mgc29tZXRoaW5nPw0KDQpUaGFua3MsDQpQaW5nDQoN
Cu+7v09uIDcvMTYvMTksIDE6MDIgUE0sICJHdW5uYXIgTWlsbHMiIDxnbWlsbHNAbGludXgudm5l
dC5pYm0uY29tPiB3cm90ZToNCg0KICAgIA0KICAgIE9uIDcvMTYvMjAxOSAxOjM0IFBNLCBQaW5n
IE1hbyB3cm90ZToNCiAgICA+IENvdWxkIHNvbWVvbmUgc2hhcmUgaG93IHRvIHN1YnNjcmliZSB0
byBCTUMgd2Vic29ja2V0IGZvciBldmVudHM/ICAgIFRoYW5rcy4NCiAgICANCiAgICANCiAgICBI
YXZlIHlvdSBzZWVuIA0KICAgIGh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGZG9jcyUy
RmJsb2IlMkY3MjczMDA3ZDViZjY3N2Q5YTE3NjI0ZDIwODA5NTkyOTA4MmFkYzMxJTJGcmVzdC1h
cGkubWQlMjNldmVudC1zdWJzY3JpcHRpb24tcHJvdG9jb2wmYW1wO2RhdGE9MDIlN0MwMSU3Q3Bt
YW8lNDBsaW5rZWRpbi5jb20lN0MxNmUyNDNjMzEzMjg0ODQzYmMwNzA4ZDcwYTI4ODE3NyU3Qzcy
Zjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2MzY5ODkwNDEzOTc1MjA2
ODUmYW1wO3NkYXRhPUpWJTJCY3BQVUtuZDV1OU5tY1pWMFp6c3BXbU44JTJGenhuZ1ZWdlBzbWVU
RnlJJTNEJmFtcDtyZXNlcnZlZD0wIA0KICAgID8NCiAgICANCiAgICANCg0K
