Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF14CF3AE
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 09:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBsFm5qr5z30hV
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 19:34:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FrFU+6Hq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=FrFU+6Hq; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBsCM6YJ7z3bSm;
 Mon,  7 Mar 2022 19:32:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdNR5XU39GAwgJho/0Lh8fl/x14ZqZ0JJxXhCkibCZ2nDZQEukIVIoa8fRuo+huenr4JJThUymKRHX1x0Oe+dpWCh6AYPFvWcBRtACAH8q2WB8W6+VYcuqKooGTiTri2vaIXPfPtSIWlVxY7Gm6iU3yLuXl6aVUw5xM4gFddBZ4cwq51VgflzhpUSPS67wFCROq/5lDEFdOqSpQhzUqOTPoCry63NAUBn+ZnlR8+SfVgwx8UefkzbEz9xo5PL36RjdvyP0cgGamhQtxURunHf1ByKGs39wmfgZ/QfkdrV5lytM6A3cI5l8I54eupFpeVsh3Tz0adqcu1nx4ew2BZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBpYQCmvglytjmXTYjsCZqf6qka47l1kSWPxurn/kPs=;
 b=hNqUHA11yeQQKBJZqsb5rKW9Ss+Z1U5AxBkbGXMVk9mU1JhFD15OUVJjTQVVRqXVCrGrwLy3QlHmM9PjSmLO3r20PP9gMCsprttJQVo73GceKH9IoeeWSX32RI9FC12tDSdEPUGr9UZ3SwQrRDa8kTgmufOCS5AnByCAYuqtBE/QnWQHfb9+kb9us2z7bJDMJgALOPRdzILK2I5hs9OjvZTyYnYcbY5nOfWtaVRq/4m2ByMKlnQdwJSdtJzi+hcIXdfgieXI0vWtTdWJji/DvwIr0OZ7EApdMIQXpVt0ONWSMl38tn6fdSGxU6undxOcij6FYXUhxOsQ0iXZVLBF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBpYQCmvglytjmXTYjsCZqf6qka47l1kSWPxurn/kPs=;
 b=FrFU+6HqOreBzQUjEsPCvsQcTa0s7jTDbZt0CrlXc4wZwx6cF5xD46ucqcGYly3UKpTB+NJvtvsfhuerZQ2QG31q45jMEmB4cFUkSCfycgVAgbdIEZsnlcTXA33+ShTUehSwNa4w3Hn43JjkLaza/Xe+lgE9w5rY3EkDGmMycOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3498.prod.exchangelabs.com (2603:10b6:302:3::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.20; Mon, 7 Mar 2022 08:32:14 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 08:32:14 +0000
Message-ID: <cfab224e-dd82-918b-8d22-74dc2652a549@os.amperecomputing.com>
Date: Mon, 7 Mar 2022 15:31:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 2/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
To: Lee Jones <lee.jones@linaro.org>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-3-quan@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <20211224041352.29405-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eedae702-8637-4c1e-88e2-08da0014fb08
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3498:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34985A62AA2B8E52A798E63FF2089@MW2PR0102MB3498.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+JCyaHdR1euJrsSgDTDwAQv+zpM6iyeRQ3YWgrvjaB89iinfs9oYolJGTIP4eQSv4K509Eni0wuvfCUtY8z5FNcHzDIoFiN+LStSHjVGRUIKtA/FXlFEQiShGu/AZdHJtST3dPj4BSfmSI5aPdh4VY7C0Bki2S2Nqi+p+pbzsvCdJu8ULpxSK5vdiigOcRmFFLfJHZyeKBCExBpwtDRI1d5ZkGAn98kcgnacqot429j2LY1tN1L0Rs6hdkrgWczGYeVcc7H8gvsj6c5O23DSIgWRfLRYW9pAyh8/DIUZpPZVBFAoSgmFbmhI/2KRb582i2H0mzNrFyd0xlGZjrDhid45cDTDd3l9JpI0dNXfmA/BATEFEk4aYwC9Wq7xiV6iD1d8bWSBq6XIcqnpnVlS51c+H9raOl/dHQz9S6ts5Uzv08DTyv5lnI5UmY0VPvjph4FUbMd6t3eq2D1YjFaaGWQpc5EP5mjgLFFnA8/9MwrWc4rjnPkENszLyh+sofzzI3iT/7NKRdL2b/2h94FecrGyTYjV8M3SbcGZveZyjrns9zuULAJIpfkYa+jg7XnqhB4OG2ySSbCZHgZ3DqyqkBtv4mC3MSDe3CjwYUPnRD66Di/vSyz+6nhZHP0oj2LOhsC2/YTTPzQByndB4o8tu913k8BWv/67b3YZFaoofBNTu3xF0mcCdwagyeVBq4i5ALspf5O+cGoTT9rxL695h0TG/Pag7Djltd9KvByZuBzeJY7zZNwstHji+rZ1fUV8DqUegZU6dbiAOahgPuYPlHi7pDtdTGeeTYBzeRwa3Uhjr6tv6C7eXmXhdh1e8zN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(52116002)(6916009)(31686004)(6506007)(26005)(38350700002)(8676002)(66476007)(6666004)(966005)(86362001)(6486002)(55236004)(53546011)(54906003)(316002)(31696002)(2906002)(186003)(66556008)(4326008)(83380400001)(508600001)(8936002)(66946007)(7416002)(38100700002)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVBaWZkWGxjeko2QjRjaWh0ZXpHRVFHekJ3cmEvT0dmV1dvQnBXeFJjbWxo?=
 =?utf-8?B?ZjYwU2EvN1dzZ29DY2dVbmp3SUI4ZmYwQzNhUTM0ZVBUd2M3ZTFPR3FpVVJI?=
 =?utf-8?B?ZWtxOFhjS2R6SXhYYzNNOS9yTWE1b0ZKR3NjR1pjZmxTZ0dTcXBJQTluWjdo?=
 =?utf-8?B?Z1h1NEFLdU9lN2JEZmlvOVg2ZXpDdGlUblRjMkpqbnE5S1NUbmxhcFFNcWdG?=
 =?utf-8?B?eG9waGFuaU0xWUFuNXUraTZBdVhLanpCbFVSZjl2WU16T3MvT1BmWXN1RDFp?=
 =?utf-8?B?RHBTSHV6VFc3U21MbTZqaU5pWkoxUzVxTUpaYmo3Z3JCSDVvcTRvT0g2Z0pD?=
 =?utf-8?B?SDVTRk5WdnN2V21pc21mcUpSdVQ3NU45TjkzSy9nM0wwRUVOWlRZQU4wSVo0?=
 =?utf-8?B?eEJGcXVqRDVBN0V1cEhyUUpZYUR4V05kaEx4a2hvRkpmOVM0L1pzSlBSUWFh?=
 =?utf-8?B?UmlCa0lKcnVnSE9obXExcE4vV0o0OHFibGY4WnNlYU54T1ZGOHBIQlRUQkt6?=
 =?utf-8?B?TExPbFJKK3hONXl1eGZ6dGZxTHZDL2JESlhQYXRERHdkQTBGa2ZQRnB1c1R1?=
 =?utf-8?B?TFA3U3ZkUGJKZU02ckoxbHowZ3YxbEtrZlNESk5mWkdRZGVoTjJOSkFrUjhy?=
 =?utf-8?B?RjIwN0lPYnUyWDlTaG5LalppMWpDaGVVaTZaZ0paZkZEcmdzM2RSdXJ0YlFB?=
 =?utf-8?B?N3VVb0dwd01OWU00RmxLMUJJMWhxb1BZTXd0YjVxTkZTYXRxNGJHVTRwc1BU?=
 =?utf-8?B?cUhydXBYSlpaSkJqOWJJT214K3dkdXljZk9kcmczY0pnUGtuWUVsUEJ5dHBC?=
 =?utf-8?B?d2xCWGF1QXcvZTRqZk9EWDRDd1FSZkdoQk5ja0oraEU2RzhveGlIMjdkakhn?=
 =?utf-8?B?c0FobUgzL0V0NDFPcldHNWduQmJrM3RMcFRtZzJ5WFlkOTN5NEhNTHBBQUYx?=
 =?utf-8?B?QmdiY2tMempvOFROZ2FEc1NCOEZuYkR0SXlmTGY0S3g3UVJXTHFtM01vei80?=
 =?utf-8?B?N1dVbVFMc2EwMFJ3YWZDbnhja1ZabjdJTHVmWUc1cm1Rb3I2bllSS3NQVjJY?=
 =?utf-8?B?V1hjcCtMaTJpMWtIeTVWVk9SdGQwSE11YkRFa3V5T3d2c1FaUVF4cGtEZGdX?=
 =?utf-8?B?bWw3TmNId0hkcWVoaDlzUEkrcm1tNGZZTGYydlJwRlVmQ2Z3SFk4N245Q2FN?=
 =?utf-8?B?N2JSdzhtYlhjYnR6NG04d29yLzlna0RCTFo4UCtUdDd6QUxoS0QrYjlsMlha?=
 =?utf-8?B?R1ByazJCcm1nUzZObnJldTFucGZDanZzYXI0K3N1RlVnNWoycWZmbjM5WFN1?=
 =?utf-8?B?Wkh3VldtZzFaYmFOd0ZscUFrV2JLMS9PZVdkVHRaRnB5NzNuWTNMUm5wYVlV?=
 =?utf-8?B?eXlDQVFPdWdoOWVlZGRXRDlXbDdvZmxxOE1DdjE2by9aU0xPekVkTVRmeSt6?=
 =?utf-8?B?T1FLSXpVN2o3R0lYK0pQR2hoS0xqZUJEdFN1WHREaDl4dWxUZ1RTR0ZzOFpa?=
 =?utf-8?B?NFpxRS9ERWcyVGhOK0hlaHJFYkhXR2cwQ0U5dEs3M3MwbVVSTjFoeC9RTWRr?=
 =?utf-8?B?Z3MzZThTWUNZN09XLzhlcWI2UEhtZDRHbmR4TXZwSjF5WUhLTGkySXpQTHpj?=
 =?utf-8?B?YmUxQ0RjQUZKbjJNcGNnMDdhdFcyanh0eC82VXh4dWVROFdBajRQblFZcFd4?=
 =?utf-8?B?YThhTkd2K0cra2NuOVIyM3lnUjFYWlhMV1l0djNldG9NMFN2MzZPTXpzL2t1?=
 =?utf-8?B?S3dyMS9WWWhmbm5zYjRxZjYyd3VtU0l3RmlNbWliZEg1RWFHWWpzTDhWNTVv?=
 =?utf-8?B?S1VTM3BKTkhVSldmY0JZZWUvdW1iVU01N0E3Y3lrY3VIOENQdC9ieTVXTW1V?=
 =?utf-8?B?cjRSeGJXSUVLUW1SZi9Iek9qYnlpclp2YVRjbFozY2VXZ1VQMndYSnl4ZCta?=
 =?utf-8?B?ajdSVkhMZG9BQ0M5ZG5URjRoN25ZVDVzb0pXZGZYU1lvVm9sWmJiYXR4UjlG?=
 =?utf-8?B?TEVhb3RDSFd5NFNMUFdsQXF5Y1VxOSs4RWh5RFhwR1JGNWRHR3FIOFZmWjdT?=
 =?utf-8?B?WkZnR3M2QXVPb3N1b1N2N2dyb1FiOTlkejlUTUNGMHBNN2hRdFlJQlVUcndC?=
 =?utf-8?B?dE5NWDdkOTRNZFEyZmVxbDRqWXNQQXZUNmNBRC9VbXZVTjREaGtTaXAwd0Nx?=
 =?utf-8?B?U1VOUEJyZUZTZzBrK1orWGt4dHF0MGRrSXFhS1ZCdzlTYlJ5QWdVRmR0OWFy?=
 =?utf-8?Q?BGLAHfrQfCQ3gzfzZQAchORJVbSERw/2FqU/vxkGGA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedae702-8637-4c1e-88e2-08da0014fb08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 08:32:13.9207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfbxNgFvoii+/k0VbXAx9LWo/6k6se8/4yZanAHSbZe8yjXulXygn6/HPq/Ip7Alg8aPz2okHlg9ooji/w0TbKGkLGHl/e1xPcoq8ctxazQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3498
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phong Vo <phong@os.amperecomputing.com>, Mark Brown <broonie@kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Lee Jone,

My apologize as I did not see any of your replys for this series. Maybe 
due to my bad junk setting,

So this email is to address your comment in 
https://lkml.org/lkml/2022/2/8/254
Please see my inline below.

Thanks for the review,
- Quan

On 24/12/2021 11:13, Quan Nguyen wrote:
> Adds Multi-function devices driver for SMpro co-processor found on the
> Mt.Jade hardware reference platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
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
>   drivers/mfd/Kconfig     | 12 +++++++
>   drivers/mfd/Makefile    |  1 +
>   drivers/mfd/smpro-mfd.c | 76 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+)
>   create mode 100644 drivers/mfd/smpro-mfd.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a21cbdf89477..a886da5018b1 100644
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
> index 4d53e951a92d..fbcd09dce5ce 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -267,6 +267,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
>   
>   obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
>   obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
> +obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
>   obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
>   
>   obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> new file mode 100644
> index 000000000000..132d4e2dde12
> --- /dev/null
> +++ b/drivers/mfd/smpro-mfd.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ampere Altra Family SMPro MFD - I2C
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + * Author: Quan Nguyen <quan@os.amperecomputing..com>
> + *
> + * Based on simple-mfd-i2c.c:
[Lee Jones] Why aren't you just using this?

Mainly, on this series, is because we need to add empty DT nodes for 
child drivers to be instantiated which was NAK because DT nodes should 
be for describe HW specific other than to instantiate drivers.

And, as other reason, in my new version, I found that we will need 
separate MFD driver so that multiple type of bus access could be handled 
(by using regmap_bus->read/write()).

> + * Copyright (c) by Michael Walle <michael@walle.cc>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/mfd/core.h>
> +#include <linux/regmap.h>
> +
> +/* Identification Registers */
> +#define MANUFACTURER_ID_REG     0x02
> +#define AMPERE_MANUFACTURER_ID  0xCD3A
> +
> +static const struct regmap_config simple_word_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
> +static const struct mfd_cell smpro_devs[] = {
> +	MFD_CELL_NAME("smpro-hwmon"),
> +};
[Lee Jones] What are the other devices?

The other devices are smpro-errmon (to query HW error reported by Altra 
Family processor) and smpro-misc (to handle other miscellaneous info).

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
> +		config = &simple_word_regmap_config;
> +
> +	regmap = devm_regmap_init_i2c(i2c, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Check for valid ID */
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
> +	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
> +
> +static struct i2c_driver smpro_mfd_driver = {
> +	.probe_new = smpro_mfd_probe,
> +	.driver = {
> +		.name = "smpro-mfd-i2c",
> +		.of_match_table = smpro_mfd_of_match,
> +	},
> +};
> +module_i2c_driver(smpro_mfd_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
> +MODULE_LICENSE("GPL v2");

