Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407E66D5F4
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 07:12:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwz8J6JMSz3c79
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 17:12:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=J0HDsC4A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.104; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=J0HDsC4A;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2104.outbound.protection.outlook.com [40.107.243.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsygk1rTmz3bNn
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 19:41:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XshzedgmCm9sBv5kXALEBf3jXyaowmL0Sq4NLHWwp53BB2RSFnta6OSqv/KfMOjAlyoV1Q9EPyZrOS0WJxBWHOjqzoNyeR+w/88YyW9/Y/4rupwBXoSrFUOMGlb1WOmX+kOoUaxfU/3BLbe7MjNJKDg/M/35nvLA0niXYehUJ4dYQizfv9Z95ynFipEQuIQdMIqj+rb48w4m9lcN3TnO7D+nzwfje/dVznqVn3MqHEG8r1nRoVlBUtc7btAE2p0DAozJnygBPzTsOuJOI3KWcwZKHf8bx6LvEEdhoH8qYHjTlT0hUI8AGs7CXoqeOZHlfVRrhhlHYkqx9tnPy3BF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+zBNO7kPEwVHaJHp+fg9i6llv2Rm7l0ADB/9bROYFM=;
 b=h7il/XDhTQZw3RHeWK/8i46nU0LgLbFXor5eEOfs5o6kP74T3n4op6y9PboAdaZJV8XcC8F0a0DXI51Spf50pz6y7XAsMxyn7Qz+/mlkNlzshTb9+XJc0GsT7FydG3ibKq6Jxgno1EnyXj4huqLe6o/9MTp+bpLqDQcrYmangmuWGaVxdoDngDLka/aEPmekZTihZzg3GmGn5k9CBtuxOAD/+AagMwJRoBxTytTNEJdEoD2e7jRKWuwPtM+lI2VlcokED+YbwoFa96+SNT4IASBjq/vTSbT+/8XPH1CokJifpS9OqzkxZCy12MrW2wgcSOdGCjVY4SBXpuu9dFnXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+zBNO7kPEwVHaJHp+fg9i6llv2Rm7l0ADB/9bROYFM=;
 b=J0HDsC4Ae83VZ6UZrHS+O3PUdI9OvNkFa94TeWlYZLa34Ydug6lW7/ZhnfwfJc4da6QHxoTvSkgPmAGnI3sWJ8vJr7fADCYhCv0A9/VsKZ1yr1Wq3IsJcUgLpWniNjirh6UyFpaEP/Mj+7vFoKwezPG++f0YeMkEK3Xjtq+QOkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 DM6PR01MB4460.prod.exchangelabs.com (2603:10b6:5:7a::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Thu, 12 Jan 2023 08:40:47 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 08:40:46 +0000
Message-ID: <db4c34ab-fc52-f078-a87b-aa5037255e6e@amperemail.onmicrosoft.com>
Date: Thu, 12 Jan 2023 15:40:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20230111065105.29205-1-chanh@os.amperecomputing.com>
 <Y7+2ICAKlghDAem2@kuha.fi.intel.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <Y7+2ICAKlghDAem2@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31)
 To SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|DM6PR01MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: f17bc304-efbb-4862-0ce0-08daf478b31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IXEjoJtPEue4USKR0YdjeLCP80Nu9uDpkjYhphciauY2wA2FQwg0A63wL6hBSFWZ7Bcp1qN7KmA/sB1zxByS/sBbNwBs8aqytBwHU4ajBlUOZNNjTQsWtPHuHvcV6Sl9QE8cdrilWj7wb8jPY+N5ni1USKLi14j5bxFQ7Uw6DzdJawK1tNRl9OJ1e+dNpDV8g3zAZHq/v9xSM9UUX6Ct6ns/HwDq4SXPj/rnfxtA65OeQzxot7Lqih5fVvtPW2ku/wJoo1mZxVgAfgARC5h1OlV5TPDYgFnUlsyLzrNZ9rihwUHO/WjKHEqJl65Bxcuqx4lZViPIBZ1du0DNjd0FVHw+cmDhWyKsIUH4AV1vTYUoBmpQ57sdpEo4DglvNmu+P934JzAWIDvYSrctyfOGQYcOBDfALv4+Qr7QKVMbeTk8P9l/zrX1gWkf5KwrNa/2dUr1UpK/T0KulRFhNnR4/IFL2ic3NTc7XbWbPAlfLviUkHwsLOO3fpEWh2YwnkRUFPbF7qFvuiMhnEAzp4KQDRGw7HPy0SflTXg5KiE/pFihwAIlhFV8ipVhUhLC8uVa3J4q/5ljR9IZfMC9Za9u4t3rHmo5Co5E8BKZIYN67q+t9GzHQpCfb34eWUfvjt0b44tkXoPNsP+ZifjoGwAv2P0nu7Wfanae8lVRKHJi2QgODQmiY6EHuvdQElmM7Bm3DU4Hx2822+BtulmJnSxZgQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(366004)(136003)(376002)(451199015)(83170400001)(38100700002)(478600001)(31696002)(6486002)(186003)(26005)(6666004)(107886003)(53546011)(6506007)(6512007)(41300700001)(42882007)(66556008)(5660300002)(7416002)(66946007)(66476007)(8676002)(8936002)(54906003)(83380400001)(110136005)(2616005)(316002)(4326008)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TDBmMHVuYWtlZTZqU1k5dngzbWRNdm90R0NjMElsbytUbU1oWkhhTzRNYnNZ?=
 =?utf-8?B?TENJd0pkYUo1enkxNHplQWRPZ2N2WVFyVmNhV0RKV2VJRFdOamgxdGNKWWln?=
 =?utf-8?B?V0VIaXNnczRsOHV2UTdpaC80eEpKTVlha0FTYVVuUXFFeE9HTGpqWTZYcjVh?=
 =?utf-8?B?bG5XdTdOQkpHYlhZeHNSNmI3K2NKNlpWK0NxUXhyMU5mc0xiUXA2NCtkSEk3?=
 =?utf-8?B?dUE2RW9PL25MSXBobWhOVFgycVNPQ0cydDVTSVJuNTNubkJpRXpIb3M4ejYz?=
 =?utf-8?B?R1YvSFdXVUxmU0lDMEF1L21OODNSVHlocVJHWkdCUHA5UnVEcDhvc3JtVU04?=
 =?utf-8?B?TncrdzBSSVJQeXoyS294em1kdFEyRExhbVQ5N3pkOGdxNW5RWGt6NU1oV2VB?=
 =?utf-8?B?aVk5dVMwRDREVkpYWEpKeUhRMGZqN0xHdTlhbk5DYzZBUGt2OVJQcm11RkYy?=
 =?utf-8?B?ZC9GQ0MxbTE3V3VaYVM2Sy9lWXpZVndHMkJPbUtRd0pSSkFJZ1NaVXBjYmti?=
 =?utf-8?B?SnRrU3haN3Voa2NrNm1BZVpTSW94dlB4RjNuZ3VvTmNKbGtaekdkVWZtaHRJ?=
 =?utf-8?B?dEJETnN0Uis4dXJOOU9PVDVKaXNiTEtzUmNqVEl5TFFUbXV2Y0QwUmRuUmZu?=
 =?utf-8?B?MU52VDE2R2t3QnV3bmR2eGUwS1BVVi9aei9Ma1cyd2RsNjNxcFNGMGwwRElI?=
 =?utf-8?B?QlFiZEQ5aU0vM0F4Tm1NZTgvb2RPWEFDTG9GTS8zdDJaVGE5ME83cHZrdW9M?=
 =?utf-8?B?QjhxZUQ1Tm9NZk5WZlUxZG85MGYvY1ZCNEpuT0k3UDZqRHEzRkUvU1V5d0k1?=
 =?utf-8?B?dzRYbnN1d01pcWxSb1JBdnlGK3kyRnBNMTVPekY2TkFSamI5dnFuR3J1dzVC?=
 =?utf-8?B?aGwrQkJibDJoWFhybHJyVitMT2NudzJuSVR6czRaaVAyUS96Vmc3MFduRFBq?=
 =?utf-8?B?eDNKYXNhOGlTWGtGbzNvZnhFREp4bGpKM1N5bVd5czg2ZFZzQjhUSGxpS2xM?=
 =?utf-8?B?WkRqU01RbFpZckpnQnFkMDduUU9LZVc5RnI0SnVZSm9iTWVVU0JyTkpoOTJ1?=
 =?utf-8?B?K2lOak5TeXhPQ1dISnRCU0ViYXpPc1NOWVJNV1oyeWhZL0szcC8rSVZIUnhy?=
 =?utf-8?B?RmtzaGpkQnVtRHZLV3p6RWczNFU4N0JseSsvQnZBRWxsSFVhbEthZ01uSUdE?=
 =?utf-8?B?R2FOZW5HZTdSK1ZkVlBDUkpvejliaTRZRmtzQU5BR09zalV3aENDZXVKQm9o?=
 =?utf-8?B?UE1PemdKTStRQ2tSa1RkVjMxWHArUFN6YlhOZDNlN1BkNXQweTRxYmVqdGNa?=
 =?utf-8?B?YVMvVUg4dzZQbUVaVXNSSStDWldud2FTOVZJaW9oU0E3Y2wva05MeDhBMmor?=
 =?utf-8?B?RFN0ZDk0c0xGcUNZaHhQbG1pU3prTmFhbW5QUEJKRW8vd0ZSc00yZGpaWFVQ?=
 =?utf-8?B?UXJGTWYvUjFKblpxSVIxOFBhakpXWFZkMWJsWTRMYzNWeTB6SmU1ZG53NERj?=
 =?utf-8?B?R25nMHZXVS9ucFkrK0wwVXA4Z053dUNTOERmYS95SVRiRjZCSmJUazVRUGp0?=
 =?utf-8?B?aVNuTDlkMWRKMDFRYVYydFIyMW81bzdDNGdZTlBVajB0dFlrK1p4ZXNrSWN0?=
 =?utf-8?B?ZlJYSXJhY1BWMlFXUXhDd0VhdlNpL2NiSmtiM2Z1NXpLQ09OZEVwd3lnWWRa?=
 =?utf-8?B?OTc2QWJDLy9qdVZ0eHdQZnh4TmRndjFjeERyWnZYZFZNZ3ZPVFJ2a05zR004?=
 =?utf-8?B?Z1dlZzlqUWxSWWVIOGhPb1A4eU1KSmhuVkJkbWZ2U0o2b0VOQjVVVzhhMWJN?=
 =?utf-8?B?WUFTR0ZOZUsyd3hZNy9FT242ZDVnOEs2K0l3WURSYUoycWFpOElBN1BVY1N1?=
 =?utf-8?B?TjJVY3ZQczh3WS9iMDdmVVRGYkVPenZGcGFYR2pBSGxwZTlLaGpqOXl3T09a?=
 =?utf-8?B?dUp6dGFPalp3WDFGbUNhd3hpcHZ1ckN3dWY2R3BVYktkUVRnYjRCc2t1eTBa?=
 =?utf-8?B?R3pwK3A2azdsamRDNng1UTF4U3huaUZUMzNXRnpXRC9XVE43NzR4QVA3NUsw?=
 =?utf-8?B?YmRBeXN3a3RwWWxmVktZQkg3eWFuSUZSL1ZOSGdEcmhETC9NSTc0cUFLOS9T?=
 =?utf-8?B?bkoxNjF4bGhnYkE3TE1VUWFiNFB1dTNPbktTbDJKODdpUmlzWDVDRzM4dVNl?=
 =?utf-8?Q?VbDKcMdfgnwgLqEUkBab3xg=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17bc304-efbb-4862-0ce0-08daf478b31e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:40:46.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI1Q20+C2l8clZNyQqF6rVAcOYpTZQ7xmg+RERkRD8yDSTNA1MqEyFIGE0iGqtpfkK8yGSFKCxJttyWWsQ+emf1yqqomH05pkQaocEhYaRZpzrZ97pEtyQSY5kdM5AEa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4460
X-Mailman-Approved-At: Tue, 17 Jan 2023 17:08:32 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org, Frank Li <frank.li@nxp.com>, linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakob Koschel <jakobkoschel@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 12/01/2023 14:26, Heikki Krogerus wrote:
> On Wed, Jan 11, 2023 at 01:51:05PM +0700, Chanh Nguyen wrote:
>> It is unable to use configfs to attach more than one gadget. When
>> attaching the second gadget, it always fails and the kernel message
>> prints out:
>>
>> Error: Driver 'configfs-gadget' is already registered, aborting...
>> UDC core: g1: driver registration failed: -16
>>
>> This commit fixes the problem by using the gadget name as a suffix
>> to each configfs_gadget's driver name, thus making the names
>> distinct.
>>
>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> 
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks!
> 

Thanks Heikki!

>> ---
>> Changes in v3:
>>    - Use the gadget name as a unique suffix instead     [Andrzej]
>>    - Remove the driver.name allocation by template        [Chanh]
>>    - Update commit message                                [Chanh]
>>
>> Changes in v2:
>>    - Replace scnprintf() by kasprintf() to simplify the code [CJ]
>>    - Move the clean up code from gadgets_drop() to
>>      gadget_info_attr_release()                        [Frank Li]
>>    - Correct the resource free up in gadges_make()   [Alan Stern]
>>    - Remove the unnecessary variable in gadgets_make()    [Chanh]
>>    - Fixes minor grammar issue in commit message          [Chanh]
>> ---
>>   drivers/usb/gadget/configfs.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>> index 96121d1c8df4..0853536cbf2e 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct config_item *item)
>>   	WARN_ON(!list_empty(&gi->string_list));
>>   	WARN_ON(!list_empty(&gi->available_func));
>>   	kfree(gi->composite.gadget_driver.function);
>> +	kfree(gi->composite.gadget_driver.driver.name);
>>   	kfree(gi);
>>   }
>>   
>> @@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver configfs_driver_template = {
>>   	.max_speed	= USB_SPEED_SUPER_PLUS,
>>   	.driver = {
>>   		.owner          = THIS_MODULE,
>> -		.name		= "configfs-gadget",
>>   	},
>>   	.match_existing_only = 1,
>>   };
>> @@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
>>   
>>   	gi->composite.gadget_driver = configfs_driver_template;
>>   
>> +	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
>> +							    "configfs-gadget.%s", name);
>> +	if (!gi->composite.gadget_driver.driver.name)
>> +		goto err;
>> +
>>   	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>   	gi->composite.name = gi->composite.gadget_driver.function;
>>   
>>   	if (!gi->composite.gadget_driver.function)
>> -		goto err;
>> +		goto out_free_driver_name;
>>   
>>   	return &gi->group;
>> +
>> +out_free_driver_name:
>> +	kfree(gi->composite.gadget_driver.driver.name);
>>   err:
>>   	kfree(gi);
>>   	return ERR_PTR(-ENOMEM);
>> -- 
>> 2.17.1
> 
