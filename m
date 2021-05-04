Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1581437244D
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 03:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ2m01F55z2yyb
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 11:47:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ke0bCar2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.93;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Ke0bCar2; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2093.outbound.protection.outlook.com [40.107.92.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ2lk6Vtnz2yRB
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 11:47:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeyUNLFN6UNRrPju1/VEyaHbIfGJ93YJB7vQFvyncD73tdJsGWojfQFiIWbkv8ZbuA5mtYf9mtMJllSl6vU2DD8JI35/RDf//zFJs3lqUeEAKWzyGenjjz+h2p6BNY2EaBsVrOIrywykz7NHB3bDwxLz8R3JUO90plzwNX41wXYFeToLTdak8Nqz+Nl18juyfYvvyJrSoNMc5pE5vOO4lA/Wy2vKFb2UbfgUL/HXEeQEAryiu1GvRj7xyQKgneZ7wNZXQ+CI5CwT4tk+Xq/p+ERPzToXpM0NV9eyZl13vSTwwBH7KdI80ilv/bsQIp8CqCt0IAFC4APSWX6BWR7Vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I88n5crhbU6V7RF4vEdFsx5HipbeI4iG6o0zVxYOyhE=;
 b=geOtYuBwYuJH+WnPqKldIlum8MjE+7k/eLzTFseLNe5HOpEUrxA+OJarVDAzs41gil9io4Q3zfU06O9uRWHdbO5JNQ9GKexwVbKgq6WW0ydUUnCHZVgiWJG59qN41Jel9VMnE7WD++QT/vckaQE7ZCze7v8wW/vUwcskM5UcaVfiiJSfrduOmQ59wc66YnQ2Qybn0UKLjuw7DReoTtn6ApC/2zeT0O+bJtOangJseE5nLQOo3EJ5n8U+HNmc3e5C/FIbWf6smY1cRSd+4HNWpAu3lqOkxtqf4vtfUAI3EMvNOZ3YnRhWD5MKbU4jJD5OQnstWmuEkyFxRYQooYTLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I88n5crhbU6V7RF4vEdFsx5HipbeI4iG6o0zVxYOyhE=;
 b=Ke0bCar2TBte5lNJJXWq3tX+pEB1jMMkvKtEp9WE1wFmVv2l5e9ZLnfp7P177csgts03rutn5QB6r+5lABHgMT5N19HpHnSHfFUyLmXQsgkDKTQbUChukbpUbiUnv4V/d+ZNXYQx6rRfqP/n5TdyXeUSNlUDqyaxF20YYvm/KBg=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4647.prod.exchangelabs.com (2603:10b6:a03:8a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.35; Tue, 4 May 2021 01:47:22 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4065.037; Tue, 4 May 2021
 01:47:22 +0000
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
To: Patrick Williams <patrick@stwcx.xyz>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <YILMPOZwlODKqxtb@heinlein>
 <7bec9fb2-35d5-8e44-463f-3eb5c0955f0d@os.amperecomputing.com>
 <YIwTaJ11MRUXY2H5@heinlein>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <c4c78ca7-f7cf-0995-887b-a7d7543061bb@os.amperecomputing.com>
Date: Tue, 4 May 2021 08:47:16 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <YIwTaJ11MRUXY2H5@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.112.237]
X-ClientProxiedBy: CY4PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:903:102::23) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.112.237) by
 CY4PR16CA0013.namprd16.prod.outlook.com (2603:10b6:903:102::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Tue, 4 May 2021 01:47:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb22e02-3f43-4614-9085-08d90e9e8f60
X-MS-TrafficTypeDiagnostic: BYAPR01MB4647:
X-Microsoft-Antispam-PRVS: <BYAPR01MB46474906C3F3961A156772508D5A9@BYAPR01MB4647.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqRt+KJiTLLjqGw6KOsPPgXruPE+P+c3EU5s2wVz1hH+tI7NCyxRpMiP0ffGwi4iuXSVdZ9Sg8P596UpEAbC7scAOeJ7G/DKuZv6m48LDYI3KUKK/O8qSnMHaUvzuCH0opSXP2t5TyY5Bnm7H67QOrhG+/E9EouwMB9UycIoE3xQ1Jbrx0ivAGZfFxvg+YwvrjsqBh7oVg77/Rlju+v38S+ASxmJEcupkwjWUh5R4hr2Iafibv/ZyTvc5cgFZ7avIAH3+9nmBUzl506VOqZJJrcdWlLsWBNYBZrSt8ltrAzkiVUtfT8RtnEQ+f7lH7X+310bHefg4wOhCbAJ7qbLSsDjFP6CPHP7F6ocHESRd4JzK+F0n/Odp+ybLU6+DgYC34cjXsjGnwWXQWieHLbDBAtLPWeTaHS1o3WZCkOKUsjBNg4/oqXVoEKv08U+v+4eYpIhG4kz4/IAvc0T0A9CW/LrmU5PVwBc0xifUtaE8lDzXuaVLCJ7XxTwMvK3ZnTECc07+vZdV8eXaX21fuLztWrzvHZqRILs+uy5xjsuD+WiUKB90HAWXj1WnHFe5Caarq/pktFFKlCZMgWXhmayUkAea6pZMhYNK/P3nYw56jF8PmPt60gKGs16DCCjlNrzYwgVzNcknljidmagUrJrUu4kICzIyu4UWfQjgpcHy+OzeB+NEuWKrGi3uQJhKzmzA91It68pP/QWmgTkGkaapoF4f1Tt+onc1ef2eIC82w5lsleMlNxXtfl+bwvtxxugkyRaLFn/v+tXss++VPiVlAzGVQ09ql3hDFV44bCLE7mW7o8bovMrT+DBD1SvtBahgCNVjAxMjsfR74BCKCw9wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(366004)(376002)(136003)(396003)(31696002)(478600001)(38100700002)(5660300002)(66556008)(956004)(83380400001)(38350700002)(966005)(316002)(2616005)(6666004)(66946007)(8676002)(66476007)(86362001)(4326008)(6916009)(52116002)(16526019)(6512007)(6506007)(8936002)(2906002)(53546011)(26005)(31686004)(6486002)(186003)(36456004)(42976004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?3DMTfRVvwhodCtInjUtHmwvDo98N+tJECkYVNj9HX4PSY0E5/Rz/l+S3?=
 =?Windows-1252?Q?nGyi0c7yz0hHodUDywOexIJeeZRg5pcCnQ8CBA9azN/jPc40gckarqOE?=
 =?Windows-1252?Q?D1J5bw5IBJe9QkWCb/FUedT7JNw8N4GmiYadEka8AQkUHUvKW7utAKzf?=
 =?Windows-1252?Q?tqBY2tOudsSStXeEyOS8jrXQGVSBhRM7voR75oEXhBymPJ18ALwT2+Ww?=
 =?Windows-1252?Q?x7ZJmBMCZwdTvNS6OFw2smuXXh1aZChRoPsmAVlsrPn6d/uEiuoK2/I5?=
 =?Windows-1252?Q?mGClDL4Hd5Oe0GI5v+Ltfg7BwBSIScvzxKyz2rKTq/0cEn6KB/W8+XsJ?=
 =?Windows-1252?Q?QA5FHhFXatHYv/dBwgwLJXRAxm2pZr4FiJrj18I58Ldif/LdHJRXbZIi?=
 =?Windows-1252?Q?ZSCDYfOPmwRGpTsxU4L6lf7hYJ9qMeokC+qqjzsqDleNXJh3XEZR9TT2?=
 =?Windows-1252?Q?6ZZYrfb/5aDABQHwVpkPCVfcSdAMw4TrsFdK2kIgLN5hwA0W6hLOKSGE?=
 =?Windows-1252?Q?biloTojqd3zW1PhlxbJLsVYBL0SuA9z/y3VY/SFHPyk7D8Sakmx3GiDj?=
 =?Windows-1252?Q?Y61l6qTYDX+z91H0sH9ZlTDfnNrWvkYwAf7sO+L5QINRAwWM5tJ09agK?=
 =?Windows-1252?Q?xY4roccfh2j6xp1Px37MApLmBuX79uCEkRAgBcx2nMd+4pu1F+wmv37o?=
 =?Windows-1252?Q?YXywGU7oClM8PLVOooCdlpLzHCUQEU6+8B8I9/4CH1u8seCy9CJHqM6v?=
 =?Windows-1252?Q?UhyCIgFSUMpupPlaVmJ49Eh9Yi7tR9roWu7Pm/aVL9oCpL+avcRaXxsB?=
 =?Windows-1252?Q?lU5kn2uiR2NFZhOqot0sC1RkoyFlmbv0sBTZx2+uke9C2mxpecwfXnww?=
 =?Windows-1252?Q?rNkLwi+vv4OP22xyPEzq3dDmmL6MkLApqIVeXnEuxP91zS+YFHEcooXk?=
 =?Windows-1252?Q?392AJRJR+zxFFhQSUg9YlQDCrQ9aauN2vKZbA60FnXG0I+wmHcEfIVUI?=
 =?Windows-1252?Q?rf9dHTzyK3fkucZNuj0jjjzfN/IOGn0Ul20v+lZxaW/YdhS3yxj39urg?=
 =?Windows-1252?Q?ptYP6BwTQXvr/t5d2lzVHtfS1osqDimzBTaeF3uGFvaRgLCAxk5f96ux?=
 =?Windows-1252?Q?14BazHNk865RuXDdfuDYqVR32HXtyIv9WacAC+kcAS9A0G5VUPxs/FPx?=
 =?Windows-1252?Q?UIho1sHL+44gmEbq52Xdu/ssHVvhLJzY08+nxyduFlgY2UZ6T2ElVSiO?=
 =?Windows-1252?Q?ntDFP1wZVrBCIYsVjN51aTP0qx50U0ns+V7sgi7ULGcoFKqltBYEiSXK?=
 =?Windows-1252?Q?Vn+NjQVxFJFCzbHof1qTB0AzgNqvpsc/+DQ9BWyJ8a/V0TrzVkbrBl8p?=
 =?Windows-1252?Q?md7Xj79SLUeABezMMs1+SfuIvAs1myoStRB8JUKwzDSJaDL/+6m2GqDU?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb22e02-3f43-4614-9085-08d90e9e8f60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 01:47:22.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5csew5wOwO82YCv6pT5GGW70sW9BEGEiDUg2JAXdhYHiXOvRkdwa/R5I4bX6OKGwZj9JiELyOdnjKr7N9wkVjQIlHTzV1Ktf3/wwLqu1b1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4647
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 30/04/2021 21:25, Patrick Williams wrote:
> On Sat, Apr 24, 2021 at 07:48:14PM +0700, Thang Nguyen wrote:
>> I intend to push Ampere specific features, you can find current codes at
>> https://github.com/ampere-openbmc/ampere-platform-mgmt.
> It seems to me like all of the functional areas you mentioned we already
> have some sort of implementation.  It would be better if you could work
> with the maintainers on these repositories to see how it can be enhanced
> to support your use case.  As I mentioned in another email thread today,
> I really don't want to see catch-all repositories being created.
>
> If you have specific features that aren't covered by an existing
> repository or you feel like you've ran into a roadblock coming to
> consensus with the developers already working in those areas, we should
> revisit making repositories for those specific functional areas.
>
>> It is good to have any of below can be implemented with current existing
>> repositories:
>>
>> - utilities to flash Ampere Host firmware and NVPARM: Boot EEPROM,
>> UEFI/ATF firmware, ...
> Are these extra utilities or the firmware update procedures themselves?
> Have you already implemented support in phosphor-bmc-code-mgmt?  There
> are other systems that have BIOS update for x86 done in that repository.
>
>> - Control boot EEPROM based on current input GPIO and log the
>> information into Redfish
>> (https://github.com/ampere-openbmc/ampere-platform-mgmt/tree/ampere/altra/host-control/scp-failover)
> This looks like something that could be implemented with
> phosphor-gpio-monitor.  Have you looked at that?
>
>> - Handle boot progress from Ampere's Altra SMpro, log the progress into
>> Redfish and update dbus. Note that the boot progress is based on
>> information from EDK2 and other firmware like ATF and SMpro.
> You can probably fit this into the existing post-code repositories:
>      - phosphor-host-postd
>      - phosphor-post-code-manager
>
> We recently did similar for a system where we get the post codes over
> IPMB rather than GPIOs.
Thanks Patrick for the information. Let me investigate more on these 
repositories to see if I can use them for Ampere specific requirements.
>> - Handle events from Ampere Altra's SMpro (like Sideband controller) and
>> log to IPMI SEL and Redfish.
> This sounds like it should go into ampere-ipmi-oem?  I'm making an
> assumption that the SMpro is an IPMB path, which might be wrong.
>
