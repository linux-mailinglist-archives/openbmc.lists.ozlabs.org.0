Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B785E2C0060
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 07:57:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfdJ90Lc8zDqLT
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 17:57:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.92; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=CRYG9KPA; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=CRYG9KPA; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310092.outbound.protection.outlook.com [40.107.131.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfdH562HPzDqLM
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 17:56:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn0/b15kBg6z/eOeSW9adFlUkvEVEqPp2bSIUmpD1cE=;
 b=CRYG9KPAhnpqQI3/PsA2J/8SpY3vx044nTafNCYLh7qfvIdmh+LDyt/4ZvcoAFKlIAgh+2b040V7/SC6ObwcwUli1tZKWGD1cIeE1ciRVJvI9gAaM9qTjgIYY3jzOx7DaLXu2G69h09r0xyiURTnAMW3sDI3FJmbgh4KN3rl1IA=
Received: from SLXP216CA0050.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::12) by
 PS1PR0401MB1977.apcprd04.prod.outlook.com (2603:1096:803:c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.29; Mon, 23 Nov 2020 06:56:22 +0000
Received: from PU1APC01FT019.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:5:cafe::2e) by SLXP216CA0050.outlook.office365.com
 (2603:1096:100:5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 06:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; gmail.com; dkim=pass (signature was verified)
 header.d=HCL.COM;gmail.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT019.mail.protection.outlook.com (10.152.252.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 06:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvFxy0r5Si+7rBHUWVZKaTkC95p8HlJ8i2iF9j2tLktBV6SuZX0qBms9ApEjDmTo9zHP+BiTQiU73K8AJYtck7y39GqJvEYM2cS0W0HPcM2lMnNYBqyUUlVnYrOIZTRqBCMWwa0EPgdED3ekP7Vq+/mbW2hrEhWXTL/mLaa61S2F6KYnptHvaHMXlhBmXwOHwZwMXgKoP/qiwgFgpwEHu+qemMgHwpElQExJ9LQV+pGetkIKIJMOUgxNykbLhCk2skkj9cCGZ3T86UXHHts47zaxdwrraACB4QDjP/63fDni9zMsrLtMXCSHvmF8Wt4BJKLA9MtgvSlaUQ1B1SyPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn0/b15kBg6z/eOeSW9adFlUkvEVEqPp2bSIUmpD1cE=;
 b=fKC/O4GRYzSd54CLq4eO7oLOVji4gW6HEF/FTwBFMz4WmD/o/VfzT348mDyNskIHEvwI9cGbh9nUhzBnps0m80iaifiQ4z7qBmTTDEEyGUkMioJJ+BBsyVW7Mk/u5kbQH1KiLDDFRAwB6VNKJqX4JsfMqh1Kxe2pkBj89BuOjgFaVBl04a+zKNY+UbGq+7hy0SobRbT1MoqxxnDiHOJQ1n32DfT221xxqsLeJX1DDo7CE4yHHqVPbRFyugKQocQ1+TGduwyysvp1ha/lcR0zErbL1/3m04P5KEBvA8MLXjJW+L/LACbI1f8T1qABhZghf7P2yf1gqLBAh04gM5rXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn0/b15kBg6z/eOeSW9adFlUkvEVEqPp2bSIUmpD1cE=;
 b=CRYG9KPAhnpqQI3/PsA2J/8SpY3vx044nTafNCYLh7qfvIdmh+LDyt/4ZvcoAFKlIAgh+2b040V7/SC6ObwcwUli1tZKWGD1cIeE1ciRVJvI9gAaM9qTjgIYY3jzOx7DaLXu2G69h09r0xyiURTnAMW3sDI3FJmbgh4KN3rl1IA=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3772.apcprd04.prod.outlook.com (2603:1096:4:a1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Mon, 23 Nov 2020 06:56:14 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29%4]) with mapi id 15.20.3589.024; Mon, 23 Nov 2020
 06:56:14 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Artem Senichev <artemsen@gmail.com>
Subject: RE: Boot Order in Redfish and DBUS
Thread-Topic: Boot Order in Redfish and DBUS
Thread-Index: Ada/GHipV90cO13xRsGWrbeHoNjQ3gBDwNbgACnl/gAAJCrzkA==
Date: Mon, 23 Nov 2020 06:56:13 +0000
Message-ID: <SG2PR04MB3093D18983E984C7B5A0B013E1FC0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB309381BFAE06A3462E57E0C6E1FF0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB30934A3A567C8025C3F72F4FE1FE0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAHsrh9JsuPkWZvh13MYSVwCKFtctiMRxv1Sk0X0rx5Duc=AvMg@mail.gmail.com>
In-Reply-To: <CAHsrh9JsuPkWZvh13MYSVwCKFtctiMRxv1Sk0X0rx5Duc=AvMg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNGU5NmI0OGEtMDI4Zi00ZjEwLTk5ZjItZmZjMzljNmVjZmZkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWm0rbmtteFc4RGpRRHJxTlZPVkY4OWUyb09wXC80RnV4VnRsZGJteDR5RWFaUkg0Q1lZeExZdkQyakd2czBmaEsifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:50e:6b65:91ee:ba:e012:1822]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d88f2b25-68a7-4474-e9a6-08d88f7ce337
x-ms-traffictypediagnostic: SG2PR04MB3772:|PS1PR0401MB1977:
X-Microsoft-Antispam-PRVS: <PS1PR0401MB19773359891E69DCCA7695FCE1FC0@PS1PR0401MB1977.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ysIfl0pOu5ZZ5zEOS21jfVBj5Fu8oSw55Kws37fzIDf3gF2o41k/3YU8TdkMg2+ifs00kbviwCiumaKZAj4zyJt77ui8k6nYUt2vOkcX2RL2m3uu8rEussDGdrd8bW2Ux48bWW8fg0XPzJ9ANcZ4Yp3eA1za6o0zRQESM9YNJqSinJSR1CnsfHtqHOAmjvTTxjZXjGTi/yFx3+JmEWIuUpVpO2qy41zcjqDKj5Q5N9smaJVzghJNee8jLowt1fToWFgPKIeP2D4xMaGFIadYsVSiSOodtXBlljAsZU4oUl44GxrT2vGvaJ7C19IEZuEhWWw2oV+5Y9Gt9n5s6uwrRX0ZCz5bZd4fQ90V4O4i5v6a/sBC0iJClxdhvimXT023LhgEViWda36bt8ybf27IuQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(66946007)(64756008)(66446008)(66476007)(83380400001)(53546011)(6916009)(55016002)(316002)(45080400002)(52536014)(76116006)(66556008)(478600001)(8936002)(33656002)(6506007)(5660300002)(7696005)(4326008)(2906002)(966005)(9686003)(71200400001)(186003)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N3VJa2p4blZ6QXhjTGhib24xR1lGZnE2d3I2K1BZRTIrNXlJV1pPZkdYTzY5?=
 =?utf-8?B?eVdXdWkrZC9rZWFRdXA1N0VEaWRlRjJFWS94T01jMUdhVm1FUnhteFFQVnVG?=
 =?utf-8?B?ZVF1OUNuOVN6YWlCV21GOWlyR3EvUDJ5K1Fjcno5L1oxSnJGOEsyQnRDUUIw?=
 =?utf-8?B?Q1lhdzlub2xMalBSckFTN3VaZXlNNVpJRkJlYmZycExLTlE4NTNuUlZwYzFa?=
 =?utf-8?B?cXgzSGRHd0dueWZhRlZueFpkSDNyNUl6RWcrMkdudHJITGV6OXM5dlI0Qzg0?=
 =?utf-8?B?R2dEa0R2QmZYOGJLQndkdXR5MXViNGlMdVZxNUxCSzljVm8xRTF6WHoxWXJ5?=
 =?utf-8?B?WDRrUmFTaUllWUQxK0YzaHNQM29yRXRYc3hBd25VV3RMKzRBMHRTSDZrQVRm?=
 =?utf-8?B?NDV6OVZPajRxaExyMERKVGZRbDNBeDZqSVJmRmVzeFJNdTlra3ZWTWJ6Z0RC?=
 =?utf-8?B?RktuT2I1ZlF2RFVwcHF3c0t6ZmhMajd2S2FFdzFaWnNrRHVQYno4djFpY2g4?=
 =?utf-8?B?NWN6TnUvdDZxTHlWd1BPR2YwSHhtR1FiWEwvZy9yOG10dWgwbTM4Vi80U0xU?=
 =?utf-8?B?QkdwL29qTzg1cG5OUnkxVGtSeHYyTzVwbU1VaTRVNUZlWXZzQkhxcHFlczdH?=
 =?utf-8?B?bUo0TEZweC9LY0hDRG45cWN6ZWIzZCt0ZE13YzZtaVFabXREL0RGcHpqaUlD?=
 =?utf-8?B?WTI3SnRzaHdtTFdJQWpEdHIzSWxNdC9BRkVZVndpUE5mdDh3QlNjakdiZ0xv?=
 =?utf-8?B?Rm5DTjI4MjlhMDZ0U1U3cEpLTVR1dXJtMmVHS21yYUJxZ1U0QXdHS0tHK25P?=
 =?utf-8?B?OUM3a2xuQWhPemhGam82RFdTUTNGYjMxdVJiUkJqbDVQUmxwTFkyNGFOY1Zw?=
 =?utf-8?B?djNRalJQWUN5MytZK1NnaTFpWndLRlhzVlV1bkRNSXdOYUxiRkZEMkZwV1dG?=
 =?utf-8?B?ZU1LRzhEN3hLNjNqdHp5UFh2NGdRblNYTXplZkM5Y0pKMmVxREFxTTZLRnYz?=
 =?utf-8?B?aERMMkRVdEdDaStBakM4SkJXTUV3K1JEUk12YUVGcTFMMFhLN0RDRk1KeExn?=
 =?utf-8?B?OGZpOTArdUJLa0xBVjRsQ3JVTk8wc0x2YThGdWlsbERESk5pVFRvVXROWHNh?=
 =?utf-8?B?RWYvemlwSW1Hd2lEK2VHWnpwSG1DSkRsUTRjS3p0ZlBGcGZsUW5ZWW5DSmFE?=
 =?utf-8?B?aFdjUldPdTk2OURVa0ZLMGpFUkRrZFprODBiY1UvZmkzbDVoamYwNmpDMW5W?=
 =?utf-8?B?cUs1bTV2VDNRdXJyb0hKbU9yZ2VJUC9GV3YvTDdmOWNCczJiZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3772
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT019.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 784a3c3b-b2ee-4c11-1acc-08d88f7cde4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPVn6bzo4fDF0nRNArIXN5EiU8rBMmIuWpZABl4QUvh7wixR3UahRoYzJuU0ib4PnNLRvv7n6sXfK8qbvg2Z1Cdu4IGwnqhiRRSGVkWZ43DagfcqdG9vWbzjagK5tmNWixipMMIwM0GQCsFCFR9siR5swmUtdv0KBwgSX4UalDHIeINMql1EKrDagGcg2FVJP5qg8mSu5Wa1yHVOqW6SiBblYtw/SWeo2NusnPX+b6DjdQ3eW0B1Fr15FDtZ/RaauhjUCe0phhCTmUtHbKTvLFmV+TcFmGXWGkfF1grLgQmQnnrMUxKxI66c0s8UEBDulwB8PewhyuSt7B4imw3uGUodrDyN9peArLV+3aF6g/bIHGqhiQGD3m8U2WMqlfV39G426lh0bB5t7q28nmv8Smp5Spf5sKliuxv35IbnU3Txo190EpwGbCfg1uC349rnT7LM9d40ESlZg0rFd3xOK87uQ6Hb3VizNtLDGs96hAk=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(52536014)(478600001)(36906005)(966005)(70206006)(70586007)(316002)(7696005)(55016002)(9686003)(33656002)(6506007)(4326008)(53546011)(186003)(2906002)(26005)(336012)(8676002)(6916009)(45080400002)(5660300002)(8936002)(47076004)(81166007)(86362001)(82740400003)(356005)(82310400003)(83380400001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 06:56:21.0760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88f2b25-68a7-4474-e9a6-08d88f7ce337
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT019.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB1977
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

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIEFydGVtIFNlbmljaGV2LA0KDQpUaGFua3Mg
Zm9yIHlvdXIgcmVzcG9uc2UuDQoNCkluIHBob3NwaG9yLWhvc3QtaXBtaWQsIGJvb3QgbW9kZSBh
bmQgYm9vdCBzb3VyY2UgZGJ1cyBpbnRlcmZhY2VzIGFyZSB1c2VkIHRvIGdldCBhbmQgc2V0IGJv
b3Qgb3JkZXIuDQpJIG5lZWQgdG8gZGlzcGxheSB0aGUgYm9vdCBvcmRlciBzZXF1ZW5jZXMgKCAi
VVNCX0RFViIsICJORVRfSVBWNiIsICJTQVRBX0hERCIsICJTQVRBX0NEIiwgIk90aGVycyIgKSB1
c2luZyBkYnVzIGludGVyZmFjZXMuDQpJcyB0aGVyZSBhbnkgb3B0aW9ucyB0byBkaXNwbGF5IHRo
ZSBib290IG9yZGVyIHNlcXVlbmNlcz8NCg0KUmVnYXJkcywNCkpheWFzaHJlZQ0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQXJ0ZW0gU2VuaWNoZXYgPGFydGVtc2VuQGdtYWls
LmNvbT4gDQpTZW50OiBTdW5kYXksIE5vdmVtYmVyIDIyLCAyMDIwIDY6MjggUE0NClRvOiBKYXlh
c2hyZWUgRCA8amF5YXNocmVlLWRAaGNsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNClN1YmplY3Q6IFJlOiBCb290IE9yZGVyIGluIFJlZGZpc2ggYW5kIERCVVMNCg0KW0NBVVRJ
T046IFRoaXMgRW1haWwgaXMgZnJvbSBvdXRzaWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5
b3UgdHJ1c3QgdGhlIHNlbmRlciwgRG9u4oCZdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIGFzIGl0IG1heSBiZSBhIFBoaXNoaW5nIGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJ
bmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZSB5b3VyIENvbXB1dGVyLl0NCg0KSGkgSmF5YXNocmVl
LA0KDQpBRkFJSyxPcGVuUE9XRVIgc3lzdGVtcyB1c2UgZGJ1cyBpbnRlcmZhY2UNCnh5ei5vcGVu
Ym1jX3Byb2plY3QuQ29udHJvbC5Cb290LlNvdXJjZToNCmh0dHBzOi8vYXBjMDEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZv
cGVuYm1jJTJGcGhvc3Bob3ItaG9zdC1pcG1pZCUyRmJsb2IlMkY1MTViYzM3NWNiOGRhYWVlOTgx
YmFlOTdmYTdhZTgwZTdiZjY1YzYyJTJGY2hhc3Npc2hhbmRsZXIuY3BwJTIzTDE3MjAmYW1wO2Rh
dGE9MDQlN0MwMSU3Q2pheWFzaHJlZS1kJTQwaGNsLmNvbSU3QzA3OWI1YjViMDhlMDRmNjE0NWQx
MDhkODhlZTYzZWU2JTdDMTg5ZGU3MzdjOTNhNGY1YThiNjg2ZjRjYTk5NDE5MTIlN0MwJTdDMCU3
QzYzNzQxNjQ2NjkzNjYzNTc2OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mx
MDAwJmFtcDtzZGF0YT1aMWhjMlJiVEd5MDRWRTZHOWd3ZjBSME9LQWVQMFZaZDV1M0RIS010blNF
JTNEJmFtcDtyZXNlcnZlZD0wDQoNCi0tDQpCZXN0IHJlZ2FyZHMsDQpBcnRlbSBTZW5pY2hldg0K
DQpPbiBTYXQsIE5vdiAyMSwgMjAyMCBhdCA5OjM2IFBNIEpheWFzaHJlZSBEIDxqYXlhc2hyZWUt
ZEBoY2wuY29tPiB3cm90ZToNCj4NCj4gQ2xhc3NpZmljYXRpb246IEludGVybmFsDQo+DQo+IEhp
IFRlYW0sDQo+DQo+DQo+DQo+IEkgYW0gd29ya2luZyBvbiBCSU9TIGJvb3Qgb3JkZXIgaW4gbXkg
ZW52aXJvbm1lbnQsIHRvIGdldCBhbmQgc2V0IHRoZSBib290IG9yZGVyIHNlcXVlbmNlLg0KPg0K
PiBIb3cgdGhlIGJvb3Qgb3JkZXIgc2V0dGluZ3MgaXMgaGFuZGxlZCB1c2luZyBkYnVzIGludGVy
ZmFjZXMgYW5kIGFsc28gaW4gcmVkZmlzaCA/DQo+DQo+IFBsZWFzZSBwcm92aWRlIHlvdXIgaW5w
dXRzL3N1Z2dlc3Rpb25zIG9uIHRoaXMuDQo+DQo+DQo+DQo+IFRoYW5rcywNCj4NCj4gSmF5YXNo
cmVlDQo+DQo+DQo+DQo+DQo+DQo+IEZyb206IEpheWFzaHJlZSBEDQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMjAsIDIwMjAgMjowOSBQTQ0KPiBUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQo+IFN1YmplY3Q6IEJvb3QgT3JkZXIgaW4gUmVkZmlzaCBhbmQgREJVUw0KPg0KPg0KPg0KPiBD
bGFzc2lmaWNhdGlvbjogSW50ZXJuYWwNCj4NCj4gSGkgVGVhbSwNCj4NCj4NCj4NCj4gSSBhbSB3
b3JraW5nIG9uIEJJT1MgYm9vdCBvcmRlciBpbiBteSBlbnZpcm9ubWVudCwgdG8gZ2V0IGFuZCBz
ZXQgdGhlIGJvb3Qgb3JkZXIgc2VxdWVuY2UuDQo+DQo+IEhvdyB0aGUgYm9vdCBvcmRlciBzZXR0
aW5ncyBpcyBoYW5kbGVkIHVzaW5nIGRidXMgaW50ZXJmYWNlcyBhbmQgYWxzbyBpbiByZWRmaXNo
ID8NCj4NCj4gUGxlYXNlIHByb3ZpZGUgeW91ciBpbnB1dHMvc3VnZ2VzdGlvbnMgb24gdGhpcy4N
Cj4NCj4NCj4NCj4gVGhhbmtzLA0KPg0KPiBKYXlhc2hyZWUNCj4NCj4NCj4NCj4NCj4NCj4gOjpE
SVNDTEFJTUVSOjoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gVGhlIGNv
bnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50
aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwg
dHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVl
IGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRl
c3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNl
cyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3
aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxp
YWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdz
IG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkg
dGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2
aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJl
cHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0
aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdp
dGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0
aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVy
IGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRz
LCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
