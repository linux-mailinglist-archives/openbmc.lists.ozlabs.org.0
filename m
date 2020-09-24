Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B92774FE
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxzCD4vfYzDqjb
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:16:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.109; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Ls95E2l5; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Ls95E2l5; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320109.outbound.protection.outlook.com [40.107.132.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxz7V64jfzDqZD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:12:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv/mm3Kbqpc1O2UUUUluJYfuGXgJHYRhJhS/MNl6MKM=;
 b=Ls95E2l5Jbtjw7OEGARi4cvwzDoSPPUE70fNdjfEQAZssFUzys8ESxxo1JqNyLBog0HV2cp8mTRORC48vOI1UBET+x/Y8I4BW5+lJUKQt+RNraXfBEoydrFifSEsSpvobm50W5PEp9ZuPPF8wnQTUHvwC4nEBWJ7xRgMlDF58zo=
Received: from SG2PR03CA0110.apcprd03.prod.outlook.com (2603:1096:4:91::14) by
 SG2PR04MB2859.apcprd04.prod.outlook.com (2603:1096:4:21::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.19; Thu, 24 Sep 2020 15:12:27 +0000
Received: from SG2APC01FT114.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::6d) by SG2PR03CA0110.outlook.office365.com
 (2603:1096:4:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13 via Frontend
 Transport; Thu, 24 Sep 2020 15:12:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; fb.com; dkim=pass (signature was verified)
 header.d=HCL.COM;fb.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT114.mail.protection.outlook.com (10.152.250.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 15:12:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVuem9JuhmK6DLNEdM6Ue8azmbM7My29wU+DUGLKOJ/Gt9XinC/GiphFlPR8ylAjdwP455LKk6Fbxeus5L+b8Fu4LaHQx7vCfxKRkfbvO/x+7FdsozyaKW90LQ40qWcQZlOL9AQb148l626kLWTHoXmUNVuQFGaM8ur08e2r3wZ/ONVFKiaIr/NRaHm/PTYTFrM2MqsEL/qUqU6TkqU/2n/mDQOAm4NSTuNZlLVP4mi3qWY5VSbSDeSGp9wl8BJ7phbMpdNKRRf4ygDQesAPEP4JNNMa2JwRRVBMLmZqMGrFFUNCoKAliWjogvZgP7Li/Pq2rhOeeKA4+otK1alLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv/mm3Kbqpc1O2UUUUluJYfuGXgJHYRhJhS/MNl6MKM=;
 b=Qx6lmNJwt+5kIDnN4Olyswgc7mMT/OE7FTu6tWppBiEhinv0JLvh+S7wkBOGAUL/ZIf6i02hGiMtJFwln+n3uh5c2jF2WFtGas+rTpP7k86jdDgX5dESEXXUd9HIuhACqW5otjWwnqaGsJv9wehYzwMNRT1k1qV5aGMcEIlePYL6ZpyXok+DZ5dY9Cfl+qdYPA+e5nQ6XwXjZAODaDE0zyabh6wKtz/oAY+eoPT7igB2q2n+haPnATsbQ0kZdZDo/M6q9tv4CJZI9K3qqhr2pDn4hDMQnfyUsXHhf1qWBDAYElq9sgz3Vevx8cmgEpa7S/lJHqyXyUBzOorvPUrx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv/mm3Kbqpc1O2UUUUluJYfuGXgJHYRhJhS/MNl6MKM=;
 b=Ls95E2l5Jbtjw7OEGARi4cvwzDoSPPUE70fNdjfEQAZssFUzys8ESxxo1JqNyLBog0HV2cp8mTRORC48vOI1UBET+x/Y8I4BW5+lJUKQt+RNraXfBEoydrFifSEsSpvobm50W5PEp9ZuPPF8wnQTUHvwC4nEBWJ7xRgMlDF58zo=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HKAPR04MB3922.apcprd04.prod.outlook.com (2603:1096:203:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 15:12:23 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0%3]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 15:12:23 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Ed Tanous <ed@tanous.net>
Subject: RE: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAAAvawUAAA92WAD//4x0gP/89t9g
Date: Thu, 24 Sep 2020 15:12:23 +0000
Message-ID: <HK0PR04MB2964851A525129F994CC9067FD390@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
 <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
 <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
In-Reply-To: <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYWQ0YWQ3ZDEtZDY3ZC00YzI3LWFlZDctZGMzNTBhZjU2N2UwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNkdUSUh0VFBSbEZRTWIzNHdXT2lwYW9MY0d0Z1BQbWJEbkFOZmlaeWhSUHl1bjZ3d3VadURyNWZoYVRERUpsbyJ9
Authentication-Results-Original: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [106.211.237.225]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 95540a55-2a0e-4d92-b514-08d8609c3fae
x-ms-traffictypediagnostic: HKAPR04MB3922:|SG2PR04MB2859:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB285932C3A112176B9A86303FFD390@SG2PR04MB2859.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wPtAmmnbFOgVAR6xADZIUwaknbkVHn7ohmE4QUEIKb6Y5/fHy1iH7tKUaIsTqUlnfXYrOjuuw+n12cncLQXdsb1FqWNyMdrKQNrKXtrUN2Ikp0pPrHAXz1MS0E4Wjw4s1u8CBoM/wnkCWeIEdNtkCqbZZxxzOV+yZyULHckCviDww8q5zYtt7OyXdDq0dAeRejv6aNbH9zsqwam1m8O7+bsneum8xM6sBq0lhOzY1vnW1HrR9zcYlt2rxXSGM2X1keWqCxI3rVBgXHjQ6AJM2SlJ7cCsff8glLjubF54+2ESWXaSpqR3FotgTKAJ7A0tZjhPd4j9iC/wYeMnXCx0NA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(110136005)(54906003)(53546011)(86362001)(66476007)(66946007)(52536014)(4326008)(33656002)(66446008)(316002)(2906002)(71200400001)(64756008)(83380400001)(66556008)(186003)(55016002)(9686003)(7696005)(76116006)(5660300002)(6506007)(8936002)(478600001)(8676002)(55236004)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bJpRqD7Ft70YhHxassA3UlriJLInGIVMeuDoSj9nvFEra/ghtwTHh0hVgq/I4tFa6XTeFlS+B+/zJVQHoirLghXYyvE1qhKN0ZDYoO03j699BENULXIttuQQIgDAzwZYJ/aYblFVyJ4r/bINxnzUxDyb3VkPaUY3vSSvThc26LLm4z/BY6JshZs6Ic8wadfyR6fP4ToWSwY8jhXtrsbF6hQk9ptSu6GdI11joVRd+X4/9c8qMQbtI4j8MR2aRs44HG1bErgXKAmIrQEqqh85nibCy0ARFlvisJ3AjukbkZG6XA8+kYU93wH0alVDXMLmfaX4OLreGwamAzZeOUJlPuq7pQAHYQkrQFF6pDUmu+UhA1RLzQjjMC4LiqQimZvmN5LzH1xwj9rWANN2CmZEZmIVGNU86Rkac602B5dyfyQDD5juAOwVM5LjcuoXz1hEpUPupBgjEpwCkmNnOD6t1WOwBIaMjM8luTeZHzVs4rB2anyWLkUKf3E9mNNTgC65hYKDZoKHlUoTOHiuf1IccZS4M1W/NvkxIlE+vL3PbHv+LJkuUSVRRTl91Sz3hTf5yAuzhON94rjMCiIbadc4U/Ts0x/SQb4IdfEZqX36s8lNiQlvAWW8oYD+EirZQ1BkP6FXHgNEq1+aoV3Oi/hj5A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3922
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT114.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9bd8d621-6c3d-477e-6b4b-08d8609c3d54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00bGgRENCVZyUQL38Yx+VLZnromiehWub90RezqmpEgYfZLcfx0EVSDreIiCvIJuxYAMDB8NpugX3Ru0sG+V69lqYuHmjrTpgQJuGhy/S7ydGpxl5fAG/GwXjXOgXhMI8LJTVM+7fWms4nCp6JDe8/AKR4q/nVmTOELginUo7seTd3OWIk54RJEjed+D/2lO8m+xvNlgfFkokCVGi/eQrOcuY0TOH+r0RPLYY+T2uo7CdzsIJaLBENbdTtUAXeo/o55VABlTEGr7e2AUUlebFVmO4Nt8uEAEffsCRjzAm27cCXlKlqvearv3ACnm/Wl/B+QXDHSOq3exObMOGTJbwlYYkxfIcX4GJqdlChiAS8FiTSA5cOPr+qKlfSjp5NBo1agoKaOhlVb0fPa93v66b4pWZnZq7b76eGXMPzgGhJW22RC1hxSXgoPbS/8/N24b
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(478600001)(8936002)(6506007)(86362001)(8676002)(82310400003)(4326008)(47076004)(82740400003)(186003)(34020700004)(2906002)(55236004)(26005)(70206006)(110136005)(356005)(36906005)(316002)(81166007)(52536014)(5660300002)(53546011)(7696005)(55016002)(336012)(9686003)(54906003)(33656002)(83380400001)(70586007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 15:12:26.3258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95540a55-2a0e-4d92-b514-08d8609c3fae
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT114.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2859
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQpIaSBFZC9WaWpheS4NCg0KVGhhbmtzIGZv
ciB5b3VyIGNvbW1lbnRzLiBQbGVhc2UgZmluZCBteSByZXNwb25zZSBiZWxvdy4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIu
Y29tPg0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjAgMTo1NyBBTQ0KVG86IEVk
IFRhbm91cyA8ZWRAdGFub3VzLm5ldD4NCkNjOiBLdW1hciBUaGFuZ2F2ZWwgPHRoYW5nYXZlbC5r
QGhjbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IEphZSBIeXVuIFlvbyA8amFlLmh5
dW4ueW9vQGxpbnV4LmludGVsLmNvbT47IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGlu
dXguaW50ZWwuY29tPjsgSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT47
IFZlbHVtYW5pIFQtRVJTLEhDTFRlY2ggPHZlbHVtYW5pdEBoY2wuY29tPjsgUGF0cmljayBXaWxs
aWFtcyA8cGF0cmlja3czQGZiLmNvbT4NClN1YmplY3Q6IFJlOiBSZWFkIEZSVSBvZiBob3N0IHRo
cm91Z2ggaXBtaSBpbiBFbnRpdHkgbWFuYWdlci4NCg0KW0NBVVRJT046IFRoaXMgRW1haWwgaXMg
ZnJvbSBvdXRzaWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRl
ciwgRG9u4oCZdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBiZSBh
IFBoaXNoaW5nIGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBhbmQgY29t
cHJvbWlzZSB5b3VyIENvbXB1dGVyLl0NCg0K77u/T24gOS8yMi8yMCwgMToyMCBQTSwgIkVkIFRh
bm91cyIgPGVkQHRhbm91cy5uZXQ+IHdyb3RlOg0KDQogICAgT24gVHVlLCBTZXAgMjIsIDIwMjAg
YXQgMTI6NTcgUE0gVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAg
ID4NCiAgICA+DQogICAgPg0KICAgID4gT24gOS8yMS8yMCwgOTo0NSBBTSwgIkt1bWFyIFRoYW5n
YXZlbCIgPHRoYW5nYXZlbC5rQGhjbC5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+ICAgICBDbGFz
c2lmaWNhdGlvbjogSENMIEludGVybmFsDQogICAgPg0KICAgID4gICAgIEhpIEFsbCwNCiAgICA+
DQogICAgPiAgICAgICAgICAgICAgICAgVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIGFuZCBzdWdn
ZXN0aW9ucy4NCiAgICA+DQogICAgPiAgICAgICAgICAgICAgICAgQXMgc3VnZ2VzdGVkLCB3ZSBh
cmUgcGxhbm5pbmcgdG8gaW1wbGVtZW50IGEgbmV3IHByb2Nlc3Mvc2VydmljZSBsaWtlICB4eXou
b3BlbmJtY19wcm9qZWN0LklQTUIuRnJ1RGV2aWNlIGluIGVudGl0eSBtYW5hZ2VyIG1vZHVsZSB0
byBzdXBwb3J0IEhvc3QgRlJVIHRocm91Z2ggaXBtYiByYXRoZXIgdGhhbiB1c2luZyBkYnVzLXNl
bnNvcnMvaXBtYnNlbnNvcnMgZmlsZS4NCiAgICA+DQogICAgPiAgICAgICAgICAgICAgICAgRm9s
bG93aW5nIGFyZSB0aGUgYWR2YW50YWdlcywgaWYgaG9zdCBGUlUgaGFuZGxpbmcgaW4gZW50aXR5
IG1hbmFnZXIgcmVwby4NCiAgICA+DQogICAgPiAgICAgICAgICAgICAgICAgMS4gQWxsIHRoZSBG
UlUgaW5mb3JtYXRpb24gaXMgaGFuZGxpbmcgaW4gdGhlIHNhbWUgcmVwby4NCiAgICA+ICAgICAg
ICAgICAgICAgICAyLiBFbnRpdHkgbWFuYWdlciBQcm9iZSBjYW4gd29yay4NCiAgICA+ICAgICAg
ICAgICAgICAgICAzLiBBbGwgdGhlIEZSVSBGdW5jdGlvbnMgYXJlIGluIHRoZSBzYW1lIHJlcG8u
IFdlIGNhbiB0cnkgdG8gcmV1c2UgbW9zdCBvZiB0aGUgZnVuY3Rpb25zLg0KICAgID4gICAgICAg
ICAgICAgICAgIDQuIEFkZGluZyBGcnUgb2JqZWN0IHRvIGRidXMgaGFuZGxpbmcgYXJlIGRvbmUu
DQogICAgPiAgICAgICAgICAgICAgICAgNS4gQWxsIEZSVSB2YWxpZGF0aW9ucyBhcmUgZG9uZSBo
ZXJlIGxpa2UgRm9ybWF0IGZydSwgdXBkYXRlIGZydSBwcm9wZXJ0eSwgdmFsaWRhdGUgaGVhZGVy
LCBGcnUgQXJlYUxlbiBhbmQgY2hlY2tzdW0uIFdlIGNhbiB0cnkgdG8gcmV1c2UgdGhvc2UgdmFs
aWRhdGlvbnMuDQogICAgPg0KICAgID4gV2hhdCB3aWxsIGhhcHBlbiBpZiB1c2VyIGlzIG5vdCB1
c2luZyBmcnUtZGV2aWNlIGZyb20gZW50aXR5IG1hbmFnZXIsIHJhdGhlciBjaG9vc2UgdG8gdXNl
IHBob3NwaG9yLWlwbWktZnJ1LiBIZXJlIHlvdSBhcmUgcmVzdHJpY3RpbmcgdXNlciB0byB1c2Ug
ZnJ1LWRldmljZSBvbmx5Lg0KDQpXaWxsIGV4cGxvcmUgbW9yZSBvbiBwaG9zcGhvci1pcG1pLWZy
dS4NCg0KICAgIHBob3NwaG9yLWlwbWktZnJ1IGlzIG5vdCBjb21wYXRpYmxlIHdpdGggSVBNQiBG
cnVzLCBhcyB0aGUNCiAgICBzcGVjaWZpY2F0aW9uIHJlcXVpcmVzIHRoZW0gdG8gYmUgZHluYW1p
Y2FsbHkgc2Nhbm5lZCBiYXNlZCBvbiB0aGUNCiAgICBTRFIuICBJIGd1ZXNzIHlvdSBjb3VsZCBo
YXJkY29kZSB0aGVtLCBidXQgeW91J2Qgc3RpbGwgaGF2ZSB0byBoYXZlDQogICAgc29tZSBhdXhp
bGlhcnkgImRvZXMgbXkgZGV2aWNlIGV4aXN0IiBzY2FubmluZyB0aGF0IHN0YXJ0cyB0byBsb29r
IGENCiAgICBsb3QgbGlrZSBlbnRpdHkgbWFuYWdlci9mcnUgZGV2aWNlLiAgSXMgdGhlIHVzZSBj
YXNlIHlvdSBwcmVzZW50IGENCiAgICByZWFsIG9uZSwgb3IgaHlwb3RoZXRpY2FsPw0KDQogICAg
Pg0KICAgID4gICAgICAgICAgICAgICAgIEZvciBzY2FubmluZyB0aGUgL2Rldi9pcG1pLSogbm9k
ZXMsIHdlIGFyZSB0aGlua2luZyB0byB1c2UgaXBtYi1jaGFubmVscy5qc29uIGNvZmlnIGVudHJp
ZXMgaW4gZW50aXR5IG1hbmFnZXIgcmVwbyBzaW5jZSB0aGlzIGNvbmZpZyBmaWxlIGhhcyB2YWxp
ZCBzbGF2ZSBwYXRoIGFuZCBidXMgYWRkcmVzcy4NCg0KICAgIFBsZWFzZSBkb24ndC4gIEVudGl0
eS1tYW5hZ2VyIGlzIGR5bmFtaWMsIGFuZCB0aGUgY29uZmlnIHNob3VsZCBiZQ0KICAgIGJhc2Vk
IG9uIGEgZGV0ZWN0ZWQgZW50aXR5LiAgTWl4aW5nIHRoZSBkeW5hbWljIGFuZCBzdGF0aWMgdXNl
IGNhc2VzDQogICAgaW4gdGhpcyB3YXkgd291bGQgbWVhbiB0aGF0IHdlIGdldCB0byByZXdyaXRl
IGFsbCBvZiB0aGlzIHdoZW4gd2UgaGF2ZQ0KICAgIHRvIHN1cHBvcnQgSVBNQiBhZGQtaW4tY2Fy
ZHMsIHdoaWNoIGFyZSA5OSUgdGhlIHNhbWUsIGJ1dCBuZWVkIHRvIGJlDQogICAgZGV0ZWN0ZWQg
aW5zdGVhZCBvZiBoYXJkY29kZWQuDQogICAgSWYgeW91IHdhbnQgdGhpcyB0byBiZSByZWxhdGl2
ZWx5IHN0YXRpYywgYXR0YWNoIGFuIGV4cG9zZXMgcmVjb3JkIHRvDQogICAgeW91ciBiYXNlYm9h
cmQgY29uZmlnIHRoYXQgaGFzIHRoZSBpbmZvcm1hdGlvbiB5b3UgbmVlZCAoaWYgeW91ciBJUE1C
DQogICAgZGV2aWNlcyBhcmUgb24gdGhlIGJhc2Vib2FyZCkuDQoNClJhdGhlciB0aGFuIGhhdmlu
ZyBoYXJkY29kZWQgY29uZmlnLCBjYW4gd2UgY2FuIHNjYW4gYWxsIGF2YWlsYWJsZSBpcG1iIGRl
dmljZXMgdW5kZXIgL2Rldi9pcG1iLSogYW5kIHNlbmQgcHJvcGVyIGlwbWIgY29tbWFuZCB0byBn
ZXQgZnJ1IGRhdGEuDQoNClllcy4gUGxhbm5pbmcgdG8gaGF2ZSBkeW5hbWljIGNvbmZpZy4gQWxs
IHRoZSBpcG1iIHRyYW5zYWN0aW9ucyBhcmUgaGFuZGxlZCBpbiBJcG1iYnJpZGdlLiBTbyB3ZSBh
cmUgZ2V0dGluZyB0aGUgaXBtYiBidXMgZGV0YWlscyBmcm9tIGpzb24gZmlsZShpcG1iLWNoYW5u
ZWxzLmpzb24pIGFuZCB0aGVuIHdlIHdpbGwgZG8gYSBzY2FuIGluIGFsbCB0aGUgYnVzZXMgZGVm
aW5lZCBpbiBqc29uIC4gIFdlIHdpbGwgdXNlIGlwbWIgY29tbWFuZCAoUmVhZEZydUluZm8pIHRv
IGdldCB3aGV0aGVyIHRoaXMgYnVzL2RldmljZSBoYXMgdmFsaWQgZnJ1Lg0KDQoNCiAgICA+DQog
ICAgPiAgICAgICAgICAgICAgICAgUGxlYXNlIHNoYXJlIHlvdXIgY29tbWVudHMgaWYgYW55Lg0K
ICAgID4NCiAgICA+ICAgICBUaGFua3MsDQogICAgPiAgICAgS3VtYXIuDQogICAgPg0KICAgID4N
Cg0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUg
Y29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRl
bnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFp
bCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZy
ZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwg
ZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1
c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9y
IHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkg
bGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmll
d3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVs
eSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhl
IHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2Yg
cmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmlj
YXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ug
d2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50
YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5k
ZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVu
dHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
