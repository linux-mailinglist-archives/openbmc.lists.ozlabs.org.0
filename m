Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61255FBD3
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 11:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXwzW0YhRz3c8q
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 19:25:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TfTfcbUu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.126; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TfTfcbUu;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2126.outbound.protection.outlook.com [40.107.92.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXwz10zv3z3bqr
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 19:24:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUvMfgqdBl6090lDay6o2lIXx+wsbcSt4nFJq3cd+7OP7IPif16d6YYKcb9wg7DFz5/Zg/MtS8RM7USPkzneidKnyAXCdLW+GRS560Z5jkDNoIB0kk94ekXjQgCQ5nOC19negtyT9E1RYDSUvkdD3yTUA2pKtk1dN2B1BNtX4pru/hc7wkL3ZiLR6cvu7N88JoalKqO+Ir2z36JjjAoVoQFX8bt0MRgEWx4pe8fSsqHQmWNfwuRCRNEMAjAOhh0w7TfynfUsnUuPyFMXzUFKkZ/QNsmhKqhp+S7amY6lFw4c4fVBAFE5LlI2ipuCBYhBAM6SgGQUwTJF0fWhBEnxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eewz0O4xKaMAPmTpVA3JPUJkLgRYbrXDGWVliDdGRDw=;
 b=FjVqcdGF6JoAFRDTdiCB0dTBoiIrBfZWEXkbI8FqZ1cYlHI7hXgn8+CMUWf5OzFEiyaZOfD9O79jMF0fJ/p/6sDL66DkiYOOB9dEucUxRCFxUqekOuPF/s9B0WH+YEpWK26f8TgSngl04qAGAyM8i/CnNYIP1ShoS2z2InCcGTVYYJ9XxIme93Igb8hCsLlXWjTtBknHRFl4QJhZJgnJB7W/IH5KK0gn1H6oNGD127hlFYkFjJFnxy7Z5QHhYntD1Al1sFAOgGaidWBFdfz/s4lr8S3iGywI5VS3FI6GQdbBjRHbdjpgdj79tVZlWwQA18h0dJQ63u138ezIAEllSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eewz0O4xKaMAPmTpVA3JPUJkLgRYbrXDGWVliDdGRDw=;
 b=TfTfcbUuKdi9iLgItPNe2+r31GWFJE6PrgpFb6FD1v0X/ozLD2YIIIkYM60VDX+WAgc9smejTGhGDyhE2ulNPDSdNcxi4aTkHhIal1Q5l5qWPZfTv/htDHdCgx2jP5rotZnCh/AVNbw2FzxRLqP4D7bA8Cjz0d6m9yJ0EVCdT5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4078.prod.exchangelabs.com (2603:10b6:805:a9::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Wed, 29 Jun 2022 09:23:37 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%8]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 09:23:36 +0000
Message-ID: <2d3b395d-affa-a651-c284-605b26a6f667@os.amperecomputing.com>
Date: Wed, 29 Jun 2022 16:23:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [PATCH v8 8/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
Content-Language: en-CA
To: Lee Jones <lee.jones@linaro.org>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-9-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220422024653.2199489-9-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14775dd6-00dc-4322-d687-08da59b10b6d
X-MS-TrafficTypeDiagnostic: SN6PR01MB4078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9blFe0yM84KBePT29s/3uRyv8bQt+dQs/tXhBdlObPC9+xrDLDtNPdrcH0hww3MyKyq98ytmYzDPbK/YPvIqCeL3JG3PoYEgAIyGmpyDsdLnXpBozulDw1vJ/1aWngjvJWAMPNSMYKQ6sFrZp+aetnMSyfGB4PSgzT4w1LDUYc/yqKp7aBWRaZ3pV8v32ym5mDm9VwvrAXcpvQbpJy6eFtgFR2I/n6x4HGZPar4yZF5FdeY1PX+sATtdf731ggG6qByzwM1Qhw6I7H5fhv5ZuNq5aHsVxmQXLYYZSVBOlMyMidQKCsiePwek6LKidfUgRWvkydafuEPSrPvdbRFgmU36uw6h+FF/MxhYkqO5bQ1wTcnnHFIevVKZbE3FiwxQ91g1ZO0OYONsL7CEEvR/BnQMv4eMXaFK4s7LuGmKEjmfb3yNHMcPa0220rRzqJ4db3lkeOnlK0vNcz7CPpJHmS8z1AclB4S/NA3dCCW0NsCKY7F5JPfjdXMclslVEQX7k6U7MUroWg+qJEgrvtbmvLChi5rqj9INLEZS5iGVarlND8CbsEGUdDzkPA1FwgHDAWeRfDpMW8RxWCe+5O4tPwMC6wRFdrRKySLPAtgpVQz10FB58wv6VlpBFic5LYNJ7ZdsvlsHBGO0hFZKAs9pA/A307pNT4c0efQSCjQDSTcYwwcsAac04rbfdXEPfeD/ifQZ24hoFSyfZXJNukfuPccUzX6DBEOmL01FFLqCMcZ8mbaDGpNJzLPvueYPBouZ8MN2v8UORRnzK+KVAC+ODh4aOgF+ioBoDaRWQY+4gVuEI6PgKsYm9dxk09LChMaQkIWHItHN6+CiBTW8SEC4gnmliwhFCJ1gRXKVTS69J2k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(478600001)(6512007)(316002)(186003)(38100700002)(2616005)(52116002)(66476007)(86362001)(53546011)(26005)(66556008)(6506007)(4326008)(8676002)(31696002)(66946007)(31686004)(107886003)(966005)(6916009)(6666004)(83380400001)(7416002)(6486002)(41300700001)(54906003)(38350700002)(2906002)(8936002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?THA4d0VTY2VBKzBac0wyMCtRbzZadU1yRG01OVFjYmJ6UUFudktlY1U5eVFI?=
 =?utf-8?B?MmUwWEROWUIvQlNjUWRHQjZKYzY5VDltY2hJVzNjK0tGSk9JVDM1UUt6ZWs1?=
 =?utf-8?B?bExzNXhuMGUxMGNYVTdIOXdOZXh2M3lkVENvbDlBZW9kOTZNeVc1ZkdFNkhK?=
 =?utf-8?B?MHFwU2tHT2R2N0xyTTUwU1U2c1l5MzR6Wm51T0dEanY2N2x1VmNsRld1eUF2?=
 =?utf-8?B?VW95S2NwWGp3YkNPeTR0WFh5bUJtSmZpczlqS1ozZTZDbE9WOFVxQ0lid0sx?=
 =?utf-8?B?ZHNRZ3hwT0hsYjhxYTk5clFVSm9BdHpvNzJ5R1NHbmRKZG43LzNQL2NZbHRr?=
 =?utf-8?B?YzFja3lGakJRV2Z2Qnlkdm9tbUpLemprOUpoamZ6dnpxNzdKUjFvcDdVVC9m?=
 =?utf-8?B?YmlrZWtlY3VqVGFkZjg2cW1kRXJwN3l6aXBDdWlsbFRZZ3E4ekFNM085RHRN?=
 =?utf-8?B?ZUpjU0ZTLzlPTk1VcC9xVHZZd0t5c2M5RDZ3WDJRQU5vanNhamhleHl6b1Ji?=
 =?utf-8?B?Qmp5SVNpZHk4NzBXWmwzSnZvWXV4OHhDQzUwUFUvTHZ5OWhXMURUUzNiNEJx?=
 =?utf-8?B?Rm9mVVJUWFV2NkJVeFl6QmtiVkxYOWh1ZWlmSGJKS1lUN3FXend4SXpsTloz?=
 =?utf-8?B?ZnRuZllhclJhdjVlejVKbDRMbG5GN3c5TEs4UzFWQXpGRFNtRXh4aUZDVlQ5?=
 =?utf-8?B?T2JNVlpvKzJObnRCalI2M0xMdXpoR0NQaG04eGwrb08wVWg0ZHZKeW1oRFp1?=
 =?utf-8?B?ODlzSXNDeVZrYzcwdnBRL2NXM3dqaEtaQVVheTRHMjlCNG9zWjFJNHdJTTBw?=
 =?utf-8?B?VW1aS2lWU1I0ZElGdGd6dVh1U25QZk42M0Z6S3JJamtiTjJaN1IreEY0TEcv?=
 =?utf-8?B?TFBXaW9scE9qU0w5UjZYR01CVHpHWlJwQTBLMENkOFBkb3Y3MlFhVlJhZWRW?=
 =?utf-8?B?SUZvRjN2dnVvV2FIVTlVV1VvZlU5dlFSNC9ZM3NuYjZYSDVHdjRFZDRIY1Zm?=
 =?utf-8?B?cDB5clJ4U0lSVW9sL1AzOS91a2hESlNrTnRzWWdOeWNQVWNzVXF3bGptZDVG?=
 =?utf-8?B?OEdHM0JwcjdTSEtNam1JWVRQRlRlNGtvb3F2NjUzWnRIRlExVEs3SEhVbHE1?=
 =?utf-8?B?QlFxMDc4SnpQclViSzZqa095K2duMkFYdVFHUUgvSHFMblh3WTJHYnBLNC9v?=
 =?utf-8?B?aER1V2hXY0VvNXZDZXo3aXEzUVljRVJ5N1VQYzlWZk16RXZ4VkYrYmJyUjFk?=
 =?utf-8?B?UVQ0RlhRMWFlU3lIUUQ1YWpLTzRvUUdoUFNJcEZadCtIWUIwL3hENUl4MzBJ?=
 =?utf-8?B?dG1kcFMvVHZlcTRONmpmN0NveHpuNXc1WFl0RVEvZS9yMTEwdCtXbUtSWFZs?=
 =?utf-8?B?RktsK2pLSlp3anNLNldLa2IybDU2eEdVdTFPaThWSldVdStkL2JWbzdUemRM?=
 =?utf-8?B?N1N1cXJlRW1OTm5kdjJyaXFWTkllTXk3OTRHSWNJL1JJYU9FdWVuOTk1Vjgw?=
 =?utf-8?B?UDcwR1E3cFdyRDU3aVVpUFFrNXZuUmkrNENJSlQ1U0NpSWdCZnFYUEdrYVho?=
 =?utf-8?B?alJEaE9BeE14b0gwNkZEbUc2bXBqL0ZncUVWb09wYkZuajhqUDBEdFFoL2N0?=
 =?utf-8?B?bEdyV011NHJhcG1Nb3IyNEdzS3RQbGJBdG1CMGEzUTNGZThJR3BSOUpkWG0v?=
 =?utf-8?B?VmJETEhmQ3EyUjJpM3ZYQW1qa0xvQ2xnUUYwVERvSHIxOUlOWEZSL3QrR3Fv?=
 =?utf-8?B?Q2hidldtYm9zWkh6RExrRG53eTBlVy84bzFTZURJbHMxZGQ4VG1yVWY3bFlW?=
 =?utf-8?B?ckVwam9BaTJMRVYrbGY2Ulc3WjMza1ZYVzMxS1p0TGpQYy83Z3cydElWR2Fu?=
 =?utf-8?B?MDliaG9xbXUrVDJ2c2d2TjdPWnVCUFVSSk96WlJuNFJDYkpSZzJ6ZExZcTRw?=
 =?utf-8?B?eFY3ZitMTjFaSFhOdW1ONWFIaXU4RlNJa0Y1d2gwZmtKVU4ybVF2TWlEVGtS?=
 =?utf-8?B?WEl5aEtnK0NCWVdFTzVoeC9zWjUzVmlIais0RVB2dVNEb3BDNnQ3UWdkU1Y0?=
 =?utf-8?B?a2V1RDErRVp6QWFkczQ1eTc0QWMremlBbGdpZWp0U1FselNwVVd4dkhyNnFt?=
 =?utf-8?B?L2kvN1ovdlBONFBlMlhoaUJMeEJ4NFFhSTM5cVpJWGhId2dVejBZa0tGSEFt?=
 =?utf-8?Q?2WnJvHdBw7spiv9IClJPOEs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14775dd6-00dc-4322-d687-08da59b10b6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 09:23:36.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EX1RLodhqwmmnEccDUWMQLouhzYl7M0LsLPgA7Px4oc0NiHmd6pIckiJuitymwNGYR2FlXWZcMUHYM9va2MfeYMi6axS6b6+R1qyBL9O9xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4078
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Lee Jones,

Thank you for the comment as on the link: 
https://lore.kernel.org/lkml/202204230554.4528TqPu-lkp@intel.com/T/#m476dce286d806bb3713f689663fa631f5a1f0909

I'm not sure what happen (maybe due to my bad junk filter) but I could 
only see your email when checking the link mentioned above.

I will try to response on each of your comment inline.

Thank you very much for the comment.
- Quan

On 22/04/2022 09:46, Quan Nguyen wrote:
> Adds Multi-function devices driver for SMpro co-processor found on the
[Lee] Please drop the term MFD and describe the device instead.

[Quan] Will replace MFD with "core" as your suggestion.

> Mt.Jade hardware reference platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v8:
>    + None
> 
> Changes in v7:
>    + Smpro-mfd now significant changes in compare with simple-mfd-i2c
>      driver, remove the copyright note about simple-mfd-i2c    [Quan]
>    + Install bus->read/write()  to handle multiple types of bus
>      access.                                                   [Quan]
>    + Update license to MODULE_LICENSE("GPL")                   [Quan]
>    + Add others minor refactor the code                        [Quan]
> 
> Changes in v6:
>    + Update license part to reflect that this driver is clone from
>    simple-mfd-i2c driver [Quan]
> 
> Changes in v5:
>    + Dropped the use of simple-mfd-i2c driver [Quan]
>    + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>    sub-devices. This is to avoid DT nodes without resource issue [Quan]
>    + Revised commit message [Quan]
> 
> Changes in v4:
>    + Add "depends on I2C" to fix build issue found by kernel test
>    robot [Guenter]
> 
> Changes in v3:
>    + None
> 
> Changes in v2:
>    + Used 'struct of_device_id's .data attribute [Lee Jones]
> 
>   drivers/mfd/Kconfig     |  12 ++++
>   drivers/mfd/Makefile    |   1 +
>   drivers/mfd/smpro-mfd.c | 134 ++++++++++++++++++++++++++++++++++++++++
[Lee] Please drop the 'mfd' part.  Does 'core' work instead?

[Quan] Will drop the MFD thoroughly in next version.

>   3 files changed, 147 insertions(+)
>   create mode 100644 drivers/mfd/smpro-mfd.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3b59456f5545..383d0e6cfb91 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,18 @@ config MFD_AS3711
>   	help
>   	  Support for the AS3711 PMIC from AMS
>   
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to enable SMpro driver support for Ampere's Altra
> +	  processor family.
> +
> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
> +	  be accessed by child devices.
> +
>   config MFD_AS3722
>   	tristate "ams AS3722 Power Management IC"
>   	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 858cacf659d6..36f8981cc4fd 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
>   
>   obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
>   obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
> +obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
>   obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
>   
>   obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> new file mode 100644
> index 000000000000..485c4f89ebd9
> --- /dev/null
> +++ b/drivers/mfd/smpro-mfd.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ampere Altra Family SMPro MFD - I2C
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
> + * Author: Quan Nguyen <quan@os.amperecomputing..com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/mfd/core.h>
> +#include <linux/regmap.h>
> +
[Lee] Alphabetical.

[Quan] Will sort the included files follow alphbetical order in next 
version.

> +/* Identification Registers */
> +#define MANUFACTURER_ID_REG     0x02
> +#define AMPERE_MANUFACTURER_ID  0xCD3A
> +
> +static int smpro_mfd_write(void *context, const void *data, size_t count)
> +{
> +	struct device *dev = context;
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_master_send(i2c, data, count);
> +	if (ret == count)
> +		return 0;
> +	else if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
> +static int smpro_mfd_read(void *context, const void *reg, size_t reg_size,
> +			  void *val, size_t val_size)
> +{
> +	struct device *dev = context;
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct i2c_msg xfer[2];
> +	unsigned char buf[2];
> +	int ret;
> +
> +	xfer[0].addr = i2c->addr;
> +	xfer[0].flags = 0;
> +
> +	buf[0] = *(u8 *)reg;
> +	buf[1] = val_size;
> +	xfer[0].len = 2;
> +	xfer[0].buf = buf;
> +
> +	xfer[1].addr = i2c->addr;
> +	xfer[1].flags = I2C_M_RD;
> +	xfer[1].len = val_size;
> +	xfer[1].buf = val;
> +
> +	ret = i2c_transfer(i2c->adapter, xfer, 2);
> +	if (ret == 2)
> +		return 0;
> +	else if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
[Lee] This looks all too familiar.

I wonder how generic these i2c call-backs actually are.

[Quan] yes, this is similar with regmap_i2c_read() but with reg_size is 
force to 2.
We can reuse regmap_i2c_read() but it needs to be exported from 
drivers/base/regmap/regmap-i2c.c

> +static const struct regmap_bus smpro_regmap_bus = {
> +	.read = smpro_mfd_read,
> +	.write = smpro_mfd_write,
> +	.val_format_endian_default = REGMAP_ENDIAN_BIG,
> +};
> +
> +static bool smpro_mfd_readable_noinc_reg(struct device *dev, unsigned int reg)
> +{
> +	return  (reg == 0x82 || reg == 0x85 || reg == 0x92 || reg == 0x95 ||
> +		 reg == 0xC2 || reg == 0xC5 || reg == 0xD2 || reg == 0xDA);
> +}
[Lee] No magic numbers.  Please define these registers.

[Quan] Will fix this in next version.

> +
> +static const struct regmap_config smpro_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.readable_noinc_reg = smpro_mfd_readable_noinc_reg,
> +};
> +
> +static const struct mfd_cell smpro_devs[] = {
> +	MFD_CELL_NAME("smpro-hwmon"),
> +	MFD_CELL_NAME("smpro-errmon"),
> +	MFD_CELL_NAME("smpro-misc"),
> +};
> +
> +static int smpro_mfd_probe(struct i2c_client *i2c)
> +{
> +	const struct regmap_config *config;
> +	struct regmap *regmap;
> +	unsigned int val;
> +	int ret;
> +
> +	config = device_get_match_data(&i2c->dev);
> +	if (!config)
> +		config = &smpro_regmap_config;
> +
[Lee] This use-case is not currently supported.

Please return an error instead.

[Quan] Will update in next version.

> +	regmap = devm_regmap_init(&i2c->dev, &smpro_regmap_bus, &i2c->dev, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Check for valid ID */
[Lee] Decent #define nomenclature should render this comment superfluous.

[Quan] Thanks, will remove in next version.

> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != AMPERE_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				    smpro_devs, ARRAY_SIZE(smpro_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id smpro_mfd_of_match[] = {
> +	{ .compatible = "ampere,smpro", .data = &smpro_regmap_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
> +
> +static struct i2c_driver smpro_mfd_driver = {
> +	.probe_new = smpro_mfd_probe,
> +	.driver = {
> +		.name = "smpro-mfd-i2c",
[Lee] "smpro-core"

[Quan] Will change mfd to "core" thoroughly.
Thanks for the review.

> +		.of_match_table = smpro_mfd_of_match,
> +	},
> +};
> +module_i2c_driver(smpro_mfd_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
> +MODULE_LICENSE("GPL");
