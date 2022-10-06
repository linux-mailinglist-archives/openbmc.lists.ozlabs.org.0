Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6845F6221
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkHX0Jvxz3c4B
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:54:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ank3adlq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.133; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ank3adlq;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2133.outbound.protection.outlook.com [40.107.95.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk7w4D7Bz3bjk
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:48:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+10ZXUll4SjG9fDrHbsWT1bdCl+jyCjT3Te20youuzAr1xuXH7t/cZkVsUatT0dqZ7I+rverfXwjtiNaOlLcbxksSo1Q33wuLNu+1lQm6ae5Lzg2+wJ8EniEXnYvHBXN6hTZD7basn/mLggq7+d8OGN6s1erRbwAwgZxPvDu57+IfUYvuu9SIm7M2kWQkM18Gh4thPcSr3j4hgpt+FXr3vISrAd8NPU6T19FhjEFoxd6i4bgjURwhjIEW7KpUYX6jgmS/+q2nQMeIbokcN5N6Xkefj5c1HELB4oHXqhhvRvPDccjleRsPPccA9c0/AYuB8R6UydhNwl3z9jfWcL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DQFJF337pgpSJluhEWzNyLHDgStlyO3EmJtGJvKVRw=;
 b=HBESnR1diNEiVeSZnjjSyGseCSwWV5jYGDZkFNOSKTMcztzRmStYTfBEyLTOn0YrXOvK/tzKFRxxxPjrOe689c22WxLx7sG+vVXZvC3PkBnV+h7+egZwNbVBoukzaro7eROq1fE9kdmymHeAJkxAi/qzMSiIQQ0+DtFf/WifKx0qUrtAgxd/XAveJVC1b+r3+xYgA+A5qa6Jk+nIWVqMXlfqttw7+iTSwZdAXjhcS7q/oFjaxhRapEJ2ObFlh38DQWmW0SgSPa8kY8S86QyMuKYJK+gd1BKJlsS6n2JTP2E9W2dTGS4yD30sHGEqc6iUeIIbU482IQxEF3fF/NSz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DQFJF337pgpSJluhEWzNyLHDgStlyO3EmJtGJvKVRw=;
 b=ank3adlqPzyDNEHsR1WENjmajKaq/ns/xlncx9vSd1w6atFYgGUEI/eCymISoRdt27R6PU7K+utxWMhFq92EjWObCo0sBtnBVTOw5K4k/cGt9ZkzkLj+5lgkFanCjq/6XVuKyt2C68fJww4oGzsR4ez+orCKS7JfcAAQMvQiNcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:48:07 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:48:07 +0000
Message-ID: <c4b4875d-99d6-fbc8-1b5a-26d090b5bad1@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:47:55 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon
 driver
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>, macro@orcam.me.uk,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-2-quan@os.amperecomputing.com>
 <594c4afe-17f7-8670-d5ba-ebdeca6a4b47@gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <594c4afe-17f7-8670-d5ba-ebdeca6a4b47@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f45a64-0727-48cc-19f5-08daa76f1b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	z/7JGEEfm5E7NcDDLXwcjc1yD95HSY2Qxhex6DrWgRD06dS+jHEJ6odiDTJWzj/YkDaL7xzQpAhq8lp+pmCfq2Omu/R9OQ4LuSbA/vhfYERCXewZNTGFww4wJ1dvTwLjUkkJUYvK7d1v5a/f0MdzYYq+MykVLBnvYPkDYt5tIvi+2RG2Z+xcpG5uW4BOj/c1c6MNJEXF83gkn0KQhu+3GTkG1GJJmtotYNqLaUSTX8COVAqRtrZWs/lRvBTdY3fjQHbKumY1aoL6cEGbEFq05p6bwuHH/z7uCvDDY33LmqL31EcugsBYjESJIszhCqGvI+6I3hK2il/++F0/mfoV93ZiZzZWDcxBkA5c2REsYL/3a2rN7D5fxubDbu3wOAYQ6xs7hFFroJALYThf5cejDoH24RvgHfDnMdy+uUZMCS1h3JeMzH0vNNzyOMc4An+Bfd+PJnVGL4JaC9U8AcEpz+lr05NmtRHVhuVrnjMMRHBlI3Xb6i+MnsDgw1z+a3lhczw8dFTHyxOYEagb7Wf23hF5p/RHer49iuQSeWiBIOhzCOL37GXZ+KzUUy+NQGS5IGtpgKfeUJyf8dkYRvQOyeKSnhaZlmtvL8SPBdCxiQYkW0W+q8onMdfFlwDbEFQEYBVW4ZnUiPs8lpwCvTMnmhpUbEPgwI0mUCJA4JPahfPhufiIvU1c2CGVykDMORR8k+AQZLsnnduzUh4P/g/OCndcBV3kH3bGtN0sq9touXzw7Zryh8jFYzsirRDJWBdBuko7/kj8Pk+xunglk/EnSBIkS8GpcQGhXJYdB7TZR1NV6TVi8+vGVCS4JXFirR+G
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(31696002)(921005)(7416002)(4744005)(83380400001)(66556008)(41300700001)(316002)(110136005)(66476007)(2616005)(8676002)(6666004)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MTNudEliSDRtUU05RlVCM1g4bzlaM2tESHgwVjFOWTI1Z2hLRDNKSE1aWE5x?=
 =?utf-8?B?SnJ4RzVBZ1MrOThBZyszWDJwakFqcmd4WW1NZkYvbGlRQ1JZMHBVWWJLeTM3?=
 =?utf-8?B?WEE5OXN0WkdScmtRUGh5UktaaGtRYS92cGU0UnFONlBtcU5GaWFkZGxRbE5n?=
 =?utf-8?B?TEFJL0NSQ1FPOFU3SmdEZTBiVWFFZUR3Y3Iwb2ptbURkY0V5b2tZVXpidzZp?=
 =?utf-8?B?RTN1Z1B0aFA2bjZQeW5CTnhLdjlka2FMWHhsaEVIQ0MrelBOR0pzR3N5OHdk?=
 =?utf-8?B?MTk3bDFhMlRUTkpXWWJWQTZCSHQzcDZrY3hPYkg3NzdhYTZxK1kyUWVOSkpt?=
 =?utf-8?B?YTZROGkvZWVCRnZYb3I1bTNZdmd6Vk9idmkwOXFWY1BESnhTWlhpdHl2UEJH?=
 =?utf-8?B?bVltNG5UMytEN2ExQ2JWZ3BvdFd0TTh1QTdQQlU3MTlIeTZOdTRBRkVuTVdt?=
 =?utf-8?B?a1FwMHVFcUFhVW1GKzJPais0RG1vQUtOTFlYa2krL0tNUTJNTms4dGRLUkRh?=
 =?utf-8?B?emJsZ0dPM09KV2xTQ1pWaDZDMG45R0YrTU4xcWVDNHUxT0RhQUJHWTkvZEdU?=
 =?utf-8?B?NTdnTVhCYmFjVG1BSDdJa2FLaW1OVFZEdnhoRFI1Qk5Wc3lQL3ZWWWYwRTlT?=
 =?utf-8?B?Wm45Rnh2QkRJakk1R0lCSkZyWElCaFpjK1dhcEM2azlYQjBZU052dXJNQ1pX?=
 =?utf-8?B?U0crL1E5ak9wTmNLMlMyZk8zaWc5NGtLN3g4emRxQkdCUThHbUNSRk54ckph?=
 =?utf-8?B?Yk4wYXFMOEl6aTc1YVMxMk5oSWRqeVRWVDB0UmJvdnJWUDgyRldac1I4NFNH?=
 =?utf-8?B?VFExSXNSZURrMVppTVUvVU10N2kxcXMxb2RyQ1pnLzJTM2pLanJ6eTAzLzN2?=
 =?utf-8?B?dEhEa20remdaR2h4RzM2Y2RSSVlnd2dveXA1SjZNZ0lWT28zdm9GanJOMzli?=
 =?utf-8?B?VEU1Zlh3V3MrMmcrdXJiRjNpeWZkRmxINGhaZmZvY0QyWnIwVngzRW5WbXpX?=
 =?utf-8?B?dnhRKzh6RHFSRHF4am5qU3d4dGJEZHR2dVorRStBcXZjR0hCaGlKWUJ5TnI1?=
 =?utf-8?B?SkhzenBBMlpwT09mYm5oV0p5dTd6TE15ZTBITE9NRXUzTjlKVlpMR1JkVWR2?=
 =?utf-8?B?ZWJzQ01oZUR1NklFcndhN3laY0ZRcFN0b0cySzR0REVQWHM3bUw4OHl1a3ZT?=
 =?utf-8?B?Ny9pKytJYlYyR1BkbEFSQjk3OVRRcGRucTVkZDZPd3ZoeUExUWtPL2FBVWNJ?=
 =?utf-8?B?SWVEelBERUtnYlFEdmVxWU5MRE11dGdqSEREeUg0RzJJNVBmaEd6NzRvMXc3?=
 =?utf-8?B?L0plSmhPTmJvV1dSYkNJWXdHMmhZTmh6OFlnK0JhYXovSkx3WmhHcjRRdnlB?=
 =?utf-8?B?dGRJREFWdlBqaE5IUGgwUHQ5c0ZZV2NMZTduMzR3ak52d2VnYWJMM1IyWjRP?=
 =?utf-8?B?MDQyclBsb1ZnUWh6MThNNEZTN1dIL1N2L1RVZk1QWWdWd0huWG40MHdkYUlx?=
 =?utf-8?B?M2VXSGxnSkc1TEdvdjZ5WTg5aXdsVTlIV3RSbHQ4SmZucE9PVno1L1lqVnJI?=
 =?utf-8?B?WGlaekIvaUZpMmk1MW01K05kdW9GL3ROUmhWVzUzTE01S1NLREsxeE1SYVV0?=
 =?utf-8?B?MUtXN3paaWhUbVJEdi9GcVRtUU84dE5tOE8wOWJPKzVYWkQwczVKZ0RGeDZj?=
 =?utf-8?B?TU9ydHh5UWNwSE1LTzdGNDRKekR4Zm1oWUh5ODNWWkFheFdUdGc1L2Nzd3di?=
 =?utf-8?B?NmJOa3FZRS9mMU10U2U0VEVEakEyTXBNRHF3TFVjZkdjeWhCVWg3YWVJQnhD?=
 =?utf-8?B?emFLVG9SNGpKRVZLOHJvbkFIMjc1cTR0SGptMXp0ejQ3UFlPY3BoSTkxYThH?=
 =?utf-8?B?cFhhRk5ORkJPN1lIT0JsTWtrTmlLdkJVSGx4TGYzdFRUcXhIZ3kvWnpUYnIy?=
 =?utf-8?B?ZHFxblpZUWQ2clNHYXc2QzRRR2ZWb0hacm9JcWdzNHRDOTVPTmdjQ2F6Mkcv?=
 =?utf-8?B?MkhsdkNLZ04xb05tVjlyL3haRmx5V0lneUViL0o1bmR4Z2ZJTEhGTVY3UlQ3?=
 =?utf-8?B?anRxYkZCcHpmYkJNdjJWb09FUDQ2cWxJbXdRbmt1RUJQVnREV1BTN2lEMGpz?=
 =?utf-8?B?bjBxOXFMeHZYMS9PbGRva3pGUC9aZmRQL2h5Tk9qbVpiZy9RSW8rNzNER3A1?=
 =?utf-8?Q?v3fpzlkxcqKzU50szOLlexE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f45a64-0727-48cc-19f5-08daa76f1b3e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:48:07.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3nmv18q+KB/kSN4VbF45i4Tkoq7zrjhaOqSEkoOAO7gZOYXNisPrA+iVGaDciVlZOCPu4+hvn3m0h7LgEyYcriNVRYiJTtPEkzOPPqq1fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5796
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/10/2022 19:59, Bagas Sanjaya wrote:
> On 9/29/22 16:43, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
> 
> s/This commit adds/Add/
> 

Thanks Bagas and will fix in next version.
- Quan
