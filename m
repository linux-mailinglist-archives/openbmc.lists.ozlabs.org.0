Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78034653A07
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 01:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcrV22mCmz3bSp
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 11:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=UcLnD1kz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.132; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=UcLnD1kz;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2132.outbound.protection.outlook.com [40.107.243.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXmcQ2KZYz30RT
	for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 20:08:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2ojxbHrY81b0lEzk9tmDgSnT8Jvai2WHLOdZACRFOD3xT209q1X6tpn+8LWoWxsvBrUCrCaNftDDpInCio2tJPecg5kgTfDg/dHW5XDHtnKqzk5kpMW1E/uGaD1O03gDn1k/T6GedGI1GJaBJUZA1oiwcKeCYoxAUUojhc5JWQEJTYc7oyeDafZh69NzHAGc4tGGVxO7GoApKxUpLNsohBqOpYdNYL+xJm0FyTSgZthpeEMSCQVCt2+eDsYOmVj9zdjnZn+q2qFY23hL9v5HDNaMUjvHbkOpkw9OpSz1n3YBNylP4QmIaRTR9yP9Q8Tgp5ExzurdSyToN+Znh3pGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRjiZgUAmM5synlcEMzbQKl8s8tNZnj6B5uvlXA5koE=;
 b=AWJb43gbS92FSj2CSUj6Cdvp30RrH6jYsAtjPogg3CSnkeC6PkeY/bd5pX40tPlCs92gUHATYv3xqTFh636xGU2zccgmxkUPt6qZ1lAD7vpYFiuMjit/nAcUctBZN82TQMfX+l4npPnPzqpw9yj6jK6p/UnwcWateEEAzmIu9mssX2mtwKIMJ5W3WfKOQMpAgdTrXczgLPzYdaAVxAM3d952RhsuNpT1RX0qj9weL/2+pnPEAlNZXj1te6AYXMP+m+5z/AJmHAl9dD6wDX4O4d4RJ4P+oM1PivHaFzTIIHfjC3odoUD28hTqMiLcZbF+vBJ7JBZWy27WSn8UOJYXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRjiZgUAmM5synlcEMzbQKl8s8tNZnj6B5uvlXA5koE=;
 b=UcLnD1kzqqLXSVOoqVzOfy/BOBpvFpn5jGmbC63MEYWdA+axqRJb79SPIjDKdcHwMsK8DGdSSnOgizVOusqCZPuGwgh/ZiD60pbBx9QPFUXnnjy0Ra69KoqfUIZtUYEzFHyq6Rsv2jMLfZBYt79xcRVdhdSv0WNPob0eBkNiWB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 MN2PR01MB5375.prod.exchangelabs.com (2603:10b6:208:10f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11; Thu, 15 Dec 2022 09:08:16 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 09:08:16 +0000
Message-ID: <56581822-eb30-2e1b-169e-2bdee6f961f3@amperemail.onmicrosoft.com>
Date: Thu, 15 Dec 2022 16:08:06 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [EXT] Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
 <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
 <HE1PR0401MB23315376796AF65DEB8B636B88E09@HE1PR0401MB2331.eurprd04.prod.outlook.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <HE1PR0401MB23315376796AF65DEB8B636B88E09@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|MN2PR01MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ba0db1-acdd-4520-8a6b-08dade7be680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A+t9k7dR9Nm9nhPP/EBAg1AfgOCEBFgkx+/sB26ZoTLnlKFX0wHqGDEP1aUC9M+nu+M/S4LGrzvMmK+PKcQwzY3hv9jz6yW1ZimRPvMrqZStsvwKpdkzVr1TIftkkSlvCbpt44wbbpvTN9ZrVyx500dg+tXN1LI/Ha1PQdKiPPbT1Fa9W15uc1zdXNKRgmHQII/KxUAwV82Sdc0SrkOEe6KV2HxgsMqTFk4mgteNOkQ/DfCFQclayJB638VwVFZ9Vssa68W396b2cPLuYcqKlnTCqFZDqmSlnvf/XC1POn007uB2y+vsX+xp1Dd07rz3XkJ2dat3i8ZmX8WWyN3WhoqRC298/bSl/Xb3CPYjZPj7txV9rwY92p1kjmhGVFe6BhH6O3ofWrohDKhKNWH5oMpeKQouhr743iEpU4dA+MwWD2tNHzFzea5SPee6omH0+rFt0EbiaLQelIFiD2Z1q1798DfsNVA6VYMKJUKhyHmIdoE+IGTD8+5yAswdsAFl2JCZ1So1ObsJeDFTanKEHSyuxILvwNg0IR1qp5LkDwM+1cC8c/BIiQfK232af6GaMg4FItyIt2SW+U9BuoYRBvl3EZR61yKwPS7zawFRyBzyJ7imKQk/X6LvsQHzUWGl+47s5CSbWI5GBOVsKdFJ29l0HpdCJWmHb9cV5+PUNlIEzKrHoo9r3m2aKLcQWA70BdS8cS2dcGRWDSKrKkN1DQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(39850400004)(346002)(451199015)(66556008)(5660300002)(7416002)(83170400001)(8936002)(2906002)(8676002)(66476007)(4326008)(66946007)(41300700001)(83380400001)(31696002)(38100700002)(478600001)(6486002)(31686004)(186003)(53546011)(26005)(6512007)(6666004)(6506007)(66574015)(110136005)(316002)(42882007)(54906003)(2616005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c0VRSVNMdzhDRW9jSmwvTEdLa2Jmem9BNkJwR05VQzRPTFdWN0JudEZBWmFj?=
 =?utf-8?B?VWJyTEQ3WHF5RjZJQVBuci9GVlFnc1BDYnBLM3paclcrTzdhZUNheUdCREJm?=
 =?utf-8?B?RytnczVqMlprckp2R0t6Wm0wQmZkMU5rdDB4TldzYlNvVW9Ea0JBU2Q4YStM?=
 =?utf-8?B?TWNtYkFiN2J3YU1wSGZXMnpjSkhhRnlvczNTOStHWWNPQm5PWExKTHlDTE1F?=
 =?utf-8?B?VFZCQjVHRk9VdEFZbVc1d0JqaUlzd0NhaWtzOTBBRWVKVGJJUzhlbWprUlJB?=
 =?utf-8?B?L21IT3FPY3F1a2VEb2d0bzRWd0c4d1JSOEd3MUZwNVRibmZ3aW9jQmVGUkJs?=
 =?utf-8?B?S1dzMjRkeEUyRHBOMmFqYzlRMFlLbmxMUFlBTVkyNVg5T2NSdjExbDhtZ05E?=
 =?utf-8?B?WUMydUE5UXF2aWxyWGdKTENqd0RhWlJzZzJSZSthVi9mUTNySGFXRlN1OUpr?=
 =?utf-8?B?Wm5BMkx4Z2VxbVo5NDNWOHo0RGFoZmxuZCtZU3RwZ2M5ZzFjZFVMUmNWZUI1?=
 =?utf-8?B?UHZsSldRQ1pvNSsrZ2NUazJDMmdUT0cxOFBHUzRxb05NcUwyd2tqdXE2RVBn?=
 =?utf-8?B?a2VmREV2OWxlaTdtUkxlVlE4TjJZMkJtajNCRHZlam5tRDFOcElLQkw0N3dv?=
 =?utf-8?B?bm5vdXFVLzd5Vk9sZk05K203cjkrN05xaEo3UTVTZHE1YVZUT2kyK2o4SldE?=
 =?utf-8?B?U0QxOE9ybDNwb2lyQktrU2c5bFlrbk5nY3k3ZHFCUzdkSUNTN2JLZ1dHRU90?=
 =?utf-8?B?eWFDbmlkWE9kb1JKYmhCWWVJUzJqZ3JKN3FUK1pIc0RQdzZNQ2diOGZxVytJ?=
 =?utf-8?B?dzVFbHRzeDJYUkF1K29BQVJ0RnBVZU1mcWR3bTNnU3BZSzAvaWJxUGwrQ0Nj?=
 =?utf-8?B?ek83b2kwcUVJV2JzdDJIWkpFa1orNGU4Nk85a0d4T3N1UlJQd2hkUjVYM1k4?=
 =?utf-8?B?TnpDeDFuQmMvUEZzdDdQM3g5enpOeSs2aVA4R0FISEZLbnMwV3MyWXFMaEhN?=
 =?utf-8?B?VlN5OHdEVURCWEcrd3gvTS9GSXBHT2JObThRT0tYSURTb1poSUtnWmpkRFpm?=
 =?utf-8?B?NTYyUFB1MWZBelh4dlZXTWZSMXJMNHphNHdIWW9mcDhDNVdJSzRiRW5uYlZO?=
 =?utf-8?B?YUZpd2llQjFEL1dnUytic0RzV1dMbjFGVkllemlRa0wrRGlqZ1JOUFpOODVS?=
 =?utf-8?B?Q1A3dWZ4ckRlZnVpV3hmQXRLRmZQSUNLYW5LekhpZGgxenFjSnhicDVha0ND?=
 =?utf-8?B?YzEwV2xiWDhBN3cvWkRPazN0QXRpY2RDZzgyWk55bDZVYU1hdHlkUklxbVJZ?=
 =?utf-8?B?dno2WVd0dDRlNStNSHZ0YStuT3N2ZlR6NHVzby9QUDVSejZDQmdBY280aGhz?=
 =?utf-8?B?SjJ2MUJrNnhla3pFZUVKUytCNFlTUHRGbmh2cWJwazFIbG9sbzJlUDRzYTda?=
 =?utf-8?B?Z3BNUXUyVHRlQUtud3BEcnpyU2lNcWw5czR3R2hDaUxkUU81a09Bd1RyMERo?=
 =?utf-8?B?U3c3NUlLL1RSb214R0ovZ0NrdXlnamhjZ1BsUHRsUCtNaEhndEszb09kRFBJ?=
 =?utf-8?B?VkJaSUFGR21LTlg4WERBbk9zVkYzNU5SUUpSM2U1UXBvN3ZKVWhJdkV1V1pr?=
 =?utf-8?B?dG9WNnlFNHlBNWM3SkdGQmluZktaZ3hZUE5PUmY0cFlNVTZ0MFJHSjU0RnFK?=
 =?utf-8?B?VjZFeGl0L21HeWo4UWpXTEFuOEM2WkxvalJmVnFncTdQNkw4YXF0WU94bjVu?=
 =?utf-8?B?WkVBOHNtaDR0VEUyYVJydUk2Sm1ONnEvVjBpUWNOTG5ldjlTZ2RoMzV0NnUx?=
 =?utf-8?B?VlRlR21FSW9wbFdtdkRiRXUrbGh0K28yTjR1Zkc3QmhiRTcrcVp5ZlVEaVNj?=
 =?utf-8?B?MlQrZk5rNFpINmp5OGtjMWpTUUpINERvVFhpRGZrZHV0R3BMV0EzeWozS1NB?=
 =?utf-8?B?b1ZWTXlyUmNyY0pFQkUrakorcFluSFcwcCtheXlveUdNRko3aDFuRUEwVHpV?=
 =?utf-8?B?U3JhZ2wxUVlXeTVNcVRtZ1V1OHNUNThXbDhHVGFVL0NqampzY1hYWjdDREti?=
 =?utf-8?B?MDEweklUeGFWZHFiNXBWZm0vNmdhcnZuQUJqQis3R1NWY3p4bEsyR0NGVFhs?=
 =?utf-8?B?dWwvS0VWSmVDTVdYUmFRR0hYeVlTdkRSRlFQbERIeGFoY3dWeGZKRWsxN2Zj?=
 =?utf-8?Q?o4F+D92bZ/ji5rSsCIksemQ=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ba0db1-acdd-4520-8a6b-08dade7be680
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 09:08:15.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryVpt9roDez3g9hqFEnjy6aweXXZWpiVPEK3FAw+vstu1aTovccMnGo3HY/faI4BUV7R1eBUvqQl3gzFX8SU8LluNi+LmrQpxpiJhHRWmWDbvv/RPCYuOUUyS6bZepVD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5375
X-Mailman-Approved-At: Thu, 22 Dec 2022 11:16:45 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 14/12/2022 11:20, Frank Li wrote:
>>
>> Caution: EXT Email
>>
>> On 13/12/2022 14:22, Christophe JAILLET wrote:
>>> Le 13/12/2022 à 05:12, Chanh Nguyen a écrit :
>>>> It is unable to use configfs to attach more than one gadget. When
>>>> attaching the second gadget, it always fails and the kernel message
>>>> prints out:
>>>>
>>>> Error: Driver 'configfs-gadget' is already registered, aborting...
>>>> UDC core: g1: driver registration failed: -16
>>>>
>>>> This commit fixes the problem by a ".N" suffix added to each
>>>> configfs_gadget's driver name (where N is a unique ID number),
>>>> thus making the names distinct.
>>>>
>>>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>>>> Signed-off-by: Chanh Nguyen
>>>> <chanh-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org>
>>>> ---
>>>>    drivers/usb/gadget/configfs.c | 42
>> +++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/configfs.c
>>>> b/drivers/usb/gadget/configfs.c
>>>> index 96121d1c8df4..d8c5156ad777 100644
>>>> --- a/drivers/usb/gadget/configfs.c
>>>> +++ b/drivers/usb/gadget/configfs.c
>>>> @@ -3,6 +3,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/device.h>
>>>> +#include <linux/idr.h>
>>>>    #include <linux/kstrtox.h>
>>>>    #include <linux/nls.h>
>>>>    #include <linux/usb/composite.h>
>>>> @@ -11,6 +12,16 @@
>>>>    #include "u_f.h"
>>>>    #include "u_os_desc.h"
>>>> +static DEFINE_IDA(driver_id_numbers);
>>>> +
>>>> +/*
>>>> + * Driver name has the form of "configfs-gadget.%d", where %d
>>>> + * is id allocated by ida_alloc(). The max value returns by
>>>> + * ida_alloc() is INT_MAX, in 64-bit system, it is about nine
>>>> + * quintillion: 19 digits in decimal. Set the max length to 35.
>>>> + */
>>>> +#define DRIVER_NAME_LENGTH_MAX 35
>>>
>>> Hi,
>>>
>>> if paranoiac, the final \0 seems to be missing in the max length
>>> computation, but see below.
>>
>> Thanks CJ! Indeed, I have missed that.
>>
>>>
>>>> +
>>>>    int check_user_usb_string(const char *name,
>>>>            struct usb_gadget_strings *stringtab_dev)
>>>>    {
>>>> @@ -52,6 +63,9 @@ struct gadget_info {
>>>>        char qw_sign[OS_STRING_QW_SIGN_LEN];
>>>>        spinlock_t spinlock;
>>>>        bool unbind;
>>>> +
>>>> +    /* Make driver names unique */
>>>> +    int driver_id_number;
>>>>    };
>>>>    static inline struct gadget_info *to_gadget_info(struct config_item
>>>> *item)
>>>> @@ -1582,6 +1596,8 @@ static struct config_group *gadgets_make(
>>>>            const char *name)
>>>>    {
>>>>        struct gadget_info *gi;
>>>> +    char *driver_name;
>>>> +    int ret;
>>>>        gi = kzalloc(sizeof(*gi), GFP_KERNEL);
>>>>        if (!gi)
>>>> @@ -1623,6 +1639,21 @@ static struct config_group *gadgets_make(
>>>>        gi->composite.gadget_driver = configfs_driver_template;
>>>> +    ret = ida_alloc(&driver_id_numbers, GFP_KERNEL);
>>>> +    if (ret < 0)
>>>> +        goto err;
>>>> +    gi->driver_id_number = ret;
>>>> +
>>>> +    driver_name = kmalloc(DRIVER_NAME_LENGTH_MAX, GFP_KERNEL);
>>>> +    if (!driver_name)
>>>> +        goto out_free_driver_id_number;
>>>> +
>>>> +    ret = scnprintf(driver_name, DRIVER_NAME_LENGTH_MAX,
>>>> +            "configfs-gadget.%d", gi->driver_id_number);
>>>
>>>
>>> using kasprintf() looks simpler here.
>>> No need to kmalloc()+scnprintf(), and no need for
>> DRIVER_NAME_LENGTH_MAX.
>>>
>>> Just my 2c,
>>>
>>> CJ
>>
>> Thanks CJ for the review!
>>
>> I've made some changes as below (in gadgets_make() to remove
>> unnecessary
>> variables) and now trying to test it as much as possible. Will re-post
>> it as v2 if looks good soon.
>>
>> static inline struct gadget_info *to_gadget_info(struct config_item *item)
>> @@ -1623,13 +1629,25 @@ static struct config_group *gadgets_make(
>>
>>        gi->composite.gadget_driver = configfs_driver_template;
>>
>> +    gi->driver_id_number = ida_alloc(&driver_id_numbers, GFP_KERNEL);
>> +    if (gi->driver_id_number < 0)
>> +        goto err;
>> +
>> +    gi->composite.gadget_driver.driver.name =
>> +                          kasprintf(GFP_KERNEL, "configfs-gadget.%d",
>> +                                    gi->driver_id_number);
>> +    if (!gi->composite.gadget_driver.driver.name)
>> +        goto out_free_driver_id_number;
>> +
>>        gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>        gi->composite.name = gi->composite.gadget_driver.function;
>>
>>        if (!gi->composite.gadget_driver.function)
>> -        goto err;
>> +        goto out_free_driver_id_number;
>>
>>        return &gi->group;
>> +
>> +out_free_driver_id_number:
>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>>    err:
>>        kfree(gi);
>>        return ERR_PTR(-ENOMEM);
>>
>>
>>>
>>>> +    if (ret < 0)
>>>> +        goto out_free_driver_name;
>>>> +
>>>> +    gi->composite.gadget_driver.driver.name = driver_name;
>>>>        gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>>>        gi->composite.name = gi->composite.gadget_driver.function;
>>>> @@ -1630,6 +1661,11 @@ static struct config_group *gadgets_make(
>>>>            goto err;
>>>>        return &gi->group;
>>>> +
>>>> +out_free_driver_name:
>>>> +    kfree(driver_name);
>>>> +out_free_driver_id_number:
>>>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>>>>    err:
>>>>        kfree(gi);
>>>>        return ERR_PTR(-ENOMEM);
>>>> @@ -1637,6 +1673,12 @@ static struct config_group *gadgets_make(
>>>>    static void gadgets_drop(struct config_group *group, struct
>>>> config_item *item)
>>>>    {
>>>> +    struct gadget_info *gi = to_gadget_info(item);
>>>> +
>>>> +    mutex_lock(&gi->lock);
>>>> +    kfree(gi->composite.gadget_driver.driver.name);
>>>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>>>> +    mutex_unlock(&gi->lock);
> 
> Move all free into gadget_info_attr_release(), just before kfree(gi)
> Driver.name and gi create at the same place,
> Free should be the same place also.
> 

Thanks a lot for the quick review comment.

As per my observation through the test, on the first mount, the 
virtual-media the gadgets_make() is called, then later, when unmount, 
the gadgets_drop() is called and followed by gadget_info_attr_release().

The gadget_info_attr_release() is registered as .release() of 
gadget_root_type for the gi->group via the call 
"config_group_init_type_name(&gi->group, name, &gadget_root_type);"

In general, the .release() will be called only for the group. There is 
nothing to guarantee that the group will always be registered, ie: 
incase without the call to "config_group_init_type_name(&gi->group, 
name, &gadget_root_type);"

In this patch, what is added is an ida number to be used to make up the 
composite driver name. This is done in gadgets_make() so we'd like to 
add the cleanup code to gadgets_drop() as they are registered together 
in the same place and would be a little easier to read than adding them 
to _release() as the code below:

     static struct configfs_group_operations gadgets_ops = {
         .make_group = &gadgets_make,
         .drop_item = &gadgets_drop,
     };

Anyway, we still doubt that there might be something that we have missed 
so please let me know the reason why putting cleanup codes to _release() 
would be a better solution.

Thank you and best regards,
- Chanh

> 
>>>>        config_item_put(item);
>>>>    }
>>>
