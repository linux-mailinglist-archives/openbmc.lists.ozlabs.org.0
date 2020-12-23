Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A222E1DE9
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 16:34:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1HLN4tRKzDqLg
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 02:34:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.95;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=lQqUUHTN; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680095.outbound.protection.outlook.com [40.107.68.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1HJy6df3zDqLg
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 02:32:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ47ad9uKwdTLxEF4fmLmetX4X1m71GxvN7hqraEt7dVwUHAORpjS6Jk4VYaF9fvHy2IOLsalbsugfACRj9egWNDaC7UjbETOf51UIE7m7pBEQVdCVY26vaORSGW8dN1sS2Fx0ADYUXGSsNR2dNgFgAfpyKyF+HlNmFnIbVkx07u29gXiETv4C3v4GuqG2IYIfbMym0Il6ZgzYTQikqINPEed/7QcGI5+15yeewzj27Mu1pMpp5hLJ3PEZAemxlsmknHD7IHVO2LV7ssNjHTT+SgyU9lXrnyZwwOX1uGWiBSlN8+vOzS+pnLRIA5En2a14RNNSBbMhSuixg3qh1qUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctiKoClYy5dtHbQ9bvxsOvYFMRiVEytpDKhIpYjqaSg=;
 b=PruSTI/Ob9550wFTqylM386ymR6NCNPaXzQBXMTOol1YssrX9+M5VxQ5rwh2sXt+BO46+Is0ij5ECCp6wACBnP/AZglwgZsSUWVfNjLzq2mAnUqGaZB7RuXR48fopwt+22z0YWaAv9Lyc4mh3Dq5+zNC68348JAwZvpDoO/q8Z2WvOOqZFPAxY1DQMFtSZOfb7V4ypCjvOtsX7FOH/NB4newrdofYGJ+zzDK+6rDq58EvhJ7wu1OjPHP2cTQHej0NZekawWFXgNllxxuCqrUpmkWc6FxcIWcqHo4c0aQRL91XdH4T1frahTCnL4hdy2k/66RnK5dneNMeCSmeaABgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctiKoClYy5dtHbQ9bvxsOvYFMRiVEytpDKhIpYjqaSg=;
 b=lQqUUHTNF3VlvlfRhv+h2nwtox9yoCioK41Hb67MifZpmkZNJAcGGe4OVkLW/BL2AUGS4wuuXZ9sEY2/LyCuhxfinxkacIJMimiKedaauOeQcqNMcYnxX8DseoIZsIfQhl2tmoeCjGk1bSeaJafN1X0HnjW3qYmkZe16UhFKcjQ=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4745.prod.exchangelabs.com (2603:10b6:5:67::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Wed, 23 Dec 2020 15:32:37 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 15:32:37 +0000
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
 Nonfunctional.
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
To: openbmc@lists.ozlabs.org
References: <44f90a87-391d-214e-0801-62e9429b3c34@amperemail.onmicrosoft.com>
Message-ID: <933d55f5-5cd5-9b41-e0e1-50c0ee43b67c@amperemail.onmicrosoft.com>
Date: Wed, 23 Dec 2020 22:32:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <44f90a87-391d-214e-0801-62e9429b3c34@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:6dc1:8edd:d928:e668]
X-ClientProxiedBy: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:6dc1:8edd:d928:e668]
 (2402:800:6344:4074:6dc1:8edd:d928:e668) by
 HK2PR03CA0065.apcprd03.prod.outlook.com (2603:1096:202:17::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Wed, 23 Dec 2020 15:32:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec383e0-3fac-4b4b-3f5c-08d8a757fa3f
X-MS-TrafficTypeDiagnostic: DM6PR01MB4745:
X-Microsoft-Antispam-PRVS: <DM6PR01MB4745B2C7D0767DA3C3BEE82290DE0@DM6PR01MB4745.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oN+IIgwr9wkL1mwVySBhCuGkJZXOIHp5aKW3tDRhZeAl94o2D/IerR7rQ0uwMUKjZm921OJhVkJxyQtdtKGv6wMkZrelCgepy7yI7toIN43Z8IeULQsvHECnJc8PilqMvbnXxLX43EI4k0QMfhXIkas9XCI31GsWq0miRxp837xkOD8gnuQ1KK08FL8Wtaiub38sBQmT1WN/EvOwcLKFJfno9BvB8B2lQ/4/frUv3GapzQfg3z0ZDPGspNIq+t6Rg6NX06/N8Zn3L6vSbn4Y3Fpajsm6p0eRTaND3KuqwMvD2K/lOHPjTLcmYA2sEUT5Blywo3z9cNzOE1fhlpXz2IEyTgIWUypzKEfQPXZpJz+cRQ/zku0kB5Wgo2/VoFtT6MOpDPU84DvGm3WKl0VjZyamde05QdTHuqIk2W+wgETrP7ieiW6e8B2qt6wvJiKyzVrn/z4kgBisQV5Vuo7LW+twvGQtdCTG1OUXs8kvgAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39840400004)(19627235002)(83170400001)(8936002)(83380400001)(6916009)(2906002)(31686004)(52116002)(186003)(5660300002)(66946007)(31696002)(66556008)(6666004)(66476007)(316002)(16526019)(6486002)(53546011)(42882007)(478600001)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmVDZERjMjhqMko2aWJXOFVjNWFLVGlyWVE5Z0xUS1Foa2pNRy8vcG1WOHR0?=
 =?utf-8?B?enBITm9aWmJaWmxpSzJuak1mNlRkb0hCbFVrUjVsZHFhMk5EWFMxV2VjdXBi?=
 =?utf-8?B?ZnYrZmVxSVpLbWFSVTUzREpwTzFBeUkyNDF3UDZoMXNybFp3SXZhWXZxZ3Zt?=
 =?utf-8?B?UEI2T2p0MFRCSHY3cXFQd04zZUJFc1B2eVdsS01pYmx3NFZmbnJoL2VHS3Yw?=
 =?utf-8?B?T1dMNzR4WXM2cU5QOHoxOWVZc3RYM0tDaSt6SW1IL085MUhWUmRCNlIxQnJ6?=
 =?utf-8?B?OE56SFlRRDZSUW5oOVFPOTdaV05DZVZJSXB3V2xrNVlLVHZqMHIxOXRxNVlV?=
 =?utf-8?B?T3BrVG9pV2lpZTU4dlA0K0FtZDVGN3hnTUJkNmd4N29kcnVNTmVvVUlLWmF2?=
 =?utf-8?B?WWptajc4dmxOLzFQTDVJRDFMcmlzVi8xQ1puRkk4VXk5N3ZrWXRsaUg2NTY3?=
 =?utf-8?B?a2lPZ1pwUVlLNllKNlBYTzAzVFFUL2R6cWZvQ1lPUGdSY2ovWS9rRUlzd1JJ?=
 =?utf-8?B?M253NThBVy9JYlorZ0dHREQ4UVdLM1dwek5wamRJdjRUWTUwN0h5UCtRR1VZ?=
 =?utf-8?B?UmlKamhsSStuMUIvME9jNFk0MDVKUERaczhSUkNwM1hJdjVINHJhVml5bkpv?=
 =?utf-8?B?VGduVm4xOEFDOUhMOTNJYStRZ2g5aTRnUFdTaVp1OFpJT3V2NmpVNTl0TDNY?=
 =?utf-8?B?dWVVbDZ4OXFXOU9jRmFhU3lNMllQcFlYQ1ZsMW9mLzRJYUJ2blVCTmVpNzFJ?=
 =?utf-8?B?REhhRnpKM09FTHFIN1JVcXZsVHk2dWV2bUFQa1Q3RkhidzIzenFMRkN6cjJY?=
 =?utf-8?B?V0dGZWFucmtpaU4vNzBGa2h1MEtYMC8rVjNUTUJBRnZMUFdJajVxSlliOUdJ?=
 =?utf-8?B?VFpMdjVHLzFPM3hzbXNidUJQSXdhOXlwSngyY09ub3VzcWlrME9OS1BXelpx?=
 =?utf-8?B?Nys0eENmSllIeTJyYlNKN0IrVTYxbFJLbC9PbC95cGozckw1MU5tQ1BDNlRu?=
 =?utf-8?B?aHIvRVJub2o3SVBQNEpBZ2Ewb2p2TGtyeGdhVHVOWFVmU0l3YmRiVW03RVNJ?=
 =?utf-8?B?cThoSXh6SkNFSTRMRmFUMWp2eXdSMHJkaldvZUFHQ3prYVo2OHdPZEU2VjhD?=
 =?utf-8?B?ZS84VDVrallwS0dheWErbUQwQW9Hd1NpclpBVmFJdFpteUx1eXJmZVhGZUNJ?=
 =?utf-8?B?ZzZHd1N2ZTZiQjBkaXltZlJ0YVJWNnZxZzFvMUdxRThYWk9MWnlUMWRKZ0Q1?=
 =?utf-8?B?ZUxUa21ZaUwzS2UxazFOZmtEVHdXR1lKNHNOREVXSEJBckxyZDNjSU51WktV?=
 =?utf-8?B?ODI1VFlaM1Fpa2U5MVd3bUlCRzZyYytXSG1vTXdiMXVTZ0FvUk5KbmhZczl5?=
 =?utf-8?B?Z0Ewbzh5SHBmWnYzZXBUN1V6Q3paTFdxN1NiOWF0dXUwdnM5NmgxRjhLVmcv?=
 =?utf-8?Q?fWuRCJ3n?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 15:32:37.4358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: eec383e0-3fac-4b4b-3f5c-08d8a757fa3f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fSXBcxXO1lskQyVbTgNFtgGPGVaSh6Uirknp6IkvtSs4ggWQ7YMdCGvWhVryO86KK+TWo+WNUA1kndUGQ7hkn0CFWORWfFP4CT6XrAD9Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4745
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

On 12/16/20 14:33, Thu Nguyen wrote:
> Hi All,
>
>
> I'm working with Fan sensors on Ampere MtJade platform.
>
> In this platform, I have multiple fans which name as FAN3_1, FAN3_2, 
> FAN4_1, FAN4_2, FAN5_1...
>
> I added the configuration for those fans in phosphor-hwmon and I also 
> added option "--enable-update-functional-on-fail" in phosphor-hwmon 
> build flag. I'm trying to set fan functional to false when unplug fan.
>
> Flash new image to the board, read functional of fans. The time to 
> read dbus property is about 0.05->0.1 seconds:
>
> root@mtjade:~# time busctl get-property 
> xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b true
>
> real    0m0.078s
> user    0m0.002s
> sys    0m0.032s
> root@mtjade:~# time busctl get-property 
> xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN3_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b true
>
>
> real    0m0.044s
> user    0m0.001s
> sys    0m0.034s
>
> After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2 
> is set to false as expected. And functional of others fans keeps  
> true. But the time to get dbus properties of all fans have a huge 
> increasement event in the working fans.
>
> ~# time busctl get-property 
> xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b false
>
> real    0m1.189s
> user    0m0.001s
> sys    0m0.036s
>
> ~# time busctl get-property 
> xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN3_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b true
>
> real    0m3.285s
> user    0m0.010s
> sys    0m0.028s
>
> The "ipmitool sdr type 0x4" commands is also failed because this 
> increasement.
>
> ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr 
> type 0x4
> FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
> FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
> FAN4_1           | 2Bh | ns  | 29.19 | No Reading
> FAN4_2           | 2Eh | ns  | 29.22 | No Reading
> FAN5_1           | 31h | ns  | 29.25 | No Reading
> FAN5_2           | 34h | ns  | 29.28 | No Reading
> FAN6_1           | 37h | ns  | 29.31 | No Reading
> FAN6_2           | 3Ah | ns  | 29.34 | No Reading
> FAN7_1           | 3Dh | ns  | 29.37 | No Reading
> FAN7_2           | 40h | ns  | 29.40 | No Reading
> FAN8_1           | 43h | ns  | 29.43 | No Reading
> FAN8_2           | 46h | ns  | 29.46 | No Reading
> PSU0_fan1        | F5h | ns  | 29.60 | No Reading
> PSU1_fan1        | F6h | ns  | 29.61 | No Reading
>
> real    2m43.704s
> user    0m0.046s
> sys    0m0.057s
>
> The cause of this increasement is when it failed to read one sensor 
> phosphor-hwmon keep trying to read the sensors with the retry is 10 
> and the 100ms delays between retry times.
>
> Should we reduce the retry for non-functional sensors?
>
>
> Regards.
>
> Thu Nguyen
Hi All,

Any feed back on this?

Thu Nguyen,

