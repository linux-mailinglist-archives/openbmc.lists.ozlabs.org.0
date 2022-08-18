Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCF597F3F
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 09:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7c8620trz3c6R
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 17:33:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=U6Zn2nJ+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.133; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=U6Zn2nJ+;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2133.outbound.protection.outlook.com [40.107.244.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7c7c5LfMz3035
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 17:33:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNaxsNNWyC6LnC3+utwhLtdh5HjbjoMEoOIPwY1HuA6uyvQN3YkXI4QITgad32iqDSpby3S2miFzxZqF/7jW1fniNW4icc75kn8q41miTANgAKNOYqQxWHqMWdNS0F7hm/ZnFs9m//2B9IM2sRlRjdNN51TCcQcO7MZhQpjbGnVY38yNb8teltFdIe8CBNkDkAT8i8lF05XqpItHPmfcP2YLJJ3hHKpu6NwsTOammYKPXrOKjAaNQgjuAmYO7HyC85/TGnNNWhIb0TTS1jZvKMc5K9DJyVaGEWAIR8iyg+4BpNVItOxgpoM8SYVYAr0OeuwnFYHfJqExkwGTSkRTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgfpp8iJJp7U6VN9eEQDF2m+AVZvyoDIdb+zaLJKLhI=;
 b=bP6W56Yv0MjRzfRQcZQzPxBeNbLlzeZCOd9bprbOLbVRrpoHPCj0yy7dRCrd9LSbSVnHD1jWEU0278tElugoaiJjOGwadDCr5jkMn89eWqOs09KZQWHayyV6IuIW9+Ek03tSFuF3T5ixlt5QgxVswbODa5ajLz8VaFbYWFIcxiu9mjXVFcFBAaLWRlFAH0ObXVtArgz+ZAlLiXkleBulfRcJvPA6idEhNCUFcAGAEBIfNqHIPABKT2onMGE2gVPQsFfw2zJ1FGcA87rv+hqDhRwXRjxq4duOo77WJOE3P280gzTqu5bTk+KnoacmraORMlgZVV48CU94777E/gGFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgfpp8iJJp7U6VN9eEQDF2m+AVZvyoDIdb+zaLJKLhI=;
 b=U6Zn2nJ+A19PIXx/322QF6tpTaqp2KEwf/LjYOYECyfUwCBjo7XeOuUMdj1etiQxCxrhrRD1dq+Jz3Uw0bwZDZbAh4/fRjVgUxYnkfRfpr1x04Z7/vedMolsKYj9ai0Vv2jRjLxAf5MorVpVpdulwLJzjBf4SpvdiUklw7/8XF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN0PR01MB7875.prod.exchangelabs.com (2603:10b6:208:382::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Thu, 18 Aug 2022 07:33:08 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26%9]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 07:33:08 +0000
Message-ID: <f6c87af2-827f-7451-fe30-7ec1b62e5cee@os.amperecomputing.com>
Date: Thu, 18 Aug 2022 14:32:58 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH linux dev-5.15 0/5] Enable second flash, update gpios pin
 and merge adc channels
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
In-Reply-To: <20220228000242.1884-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:54::22) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89afab5a-8611-4251-480c-08da80ebe56c
X-MS-TrafficTypeDiagnostic: MN0PR01MB7875:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	g9EA3syqzRNPiNqBbekeYX+0Pf469H25ze3h40Oq4DR0+hdiKRYFTkT456Kqu3wPG60J1U8Q9pzHrtOWc2YqJ/8Hlw2jz7pCsw8F+OZEUa7Z4HEQg4HLSZ25/f/f5jazfNfIfGXij0/Ccg2A3fiqsEbrrWwwIzsclW+fQQSRenjqpQzg32KmrdJVSXZUoJv0v/1d8HbGU5YfqJ+xXaOabN0j+MCnUe8YDiaQuhikHCbrADwb16OGuwf5/TOuyyyZTYBeSSyaBpTUI4w7IWVTgumhQZfJXZeDhXbBnBBd0QKaz7XRafUT5cqBxOyMEYYPbbiGdLGul1Oarx7svcZ8KASG4abzb9pUZ8HEyK0O7nyI3ioALRKmKPghn/AmAdC2/eRRnllHR2/Thy/3e4ZRS/3SqCkcsb3M0IRTF6Nf4ABasESSTyboERQwAu6dbMWoLRFGrU65Qw8W5PiV3Ne5x6CVld/WqjJIGWJ3oL/maUpl/VvxXVYckbMe3vXq4uY44mZylenWgWC//+oXM2GBjjoxep5J0gr7ZaEgCnmPAMU8PJsXJHbEVSr+/h1Wjl2EtJ3jf8dZ6WjpBce0nkSXRycE9FnKAKRMiPTdrABY/NFH2V5pky990oIR0V+KNdOHeb7FjD4CJOyFAWW4xNYmODImNcGZmTfUv4OeGaXpB9v6Hk5ltILUxPpRBrsq7Nomrp7eyCwjmOL0qZMF1p/cZffgjkwnJ+DHgxVA/sT+3wMkLJvwl7exEUL+gyfYisKCzYnjL5A6a050elq70G7NRpU9WNZv8B+q7zKMlDHUUud1zH/jEFM6tf3VW9YR/yJrSYSrsmRZvxs9lK4pwfut7g8oIWSuP7M2bOV8ZF4EJXM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39850400004)(346002)(366004)(15650500001)(5660300002)(2906002)(8936002)(6506007)(86362001)(4744005)(26005)(31696002)(41300700001)(66476007)(52116002)(186003)(6666004)(2616005)(6512007)(6916009)(478600001)(83380400001)(966005)(53546011)(38100700002)(107886003)(316002)(66556008)(4326008)(8676002)(38350700002)(54906003)(6486002)(31686004)(66946007)(449214003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YlcvcHFRZFZpV0cvMFlZcklPdVA0cWRBNlNybFUzMHhYME52NVZKeG9PcWx1?=
 =?utf-8?B?c0tCQlBrMWJacGFWUjdUVW5jZ3R6VlBYdmx3MmJGbGE1czBsQUI1U0kxRjZS?=
 =?utf-8?B?VTFXekpkU0RhSkRuZk5YT0MvNWxwWCtBYWRBakNISHdGSWo5QzVWVTFzZ3Z1?=
 =?utf-8?B?M0l4OEYxV0ZrV0ZFUUF5OWdqVTBJZ0NjUU5ZQzN2OVdMMU5uTzFDcklINHJR?=
 =?utf-8?B?L2FYMngvQmhGSHpSUUFnNGhoV29BTFpVeTVDdUwzeXJnN1d2TnZjUC9vZFNU?=
 =?utf-8?B?Q09nOUw4enNlQTNLY1gzQXFPeUhrM1VZa3RMR3U4TmNwb2FvQ3VOMDJBQU0y?=
 =?utf-8?B?UFM1d2ZLUHZRdFlyMnh0RmdDdmR4dmZoL0REc3h0ckUyYVhaRmNkbDVtZWxu?=
 =?utf-8?B?QXl5S3k4enY3aGJRVUFaWmNVUWpwK0RTQmxHMS91ajhFbitCQmdwOUhIdERD?=
 =?utf-8?B?UzdWdjhPOGdoYUtxc2JRU3VlVEdZN1FqQ1NzTEkwQXNrTkhqckNVQ29qNG81?=
 =?utf-8?B?am4vRVpCMVhGbktsKyszSm1obW9RYlNHc3lMZWJnRmpHZXpBNHJtR3c4WnAv?=
 =?utf-8?B?L3ZFQnVuSFhaMW16SjUxaGFYV1FzZE10enV6bmdMVTV5T3oyWmtQWmhXTzlG?=
 =?utf-8?B?ODVXVTlITkJTWWJXc0FiaGlkRFJoak1qMTJUcUl4YXBRdWtpS3A0dnN4YTZj?=
 =?utf-8?B?bHI5MHpoWlVKS3Ywa0hCWU9SUUFxWUpsVGFEWEtldnRqazdzK0p6dVZEZGtL?=
 =?utf-8?B?TW1BVjQxSUVER24zRFcvbWVDMFpxZWx4WXRDUG4zM21DRys2MnlaWkNqN1Vn?=
 =?utf-8?B?MXFWc2lCamtmWTZ2TThVcW5TQ0pQV05jeWs5K2Nqa2VlWG1JREpzcEtVYVE4?=
 =?utf-8?B?ekNPVWtEbHRUMkpUVldsTkdJTFNMdWNSNzE3REVwMmZQNjIzWWxWbGtYRGNJ?=
 =?utf-8?B?RjBsS1IwTkJDMStFYlZoRnh3cWNIejlYSk1yRVQ5eHVpdVpOZDJoNUNGZHZM?=
 =?utf-8?B?SWtaTFNXd2U4U3o1di9WeGNvRE0zNjBxekJzS2NhMHBqRXhweVRRNTlqRHpy?=
 =?utf-8?B?Y1l0V2krUzRucjhxMHJoVGpQMGpxNmpBQ1pxVUVNWHN4TTRvdTNUOXNWd2x1?=
 =?utf-8?B?OEpoODlDTS9PYmo3V04rUlNlMjh6T0dNSHRiamhaS2p5djdPZW9ldFhYNVF2?=
 =?utf-8?B?R1hINkMwdFh0NXJwSjVrL2NESFVLOUtiU3hMODJuZW04cS90bWFQU3BoUXpk?=
 =?utf-8?B?VmFjVVlOb2FCWnA3YTdJQTdJOFhqMVBycEFWYmFSZWx1MTlITmRMMjhaaHZK?=
 =?utf-8?B?T2NxczErd1hiS2tqNHRqSHZPVURzYXRJdS9SaENKRU8zbi9rV1Y3cWwvc3h3?=
 =?utf-8?B?aC9OVkhLNkNUd215dDlHbUd3ZGV3bTdJQVk2LzVuUGw3VTBJMVFxU00rT085?=
 =?utf-8?B?UDYrUUdwaXBBRkJTeGhRMytCbGE5KzM0bmoweWFXMUxOdXBiNTlzc0I2ZXVM?=
 =?utf-8?B?RmZIa09KWHY3SkJHalRsaGpsMURaZWNadld1ejc3a3lyVW5QZlhna2UxQUZt?=
 =?utf-8?B?ZUJwRFJlbldRUXV5cFRUR1JqRE1vVEcvdHFXUHNXSVljQ1VJTkw1WFRLc3Zq?=
 =?utf-8?B?azQvaXBuY2UwNFFBOTVWYlVycFVabHpZUVl0TldjSnFtSXc1bjRzY2ZXblY5?=
 =?utf-8?B?SGdoNXNPMm5yb3JINjVnWG14VERJcHdkY2p0YWtjUS9obGE3MngzZXRaZFZM?=
 =?utf-8?B?UjJHa3Y4bEkxbTRMZzFnN3NLellralc1bmdZMWRiRUJvRU9qQVVrMk5uelpn?=
 =?utf-8?B?cEdCVzdyMmYvMWJEN2MrZllORGczL2tjMVQxbEg5bGx1Qi9NK3VqVys2Ny9K?=
 =?utf-8?B?eXJ3YW5iS2Y1cWFyc3RiQnFoNTFCQlZDNG84V1NMcHJvNWVuNm9jN0E4QXpT?=
 =?utf-8?B?eHE4M0RhdXdkTnZkZVV3Q0FpblE2RmQ1VlFwL0dvbVBsTXNJN3pBQkhmeDZR?=
 =?utf-8?B?NTUxQ05xSTRSY1dlY1lHeFFpTVNOelpvY3NQMWZ2em1sV0RDQ2dkQmJGV3F6?=
 =?utf-8?B?VnVHUTlCcWY3L2EyeSsyZEZQaXNkOXdGcUxLS1l4V25vTzdVSmVpZXF4djZD?=
 =?utf-8?B?OXpMcXVHa2swTkVOT0lzZXNmekg3cHg2SjJFT2xvWjkwVHU0cEpxSEpZR3RZ?=
 =?utf-8?Q?ZNgcbm3pFnklRSAvKL52Sy4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89afab5a-8611-4251-480c-08da80ebe56c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 07:33:08.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dmcclv+8xZ6Iv+2mC3LTlXn1vjFYWomjDTk/nH/gvm5Vn/BAZm9lqLQtl4VNjhYjbo7OhXwGFlAIKQmlQo+hsS6nITmQ1aBz1R9/uEMdft8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7875
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Open Source Submission <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

Could you help review and backport this patch series to dev-5.15 branch?

https://lore.kernel.org/linux-arm-kernel/20220228000242.1884-1-quan@os.amperecomputing.com/

Thank you,
- Quan

On 28/02/2022 07:02, Quan Nguyen wrote:
> This patchset adds the second flash support, merge all ADC channels to
> single iio-hwmon node and update various gpios pin name.
> 
> Link:https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> 
> Quan Nguyen (5):
>    ARM: dts: aspeed: mtjade: Enable secondary flash
>    ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
>    ARM: dts: aspeed: mtjade: Update host0-ready pin
>    ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
>    ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node
> 
>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 26 +++++++++----------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
