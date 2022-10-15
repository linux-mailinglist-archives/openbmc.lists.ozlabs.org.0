Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B725FF832
	for <lists+openbmc@lfdr.de>; Sat, 15 Oct 2022 05:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq7tv5mbHz301Z
	for <lists+openbmc@lfdr.de>; Sat, 15 Oct 2022 14:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PmZ1qUCK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.118; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PmZ1qUCK;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2118.outbound.protection.outlook.com [40.107.95.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq7t80LXyz301Z;
	Sat, 15 Oct 2022 14:25:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ0Qm19RYhlRf+131vPmfZgkXJM80+1Rl4KFR6Jo+h/YAPJaJ4HHf6vhc603BOX9PtwuHNm2v2fv2M1jnJxblpFvc2OseOzBmnwjHjAh4Ha0rm6lRLmtqX4YlN9mtBmlaTL8cWDXCTLLekv5AP5nEkXJd1sXSCjcCBMPfkM8xa+JuHMgxLE4QGnrFztVZxSb+ELl/bLE2NuG437mgatXS+Op6aBWZVCcKImVd3+ZmYeepYZEvRqNXEHIi92ckR01qX3m1/RnVdOJ5i4f95cd18xDwfqqiSd0ExKTlqp/76DV4GdMrAYnLH0+IUMY63p564VEOgwhog/cAyLo/d6DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWsrtyQjQFElcDizd5Q2pe16mJbXNMVHde6vi1cOR6w=;
 b=Ndb2KHPwbmXquIseaeNOpGp9fFQ/c5mFMKc+Bbi4tq/t0bLPZZN0IOnty2bsawyT829APlWAu8EyA/yrTEQfYZyf3IIM7ze5zxP7WmQEd/PfoW0pdTn0zI8Agle/mcPiaEZIagsONG5ECXMddJYPCjy1vmeUpiWwrHrzX7lAjxl2qIZUHhtZMJOY8fStSUryVNVlSugPwEjptMTEPO0qSc8bl7WyOYACu09MQfE2GbJzSkN8RUNNHe6n2r54xMShWdtA5VbVW3IGTjhaHvsGdGvn7vBLjqD1RcqcDYLcUNnBKrbe8QeRTwfpjyHY5UX8vDwfZlzD0AmZ208+dKU6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWsrtyQjQFElcDizd5Q2pe16mJbXNMVHde6vi1cOR6w=;
 b=PmZ1qUCKZuuwtt+nP5IX64VjD+8EH91KvXCaR9pVmuP94xX8Pv6w9r900eY8i65mLrt8uAE5m52Brp1erC77mYcbzxkfgj97sFgB/3yFOcoTfSw1IXDMq7ezptzGqhk/0jT2YJ86OszoK9WsTpoaiYFN+3RAE1vCKOJeAmR7vPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BL0PR01MB4547.prod.exchangelabs.com (2603:10b6:208:84::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Sat, 15 Oct 2022 03:24:51 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8%3]) with mapi id 15.20.5723.029; Sat, 15 Oct 2022
 03:24:51 +0000
Message-ID: <634209c7-e458-8c4c-7bef-63f283aefaf7@os.amperecomputing.com>
Date: Sat, 15 Oct 2022 10:24:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v10 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-CA
To: Graeme Gregory <quic_ggregory@quicinc.com>
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-2-quan@os.amperecomputing.com>
 <5fbc5a54-60f2-fc0d-a4a1-839f28a4d8ba@quicinc.com>
 <48a5e252-9a1e-65e6-e8bf-add3d39a0286@os.amperecomputing.com>
 <72c8a5bc-830d-25a9-0528-5d428dd9f163@quicinc.com>
 <20221014130517.y4mdinylnwfrg6u2@ggregory-linuxws>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221014130517.y4mdinylnwfrg6u2@ggregory-linuxws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BL0PR01MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 441b2cca-33ff-45c2-841c-08daae5cd1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5rekcgNgVnoWB+FYkEdvFyaq9GfouglnQqonvsv9iCS4QOyXFY4YNgMZIIOnFXA3sSSwzIPAjODtwe3bllsPxHpePM58nYMjGhQtmzRQ3RgiXpwXvtj6wjBG0cWD9rC8PmFC7wC0xxYXYxTl9LE5s+k2tLA+gQ1KQW+j7hzpFobHgOP5tks0lQX6bTpcABeEVFRTPVTk2eVQOj5CUeVbLPuw2m/aiKwI/wUSzjCO4xBAqCJHoS7e+TuHLgd0HX4uQGYXKBHGbap3BuaP8FaYaZOW0os5yFs2wCQSqXnmCW0BV0ONO9YxUv3LYxJ9N+4b2DdPfwgdpoVgLKbSiUycmxTW3LBsfqoPSks2SoDBaph5guMJ3yQta7yx78exMRE81dmGyRzJe4R4+if5+7HuT6J4px58r1TCHswpW5l4bHr6rNGlcnqdmlsgjj2t7NL+cfQK4L1UI9Dch/l5APPslwRLGWThI8TJ8Eq/mo/pfNaebs4Y4NnIYsuE/dSlkYSMCfkZsxy+1BuTm9jrt0a41Q8E/kD9sKjN/Q2r27Tna5r/N3TRz+DE8GG5YdECiCrfav8l8nDlQ2FWmFmfgWD5DMBP93pMRVPpK4tyk+n6XOye1A34tkjbtRscTmAOeIztIw3mx5M++PwDl70kRLLj7qR+OKY7EL9Evyuo/A9jfXZrFW3oOMBY3Q0wCnQQmJLzNIpMLnARgDVeNYTdYOlYAOLgz+TyTUAaDAs3OI/cZoGxWbMK+lJG2Tw9cKEtKqeiQ3d9/+vTkOTFkcQaB6hn6c6pmUmTCby9+/m0vRnjUzavJ+TBiZfoWQyoUtYWtU//bGXuxfRbbYEO+qJEVbycbhjxxFMBLg+0EXgPIzRewjT8Ig2PpRh5H2Wj+4x7jTbM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199015)(31686004)(83380400001)(2906002)(2616005)(186003)(66899015)(8676002)(86362001)(31696002)(4326008)(53546011)(52116002)(26005)(6506007)(41300700001)(5660300002)(316002)(38100700002)(38350700002)(6916009)(8936002)(54906003)(66556008)(6512007)(7416002)(66946007)(6666004)(66476007)(6486002)(478600001)(966005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NG4yTWlSUkFGOEgvZ3d4T3BJVjFhL0FMb3kvQ3h4K1p3ZEY2aXl5ckhvbkhO?=
 =?utf-8?B?UzlIcWJFUW1hNlhSZ1BNdndSbGxHTEtXNGwvbXk5WGlMNnBsd21KWWdFTmdu?=
 =?utf-8?B?QVNsWEVVYWZKVjJWdlppalFtN1FIcWVrMDhNcEliem4vRy8rWWExUmplQWFz?=
 =?utf-8?B?ZlNxREJhWjFjSHp0SFRIRmppeEJIYVZlTVFCQ0V5VmlNWjdaOTdsRGJFUVVF?=
 =?utf-8?B?WVRYNzUrc0tCWCtqaU5lUFRXZVdwWndGakQ0UFkrdXMrdUw3SWxoRUhyK2sr?=
 =?utf-8?B?NWZLVWVjRSt0NVphQUErR3hnR2I2M1BPNEFOTUFmc3R3NFFvY0Y0djJIOVVk?=
 =?utf-8?B?cFBaSGxpMXljenFLMEtBMVR0dTJmUDZqRGNlQWYvUjV4Q3RtWENla3E2VDl3?=
 =?utf-8?B?cDIwSm5sa1g3ZXlSY3B2elNTekpGVm9iUGlFcDM2VStaeURoYmJZR3F5bVlj?=
 =?utf-8?B?Q1hZY29WR05ub3lKVVQvVUZadTZCY0w3T2t3WVhScGxGeFhhWjJDdVRrcFoy?=
 =?utf-8?B?eDJTLzJQd3kzbHhHdHg0aG05ZHN4K3hBWWk0QTBWclVXL1ZnOU5nQm9uQ3Rn?=
 =?utf-8?B?VkZucno4SUZ3TWJ6clN3V3ZFdVZnYWdoejgrMmpMd3lHdXlvSDQvZUgzNys1?=
 =?utf-8?B?RHVaUThrbkRnS2ovdUU3L3NZd3pITFZickJvYWJSOTljdDJ3WmtqcVVVRTk1?=
 =?utf-8?B?SVczRk0rUFpWQ3pHTWRCeGF5WUlHbkhBNzdMcEN5bVNORE9DVkZKRTBuOXZu?=
 =?utf-8?B?QVphVXo0dEJYRWg0RnlkUXNuanh6ZmNkNng4aTNVL1BseDNGSWM4MUlhZTdu?=
 =?utf-8?B?Q1JFcU9UeTErcW9yaUVRbUo4YVpYSlJsU3h6bGMwZlBHQjFMNTgvZUU3SmMv?=
 =?utf-8?B?d3BmcmQ3T2xraDFDMEFYZkdrR1hyMVZvTVFHQTE3Z1dBZVI2ZFlSZWR1c2Va?=
 =?utf-8?B?eDJvNWIveHJpTEd3dUg3dnh0YlA1UVQyN3Zqd29TUmFrZW9WODFzTzFpT09T?=
 =?utf-8?B?VkFVY1Zoc0RscThma2Nla0ZDTXEzOGV0bjFQbWd4K05mYVJyVTU2Z3RpVExT?=
 =?utf-8?B?TzR1SWcvajJWWXZ1SWVGeHVvOUkxMm4yaDJVb3dBOU1WaDVSMXA2WUZ5T2tG?=
 =?utf-8?B?ZSs0S3BNUTQwWUc5b0V0em1tT3Znc3FLeWJFYkFiVmNsMlhrQUVWb1ZGQjk0?=
 =?utf-8?B?OGh1SGVRZGZXRExGSk1tZGRTeHhMQjNtZGJuaWpBZG5JZFMyVzFNZkxDVVhZ?=
 =?utf-8?B?VzNxMnNUTS94b3cvYXFEclJYVDlrUlJoU2hxTVFoallSczgxMHNkblpacmFw?=
 =?utf-8?B?OGlmdnU5ZzVsOEwxUTBQeGNXSjJhcVdmV28yUTUvdzB5YnkwNXFHSXJWYVRK?=
 =?utf-8?B?djNyUGRreXJ2Wm1SYWlGdFl3dzl3YnJKVFZmNEJtUDZnbGhxT1RLaVcvblgv?=
 =?utf-8?B?dXJMd2JkMmQxSm9HT1Qrci82SjRvaDlacmZ2ZkdabTJaK1hVVWlrNFB6NStE?=
 =?utf-8?B?SlpEOCt2S3FNdkd0eDgzVXhUTFZXYlBoSVg1R0RSUlRYZGY4akRHLy9tQnUv?=
 =?utf-8?B?aXBPSUc0Q2FxL0Mvd0UreFg5WHFmL2o0WEhrTitJcTZNdWtJbG10RmQ0TWZt?=
 =?utf-8?B?SHdxcm5XS0VzRVBtVFF2eGJoVFlBV3lnbWVESnZWWW1UV3VITmh1RDd5TStv?=
 =?utf-8?B?dTZrYXRtMTBUOUJRMHM0V2I2UkFOZytkbTB5bWd2VXU5Tmt3aGxYSzk3K21L?=
 =?utf-8?B?S1VOWG04YU5vSWtDajhmZSt6Nm1rMk9qOW4rNThBQkJ5cDZkSURBQW5ZK0Ex?=
 =?utf-8?B?blF3NXdzVDdWNXJIYjdCTEpGREtMUDFwYUlJNzUycjdyZVpiTXZ0QUpKME10?=
 =?utf-8?B?VGhrYWJjR3V6K0J6ak02UkNvODhjb2NJVDFOWmRxSmxxdS9TVCt0ejJld25W?=
 =?utf-8?B?ODJibmNpeUJDaVNJQTBDSUJadEwvcGNGQjNQYVBkaUZSaDdvZGlReDBIQ0dl?=
 =?utf-8?B?WWhKMGRHeFdiWGdlaUxxbGhhRUM1WkpHTFRXMnVXSVM5R2Y1b0FvVlFsMmVh?=
 =?utf-8?B?UWxJUHhSOUc1cXpmenRxb25jSU1tbWg1dGJIU2xtTkpkK1FNMHZDYi90M0xK?=
 =?utf-8?B?R05HZUlPZk5LcWl3STJ2ODRDUytUZ3JnejN3cWFZVnNCN1ptMHpoaVlDd2NS?=
 =?utf-8?Q?1MSmzHovlAD4tauoE0IeoWY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441b2cca-33ff-45c2-841c-08daae5cd1c4
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 03:24:51.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTS+nIy73ubGXKHK4rqAWISFmqJY00hBTlw55/jDDS8Ga8pdIobJS21rR7R7Nh8SWQOk/it67i2eeLp3S/BWvGtjBeD2F27ou0VfE0ogOIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4547
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
Cc: devicetree@vger.kernel.org, thang@os.amperecomputing.com, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 14/10/2022 20:05, Graeme Gregory wrote:
> On Mon, Oct 10, 2022 at 12:08:24PM +0100, Graeme Gregory wrote:
>>
>> On 10/10/2022 02:28, Quan Nguyen wrote:
>>>
>>>
>>> On 07/10/2022 20:26, Graeme Gregory wrote:
>>>>
>>>> On 04/10/2022 10:31, Quan Nguyen wrote:
>>>>> The SMBus system interface (SSIF) IPMI BMC driver can be used to
>>>>> perform
>>>>> in-band IPMI communication with their host in management (BMC) side.
>>>>>
>>>>> Thanks Dan for the copy_from_user() fix in the link below.
>>>>>
>>>>> Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan@os.amperecomputing.com/
>>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>>
>>>> I have been testing this on our hardware and I don't seem to be able
>>>> to get this driver working. I was using an older version.
>>>>
>>>> I have hacked ssifbridged to deal with the change in len from u8 to
>>>> unsigned int.
>>>>
>>>> It works as long as I only ever send SSIF commands, any attempt to
>>>> read a response crashes the state machine and the driver never
>>>> recovers. No further SSIF comms is possible! (slave doesnt even ACK
>>>> writes).
>>>>
>>>> A couple of comments below on possible state machine errors.
>>>>
>>>> Its possible I am doing something wrong!
>>>>
>>>
>>> Thanks Graeme for the test and the comments.
>>>
>>> What's your testing hardware?
>>>
>>> This was tested with Aspeed ast2500 and ast2600 with the patch series
>>> [1] below applied.
>>>
>>> If you use the same hw, could you pick the series and see if any thing
>>> improve ?
>>>
>>> [1] https://lore.kernel.org/all/20210616031046.2317-1-quan@os.amperecomputing.com/
>>>
>> Thanks, that patch series does stop the state machine crashing.
>>
>> I am testing on AST2600EVB with A1 rev, but we also have our own DC-SCM with
>> A3 chip.
>>
>> Responses are still not working for me, but I think that may be an error in
>> my ssifbridged hacks.
>>
>> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ssifbridged[335]: Read ssif
>> request message with len=13 netfn=44 lun=0 cmd=2
>>
>> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ipmid[312]: BootCode:
>> 000000000000000000
>>
>> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ssifbridged[335]: Send ssif
>> respond message with len=4 netfn=45 lun=0 cmd=2 cc=0
>>
>> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c kernel: ipmi-ssif-host 0-0010:
>> Warn: on_read_requested_event unexpected READ REQUESTED in state=SSIF_READY
>>
>> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c kernel: ipmi-ssif-host 0-0010:
>> Warn: on_stop_event unexpected SLAVE STOP in state=SSIF_ABORTING
>>
> Just to close the loop on this, I have now fully tested this driver on
> our setup internally.
> 
> Final hitch turned out to be an aardvark not issuing STOP events between
> reads/writes.
> 
> Thanks for the work.
> 

Thanks a lot Graeme, for the test.

- Quan
