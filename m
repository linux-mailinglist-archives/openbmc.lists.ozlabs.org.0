Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBC809AB4
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 04:55:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TYv97pbC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmckG0JLBz3cVg
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 14:55:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TYv97pbC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::726; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20726.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smcjg3vHKz2ykC
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 14:55:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPl7jUt5qSiTop1eXwcgJ3eygJvMGEZ98r+0N2KSHOH8YnEQ7H9TO3i6Bp+Lbp8OiibsJYdS/iwUeHWIyTzmIjO2N/L9uih/+uN2090148u9ArW/JhbxfiI8bFBKk4debcFi+Xh3N4I7gjdBGuW4tSStH/tKHjKuRe8AJh6hV/FvRqimNiu335iOnX7yZEdxdNZgGEvX56TNdOQBa9FCUbSfqJ8ojFXipUPYylhtTyVDFQAcIe0cp7cKTAvOE8peaU8DNZ7crGy4ukqH2rOfDzIN6ZliOcxAQOnZ1rS9HwcYLVxpxWNFlQBzhI98DAJ1rnCZX7vuRtpiKxdX9XEabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xy6HpB1vvKd5x6d7TRd4JXe7ZcOpH0I1gZ/kCFKvKU=;
 b=En7TkkkU2gxEt4nw0cLeVS5x63R8YfxyD0XLyYQV57rI2qEHUwGukPzRkO+43WM5diDP+OiA+nK7UTUlPvKkHSvRqVMLOBoUQqFGiQEGyvG6OMDKF7GzzTwmg40x3iim05XoKWri3P4U8w5i/yrqpXPcva8We+MVBMhEdSyh4ums/U87tPH4V8fpV1zEEMq+6WDHnpAF3OaenZLLtYkW3Isvh07d1TivC5z+AgqoTpq/nQTpf/EkdIW2lnDEWm3A4a2dwSvxQNIW7PuR18TQgxmd2aI1xl0RHJ56UG2NKy02jaZHDVgiDUy0+KaO1qqN2l5zLWlFWLJJjVzdiwDemQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xy6HpB1vvKd5x6d7TRd4JXe7ZcOpH0I1gZ/kCFKvKU=;
 b=TYv97pbC3bxHbW1SUJrSfevYmIeVrvmOvXZs7Lu1W+paDXOKuLwQqw3x3iT9mtOhzky5qqADZ1+UuMvL0DH36Ivsq5/EG0ymDbigVJ/NfaL02Ioi9BMo0qdSM+lyYAQESioJVVLzxSxMDrgaSCr02psZU4iZEGGu47781rABK2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA0PR01MB6220.prod.exchangelabs.com (2603:10b6:806:e2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 03:54:58 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 03:54:58 +0000
Message-ID: <18f842b7-7421-4b47-91dc-643300f81959@os.amperecomputing.com>
Date: Fri, 8 Dec 2023 10:54:49 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: OpenBMC Linux 6.6
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
 <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::18) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA0PR01MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbcf24f-6322-4bd9-0171-08dbf7a17228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nZ6bPGIQBuWR7ha0SwJs6jbvf4vJ2LgIE2Lu7OH56hpuauq5igAUlEzDN1hpQQivdXbRyHOSLL7eAfzm1cogFY9DqfvJ3EblxRC6slSdw62e8ZDc5dp3I0QjXZwh4L606YY14AgvnG+tU9J2fpJG6m6kvmmMU7djQXSCOjxictaiKdOk2fY+W09B2NyVJmGOdE6RzHTk86F16XphRrQBLzp7/0KtswZOSkk3X2GcfNqPPBKOqvFJRxCI+DAfqpmls/76qkfLe8hTCTsQGPB7WOE5zYVZF+SQbrpn0l2bTWZUwpO8ajVe+8COhm6bvFyqAsZykHSmSciygkuBrhbo94/zDlVkjGPaR7PlaDQg7E4jtvY95B7HO3jQh6BzTztFkXurjvS7BEG0uxbibECb+WiKv89inCZagOztHD7gN7mTMOpgVVwaaauJkHlYTMWd3EA14jIdftlcxz7erf49yb89SRoGXXcC6vtRZrx4FscCkN1E43c260n7DUss3nqtiXNwrHv1Yr1S9jQdJlHy+t/a4UYSQW5NfQhf4Ch+nGPbWUvLbTNEOFbwSp1bfq59rWYp0WSQ1DkSYzxG9adIalR2eN79+omJZDh5XCd98u0pELW8Vz5o8IkvB+knYyLaWNGa6vCsRJjGD/8n0p43uA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6666004)(53546011)(6506007)(83380400001)(8936002)(8676002)(26005)(7116003)(966005)(6486002)(31686004)(2616005)(6512007)(478600001)(38100700002)(6916009)(316002)(54906003)(66556008)(66946007)(66476007)(31696002)(41300700001)(86362001)(5660300002)(4326008)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WFozU3psN1RsL0h0M1FVMkVLUURydXVLRzZiQjNWaGZQaHorS1h1YkdmakYx?=
 =?utf-8?B?UStJc0xtQjRBbk1PcnFlMXlSRlN4VnBzWVorOHkreFZWVFVsYnhYVERncDl3?=
 =?utf-8?B?ZUdpR0U1aXpZYUd5eXJPTXkxdEJRV1JGSWJzZkw4MDYzZ2NJdjJycWgrMlA2?=
 =?utf-8?B?WlFDcHNrWUVoSGdZWktQM0llSDAweThxN0ZlRzVzaU04ak14N0h3TjRFRFBI?=
 =?utf-8?B?SE1xdDh1QjhDZUVMWjdzVVpHbmNjWkR5K2s0dDJySmxvbFhRTnltamxlMUVr?=
 =?utf-8?B?N3pkdTNHSUFabWdvUW5ycjZYMUJlQllDT2o4TDA2ZWJiUTg4UnFsUjdMR0xY?=
 =?utf-8?B?TEpwRzFvSUdsNmZGaHkyTTZsOGJhWWorQ0FCbUVmR2ExdCtDbElCUlIvU1pK?=
 =?utf-8?B?YWJhakJpMlVBbWZQdVJRTzFNa3ZBTUNKR09NT3VBVFpGRDRFRkNlRTZtMGN1?=
 =?utf-8?B?dDNaWlRiTkd3dU1NSHVJWUNGQjhjQnVOM1hDc2E0Vlp3UGJPSDJGNFgvb1l1?=
 =?utf-8?B?RFNWdVFRMEJBcDBXQ0xOd2QzTmxSU2hra3pGZG82RHFSNzUrVUJxcWQ2MXZh?=
 =?utf-8?B?aEViT3hYakVVMXQ4M2ZYMUtvTWFaS2x4WS9lQnRzVGpxbFQ2cnp3ckExRDFo?=
 =?utf-8?B?Tnl1TnBRUFNMak4yRXpqZXY5T0tDNCtJOGxNUXhPOFZNTktJdS9LWis2VUkx?=
 =?utf-8?B?SmloTTRaemV3WS9Nb1lpREJhU3A2UWE5ckFZenZ5N093bExKeGVmRUFzUnli?=
 =?utf-8?B?Zkp0MlIwcUVkRGhPOWJ0VDEyQS9XdU1XNkRtcVF0cDlpaVZhN0Y5MWc2blMz?=
 =?utf-8?B?eGl0VkRUeFoyQlRaMnBhQ0Y4WWV5WHk3cUNWL2VIektEelVwQXBOU2EyUFBl?=
 =?utf-8?B?cnQxVlhiVGo2aDdnc2ZqZE1sZTB2Z2RYaG9ydTZmZDhDVUdwR1ljWmdsUFpE?=
 =?utf-8?B?bUZydGhJMTNnaHNPbkUrOFJiamVQSklpSDZWd1ExSVgrcVdBUE1jcGErTG85?=
 =?utf-8?B?T01MTmg0bnlRMm5JcHZXSUtJTURveCtSZ0NLVWdDMzc5TFdmelNoZ01JVmt5?=
 =?utf-8?B?OEF2TnhhN2hlME9zTDZGLzJ3dkpKWWJ6Tlhhd0xRa2tWNG8ySlg2QVlhNTFz?=
 =?utf-8?B?WStwYWJ4RHZ5OTNZQlJMYk90bG5peGVKLzBUTm93dVh1R3BSM2hERWMwdytQ?=
 =?utf-8?B?bnFrU3hISEJUVmM2VUpjeUVDaUVHNWFJVW85aDNYL3FibUhwUWFkNDZUck96?=
 =?utf-8?B?WHVUSDUveldnVzVIcXNUbXh6NExxd251WVo0ZmkwSmdTZ0I2YXBHT0RCN0pt?=
 =?utf-8?B?ZTErWm0rME9FdWxoVm14dVd1dU54SmcyQUt5aHllbTF2Mk1tTmlKcnk2RXAv?=
 =?utf-8?B?N1JtbnhRWWY2N2llanJwNzgrbUxQem5VbzVic3NGYWkySm45K29IN1NpbTJk?=
 =?utf-8?B?OHVqQVNZamRHbHpLL1NHOGRIVFJIdWZ6Y3N1bDVXWkt3dmtvWXg1aWc5OEVx?=
 =?utf-8?B?QTE1UEIwMVkrSFk0ZHJnZTZHS2NyR01lYUhJRmhMZjRhNkkyZ1BETkhqUHBP?=
 =?utf-8?B?UEYyZEVCMEw3T0NqY1RHSm1Za2hhakk5aGJMTFRXNU9nM0JuOVlCSGE1NnJL?=
 =?utf-8?B?U3VGT0NjZ3J4Q0xaaUllaEk3OG1ka3dQbGl2bGYzZWxKaEFuUURZSjlCTVI4?=
 =?utf-8?B?RXR4TjhJdStBRGR6Z1NQK3RHQXRaSEZ2cVA1ZUtTTnFZSS8yQzN0Y3JWNytW?=
 =?utf-8?B?dWM0bWkvMitvTnVDUzhsOHVzSzVJdzJUOVFhTFVhMGMvMDRGK2JncHBiRGIr?=
 =?utf-8?B?bFFlRUNjT2ZFeHdIT29odVpWdVNLWHk0b2EvcDZNTGk0R2xSWG1WNERnLzJs?=
 =?utf-8?B?RGd1WmlWOTl4Z1k3TFc2SCt5VkpUT0VUUEk3dm5qWS9NVXUvOThXM2tMMk1L?=
 =?utf-8?B?clFGTHlhMjd6eTdIeDIwbXdZYUs1LzRlenJobFg2b0RkMWRjT3Q1bUtSK09m?=
 =?utf-8?B?VWFPSThsaUsrSWc1ejRySVJGa003bVQySDVDUm9odU1HNmJaTU9jdWlNMngr?=
 =?utf-8?B?cnhuR3JLdFEzejNmSDJNVjY2c3o3ZXN3Zzdid25ETFlaQi9NeGtyZ245YXJq?=
 =?utf-8?B?aU1tMk5BMlBRVTkyUFNqbGlEU1NJZWFsWDJCQ3JicXlWclIzV1Noc0hubGVW?=
 =?utf-8?Q?aOHZNw8IsNiNRJTznsGenlo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbcf24f-6322-4bd9-0171-08dbf7a17228
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:54:58.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAFjyKW/D35Kt0GDPt+wLEo4B08Ks+aT5AYl9LXHFTPvfff4ssSNr+4zPfrvTRNGqDB6g0ZcF6/JUYAHhRCCNAi/xkjcowgQdu9qEcxbYto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6220
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

We do have some pending patches for upstream, but unfortunately, they 
have not been merged yet. By the way, I'd like to list them here and 
hope to get more comments.

1. 
https://lore.kernel.org/all/20231130072849.3075741-1-quan@os.amperecomputing.com/
There is no feature change on this patch, just a minor change so that, 
in the case of the bmc ssif message abortion, the annoying printout is 
limited.

2. 
https://lore.kernel.org/all/20231208033142.1673232-3-quan@os.amperecomputing.com/
This series is to fix some issues found on the i2c-aspeed driver. This 
version is new and was posted just after I'm confident with the test 
results on ast2500 and ast2600.
My special thanks to Andrew, whose comment made the code look much 
better than my original version.

3. 
https://lore.kernel.org/all/20231130075247.3078931-1-quan@os.amperecomputing.com/
We do see significant improvement with this patch, which is just to 
simply requeue the mctp packet if, somehow, the i2c core returns with 
-EAGAIN (arbitration lost). Jeremy has not agreed yet, but I'd like to 
list it here to see more comments.

Thanks a lot in advance.
- Quan

On 06/12/2023 14:46, Joel Stanley wrote:
> On Wed, 6 Dec 2023 at 18:13, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>
>> Hi Joel,
>>
>> Thanks for supporting kernel 6.6
>>
>> Could you add the following NPCM drivers to kernel 6.6.
>>     support Nuvoton NPCM Video Capture/Encode Engine
>>     Add Nuvoton NPCM SGPIO feature
>>     MMC: add NPCM SDHCI driver support
>>     hwmon: npcm: add Arbel NPCM8XX support
>>     usb: ChipIdea: add Nuvoton NPCM UDC support
> 
> If you can send SHAs for the upstream commits, we can cherry pick them.
> 
> If they're not upstream, but someone is actively working on them, then
> please post the lore links and we can look at them.
> 
> Cheers,
> 
> Joel
