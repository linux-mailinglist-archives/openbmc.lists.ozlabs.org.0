Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E36653A0D
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 01:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcrX91vXxz3bdS
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 11:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=LKc4PwUP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.133; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=LKc4PwUP;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2133.outbound.protection.outlook.com [40.107.244.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbFrt1yqJz2yNX
	for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 21:13:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYKSeC3Ut0RWfNwbYGN79BEzBrVxIip22gIVXt5XsB4NvEAE4XNlFa86hmvcf9eWtC6NdfYjhin6VrWNZrUo4YseiCD4DZbFUGsdPDijni6j7a5GZCjnUrEWem8rmSfQVTw1aBdgogkj5FBtRL9s1Op2sm05hPgTuFwxImqK+n/+l4DoTGJDqoh2HlLUmmVNeVwXJyX45kKSuEjP0MdcXb9EO7yyNbmFKm0/2tkdsJDCB4UHmv8fi2XEIH+oVHrXsH+voUkai+7NngGq9majdVe6b6KgMqkJar/T79odncR9oPcmuKpf1B8gx8Ugx9aRq4Bun2YD1ChPQjmySb8xfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnFPScr185DF/VI3aXJvi8f/CFPKiAqYj5nh6ml3KVs=;
 b=STgqMb/mInWVqxpqllI4gaHlPnaWXtBrL/fG+xSBMWzmyQb6217gOWj+zY3/P9tFc4SImcMTIpWwJ1dKz0sDh8SDvpbCfTTJziN3l3KGjqC98KH6pSmWkBMW6nOjPW8CF7Kl+DfFqI8EFr4VuA0IjIHEesjjrLLvMPdp6epBCJLIFvMMRED25E7VICMsg8EeeFQfzbqtxTRS6vcB/eFzwvFd7xAC8cA0nn5TInnIfqa519FhfITXF+V6K/k3tmF4yjOvPTO6oJ/z17mIVqLudFarV+LL+na8+HdaT0g5t1yLA4PhvifkIsR/JQgASkedKbrBzQ/A/Z3autGBOlOk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnFPScr185DF/VI3aXJvi8f/CFPKiAqYj5nh6ml3KVs=;
 b=LKc4PwUPjBnzVHguXDEks03pUiUWqEIpc78HjByxKHy9sli8FfsatjX3Sq6Eqj2bh6XSNAf0DAg5a6lukIyRdq99ZmltCsV44LBfMMup9N1ZH1LehMsZQBhNHoiLcm6XCfjdL/N/k7xSeDY2BmWh/v0O4l/4bne287ssU2yFetg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 BL0PR01MB4611.prod.exchangelabs.com (2603:10b6:208:75::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12; Mon, 19 Dec 2022 10:12:40 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 10:12:40 +0000
Message-ID: <6fe62fbc-c666-8163-5cd2-6bac5447546f@amperemail.onmicrosoft.com>
Date: Mon, 19 Dec 2022 17:12:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
 <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
 <Y5nqtYa9yC8YY839@rowland.harvard.edu>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <Y5nqtYa9yC8YY839@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|BL0PR01MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: f62dfa12-d0ae-42e4-45ca-08dae1a98f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3RM01Tcgb7Yk1pxCbVPvDH3d6h3V5eLnvetM4QGovd7H988sRwgCr0I2j6Uta2GETZyBtQMaFJWerhjpo/pLKITmxK1/I/rqQNGQRH738ilhzU96UCjgK2I/+qFCYBppVNyYkRCDB7j0rsf7ppFEcdjJfsD2ONgDk02IaWxWNeRh1dGJCc/8AHhUQrnj3Uwy2CJAauFIrOxnR7cUyjSie9/uyBiAAldaIcr/xRF+vOInAfD9HxtPVqzMeqsJT3c0inku1DoZQsaewLlg61cPjYwimDmKYa5Jf85aLzNovWzEC2qi9mejB097xVfusMeXqTPjvPz/6JnsR/lwgkhg0U8JUy/AE/L4seShciuYuu6eaawNDasG8DcLNsn7Cqj3rhzrvR1KXiVWN1Nfhhgx6HxmAA6Gn0Ac46roCYQKM31IBe2MdlSyq7ZtMU6xvDbkt8XVQ/10OlsPJOdh6kEaBGo2npbGdZuPjUdrzJ1TS822slKsHbsqZ1Fu4BPWhyK8mkhlDjyCEjDHOlbMaySle8Hs0FZa00OKSbMO7Yx/lazKfCSpbPfwYB2mHs2wYoSiQWS632WmohTf61cOfIys21Y/O7tDWKhqNaKABiT72RYDKWAtmKJmzwaPMIeWxHatvQSYpRMpfZGBlLYjB7zyazNVZKsnN6aBF6/sgkHd1fRb1xWXyiFQj8YCFj6Az8Z4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39840400004)(366004)(136003)(396003)(346002)(451199015)(6486002)(6666004)(478600001)(6512007)(53546011)(26005)(6506007)(186003)(2616005)(54906003)(5660300002)(8936002)(7416002)(83380400001)(42882007)(6916009)(316002)(31686004)(38100700002)(2906002)(41300700001)(31696002)(83170400001)(8676002)(66556008)(66476007)(66946007)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SmVOYWxWRDN0c1N4MVNXb20wc2ZTeXJMSEVmSDdqUUx2OHp2R3plZXM1MVRP?=
 =?utf-8?B?MStJM0Z0MXFrZGp3RWswYmhNVU92ckNXbDBGc1lVd1ZhNnVqNzBzcDFTSnVl?=
 =?utf-8?B?NUZ2ei9ESVVLT0FaZkE0Si85ZzdqSFYzNjc4b2JDbTdqVWRrU2JJeDY5bXdL?=
 =?utf-8?B?Yk01SXpzakFKczIyYm1uZUVoMVY4dXhmVGFRN1ljUWtyK0htMjhBNFZPcWJa?=
 =?utf-8?B?MWhpOEJGTnhsS29CUXgxMnNQcGZRdHo4cGlVQWtFcTFFZllOdlZ2NDhjNHdN?=
 =?utf-8?B?cHpIQXdUbjcrYnZtdVJoRFdDY1Z1NFdCdnMxWGFzRTJrMTMzRU00bFZzRUZs?=
 =?utf-8?B?bU9GbmIrYTlvTG1vV2dQWFlWdlJNaUlKUGpRRkxqVW9jOEpwVjJqc3hxQ3BP?=
 =?utf-8?B?RGZNRjljUmpVdU1Cems1VkJUeVdIRTRYZ0o4MFM1RG1yQWxaSTdmRThUMzlC?=
 =?utf-8?B?TUdqRUJINWtSS2d2MkwyQ1M0SklrR3cvdWI1QzljNHNCQUI5OExPU0lHRUor?=
 =?utf-8?B?UzdKbHZsTnpIb0tHVE5mU09xSEJrelNHR1pPc0NOS1UwZUdQQkE3R0pwWitG?=
 =?utf-8?B?NFZ4aUhUNXRlcTdvTFBMaW1POE0xalJoTGg1QUZlMHNkVG5tWVBnRW1yM0xQ?=
 =?utf-8?B?QVVUb2RSdVpMYnJ5WXMyMFlFb0JwYU5neEdGOEoxVHQwSkw3VjdaN2prUk53?=
 =?utf-8?B?Wm84bStWblRvKzYyRlN2QjE2aWtMTkUvVW5hUDV0eDJtZjJRUWRodytTR3VZ?=
 =?utf-8?B?MTFNTmVGS1Y0Z2kzZnVyWGM3YTVUc3VzTWNLc054VWJhYzlxZEdVcDlraWFF?=
 =?utf-8?B?OE5ENE10WTFkTjJPM21YK2Q0eG1TTzJiNm8relhaQ1FNMVdobEJGS3JjUGdq?=
 =?utf-8?B?ZjY1TW5WR1czQlUrUmtrbkRCY1pGczdZVjNxS0lKcTRNTVljM0l1N1dzMnRQ?=
 =?utf-8?B?MVZWanJRZVhxZkkxYXNCQ2V0MnAzQmN3VXRHQ0dUVE5KV1lwYjJWNzNhQ3dN?=
 =?utf-8?B?NkJCMk83TkRTaktzUzhDbUJLWExxVVpYWWVtZ2tKbHJUdC93OVJ2QlVQWG1C?=
 =?utf-8?B?bFNseTlUNnJmangxT3BJWXh2cVlMNytHYlhhUjhyWlVFYmt2bkpuMC9zNS9s?=
 =?utf-8?B?VkVQYW1qbERZTm9lUXRvY0RkTHFxeFBXaExsT2Y5MmlSVXd6NW84Q2hmSUVn?=
 =?utf-8?B?d3JiZ3RKN3JXdVNvRjNvRENiYld6b2FSZFVrYlp2VlhRTUlhL3dKazFEc2FR?=
 =?utf-8?B?b1pnQ3ZVeUdoZmJEM2Yydml6U0VIaFJMeFQxOC9qeVBLd0tuYmh4b0h6QnBn?=
 =?utf-8?B?VU9kK2tySXd5UTZ0MExNeEJXK2FKa0Zia3RjZTM5cTNVRnhFVzdPeUJFYjc5?=
 =?utf-8?B?U2JLM25HRjgxWCs2WTJ6TWxESHBCSFhPUEtOZmc4bHV0cEs3YkVqT2VTL3dl?=
 =?utf-8?B?MWsrTlhPYkl6YmxsQTVheE1ReUJJK3F4WFBSNzE2V2RmRjBSMUVGZDRzL3lZ?=
 =?utf-8?B?bDdNSzJoNzhpcDhZY2xpWHpyRG1mREc2YndBaDRYcE9xdnBZUTZPOEJQanBK?=
 =?utf-8?B?UEZTcTJhT1lYZW1VaXVWRWtCVjBHcERZaXJuVy9VbmxqOUxnNmVrckZTSlF1?=
 =?utf-8?B?M2VUbzQrRkJxd09OZTF4YlpRVHN4RkF2YUJsbzEwT2gyU2NKZHVybnpkNUFU?=
 =?utf-8?B?VCtWM20vVEI4ODczOFhDeDRHZlZCdjd6aEt0ZnBNd3UwMmg1bzRreWNqUVJX?=
 =?utf-8?B?WjVBRmlDSXUvcDE2cUVYaUxsRXU3bUo1QkI5WTA1YkhCclZZbEl1b0wvZWNL?=
 =?utf-8?B?YnphZjlJOHRncDdBdGhIMGlwVXo0SUVUUExoYzVpNTRESWZQNVFzRlZreFVB?=
 =?utf-8?B?QTZ6MTErVkpLNzNoMDNDTU9BWUlWa05sUmVWTG9OUkFUWHRrODgxSXJBK2NG?=
 =?utf-8?B?YnhaMHVyOG1NdWhZRkVHNWpFZitLYXZuZ09kaERBK0J1dmk0TjFnQmlsb0xn?=
 =?utf-8?B?d1FhN2s5QXlJeUVsY3l3dCtGTkgvRW81cG01SDAwYy91QlVxZ0hSR2RINm56?=
 =?utf-8?B?TnhyUXNIMWVkbUhzYjUxN2tMc3Y5ZmdZSUVDQWJLOHlIRUxuVzU5bVdydElr?=
 =?utf-8?B?V0xWUEt3My81VUgxL0Rqa3AxR0JBM25nT2NpbDlsNnplajc4VmVQRHNFY0c2?=
 =?utf-8?Q?l/FQ0UCECaLAAC0aO1wfHMA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62dfa12-d0ae-42e4-45ca-08dae1a98f44
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:12:40.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bb1gL11sLpBqjzx8HPdWCPEXCbrXE04pHBmuZo8w+sA75/aZlFgjMBaHx0Ul5lGkjueFZFIOXzvJFQNEk9lhc7vF39uNZ29/+56O4lFNoPwjki1kB/Kbfwy2kR5XAm11
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4611
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 14/12/2022 22:24, Alan Stern wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
> 
> 
> On Wed, Dec 14, 2022 at 11:15:48AM +0700, Chanh Nguyen wrote:
> 
>> Thanks CJ for the review!
>>
>> I've made some changes as below (in gadgets_make() to remove unnecessary
>> variables) and now trying to test it as much as possible. Will re-post it as
>> v2 if looks good soon.
>>
>> static inline struct gadget_info *to_gadget_info(struct config_item *item)
>> @@ -1623,13 +1629,25 @@ static struct config_group *gadgets_make(
>>
>>       gi->composite.gadget_driver = configfs_driver_template;
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
>>       gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>       gi->composite.name = gi->composite.gadget_driver.function;
>>
>>       if (!gi->composite.gadget_driver.function)
>> -        goto err;
>> +        goto out_free_driver_id_number;
> 
> This should goto out_free_driver_name.
> 

Thanks Alan! I'll update that.

> 
>>
>>       return &gi->group;
>> +
>> +out_free_driver_id_number:
>> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>>   err:
>>       kfree(gi);
>>       return ERR_PTR(-ENOMEM);
