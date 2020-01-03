Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E572A12F22A
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 01:28:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pm3Y42KHzDqCk
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 11:28:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.236.115;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="IVw3sg8K"; dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2115.outbound.protection.outlook.com [40.107.236.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pm2h2nmMzDqC4
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2020 11:27:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIkpwoYXHFGGMC6d+tOpfDKmdfRy2QbKFzJPXTJKsOLV5Txcz017Zw/g5WrJYqYVLxdRW12qsbj25mgfCzDzTm1coQOXr6wmxk54RxxbgY04ljMYlDKmIdskeWZplUmtdQt7KmJvNSml8HdBQKUdJDR1sVN0jzpv8dNRIJkV7oyRFk02R1ePkEimGqxuvt8fFxKXQSxED83GEpcVgy8u+8Sq+54PO4UpYAaM5IUh/Onhiwu7Db09aIRJLBJ/kgNx9HW2cRV4h2qtkR4UoRQQ566o4Abo/hiRpCvNsJKooEcegwfKK1R+Ze+gjD/vsdsocAagD6pguqAf5MoA6AQcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dNXHmwVtJklgkVUqcPLvG9fc4e1Np7D6b00c4t62gw=;
 b=Z0FYjYtrICqI0FrdBPlvrIb136eAiPx9RA39RG508Q/wuUY0R6RvZBU3oUfxK9sF0N2n3sZPYwD10+ye9FsFZzTrZPEigIN9JfWfwJA8ydYMDHk9RYfRyt1IFHS8dzMbWNKEuOh0gFchshFbo1Ko5QyVdPSDj3clpQ+yMHdoN6ljXK2uQL5GYPYKWI3wg7iabg22TbnRndv/4apcY7x3fuo8/aDD2z3W9p4vn+gFfJjVERgnnSO/B/QxJmuDD9P47a7tPJwILblyXeGboDqJcQQmBFAxoLRdA4uxSWbBGvmEO1APbH1fRMF/PpwQ7L59lqqKq9/BKcP2qWBJ8wJ9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dNXHmwVtJklgkVUqcPLvG9fc4e1Np7D6b00c4t62gw=;
 b=IVw3sg8KuyNzIJUFpleVT0/mINugsQvWWYY/nSK6FG5EgWMIwlt3ZmVwhFj/JhINZk67+fMv5GzFywpgQQ5kZCB4M+sIRoQ8IaS6YyZVhqWm17+fpWtk3NRELgxNkKalWxdW2DercfdHweCagnVCv0iUf5FmMJS4/xWcMZNqWdc=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1450.namprd21.prod.outlook.com (10.255.109.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.1; Fri, 3 Jan 2020 00:27:49 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::f968:9946:b0e4:4e8f]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::f968:9946:b0e4:4e8f%6]) with mapi id 15.20.2623.002; Fri, 3 Jan 2020
 00:27:49 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Sensor Data Record ( SDR) support 
Thread-Topic: Sensor Data Record ( SDR) support 
Thread-Index: AdXBzGahOaYwwe6XQmOw6snkUWNU9A==
Date: Fri, 3 Jan 2020 00:27:49 +0000
Message-ID: <DM6PR21MB138828CB98B178632C9E07F8C8230@DM6PR21MB1388.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-03T00:27:48.0361045Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ca7a4a3f-6361-492d-adbb-375c91be2aa1;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 64ace829-abec-4449-ca26-08d78fe3c381
x-ms-traffictypediagnostic: DM6PR21MB1450:
x-microsoft-antispam-prvs: <DM6PR21MB1450E1F34D15F3FB07470919C8230@DM6PR21MB1450.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(376002)(346002)(396003)(189003)(199004)(5660300002)(8676002)(2906002)(6506007)(558084003)(64756008)(76116006)(66476007)(66946007)(66446008)(66556008)(52536014)(7696005)(9686003)(8990500004)(86362001)(33656002)(186003)(316002)(10290500003)(55016002)(26005)(4743002)(8936002)(71200400001)(478600001)(81166006)(81156014)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1450;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eEJaQTWuDw5545dEf4rCBlcY9/+7mEfoxKsGntBlMHmjfbI1MkS5UnqMdhqRuaVstpmIXRMZ1Twe50f9M1jTfecg8OAz4Ig8jQsKISN/DsTRiRrKbUNRtMOvrnh0HsMIaFwrWYVz6bnvLDcxv2zBfwnhW0QcBjC4pJiqTHEld5lMmzbd/v3KqmMQWnEiFGYH8yKLHAyl+aAQpOxW837LysBF0x7Ik69It8KJAzv3CcMGsx6HxtXJgQlx0pwY54gbXgknJpB06ecGyPKyqL+h5XYFHmFz4kZo+bqQWfiHb4OF0OIZjvWgAyrj8mHe1BchZcKp7x2n7EWLXOLedlqkEyavj4KSShLenU6PN6p7nRrKpX4VyWoeJB9lBh5CVDFsO7XNDfnGUAta3tM8r+9w1vwC1BHF6wZItu/7DFqKif49S6l0AFoPNf2BZjHQkXJl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ace829-abec-4449-ca26-08d78fe3c381
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 00:27:49.5659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bGPVAm75q+NRSYqJbC8bPnBWvS42QUfov6Kv4VMdh78/6AZT+l5pczgRZj5Cv4BKU0gg6BGLGYggygRKAdI9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1450
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

Is there any plan to add support for IPMI SDR ? i.e to support adding new S=
DRs using Add SDR command.=20

Neeraj

