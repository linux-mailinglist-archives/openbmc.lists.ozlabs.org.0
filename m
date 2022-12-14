Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8764D734
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXkCn0L1Zz2xH8
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:20:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=p262+11o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.117; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=p262+11o;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2117.outbound.protection.outlook.com [40.107.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX29f5pB8z30RG
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 15:16:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm9vg71IC1zstRv9anE7tFnmW8zBKfnM1F4CV+cN30J4pGw7MxiScMj6FrSe9nh9eo857K9BRbybTxrUi18vi6UxcNnTZ05osc54Jrmw9ADTnInZ7t/+LzFhL+VdpFQ+5NYn4FJSG6CiCkD93JiC8bxk13ecroT7N1Gal9IGJ63Ll3KstrTxpMbquDe871L/tdaADfSvMBp0iw2c1/ZN1te4FU/tG4VIvkoeWoYaWW6l/sDl8cEtJD98tlHllfAX4F5r38H6dgJfS+/C7/ox2sQuc7qWGe1L1a1r9PcFv4m6aabhLOGnZxZzA8sHJB/tDpHfIRjuF5VqbP36VwakFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qmj5Rxd31qMp69MMxv6HGopqfSC4FNy+0gJFUwIBOmA=;
 b=FlCAdLECGEL02ZlZAuu8VRlUFsKryENnjMCa5YICioq+vE5wxad+kHWnPDwPggM4bhixNl532RW7hyy0ZWBRXhExh0tXwll5uASFU78+qY9SCSpvYZKTePjnbQR6SjHB4f2MvbdafwuTlTbXNrLDTCkIK6IcqLBpMtWudFElS2iIHx49k8LdpZKA4SCzuf5gcIup7Fy4zxpOo61ezpbgq6QEQ+DKQ/TPG78Jnmb8ws2qpt5ECf/FL41Kfp2jw3bxJKZohNB+9jjWT94gNvEUThix4o93FzUoCiHF7odtK4MhezXtx3cQa9aS1XpgJo4pBj8ARqdIqGWm2BK7ihTsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qmj5Rxd31qMp69MMxv6HGopqfSC4FNy+0gJFUwIBOmA=;
 b=p262+11oHcSgNsNPlXOfHA9vqR/+uAOKqNCEZqQL0r0Afz+iG2RAnsbiBkTjwtYYUULxVPtY2xcRJuL2Q8JP9pfgnNl8MZ8g4xrZAsXB+dYMG1x8rhqZ4h7HhTtsxmwegPXzyZSTQLH/xLVdCMeTWQxMWZBDZiWzPZ4bMMfN5Eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 CY4PR01MB2471.prod.exchangelabs.com (2603:10b6:903:73::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Wed, 14 Dec 2022 04:15:59 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 04:15:59 +0000
Message-ID: <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
Date: Wed, 14 Dec 2022 11:15:48 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|CY4PR01MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea07634-4f51-4183-8653-08dadd89e7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	weyGU8fgiaujg5du+mMVNGUnSNekx0xDyBN0sKdXkR4bl/XiwAyTUVKs9x9kL72p//ph8p+nfJbI5FXJVYgBTJkat5WFRr2j11pSMxrmHCbL1mg13EnTHCol+SSEhdk8Z7ySdCeNjLKTerlYo8RuLfo9qDHrbvmm8Hng31PG16wC2cd18L9jURSIpli81GDUrqbmz8vyODXyhpxaxQKCSp3bPwwqO/0OaadVeLbyWcjGm42O+Wx6tERQvu8+AQ494+dN5eEmDwUklq2pmgXM4BWSWD1LLHtHH69oVrCTP/0pWSD8j4bNUazcUaOxPtS/Sj2QArVB0+ESRNuvRoVCRpGv+XTq/5Sspb3p1rPYS3V4AYywh/ZgS882JHh9dhmGzQLqqCnYVh2HlJOOB5vHRyv1MCKt4EHqbEhUCQyblDJllgjZhlGIoRHb3UNfBDCpQKGUAhNYkYrkRX8Riqv8qua2XCKMyR0+2uGeKpoTciXnVvjhiAnkoReMdb4AnwLfIyEitDJXmHx8gw2Ud9iR7SrWZhC+EAySRvvtos5JQs+GCFx97t2ngm4bTvg/Xvbfc4vUmo3OinrJXRrxfIANbhwayHho6db7O01DzHLSp0y8Nsl6yt7+21hpK34xHgsH1lD0CFkLmK5sB6Yq+06JyA/firX3t6Nthz7hbDvraUPhTHC3lqQK1qJqNJ/z+Cv3
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(376002)(39850400004)(451199015)(478600001)(31696002)(53546011)(6486002)(66946007)(66556008)(42882007)(6512007)(7416002)(8676002)(66476007)(8936002)(110136005)(316002)(2906002)(54906003)(5660300002)(41300700001)(66574015)(38100700002)(6666004)(26005)(83170400001)(6506007)(186003)(2616005)(4326008)(83380400001)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MGhkc3VRY0U3UkxZUEZoaVVGYzdoQ1pWOWtSWi9peDlLSHRYT2FXanF5L0Rj?=
 =?utf-8?B?VWY5NTR2Q0xiWkoySCtpRk1BMUZ0Y0U4ZFJITjVPTTRlTU9iTTJRaDBaWlJW?=
 =?utf-8?B?d2tObUdCNy9vS01lazBQTVJBMW51QWFheFZmTURUWkRhNk8venFkYXVjU3Fv?=
 =?utf-8?B?eHkrQ1FkV0JwNGR4V0RDR2pUdGw4Sk5kQlpmZVV4YnAxT0gvYyt0R1Y0bWRs?=
 =?utf-8?B?amczWVhaQzVra095NjJodHE5eW94VDJ2V2t3U0pmUHJ2b1FFU2ExY2RaOC9C?=
 =?utf-8?B?MWNhUE9DN1IxckhLb01OcDNHbHJmWmZKaUxlRnk3WVk3K3QybFdzYXNpdTFN?=
 =?utf-8?B?TGU3UUpBUUl5Sk1ZQVZCNm9NQjMyVm0vZENnS1lwbDd4aUFaRXp3dm41L1g4?=
 =?utf-8?B?VUZvTEZoT3c5MzhRRUhvN0g5cFlhdHhhd3REbXZmempRWU9yQUlzL3U0K0xl?=
 =?utf-8?B?cnFOT0RoQ0g3TE9BN1djc2NRMzFWTmg2NldqcExHWlBiUVArRDVSc2dOdEhl?=
 =?utf-8?B?T0xsY2ZYS1ZITWpocVlIMDM0MjdORkdIL09wZ2NkTDhmM0ovUDFuZTgvZVFr?=
 =?utf-8?B?VHY2Mk5WdmhIK1A5QjNjTzUzZUlMcUZRZnVUWi8vaHpJdk9CTUF0NlJ4UHlL?=
 =?utf-8?B?Y1gzelU1bFhNNEQySGpyNHNWYldBdGx5UU5ZRzNMeGpQb09qS2VyUlNhVGVz?=
 =?utf-8?B?SGUzT01KTWZsVEV5M2hiYjJrejdON0thSHA4dVNvb1FFRldMakU3NUh3eFpG?=
 =?utf-8?B?UlJQRCtZaGFXUFpNcjUwNXJDS29JNXJ1dlltb3RYNEJSRDNWZkhsMnUwbXVq?=
 =?utf-8?B?T1RXZHFpL0wva2pKcGx6b0R4TS9Id2FVN2hRRXhOaGVPUjFPRFBNYWpSVzBK?=
 =?utf-8?B?SDdtN1FUZEl6eHlnYmRzTGk3NFF5MXI1YXMwQ2NoemxHeXIyVHBpN0MrTWlh?=
 =?utf-8?B?UjFKa05MMmtiRndTdE5WcmNoT1J6MEhsRXhLR1AxMXdCeE1RL3d1RFFCKzJj?=
 =?utf-8?B?TFQwTU1aM285UUJZeDgvWUNXeDBUMWJ2UFA5dXpVNGU4STV2ZTVxU1IxYW1v?=
 =?utf-8?B?QkFmckRrQ05SQzhReGs4NnJjOW1WeXdjeGpkTDluOU02Wlc0bHNzeFh5ZUUw?=
 =?utf-8?B?eXpINjVEM0xobkVaVXpvaVZVQmpIUCswdVBqWlBnai9FY3NRVkRndE05bWxL?=
 =?utf-8?B?MHV6akZtZ1A3dXpieTFGODRtNzErVkZVZW8yZW1qbU80ZVNPNndkZnVpM2tB?=
 =?utf-8?B?SHk0eGVxdGZnYUx5Sjdab01MMGU4TE94L2dERmpjajlTT2lVeFJUNFdzMUUx?=
 =?utf-8?B?MEIxYllJcG5UYzRjTHI1QkZEVEJyZTYvd0E2b3duQWVFWDc4VlZSN002Nkw5?=
 =?utf-8?B?QlRVREY3dGVLZ0lJOXE2K2tZdUhaVys2L2d0dXM0eWdJYkwveFhza1RkdnJr?=
 =?utf-8?B?WVh1QjloMmFOOHFJZDUwVUVCQzJLRU9NTCt6SlN4Um1vcndYWHpyWlhEbkVX?=
 =?utf-8?B?b2VvU1dvekRNMW0zTUw0S1RuVGNMTGZsekZUUE9SL05FZG5TK2hxem5rU3dH?=
 =?utf-8?B?WlQ0Y09JRnNMOG5meTJrY2NKV0IrOXo4d0dtRDhWRjRJT052RFJvVCtEWWdN?=
 =?utf-8?B?dWlXQVg0ZS9PSUVFelEwbitsVGQvcnZtVWNXSHNPSi9Ua0JCMDNHNHZCQWxL?=
 =?utf-8?B?MDlJcE0ycEsra1JWSDBzS3VwRDRvRjNwYktHUFhEVUc4Q3dseEh6OFBtVDVo?=
 =?utf-8?B?SDc4a3hYUXJmOEFpaGRMQmFoWWFzbXEyQmMxdWlTVGIvbGpoalJXOFpYUjNw?=
 =?utf-8?B?aUhLWUhwZFZRbVF2MlgwSnJlT2QzNFpZbnJ3am92MWh3aG9DTFN1cUJQSVdH?=
 =?utf-8?B?TGRmZzBFVFBEcHNNWHJ3RjBNMGJZR2lOeERlazdnaDZoNnJ6ekQ4NnpUQTlV?=
 =?utf-8?B?MnJpL2VyQUR0QThTZTd1M3drRWJrWklkVnAzYlF5RllPL2liZjRNaysrWElj?=
 =?utf-8?B?dW9YVmU1b3FWcHBjY1V3anhnOGg0UHJyVUJSN2xNVDJFOEtCMjJHWHA5bzNm?=
 =?utf-8?B?ZDYxQVdMeEV0WGVHQ0JxUHlGd0tTN0RvOEozRjZvMU9sSXRKK0trR1E5b0J2?=
 =?utf-8?B?eldkK3ErVTZmZHlhTTJIVkhwZjlPcEw0ZnJKZ1YvMG5lbEtqeE9IeGJBaHpr?=
 =?utf-8?Q?QR7skKucxa6uKbyAvFSNDSA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea07634-4f51-4183-8653-08dadd89e7b1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 04:15:59.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VjESuY4RSOBJgOsn82xiyBrvrsL8y4ctSAskLKu52lbgaFQ58JxlZcwbKLNfuVZoIwPbNihoHPnQrRJydl/OL6SBiHRGfrK/F44CWjIcJnxyIj7XZCbC+CUm7FdHro7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2471
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 13/12/2022 14:22, Christophe JAILLET wrote:
> Le 13/12/2022 à 05:12, Chanh Nguyen a écrit :
>> It is unable to use configfs to attach more than one gadget. When
>> attaching the second gadget, it always fails and the kernel message
>> prints out:
>>
>> Error: Driver 'configfs-gadget' is already registered, aborting...
>> UDC core: g1: driver registration failed: -16
>>
>> This commit fixes the problem by a ".N" suffix added to each
>> configfs_gadget's driver name (where N is a unique ID number),
>> thus making the names distinct.
>>
>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>> Signed-off-by: Chanh Nguyen 
>> <chanh-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org>
>> ---
>>   drivers/usb/gadget/configfs.c | 42 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/configfs.c 
>> b/drivers/usb/gadget/configfs.c
>> index 96121d1c8df4..d8c5156ad777 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -3,6 +3,7 @@
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>>   #include <linux/device.h>
>> +#include <linux/idr.h>
>>   #include <linux/kstrtox.h>
>>   #include <linux/nls.h>
>>   #include <linux/usb/composite.h>
>> @@ -11,6 +12,16 @@
>>   #include "u_f.h"
>>   #include "u_os_desc.h"
>> +static DEFINE_IDA(driver_id_numbers);
>> +
>> +/*
>> + * Driver name has the form of "configfs-gadget.%d", where %d
>> + * is id allocated by ida_alloc(). The max value returns by
>> + * ida_alloc() is INT_MAX, in 64-bit system, it is about nine
>> + * quintillion: 19 digits in decimal. Set the max length to 35.
>> + */
>> +#define DRIVER_NAME_LENGTH_MAX 35
> 
> Hi,
> 
> if paranoiac, the final \0 seems to be missing in the max length 
> computation, but see below.

Thanks CJ! Indeed, I have missed that.

> 
>> +
>>   int check_user_usb_string(const char *name,
>>           struct usb_gadget_strings *stringtab_dev)
>>   {
>> @@ -52,6 +63,9 @@ struct gadget_info {
>>       char qw_sign[OS_STRING_QW_SIGN_LEN];
>>       spinlock_t spinlock;
>>       bool unbind;
>> +
>> +    /* Make driver names unique */
>> +    int driver_id_number;
>>   };
>>   static inline struct gadget_info *to_gadget_info(struct config_item 
>> *item)
>> @@ -1582,6 +1596,8 @@ static struct config_group *gadgets_make(
>>           const char *name)
>>   {
>>       struct gadget_info *gi;
>> +    char *driver_name;
>> +    int ret;
>>       gi = kzalloc(sizeof(*gi), GFP_KERNEL);
>>       if (!gi)
>> @@ -1623,6 +1639,21 @@ static struct config_group *gadgets_make(
>>       gi->composite.gadget_driver = configfs_driver_template;
>> +    ret = ida_alloc(&driver_id_numbers, GFP_KERNEL);
>> +    if (ret < 0)
>> +        goto err;
>> +    gi->driver_id_number = ret;
>> +
>> +    driver_name = kmalloc(DRIVER_NAME_LENGTH_MAX, GFP_KERNEL);
>> +    if (!driver_name)
>> +        goto out_free_driver_id_number;
>> +
>> +    ret = scnprintf(driver_name, DRIVER_NAME_LENGTH_MAX,
>> +            "configfs-gadget.%d", gi->driver_id_number);
> 
> 
> using kasprintf() looks simpler here.
> No need to kmalloc()+scnprintf(), and no need for DRIVER_NAME_LENGTH_MAX.
> 
> Just my 2c,
> 
> CJ

Thanks CJ for the review!

I've made some changes as below (in gadgets_make() to remove unnecessary 
variables) and now trying to test it as much as possible. Will re-post 
it as v2 if looks good soon.

static inline struct gadget_info *to_gadget_info(struct config_item *item)
@@ -1623,13 +1629,25 @@ static struct config_group *gadgets_make(

      gi->composite.gadget_driver = configfs_driver_template;

+    gi->driver_id_number = ida_alloc(&driver_id_numbers, GFP_KERNEL);
+    if (gi->driver_id_number < 0)
+        goto err;
+
+    gi->composite.gadget_driver.driver.name =
+                          kasprintf(GFP_KERNEL, "configfs-gadget.%d",
+                                    gi->driver_id_number);
+    if (!gi->composite.gadget_driver.driver.name)
+        goto out_free_driver_id_number;
+
      gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
      gi->composite.name = gi->composite.gadget_driver.function;

      if (!gi->composite.gadget_driver.function)
-        goto err;
+        goto out_free_driver_id_number;

      return &gi->group;
+
+out_free_driver_id_number:
+    ida_free(&driver_id_numbers, gi->driver_id_number);
  err:
      kfree(gi);
      return ERR_PTR(-ENOMEM);


> 
>> +    if (ret < 0)
>> +        goto out_free_driver_name;
>> +
>> +    gi->composite.gadget_driver.driver.name = driver_name;
>>       gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>       gi->composite.name = gi->composite.gadget_driver.function;
>> @@ -1630,6 +1661,11 @@ static struct config_group *gadgets_make(
>>           goto err;
>>       return &gi->group;
>> +
>> +out_free_driver_name:
>> +    kfree(driver_name);
>> +out_free_driver_id_number:
>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>>   err:
>>       kfree(gi);
>>       return ERR_PTR(-ENOMEM);
>> @@ -1637,6 +1673,12 @@ static struct config_group *gadgets_make(
>>   static void gadgets_drop(struct config_group *group, struct 
>> config_item *item)
>>   {
>> +    struct gadget_info *gi = to_gadget_info(item);
>> +
>> +    mutex_lock(&gi->lock);
>> +    kfree(gi->composite.gadget_driver.driver.name);
>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>> +    mutex_unlock(&gi->lock);
>>       config_item_put(item);
>>   }
> 
