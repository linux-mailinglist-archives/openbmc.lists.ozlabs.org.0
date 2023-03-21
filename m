Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B66C382A
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 18:26:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgz6t262jz3cfd
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 04:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ri/k8SFq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::622; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ri/k8SFq;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgz6D3sDVz2yRV
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 04:26:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHxk+0gqlRZB0y1uzt2gSFvZ0AXZY4fMLXoYqj9LNG8wT12xvMn51KrDUH/ZsnB4zUt8Jkvz2MBBY2MysgPtVdo5I/QFCnzZvVTxowRdEhOh9QZw7QAEt/rIWezJnjt5DyB2HQsalrYwYNQmog7T5moPkitJzLJaj7XLkD6dCqOJCrRU4RYCbcaEUyvQKvGIe3B7fJPKMdWMYtbFEghY+wv4Ub+bR9OW5+KnUjHHbmkfolMeivzCQxu8d0zKmEQt+sEWrQ53NwihJ1p+Uq7fNnmsSWZsLkUpEAFHg5oxTBJym9ks8LbKhxTtC3FNxnVduur749dnmoC3c21YzOhTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TS39h+aL9H48eXTvNFghVdf6V2uaDQiBlkUHsBTpF8=;
 b=hj8cxLhrML+0gNhboBuHyUf+aCuAM2IIb90TqPrr7xGF6BV1TJTUjkH6w1Shx9ZrKZ8ppoVDS2YrvRhdZVQTOabnOO1mB4pqPAb5qqGbcQuRSzJGFJWsAy4aBbIKRyRDwmg0sLgwckz+VjGs8/S+dzYetw0Ondscv+gly5ZzCoYWbX9B7vMR7jnIToKdjz6m5JKrHNn0Qemd3SHog9wXtxjWZu4HnORhHQfoxvIjJLpPZ55JJDac9+dJpkdu7XygMEg5YnUQ8LAf9nd0jl+w88aMsN2NI/B+SyHwlgzEcI5c4Fc+gSNmImuRzUP7kt4/KLg6kfjcCmSh94NFeB+oFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TS39h+aL9H48eXTvNFghVdf6V2uaDQiBlkUHsBTpF8=;
 b=ri/k8SFqQ1We9p8N5Xk5nd9YttnQKldu3Z5z4vXVcPbi3tJ1ip0pSBdYoskc3nM5ub6zhHml/aDZV7hlZhIdMElCb8OfZCpEMcizVxbHouKVAeI1E67EQh18oW7ulOj/HqHboL52hqUkzDSfKZ+F6gMwxe2JJn0K7A9b5G/api8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 17:25:46 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 17:25:46 +0000
Message-ID: <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
Date: Tue, 21 Mar 2023 12:25:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC] BMC RAS Feature
Content-Language: en-US
To: dhruvaraj S <dhruvaraj@gmail.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
In-Reply-To: <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:610:118::21) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: b2376123-826f-4092-b049-08db2a314ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+sYVcRKaGG5Lh+iFqvoKLV7MFGYoOc8+G4YOBNv7eahpEsQWUsYZx/2EkEuFSQw3f1y/O7tLQChntx2HQbtc2xUMoMyNgDNQoSnOtISBp659svJYjxyUxefLQ9NkEW3T5jgqITIzePwFrT1/ZMwsMj/own8rIRa0gflpdI7CoPaR+fVdsYRv995NvmzSimbNFJviNe0zX1FBMBa9amG+sOefj3r5DxkLXHxcvNoU2nLoTTgTRjOR7eWg5kjJ1S+Z/z+WEFEX92CUrprFr+eZdowX/h53ypuAHWomvMt9hsziyCRznLSaC3friL2fpi1llpKjoFUgPj0dmsm8cJdY96b2Kzwy5UgKSI7/Jz04uaBZD1Efq7I4IR/kgkQ9b1Xzo26fJGRe8bfSUDiXriXof+V6os/+nWzUcS6oFzx73emxa1s9sgqpYHGYPZPc6izGiUFblrFxEls/zXfEKLBO0n/ZTkPIqpHQ73x4p5kdi+xc3tIVHputXbPyoxFvwAYX5mVv70Frh4YnH2TjuDa8DOt3kJ1xCYpTYhpgOn5i4Z+HOuwUSC7ONVvwq2IKj8A04fzlRhU8UL8qSVt5f1bFt8OHHQB+UeKiixDw/6n89giKDDHtOmuzmr8uQlqrK/vh4XRoqJBtqzk8MWDUEJ021fNkoEGPV7AE7/fFC1vMmUtFhfbWnKPwlEWmqigSZ/LiN2Z7jva5+mAVqKC02ccUqbH3gzCq03nm1BKVPPVsPzI+0DZD1ncQwRg1tyR0yKJV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199018)(4326008)(31696002)(86362001)(36756003)(6916009)(66476007)(6512007)(54906003)(41300700001)(478600001)(8676002)(8936002)(5660300002)(66946007)(44832011)(66556008)(316002)(19627235002)(2906002)(38100700002)(83380400001)(186003)(53546011)(6506007)(966005)(26005)(6486002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?T2hIMFUxeDFqL1dHSUFzLzFTeGdDVkJuVVp4Y2NqRGpPQ2hPamFDeUo3Y1Ir?=
 =?utf-8?B?THJxSUN6Ymt5QW9lRU9CcjZTb09MNThPTXpHeUJKclVEVlo4Q2VKbTl6L2dG?=
 =?utf-8?B?Vk9SRjFWbmppWXJyRGR2SzFQNlg2VFBwYTdMTlFoNDhDZjcyVWhjaWlFNXdJ?=
 =?utf-8?B?bEh0SFk0bTdKRTJMenJQck5yaDdUOWtLeHNUUkU1c2ZmZUFBWTI1TGF2MWRI?=
 =?utf-8?B?d0Y2SGlKVWlncnpTOWxiZWRFV29EWGtmOHMvQjQybmwvZHZXZms1M05GZTB1?=
 =?utf-8?B?OHFGV0xvWmp4Yzg4emFua0FGNmIvVjBNVmpBSkg3alBCSkpWSHVFZldyay95?=
 =?utf-8?B?YmxEWEt3QWI0UEM1ME1rbDJqdTdXZ1Y5RjZSU0lXemF6cnJFUDVidnNKSlli?=
 =?utf-8?B?S2h0SkQ5WUUwQURyQkJqbThFOXN0Qis4UkJWZm5mU2piZkR4bmFuWkdpeFBK?=
 =?utf-8?B?UzhNWExzQkQ2a2o2S2V1Y2hreVFYKzVmZEhQL3lWdmpLQVVsdW9GZHRqbElt?=
 =?utf-8?B?T1hJcHNQbzBDSnFUUnd1b1ovdmZOZTZTem1RUXJNbFFsMlA5UlRNTVhLdG4v?=
 =?utf-8?B?cVZEcVhMT2tUZ3NERmN4SUkxT09KWmN5QUVuZU9LaDVYTFZ2cVJDS0taS1Bs?=
 =?utf-8?B?YjQzNlM3ZjF0dEZyYTR1TUhoQnhEM2FwcDZzeWx3TTBJVFZheTlXNXZ0Qysy?=
 =?utf-8?B?SXkySFA4UjFoV2tpRGltUFBkeGx0RlQybWMxSDlJKzdoWmFFL1hhWVZ3M0xY?=
 =?utf-8?B?SmdDL09PMjFMUVYwUHRUR3ZlTjlnWUYxZy9iaUVqOE0zQ1pvUXI1ZjFlNkp3?=
 =?utf-8?B?S0NNWks1czF5ZUw0ZXRnaFFKaVBRamsydnR1TWJzbWhSdFBrYVpkYWFVT1E3?=
 =?utf-8?B?VW93QjdtbGc0TEJLbUhsVGJid2ZPais4MmUzMlhqN1FaUzBkYVhkUGdIL3Mr?=
 =?utf-8?B?UTU0TjRDdmRXM29vMkUxbm9lL3hlTkgwMWxaSGNrMFd6cm1SYlY5Qk40YzBz?=
 =?utf-8?B?VFdGS0E1K0V1VGFoUlRmMG51S3R6eFVrQzJ4ZVZITXZqYmlYWnM5RmFhSlRx?=
 =?utf-8?B?cnlMR2xCVlNRNWNnVDVwYTY0VUwySm41Si9GbDBHa1IrZ3NoMTF4c0ljTDZa?=
 =?utf-8?B?Q3hteFIrZ3hEbnRYYW1ZUTdtM0ovMEVua1kvNVVCTWFPQlZjOVNlZ08xUlJs?=
 =?utf-8?B?OUt2MTJBY1VXVEJmZTVpU0Z6VkNGS1kvdDZhcDdGbUhRYTJZT1g2MWhjTGV2?=
 =?utf-8?B?dHR5VFVSWGtyc2xiMXA2ellMd1dONjdGVEpHV0F0SkpVbHI2a2pHdTQ4a1Va?=
 =?utf-8?B?b3NxY0tOTW9rNlA0VllCdGIyZlhlT1lLOHBubW82SmpxUXNWT0IxWHFkQ0ox?=
 =?utf-8?B?TjBuTW5xNDRkRjRXbmJQam5XK2g4cEVGMzg4SU5JQ3c5ek5wb1BjSkxiNUcy?=
 =?utf-8?B?Z0ViQjRPaGJhTWJqRmk4YUFZWDdJN3pqVzlVY3JTQzR5Z05Zcjhza3ZKR3FI?=
 =?utf-8?B?K1doWXg4R1FKK2pIVmxiZlNVNE5nYnRjNjduaWhwTzJic0I2UWpESEdicm5I?=
 =?utf-8?B?NGhHdDJwYnVPNHRGdHJxUlUyWGxlb2V6THdROUtlRGx3Vjg0Vmp1bGhGODg3?=
 =?utf-8?B?d3JQUEZxR3hJV3lEaWVaR1NEaFg1bFJqNVpnZ1lDei9zOFRtdElxMVhqcDhr?=
 =?utf-8?B?UE1qQTFLaFlldnJ2Q3NLbnZmNTRIY2dMWXZwWEhNcDNNQXZpQTJSdG9QRE95?=
 =?utf-8?B?VUFVV0JRRU90VlMvOFJ1c1laQ3V5NGhqbC9aS3YxZjFSM2dtQXRaLzV4eW1I?=
 =?utf-8?B?Rm5taWtEVkhJN3VuQlB0WGJ0WWdwSkltN24yR2ZlY21kc0FHT0orcmM2Q0R1?=
 =?utf-8?B?Yks1U29RUG1hYzR6NkRNeVhkenplSFpRbUNBNG9HRlc1TnNMbVh0SkVXWHZz?=
 =?utf-8?B?WkcrMXM3ZjlpQXNVQ0YyNDBqZXFvb2VteE4yTUdvM1BRNVR2d0VpOUNZOWFl?=
 =?utf-8?B?SzJVOENBZm16L3VqUlhLQU5Sb0FPNVRkSnVBK2RncDVaeXdWWUw1dWpkRTI1?=
 =?utf-8?B?RGE3bW44OGZDc3RWUjZUYnFxcXg1NWJUQ0tsRkw2bldISG04UG1RMFI1bWx2?=
 =?utf-8?Q?IRGYR/yU7FI5w/xeGTlDcUCAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2376123-826f-4092-b049-08db2a314ec8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 17:25:46.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjeSiMi5ivaYJXM3tTeHqEzm8YBYXphUhq9VMOYupA6lFJcUXgVQN0/RNpuaLcfhK0DWIe58avoInXCNLfyPMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544
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
Cc: Michael Shen <gpgpgp@google.com>, openbmc@lists.ozlabs.org, ed@tanous.net, bradleyb@fuzziesquirrel.com, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/21/23 11:26, dhruvaraj S wrote:
>
> 	
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
>
>
>
>
> On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh 
> <supreeth.venkatesh@amd.com> wrote:
>
>
>     On 3/21/23 05:40, Patrick Williams wrote:
>     > On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:
>     >
>     >> #### Alternatives Considered
>     >>
>     >> In-band mechanisms using System Management Mode (SMM) exists.
>     >>
>     >> However, out of band method to gather RAS data is processor
>     specific.
>     >>
>     > How does this compare with existing implementations in
>     > phosphor-debug-collector.
>     Thanks for your feedback. See below.
>     > I believe there was some attempt to extend
>     > P-D-C previously to handle Intel's crashdump behavior.
>     Intel's crashdump interface uses com.intel.crashdump.
>     We have implemented com.amd.crashdump based on that reference.
>     However,
>     can this be made generic?
>
>     PoC below:
>
>     busctl tree com.amd.crashdump
>
>     └─/com
>        └─/com/amd
>          └─/com/amd/crashdump
>            ├─/com/amd/crashdump/0
>            ├─/com/amd/crashdump/1
>            ├─/com/amd/crashdump/2
>            ├─/com/amd/crashdump/3
>            ├─/com/amd/crashdump/4
>            ├─/com/amd/crashdump/5
>            ├─/com/amd/crashdump/6
>            ├─/com/amd/crashdump/7
>            ├─/com/amd/crashdump/8
>            └─/com/amd/crashdump/9
>
>     > The repository
>     > currently handles IBM's processors, I think, or maybe that is
>     covered by
>     > openpower-debug-collector.
>     >
>     > In any case, I think you should look at the existing D-Bus
>     interfaces
>     > (and associated Redfish implementation) of these repositories and
>     > determine if you can use those approaches (or document why now).
>     I could not find an existing D-Bus interface for RAS in
>     xyz/openbmc_project/.
>     It would be helpful if you could point me to it.
>
>
> There is an interface for the dumps generated from the host, which can 
> be used for these kinds of dumps
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml
>
> The fault log also provides similar dumps
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml
>
ThanksDdhruvraj. The interface looks useful for the purpose. However, 
the current BMCWEB implementation references
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp 
[com.intel.crashdump]
constexpr char const* crashdumpPath = "/com/intel/crashdump";

constexpr char const* crashdumpInterface = "com.intel.crashdump";
constexpr char const* crashdumpObject = "com.intel.crashdump";

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml 
or 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml 
is it exercised in Redfish logservices?

> The tree for the dump manager looks like this
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/dump
>       |-/xyz/openbmc_project/dump/bmc
>       | `-/xyz/openbmc_project/dump/bmc/entry
>       |   |-/xyz/openbmc_project/dump/bmc/entry/1
>       |   |-/xyz/openbmc_project/dump/bmc/entry/2
>       |   |-/xyz/openbmc_project/dump/bmc/entry/3
>       |   `-/xyz/openbmc_project/dump/bmc/entry/4
>       |-/xyz/openbmc_project/dump/faultlog
>       |-/xyz/openbmc_project/dump/hardware
>       |-/xyz/openbmc_project/dump/hostboot
>       |-/xyz/openbmc_project/dump/internal
>       | `-/xyz/openbmc_project/dump/internal/manager
>       |-/xyz/openbmc_project/dump/resource
>       |-/xyz/openbmc_project/dump/sbe
>       `-/xyz/openbmc_project/dump/system
>
>     There are references to com.intel.crashdump in bmcweb code, but the
>     interface itself does not exist in yaml/com/intel/
>     we can add com.amd.crashdump as a start or even come up with a new
>     generic Dbus interface.
>     As far as Redfish implementation is concerned, we are following the
>     specification.
>     redfish/v1/Systems/system/LogServices/Crashdump schema is being used.
>
>     {
>
>     "@odata.id <http://odata.id>":
>     "/redfish/v1/Systems/system/LogServices/Crashdump/Entries",
>     "@odata.type": "#LogEntryCollection.LogEntryCollection",
>     "Description": "Collection of Crashdump Entries",
>     "Members":
>       [
>     {"@odata.id <http://odata.id>":
>     "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0",
>     "@odata.type": "#LogEntry.v1_7_0.LogEntry",
>     "AdditionalDataURI":
>     "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0/ras-error0.cper",
>     "Created": "1970-1-1T0:4:12Z",
>     "DiagnosticDataType": "OEM",
>     "EntryType": "Oem",
>     "Id": "0",
>     "Name": "CPU Crashdump",
>     "OEMDiagnosticDataType": "APMLCrashdump"
>     },
>     {"@odata.id <http://odata.id>":
>     "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1",
>     "@odata.type": "#LogEntry.v1_7_0.LogEntry",
>     "AdditionalDataURI":
>     "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1/ras-error1.cper",
>     "Created": "1970-1-1T0:4:12Z",
>     "DiagnosticDataType": "OEM",
>     "EntryType": "Oem",
>     "Id": "1",
>     "Name": "CPU Crashdump",
>     "OEMDiagnosticDataType": "APMLCrashdump"
>     },
>     ],
>     "Members@odata.count": 2,
>     "Name": "Open BMC Crashdump Entries"}
>     >
>
>
>
> -- 
> --------------
> Dhruvaraj S
