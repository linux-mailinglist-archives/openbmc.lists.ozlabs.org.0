Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782A4CA861
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 15:44:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7xhq01gfz3bsy
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 01:44:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axentia.se header.i=@axentia.se header.a=rsa-sha256 header.s=selector2 header.b=gq5tRMBP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axentia.se (client-ip=2a01:111:f400:7e1b::70a;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=peda@axentia.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=axentia.se
 header.i=@axentia.se header.a=rsa-sha256 header.s=selector2 header.b=gq5tRMBP;
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7xhH6SsTz3bpY
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 01:43:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqVUaGSXPTQyZ1BiBoeR7eoNfwQM5YMfc/qvAxr1N6E7EJQlK3msa2Yi6gn5TPYLTKdI43dzXiyiM46iJ8KLkn92+dNcEY3Xr1GwoYOXgz+WBetpDFVqbrRm8/iy8RyD205l/H4WhWophAvF+C+RCvyg6Xu40WYTzCmi5sZtO1iLHnq5/fyhlVsUPrO/uHmlLT3wyXT8xZhSNhiWfaTaGCKFq8/hEraYw04o7XBRAIN0us1ul508dFJnLiK3XquMeq3i0w95ovVtiq/y6dekVKwUYdRpG81Hd2DRzrFjJQ8anMxQzLEdboHL4l9JjCr/MGDwxqWkFZtmtktN+oe+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ryRP+1wwdVEryrpzuUVqZ+2leT8VFdl2b5cr60+Dqo=;
 b=WUDgSSqIv/g8iEUL+RmEC8Ymi47al85yY3FSGHah3AUJ7Wp+oOPsfUKWywF02clAKT+3zaAvI6b5ZKEnzT4jhIpMYp9ktHEc0071ClkptkXV0S/8syiv2aOo3MuV6oi3aQYtU8GywikG+3J9In36yah77slGNiRuyI5+otyAwDXiDRvPieTKosCIw3i1qI1nHY7/8mL0bIMBnDhN7cFuM+vVT8yVfZNiP4RITiMp6W1voIc1qQXqmaJdA0s0u0zhQJ8HFURjdWKuwD3tzVB28HqntLAYImL86pB4P2DUzHtwQgAiXrHIBHYhESL086OHWElgpbqUjaLz6YpQlBdcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ryRP+1wwdVEryrpzuUVqZ+2leT8VFdl2b5cr60+Dqo=;
 b=gq5tRMBPKBSCjZLDsXzM41fHPERYnf7a1xtF07gPdGmAy5MGgrzUSEopOXPYIuByEgLDFy7znbeji03Dpuy8R3brnvOqqEVv6CqnCNSTRj6ZsKjKOtFMprekX9hiBFQMkBXBuV6qsU9VHDHa96lnHMray3bftP57EviLNxGRWIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PA4PR02MB6510.eurprd02.prod.outlook.com (2603:10a6:102:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 14:43:33 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 14:43:33 +0000
Message-ID: <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
Date: Wed, 2 Mar 2022 15:43:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0074.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::34) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1bdbb7d-39a6-46e7-7052-08d9fc5b0682
X-MS-TrafficTypeDiagnostic: PA4PR02MB6510:EE_
X-Microsoft-Antispam-PRVS: <PA4PR02MB65100FA2BAD1829BFB4BC5A4BC039@PA4PR02MB6510.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7Pt6WM2Hm7v8gOnmRb1aldn18QplWoH3/WLhJ17lX5YSn2lO9QmrSkOdP9x9Q23HTECOdhLXEeXda5j88i4ryg9vdpuJaSC+Gf6AUCwIRcHynBO09C1tr3Sb9rlcV+nWkO9J8kJzupn/56rP5ThSHzDLhFP4l6c5vwEuye8S/wX+5uMOdmYNT6PCVYu8KaKwrUoFojz0ZtH8XA7TjH8i8g9+4TeKjbcx5oe7WRpQJ9qOKzmIHHhzt9aoonBPJlzmP6Fxiuij3mqXSQXAGmIWPffKaNOtaJYaJsYENrcar5NuiHyDhn3o0r/yZ3rMp7s09an+0dP10I8quIMlPhmHKe+9inQ7LwLA2oOv72WPm8SAbdE+f3oVc+yCHrfNtT2N8D/3QMOvKZ/mWAHcIJ4yeYnx0SOMEFs2bFEg3Syd8Kv8KdI8j5ulF/AQYA9WNgZjRpT5Bchraax31EfDNLxFzxTQ7sVo25TBwt7OrbYgRV0K1HDBx5YmUsnLNb5YbEDo0buawqQ41M6tv3sHtb2r/gAFcRrwhmyZ/O+MqUgA22nn1KhQMSy/EpLNaK/wAvmHmlI98TcqZrrKFPD9Kl5TXqIo1EYX88QE8RGAwp7L1+hOBBqvv9st3SGUUmIy/KBmnixTfGVyVGU0Z+fdGnhPLrZ5mVczvBQhThN9zNALnJ90LaIvvB69t6rwGVsQS68ypgNAuV2w89y2hpFu2/tNg2NabCNWmmgQPNgAgSiZ1uN6TkPuuBmzkeOVVSYVngV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB4436.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(376002)(366004)(396003)(136003)(39830400003)(26005)(36756003)(53546011)(6486002)(2616005)(508600001)(186003)(83380400001)(54906003)(31686004)(31696002)(6506007)(86362001)(6512007)(36916002)(2906002)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8676002)(8936002)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVlazErNElyZGhQTUZxcDlQN29ITnlJQ2NzQUN4MFVZT2xVMzR5VzkvUjB1?=
 =?utf-8?B?eFRaSTQ0M25DM3VZK05WeC81UWxLRmNLNjNMblVQaHhMa3ZGUXdNVCt3VlNE?=
 =?utf-8?B?V2QrUk5GSlUvVUVDOEI1YWxGVjFkREFud2dzNndmN0g4OG56QkxFUmhEREs2?=
 =?utf-8?B?SytXeXNNREp2Ym1zaDliYTlsV2ZuM0NHU0hKZkpUV2pZc3RiOWpsMEYzblVS?=
 =?utf-8?B?SjBKM1pmWUphdjRVU2dhZk80dm5JNEJWdEpwaVRrZHRCV3B4S09QK3pPb2RL?=
 =?utf-8?B?L3FFWW1JcytyajNFM3BBTU11aUM1ZlhqWEdpeTBxZUx2WmhGa2dTdzAvQmwr?=
 =?utf-8?B?SGYrR0VuU1BNanZ6WUtyODlrTm5raURlc2VhUFNZdWVaMVoybURidWNVdHRy?=
 =?utf-8?B?Z1YzRHNrVlJoeEdwbnl1elp2RTNtYmNVWm9VMkVFVjBWSTIvS0x2TnN5OXlZ?=
 =?utf-8?B?MjQvWXFaaytmRjBhNU4rM3MxWDNpTmMrc1BSTmFjbU1tNHFCeXF1T0EwRGNu?=
 =?utf-8?B?dVNRZTB2QUJnMTF2Y2JxOUEwMVU0MkNibTJDTGUraXhEZWlBWE1tMmxDZTdT?=
 =?utf-8?B?TExvWXlweE51Z3F1Zk5rRHhVRHl5VXdTOE15SFc3bllmSEFXZ3ZSK0hCVVlv?=
 =?utf-8?B?T0FDbEt6aDNGZ1JVQVRHa1I0UjQ2TVFKTmRPbzhJeEM5ZUJ4Y3pXNkF5Q1NR?=
 =?utf-8?B?c3pJZWhRandMYWtFWTJuQWZlaTZVeE4zd1dXenRDV2oxSW82UnN5UjVDQzd2?=
 =?utf-8?B?RE12K1FvRFd0OHFpNUJqZ0Y5VkVDc01NQUhkSU9Rc1ZQRFpvZC9zWm1ESFNy?=
 =?utf-8?B?eGF0c1NYcTAyNGRnQ2JyS0phUzRkTC9jOVRsN2ltTWpVTURMSllITGU0Nnhl?=
 =?utf-8?B?c2JuNExOK0hsODhSVTRPeFQwU2RVd3pJd1Y1UFVwVGcyaFI1TGtvQ1d6VWRi?=
 =?utf-8?B?RWw5YzNuVXFGTlF2WWVlUVR1M3p2aGJleld0SkxBdVBySVR0YytrejIrclFr?=
 =?utf-8?B?ZEkwNTdxa2dBYmlnNU5QNyttUDJsbjROWDFRQkxVdDB0bVVaUFNtRFNJbkZ5?=
 =?utf-8?B?ejY5NVV0ZllXZ1dXeXVXNjNPUVpGMFFtczB4MjNVdGh4c0IzMHowQUtoS1oy?=
 =?utf-8?B?MTNqZVNobUw2eDZhK2pBN2tlc0RDZGp6OTkzbC9oR3NBQTh5b2tjQndoMFpB?=
 =?utf-8?B?czhHUG1HOHFrVXFpcXJNUnc3VDhmY29pRWFCdVc0bmFYSWZNSlpTU0VYdHZm?=
 =?utf-8?B?RFFFRmlkMDhTS1NveHgxaFJ6ODY2TGR3QktnU1BnUlY3WWhuTWNqdFJURE1q?=
 =?utf-8?B?WTVIeWNMZ2pDalRZeVJBTVRFZ0pZTTlCN3M2SU13aGdQUDBDQXJoNEZzc2Uv?=
 =?utf-8?B?VDl0MStFNmkramZiem9XS1BINzdzZDBDdEJWWmE4L0NzSW9EeklwbDN5Q2Z3?=
 =?utf-8?B?Y2ZVQ292YzVlWHRvU2VhUDdVaXIzUytvK0xoVlZ5N2c4MXFHUXEvS1RoTytv?=
 =?utf-8?B?NDNZYnVVZ0dPRFZYcXZoNHVod2NsU012KzV0SnlCcWJRN2tHSkVJQk1MZjdw?=
 =?utf-8?B?Q0tvdFordEVpeEVPYlUrbnhPdmNWdU9BRmFyeWxzWm1RajF6VnVERnNLdGJY?=
 =?utf-8?B?NnNnNFVFVnk2R0l1NkVVNUhBY1YyMjFKYXlCWDRwZHhvSjdLeGx3UVdBMzI1?=
 =?utf-8?B?YnduSGd3NWdaTmUzWEo1UlN5WmxNanRFYVFlQkwwcE5sNTBwTGp0ZUJnVXpC?=
 =?utf-8?B?dXN1Y0Q2b2NLMXMrVXZ2WnY0dVY3T2pZSk14TDJQbGlLSjdQcWs2UzRMNkxV?=
 =?utf-8?B?SWVWQlFUc3lpWm9Jd1hEY3dTa05IM3lBYjFXRUxGWWV4UERXMGJBVm5mcHdu?=
 =?utf-8?B?TnNPMTMzUXNMS1dmVUxCdEgxbUplM0h6Z1pna2lvOVY0SHQwaVd4Z1NHM1Mr?=
 =?utf-8?B?M1ZKalA0ODBKWmh4ZXZzY1FqdjVycEFBWndLMW5zZGpxS2dXdXF4RDI3OTlv?=
 =?utf-8?B?aGxJM0lyV1Z1Q3Y1SWx1N283UVVRTE00R1dSWThvR2tydk5xR2tuaHpIeG90?=
 =?utf-8?B?Tm9aOUx6VzBScGF1dVRZbjhNQzhOMW54ajRhbWpQK2M1b0UwQWw4a2pZeWp6?=
 =?utf-8?Q?qvhs=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bdbb7d-39a6-46e7-7052-08d9fc5b0682
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:43:33.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSWx25negef6J2ukk9qKibjUzxpC7AR3fa1YrJXqF+GFSGZgfxxuoCfOXz1+nDlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6510
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-02-28 23:38, Zev Weiss wrote:
> Hi Peter,
> 
> Thanks for the reply!  (More below.)
> 
> On Mon, Feb 28, 2022 at 01:54:09PM PST, Peter Rosin wrote:
>> On 2022-02-01 01:18, Zev Weiss wrote:
>>> Hello,
>>>
>>> This series adds support for a new pca9541 device-tree property
>>> ("release-delay-us"), which delays releasing ownership of the bus
>>> after a transaction for a configurable duration, anticipating that
>>> another transaction may follow shortly.  By avoiding a
>>> release/reacquisition between transactions, this can provide a
>>> substantial performance improvement for back-to-back operations -- on
>>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>
>> Hi!
>>
>> Sorry for the late reply. It seems I'm forever swamped...
>>
>> There is a risk with this scheme. If you have two (or more) of these
>> chips on the same bus, and there are clients behind these two chips
>> that have the same address, accesses to one of the clients might
>> "leak through" the other arb to an unexpected client when its arb
>> is in it's release-delay state.
>>
>> In other words, it is no coincidence that the segment lock is held
>> over the whole acquire-access-release cycle.
> 
> That's not a scenario I had considered, but I think I see what you're 
> saying.  Just to make sure I'm understanding correctly, the problematic 
> situation you're describing would involve multiple (sibling, not 
> parent/child cascaded) arbiters at distinct addresses on the same 
> (master-side) bus, in effect acting as a sort of "distributed mux" in 
> addition to arbitrating between multiple attached masters?  (So kind of 
> an M-to-N arrangement between M masters and N busses.)
> 
> In which case if more than one of the arbiters had their downstream 
> busses simultaneously connected to the same master (as could result if 
> one were still connected due to a delayed release while the master had 
> already started a subsequent transaction via another arbiter), the 
> resulting "combined" bus could end up with address collisions between 
> devices downstream of the arbiters if there are common addresses in use 
> between the downstream busses.

Yes, you understood me correctly. That is, if I understood you
correctly :-)

>>
>> Sure, you can always say "don't add a release-delay when ...", but I
>> see no such documentation.
>>
> 
> Assuming I haven't misunderstood the above, would expanding the 
> description of the property in the DT binding like so be sufficient?
> 
>   - release-delay-us: the number of microseconds to delay before
>     releasing the bus after a transaction.  If unspecified the default
>     is zero (the bus is released immediately).  Non-zero values can
>     reduce arbitration overhead for back-to-back transactions, at the
>     cost of delaying the other master's access to the bus.
> 
>     If this property is employed on hardware with multiple parallel
>     (not cascaded) arbiters selecting between multiple downstream
>     busses, address conflicts can occur if a device on one of the
>     downstream busses uses the same address as a device on another
>     downstream bus.  This property should thus only be used if either
>     (a) there is only one arbiter on the bus, (b) multiple arbiters are
>     strictly cascaded to a single downstream bus, or (c) all of the
>     devices on all downstream busses use addresses that are unique
>     across all of those busses.
> 
> If so I'll send a v3 with that change shortly.

I'm not sure this is a bindings thing or a quality of implementation
issue. You could imagine an implementation where the arb is
opportunistically left connected for the release-delay, but that the
arb is disconnected immediately if/when there is a change of the bus
topology, possibly only if the topology change in turn cause address
conflicts. The implication is that I'm not sure if this caveat should
be described in the bindings documentation or elsewhere. It sure would
be convenient to see it with the bindings, because if it is elsewhere
I'm sure more people will fail to take notice.

Another risk with the scheme is that you possibly lock out the other
master for so long time that you trigger it to force its way in, thus
possible wrecking some transaction. Or is the PCA9541 defending against
such wreckage on "hostile" takeovers? (I too lack the HW and time to
tinker with this.) If so, that might of course happen anyway, but it
might be so much more common if the bus is left connected.

Cheers,
Peter
