Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDE105081
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 11:30:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JbRB6vgxzDqx1
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 21:29:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=bright_cheng@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="mOkTO2vq"; 
 dkim-atps=neutral
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 47JbQP27t4zDqqK;
 Thu, 21 Nov 2019 21:29:15 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdb9ba27094c0a81672162c@TWNHUMSW4.wistron.com>; Thu, 21 Nov 2019 
 18:29:11 +0800
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Thu, 21 Nov 2019 18:29:08 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.71) by 
 mail.wistron.com (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Thu, 21 Nov 2019 18:29:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=Ah/33f7BtVSaPDlix3lzmpIPGHriqJV3CLv224nsKkesEVFWThyyXEUbTgVhJ3DgN8SogJrV9AX7a6rRiiDoya9TWo8OabWKL2xSMdlW4cBd2L8YrPHe//Wceqp6hV0UgDSPo6xaZLZpjN5sVj/Ry7fS6x17fWbGcKHA7x2mzHyU0R8GZCjShWmvSyNPgv25R74yuov4YbtOWUfMfo2VAr4cdEF3Q/0Kt5Yr8lISjS4QhIF02iUo45zHeJthFBMDmqVm8suuvUm2CHEa+Y6KAZYNJldCFV5w2zmm374UsKa3QHi6Y3qYP5hOMd6Ko/XBdgMTkC8XXaIlZjY97zlKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA0vKvBLlri6ttO3lyg8wyF3oNgCeTmH72Xcftnus20=; 
 b=XOATqrVuFSb4VR7XBm47Dwr6s/yYDjBBjoBm6oVBSXDpyLQNDzq+DPYS0FlcE3ueiIANZLkSDhnH5owKdozRwsgJMqTEqV9xHQsrBeC/aQ6HLBeTj8j4h7/azdEkTUmqYHDmwoUAL/HBo0gQRU8dJ4jt3c0/JzvNrZAMY1XE1YPMuQsM2SlmymO/Gk1RxP+Kz9dsWYHVRdUQq5A+khkx6PTxCJRn3Wb+UulGk0QuAomNG0Yb41RTkm+3O2foObL9wYwGd2VjkwLgEheDntmR4CIfvXsxODY/5mMBIlcPbcCx+kr3kCueDUg2XbIOViKgVycdYXnS3MWZ0N9uWlmYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA0vKvBLlri6ttO3lyg8wyF3oNgCeTmH72Xcftnus20=; 
 b=mOkTO2vqmTA5rb6cQ9LPKASFcUnV8C9bZ49tcbcgPIRb936X/jSOTP02ohIgWYHwvG0UFRB7s/xUdvT3sRPphU9HLUDrlgHOP+cLG10ER4VwnW2ws8EmRjddRydf0mP8zRBUeiCYKM3MGyTmQCaH0xAdykgL/9owXgbb5XGX84k=
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com (20.177.68.82) by 
 HK0PR02MB2497.apcprd02.prod.outlook.com (52.133.208.22) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2474.19; Thu, 21 Nov 2019 10:29:05 +0000
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::9193:1f5:b919:4de3]) by 
 HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::9193:1f5:b919:4de3%5]) with mapi id 15.20.2474.018; Thu, 21 
 Nov 2019 10:29:05 +0000
From: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
To: Adriana Kobylak <anoo@linux.ibm.com>, Lei YU <mine260309@gmail.com>
Subject: RE: phosphor-bmc-code-memt: Support redfish remote firmware update
 with static layout image
Thread-Topic: phosphor-bmc-code-memt: Support redfish remote firmware update 
 with static layout image
Thread-Index: AdWbW9KkyR3t7kg+SUGh/ZISxSBNlgAA8GuAABuL+gABIZI1UA==
Date: Thu, 21 Nov 2019 10:29:04 +0000
Message-ID: <HK0PR02MB33485DDBFBED11F8ED70C4D99F4E0@HK0PR02MB3348.apcprd02.prod.outlook.com>
References: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
 <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com> 
 <0f356ff58ad9ec48b19e86f9da5eb7cc@linux.vnet.ibm.com>
In-Reply-To: <0f356ff58ad9ec48b19e86f9da5eb7cc@linux.vnet.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Bright_Cheng@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0d62c41-749e-4ade-a4d9-08d76e6da25d
x-ms-traffictypediagnostic: HK0PR02MB2497:|HK0PR02MB2497:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB2497FA4C03393927847B87119F4E0@HK0PR02MB2497.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(13464003)(189003)(199004)(86362001)(186003)(6506007)(26005)(446003)(102836004)(11346002)(80792005)(14454004)(45080400002)(5660300002)(7736002)(966005)(478600001)(52536014)(14444005)(7696005)(76116006)(305945005)(66946007)(74316002)(5024004)(76176011)(66476007)(25786009)(66446008)(64756008)(66556008)(81166006)(81156014)(3846002)(8936002)(15650500001)(6116002)(33656002)(99286004)(256004)(316002)(8676002)(54906003)(110136005)(6246003)(6306002)(55016002)(9686003)(4326008)(66066001)(6436002)(71200400001)(229853002)(71190400001)(2906002);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB2497;
 H:HK0PR02MB3348.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DoN9HIigsCfuHCcg9cxAZDPcrV99kOOT60RAcINKCqfrheyIUZBaGz3PIIA0d8NbnjAiEt5RnCkw9CP9P+W+1WQa9t0uGfsuop4mtT9dSEyApmVaJIKKIL/NSHm1tN8e9KJyJtyBYCjGx5iTbgyzTgbu8CM24TJHJpghmu+9H3qdikNXFU2s2FZ9P/hB5AFWIMs8bPc2NdJfR1t9KhUkY5dMTjcP92O2ELAjqY54wx/CLmNc7RQba7XmnFzan09v1nkTs+XedR877bMvD2rspVDRG6mWm4gNQF+z/GEQuRbYP66IQNvWKV3fmcxfLpU1dE9dEacm9pT0pLq2CMT7znL4UgfGP5DW+Rjt43FWAu3ws+yZ1MI2QydbMLE4a1DE1Sr++v4ps5n3R1+VFxJGvsdp4CQHgS+0YqXUTXyQDLSmZ0SeMpCJIEm9NY5hDQhNd3frE/bD8RqrznWN9EkgWCn2VMqH7R51DI56LXCniH8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d62c41-749e-4ade-a4d9-08d76e6da25d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 10:29:04.8502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3bKhXUi948K1K2j4OSteZIgsnDjMz59TCZ7Ipcww8XcbnuGqlvzPP0iuvq2H0JmKGREGEleedzQqO18tTOOsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2497
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: F0A9088F5E183065CD5FAC9A34F77D28FEA32A539062E6BD2257D5D5BF2E446B2000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RGVhciBBZHJpYW5hIGFuZCBMZWkgWXUsDQoNCldlIGhhdmUgc29tZSBxdWVzdGlvbnMgYWJvdXQg
c3VibWl0dGluZyBjb2RlIHRvIGdlcnJpdCwgDQoxLiBXZSBhZGQgcmVtb3RlIHRvIGdlcnJpdCBz
ZXJ2ZXIgdXNpbmcgImh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovb3BlbmJtYy9w
aG9zcGhvci1ibWMtY29kZS1tZ210IiBhbmQgdHJ5IHRvIHB1c2ggdGhlIGNvbW1pdCB0byBnZXJy
aXQgc2VydmVyLg0KVGhlIHJlc3VsdCBzaG93cyB0aGF0IHdlIG5lZWQgdG8gcmVnaXN0ZXIgYW4g
ZW1haWwgYWRkcmVzcywgYnV0IHdlIGNhbm5vdCB2ZXJpZnkgbXkgZW1haWwgYWRkcmVzcyBhbmQg
cmVjZWl2ZSBhbiBlcnJvciA0MjIgKFVucHJvY2Vzc2FibGUgRW50aXR5KTogaW52YWxpZCB0b2tl
bi4NCg0KMi4gV2UgYWxzbyB0cnkgdG8gYWRkIHJlbW90ZSB0byBnZXJyaXQgc2VydmVyIHVzaW5n
ICJzc2g6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9vcGVuYm1jL3Bob3NwaG9yLWJtYy1j
b2RlLW1nbXQiLCBidXQgc3NoIGNvbm5lY3Rpb24gY2Fubm90IGJlIGVzdGFibGlzaGVkIGJlY2F1
c2UgdGltZW91dC4NCg0KQ291bGQgeW91IGhlbHAgdXMgdG8gc29sdmUgdGhpcyBwcm9ibGVtPyBU
aGFua3MhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBwaG9zcGhvci1ibWMtY29k
ZS1tZW10IGRvZXNu4oCZdCBzdXBwb3J0IHN0YXRpYy1sYXlvdXQgcmVtb3RlIHVwZGF0ZSANCj4+
IHNpbmNlIHN0YXRpYyBsYXlvdXQgZncgcGFja2FnZSBjb3VsZCBvbmx5IGhhcyDigJxpbWFnZS1i
bWPigJ0gaW4gdGhlIA0KPj4gcGFja2FnZS4NCj4gDQo+IEZvciBub3csIGl0IGRvZXMgc3VwcG9y
dCBzdGF0aWMgbGF5b3V0LCB5b3UganVzdCBuZWVkIHRvIHVwbG9hZCB0aGUgDQo+IHRhcmJhbGwg
Y29udGFpbnMgc2VwYXJhdGVkIGltYWdlcywgaW5zdGVhZCBvZiB0aGUgd2hvbGUgImltYWdlLWJt
YyINCj4gdGFyYmFsbC4NCj4gDQoNCkNoZWNraW5nIHRoZSBidWlsZCBmaWxlcywgdGhlICouc3Rh
dGljLm10ZC5hbGwudGFyIGNvbnRhaW5zIHRoZSBpbWFnZS1ibWMsIG1hbmlmZXN0IGFuZCBzaWdu
YXR1cmUgZmlsZXMgc28geWVhaCB3ZSBjYW4ganVzdCB1cGxvYWQgdGhhdCBmaWxlIHdpdGhvdXQg
YW55IGJ1aWxkIGNoYW5nZXMsIHdlIGp1c3QgbmVlZCB0byBhZGQgdGhlIHN1cHBvcnQgaW4gdGhl
IGJtYy1jb2RlLW1nbXQgcmVwby4NCg0KPj4gDQo+PiANCj4+IEZvbGxvd2luZyBhcmUgdGhlIG1v
ZGlmaWNhdGlvbnMNCj4+IA0KPj4gMS4gQWRkIGEgbmFtZSBsaXN0IGZvciBzdGF0aWMgbGF5b3V0
IG9ubHkgaGFzIGltYWdlLWJtYyBpbiB0aGUgZncgDQo+PiBwYWNrYWdlIGFuZCBtb2RpZnkgcmVs
YXRlZCBpbWFnZSBmaWxlIGNoZWNraW5nLg0KPj4gDQo+PiAyLiBBZGQgY2hlY2tpbmcgQXBwbHlU
aW1lIHByb3BlcnR5IGZvciBzdGF0aWMgbGF5b3V0IHRvIGRlY2lkZSANCj4+IHdoZXRoZXIgcmVi
b290IHRvIGFwcGx5IHVwZGF0ZSBwcm9jZXNzIG9yIG5vdC4NCj4+IA0KPj4gDQo+PiANCj4+IFBs
ZWFzZSBmaW5kIHRoZSBwYXRjaCBmb3IgdGhlc2UgbW9kaWZpY2F0aW9ucyBpbiB0aGUgYXR0YWNo
bWVudC4NCg0KTG9va3MgZ29vZCwgaWYgeW91IGNvdWxkIGp1c3QgYnJlYWsgdGhlIHBhdGNoIGlu
dG8gdHdvIHNlcGFyYXRlIHBhdGNoZXMsIG9uZSBmb3IgdGhlIHN1cHBvcnRpbmcgaW1hZ2UtYm1j
IGFuZCBvbmUgZm9yIGFkZGluZyB0aGUgQXBwbHlUaW1lIHByb3BlcnR5LCBhbmQgc3VibWl0IHZp
YSBnZXJyaXQgYXMgTGVpIFlVIHBvaW50ZWQuIExldCB1cyBrbm93IGlmIHlvdSBoYXZlIGFueSBx
dWVzdGlvbnMgd2l0aCB0aGUgcHJvY2Vzcy4gVGhhbmtzIQ0KDQo+IA0KPiBJdCBtYXkgYmUgdXNl
ZnVsIHRvIHN1cHBvcnQgdGhlIHdob2xlIGltYWdlIGFzIHdlbGwsIHNvIHBsZWFzZSBzdWJtaXQN
Cj4gdGhlIGNvZGUgdG8gZ2Vycml0LCBhbmQgd2UgY291bGQgcmV2aWV3IHRoZSBjb2RlLg0KPiBQ
bGVhc2UgZm9sbG93DQo+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGZG9jcyUyRmJs
b2IlMkZtYXN0ZXIlMkZDT05UUklCVVRJTkcubWQlMjNzdWJtaXR0aW5nLWNoYW5nZXMtdmlhLWdl
cnJpdC1zZXJ2ZXItdG8tb3BlbmJtYyZhbXA7ZGF0YT0wMiU3QzAxJTdDQnJpZ2h0X0NoZW5nJTQw
d2l3eW5uLmNvbSU3QzQ0MmVlNDk0MWQ0NDQ3NTFiMmZjMDhkNzY5ZTRiNmNhJTdDZGUwNzk1ZTBk
N2MwNGVlYmI5YmJiYzk0ZDg5ODBkM2IlN0MxJTdDMCU3QzYzNzA5NDMwMzM2NDAwMDMxMyZhbXA7
c2RhdGE9d0hWVCUyQnVrSGJyMFJFYnNYYW9VOFF4eE5MdFNSMXlvTGNNYVdqbFpwWllBJTNEJmFt
cDtyZXNlcnZlZD0wDQo+IGZvciBob3cgdG8gc3VibWl0IGNoYW5nZXMgdG8gZ2Vycml0Lg0KPiBU
aGFua3MhDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
VGhpcyBlbWFpbCBjb250YWlucyBjb25maWRlbnRpYWwgb3IgbGVnYWxseSBwcml2aWxlZ2VkIGlu
Zm9ybWF0aW9uIGFuZCBpcyBmb3IgdGhlIHNvbGUgdXNlIG9mIGl0cyBpbnRlbmRlZCByZWNpcGll
bnQuIA0KQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgY29weWluZyBvciBkaXN0cmlidXRp
b24gb2YgdGhpcyBlbWFpbCBvciB0aGUgY29udGVudCBvZiB0aGlzIGVtYWlsIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQuDQpJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCB5b3Ug
bWF5IHJlcGx5IHRvIHRoZSBzZW5kZXIgYW5kIHNob3VsZCBkZWxldGUgdGhpcyBlLW1haWwgaW1t
ZWRpYXRlbHkuDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cg==
