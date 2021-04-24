Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A736A141
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 14:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FS9vN3jyvz300b
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 22:48:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=NGhibAws;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.91;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=NGhibAws; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2091.outbound.protection.outlook.com [40.107.244.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FS9v64Ljlz2xy8
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 22:48:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeDrg3yoEDyKGf84B2i95kW1OE7TdNhqmfgE0ZW7nINFTujq07RAktf/CMfHFSs0VaIAiw7c5YsVoEDdub32xBPK/42Vj1OJwkAG/ReSaL9Gz6QanChBS0ojkaZ+vyz5mqUw7ASdjSOKkg8i/w6r6SlJqv2tTWFZVSQV1yybRoRXYqU5vETqXf6rwFlpjW1O5lamZ8k0wq3do3dfKaGsB661CY29l+uK1iXmLRKUrmsMyv4SFQhWSU6yLJiH3UuqTMcdQjfi2UKM2Bd0k4kLTvMjLFLyR6Myjj0a3NqaYyduSOECLWwJ4g18IOB9UykjBYa9znv0T5f1QfECwatY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID5EWRVeGbUXVK+8dvitD2ttgZBoc6ibGbj6HxztALw=;
 b=bSelvipDeVE8r/mDcS4SZTetJnWo5s4FyFcFq9Lju0IGJyipwrngOVJtlkPos2EVNKSFu6lmNJL7QqWuIIUNm/QGmvfjbIYYqZCD26LMBnbaB9QdjKjLB7pbHR+nPruZ1CcJ0tAeECg0dzQOHhllGibuoBZI/nIro7K7jas6MMqYhSZtgZ4H6BS8nRDLjHOVaDD7vZ1i4Tm95lyJH5mpjHBHCqoIdKVT/b3K/TzgjbZqlAqWNbPF6teJXTpUbtHwLFVlfeYPLrN7ZDRHmk8nx9mnrXNRJlpHiZf9RG5tM1a6NNA2JlmjdAsoqH+S8WMSKZvs5w+qpWFCSgd2fzUzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID5EWRVeGbUXVK+8dvitD2ttgZBoc6ibGbj6HxztALw=;
 b=NGhibAwsh6CfgY/mWjJ+5SDT267N+Y3a3Ob2qvLdSOBuIxIYAY6IIkb53Pnhms3lRlOujSRnTgkwLCmc+F5wxLdbPRf1TJQcNQLQaYl6BKuie8ECm44M9beEA97dnjf/289QZ9Zef8yAhtAbnhbxpUm8w/cnl1vJPQARZHKok3Y=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 SJ0PR01MB6238.prod.exchangelabs.com (2603:10b6:a03:29f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.23; Sat, 24 Apr 2021 12:48:25 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4065.024; Sat, 24 Apr 2021
 12:48:25 +0000
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
To: Patrick Williams <patrick@stwcx.xyz>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <YILMPOZwlODKqxtb@heinlein>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <7bec9fb2-35d5-8e44-463f-3eb5c0955f0d@os.amperecomputing.com>
Date: Sat, 24 Apr 2021 19:48:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <YILMPOZwlODKqxtb@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [42.119.82.51]
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-fvfx4014hv2j.lan (42.119.82.51) by
 SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Sat, 24 Apr 2021 12:48:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: babd2659-3596-476e-fe90-08d9071f4040
X-MS-TrafficTypeDiagnostic: SJ0PR01MB6238:
X-Microsoft-Antispam-PRVS: <SJ0PR01MB6238A7D775C44B5EFCAFBFAB8D449@SJ0PR01MB6238.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8S24vShdr/wRLBQAGd0v29nSM4LBpii+b3AkDiJKwFJQfIul6fEpgzHvMJeGF/MsMR0blepf66zhFqhtFaU8e7C3E5CifJYZhvJjSupMRLcbakoicL/jfIayI7+tD7cepyYByi9mw0RXsGTI5umIRWLQ/qSx5g6xi3naFox1ms3SPIQbNZyITs1ql5BBCGXqKPA2VVK89zpLxlWpwoLNEFPRsa5pfwQYCi5++s11TQAQMVlU5jCmsxlI+6DHNKp9S2pdBwgR8gGePjGcYvVsKDMpZHSPHA2gr2n8rPhu1wxviVTvim2eVL4jSOP9fkLJ3bOcn1AaBqVEy5wcnn24a+a3G2ax/3zcxLHDHKSXzeQRjZ68LjMbNjns/MaEvxrn2haMHK/sMaRv2YOp/89mwhLQ1mH0PMVgy/M395hdpsr45/A63K0vMNMq102A8ipDnYl39EphXyeIs2ZckurMN6dVCCdYgkHJKJFxzGG7PjRuYlcjDI8up7gSnZOBNKfqGGvuIhFiG7X6BNrrLUSSBjXGWYoSGHT3op2HpqSOriwUClE4YOu61EhU762ptbxsyCCPF3f6yliVG5z8/djPMou83JvAM6jThzE2PJQ+936Qmz8MVcuF6+6SVYto3vbGg59Hsxjwh68j1upOyxoBBNgOlB6XjMUWTcfTuAPS/stP50e7tjWDDfa+bSVrX6eMlmZDu3ma0QVyGcdtX0+e29CD9kS/T9frzCmNrLZuZ8kXtjzYFkMdUKno8OClRXOGs4avT0HhLfQIT8r5cpMSFQOhZcy/zkPCQNRlzoD7A+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(366004)(396003)(376002)(38350700002)(2616005)(956004)(6486002)(38100700002)(8936002)(186003)(16526019)(6666004)(966005)(6506007)(86362001)(2906002)(31686004)(478600001)(5660300002)(83380400001)(84040400003)(66946007)(31696002)(53546011)(52116002)(316002)(66556008)(6916009)(8886007)(4326008)(66476007)(26005)(8676002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?P5MhIOsmNl0LWFsLlR9yEbj4dTumrz8n1/COlF+tU3iu1z2JOypviXBG?=
 =?Windows-1252?Q?bJ5n+oYKlcTWRsoy3YQUsPSNt7EQhRelKxp7MR61GxfOc1sDwKo7akN7?=
 =?Windows-1252?Q?OwVnl7ZixCkjlXNt9yyYpRFmErp6atz+ffoRaKHWPSAvGV/OgC61uxT6?=
 =?Windows-1252?Q?3oA9j79MeRw6L4mPZ4QmgA80arApkfLX5mIw8Dkcc28vlf2vP7wn4fan?=
 =?Windows-1252?Q?qyRGCkZxIM78R5ItLgZSEx7OBY78suZ/aNvXZQtqFo9q0M2bR/GGLAvi?=
 =?Windows-1252?Q?lxbvbYxsFMmewme14IZkaPcKWwaYI953NeiZHXThqg4+sflQWSYNRUct?=
 =?Windows-1252?Q?FijxOCl+wgbukRIBnfoz9mm9W2WC6OjDyHVrw5MrMGPpe1AgyMJtFp8X?=
 =?Windows-1252?Q?tv8kcD7wY2aSwswx9rR2hsLFBJLdJoD7cOjE8hu7naBwNf2VsvgG0Lrq?=
 =?Windows-1252?Q?FC6+ZlGLb1JbwNWspava2qmpw2Ga/gUnrueeak6Ywi7M20iQmhL00nfl?=
 =?Windows-1252?Q?KpTeFA4rOYDLf/YYpJBoF9hosVzRvurg+WUArr+F04b8UDGfqb1m1300?=
 =?Windows-1252?Q?ft33jtEutafSg4j9YKxPWCvYIRF40EojjIkMKqeyegtVrMKWy2iCUU9i?=
 =?Windows-1252?Q?XCKLk7uTQfggvvXbeTI1VP+D5hJ3rMiXFxwHB+kbgBNCX6wAJT6jsbgg?=
 =?Windows-1252?Q?pb/+LhUUDzRM39mPBcQKLiWe+5fO03VDj2Vg286MuVvk8Vv0OPMExVQm?=
 =?Windows-1252?Q?m2Heyam+8haV1g+Lb32Nbm4Ady4DKPt1WAjln7lyEXTi9fhouvTvV4xP?=
 =?Windows-1252?Q?UQC8ZKxK/1s1Y6tpoOZrQxV5TVOZzXJ0Hp5Tk21gBTX3AAw1BhnvjwPJ?=
 =?Windows-1252?Q?kpKV1bXuCbAYOglblXhMSsdumnjhfn9P8h4aGarZPhm0D0qpWFWrJVMk?=
 =?Windows-1252?Q?vpVxz7cikFwNRf91HVq/J5Ixhfza+NFAnGGVRkms2HK5M59XzIORy+eA?=
 =?Windows-1252?Q?JbnN9L7TTMssQ0J/ntBOx/Iov1VwVbXnwYEzXIqcD2aozifH4AFSlKEW?=
 =?Windows-1252?Q?gJDLPsLQv+mN6dO9VEo15XwaZHNZH3C7OmRkqmKx35Og2DuUJ0/6Ab4X?=
 =?Windows-1252?Q?wuF7Rt9xkCkoNdL5V4nPmD/+dWrsVa1lidzV7qSEO35vMhhK4LDI5SGE?=
 =?Windows-1252?Q?MeDFLjPXyU2ftxD4cukI0MVOGzp0uQipHF0+OYtr2Ip/wf6Z5HLBAIKp?=
 =?Windows-1252?Q?xPWHqXHUggetYqAGKDODF/GRuBfFu3v/bGwGzLWTtjNAiaPsHOgO6afh?=
 =?Windows-1252?Q?aluXJtTCWJ03/rjubAUYsNC25zaFn7nyXaLu473wN97YVJcziRVBxaho?=
 =?Windows-1252?Q?DAGXXjMuNjdK5JLENFSCF6GZckMb92okmMKOgSUhNzjE+YficNkH0Vtv?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babd2659-3596-476e-fe90-08d9071f4040
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2021 12:48:25.4306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzNDE2T2c8sgQeP1yQsiuypwmATLBhtItNnquM7rqEmzsniiG9CAa0gWEgfF315hHGcljYzQrigsN9yo3IBbRddn5hQLa7rpf4JI+aKaCF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6238
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

Hi Patrick

On 23/04/2021 20:31, Patrick Williams wrote:
> On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:
>
> Hello Thang,
>
>> Can you help create 2 new repositories for Ampere specific codes:
>>
>> - ampere-platform-mgmt: contains codes for Ampere specific applications
>> to monitor and control Ampere's Host like RAS error handling, Temp
>> event, ...
> This sounds fairly vague and potentially overlapping with some existing
> repositories.  Can we get designs on this to understand the scope and
> applicability to other systems?  It is quite possible that pieces of
> this already exist elsewhere in the codebase or could be extended with
> minimal effort to fit your needs.

I intend to push Ampere specific features, you can find current codes at 
https://github.com/ampere-openbmc/ampere-platform-mgmt.

It is good to have any of below can be implemented with current existing 
repositories:

- utilities to flash Ampere Host firmware and NVPARM: Boot EEPROM, 
UEFI/ATF firmware, ...

- Control boot EEPROM based on current input GPIO and log the 
information into Redfish 
(https://github.com/ampere-openbmc/ampere-platform-mgmt/tree/ampere/altra/host-control/scp-failover)

- Handle boot progress from Ampere's Altra SMpro, log the progress into 
Redfish and update dbus. Note that the boot progress is based on 
information from EDK2 and other firmware like ATF and SMpro.

- Handle events from Ampere Altra's SMpro (like Sideband controller) and 
log to IPMI SEL and Redfish.

>
>> - ampere-ipmi-oem: contains codes for Ampere specific IPMI command support.
> We certainly have precidence for <company>-ipmi-oem repositories, but I
> think there is a desire to reduce them and try to make the IPMI handlers
> more common.  I don't know if anyone is actively leading that effort
> though, so in keeping with the existing precidence it seems like we
> should create this repository for you.
>
