Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4566D5F0
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 07:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwz7D12dLz3bZJ
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 17:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=L3jo97ir;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.95; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=L3jo97ir;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2095.outbound.protection.outlook.com [40.107.243.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsydB46wJz3c41
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 19:38:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2bAQpLVC+gPFxtrqcs9Q+avjE5YDH4PnIKX2SNh7mR0uzDq9VuX3+JS3J+QwOVS1OC1LAwa0ENQm5uz2N+b12irXAUb9Qx4CufG+17SiifCxwhJE28abHJexZap1jav4SJp6Ha87d8c0ngrfdwtLLeR9S/GBHcTJ0LMDKbENfyOcL/+7qPZRCeGg38y9YvzIvoncCLm8EnCgp6KbN02c28Efd1fbIECE0R4i20roeXNcY+wPFbfztJAcVsTTddithAw1BaXb9J7rdX9Ir8hMklcQAp++bXVtDrd6iUeP/4u5q7XRdAZhOHFO2RRpxny9ZK4y7rO1LjlbdwpPSGyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTfe3dSgUiQj2z0KuatLpEi2/7/4j3RDM/JZ1jmXVv0=;
 b=OnK2SMJ8MRnrSRhMWFLhEUUVByUygmAsozEUtDwEvH6fuWDTBLO3NN9vqae5fhDP8JuW+ucAPDVLqcTgHcTYktWARuykQucLC5FSFU2zLmFhZOD4bgCrhFMpZWIMr4uXFiXQskWc4XpBmytWc4Om6l/vqG6Mlgu7ulzxUb7Bhvlin7C9/hfsovVjHOkfC35PffUz4XsRvCfrSJcaNwF91Nv5JA0SfT+wadnDyr07MngGLD+JLODICKbYvviopR5hEO9L+pg/akhpVYhZ2qs0IwXY8uRtOewU/zQoM51iTJTEnaERobuy8W48pRueYBkWWsPIjoLUVZE64LnOjk80vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTfe3dSgUiQj2z0KuatLpEi2/7/4j3RDM/JZ1jmXVv0=;
 b=L3jo97ird2Bj7X2s9TgBX1B7xWSm3ouEj9E8ztI2Q0xK+TFDlu0nJE7e/gpzEr0GG8JiPZ06ARdUpWkLoSTZ9U+5hHXsse5+B2yQSmCVFHAsiVFBB4t8WKJXsaPcoQCi0tLa4Gk9lVs5uUbfNilzAfYGXNIBKN1cKuH+H5aDYFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 DM6PR01MB4460.prod.exchangelabs.com (2603:10b6:5:7a::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Thu, 12 Jan 2023 08:38:35 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 08:38:35 +0000
Message-ID: <4d63de84-f398-3bee-cf04-5cf9020b1cfd@amperemail.onmicrosoft.com>
Date: Thu, 12 Jan 2023 15:38:23 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [EXT] [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>, Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Vacura <w36195@motorola.com>, Jakob Koschel <jakobkoschel@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Vijayavardhan Vennapusa <vvreddy@codeaurora.org>,
 Rondreis <linhaoguo86@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20230111065105.29205-1-chanh@os.amperecomputing.com>
 <HE1PR0401MB2331CC8AE82C4DD96A1D398E88FC9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <HE1PR0401MB2331CC8AE82C4DD96A1D398E88FC9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21)
 To SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|DM6PR01MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 93178fad-4b5a-41cc-53b8-08daf4786482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SaVM+pg1/mCASwd+zuOK6hYGXglGZzwst4G03f7zMObOyb5a/qXby580dUzfW8pQJoi8b6nP+T0grWQ15PXbIGx6itGhLmdO74bVei1t9NzTo+fbhoNfwrEutCToTbPoO6hxRyqaOgeFccovP9VN2ROUD8iCs27svCZGzfVqQ9L5zbMSOExhNpjrvrRijzKFqH9m/ZdAgjfG02D34tLOVfO1lZrvxr/cZ+90niPzEs/IVmx48IZaiehXNKOp0xhAYE5ToEFdWh8/A/ZwZscvf0eE+b4c/MbtmwT1u74cd88j2mDlZ/fdCVDuRkCxtbytyYC7F0Emt2u6UfG4o3a6NRxb4Dyvnfr0JcNK58vsplzrnDUIjK/IFFBpnz6lj1hHDZvKnQMh2yIzLeAVk+rKJmz9WTuCM2PRvk66nGdutfAnooGS4Izsa4ndWeAl2z8jfgdn3I8+YGvwfSqjz6Oypt4Yl6DJHuZBV1Pk5H5jUy7GTAbGu5PRHaEsyzkPD1Ww6tuz8fPdSKtiDjyfzaUnuF6bY2QOzD70rq1IJEpGBuXhRJis7mvIrS1mEJJztFLrpfuusN1iKyn2Emf1dYXaSCxH4vbAmavrIV04v7t2ccPzqtznPP/pfSBvFJuDClCRGRyOjn0CVQDcR3DH7yb3K4/RYJH7VvzA+W3++dK+HKSvRNfqLF5JWMj00X8L6XPBsEiQw7FIlul/mCnzEMpbvvbNl7liJeAQ9wlnqblh4x8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(366004)(136003)(376002)(451199015)(83170400001)(38100700002)(478600001)(921005)(31696002)(6486002)(186003)(26005)(6666004)(53546011)(6506007)(6512007)(41300700001)(42882007)(66556008)(5660300002)(7416002)(66946007)(66476007)(8676002)(8936002)(83380400001)(110136005)(2616005)(316002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZVlrWGdHRUg3cjdYTWNSL1JkS2tLRFlSOEVmTXBRS08zd0UybVY3alREeHVU?=
 =?utf-8?B?ZEpmQ2NheEJycGMvZ3IvZ3djUXVTODd6dVByN0djVmZ6MFRXL1lDUVlHRDhC?=
 =?utf-8?B?R0sxdzFScTZadXY5eGpnMU5WcDZGU0xxRmVITW9MVlR2aGRUTWFEK3QxL2ZG?=
 =?utf-8?B?cU5tbDJjOTBTcnZtUEpLOUtvNkJjN2Nndy9ncEZJK21nNWgxU0t6TDZPQjhL?=
 =?utf-8?B?MUVXNEcyTGV1MllqNVNJbExYS3ZQY0NDQ2Y5bWVCVytJZHFrUlZUUDZzbklI?=
 =?utf-8?B?bG9oN3RPQXFDRldMNXNwNTVmTUFvVGpYS3R4V3dxd2VkTk5wbW5GOFFISEZq?=
 =?utf-8?B?cGp5RkFzZjk5MWZzTThWWVMyQlNYN3k4TmduKzM5Vi81VUJWaGYxczFVb2RZ?=
 =?utf-8?B?dnNrd1cyem5YQnMrKzdkb3ZTUCs2M0VzNWxremVIb2FwRzlPN1diOGtXTU0w?=
 =?utf-8?B?TG53VzlmOGRxOXY4RkxUYS9hMk1nWTUyTGpwWElHb1ZNRVY1VHhHYnlzL2c2?=
 =?utf-8?B?UCtZc0pZNUorTmJtR3FtNkg4elEwWkFCUmZKZGlIVmRadXJkeUt3S0VPOXRl?=
 =?utf-8?B?TnpTNVZCOFp1WE1BblJ1V1dVSHlXSkE3ckVmQ1pON25qUFlnNzF0NHhrZ0tk?=
 =?utf-8?B?VmRhd2V3K1NTZ0Rnbjh2b3JmUjFsbFlGbG92emNwQk1xLzN1YjFGYk5lUFZH?=
 =?utf-8?B?MEpGb1NtVUVPV2ZsUU1vQk5ZazYrODBXaXdKMGNrOEpSVVp0bzl4c2RNOGJa?=
 =?utf-8?B?QkZueXVlQ1h3OW5XNnNOTmE3VGFIZ01PMStSYmg2N2pKUHFSZnpzTHEvVS9a?=
 =?utf-8?B?eXVMdU1RMXN5dHV0UmlxUWx3Y2g0S1UyOUFxa2tKY1lIZG1OSlZHZVlCek9B?=
 =?utf-8?B?Um8yNTkvSG1tZ0RNNS81NENlcWptdHlsdGR6czArMXhKd213SmNSWU5jbndJ?=
 =?utf-8?B?RC96b2FRY3FuWUswUFFwK2JtaUNrcU9NdDJXUDBiUUQ0OEFGOHpmemxmQVgv?=
 =?utf-8?B?TnZ5TUJqOVdwQ2VzdG5uZ01raERHcjM0VjNtS3dHb2tpREFMVzRHM3VTZFpC?=
 =?utf-8?B?dGQvRmg0ZUFkamUydFI1UnhSbytXK0JvdnlDazE0cUx5ZkkvRmlKQW94dzgy?=
 =?utf-8?B?WEtDWFFKRGxsdnNiZFpLZ3NJYWRnL2dDVjVQbU1zejVNejJPVloxUm42Smw5?=
 =?utf-8?B?eHQwOHdWdDUxUHRZOElqZ3B5SnBPYWl5eVdjd1hyZTFyK0ZWQk56cDZmeElw?=
 =?utf-8?B?SzNHcEg1NS9RS1U5SzJqaDBUL2Qrbmt0ZXVkdDdmVjk1MFBValE4Rmo3TndG?=
 =?utf-8?B?QWNTbUtBS3BYVWRaL2hCeFU2YkdveFN1TnBWY01mMEpJNXdmNUh6cUZDZG5D?=
 =?utf-8?B?ZHErcitVclN4WTlsLzRVdlRvbERDY0Rzbko3a095djFFY1V6dU1qYkh1QzdS?=
 =?utf-8?B?TUNveDhQSDFtVHA1S1YrSUYzb0NBbjV3YTdWa2krSzl4eHFhL0d0QzhZaGFJ?=
 =?utf-8?B?NkxRYVNxQ21aRHoxM2UxYzFlMk9lUzE0amZnSzBsOW9WdFZCbmpOTU9NdVo3?=
 =?utf-8?B?eFVTZ1loUHV5Z2RqRjFDZ09DTHprZnl0bGo3UUJ1a2VPT25iU2h6UGRYYkhw?=
 =?utf-8?B?Rmx3ZmVPWElpcFI1UCtjZnVYbk1BUDQ1b2RnUkpBdjhBRjJtdnBJVURKa2xU?=
 =?utf-8?B?Vm1jQnRVY2c1WHcvQVlvK1RmVEs4STV1WHN3TUxxcElQVzQzcFFTaW9BLzFZ?=
 =?utf-8?B?V29hb1VpYnp5bmszNlE0VEo1dXd2Y29ldXI3cTVDWjVLam1mTk96V0dvQmpa?=
 =?utf-8?B?OTJyVzcwL01reXQrenVZNWUveEhPaUQ3c3FtUE1pK0NoWWQ5YjVnQUhYQVpj?=
 =?utf-8?B?NS9nRFhHZ2lCOC91alo4blYwTjV0ckRGR3FaTjRPeCsweVJsUDA2TkFrVGhN?=
 =?utf-8?B?RlRtN2NkeGpvejJkSlU5bG1OL3p0c0xXci91bGNmbXkxb2hOUHlURHRGVkFE?=
 =?utf-8?B?bCtuVUFQKzJ4ckF1WnZ0QzFNZkFmTWs5VTJId25TVy9teEx6YUlrajU1Nm42?=
 =?utf-8?B?WnFNbitFcVo4SDAzUExGeWdQc0w0Lys0SHdkZm5rTmg0aTNNTW41M1F5NWVL?=
 =?utf-8?B?OUJnODF2eVRXVkk1YSs0eFBFRDA2aHNpZUY5Um51eDlDYTdodDhzd2VBQmFR?=
 =?utf-8?Q?ilv3TJWbb1n2fF86s9+G2tU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93178fad-4b5a-41cc-53b8-08daf4786482
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:38:34.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bk4Za0xTY9x23mO47xBHxPhVFQKWG6nbUo7kd/vQFvNfy+uNaleIsSgxEEwNnr5QRxZeZ6MMb7aYERwaZi9gHWp9n8Ng14JYRJPOHvm4gP5lH5By1r0J5TNOiM8mvem
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/01/2023 22:16, Frank Li wrote:
> 
> 
>> -----Original Message-----
>> From: Chanh Nguyen <chanh@os.amperecomputing.com>
>> Sent: Wednesday, January 11, 2023 12:51 AM
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Frank Li <frank.li@nxp.com>; Christophe
>> JAILLET <christophe.jaillet@wanadoo.fr>; Dan Vacura
>> <w36195@motorola.com>; Jakob Koschel <jakobkoschel@gmail.com>; Alan
>> Stern <stern@rowland.harvard.edu>; Vijayavardhan Vennapusa
>> <vvreddy@codeaurora.org>; Rondreis <linhaoguo86@gmail.com>; Andrzej
>> Pietrasiewicz <andrzej.p@collabora.com>; Heikki Krogerus
>> <heikki.krogerus@linux.intel.com>; linux-usb@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Open Source Submission
>> <patches@amperecomputing.com>
>> Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
>> Subject: [EXT] [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget
>> driver names
>>
>> Caution: EXT Email
>>
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
> Reviewed-by: Frank Li <frank.li@nxp.com>
> 

Thanks Frank!

>>
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
>> @@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct
>> config_item *item)
>>          WARN_ON(!list_empty(&gi->string_list));
>>          WARN_ON(!list_empty(&gi->available_func));
>>          kfree(gi->composite.gadget_driver.function);
>> +       kfree(gi->composite.gadget_driver.driver.name);
>>          kfree(gi);
>>   }
>>
>> @@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver
>> configfs_driver_template = {
>>          .max_speed      = USB_SPEED_SUPER_PLUS,
>>          .driver = {
>>                  .owner          = THIS_MODULE,
>> -               .name           = "configfs-gadget",
>>          },
>>          .match_existing_only = 1,
>>   };
>> @@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
>>
>>          gi->composite.gadget_driver = configfs_driver_template;
>>
>> +       gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
>> +                                                           "configfs-gadget.%s", name);
>> +       if (!gi->composite.gadget_driver.driver.name)
>> +               goto err;
>> +
>>          gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>          gi->composite.name = gi->composite.gadget_driver.function;
>>
>>          if (!gi->composite.gadget_driver.function)
>> -               goto err;
>> +               goto out_free_driver_name;
>>
>>          return &gi->group;
>> +
>> +out_free_driver_name:
>> +       kfree(gi->composite.gadget_driver.driver.name);
>>   err:
>>          kfree(gi);
>>          return ERR_PTR(-ENOMEM);
>> --
>> 2.17.1
> 
