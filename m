Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4894BD5A3
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:52:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2BKf5Fpfz3bsp
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:52:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=fgmBefCj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::707;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=fgmBefCj; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2BK95X6zz2yJM
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 16:52:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWIWguoizy/nHy6ozsFlFUkGxlVgnfjkGj0xSp8/ECno5rIRv5d7A9u0JWTaJqSw7Mgok3gZNLiHje15FtXQh+45Z4CbbAvI9bIQGmBnks3Oyh6PD/Y3uedfsr6S6Ff7Us1CAk3ALRMMdpDJBzntJQM3JWp9W8/blB0C0KlNgXODjo24APeM9iFqfbwi3vfTMzjqw+Gtv7MEmxY3OHr2GMD6KdG2nZ3iVP4RFazSR/uScYDce9H40qKpoaUXN3gS7LpG4/D6BNclUCnHTXjxOQp5zb2DWqUOH1qtE0h3mGOdF1JJx+LFnAsOD7O7YSGKRzpV0FiPyqupxLchgP3/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DZrhGN/s6ZsomQ6932kWlN3ji1gPrvl8L7EuKV68ew=;
 b=m4fBCHwpbWu6isEqnZgpRwxFH335Qzgrdmj6l4f6AU5ZWCc8S5LTNHGslwWjZBdbB8LZY9G8w0GSK+DmYnLBvnWH+u/FbVrezj+DVqlWXOpLQsZMqhsonMJYwRzLjtPYJ+b0Kxy1kkD8XKBioC/tRgDY6FhmUQ69zFngoogVRpqyBC7PIDGeopVOx9y1Qbg/tThZUe+TmvS9CDRjYdcGYdXy473508/2gMAsIPnUx6+kpUY4eON2dVJUeIfiUUy99WZIxLSsVctpv6MiQr+61fzGgaljJYTBDGY1eVhuIwaDce7bj1eEzNxJENW8ZvS9E0DSLDB36a+uicz1fsGnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DZrhGN/s6ZsomQ6932kWlN3ji1gPrvl8L7EuKV68ew=;
 b=fgmBefCjUE5ETeQ8LEhw7anLgtSGS84dLwBdb+N8kcVubTg1IlgV87DDHFdKiGULhQVevbc6PGDBBxuTc2eiB+TP9dlPh+LqwOJlidOOMtR7XuJ2k74vRLbVVTgQZcjPzkggYk7Hsn0dv/K5Xnp5ClvRCS+K6tqLF2VWWG0efGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 SN6PR01MB3870.prod.exchangelabs.com (2603:10b6:805:19::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Mon, 21 Feb 2022 05:52:03 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8%8]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 05:52:03 +0000
Message-ID: <254b22ca-1d78-66ef-8e94-0cf269a0a1a1@amperemail.onmicrosoft.com>
Date: Mon, 21 Feb 2022 12:51:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Check on bypass phosphor-discover-system-state@.service if BMC
 not boot from A/C
Content-Language: en-CA
To: Andrew Geissler <geissonator@gmail.com>
References: <f5183918-e83d-0ba3-397f-bdddccebb8d7@amperemail.onmicrosoft.com>
 <800B86CE-ABA2-4867-AC6C-8B0D1F3A48FE@gmail.com>
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
In-Reply-To: <800B86CE-ABA2-4867-AC6C-8B0D1F3A48FE@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY4PR1101CA0016.namprd11.prod.outlook.com
 (2603:10b6:910:15::26) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a39d64f8-745e-402b-a403-08d9f4fe48a5
X-MS-TrafficTypeDiagnostic: SN6PR01MB3870:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB3870A81CE98B9D1EC2D94D4F8D3A9@SN6PR01MB3870.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jm6R8/PDbbuRWQcjRBK5wK9vCmK/IptlBKF/38r0XCUZ4SDZ23P/ADMFQ0XyQvo7lua5jayG3V+x8E6S7S2hw/FAQ51xqzEzRN5ANFnH5EvQzR2bC/0KCw1/X2Oyml9lu00feFLf9e9ZJz2vQn2OO0ZrJqgBkRE7sL2Bb+LwJ+GWToEB0RT6dAsSOIgiD2DFST4FdubFSJbr9uqASe2c5kU5aXANDKXT+TEIPvYe7IqcFG3AQYdJ5veKar/npDUYeZiENcdAbxRA9v0ZbSescILzd/0lF7vk7b4p+UgioN/LBjot/82jPv8ZCeE7X7id3CWqs72WYTMTNpZ3WiZv6hIY6bjdMpezb0Y4cczOE5ZxF4Jdkiu2qfobl5/auQ2sYWAt58iZu1sJKSteS+SWBuytU/WSPaY916S9Whs3deuSadvzIWzoHO2n5YUduwhl+UNrTMTJBGoyMU5AWwnofUv0UG9KFyh04YbBrRV0bB/K6cCAd2GNl9Gm7NQE3NDXaQlceVzopJdBth/ZGfmUFYfsu17StPzvV9LYqApVRAO3Pp+vcskIpXZ/mT2df5W6rqFVcdcxOe6APVEuRQTV9R7IB9mtfSPH8brG1mxcys6M0+otKuFfdZD9cy6qfeSXbsx9gCRdyRSiTttvUEa4j7F5htPdnGto3yBcaLXtS/ra4hHqlkkFYfhc/wZc3yyRp3fmlUwusgO/VcQ8VuB8k+K0ORXxskRoVt39za0IfRuEji5i8saT2q8RYpw0oLgAXvQvIeet02iylGwlp0Rgjk8mugqRxAORT3qPrCeP4V9CfOvlKetqDK+TpD1gt5Yt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(8936002)(5660300002)(6486002)(31686004)(6666004)(83170400001)(66946007)(66556008)(66476007)(38350700002)(26005)(6512007)(186003)(4326008)(8676002)(6916009)(52116002)(38100700002)(6506007)(53546011)(42882007)(2906002)(966005)(2616005)(31696002)(316002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRuQUdUM1U5blVIY1ZEMEh0Z3U2SFFJMndrS3hkVi91aFUzZnBpbzNJdVNL?=
 =?utf-8?B?VnRrdVNsc1p3ajF6cnZuRlVON3VuMzQwc3QwT2ErYjVqL3dRdWVoNjJKejRX?=
 =?utf-8?B?b2NqSEx2NG9PRXlUQ3M0aXNzaFNhazJIWFJ5a0h4Y0RoYUpCVDlrVGtsYU1T?=
 =?utf-8?B?eWU4K2lvSVZESEo4WXZGZ0s2bTdGSW9aYVdhZGRUaENkYUI1YjYzYno0T1o4?=
 =?utf-8?B?RjZxTGFDRGM4YlcvSk9VUyt0M1d5ZjFjZm53MWVuMmtoTUZKeXVRVEVIQ3Ni?=
 =?utf-8?B?TWk2K0RhMFRIUE9YOUlJbnNEVFhidEIyS1hGcFE5cWhuR0lkUWd5ZnZObEZL?=
 =?utf-8?B?NDFRb0hoaEU2eGxzN0hVVzFLY2dKa1RjWGplNi9wNk5NOHc0VmNyU2FvbnNn?=
 =?utf-8?B?NUtjZWFzaXBZQnhHY0lrb1dGYUo1b21kdTRsVm9ya0ZWTjR0V0Z0VjJtNzV4?=
 =?utf-8?B?dER3S2Q2WTBYYlJSOWpPdzVPejduNExVOHdQNldUMSsxbXVISVZMT0I5UVdG?=
 =?utf-8?B?UFljSkVUcTlTa2s5UFVRcldDRFowY1ViR3F1b1pZWld4QU5TUmxrY052N1Jv?=
 =?utf-8?B?bWp5cVBvamVsM1lsbWU5SEZtV2ZwWXpHbmJTR045ZldNbDJhdTdZK0tGZ2xC?=
 =?utf-8?B?clNVZnhDSmt1VTdab3Z3MHpWU0hHdjdic21TcUtZZ3ljeTRTaHlEa0ZObzR5?=
 =?utf-8?B?dTRkdGk4RFpYcFBEdXVBanRKci8wK09ValpidTBsOG51SVBRYnA2N0hRNjVL?=
 =?utf-8?B?T1ZjWVNpTUg2Umk3VTdnbERvTGxzc29Db2l4V2R2Rm4zTWpub0l0MVAxbExm?=
 =?utf-8?B?Yng5dHkwK2VSdi8wcThvUUZwbFZQNmZIVit6RHk2N0ZHRHBjVGVqRnFGS21X?=
 =?utf-8?B?NDNiNWZ5Y2J2ZjBNaXEzQWc5TENuZ0JoZHZpckN0QzhtM1NXcjBudnZ5K3d5?=
 =?utf-8?B?UlVuZE50RDFKUmo3VCs4QmFwMXk3SllwRDNvM0RXNzdoRzIxajJqRWJreTFw?=
 =?utf-8?B?bU1ubHBRVmZoNXJySTZHR01yc1pOWHlwT3AxNlVXWWtrWS9PMDdCNHFwUklH?=
 =?utf-8?B?MkszMTZ4Ym1JcnJEYmZlWWd0OU52L2d1NmxJMHR1UFJTNmxTSGRJSDlKc2xG?=
 =?utf-8?B?enBHYlozS3NXeXk5blA1a1NTOVBSYVBDRUl5UmtFMlBia256QWhzR3pUTnU0?=
 =?utf-8?B?elRGdDd5UXZDUDE4S0Y1RGdacm1HTDc5RzZZR0NEQU5PK0VCYWdJL0Qvb0Ns?=
 =?utf-8?B?SFg1MUcrcnE0Wko2V2IwVVVNSFJrTXVvS3QxdEFBRjdZc2piNElieU4vd1dI?=
 =?utf-8?B?cCtKU2FjdEt6SE1ZZ3ZhOEkyMzhzZzIyYlNsdGRDNWdpL3JLdkR3N3o1OEkx?=
 =?utf-8?B?V0NZUzNGU1BLdXkxdVFXc2hFRko3MUJNa3EwV0FENkZueTR5cXlZRjBBUi9w?=
 =?utf-8?B?Z0Z1aDZhY2s1cVROU0V1VlFKeFVYTEQ2K3I3SHFlS3oyS2FOOFA5cEMrbTlx?=
 =?utf-8?B?d21vbUE1QllUWnh1K25vS3I5N21NeERBeU9YdldjYWllUHdyempieVB3NEk4?=
 =?utf-8?B?ZzNOR1pRQkV3N1ZnZXBGVUNoUUIways0SkFZcWRNNGVXOTlrcG1aSG11QzRn?=
 =?utf-8?B?cDEremdLK0svVzI1NlM1elVoVDNXcDNqTkovL0wxeDNZcTN0ckx0RXNPNHh1?=
 =?utf-8?B?dm9CclBZUU1rRE5VbWNpRGlPNkx4TFFGeVVXbXZTUW5Ya05IV3JNNlhyTlBn?=
 =?utf-8?B?OWZ2cmxpbHZlVENrYzljKzl2Q3gzZmZERUs2SVQ0SEs3VkZvOHMya1E3QlVD?=
 =?utf-8?B?OFNvNjZPcmpvV0JZOUNtODk3SFN3am0yS2tQK1orT3NKTmRXMG1uOStnZm1Y?=
 =?utf-8?B?YVRsaWJVZWF3RDFHbTFNeUEzVHdUa0VjVi92dU1oUWlLL2preTlwN2FNRVkz?=
 =?utf-8?B?bFQ2QVJzSE43M1ZxV25xdS80bU9HSWp6V2ZpMFExV2JIVjRrTkRWNExrMjJI?=
 =?utf-8?B?Y2J1dEVrNUViVWZHYyt4NWtLSGc4RUR2N01sb3FDNUdDbkdTcTNKaXY3eEx4?=
 =?utf-8?B?TEFEeWlEeTJLNU9tK01EbWFZZ0JOOEovdTMrQWZCUTRIVU1tbHBQYTMzL0tq?=
 =?utf-8?B?RzJvL3NPVmorQXFBQWxkVThxeWcwblN6SmRuaWxPOXdseXA0bGt6ZjEvaFZB?=
 =?utf-8?B?SG1Hd1FOOWdhVk9JZHNFVFY2ZXdJTEdDUVVpTExqRUdWT3lzaXdaM29TT29s?=
 =?utf-8?B?TGRHRyszdTdORFhDeGlKOS9JcnhMZWdPaDJ3YjFOUHJHRU53SjdOL2dKTXhB?=
 =?utf-8?B?Q1ovMWJIRnpTYWxUcEZBcFc0STBrTm0zS2Yzdkx0d05sNkE0MDBvQT09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39d64f8-745e-402b-a403-08d9f4fe48a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 05:52:03.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hEAOiLSq9K+zkV7MAPz9CFjn3zxEnnGSS0WcwzuOjBEvGmKz5gvGvmPw1k0qg/N2ym6a57tQb+GDesEmkmkmBt1j1BHC01VTQ09DQrsovdmAKFFF6RgpqLDsnRW/96j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3870
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


On 18/02/2022 23:14, Andrew Geissler wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>
>
>> On Feb 18, 2022, at 1:36 AM, Thang Nguyen OS <thang@amperemail.onmicrosoft.com> wrote:
> < snip>
>> # busctl get-property xyz.openbmc_project.State.BMC /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC LastRebootCause
>>
>> s "xyz.openbmc_project.State.BMC.RebootCause.POR"
>>
>> I would like to check if you have any idea on how to use the above information to prevent the power restore policy executed in case of BMC reboot.
>>
> Sounds a lot like what I’m doing in https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/50706. IBM has a requirement to not
> start power restore policy when the system is reset due to a pinhole reset. I imagine you could just add a check like mine for yours as well.

Thanks a lot for your information. It works for me. I tested on my 
Mt.Jade system with adding condition to bypass the policy when 
bmcRebootCause is xyz.openbmc_project.State.BMC.RebootCause.Watchdog

      } else if (bmcRebootCause ==
         "xyz.openbmc_project.State.BMC.RebootCause.Watchdog")
     {
         info(
             "BMC was reset due to soft reset, no power restore policy 
will be run");
         return 0;
     }

>
>>
>> Thanks,
>>
>> Thang Q. Nguyen
>>
