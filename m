Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D228DC5F
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 11:07:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB64g4M34zDqc3
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 20:07:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=24.159.132.13;
 helo=smtp4.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=avkTYkqJ; 
 dkim-atps=neutral
Received: from smtp4.synnex.com (smtp4.synnex.com [24.159.132.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB63n5bnNzDqYX
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 20:06:44 +1100 (AEDT)
Received: from GSC-EXCH6.synnex.org ([10.84.32.34])
 by smtp4.synnex.com  with ESMTP id 09E96crW017752-09E96crY017752
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL);
 Wed, 14 Oct 2020 05:06:38 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by GSC-EXCH6.synnex.org
 (10.84.32.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 14 Oct
 2020 05:06:37 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 14 Oct 2020 05:06:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT4JlO495iuDcgJEGklSbjWD/Frl+wpqHSqpyg3ZAOUlt7H2FRBLmy2uFc3GsYcz4i+ayU+PZeKBbqHQaDp4YdAHsLpTFg42GHgpOSWmQkJ4PorLwgBgP1yLk9rVWkOlFfxvaF/0q9q+p6DFt8oPsK7yz6FuuvhBMh4Z1FZrC3yDphBrfvsUpo/16Monvixowv0Flp+451d7NxwFRUCoIYV9Ab/bbAzIolQUIUgm7IsYm30IqXxgT7V+Sv9QDaHWn/fKDarPHn6AmVOYAJUg0l3Q6wSZKpVXwUN3BmzU1STaWWPv+j1yiUsd94LDam62ng4MBhBkOSTeo/nbBFg+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmZnd08qDFR3DdzDqfUGJGVcURRaFG5dlR5cDl+HDO4=;
 b=V1DrWOmp/ePPgwWkFOviVXfZI1TXIFjkZeKBIMteeie4pkUamoTM+ulFvp4AFPGEjwM2b9SWqYdiLhxc/1PFzuoFZP2YoYgX4YqzhiH+qU5wapfxef6yCWdyUjCG/w/w5oYsR/gowXiMJ2YVMVeVLoBIbZ+NX7Pk7JGXoFXZl2Wi8s4cQiK27yenLPIXGRMCsKZs5AzOsRcaFwP06mb9Azj9q0znB2vF5k7zg3IsY0pPYh5oFVhrISpA8qk9fRiQ/WHb9Knws6OhAnpbjGnvH4xmTBJhpQPMCV6QhgzX7WzbsOUcnaoIQxvO42pVF7jkYhwDMu/RsAvoPK7ymoz3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmZnd08qDFR3DdzDqfUGJGVcURRaFG5dlR5cDl+HDO4=;
 b=avkTYkqJVtWGJEJHC7nRrooDfffBI7XBXAwDjVJ2Y/LqEz1joWQlmzr7+uXq5p34+xuFSXQ9RMlTL8D1dI8CNAizZqbp82mXlm9KtbT/0wEXdzXGiDI/we0sUCIcAWzI2CQxBBIO2RJXkPILsq5r+GYDv5C1OunOXhM+hj9TPoE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
Received: from CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14)
 by CY4PR0401MB3585.namprd04.prod.outlook.com (2603:10b6:910:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 14 Oct
 2020 09:06:35 +0000
Received: from CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150]) by CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150%6]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 09:06:35 +0000
Subject: Re: [redfish/v1/Systems/system/Processors] How does it work on wolf
 pass?
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 <openbmc@lists.ozlabs.org>
References: <CAMXw96NCuqbeaOMQaO_BU2+_qQojOfLQdH-1=JS16vfanSZPdw@mail.gmail.com>
 <943f9c80-1f3c-b64d-1cb7-02b90d999be2@linux.intel.com>
From: Brad Chou <bradc@hyvedesignsolutions.com>
Message-ID: <ea9b85fb-8951-5c25-bc42-6f6e636d347e@hyvedesignsolutions.com>
Date: Wed, 14 Oct 2020 17:06:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <943f9c80-1f3c-b64d-1cb7-02b90d999be2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [61.222.103.61]
X-ClientProxiedBy: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To CY4PR04MB1033.namprd04.prod.outlook.com
 (2603:10b6:910:54::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (61.222.103.61) by
 HK2PR02CA0209.apcprd02.prod.outlook.com (2603:1096:201:20::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 09:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8970c08a-65f1-41a1-7be8-08d87020728c
X-MS-TrafficTypeDiagnostic: CY4PR0401MB3585:
X-Microsoft-Antispam-PRVS: <CY4PR0401MB35854E63380E2328634484C4B9050@CY4PR0401MB3585.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycoErhYEmcB8bcrtv+Vllmv/6f17uZd09m+Yn1ekb9ie9euv08jxeZVodoJNeooUARXgaxi2p2tPjqt5q9LwdZhhO17Lg3Kpma4v/owgkg7rGqtVrO90LkgtaR49eV4l2O2ettjfPuwkFAW+B5judiGxSRntaYrw5Od71iqPC/EUh1wjiVEUO/tt7/VQ3nUEoClVtetqEOBHKa2z8X3vnDhBvGBJc/+O9OEmTonTrC1YoPqhi7gxHA6c1oSSx7fNizQtwAK9jH83bg6Q0rLN0cufx5o/po3iUbmbnF4wd8FT4wS3c1Cufq7IsjriA7WPhJvFtql51k8UPS9v2ITyLXvlT2Zwh4lRU6eavGeSPtz1Ccp5Kz5EQpxSGpzi0iLyiLrKZc7gVC4oHB1MX5XUTSTJQ/ywx2D6wRRRy2ZatU4uHpJeQAxtWIPHeYK5ld+tJLPQ+lhacjZZIDv8RIHllQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB1033.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(8676002)(8936002)(2906002)(66556008)(66476007)(66946007)(5660300002)(6666004)(31686004)(83380400001)(6486002)(478600001)(966005)(186003)(16526019)(52116002)(26005)(31696002)(16576012)(956004)(83080400001)(316002)(2616005)(86362001)(36756003)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: +qHol2qdto7C5M8arEisBWTiJHiJ4qqvnZvpzLPRZKb1lVbas0j+gMyiVtEi69U+WsabNxQ/2cW5tD3irtSVVKns0wcvzvkqWtP+AR7pM4PWpWIOnYMcVavmsDpoG7FW2a8WISdmo+Qff9DTrCFlfzaiOuqdGfkKJ+CQ1pfMN8YZO+xMjYv519SM2qAYmaY9xBuwAXc18LKhHKiZ3mq7mwe51GB2qM+Ot6353WPx2wVA1QI0T8wwiIAMdyumujeLaWvhW58IA4lsUr05xpHxpebKyIKQJ2yFthuYW7Owken65Oaxixn/2zttaSovTuxMvsrYhO1W+okm+Z01khMX9YQuvYWIPjTNp/7+OqW+FSPVjZL/5oKj2/p7bqC616PTu4Er6rXX3piy3GmD5PUc1G+m5L9FxQWYIckmiOmNMnbhQwOefMAl0NByUnJV7YjDHSHIOcFzQ67ApHA00EJUMqPlyR0wVavAXNTTUfp5jzkN8Kxc+yYRLIvhsySv0kuxIMvHWgBaqdQH1ZYlIJNPh/yyy4tc5jekAvMNmqqAQqjFvErG1a10VgJptYWNKD9J3gauh3junLeOfh0cfx3goRWEDyj845UdpcVhDXRZ/zDgDNrf6HMoeUe7YibZR414RltevSz4CMXcYApxbZFbJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8970c08a-65f1-41a1-7be8-08d87020728c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB1033.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 09:06:35.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdiSDsggAUIrFRU7jxOUWHPSVuYJEtJDLw/M3VTKgQA8hi0PbfBb+TADA43V6y2ZU4Y4CctXGuT7RpnMSEuOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3585
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Policy-ID: 6:1:1:SYSTEM
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

Hi Bills,

I am also interesting in this kind of SMBIOS table processing.

May I know if Intel has plan to pull this feature into 
https://github.com/openbmc ?


By the way, I notice that a patch is also required to make it work.

https://github.com/Intel-BMC/openbmc/blob/4c732e83b4ca9a869c0a3f6e9b7e22ac9c76a78f/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0035-Implement-a-memory-driver-share-memory.patch

It says BIOS is using BMC VGA shared memory to transfer the whole SMBIOS 
table to BMC, particularly a 16MB size memory allocated at 0x9ff0:0000.

My question is, if the BMC VGA memory hardware strap settings is 64MB, 
that is BMC already occupy all VGA memory as frame buffer.

Can BIOS still use the VGA share memory to transfer SMBIOS table ?


Brad Chou


On 10/13/20 12:23 AM, Bills, Jason M wrote:
> [External E-mail] CAUTION: This email originated from outside of the 
> organization. Do not click links or open attachments unless you 
> recognize the sender and know the content is safe.
>
>
>
>
> On 10/9/2020 5:57 PM, Zhenfei Tai wrote:
>> Hi,
>>
>> I've been testing bmcweb and noticed the response from the URI 
>> `redfish/v1/Systems/system/Processors` contains an empty collection.
>>
>> {
>>    "@odata.context": 
>> "/redfish/v1/$metadata#ProcessorCollection.ProcessorCollection",
>>    "@odata.id <http://odata.id>": 
>> "/redfish/v1/Systems/system/Processors/",
>>    "@odata.type": "#ProcessorCollection.ProcessorCollection",
>>    "Members": [],
>>    "Members@odata.count": 0,
>>    "Name": "Processor Collection"
>> }
>>
>> Looking at bmcweb code, it seems to look for dbus interfaces 
>> `xyz.openbmc_project.Inventory.Item.Cpu` and 
>> `xyz.openbmc_project.Inventory.Item.Accelerator`. However they can't 
>> be seen in dbus.
>>
>> # busctl tree --no-pager xyz.openbmc_project.Inventory.Item.Cpu
>> Failed to introspect object / of service 
>> xyz.openbmc_project.Inventory.Item.Cpu: The name is not activatable
>>
>> Entity-manager and cpu-sensor are running in addition to bmcweb. The 
>> entity-manager config is below and I can see the config is picked up 
>> in `xyz.openbmc_project.EntityManager`.
>>
>> {
>>    "Exposes": [
>>      {
>>          "Address": "0x30",
>>          "Bus": 0,
>>          "CpuID": 1,
>>          "Name": "CPU 1",
>>          "Type": "XeonCPU"
>>      },
>>      {
>>          "Address": "0x31",
>>          "Bus": 0,
>>          "CpuID": 2,
>>          "Name": "CPU 2",
>>          "Type": "XeonCPU"
>>      }
>>    ],
>>    "Name": "internal_code_name",
>>    "Probe": "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 
>> 'internal_product_name'})",
>>    "Type": "Board"
>> }
>>
>> I'm not sure what else is required to have the URI work properly. 
>> Could someone familiar with this issue help?
> On Intel systems, we currently get most CPU information from the 
> SMBIOS tables which are provided to the BMC through something called 
> the MDR. That application is available here: 
> https://github.com/Intel-BMC/mdrv2.
>
> When we have seen empty CPU or memory resource collections in Redfish, 
> it has usually been caused by a failure to get the SMBIOS data from BIOS.
>
>>
>> Thanks,
>> Zhenfei
>
