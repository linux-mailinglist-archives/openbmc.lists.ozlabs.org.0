Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF939B196
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 06:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx9Cg0ysDz303y
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 14:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MDAMmj0q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.130;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=MDAMmj0q; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2130.outbound.protection.outlook.com [40.107.220.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx9CM36cRz2xZL
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 14:44:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtsVDjGOD2WUnfacgpamm14IVoLIK5wR8dzFDx30dqGcaxE0Q4hn5g5D3Ou4vdlNy5VTNLwoDVifotAArR/bEaqxbLiw237DYA2CEwVo8JKdmJJXrPkriOspKTGP/hEi8BiTVgvbmc2a+u/AxbUYxp7MZQnDUITNw6+viCv4hqYIJqmuazIes6EQSbYh3Y0jvOeq6HNaiF/dKCyAHL5YRl7Ry9vTpy8wgWlFemZFoQwjmqNSPO5SqhkLQ55bO22fh2g4URWCpBCsMtkUh55/ZhwHk3Jg2w1G4BWu8Ir+sirquR24jFfZVjA8xpNjEhx90hv9AuaLYAXadjKUWyUbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ7+61N4YH4FNXCWun58amR2pZhx+3YDOPG+hOdyKk0=;
 b=NH3weXtWa53P1c/aKSu/NrGpBOqmilf3ZvbDVZaIwAqAYkzZzvUbfVhkE8xm3LUmG7AZkX5kZjnuofxXV/grztSZJhdTLeicmvYSqhmFfiuDFHtmpuzCuWbZzoYalfbViSmT1qA656rxTDKr1XWHSuPKoT4IP+eF6tdvsju5Ueovgucc9lVyxOJfYuJejm8X15SNrw54dfFyAzsla8C9vo9iU3ioJ3wFUoCLtS5s+6ERa7w34iuTXfkqGfkKVXljk456jvG1k68LIH4HQ64YlhGxfUWH/mvBlzR0Do7EpNnhRWFO82qswHu4AptDgZwt8qbXDyxG48FBqaUTD/7ySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ7+61N4YH4FNXCWun58amR2pZhx+3YDOPG+hOdyKk0=;
 b=MDAMmj0qaXGuATOvl5UXLLax8E6EO2QbmJ0/p3vwFU8gXXzaJGYOkQA9Xq0DF0Gy3xs0dPT8TIlBUlQyvWlm6wwzlzdOqwHrmzZmiioDe4xGyChyiKxok10dlhkLqkZFKNlSeQbgJ8/cMOyqAoyNg6z54gUzLt9tjXnZ+gueJQs=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY5PR01MB6036.prod.exchangelabs.com (2603:10b6:a03:1c0::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.27; Fri, 4 Jun 2021 04:44:04 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314%7]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 04:44:04 +0000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Any relationship between FRU data and Redfish's Systems, Chassis and
 Manager?
Message-ID: <e51c36ee-b8f4-36e4-5024-653b27081b28@os.amperecomputing.com>
Date: Fri, 4 Jun 2021 11:43:50 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.208.114]
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.208.114) by
 HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 04:44:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde26264-bc26-4feb-283d-08d927136158
X-MS-TrafficTypeDiagnostic: BY5PR01MB6036:
X-Microsoft-Antispam-PRVS: <BY5PR01MB603691042C77C1AE79B11D628D3B9@BY5PR01MB6036.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FuBUApcpXVmZaFZKtE++uoYOT4cf+/hbj/tOILx4ixiUdXhcSjE0k/VTMpU1Pr1lBUeas4RyzRRqxRqy5D71twYiGcQXjAxMXpuW1e0rfnwVNGdfHZCg4bQVa9MdckwN004cp2hjsUsON7hfgKyvgUmI7ijq0qoqNCaMTkoAO9a3KgUgb+4SBoVaCEAFSTkRmZVIlH/fGzr7pXHMzaT1NOaZV2G1jSoRTY5LZBslx8KznABqavaCrrDoABANsXATN6jWLKwYD2c8Ao3UVTXXgHiFIUDI90tW1mirO8nAyFeGgM2sKuqOxu088VJUzBLIe+OkTUgde+Mq1duG33DW1yzGgg+6sm0VkTgxPSwPajTzbePXntuNdn4RI2WEq6j6PJuxmH00O3dd5wLCJXv8ROpugph9sqdqn8puYHdU17Xs+VTy/ItDZj031j4L4kLj2noY6g45jhLZjxkAt5FkOQKDGKyKvKX1R9NsfACcD6S1px+BboZ2Z1T1L5OIB9zRJPhJTtS3qgIkt0KhCFpL6YrKyVcN4jYJuosQGfv8vnXFx+MHzlhNvadSYZNy2zSmVAejCcPAosODIUgPJqw9v7L2POxb34j0eyUQeBtrqh8A038y5x6KbAW9xNXQGWYXtGRXSNA7BlygDwlCPsOPTAeHgnoqJbMZ4+FfKw8AMITX5ZmA2CcqseFyYKnMbl0ExgLMb3Ss9q0rXYsbLJXom3fZANVwPnM6rBaqsOQL3IvOngTiNzBIy+Rq5SQnYRo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(396003)(366004)(376002)(346002)(5660300002)(478600001)(2616005)(31696002)(86362001)(31686004)(956004)(316002)(186003)(6666004)(6512007)(8936002)(6486002)(38350700002)(38100700002)(66476007)(66556008)(66946007)(8676002)(2906002)(52116002)(16526019)(6506007)(6916009)(4744005)(26005)(36456004)(42976004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlYxNERab1ozTzFqRHNsNFZHbUxyV2dXQXIxQmdlazFPK1R6azVBUys1ZjVv?=
 =?utf-8?B?WEoxbUpYdnZpQkNUMTFYekYzNjhCald1N2Y4cUZGZEljVzh1WUNoZmdUTHZ4?=
 =?utf-8?B?YlhJam5MODJPT3NtbE5JdExrZzYzY3YxVUJlaUFPQUZCNWFuaHpVZnU4K3lT?=
 =?utf-8?B?UDhjNDQ1SVpVbUxPSkpSYUswY21uUFVuSVRJQXI1eHJ6Vy9rZ0hPRUxJOGpk?=
 =?utf-8?B?OE9CSHJIQ3BhYWxrUGtkaXR0VXgvL2tGaUhUT0dlSDFMaWFrVDVLazNibVU5?=
 =?utf-8?B?SUVWaG9YckxPMnRCc0UwMEpiM0tkRXY4a3loMWs0dmFpRWhpTGxERGJWb0Jl?=
 =?utf-8?B?em8wSS9nVVlxQ09wdCttQ2ZPS2VqcDRURDhDVXMxNzJYTHhKSjExMXF4UWZo?=
 =?utf-8?B?bUZaNE9ZNjBKWFpyQUtJSEdXT2dZc2RqRTl6OXJESlZoWmJnLzVsQUVINWJM?=
 =?utf-8?B?WllmWUcxVkpyQURJdU45VGtkdDlYTWQ5S1lPcFRTZ1ZvaXRRRTJoRzlMSjlO?=
 =?utf-8?B?ZkgwU09yTnhGUzNPL2N0UGZFSHJFc3dBZW1lSm10NkVrakpQYXhYUW8yY0VO?=
 =?utf-8?B?aWtwU2tNdTIzQkdadmdTaXlKSGJyR2Jlci90YWNlRjhSa3dxN21meHNSakFM?=
 =?utf-8?B?Y2FKOTdEWXJML3l4ZVh3QjVrOWZVN3RsN3JTVmpQUkhwdDRmOWZHcE5sbTVs?=
 =?utf-8?B?OFFyMjl3a3lXWDBDNm9VeTM1VkZ4eUx4S2dFWGxSMGV3dzZRK21rRnRnTnpX?=
 =?utf-8?B?MzJZM0NPUDdGcmNBSWszb25NTnpmVVU4dldDT3BsQWJjU0FjSGt0MTdmTUZR?=
 =?utf-8?B?NmJOWnZpNjhNUDNuR1dhVURvb1ZCNHBFd3ZMRXRhMkxUM3VHYi9yUkNxOS9j?=
 =?utf-8?B?dUFkZVlHWWR3Z3orMzJxWTVuMDV4UTA2QlpMQ1dmZVRVekQ5SE0rR3g1QmVx?=
 =?utf-8?B?ak8xdWo3UURPQXZTZG5GelZqcmhrVUxrNlV3aDBCQ3pJRlhERmJCWGU1S0g5?=
 =?utf-8?B?RkxpV3FKWi82MEVkcmlING1ySTJRVWNzT0pWcXlGMGFHK2s3UzJlSU9SbzZq?=
 =?utf-8?B?aXl4bzk0RW9PbGJQNDREaG1obG0vRGlJbzVPaXl4bmxOaGxieXdjVnlrdEZh?=
 =?utf-8?B?bEE3SUZEb3pMdXUrZHNFRlRwMW13enR4cVVZeUJYMXpLYVJEOFhrRUZ4a2Nq?=
 =?utf-8?B?V05RN1gyRytySVI3d2Y2MUwwanlRUTNKZDNoMjB3aXZNZ2FxUVQ2SWpiRzlo?=
 =?utf-8?B?NTJ1MDBqcVdvbC9TZ3BiYzYvYXY3MHYrcWVEYkR3NEU0SXpuSTQ2MC9wUWZD?=
 =?utf-8?B?Q1QxYTFQK2JzMXlOYjZUODdXMWM4ZlZyUkRHOHFiaFpkSUtMV0ppSHRUU0cw?=
 =?utf-8?B?VExpSVppZHFZOVFhaU9VSEQ1bXBlTkgxUCttMktiUTJHUlAybmpLampoMExU?=
 =?utf-8?B?aEEzTFNwN21KcEFwRzRKK1pxekkxRHJMNXFkcjNYa3JQR1Y3TXFUMVp0Z3l2?=
 =?utf-8?B?Yy9rVWhPZDJCTi9vN0Foc2gyb1ptYmlBakY4YnlnZklNQmlFNnNnb3lqTnkx?=
 =?utf-8?B?MmhZU29oUjkveUh6dWhwY1NuK2RWenVXSTFENTRDUERrUlZxUThzeVNKenp5?=
 =?utf-8?B?dkp5MVd1N252WDM1NW5QSXlGZHQ5MFQxQ29mVEhxdDErbS9LNllDWWdDU2Fw?=
 =?utf-8?B?anBpaDZhL0tjVWptRGZvWEs4NEhmMVpjRTdTVDB5cEFCUHloWDJlSHlSb0t6?=
 =?utf-8?Q?G/t6f1Lo0gh3c4Gb1mwHyYyJuQ+ivbg0DD2DSSc?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde26264-bc26-4feb-283d-08d927136158
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 04:44:04.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4xNvQ3OoCFBHYbtbWBNzjDaKKBMfY9JuF0U24xZTrTK1Dm1Ve4kJkjciJ9/B5kS5QO8eWERcB+8oJYyC+3FzQEVqv5bA9j4tgcqY+ias0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB6036
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

Hi,

There are 3 sections in FRU data: Board, Chassis, Product

In Redfish, we have 3 schema: Manager, ComputerSystem, Chassis which all 
have Manufacturer, PartNumber, SerialNumber.

Is there any relationship between FRU data and Redfish schema above? I 
just see Chassis has Part Number, Serial Number from FRU but 2 other 
schema do not. Where to get data for the Manager and ComputerSystem schema?


Best Regards,

Thang Q. Nguyen

