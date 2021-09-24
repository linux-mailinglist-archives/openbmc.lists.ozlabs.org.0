Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A9417053
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 12:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG7ZX0gHrz2yQ9
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 20:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=KOja8ses;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.212.99;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=KOja8ses; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2099.outbound.protection.outlook.com [40.107.212.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG7Z34x6xz2y0B
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 20:29:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhyNuHxTDq0x+/VP/AQLisVobbXJ5EDwlNVoSUJakZ4PJlOdGNxBYfD/QuiiGz9YlSJwd9c+J4XoUL6ahBWjYKZcNvp712RchaRz6reUModpC513NbJGHJ2RTu5Vr036Y+FGAcIbBKDDZQl4LWGW/TT78iD37jcS8yRIeKEVCECnmQMmFJU1CVFHXKqFQnwPxE6DdqLecs8etdzyn7wKo1wKQp0YQwvFjkMVfCei+al01CwHFdX34aqGeinL7XWoXo0BvEcZMSrypaDJatNed92q4ocboG7kZwAkku3YaCuZ+XB9h159clVbsEq8A+Ofl4/daShx4DEc6sHLqmo+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ot7zFND65yipJj00czULCQYT/amusPg/JLC0SSe9Kfg=;
 b=C5j+AnXiSj+u+A3KYpRNbe5deOAx7Fdncw+TE7Ax9vt0L0mMAOIb1HgqmoNlIonKjgNDdxnF4BPh9sS73oSLALVWDYU8MSOqxtrkc1oZRw6PysIYEwVKt7z9OjoD6kjaHU8L+UYygbyDYkkJ2u4dTzbzQeRcTGpih7IhNylqn2rYIVAwOJJr79rN+51S+QHGMs0bqmrc8aQw9kX+Gw1oCG/vsww1AodaMMrzniekFx/F3YZhtHFkn1h+kDInMqJtr4UIzR2M+2TR2wBsGTgNabFww8Bd42OBxCowdoLZB7j6ynkoINMxrAWcmOT8vHQiOelBchZtmP1NF24AmEalBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot7zFND65yipJj00czULCQYT/amusPg/JLC0SSe9Kfg=;
 b=KOja8ses/7ki33b910e0s0qUEZCH/RlHh427sF9e/2nMCMhTEv4r1tDxzGbB5ih6Eo2eaqCDO7ETi6soBhdsf9Q5GeGCtLAXPJWs4vzRCIZutYZWQfqwKFEVEhz4VPjcbikk7vFwDAfW+2p/UESDiQCK4xtMUgwaLzOxmjxo2nw=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6772.prod.exchangelabs.com (2603:10b6:a03:366::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Fri, 24 Sep 2021 10:29:07 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::f835:58d6:d2c8:c593]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::f835:58d6:d2c8:c593%4]) with mapi id 15.20.4544.015; Fri, 24 Sep 2021
 10:29:07 +0000
Subject: Re: New test for patches in openbmc/openbmc
To: openbmc@lists.ozlabs.org
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
Date: Fri, 24 Sep 2021 17:28:58 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from HCM-FVFX4014HV2J.local (42.119.231.194) by
 HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:29:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc2ac25-cbc2-4be0-a14e-08d97f462364
X-MS-TrafficTypeDiagnostic: BY3PR01MB6772:
X-Microsoft-Antispam-PRVS: <BY3PR01MB67723EF183EFE4152738FE558DA49@BY3PR01MB6772.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPhmr3tKMuaCU28kkgxK3zjoC1AzdtI12guhLiuLlbFJpe2825V14fyeBY66vSdrlG/kUQtAeNXYxPgA+FaKGkh0uy2kLzWRmOFq2YUNGuTHbQwhGpWEjYWQSbDHdboNaF9LNZbwgYtYtE70o+5TobsXwpZpny+G3jz/drYZjALmT4QGZ/x14JWLk/6wkaMYChOgD1DKhznWH/Fc7UZpj5nYc1U/2pcFZhjVaytpDXKrOIR8f3pIaH+thxySwMjKQ9vd0bbIk7CEZad9bQtQ3Jc/Fa8g+uHTOsAhXwWQFkazc6uURk49HaCCFVmKe/xdYM/pwLbQ4Nj1yHUbtHS9ZRnuI2r91p/3KpudvwLNI6Z7d+L1S46/EXjhhTrg/aqY0UxXr1VB5V6F76c/QF2VMU0VhxZxJjCoYcNlxrrnJtzgPXmgxXi+8LyxucjZC9KP9+UZFDLXve9iLnuU77uVsdn6Sa0dDfPI8a85VBlfMkx70DOlwMANK6HRskqFYSRKbVMErG2wfl906hu4imoQaffE+G6EKIZ0Ry5XbaxpPw9Gvaas4g2Q/i+aZN56aac6X8KUjpnNNyKUx8Ite9pnoUD7hmnuGe2u197UAQ6bFQ0cdDdFoZZyPPqW/zDOyL3K24uhJgz5dUzjSjbzhWU4u8C8ek0QsiQcM6Zi6obuJmwxxVBXqaVY7WUEteggbOGAEAQaH2fBKZ1Xck6lvk7KWLYl0K0x80x5TW3TC0M+a0uaFjyvQXXnuJW7yNJdZEstbMM8c5j2M17JtCj5zHcIygTfbqAEU7+WcfvfQiu4ooih+370TZup+0Op6yAikUv5l5jSinEidtmwfRFNsNbbFhiZwTPHGjIdAzuA8wxmhxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6916009)(83380400001)(2616005)(186003)(966005)(6512007)(26005)(38350700002)(6666004)(66946007)(66476007)(6506007)(53546011)(2906002)(42882007)(508600001)(38100700002)(8936002)(8676002)(316002)(5660300002)(956004)(52116002)(30864003)(31686004)(83170400001)(31696002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUEzd1BVdTc1Wm5UYlhLWGZDenRjbFMxbk50L0FBcG1EbmpGMVZkbkM3K2R2?=
 =?utf-8?B?MkdWTXpzZDFKRndkR3JYRHU1ZEU3d2hJYXpJa1JpeFAvNXVURHVhTURSdkoy?=
 =?utf-8?B?c3pSR3UvSHF0RGU5dkhYVndxRUpLcUVUcG02d3BMckFzeEkyb1FxNU94SFpF?=
 =?utf-8?B?MWgrYXB2WnJnbEdzSnUwaFRYN0x5Q2VHZ2d2ek5VMSttUmluWlRjeDJEczNt?=
 =?utf-8?B?WEdnZGJzUFAwcW9HS1had1hxcWhUeGNieVlUbW1oQkZ6Z2hWbUF3dlpwclln?=
 =?utf-8?B?TFBpcCtabDJac1J2cFlxWEx2bnJUR0cva2hsTjU1TDBCdGltcWtQMUFrWGVl?=
 =?utf-8?B?OUl5ZzIvWHR5KzlVcnM1b2pROU56dnNLV1FqZ0EvSGxnUDhDZzV5V3hhcXN0?=
 =?utf-8?B?VjB2SWpJcVhDTVNTeXk1anlHL1JGMlpBcldWS21pS3c4L0FYVE12TWpSdjU4?=
 =?utf-8?B?OEVnVW92WERDZHp4MmRCL2VNTEJEZ1FNcTVONmNlaHJlMkI2UE5NdTR4ckIy?=
 =?utf-8?B?Tm5LOG1OK2NyaEJGMDVzVlRKbnZiTmJCekFWay9KSEl1ZzF6ZTNLM1RHZ3VG?=
 =?utf-8?B?OTVDTmIvR08rb0F2dzV2cjRoRllTMEVYWFBaQ3pxR1kveDM3WUhMMzJwa0c5?=
 =?utf-8?B?L05IN3o5ZWpyYkEzL2hSdXhLai9GOFJIeUdCTEJJQzgraG5paWdXdXVCUWxw?=
 =?utf-8?B?VldEeThzVEd1VXBwaGtyYjUzOUpQM0N5alBSTWlXaGZhNHJFejUzUW95NWwx?=
 =?utf-8?B?cHBXWWZDcGo0bG5aNFZ0UWNVK3pPalYveHFLTlRBQVVPK3h3czhHd29ZaTZW?=
 =?utf-8?B?U1NjSS95UXAyajY2alNPOWg2YmtndmthdEppaUt1Yi9GdmdqNWN1T3dCbXNV?=
 =?utf-8?B?NlpSTUswT2Y1VDBpcjVEaUxrdXVWTWthVWVWdm52MWhJeUk2Z0dGaFlQUjIz?=
 =?utf-8?B?MnFnTE1WcWZGQjlGWU9xenNnaGtZckhBNHQvQmFKbWZjK1JuTmw3enlTeU9I?=
 =?utf-8?B?ei9zblFGaGVJWmluUER5U0JjdHdzclVwR1N4TXRRdlNHcGhsUVh3Uzc3VGl6?=
 =?utf-8?B?SFh4bHZ0MGdTQmlmUDlJaTQ2SDVtNmJENG5YOHg2QjFwTTJjT0p3TjNEaDMr?=
 =?utf-8?B?Sk9SeFZSWmpBK1Bha2ZPRUxzR3lDbVF1dGNob0NsamJzWXhFYVhwWEFWTmVJ?=
 =?utf-8?B?MWRLUjRoOEZveVFJLzYvYjZDUmdxemt0bXU4aG96dkFYbmdjS1p6Z1AzRERw?=
 =?utf-8?B?U2FCMjJFL05NS0xCcFE5RnBGRjdEWUM1T3puTXpqUURldit0bnlxMkpwdGZz?=
 =?utf-8?B?VzU4c1ErSzJMNm5kWXgyWkYrVnI5dk1MaXhRV1RwQWVuU3JxVUhWVFhiY2xE?=
 =?utf-8?B?UzF5WjVCNUhZb2x1VlpJYjRIYlZNRzBEeVZXdXRFMUZraWlzRUVqVll1U29q?=
 =?utf-8?B?MW96aWpLLzFoT3hMUkw4RXljRjB0N01EVHZsZVd4VmtISXVIZmRTbWRZRTlj?=
 =?utf-8?B?Y0MxSmF1aTl6MWt1UEpINEZjSmowTTFxZndPREIrQ1NsTUlua1U3QU5ZTmZB?=
 =?utf-8?B?K2NlVDhRVks0MHI0d2F2SktvWWNPM2xoaXNzUkM2djNKcEFWZTh0dkdLOUZT?=
 =?utf-8?B?OFZ2N0pBNlRINEt2SnFHeFM5WnFnUEEzaTVOeElwV2F5V2NSV3lyakdZQ29V?=
 =?utf-8?B?QlVBc3RaNVdENnM5M2NHMVpKUXc4eXcxL2ZzMG9Oc3loU0FOTkJsdXpFTUs4?=
 =?utf-8?Q?rIGGLOYIaCfSG2qK789OnpuE5ATY9H097B4MZWN?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc2ac25-cbc2-4be0-a14e-08d97f462364
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:29:06.9450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U43RjeZ4n9y6NR4DPPyVQ537aAyZv+L4WPvo08DONm4pglFnmzzK+pk1WoAD/8DJbUhBFeoEutY0FI0YeQ2tu+0C5+OtnNPESWCs2YHxxUT3OfZxvn1AOo9fegdYgLZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6772
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

Hi Ed,
I have 2 questions on this topics:
1. I have a patch 
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch 
which ported from Intel code. It is to add BMC reset cause to boot 
command line (/proc/cmdline) in which I can check for chassis power 
policy which skip when BMC reboots (does not change CPU status). As the 
patch is from Intel, what is the procedure to make it reviewed and 
applied to u-boot?

2. After completing patch removal from meta- folder, can we still add 
patch into meta- folder in the local repo? In the development, we might 
have some fixes which add patches to make features work, before pushing 
to gerrit for review. However, the local repos might be out-of-sync to 
upstream codes for some months so we need to manage them locally in a 
period of time. They will be removed in the next code rebase.


Best Regards,
Thang Q. Nguyen

On 24/09/2021 06:38, Ed Tanous wrote:
> On Wed, Sep 22, 2021 at 2:02 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>
>> Hi Ed!
>>
>> Most patches you listed (at least those for YADRO) are
>> platform specific and no repository will accept them for
>> a general audience.
> 
> Right off the bat, I can see that 5 of the Yardro patches are against
> OpenBMC repositories.  If they're necessary, in line with OpenBMCs
> goals, and maintainers aren't accepting them, why was this not brought
> up sooner?  There are several avenues at your disposal now: discord,
> mailing list, Technical oversight forum, Technical steering committee,
> in that order, where we can discuss these things and come to a
> consensus.  If the answer is "There is no way that you can enable your
> platform to work" then raise it up to the next level, but I suspect
> that wasn't the case.
> 
> The path we're going down would involve every system effectively
> forking the internal codebase, which means that now we have N forks of
> our own codebase for N systems, and it gets to be unmaintainable in a
> hurry if any changes conflict.  As is, a number of our systems that we
> "support" don't build on master, which somewhat proves the point that
> it's unsustainable.
> 
> One minor thing that might prove my point is that I can't see to get
> the nicole platform to build.  I'm not sure if that's related to the
> patch files or not.
> "error: comparison of integer expressions of different signedness:
> 'const unsigned int' and 'const int' [-Werror=sign-compare]"
> 
>>
>> No vendor, I'm confident, is willing to spend endless time
>> persuading maintainers to include vendor-specific or
>> platform-specific patches into their repositories.
> 
> Endless, no, but a number of companies have had success in getting
> their patches and features upstreamed.  I'd like to hear more about
> your experience, maybe with some specific examples (which I can see
> below).
> 
>>
>> For instance,
>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-boot-initiator-mailbox.patch
>> is there because our customers demand this feature and we failed
>> proving to openbmc maintainers that this is a needed feature
>> and not a "security threat" or something. We honestly tried for months.
> 
> I wasn't part of those discussions, so I don't know the full details,
> but I do know that we take security seriously.  Making some
> assumptions for a second, if there's security consequences, and
> security isn't in your list of "must haves" for your platform, maybe
> something similar to the bmcweb-insecure-* compiler options that
> require directly opting into the security consequences might be
> warranted for your systems?  Was any sort of option flag discussed?
> Did the maintainers propose an alternative to you?
> 
>>
>> On the other hand,
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-position-support.patch
>> is strictly hardware-specific and is not needed as is for other
>> vendors or platforms, and we don't have time to make it a
>> generic solution. If we ever do have that time, we will surely
>> push the developed generic solution to the appropriate
>> repository.
> 
> The problem with this kind of thing is that it encourages companies to
> not reuse these kinds of things, and we end up with duplicated copies
> of patches across the meta layers.  There are ABSOLUTELY other systems
> that use GPIO for determining node position, so it's really tough to
> say that feature is "strictly hardware-specific".
> 
>>
>> What you propose now will force vendors to move farther away
>> from upstream and create their own forks of openbmc where
>> they will not even try to upstream their changes and will just drift
>> farther and farther away.
>>
>> Is that what you really pursue or did I get your idea wrong?
>> So far it looks to me like a destructive decision.
> 
> This is not intended to be a destructive position, but to encourage
> reuse of code, and upstreaming in a way that's sustainable and
> reusable by others.  If the things we build aren't reusable, then to
> some extent, what's the point of upstreaming it?
> 
> Keep in mind, the only new thing here is that CI is now enforcing
> this.  It's been in the meta layer guidelines for some time, and has
> been an unwritten guideline for some time prior to that.  If you
> disagree with the policy, that's fine, let's discuss how to best keep
> the project moving forward, and while I'm open to patch files being
> necessary in some cases, IMO per-machine patch files don't get us the
> maintainability we need in the long run.
> 
> 
>>
>> WBR, Alexander.
>>
>> 22.09.2021 01:35, Ed Tanous пишет:
>>> A few new features have been merged into CI that will now disallow
>>> .patch files within most meta layers.  This is due to a significant
>>> number of them popping up in both reviews and in the repo itself,
>>> despite having documented rules to the contrary.  The hope here is to
>>> better codify our rules, and give very quick response to submitters
>>> about the right procedure so we can encourage getting patches in
>>> faster, and keep machines buildable against master.  As the patches
>>> state, meta-phosphor is still allowed to contain patch files as an
>>> escape hatch, if the community decides it's required.
>>>
>>> The patchsets in question are here:
>>> https://gerrit.openbmc-project.xyz/q/repotest
>>>
>>> And add some ability for us to make more of these expectations for
>>> meta layers codified in the future.
>>>
>>> The script itself is here:
>>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-repotest.sh
>>> and is runnable on any tree prior to submitting to CI.  We currently
>>> have the following patches in meta layers.
>>>
>>> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-power-control-modifications-for-EthanolX.patch
>>> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-support-offset-option.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-Switch-PWM-pin-to-GPIO-input-mode.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disable-internal-PD-resistors-for-GPIOs.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-gpio-support.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enable-SPI-master-mode.patch
>>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-support-Mt.Jade-platform-init.patch
>>> meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
>>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedance-g220a-Enable-ipmb.patch
>>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-aspeed-Add-Aspeed-UART-routing-control-driver.patch
>>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts-aspeed-Add-uart-routing-node.patch
>>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts-aspeed-Enable-g220a-uart-route.patch
>>> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-proxy/0001-Remove-Total_Power-sensor.patch
>>> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u-boot-ast2600-57600-baudrate-for-bletchley.patch
>>> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-configs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
>>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-Mux-for-yosemitev2.patch
>>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-host-console-handle.patch
>>> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
>>> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-right-perl.patch
>>> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-LDFLAGS.patch
>>> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-clean-dev.patch
>>> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-reset_phy-for-Zaius.patch
>>> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-with-Bitbake.patch
>>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-status-support.patch
>>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-set-fieldmode-to-true.patch
>>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-support.patch
>>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-position-support.patch
>>> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-channel-selector.patch
>>> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-and-send-SRESET-for-one-thread-only.patch
>>> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-initiator-mailbox-interface.patch
>>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for-persistent-only-settings.patch
>>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-boot-initiator-mailbox.patch
>>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-parsing-update-AUX-revision-info.patch
>>>
>>> If you are a maintainer of these meta layers, please work to get these
>>> patches submitted to the correct repositories using their prefered
>>> review (email for linux/u-boot, gerrit for phosphor repos).
>>>
>>> Thanks,
>>>
>>> -Ed
