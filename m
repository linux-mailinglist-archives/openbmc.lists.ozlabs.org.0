Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001A112306
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 07:44:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47STqV6cJczDqTn
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 17:44:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.223.120;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Bd0XxNJ+"; dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2120.outbound.protection.outlook.com [40.107.223.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47STpc48vnzDqT9
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 17:44:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SggtrqNA1+dv8od+os3vQ4ep0j0+lNnrbk5Q0MAMJhiA5QwFjH2W2iOU62Lnw9mOcYF0opwfz456d98HOMRpt6LPCVaH/F83qTg0l5xAjjAB10nmX8mupU9JpUYKZpOpidJcPFrZ0vQ4w8htshm8cGw+RPSVBBiXsYPjodLwQUz4gROjN4w8hPMklVSyE94oeclmrNOOsBZCvhg992BrS/ivklm//T4liDpR4O+K6putoPHc/9buYi3t9aM1WpKgz4w3zzrdctyGbBao8Lsh7Ur3uoXOSQKblTlrOjpIEksqZp3CFA+D21F9jIe/DCDExRb6gixcoaXpjvry61P82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++8IrapMOnroT2hb4f+Ya1CzJXRnOgck6u9Xcalqekg=;
 b=jPBA+PIVhc4QhCCCDHr7Gxykoog0OGKjW0BjRKjhdKj+EU8WGyePm4kyP5zdJuGyPfuU/v/vXBQJxSIKNVOp2SLl1IrTaRmqgZOBOnh5qlrl3XmpQ8rQ418E5QPx1lORoPQlkkU4Gu4I6A7CmRZv+PBDrrP13Batl3IZ6kg7lgJckLgoDw9egzTlowOrvIJsh3W29S7TGe1ol2hGJ51rBf6gDXPVMXcHRiBAzK2/xP+7vry+tR/zjQtTNDqjFhml5rQdRD9z4wZsvj8BfP0l8B7r2bubMvZAr4Xrl/xFQaODwNHE0VsHwlg+hAJMda4QFH8RoNNlw3lzjUngJAnmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++8IrapMOnroT2hb4f+Ya1CzJXRnOgck6u9Xcalqekg=;
 b=Bd0XxNJ+N1LZFYUmi6cZ0162gwAJPLbRzRfBsxL2/xoXuGdqO6qZ95UatIA59sHRQisR/YxPDcczezcigTUnkPWCwdDkETsw7kBBMESyTqTBH5FnigZGUlMVbLQjRlqzmPUsSAUUSxJM3YXAxHgftUX1s2nZ1dXcFwNjO4Qb7jU=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM5SPR01MB015.namprd21.prod.outlook.com (52.132.133.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.2; Wed, 4 Dec 2019 06:43:57 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.005; Wed, 4 Dec 2019
 06:43:57 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Matuszczak, Piotr" <piotr.matuszczak@intel.com>, 
 vishwa <vishwa@linux.vnet.ibm.com>
Subject: RE: [EXTERNAL] Telemetry Reports dynamic update
Thread-Topic: [EXTERNAL] Telemetry Reports dynamic update
Thread-Index: AQHVqjVw6DJlV8g4uEKFWol08pDpp6epfUdw
Date: Wed, 4 Dec 2019 06:43:57 +0000
Message-ID: <DM6PR21MB1388E6CEF6424B616C7C7B1DC85D0@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <da4d443c-e7e1-6980-af49-15d05360feff@linux.vnet.ibm.com>
In-Reply-To: <da4d443c-e7e1-6980-af49-15d05360feff@linux.vnet.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-04T06:43:55.9407321Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=88e9807d-ecfc-4537-a98e-8cf3b8cd7245;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a55b504-bf23-4de7-269a-08d7788556bc
x-ms-traffictypediagnostic: DM5SPR01MB015:
x-microsoft-antispam-prvs: <DM5SPR01MB015E8408F079AB64C42279BC85D0@DM5SPR01MB015.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(366004)(376002)(396003)(199004)(189003)(53754006)(13464003)(10290500003)(33656002)(99286004)(6436002)(110136005)(81166006)(8676002)(52536014)(71200400001)(71190400001)(478600001)(2501003)(81156014)(256004)(14444005)(86362001)(8936002)(229853002)(3846002)(6116002)(6246003)(15650500001)(76116006)(76176011)(6506007)(64756008)(66556008)(66946007)(9686003)(66476007)(22452003)(7696005)(66446008)(2906002)(10090500001)(14454004)(305945005)(7736002)(74316002)(8990500004)(316002)(5660300002)(186003)(26005)(25786009)(446003)(102836004)(53546011)(55016002)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5SPR01MB015;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bsTVchSiCNbn4NHDqntz4OG5UOcd94UNP0+6EliwHM8Uhcsaa0Dkx6ZLEp1dKQ7T4AAgfjpJOkKpvMUb0j1xYBZZBsOAZAWz9Qh4GF8nRJ11IKaP+D3Th0NxUtoMNuZtRKS8dq66Iig6iDgvLE6my/bnb8YfJQuH/fkayQdFJ8PZzGW3EJELjGgHmxsL868kG7xEMJESjMvgNmlhc/qjpzhEYZumCsdqvNvTPWKAyAEdspGNMZQ8NJL5jVsI5bJKlR3FHN15RA7CD0MPXla0D54f6X2LplohzTM1umSFGqwtjeuCttH44SpCvZzuCr6MxDNla4oJx8aW0G5dPAFggti+iQyWlxfqo+q6hyI8v0uEoxr8HnDSDF7BUwV8i1rT+Fz53qzCNreUKez0rG4ejepOQ+ODg8avG+rIGwyqwbUwP93xb6R8VhAGgsracPCDo5XnU6BqKxqwCBgkyhMHRD5JqwGay0lkIaVHjHBcDHF3HBek8v4W0EwzFMGZv6Lf2mI5wPSRyJJG+gTPJuI9Jg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a55b504-bf23-4de7-269a-08d7788556bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 06:43:57.5816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MIpCR6wVvj24eWbEjJO5h+PCMwev1/1GXsobEs44Td/cVvkQnkggyTHcsCbDSaKBZ8zF4OhggxL3E1DoqSOxJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR01MB015
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

V2UgZG9u4oCZdCBoYXZlIHRlbGVtZXRyeXNlcnZpY2UgaW4gQk1DIGN1cnJlbnRseSBzbyBhcmUg
eW91IGN1cnJlbnRseSBkb2luZyBpdCB1c2luZyB3ZWJ1aT8gT3IgeW91IGhhdmUgd3JpdHRlbiBh
IGFwcCB1c2luZyByZWRmaXNoIEFQSXM/ICBJIGFza2VkIHNpbWlsYXIgcXVlc3Rpb24gaW4gbGFz
dCB3ZWVrIHdvcmsgZ3JvdXAgbWVldGluZy4gSSB0aGluayBpdCB3aWxsIGJlIHVzZWZ1bCB0byBo
YXZlIGFiaWxpdHkgdG8gYWRkIG5ldyByZXBvcnQgZGVmaW5pdGlvbnMuDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKdXN0aW4gVGhhbGVyIDx0aGFsZXJqQGxpbnV4LnZuZXQu
aWJtLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAzLCAyMDE5IDM6NTcgUE0NClRvOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IE1hdHVzemN6YWssIFBpb3RyIDxwaW90ci5tYXR1c3pj
emFrQGludGVsLmNvbT47IHZpc2h3YSA8dmlzaHdhQGxpbnV4LnZuZXQuaWJtLmNvbT47IE5lZXJh
aiBMYWRrYW5pIDxuZWxhZGtAbWljcm9zb2Z0LmNvbT4NClN1YmplY3Q6IFtFWFRFUk5BTF0gVGVs
ZW1ldHJ5IFJlcG9ydHMgZHluYW1pYyB1cGRhdGUNCg0KSGkgQWxsLA0KCUkndmUgYmVlbiBzb3J0
IG9mIHNpbGVudGx5IHJldmlld2luZyB0aGUgZGVzaWducyB0byB0ZWxlbWV0cnkgcmVwb3J0cyBk
ZXNpZ24gYWxvbmcgd2l0aCBzdWJzY3JpcHRpb25zLiBBcyBJIHdhcyByZXZpZXdpbmcgaXQsIEkn
dmUgaGFkIGEgY291cGxlIG9mIGRpZmZlcmVudCBkZXNpZ24gcG9pbnRzIGNvbWUgdXAgYW5kIGFu
IGludGVyZXN0aW5nIHVzZSBjYXNlIEkndmUgd2FudGVkIHRvIGFzayBhYm91dC4gU28gaGVyZSdz
IG15IHNjZW5hcmlvOg0KDQpJJ3ZlIHNldCB1cCBhIHRlbGVtZXRyeSByZXBvcnQgdG8gdGhlIHN5
c3RlbSBkeW5hbWljYWxseSBieSBxdWVyeWluZyB0aGUgc2Vuc29ycyBhbmQgcmVxdWVzdCB0aGUg
dmFsdWVzIGFyZSB1cGRhdGVkIGV2ZXJ5IHNlY29uZC4gVGhlIHN5c3RlbSB3YXMgaW4gYSBzdGF0
ZSB3aGVyZSBpdCB3YXMgcG93ZXJlZCBvZmYsIHNvIG5vdCBtYW55IHNlbnNvcnMgd2VyZSBhdmFp
bGFibGUuIA0KQWZ0ZXIgdGhlIHN5c3RlbSBpcyBwb3dlcmVkIG9uLCBtb3JlIHNlbnNvcnMgYXJl
IGFkZGVkIGFzIGRpZmZlcmVudCBkZXZpY2VzIGFyZSBwb3dlcmVkIHVwLiBBdCB0aGlzIHBvaW50
IEknZCB3YW50IHRvIGFkZCB0aGUgYWRkaXRpb25hbCBzZW5zb3JzIHRvIG15IHJlcG9ydC4gSSBx
dWVyeSB0aGUgc3lzdGVtIGFnYWluIGZvciBhbGwgdGhlIGF2YWlsYWJsZSBzZW5zb3JzIGFuZCBz
ZWUgdGhlcm1hbCBhbmQgcG93ZXIgcmVhZGluZ3MgZm9yIHRoZSBDUFVzLiBJIHdhbnQgdXBkYXRl
cyBvbiB0aGVzZSBldmVyeSBzZWNvbmQganVzdCBsaWtlIG15IGluaXRpYWwgcmVwb3J0Lg0KDQpU
aGlzIGxlYWRzIG1lIHRvIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb246DQpDYW4gSSBwdXNoIGEgbmV3
IHJlcG9ydCBkZWZpbml0aW9uIHRvIHRoZSBUZWxlbWV0cnlTZXJ2aWNlIGFuZCBoYXZlIHRoZSBl
dmVudCBzZXJ2aWNlIHN0YXJ0IHByb3ZpZGluZyB0aGF0IG5ldyBkZWZpbml0aW9uIHdpdGhvdXQg
dGVhcmluZyBkb3duIHRoZSBzdWJzY3JpcHRpb24gZmlyc3QsIHdoaWNoIHdvdWxkIGxlYXZlIGEg
Z2FwIGluIHRoZSBkYXRhPw0KDQpUaGFua3MsDQpKdXN0aW4gVGhhbGVyDQo=
