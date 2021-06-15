Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C63A75B6
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 06:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3w816LCWz307b
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 14:19:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=To2YDyun;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=To2YDyun; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3w7h2vsBz302V
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 14:19:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vye2g9QAc4nK2W4SX2GPuo92QthRNEbSKai2TnUSj0UP3SSM1qv1CVjMygfjRh/uwn3Jcqc2YA1fwPH8WVhVsK6NSvGk4+nER5Wf9NqnHuwW3FFe78P7QRg0Z4avlvVtZBavIjPvXHuG3YdvuTZ7B2+9ZdH0HHJe+J/vLvzfGomvqSrhenX8jSh7jYViKZcuTc2Cb/pZypVsvWdrCImbZCl32++fI2HOPKsNS0Z8FbRTXw7uMbazEa4sDkGM/0w/0Y3uBz+ShtptgiM7Y8g8CWVq4isg2EwZ5peCf/BPBq5BEl3ooQiVWSlmhPAgbeEnQVrQW55qfWP4F7ekLSYJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2EsSl6rIJeFkGXrWu9Z/F3UquFWCrtOdcnKb4hP1B8=;
 b=cy1CE1UWPl9lrn1MYphpsKnDKXRpbrctQNgsWHp6OqbzQ66Y0ku8nUiyfeRIWae20B5BMaZ5BkesyBwvWC9tgTVEo9JDZQeW/O588Wgq2JtPHTk5gW7UuHF8vuH2y0Qjf/ZsHq0Qq4EGMY4+k/LYBIyjsNSWuNGEHetvEHKACioCOF7gSHF1ONM5CcyKolugtcFw8XmcmkM9GHocwnBUG2TwZhsSsY763vxqqZ0s4hNNFoWzZkCOoFM2iCL0EsVCsTNjgDJzViCWO37OiTiwdwtqfhHteWztX0b2iuYeKewqh3dYXr2+BsuMglRLN3SsDrzNTfedpjTYObOsN9eF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2EsSl6rIJeFkGXrWu9Z/F3UquFWCrtOdcnKb4hP1B8=;
 b=To2YDyunNmurJJs1lOvx0ZbOZUv6LCc2uAQk1gmkXPLm4Il9tneaxtzDsXlj7BTs6uDIY+7CAHXdqsFMC+x7yeAE1ZYi4ZrqUvxp/9RCu43OlqJHjoEVDVghFe0UeRqVl7ZP7p5Ku5CPkQdHvHGI6L8wpP2/pC6nuV7BTtonS+4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 SJ0PR01MB6477.prod.exchangelabs.com (2603:10b6:a03:29b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.25; Tue, 15 Jun 2021 04:19:18 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314%7]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 04:19:17 +0000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: dbus command to set POSTCode
Message-ID: <dd89f391-87c3-9712-9423-0682fd3b5aad@os.amperecomputing.com>
Date: Tue, 15 Jun 2021 11:19:00 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.55.92.91]
X-ClientProxiedBy: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.55.92.91) by
 HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 04:19:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3607af5-3b0e-4c37-0e56-08d92fb4bdd5
X-MS-TrafficTypeDiagnostic: SJ0PR01MB6477:
X-Microsoft-Antispam-PRVS: <SJ0PR01MB6477AA8D49C8AE16493E71A58D309@SJ0PR01MB6477.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMmMvDqvM0FpszH+7GB4ZjdFFMRC250QCWbOoGjJbjuFxrCrO83pxcriIE6mroqtEtDQEIexPRFW5xxo/VMkQ1rJuoNxuXcZZ76GONG6Mvt3ITrNUbI7Gk6A49+WjAK3gIH4NRZy3n0b19Zq3R5rPZ88JnuWzgKW5axdJ0y07ck8Kccr3F+10jPwRIyKv35sr51bJIrXqBHX/jwBmjxI81ACfErEw6QcvVKEeMFyYnrRo+VApzMrRCvZbyZ/iMbFUaggUHxzQLC012qTNrLaYdMb+qYpPJfgxOG83zJfu3GCjP40eq7/A0iywNW7oLUHj8PwO2HM6n1X+2NhgWgp/cMzXivSd66P1vTeKfPgGrfNP5UykEIKkBggcxsfBmWkA6sv30/FwpJUwzbdH2J3OT6+wTK4PL8CKDmR8tu5xKQowMGygotAKBTybwp7KYT914l10NB6TLg3kFe0KysMSYEYVHov5ULOujBanDYVHeYNpKege/lsuAA5DBBKv8aIx3Y0Tmd/aYbqSkkVAG/rVx8BGWre643NpyJwTADBa2DA+F8beoKzXP/uOf8ulG1zUii/uJBhNOcJi6B4wB0uetR0g1hfZxQD9eixxtx/4t5Ln7pNlnpKBH+SnUW+ct46HZwJjT/B3Xgs493Z0WMQkIptdp3nW3ofSlnANCZYyRCIXuv5CKuOM7bTPIupP3uF9leMqx3z1+1ZpgzxHX7A3xgrEbaIb8kjGol7cy09fJCIuNlIVpDbHNChl6fsRyeJNf9myxfVlXTXZfpjzBDgsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(26005)(478600001)(8676002)(31686004)(66946007)(6916009)(316002)(4744005)(16526019)(6486002)(6666004)(6506007)(66556008)(186003)(2906002)(8936002)(86362001)(31696002)(52116002)(2616005)(956004)(6512007)(38100700002)(38350700002)(5660300002)(66476007)(36456004)(42976004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amNEUU5XMlZFVzhqR1BSZG00ZzE3RytZMlZBc2Ftd09LbGx3S2ljNGNBdHpT?=
 =?utf-8?B?djBZWkRWaW80VjFINFJCaWpzM3FKZmhMRGNHMEE0Y090QkJIb28rQXp4UjVo?=
 =?utf-8?B?c1h4eVg3em90RWtzVjJWQ0ExcTR3OGZ0WFQrWFQ5V2VkZEJmQ1hualNsZm55?=
 =?utf-8?B?WUxyN1I2MFNyNlF5cDRUbG9JZHBkS3d4RkJLWkRuR1ozb3BKbTFHY1AzNndU?=
 =?utf-8?B?QVl2ay82YXh3U0J6aFR2aW9TczFjQTA0MjRQZEoraHIvS3pBT3NST0tBVTR4?=
 =?utf-8?B?UlJiSUZJWXR3SlJGZkJKTU1xWm9jT2U4YkFXSFZEWmpZMXpVVW5MQUZtcm4w?=
 =?utf-8?B?S2FrNlNpME4ybG9ZV0VWWEdTalU0Z0NhTWNDV0pScGczcVVxdVhKeVd1S0ti?=
 =?utf-8?B?d0Q5V2JmZkNvRWRwYXNkWjR3a2haYllMazBlSEYwdzRwQ0h1MkVsT0t1VEV3?=
 =?utf-8?B?cHQ1dGZ1OG41RWpXbWtnNXB4T0QwMm9wQ2hTSjgvblM5TzQ1SkQ4NnJyNDFS?=
 =?utf-8?B?V0VLQ0ppODJWRmEyL0VHYnBhOGdKWG9DR0xNSGt0YnJubjdRUkcrTS96aUkv?=
 =?utf-8?B?b05QRGhHY2ovanhJQWpVZ09RY0laTS94ZmNwb0tSbnNSdXBkYUJ0RWI1WUdn?=
 =?utf-8?B?SUw5OGNCZnNWUFdjUlhPWHBxd1czb3lTVEV5OHRHV29yV3dvUGEwWFp2YTRE?=
 =?utf-8?B?MWZ0b3BGSTI1MHBsdnFiSWZTRlFDWDVPUURIOGt0Z1A0SGJQUXplVlZQdjRL?=
 =?utf-8?B?RG9OTHo1L2VKL0t0dVM4bDU4Y2pWajdmVXoraDUrUGxjSmVxam41Ym1Relpq?=
 =?utf-8?B?WE5DMVJvcC82a2xhN0I1ZUxWUDJXM2RtdERlL0pINUthS0dESUlZOUQ5UUN3?=
 =?utf-8?B?azhndktiUER0L29LVUU0ZWRPSllYL2s1d1VtR0xrcWtFa1lNTklDUFgweCs3?=
 =?utf-8?B?SGxOcERrdkhWUkhIendnbmNpZ3YyWjRjZ0ljZ3ZxQzRkcjYzenJyYXljbkZK?=
 =?utf-8?B?WjFrc2d2c284V25LZDF5Q0l5WEc1NXVpaWhma2JHRFVESHVlekJRenhmZS9U?=
 =?utf-8?B?L2VtWmFUUUZydlpKM1p1dnVQMTEyNWNmdUhHd2Zmd1VsM2M4VTh2MkpkcTV4?=
 =?utf-8?B?ZlMxeUVTM1RYS2Mvb3FnOEpGZUJmcFo4ODNvUndEdDhrSFgzd0l3M1dNVjVp?=
 =?utf-8?B?a3I5Wmh5RnFFTWt6NlBCU0g1eFE5ZVl6K0RZYzVid0NTYURWeTFnejVHZ3da?=
 =?utf-8?B?bisreGJIYU40SG9BUjNTZ0NLSUZRUmF0bHRtVjJPbXZDK21rVkRiK1AzWFMz?=
 =?utf-8?B?VklvbmpaSXlUUTB5OHNYcGFsSXZ3ZlZaSE16enhyUUllNXdhRDlXZmlWcFBR?=
 =?utf-8?B?ZTMvRmtOU1AxUnBSU1kzcmIwd0VUeXhGbHltWi9WdkQveEwrWUc0TzNDTjA0?=
 =?utf-8?B?SGYxbVkzWWVodG1PZDdaU1pXTnZFNEtsNmVTeEg3NUNTTitMWENCNWViSXFv?=
 =?utf-8?B?azUrN0RiMEtLWTRNNkxpLzRNVUF3aXdpaDJaQmpEazRFczR0NHpTN2pRQnBU?=
 =?utf-8?B?UXpEZTVxODVQNWRFTWZ2SXl1NzZNUDBXNnhGQWhPUmRoSlJaZmhGVWh0MUR1?=
 =?utf-8?B?b0t1MEJIcmxqYmF1ZHRRZVh3MWhGS0hEZkZtMW5pYWRlaUIwMDZWRnBhUWZy?=
 =?utf-8?B?WllsQWIycEVjTDgrdktaYVFEQThSd1gwOENGVGFEWUhmMldZOWh0c3drUk5Z?=
 =?utf-8?Q?sedrH9SO+DH/DKOR0pHUQWCM8ZzAMWCZN2gkFGx?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3607af5-3b0e-4c37-0e56-08d92fb4bdd5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 04:19:17.6630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gl99ycH8Ch82yaEKtu35JFW242o4I8+lqNC/+4A7No4BLa+DhPftbo+EEiKVlOBh7axPXU9F2lc6woph70Vw0nN4xXXdOQTzj8NYQuCSqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6477
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

I found the command to set POST Code to dbus as below:

busctl set-property xyz.openbmc_project.State.Boot.Raw 
/xyz/openbmc_project/state/boot/raw0 xyz.openbmc_project.State.Boot.Raw 
Value \(tay\) 0x080103050006 72 2 0 0 2 0 0 0 72 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 83 84 65 78 68 66 89 32 32 32 32 
32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32

The first option is the POST Code to set. In this case I use 0x080103050006.

However, I have not found any document to specify the remaining. Anyone 
has document to specify about arguments for POST Code setting in dbus?


Best Regards,

ThangQ.


