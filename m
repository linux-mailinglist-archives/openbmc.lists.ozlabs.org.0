Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D558424373B
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 11:08:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS12T0MC7zDqby
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 19:08:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.138; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=V2cskbyd; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=V2cskbyd; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320138.outbound.protection.outlook.com [40.107.132.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS11W6G8kzDq6B
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 19:07:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gafPqcv+T5qzPXwtBTjLXXri1aWwMcbp/xZ1mB9E2X0=;
 b=V2cskbydhPKe4M9Vy+n9H6uuaD+l6mECu0klwPrVwD9lbI1OPLoc4MEJ4IFEeanjLj+hULK/wUHJpu9sn3BxRUJMFjDEPfIBkL0+so2/+Wz+YvKpAJ45XAyQWzKJIqB2H9BdkeQbYZFoNL3cbn37B1gT5uxarxfwrsrmsr84vl4=
Received: from SG2PR03CA0146.apcprd03.prod.outlook.com (2603:1096:4:c8::19) by
 SG2PR04MB2572.apcprd04.prod.outlook.com (2603:1096:4:55::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Thu, 13 Aug 2020 09:07:35 +0000
Received: from HK2APC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c8:cafe::65) by SG2PR03CA0146.outlook.office365.com
 (2603:1096:4:c8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.13 via Frontend
 Transport; Thu, 13 Aug 2020 09:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=timeout (key query timeout)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=bestguesspass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.52) by
 HK2APC01FT022.mail.protection.outlook.com (10.152.248.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 09:07:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxOoLEWm8+ZLCKbs3ebTe4EoiiT95469yiVfC0otPzdjk9ta2K6S1h/HFOMxzv+kf/QGiuX0McAYzHXCpsEv/FqPuZkjCl3XeC/+F1gNhOz1ES/0cgEDEN2Xc8xZL8IEZ3iOo0IJUUgLGutPklfTH3+liDFDVUYydfoTPGbQriAIh/IgYYsBnmzOF39VEWNzBt+jPscOTrSl2aEZ8khH8hoIs2A/KA1YnOf/Ch2TVK3AmOGfhLPyT4q6lgGN6dpT2QJtS4mvHFj9a7nE+bIf4yZI2QfMUkmy+9vIFMfKZZmogXpbM3P9Jl7qdQYwuFmTh90QcOevDdP+jl+Gf/1biQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gafPqcv+T5qzPXwtBTjLXXri1aWwMcbp/xZ1mB9E2X0=;
 b=ZU44KKe+c2/TK+g3H1Gf3/cjI9Msm9MtNSOp0RHa4GoeskgUsCez7j9bHb/i8pSeV3fYu9Ag/PXnf6vKJcSMp+rjFkVF5r+jvnx32iksnqR+pu6MhcheDoys570t6BDIMSLGW7qx8uXyL3+dMwVos6SFK8fGQ/s9TQ9mNipTQ+8QScLhPJ7j6Mdqi0Qjz0ogCx+JmqE4V+PJpFuy2RhaQ06J73xhI7qP0qXUZ3l/Kb4ylRQVhZdRX1mFAokthfzu+aXUCUl2FHjZyB2rAjz6y0GqyvQf89vIKY6XlklO0xZLYHpwJdwqNJS6NX/kP3c6OtWGWJs/jlZ1Cdd67opICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gafPqcv+T5qzPXwtBTjLXXri1aWwMcbp/xZ1mB9E2X0=;
 b=V2cskbydhPKe4M9Vy+n9H6uuaD+l6mECu0klwPrVwD9lbI1OPLoc4MEJ4IFEeanjLj+hULK/wUHJpu9sn3BxRUJMFjDEPfIBkL0+so2/+Wz+YvKpAJ45XAyQWzKJIqB2H9BdkeQbYZFoNL3cbn37B1gT5uxarxfwrsrmsr84vl4=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3562.apcprd04.prod.outlook.com (2603:1096:4:95::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Thu, 13 Aug 2020 09:07:30 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3283.018; Thu, 13 Aug 2020
 09:07:30 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Commands for network interface parameters
Thread-Topic: Redfish Commands for network interface parameters
Thread-Index: AdZxUCuWMycQjbbUSxavLGOXmL+Apg==
Date: Thu, 13 Aug 2020 09:07:30 +0000
Message-ID: <SG2PR04MB30936853C79F6D04513ABEF0E1430@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMWQ0MjkxOWMtMGNjZi00YTAyLTk0MTctMTU5YmIxZjMzMmM4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlJPdTRrMHhmbkRJWGNTb09Zd3F6c25UMHBCMjNUS0xSb1NtQlpmMCtrVFFock5xRklTSGFHYVwvaGFKdUpIUm1PIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:686:914a:818f:3c03:40a2:c693]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0c160b90-adca-4ba7-df57-08d83f685089
x-ms-traffictypediagnostic: SG2PR04MB3562:|SG2PR04MB2572:
X-Microsoft-Antispam-PRVS: <SG2PR04MB2572E75D4F7CB7FD72857997E1430@SG2PR04MB2572.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(316002)(478600001)(4326008)(6916009)(66476007)(66446008)(64756008)(66556008)(66946007)(76116006)(54906003)(83380400001)(71200400001)(33656002)(186003)(9326002)(52536014)(8676002)(2906002)(55016002)(9686003)(7696005)(5660300002)(86362001)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30936853C79F6D04513ABEF0E1430SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3562
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0e2db33e-c264-4021-37bd-08d83f684eff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdFoLSk2wvFKPz0Nywnx8NCGQHjYPfBv1zzkw2kdB7yath0SciBsp0Qhy/m/T7ED4S8t69Nxgb/4kYf3VK29KLBwVJRlK8PmPm2WaOOb5MlXZE+4/N6DrMH24wab3i6SGnchev/dNxgmDmO7kYxQxVAvJyI1Zuz3J3gCAMVvDTZqlKbYa/49VeTzA/chD1BkazDLaZtdv8J6n7IHmUPZ5GXcb3AiWFsQPyQ6ly0b2vUY3jfM61YuErUV9QFvZ8waTgmE38VvoGhINAbTIbePQl0xMe077VHrKWk+L6xDHlm8GmrVuvDkmM5tKAJDER8sVUdokiihLw+lOy3OPRs9Yd5CR00OdQE8Wb76dFyk6orJyQYYT5LnOzSWy2F3RPksJSp/aplYte+5jiw1wiSikA==
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(7696005)(336012)(81166007)(36906005)(70206006)(4326008)(9326002)(356005)(54906003)(316002)(82740400003)(47076004)(33656002)(8936002)(5660300002)(52536014)(186003)(6506007)(70586007)(33964004)(82310400002)(26005)(8676002)(9686003)(55016002)(6916009)(83380400001)(2906002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 09:07:32.7209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c160b90-adca-4ba7-df57-08d83f685089
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2572
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
Cc: "wak@google.com" <wak@google.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30936853C79F6D04513ABEF0E1430SG2PR04MB3093apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQpJIGFtIGludGVyZXN0ZWQgdG8ga25vdywgaG93IHRvIGdldCB0aGUgbmV0d29y
ayBwYXJhbWV0ZXJzIGxpa2UgcGFja2V0IGNvdW50ZXJzIGFuZCBvdGhlciBpbnRlcmZhY2VzIHBh
cmFtZXRlciB1c2luZyByZWRmaXNoIGludGVyZmFjZT8gQ291bGQgeW91IHBsZWFzZSBsZXQgbWUg
a25vdy4NCg0KVGhhbmtzICYgUmVnYXJkcywNCkpheWFzaHJlZQ0KOjpESVNDTEFJTUVSOjoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1h
aWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZv
ciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90
IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291
bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0
ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4g
VGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJy
b3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmln
aW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFu
eSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9y
IGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9m
IEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1p
bmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBh
bmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3Jp
dHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3Ig
cGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9y
ZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVt
IGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCg==

--_000_SG2PR04MB30936853C79F6D04513ABEF0E1430SG2PR04MB3093apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcN
Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21z
by1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVk
ZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0K
PG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+
PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPkhpIEFsbCw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBhbSBpbnRlcmVzdGVk
IHRvIGtub3csIGhvdyB0byBnZXQgdGhlIG5ldHdvcmsgcGFyYW1ldGVycyBsaWtlIHBhY2tldCBj
b3VudGVycyBhbmQgb3RoZXIgaW50ZXJmYWNlcyBwYXJhbWV0ZXIgdXNpbmcgcmVkZmlzaCBpbnRl
cmZhY2U/IENvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cuPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPlRoYW5rcyAmYW1wOyBSZWdhcmRzLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+SmF5YXNocmVlPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxmb250IGZhY2U9IkFyaWFs
IiBjb2xvcj0iR3JheSIgc2l6ZT0iMSI+OjpESVNDTEFJTUVSOjo8YnI+DQo8aHI+DQpUaGUgY29u
dGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRp
YWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0
cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUg
YXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVz
dHJveWVkLCBhcnJpdmUgbGF0ZSBvcg0KIGluY29tcGxldGUsIG9yIG1heSBjb250YWluIHZpcnVz
ZXMgaW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFuZCBpdHMgY29udGVudHMgKHdpdGggb3Ig
d2l0aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxsIHRoZXJlZm9yZSBub3QgYXR0YWNoIGFueSBs
aWFiaWxpdHkgb24gdGhlIG9yaWdpbmF0b3Igb3IgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3
cyBvciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5
DQogdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRo
ZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9m
IHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZp
Y2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdl
IHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudA0KIG9mIGF1dGhvcml6ZWQgcmVwcmVz
ZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBz
ZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNo
bWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLjxi
cj4NCjxocj4NCjwvZm9udD4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_SG2PR04MB30936853C79F6D04513ABEF0E1430SG2PR04MB3093apcp_--
