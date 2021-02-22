Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B83211F7
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 09:26:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkZyM6WyHz3bPY
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 19:26:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Oo7eZv6D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.93;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Oo7eZv6D; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2093.outbound.protection.outlook.com [40.107.93.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkZy526FGz30Km
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 19:25:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rf2St/W5Egt7xDp8EevotoxxCg1NZca+WF/nwoDLxnAWTXGrUjGknGzQrBQfNM9NkxbnBaXEiBnzMZCjmuDhOddZiaVz5SoDR2ZfRbZlPRMNFZw+TVOoGcTEuweWd+wDFc9wi93XJeK7GoK4yVUCIrdZAuR4xHD+hOpwjJgf4mnq2YlfBEYRlFxd4VyBCwI0T+OO+RMh1F6KvLsrSanYXHL9LXbwcWfWUzpy5LSLjWwekCsNc/EJVu+z9xs4CMVvJ2VlAzF5bxbILhnIH8XRxHvzfs/70cHv47UYBQlAftaJZUGS+JTnoR1USJcbYUduuzdfPNYeYYTc4UG/FoDNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm/KZ5erH7ns+cZ8aJ5YoPyjZk9rb/3Du0AnWyLv6s0=;
 b=FX9DacLQ4aos3pnbCEqbrVibw7xFE/qVzSRe/Xm3zdYJgthjB2YMjCpC9RW8/YADdrUzsVwoLsqyel1h6gil7UwOKnpXcMNnlGxpEQHfTVF2V4IeqyAejgJJVwodk8pqHUQGNX2fGTu+jrGhB9r8IKUlw3Fb9V5JYlKiYQlQD7w0HPYvdx46kBDl5ewUrRwiGpCn5Yl8Rjn99u/nJVpJX7Jf/VIgRIgAmy4FXr42VhHcrf6zSE2pN80hw7HXw554qK6mlqGgxDHeVCv4KFwIP/KRThF+4hSUEEZzEUAEJo7eEF4jSzcH/v7EKPw0f0seUSTIkZsKzPEbwXig9u2WjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm/KZ5erH7ns+cZ8aJ5YoPyjZk9rb/3Du0AnWyLv6s0=;
 b=Oo7eZv6DTzi9B4ysqEDE+76o7VDY/V1seXW9P3n7w0Sow/LhtBVuRZuZFSBsB3Y0Tc7nUagY3u/BRs0rN8wOioeyvrE/PMMCDXEy8NcZlEuPe6AKqxAVGp2hNez09zycSLHOEBcBEVUMHB4ZDfE/jSxhCGu4Lom0z0GOUzp12Co=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB5447.prod.exchangelabs.com (2603:10b6:a03:120::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.34; Mon, 22 Feb 2021 08:25:39 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.040; Mon, 22 Feb 2021
 08:25:38 +0000
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
To: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
 <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
 <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
 <YDFBBgX2kRHMlGQK@heinlein>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <a53b3558-5502-9e87-7ec2-13b578e1fedd@os.amperecomputing.com>
Date: Mon, 22 Feb 2021 15:25:31 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YDFBBgX2kRHMlGQK@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0167.apcprd02.prod.outlook.com
 (2603:1096:201:1f::27) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK2PR02CA0167.apcprd02.prod.outlook.com (2603:1096:201:1f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d38a44f-28d3-4abf-befa-08d8d70b6f49
X-MS-TrafficTypeDiagnostic: BYAPR01MB5447:
X-Microsoft-Antispam-PRVS: <BYAPR01MB5447968DAA191C6A0BD3573E8D819@BYAPR01MB5447.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NgUd8m540aIEnODaj4Y6Nvx8FYG8NIX2FHayXBKMtXetzElJ/uS/aXJyxhbiKpSQqZSTLLj9rlmPFjtHEZQ3fNAq4LtukyqnJANwynAczHWKsbiIEYRYKQhFJGW46kNKcH9YgGq//O2OjUXg4RiRfA0OBFNJ1mayVRPUNuIeU1AdjL3XSMYuPbqDKG2O3puHlwV1TdJa/KR0tvlOb8ZpMOrJJFw65wh5pKmrQaXaTW/0Owpk7tck5db4SvPzxc9px1S2sbm2F4WVfw4seXBqKBsvuvKway3s2TJEIiTf6ZL1YI4FJSdL/gCHBKhABELVhj1O+J7JD73SizwEGiuB9WlvEqobFE//nrBAU3PIYq2N0IDnKE67nc+Q7frvUyZqqd61hMMOW/G0tWzPo8DKoKH7NANGUTyibd9Dlr5xhf4MapmLZ++xalCr05VzSmC3HXY/HSPATaL3Tiz/4qji2MkrqJxC0RzpgU00DZ9yYAU4tdJfOhmLYE00HaZl2HiK/fKI70vUo2mP4sYqJeHRlBT7tDxp4XexcbRuUkbtg0HwvqfB5tTTkRBBlL85Lng871GqXh9YV1TU25IYGECTBN3DzZdICr7NLMn6r1oOIERP2yFA2ZncHps9s0b0dqmzDepJL+zwG5ALMGTuVP/jM3nLVDnZmLd1vLXiO/nd3l7pIeJdVaIy+esAKONV3vHycUINDUIxahWTzl5/JJ5Ofw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(376002)(366004)(346002)(478600001)(8676002)(66946007)(6506007)(2906002)(6666004)(66476007)(19273905006)(53546011)(66556008)(5660300002)(110136005)(26005)(966005)(52116002)(6486002)(31696002)(31686004)(956004)(186003)(2616005)(316002)(16526019)(4326008)(8936002)(86362001)(6512007)(45980500001)(43740500002)(563064011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?CX6ZRcZer6uPOeiFwhghcR+kbIdClD/02D0WQssQ6TzjQ/eMgzmqMlMs?=
 =?Windows-1252?Q?WPYFxqEuJz1WzCsmTySetu2Pt12tEOiZSzBUmUeqzlmF56E20waDdeYF?=
 =?Windows-1252?Q?BJ2INjc7Lp1HA8cL1rA+q5QAutvVSP9DunvmDhbi2C6ozKxYcgYl6R9U?=
 =?Windows-1252?Q?aJ1Ks19u5BX4/EbHXU8GrlvcUB0/1FFUsiTuB4JU4qaLWcEetAhdAlqJ?=
 =?Windows-1252?Q?mMzxlO0YWhnpaltdSfs3xI3ovA6UweMrcG+MtXk8zLloTRiDnixj8zah?=
 =?Windows-1252?Q?knwOu55gnFaJpAEHispon3MGDcVZoU5563YXChERyzCrRkz8WmjEB53/?=
 =?Windows-1252?Q?9P40RdDAOxgMwC3PG74IToeDYklcxAmikDkZL/ogRV5oR9aTxUPbDqxx?=
 =?Windows-1252?Q?9K7wXLhQiqRxaRVMf6MnDN8vhZhZAhjTTWzwl2FLWrAeqgclqaAkQF+8?=
 =?Windows-1252?Q?Og+jF71scnF/kDB3rb0dOHxqopmwtFIVaOAEBrOvX3St4J4Vd+EWXyfa?=
 =?Windows-1252?Q?2uTCngCK8N/Zl1APi8NpwrjcCapP3YmwE3hc6WfSwtJhkzoENFJKqrlb?=
 =?Windows-1252?Q?MwxBFbtPXW7pTwzCEfX/qKnp+DeqIBgHbjSUuefeF9rqsesxUoMr9AaU?=
 =?Windows-1252?Q?ByBEIjFsWbCq/sEyN/+g/RRpDkwjBtJnqqMoTUYK9qxghT9at4eqGsD/?=
 =?Windows-1252?Q?lxTw09dgRnkYPwmsiJ7lC+h6+fbm/WDQ3ObhJSTrDytl6hl5p+P+2vrV?=
 =?Windows-1252?Q?pNLLpa00Ihj9VTRo53dT57phJW3Lxx/3d/8qTdukh4e1QhqhgfdItVgf?=
 =?Windows-1252?Q?ohOj3IV11NGF3+tbSrrnZbjN9MrFd0mQ2GRTw48b8JtsNFzmk+jY5nc5?=
 =?Windows-1252?Q?0VTllnf1AvGqmBEoRBDMVdyLIoCDQrdlYUFJQCMVM1jqZIZCcZhAcUoA?=
 =?Windows-1252?Q?qM7zHjRm0esEkvTX3TmjWr7BF/KeHICeR6P2a5cX/5ML5DmveLFutrdu?=
 =?Windows-1252?Q?EMnMW6pQYu4psmsMlWj59JaPEb22nrWheusyvijPOV2CgQt2Fgaj5Bms?=
 =?Windows-1252?Q?HWr6AHQ5U0Savp8qkEhAs74ULNChMJgNsmax83yXe05NZ5tNZZPfC1YQ?=
 =?Windows-1252?Q?BZ+C6DKC0Lcviq7G1YP6Y1j6aLOrIiOwCLhzDls++bzJ6gwz28t/jFRc?=
 =?Windows-1252?Q?yMkm3RXKhyjNZEY0gmNxP/FKXPXAfC5STDamP2VCi+oAdIDHi7s5eK4W?=
 =?Windows-1252?Q?ITNSIkIev2m0slfd/2IV2M+6JxzP3RK2cnhMHU9YjzfctafOXJ5PlSt1?=
 =?Windows-1252?Q?ubEF5sK9VnVkjucr4VtQOeutTWVtLfrikad+lVKPD2AYBQkjK6qNIpql?=
 =?Windows-1252?Q?kdOmGzaIkE2MDoRY8MgC+klAKXw8C7FvnyOPAp19FxmBa3C7Lp26wUgl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d38a44f-28d3-4abf-befa-08d8d70b6f49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:25:38.6080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vwd5r+CTy1cxFFKVNdqkvgZJ0Q0nmi1Tv1T7Ck3Py5kAEJd10u9/ODlPmJVEujkj5lPWO+ijcY9JS9KMe8gBL/KW21xdMt2w25KuA552piU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5447
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


On 21/02/2021 00:04, Patrick Williams wrote:
> On Thu, Feb 18, 2021 at 05:23:56AM +0000, Joel Stanley wrote:
>> On Thu, 18 Feb 2021 at 01:31, Thang Nguyen <thang@os.amperecomputing.com> wrote:
>>>
>>> On 18/02/2021 06:46, Nancy Yuen wrote:
>>>
>>> Code should be put into an appropriate repo, and repos created where necessary.  Then referenced in recipes from openbmc/openbmc metalayers.
>>>
>> It's a requirement.
> My opinion is that there are two reasons that come to my mind on why we
> follow this convention right now beyond just that Yocto is happier with it:
>
>      1. We like to have a discussion before making a new repository to
>         make sure we're not fragmenting the codebase more than necessary.
>         Often problems/solutions overlap more than might seem obvious
>         when you're looking at it just from your machine or architecture's
>         perspective.  There may be some existing implementation that
>         could be modified slightly to make it fit your needs, or it could
>         be that someone else has the same problem and would like to work
>         with you on implementation.
Thanks. It clears for me.
>
>      2. All of our CI infrastructure is set up where machine recipes go
>         in openbmc/openbmc and code goes in various code repositories.
>         If you try to put code directly into openbmc/openbmc you do not
>         gain any of those CI efforts we already have:
>              * Build of your code and unit tests when someone
>                makes a code change.
>              * Unit test execution.
>              * Code formatting.
>              * Static code analysis.
>         We have a lot of support at a repository level that doesn't exist
>         in openbmc/openbmc directly, because it isn't approriate for what
>         is there.

Does the CI setup automatically? if not, how can I set it up?

It seems I don't have CI setup on the 
http://github.com/openbmc/ssifbridge repository. How can I have CI for it?

>
> Hopefully this gives you some additional context on why.
>
