Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8362B1FB
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 04:57:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBq4M3Mdnz307C
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 14:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=S9HLww4T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::707; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=S9HLww4T;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBq3k4ZBsz2xkD
	for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 14:56:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6EcmXIwCREgBsZVFted7xozM+5JoanCfqLq+8dA9/7dsjMGimeyMhnP8lwu/HjVruVq5oYwRaIxbb01jXTo52+4Ro4Z/8zx+PJHITqBMJrJOB71EIrlvI0e2nmjlni4EDTCRIUsf+qn9Gr1b5G1omc17TDiQ1o4MPQlQJGV+6r7pC/mwJcUAWvxyp0tWOXAuZiy/mlNDaLNoJOqPaOFfc4tV9eECoyRIqkFb0F9XEeNPOEyoKPhi4TYNUZNNca/uLLEOkZK4+4WiJc3AvT0ln4hQnJo6vnaHatGmeJTwih8nXIEmojs5jGTl9FuFIFyKphjdcc+stvf1I4h9wBUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWraKrPELq223ItCSFfrcYUZIKR5iavd0Dy6IK+/Uz4=;
 b=W5xA85Z6VvNPdYCxSUWDb8+NSE8/8zxchJKaVzCvhs8FUgp6eDGSgqkYsGLKiaS0AjvQsgAa5ZvGhi8gkTucBtdJzci+iI/+K2YQTRJkec35+0WN0Cmr+kH3HmKX8gLSo9GUoeDKXAyNFgnfsBN3G5rkm4TFvPFiUcBZazF5Q8A8WNjn+mFqo2D58l4xy8ffDJBMYIkiJnSlP3A3OdibHEE38BK8ceUT6lcU8AEebXGMXtsZ50V99gJq5ak8uqXJDWObTcfmxYhcwSQc1F7QJQeygIWU16HmOJrjPoU3BHGBbwvAd/CKvrWz3MsD0i+HjLZfdskpXzt5XVMaVsocfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWraKrPELq223ItCSFfrcYUZIKR5iavd0Dy6IK+/Uz4=;
 b=S9HLww4T6I8qApepTsIU+pvKEJfudZPIu/lkMIuXVhSQ3sch4zFeozgjdCKauMz+gFw3ivwCOZU5WP6oMxXZiFCVXhxhrOAtAwP4mmPXB7ZuWCa/mcPg6ScXM0w/cb0gkup7IGxCwhDUkmJCEdapaIDOkeetJtEntQOFDst1Tg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MN2PR01MB5632.prod.exchangelabs.com (2603:10b6:208:110::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12; Wed, 16 Nov 2022 03:56:09 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 03:56:09 +0000
Message-ID: <c42b8b25-1f58-9edb-37d5-37739d529360@os.amperecomputing.com>
Date: Wed, 16 Nov 2022 10:55:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v10 0/3] Add Ampere's Altra SMPro child drivers
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20221031024442.2490881-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221031024442.2490881-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|MN2PR01MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 576dc874-783c-4e56-835b-08dac7867d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7fFem+bzZcr9wbF/xs2ubqRgRr9GWc+Z9WlOXc+L6bjIXYiOoII057lR5YaFh/iCdKiLQEg5+TEoR5JLIpWhep8T8HgYzJbqIkn02P3ejnr+3fB5zsB8P8ykiipf8mPIjFopfbAYo01K2VC7PG5k0jWr/RksuRmgBszmSJetQ93DRZqBLgaNrpYcraDUmdoNRCEW/lx3M0d1iAv0G5WMeXT43TnzyMTqmmk489TmA6qe9rcpBfll1waidluF0l3+xxZP/Aab4b8DHAdDRmW8C5qvawqH/tPtZkvsLeh0hTMQLukU3MPXHFudXYpOHVRmWtjLqVUZMxCb6BzZYcWtyHssj5Yu2icVNfE46YUxafvs278upezkgnKw57k8x64rC9DUFhVUog73VXA6DVyIxyqAPuWjH7x+/7ucreG0fOKIbTzRB5QHlS8h1wC5pBHEFCgJpzFzXVdJJXhxr54wmIiMerUuEceOgbnzBuFvtw0iegCmPao7xPdt4CDosmmDrDer86VpGiE+2D845stezW2WVNhBdGky6rX1IM6fflNgk4YXrB/62aZDmMR2ni9BOFAEZVrYcMOwO0wQclN3wjOWnRoPemM+JS/BJgNdqv689gd1Nwp6bjRDlyItZxfpNAvgC6FMLLze5PlqHwhI/E6X4EAY5dUgI6KHQ7aWkljMCkojR2C3/xTIzfK0tVruPLS6htkYOHBgPVKx5sVO0Oh6c4kvJdQ0OOoyXTc5EYlm9cg/vd1nveEpc/SBQOVRpisKQ8Rk7y3RpQFeX+NWlm9ZvuJrT3CulYSkfdO+TkbhVYRDR1YwB1XhNAUOnwbJ4lTD2gRtlI0c92SoTWVH/MW/GBnOo+oBusQpZnUlPqC6o0gQYDgZcp9G0aQTDdeI
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(451199015)(5660300002)(2906002)(41300700001)(8676002)(66476007)(66946007)(4326008)(66556008)(6916009)(316002)(54906003)(6506007)(6666004)(6512007)(107886003)(2616005)(31696002)(86362001)(966005)(53546011)(83380400001)(478600001)(6486002)(52116002)(38350700002)(38100700002)(8936002)(31686004)(186003)(26005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RGZKZTA0Z2QvaHArREtBdlN1bzZRZFJaYit1Y3JLT0hXSU5PT3BWLyt6T2Zq?=
 =?utf-8?B?MXVKMVY3WGZQZnVZY0ZPVnFFdm01SC9FcEdJbURTd2pEcUhwRno0VjBHM0Ur?=
 =?utf-8?B?czdpMzQyTnB3SFllazhwMTdZS3F5YUJzc0FvaVJWZ2RRWDd6Z0YxYVFjSmdQ?=
 =?utf-8?B?Rm1GWVJJNjZ6TlVobkx0ajEyMm03Yy80RWdyTjRzMmc4NElheGRlRm1UOWxM?=
 =?utf-8?B?SUYrUTA3L1ZhUDRYQTMwR2puWnlTUzU3MG1VZiszOE51RGhjTlNoSE5XOHA0?=
 =?utf-8?B?YTNiUXM0Qm5rWkR5TFhTc2dxS2JMZ3JPVExwSjMxcXo5ZXdPZC9CSVBxZExn?=
 =?utf-8?B?akIvb3VxUHNqb09hWTRCYTJiSmoxaFBzYjZMYlRKOG0wS2V4VDA2bkhoM2pq?=
 =?utf-8?B?MHRYbXlpeWhZNTBPOWprQ3hIbW9rMHZlSk1VY3JtQzV5dHh0TUJxRVhuZWtv?=
 =?utf-8?B?RjRlRE9leGFDZmF0N21acGYxRlREUGR1WDN5enJUT0gyeWJLcHZtc1kxbExS?=
 =?utf-8?B?Y3IyRjhVeWFyS2pPSmdxbkpqNUJxdEpPMmxkM2NzR2w4emF5dnlkODZoVXoy?=
 =?utf-8?B?cW9UUWxoWmtDK3h2aEdwRGVseDhiTjkrcVlvUFRVanQzVDJyalptczVmQzhR?=
 =?utf-8?B?SW5lek8rOHFHMFRIc2F5YVBCMzQ0RnRQZEN4eGtSWnkzUWc2cEpQUXdrUmgz?=
 =?utf-8?B?eXZvVnFIS3cwbGF4Z2V1eHFzRHlZMEtSSDhqc3gyV3pucUJkTDZreFM5djB0?=
 =?utf-8?B?RndXTFRZWHM0WFowdzJ5V3UvVUF1eURQelJiWitNamI0S2pScUplY3VvTVp4?=
 =?utf-8?B?ZHI3cSt1all1OWEybnpUM3V1UnQzNDZFd3ZxOVNHSDZubVlzTlIvWkZOdHJU?=
 =?utf-8?B?d2NKZVlPTndQaEFuL2lEbmtXMmhjVkJ5WEk0UEoySERuLzY3SGRPTFNLdmth?=
 =?utf-8?B?dXNIZDRlYjVyNXVRVjlBaTFlUTh4QUFhem4zYmFnQmFGcEh3THEwMm9abkNl?=
 =?utf-8?B?Nk5sUTZBUDhrZkJSNTdnMmJidW9seU9PeFNRdk96eWszS0lOYmtSOFZZaHRl?=
 =?utf-8?B?NHovVURuREtHWkpmOXdscjVzeEk4NGFqN2oyMzltdm84T3hwYmZoTWRtSVpZ?=
 =?utf-8?B?cExHQUplMmhsYVZ2OXFyMEpPaGtyZUZpUlNrSFI3Vy9kR1U0QmhEeC9SZEdw?=
 =?utf-8?B?VjdrL2J0cXFTcmE2SEowN0hTUUljRUpOUldPZk1xcDFRb2x4eDdDUm9IbVh0?=
 =?utf-8?B?Y3ZJeElmU29uM2J0clFOR3dTQmprUnFMRnJBdmdSQzNSN2pINGJ0d2ZsUGZB?=
 =?utf-8?B?K3k2UXhDamZwT1BjbVJKQW5ZN2YvNnkyMS9MdjhINjRzOUNmWlJIWnFCdDZ5?=
 =?utf-8?B?L3RjUEtTV001RGxLZ1MyQkU1dHdUMjVReXRWZ014YklQTGxHdkdOOFNsZ2Ft?=
 =?utf-8?B?dGJxMHhBc3VZYVFMelJHcXlaTnQ4cXV0V2c2ZFIxQVRsZkFLbjRET2dLVDRm?=
 =?utf-8?B?RzRtMS9ScWw3ZTlBenBJdDBKRG53THpSYkM1TVFYUjBHUjBteVBXTFVINlpY?=
 =?utf-8?B?NU40MEdvZDhqNmF4SnRDUkdxUEpxRkNiMkVOV2ozZWdDWUxyckN5WmZwbXIr?=
 =?utf-8?B?MjhVYjRvNnVmTFU0Yjd3aUZlU0NrYnNyaUpSdXBUNi92c3pRVUFGTDRHQ04x?=
 =?utf-8?B?SWZFbnNFN2d0cUxCVTNMdFdhd2Yva2JVaG54TDF0bUY5bHFaVEpPMUtpM0lT?=
 =?utf-8?B?ckZhSFpUdyt6dUkwcFFkczFDSTBrbFdzSERQZTRyREFKbU5yanY5bTBKNVd3?=
 =?utf-8?B?YWYxTURWZUMzangvWUNubjFWcG1ua0ovQWpSejloSU16WEpNZ3hlOE5PVEJj?=
 =?utf-8?B?VytYSVFVcWhZR3RTWXVvYWlyY3FEd041MmxxWWhrdXB6dTNhK2lFaFkyclV3?=
 =?utf-8?B?ai9OSDkwanFLVDJnWU9tNnNQbDVmTVYvU1dmTC9wQVhDRVc5VHk4bmx5SFMw?=
 =?utf-8?B?b3E1SWtaVEd4dmttZkF6WkVmZXdMKzlqbTVoamFqMWFGakxkVW1odVpVeHZO?=
 =?utf-8?B?SzhxS1QxSlJCVnNxVkVJSS9wQ0lQYVJXVUQycVRyUkd3MDc2NGRZTEphUks0?=
 =?utf-8?B?WTB3MHZHN2xuZElVM01UUE5UV0R3ajViZlNINk4raVplWFpIZTc3bGtSTmdI?=
 =?utf-8?Q?Yuh0utJkycrLnT780moiULU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576dc874-783c-4e56-835b-08dac7867d54
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 03:56:08.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkiTcoD6qVJy3b6LzMYsug8+hrKPqXkISZczZvkjdjt8PwRz+uHt7s85X8IM2g+yIVHnCj//vZuJTjhIYJNVTtQsgdeR7Qljmj8HN2FQy8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5632
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
Cc: Open Source Submission <patches@amperecomputing.com>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

As this patch set was all accepted in linux-next tree, May you help to 
pick them to your openbmc/linux dev-6.0 branch?

The list of commits is as below (as some was picked in v9 and the remain 
was picked in v10):

+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=072b9545e5cf470eea01f8e59c3dbd4b81181a2e
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=026d99699101db523f444d0fc3dddb75fef42594
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=4a4a4e9ebaa3ce903a3cdf8bb173eeaf87828cea
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=763dc90e9a4332f82ad43c866c6878742b15d4ab
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=2202e8df80936fa0d92d49cc7db1562e7772308e
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=c157f6e8ea2e61ab72f85567f37faa4711c291d7
+ 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=37618918f6c7219e1bfb86e4c3fe7834092643d0

Thank you for the help.
- Quan


On 31/10/2022 09:44, Quan Nguyen wrote:
> The SMpro co-processor on Ampere Altra processor family is to monitor
> and report various data included hwmon-related info, RAS errors, and
> other miscellaneous information. The SMPro MFD driver initializes the
> register map and instantiates all sub-devices. All the specifics will
> be handled in the child drivers.
> 
> As some patches in previous version were picked, this patchset includes
> the remain patches which are Ampere SMpro errmon, SMPRO misc and dt
> bindings document for SMPro MFD driver. The errmon driver supports
> monitoring and reporting RAS-related errors. The misc driver supports
> reporting boot progress and other miscellaneous information.
> 
> Discussion for v9:
> https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/
> 
> v10:
>    + Revise and fix document format                             [Bagas]
>    + Update commit message: s/This commit adds/Add/             [Bagas]
>    + Use
>      Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>                                                                  [Greg]
>    + Drop Documentation/misc-devices/smpro-[errmon|misc].rst     [Greg]
> 
> v9:
>    + Fix issue when building htmldocs                           [Bagas]
>    + Insert 'break;' to avoid fall-through          [kernel test robot]
>    + Update SPDX license                                         [Greg]
>    + Fix messy goto                                              [Greg]
>    + Use ATTRIBUTE_GROUPS()                                      [Greg]
>    + Use dev_groups instead of sysfs_create_group() to avoid
>    user space racing issue                                       [Greg]
>    + Fix ugly static struct define                               [Greg]
>    + Rename smpro-mfd.c to smpro-core.c                     [Lee Jones]
>    + Fix include files in alphabetical order                [Lee Jones]
>    + Add defines to avoid using magic numbers               [Lee Jones]
>    + Return -EINVAL if device does not match                [Lee Jones]
>    + Remove unnecessary comment                             [Lee Jones]
>    + Remove unnecessary channel info for VRD and DIMM event      [Quan]
>    + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
>    + Add minor refactor code                                     [Quan]
> 
> v8:
>    + Insert 'break;' to avoid fall-through          [kernel test robot]
>    + Avoid uninitialized variable use               [kernel test robot]
>    + Remove unused #*_cells                                 [Krzysztof]
>    + Switch to use sysfs_emit()                                  [Greg]
>    + Sysfs to return single value only                           [Greg]
>    + Fix KernelVerion field in Documentation/ABI/testing doc     [Greg]
>    + Change errors_* sysfs to error_*                            [Quan]
>    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>    overflow status of each type of HW errors                     [Quan]
>    + Update wording in Kconfig for smpro-errmon and smpro-misc   [Quan]
>    + Masks reserved bit when read 10-bit power value             [Quan]
>    + Add some minor refactor                                     [Quan]
> 
> v7:
>    + Add docs to Documentation/ABI/testing                       [Greg]
>    + Re-order patches to avoid compile dependency           [Lee Jones]
>    + Remove regmap_acquire/release_lock()                        [Quan]
>    + Install regmap bus->read/write() to handle multiple types of bus
>      access                                                      [Quan]
>    + Replace i2c block read by regmap_noinc_read()               [Quan]
>    + Fix wrong return type of *show/store()         [kernel test robot]
>    + Update GPL version                                          [Quan]
>    + Add some others minor code refactor                         [Quan]
> 
> v6:
>    + Introduced smpro-errmon, smpro-misc as smpro-mfd sub-device [Quan]
> 
> v5:
>    + Introduced the smpro-mfd driver and drop the use of
>    simple-mfd-i2c driver to avoid DT node with no resource in child
>    device DT nodes [Rob]
>    + Removed the use of reg DT property in child driver [Quan]
>    + Validated ManufactureID when probing smpro-mfd drivers [Quan]
>    + As child devices are instantiated by SMPro MFD driver, drop the
>    ManufacturerID checking in child driver, ie: smpro-hwmon [Quan]
>    + Revised commit messages [Quan]
> 
> v4:
>    + Revised commit message [Quan]
>    + Fixed build issue found by kernel test robot [Guenter]
>    + Returned regmap_read() error code [Guenter]
> 
> v3:
>    + Supported list of compatible string [Rob]
>    + Introduced reg property in DT to specify reg offset [Rob]
>    + Updated description and other minor changes in yaml file [Rob]
>    + Handled negative temperature value [Guenter]
>    + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
>    + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
>    + Removed smpro_write() function [Guenter]
>    + Added minor refactor changes [Quan]
> 
> v2:
>    + Used 'struct of_device_id's .data attribute [Lee Jones]
>    + Removed "virtual" sensors [Guenter]
>    + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
>    + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
>    + Clarified "highest" meaning in documentation [Guenter]
>    + Corrected return error code when host is turn off [Guenter]
>    + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
>    + Removed license info as SPDX-License-Identifier existed [Guenter]
>    + Added is_visible() support [Guenter]
>    + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
>    + Made is_valid_id() return boolean [Guenter]
>    + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
>    + Removed unnecessary error message when dev register fail [Guenter]
>    + Removed Socket TDP sensor [Quan]
>    + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
>    + Included sensor type and channel in labels [Quan]
>    + Refactorized code to fix checkpatch.pl --strict complaint [Quan]
> 
> Quan Nguyen (3):
>    dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
>    misc: smpro-errmon: Add Ampere's SMpro error monitor driver
>    misc: smpro-misc: Add Ampere's Altra SMpro misc driver
> 
>   .../sysfs-bus-platform-devices-ampere-smpro   | 312 +++++++++++
>   .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
>   drivers/misc/Kconfig                          |  22 +
>   drivers/misc/Makefile                         |   2 +
>   drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
>   drivers/misc/smpro-misc.c                     | 145 +++++
>   6 files changed, 1052 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>   create mode 100644 drivers/misc/smpro-errmon.c
>   create mode 100644 drivers/misc/smpro-misc.c
> 
