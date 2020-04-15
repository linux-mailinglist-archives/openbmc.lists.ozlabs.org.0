Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBA1AB050
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 20:05:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492VdX2R8SzDqCg
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 04:05:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.94.111;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=EkOiOaXe; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2111.outbound.protection.outlook.com [40.107.94.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492VVR0C9LzDr7x
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 03:59:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djzFoGp4Td2DOrmgz2zOLaq3hnqrqC6pBtNjcCw2P9um5LuKFjx4f19vdc2nKNedxOX9lyDdEtpid2g4W2BoQeblTxUjucUitP6fBAm8FyTMXddykaR7F4uVfD2DR/h/kFUQ1QLtw2xi7Y+rV05bVxFTI2NPHGNqiQJ7FKghOFODy+hFr6BoRyt8RaZvc3Dnedjx5VUq4zXBoz+JACYeYqsm9CCe5kUiudHL8WKYkLz4KGkjpZ/QxoR8K4RugFjA8Agv5CI2WK2ywYN5i3LuTGALSYuEaGOhmVCTyZADJgrgP2lU8z60gTJMocNFb+wStJtVttgjp8UrtMhy+emYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQGS2n38JXH2A2ZTYA1EjZcz+w32LUksvIp6Mbkq7pY=;
 b=dCt2uEfeHqyWh8kdn5FZb7wGyzHFm+ipZHjZ7ZhPGN/3eVZ5PlsGQX24Kz/iID7kIrwGrgQ+SttCjHtET8wg3UTUpBi8gylCR4vUyO6RpQC0OS6DD6thwFj8EUjivaFuKfBHyz6/wrsJVlj/GKrML6M2ktPG43QeKlUDBFsJuW1n1XlsSd238OHystIBx5aFQvisF54VMcuHsnFnzP9s07IOzU9CgeijGVULTgPPo6ONtr14Uo75sgpgKetVltdcbc8MxH6G4QyLN6NIRzv66fMS/dn2jJolrQILi5TWAMLh/TMjvNDpmMpwipF2VX9LzgIztNmwBXkMkV85oQcbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQGS2n38JXH2A2ZTYA1EjZcz+w32LUksvIp6Mbkq7pY=;
 b=EkOiOaXeG87rKvEraCocnkrR21biqaJAC0HNxx6LdCEyU9+8XXfomsOrs0yr2pEg5X1qKWQziDKVZFH6VPzyOKul14aUqFym9Kh6D4CO1BhiGXNPQapTszgUMXfj+XWpv0G1YMM+eS3k/P6iHCuIBxyVKRFkuAz3SMqWMnE2Kyo=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1477.namprd21.prod.outlook.com (2603:10b6:610:82::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.3; Wed, 15 Apr
 2020 17:59:17 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.2937.000; Wed, 15 Apr 2020
 17:59:17 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "james.feist@linux.intel.com"
 <james.feist@linux.intel.com>
Subject: RE: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfA=
Date: Wed, 15 Apr 2020 17:59:17 +0000
Message-ID: <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
In-Reply-To: <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 226a420a-e6a0-4385-603a-08d7e166b79a
x-ms-traffictypediagnostic: CH2PR21MB1477:
x-microsoft-antispam-prvs: <CH2PR21MB14773489652CEBE015CDC4BCC8DB0@CH2PR21MB1477.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(66946007)(66556008)(71200400001)(66476007)(55016002)(478600001)(33656002)(186003)(110136005)(64756008)(66446008)(2906002)(76116006)(86362001)(7116003)(9686003)(4326008)(26005)(82960400001)(6506007)(53546011)(81156014)(7696005)(5660300002)(8990500004)(4744005)(3480700007)(8936002)(10290500003)(316002)(8676002)(82950400001)(52536014);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tDBdxwYvKr24Uxe6mo06jzfQOrTOB+boeebU6VkfoqOozEZVHoFnZHbGrXnwS+OhmWL0omExCuAztqH/3qSUbBaomDrE48sEnMJ36gSm4f3ERFDNyV37SR2WoAmMNWBAX8iDPAVW7B/e1qL/eAPDsN62TmBHePSCo2LDeqNRxAfWJz0Jw8fYdPrHxSJM1eXmoDvtn1adsZDwKWsjoPnQ1gtGWbhGlwSXPFTYQB5KINujQxRWh43VQxz8+f3qxTWCEuElMvx4a2NPrECC6DiwgW2u7olSQhXsI4+oW7W4zygTapiDlRUVKR8ReZxEqdEzXkev4WnDOt2Zn3Sl/34SceDrXX3KUxLaThhU0qhJjLO4jjT8IeyCLmQ0WnLCjsfUrWb+/VLPKmX+mUc9bIUrmE7Vp8TOs9V5kQ8vIiUvgRm3ww57gkXNAOFArZ17eQs4
x-ms-exchange-antispam-messagedata: bQ27O7bTnPETp/w+QXZDX9GPCwYloGbNwJBmPi1CwPRsrcM3pvPnXPIAzA/++r97dqRCd3J2oOqLN5Af4B+SZ6mKUOJQ7isdmEK1M9ykDacuhn46aVhPf2q5SFimk8fGvId4JdD4tOMgmx5vufFxRQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226a420a-e6a0-4385-603a-08d7e166b79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 17:59:17.8410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvrG1WNTgrsTbsahPRjqdUTp0jtcr9rhMtJ+UsSlh3gm06aRxsvNHA1uUZKLIkQUlYkKsLw7ArRbyLpKpNRbaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1477
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

SGkgVmlqYXksIA0KDQpBcmUgdGhleSBpbXBsZW1lbnRlZCBvdmVyIE1DVFAgb3ZlciBTTUJVUz8g
DQoNCk5lZXJhag0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jv
c29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIFZpamF5IEtoZW1rYQ0KU2Vu
dDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCA1OjI4IEFNDQpUbzogamFtZXMuZmVpc3RAbGlu
dXguaW50ZWwuY29tDQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBbRVhU
RVJOQUxdIFJlOiBudm1lIHNlbnNvcnMNCg0KU29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcywgSSBm
b3VuZCBOVk1FIGluIGRidXMtc2Vuc29ycy4gSSBuZWVkZWQgdG8gdXBkYXRlIHJlcG8gaW4gbG9j
YWwgd29ya3NwYWNlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0KDQpGcm9tOiBWaWpheSBLaGVta2Eg
PG1haWx0bzp2aWpheWtoZW1rYUBmYi5jb20+DQpEYXRlOiBXZWRuZXNkYXksIEFwcmlsIDE1LCAy
MDIwIGF0IDU6MDcgQU0NClRvOiAibWFpbHRvOmphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbSIg
PG1haWx0bzpqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQpDYzogIm1haWx0bzpvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmciIDxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3Vi
amVjdDogbnZtZSBzZW5zb3JzDQoNCkhpIEphbWVzLA0KRG8gd2UgaGF2ZSBzdXBwb3J0IGZvciBO
Vk1FIHNlbnNvcnMgaW4gZGJ1cyBzZW5zb3JzPyBJIHNlZSBwaG9zcGhvci1udm1lIHJlcG8gd2hp
Y2ggbmVlZHMgY29uZmlndXJhdGlvbiBmcm9tIHlhbWwgZmlsZSwgaXMgaXQgcG9zc2libGUgdG8g
aW50ZWdyYXRlIHRoaXMgd2l0aCBlbnRpdHkgbWFuYWdlcj8NCsKgDQpSZWdhcmRzDQotVmlqYXkN
Cg==
