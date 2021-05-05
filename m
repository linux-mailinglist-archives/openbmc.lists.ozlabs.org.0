Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F673733C7
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 04:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZh446n4qz2yyQ
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 12:48:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=i5awB0RJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.90;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=i5awB0RJ; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2090.outbound.protection.outlook.com [40.107.237.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZh3j1lBYz2xZM
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 12:48:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjHPUMVP8+fAiBRetZxN8brKryesNsEQ288w5L6qow/tEfGt95ZOje1r5s73DGpKA8heZui0htVJYBWoXJLbpvvzbXiFo8pEaaGbItDkS00Pndns0/YdYIFcAL03uyRat0shbme30ED297zn4GK++V3Z81CfHzNhsTXABsPaZc+MkxPvJtUP8vdhdSvRwus7xrjI/BwP/D4tVSfLMTTr5npfdrkf49/QRBDAmW/ezl78rnC4VjxvH1w5oV2rLrvwTi27zPd8r1N8wZNwzhLFGZCL7h9teFIw4CtqWo9l0OMAjZFzmSUCJFR/dkMNXz1A8YGvuMX1yv1CvcTAs9JrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/mTcMwK6H9tCxMQ03VEu2w2WbspqM250WIRjwAq+vw=;
 b=fKysjeUm/gS+jNnTokrHnPBqdsnN4JmKqYWWqo++xyEd83CTRJfxisQBR2ElfvM5JVw42nn1UuMKZkcHpu5AsamEbUXdyLZX/XgwSTMOnMnsir5pMMNSKQ0Y5KwyI/RVXQbvFK0pwG9b5E3rtnXhT5CRGWk6xd4RSOX2mrdaTqEqqqo/UVRQji14ZP+LPjC6+uoRaXSmzXUth3Z2IxNphQOM7Op1Rn0eVDJyYizBmHpEY7wYRPRIYZPDoicpHPtNremvj1XpBkpgVGS6UuDtiZs2F6j9oTaBv5KEyJZAfvX3Dy4i6luirBGKNvc794Gl8oWiNP5MJTjpOC7sWDigUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/mTcMwK6H9tCxMQ03VEu2w2WbspqM250WIRjwAq+vw=;
 b=i5awB0RJxQr5UH3Uszc2vOAXJiHsOpZuVG8qcUvrpl0sFOqgE0XWTID/X85ToFIoxuNyDzLDYFlhAO2nYnMtqnER6Q0nWob3oAPl9lp465V7zQ0etvu55SI5fMhyu9pAqJXimpLy0cm/T9qxnrG+vzCjX3dsOYaH4kQyzvamw/8=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4184.prod.exchangelabs.com (2603:10b6:a03:5e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24; Wed, 5 May 2021 02:48:24 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4065.037; Wed, 5 May 2021
 02:48:24 +0000
Subject: Re: How to add Redfish EventLog using commands
To: Ed Tanous <ed@tanous.net>
References: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
 <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <96ebfcea-5460-72b0-8741-8eabffa2c445@os.amperecomputing.com>
Date: Wed, 5 May 2021 09:48:17 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.112.237]
X-ClientProxiedBy: CY4PR21CA0035.namprd21.prod.outlook.com
 (2603:10b6:903:12b::21) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.112.237) by
 CY4PR21CA0035.namprd21.prod.outlook.com (2603:10b6:903:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.3 via Frontend
 Transport; Wed, 5 May 2021 02:48:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7024a30f-37d3-49c1-2cee-08d90f704049
X-MS-TrafficTypeDiagnostic: BYAPR01MB4184:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4184E3E99379E850A586F7088D599@BYAPR01MB4184.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cbm17j21tUFS2C8IQ9bNgpp1VusaKJN3z2Sxvsv3l5OJ37dqpUZBjxbXaH3ycB+VbczLiSJWVDlG+EbBgqmTjvLUBUGGSUlCLDNGu09wHZvhnT2Da/Uz/7yg8b0+CHwACRxR79ZNpXW3iQG+swNHb3wJi5gvYPPZub0Fn1W0uj7zB3KNjxvc4u3xG//B6F7Dh8t3xl9p4TTnheNb6pXn0mvHVXXcYgLU1qZ5qoSHSpeeFAshtci+RQPcq1JjEHyyikvunOq6f1OMWexn/7JZd0pfvpxEnatN/JSMHmmkvckrRA5NjoWNstb9k7/eB0Y3jD6CsaRMjpqUa/0btDLWe0rVqUXnJhFa0S7ExCWaopBI3JBaEkDl2ZjKCQI6g38+nIR5RTjbQ0z3A098Ga1N3fzc8eGVKWyqGSyHi4ZgfvHG2MUOomQLteDBzBE+XWrxROhNSzrrUGnL6EC1fBa5ztV/OP77O6hOE3YtKDgfRs2nc2Wnr3/zMHxvVr+FAWEZ/0dDbbz64VOdtwgav3pOmk98jqiDbZoTBJdJaDpDbgB9rgQ55p4AttoGD9OoYGhway/MvW4RH9Sr1DVMh6Vt1uJfL0/n0SzG3z+74jH8xA3mSJ5frylhC2hncAUWuYCf8JoM2KIbOjjxWGTZm9BHys1HIHUhSFMDv9Zf/1qwZc+Y8Pu4DpWncmhXQbm3ZNcFWk4HYHypj4diBpKjZIYJwwS2d+a1NacwCjL5COom0F8B25+8dWiYggQaI0svYrjnugakObLgahjZDROhU6zefJpB2qO8aKpPp7uvUrjJ+PtSnDj6zxsVJlgA3pi6R0CscECF86WsQ3+cwwr8nHvyfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(2616005)(16526019)(6506007)(478600001)(86362001)(8676002)(83380400001)(966005)(31696002)(38350700002)(53546011)(38100700002)(186003)(8936002)(6666004)(26005)(956004)(4326008)(316002)(6916009)(2906002)(52116002)(66476007)(66556008)(6486002)(66946007)(31686004)(6512007)(5660300002)(36456004)(45980500001)(42976004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEpxVVBtRmZJWDJSSkllV0dKZXlZaDY4akM2SFZySG56QTFHYWU4d3FXU1Vv?=
 =?utf-8?B?ZGtMdE5HUXpHTk5HaGdKdUpOOWlmMWJYRm1GZXZ6TkhSTG81ZllveDVuQmQr?=
 =?utf-8?B?ZmpJWGhNR1ljZStFUG12YWJiRUJrNncyNGYyNko1TGg2K1JoTU5HaDRTLzFm?=
 =?utf-8?B?SnZnTlBHa1prTGdDOXF3cWhsL3A0cGJoQ1ZsZEFKZktkUEtPQWw2SmszNlBJ?=
 =?utf-8?B?U0JiWmx5MVUvallaMURrWVU4L2V1czYxcHlHOTgwamR3QURuY2FOcFhLY1NF?=
 =?utf-8?B?dkNpTkU3KytMdVc0WXZHL1lrcWxRMEVqS0x4ZDY1cTltYXJNb080NVREcmMy?=
 =?utf-8?B?TVgwVFkzbHpBUFpGU1RJOVpsZGJZQXBNMjl3eDZuY3ozSThwZ05KbWgxV2hM?=
 =?utf-8?B?RHVOT2h2WitQWFZBNDJtK0pIdVNnRzNsRkloSGthUWlwc0NxQ1ZrNStJZ0sw?=
 =?utf-8?B?SWMydGJaN1VuQUFJSHlKQWFselJCaWgrVFkvSWVlQ3dybnNwOUwrdmUvaVNC?=
 =?utf-8?B?alliWUswVGJLMWxBRWRpdFhKMlV0RjdUSXFlVW9uUDZ0NVRyVVNEUlExSHhU?=
 =?utf-8?B?MmlMTkl1SndJanhSUGtpb1MrL3NZTDZEYTVodHBXU1QzUS9PNVBMazUzZmVi?=
 =?utf-8?B?RUFJdmQ4UlRrOHpMT250Sk14MVhJejBobmtrV1l4MmFWSm4yZG4xcHYxaFlV?=
 =?utf-8?B?RFRsYk1NeEtvQWh5M0ZFL25iT3piVk1ndG9HdHpaeEtucndVZzNoaHZrcHpQ?=
 =?utf-8?B?bHhTcy9CNEJHbE1ROVBQMWpRM0N4ak9qZE1MYnBZOUZzdGpibE9QM09IMThz?=
 =?utf-8?B?WGExMjMvTy8xRk9CUGdiWEkyUWQ1c254VWJTRGNmNWs1UGpOM1dlVmhXbEU2?=
 =?utf-8?B?UGNwUmR4MFl3K1l1eVNjRDZNaWZRekZyL0orN0V6MjZDcmRJR3JYbWs3Kysr?=
 =?utf-8?B?ZWl1OFVqYnFCT3BOVFlXU1lsaG9sUHNtVVNWMCtRa1ZMRFpEeVNFYmhFV3F1?=
 =?utf-8?B?MmQ3a1JxQno0Q2lWb1JaQ1JBWUl4TkJ6ZzdtSXp4NzU2SVJOak9FbWNrRmJT?=
 =?utf-8?B?Vm5kRlhJS3dWQmlRYlhKS2IrMnBZQzhtSWxFanJXWFJJSU5PTThvTXFWcU8x?=
 =?utf-8?B?d2ZLY1p4OG4vb2lsNW1DeTl3Q2I2ODZUWXNpWGFCREN0S2RIUEg1UFp4YWl3?=
 =?utf-8?B?RGpqK2tiQm15VVkrZ0kvVDJpZWpONjI5N1pSRnFpM3I5M0h6UXFzbWE4RmMv?=
 =?utf-8?B?U3hab3pTZTk2RnBIZkQ4WlJYS0FJS3E4cm8zV3p3cisxY0swSENicXFTZ1V2?=
 =?utf-8?B?bnBGTkVuNTlPTENYZW13RklGSTVEb0o5S1hjZ25tRUs1NldUTStsWkFhcWZa?=
 =?utf-8?B?L0hZSys4TEFpdkY5VUFoVjVmaFVUOGRPYnRNbXBHdWdmTG5qY2wwY1UrcHJk?=
 =?utf-8?B?eVB5dEVYeG1IVzlvaEdPTGpKTjJWVThlQ1ZBaXQrNjRDT3V4S2ZJNmViUkkx?=
 =?utf-8?B?UlNPNm1Gcko2TThOdjlFS0ZVQnFtbE9rTkRRMzdRSVZSTE9mUXZ1Q3pPWjVY?=
 =?utf-8?B?QklnSUdHMGZ2Q1Y2ZTV4N3NKOFJnaXFFaVZIRGhIR3c4aHdKNkMwZWp1RWZr?=
 =?utf-8?B?R1RLVk0yRjFDMjhMQmVMRC9CREhDOWVkcmF5bDFzazhSc2Joc0JmTFFzNjZU?=
 =?utf-8?B?OTNFc0ZGN0Qvamp0TVdZZklQZk1lcy91Nzc4eDI5SGhqUnEyaHpvcFJqenkw?=
 =?utf-8?Q?Lz89I16IlgmHGJXd7gob6o5yRPUqc7pNT+jFMIh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7024a30f-37d3-49c1-2cee-08d90f704049
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 02:48:24.0406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P94usLJMzPlyr3meh6iEgb5Imxt427tshQhOSY6QfnMOj1HPYHaOT71H+FxnYMX5dLs5jZPic3VzOPK5WhMZrrc4RgxQLWOLybE9KnMM5PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4184
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 05/05/2021 03:01, Ed Tanous wrote:
> On Tue, May 4, 2021 at 2:54 AM Thang Nguyen
> <thang@os.amperecomputing.com> wrote:
>> Hi,
>>
>> I am looking for the mechanism to add events to Redfish EventLog. I
>> checked on the Redfish EventService design
>> (https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md)
>> and it seems only has C++ functional calls (sd_journal_send(),
>> phosphor::logging::log(), ...) but not user commands that can be used in
>> the shell script.
> This kind of logging and handling would imply that your script has
> outlived what should realistically be put in a bash script, and should
> be rewritten in something compiled (probably c++).  Redfish logs
> require string and variable manipulation that is generally not well
> defined in bash scripts.
Written in C++ will add a need for additional repositories for simple 
features. And it seems not recommended.
>
>> There are many use cases for adding EventLogs:
>>
>> 1. Use phosphor-gpio-monitor to monitor signals like power/reset,
>> button, ... and log the event
> Considering that Redfish event log is for high level things, I suspect
> this isn't a great fit.  power/reset would be handled within whatever
> state system you're using (phosphor-state-manager or
> x86-power-control), right?

Agreed with you that some standard GPIO devices like power buttons and 
reset should be handled in applications like phosphor-state-manager. But 
for non-standard button like UID (to turn the UID LED on/off), VGA 
switch, ...

Any event should be logged.

>
>> 2. Use phosphor-gpio-monitor to check if the Host boot fail, control the
>> mux to switch to other boot devices, along with logging events.
> This seems like something that shouldn't be done from bash;
Currently I create internal repository to handle this in C++. But I 
think we can have simpler solution by using phosphor-gpio-monitor to 
monitor a GPIO (and control other GPIOs) and ability to log events.
>
>> 3. Check device presences (from /sys interfaces) and log events, ...
> Redfish itself should have no knowledge of specific linux interfaces,
> or linux at all.  Dependent on the actual /sys device you're looking
> for, there's probably already daemons that expose those types of
> events.  Without going into more specifics, I'm not sure this is
> advised.
I think it can refer to 
https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-gbs/recipes-gbs/gbs-detect-gpio-present/files/detect-gpio-present.sh 
but just replace IPMI SEL by Redfish event log.
>
>>
>> I checked on existing repositories like phosphor-sel-logger,
>> dbus-sensors, ... and they only support events for their features (like
>> power dc on/off, sensor threshold, inventory data added/removed, ...)
>> and the Redfish events added in C++.
> Which is I think the right design choice.
>
>> I can have a C++ codes to just support options to add different EventLog
>> data with parameters. But it can't be inside meta- folder so need a
>> repository for it.
> For what it's worth, the bash scripts shouldn't be going in the meta
> repo either.
But I can find many sh scripts in meta- folders. It goes with other recipes.
>
>> I think it's not worth for creating a new repo just
>> to support an application with dozen like of codes to just add EventLog.
> Disagree about whether it's worth it.  WIth that said, depending on
> what you're trying to do, there's likely already a repo for the
> feature you're trying to implement.
>
>> Do you have any idea of any existing repo support adding Redfish
>> EventLog from script/command line or any repo that we can extend to
>> support such command?
>>
>>
>> Best Regards,
>>
>> Thang Q. Nguyen -
>>
