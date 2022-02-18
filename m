Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14F4BB372
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 08:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0NnD0Bncz3cTs
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 18:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=B2PoQFP1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::702;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=B2PoQFP1; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Nmk1qkRz3cRY
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 18:36:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtueMoccjiWaCx+UdzrxiFlrtoksvSB7QAZ247FtwxjtVE3MrXcmqxXqgh9FM8ZDM9E+c8HwBN0cmu1dEXl3niCBSV+zvutiPWSkEABgpXb0WNjrp2jzJQsZSg3wAJAGbho+MmvYdbjTvQn3u+R5FIrq+kkIS2YVTPEuKmfVvBYN2s3v0BUtdVs39KY4wOUEAbc38TAZrUOvDvqXEV3P00klQjzoi6CXD2YBhx1Yzy8BngrU+88WsNFyyaBNKcWZ++4Ossue1zNovieRiMt3c2r03tWvELgCzLS5aRlBIHtR3+UcTGbeKypIwxuPud9XbFPf+Jrvb4UnVYbCMcjgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1CuM/e632nieM5TfhjuLo8i8imjud/kRAMAVBxEdEw=;
 b=liFw3/Zu0NGpxnaGeEf1tc17xMVSeK0Y0cFUOYM555eEX48IV5M3punfS8+XUDpBlGQo9igATtdsJSQCsO5nZN22bTpaAT+ZXrNtSoSwFnKIT5lrCoJ+G4LGCWCQLFmhSsr0Jx9pnV6LNwP14CfQLJZg9MAo2ArRk1bUblKCU9shErMIMvypvznllCrUxCXNBNSH3zbYP6LS56haF2czbLjizDVAn0QtBvJbvPSsQS0yD9OxFX5iXxwA804XpTFHBZxBKI8KUjZ9F9figcqgkVRL/IZUkn4ht1SlVJDXWH+94QcBoKnUlWQ7QCtsnoqUAyAIBIXL4NHadTLBRye/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1CuM/e632nieM5TfhjuLo8i8imjud/kRAMAVBxEdEw=;
 b=B2PoQFP1R6UddUb3KSdlBjj87d2SDa1ov4A1xxl/f6oEVnAwgXwHL2+L17lBMvBbwfHcYDW7eEwLtu88cYqqv4o9tnMDFvDSLNEEmWhWQiu7VikT16kz+8CWpu09p8AlfInS887dosm44r8naevA+ysQjYxLs6G2uIGsENefTJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4616.prod.exchangelabs.com (2603:10b6:a03:89::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Fri, 18 Feb 2022 07:36:13 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8%6]) with mapi id 15.20.4975.019; Fri, 18 Feb 2022
 07:36:13 +0000
Content-Type: multipart/alternative;
 boundary="------------3WsMDZtmcIRga0hY17OYPelW"
Message-ID: <f5183918-e83d-0ba3-397f-bdddccebb8d7@amperemail.onmicrosoft.com>
Date: Fri, 18 Feb 2022 14:36:06 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-CA
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
Subject: Check on bypass phosphor-discover-system-state@.service if BMC not
 boot from A/C
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
X-ClientProxiedBy: CH2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:610:54::28) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22b9a899-576b-40ec-5e54-08d9f2b156e2
X-MS-TrafficTypeDiagnostic: BYAPR01MB4616:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB4616AE14D955C5BB6E046BD78D379@BYAPR01MB4616.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fr0sMJFKynm3O+7pNhUaKnKK16Sf9L7R/Zq5kKoJJhgqJogh4/rGrlyrAD6zwoGQCAIYiCjwhpITqrrTll0W5EpKZy3Ul68w62C3PwBEulOSf8rcMSB1NC5hseZN9wH7FOYanndJRS/MSBScAHkyDxfJGcIzHkTIPV+hoJLPjHi1w1IP65LuDc8VIXBRgLBNmaTU88V3u/UnUwn1hL3inSgz4zzCuT6KUbqOa3L1EjsiHfzgnbk3xSLsrKzkVTb9AA6nhIgqmVWsjLJMrpgoS0Ep0yBVQno1I31jRbXnGGonl4M7BBD3oRLQRAzqjqoYi9v4W6sdDQpqKrJBA256LwMqS8CE3EpOkI/P/l1q2RFuJw8opZAkwyvOLXxpbu5eRthQ31bpLPjPfYHkR5QcqC9LHE33+uLkGnsOJmhSNBslFdN/+OyPBINy4TivRZm4NE6fh9vyjK+AgB53zQ98PuPgDpYXFyWaLVlogVn5bdNfQOXd/imYR/MRSgYgGzvOCYpmne6wJ/g54aWodw1F9S+gEcAdqTQZ7favihKPI9RjGMLsqkjPEi9y6tisY0o03uieKXFQFME9TXJMfcMisosE49IeuDuFWXAmaHOhkevnM9Nxxf+TdQ/rzrUmbfmPZipRzXwM1WKjuPYEmnLn8MuR4LUA8eFNQjrhnPjHdcIq3HbpGkmyvoQQqUDqzJyrXONBm8EGAj8pbPSPc/tcQ7U9tUdZisZPgqCATFGyrNszJfR8oTC6+zA9QEHIaP0YTVRyilA6VGfpSd28PY1byFz0d3h0PrmF2W2eSPtc3bbAjkJAphMDBbr1hpf4kUgq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(52116002)(33964004)(6506007)(2616005)(966005)(6486002)(508600001)(42882007)(31686004)(316002)(166002)(83170400001)(83380400001)(6916009)(6666004)(8676002)(66476007)(66556008)(66946007)(2906002)(31696002)(8936002)(38100700002)(38350700002)(186003)(6512007)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGFncmZRY3BGdTBFY21qb1JnaWxrNHFyMkZFekl2SzFWSXp1SDZzQjNBQWxF?=
 =?utf-8?B?Yno2SndYRXBzWis1dmE0STl6dUxnZndFbTI0NXFoZ2hjY3M0bGZ3V2J3dHBI?=
 =?utf-8?B?VWY3YmR2M0doeXFreUtITWtGOEdJc21UMi9aY1N6Ry9vNnhqRmdoTEFydW9I?=
 =?utf-8?B?NXp4bS96bjNQMkNSRVUwZFFTaWhLMncxMTNDNUh5ZTRGbzZuejVJeHEvTW14?=
 =?utf-8?B?bjF1RENYL0l4WUdpQ0w2Y0tFOWVRQ0FxZXYzTXRmL0VKMVdFT0lHME1kRFJo?=
 =?utf-8?B?ZUZVTVNMWE5ybFN0K3hTQmtYeHVNd2lGZitaOHA0VXF6SGlIMThNZVllZmUv?=
 =?utf-8?B?ZjFYOUhucW04cUJYQXRFVXlpNHlVTk9UYk81RHo4NHdlZ2grMFV0ZVU2RTBC?=
 =?utf-8?B?RHFDODlwemViSzRFcC90ckw3T3RrQ3VwVmE1QlY3MkVOeUNkR1ErQ0JCT3M3?=
 =?utf-8?B?OGhDZGJ1VzBpVkE3N2tEdkNwMEVhSklFSVEzLzQ2STZ6UGJ3RE1lRkFLQVJi?=
 =?utf-8?B?c0dydStLODJUNWxUZkllbS9hZG80U0tselhuQWl5b3VNVy9FUzV5K2R3eUFK?=
 =?utf-8?B?YVJUNm9DOVN3aHYvMEcza0ZtK1lmT01OVzRyNXBnay8rY1JJTVFwOWhFUXht?=
 =?utf-8?B?dDNtZGMxNVRZY2RIVXhFeTRKdHlnWmlta2FxZ1pSNkJpRWh2Z0xrZTBBZUR3?=
 =?utf-8?B?dHlwOTlTYUlLQ1BtbG43ZVlKR1Y5dE8rK2VmeFlRQnlPaUl1eFhGelVBQlpF?=
 =?utf-8?B?R04wcmRHWmtOTStLOFdRUXBFM0lacW5FK0szYzFiQ2lmVmlUamplK2o3QStS?=
 =?utf-8?B?STN4dm5vcmRLVC9USDNhOTRCSWdyZWpPWkpjWUE3WXF5dDY5SGJVRTVqTVFH?=
 =?utf-8?B?MFg4STdFSTBTck94THQzNDBsb210YTl1anR4ZFRSWnFjZS9oVnhmQlcxQmpC?=
 =?utf-8?B?RkNqVmdlbXhtbWVOTlRKR0VSWHgydEttdmlvZVdaRGEvWE1qM245ZTRnL3lh?=
 =?utf-8?B?QXNQTTk1bHEwc1Bnc0c5SVczbmJzd254T2JzMWpiSmVzZG5yeUpVOWFGMVlN?=
 =?utf-8?B?VWdZd2Z5Ukt1TWR2VW9jeGIwUHdSa3NmUW1yRHVyQ0xxVXJSZGh1M3RqQUQ3?=
 =?utf-8?B?Wk96dER2MHo4R2tJekhvMFdXVlQzdEJuWndvdjJINUd2anhhdE9SeitPaFZq?=
 =?utf-8?B?ck9vK0hBaU1taU5PejBFVG05SHlCeWVOT3VCVXMzdDU5cURiY0NpWEhDQnMv?=
 =?utf-8?B?T2NGVkQ2N0RhOU5uQXhZdnJ6bnU3eExOdEJPTnFXYUdSUitFbTNxYWd2Yjk1?=
 =?utf-8?B?dy9Nam82QUlUVlh0TjlXNjM2WXd0a1puSklkNzZMRUNodDVXUDZBcUptQmtw?=
 =?utf-8?B?L1lldDMyS2xCWWFHaHllSk1zdGd4dVR0aHQvYkN0VzNwRXRXcm9RaGk4cUN6?=
 =?utf-8?B?K0lzMkRINVF2MGdaRGYxQXJreFNHc0dmcXJVZ2JieXd2Umd3eDNYSXh2eXp2?=
 =?utf-8?B?alJSZTdBWUhXL2ZZb2I1SWFNbFB0NE5ZVDJ4OEVRamM0QlpCK0xZaU1OcUQ4?=
 =?utf-8?B?KzJTSExvMDN2a3VGenQzekNDajJGSHNhdGc5dys4NFFJU2pWWFh6SVl4emxr?=
 =?utf-8?B?Z2Y3VTBMbTVVWWl4NDk0ZjBuSlhKVjRmd3h2NlZtR2lXQ24vM3NjS1JTRlpJ?=
 =?utf-8?B?Zkk0Y0VYaDhXSUltT2pXYXlBSm4zM1J3WE0xZjBxbTVOSFZRWTArZ3NGZHFv?=
 =?utf-8?B?UG94c0xEb1hKblEyN2k1ZlJVQzQ2RU5KRURjSkJwc3lVaTdxRWZ1c0ZJU3M3?=
 =?utf-8?B?bysrd2lPTDlMZzBxVUQzOW55d1lUamxlOG9tcTViK1FSSmY4bUJsWEdYQVRT?=
 =?utf-8?B?WWpoeGtqNFFxOGVPcFNTV3BzRy95djFsM2plcnhRb1NaVTFtMVk1TkpxTG9J?=
 =?utf-8?B?UG5aTTFwR2VGVDdXYUh6aldDM3Q1Nk1OY1VjZUxPaFF6SXlTWi93TEs4V05j?=
 =?utf-8?B?V1o0WUNMbkY2YlExSS8zQ0piU1JQR0xyeE0rMVowakpHZ2ErMTE4WDlNTXhv?=
 =?utf-8?B?SnE4QjlWTDZrTFk5NGQxU1hDR2RlNk40NVNXT2ZkUGpqYmpBYnJwY0FuWElD?=
 =?utf-8?B?T0Z4SlVOSG01UHQ0V2UvQlNMNVVqK0p2M2pUeVAvMnRDRzdrZnBJeDZ0T1ZS?=
 =?utf-8?B?NXpHNXpJVzB4NFIxdGlQSlZMMEJEcEQ0MVFHRTYvTW5WN3VGWngwU1IvV1Vt?=
 =?utf-8?B?QjZYZ3FCOWZwTmFuejlTTmhtaGlUYzdEdzEyZUNMZU1mcG5pN0doSEVPUlJu?=
 =?utf-8?B?b0lrWWF5ckZVb3ZkeWQxZWRuTFJ0akVhOGc2elZ6cXZBcUZ5T3BuUT09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b9a899-576b-40ec-5e54-08d9f2b156e2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 07:36:13.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWJSZIACoDkjnU/33EYaq+WjompKZmByLvtymF51S7c+herwE7Hk/edsNIsGXtZn12f7W7qecDmsFr1UMw2NI2wkpZKhxgH9RxnT6Esm7pUSSgcfR5SRIOvV/iWNUkPp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4616
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

--------------3WsMDZtmcIRga0hY17OYPelW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We have chassis power policy that users configure so that the Host power 
can be recovered via the setting. In phosphor-state-manager, there is 
phosphor-discover-system-state@.service service to check the power 
restore policy and recover the Host via the policy users configured 
(always-on, always-off, previous). The problem is that when BMC is 
rebooted, the service should not be executed as Host power status should 
not be changed in this case.

Previously, we added a patch in u-boot to add reboot cause to the 
command line, like:

    # cat /proc/cmdline
    console=ttyS4,115200n8 root=/dev/ram rw resetreason=power

Then, add condition to the service to just execute when resetreason=power:

    [Unit]
    ConditionKernelCommandLine=resetreason=power

as now no u-boot patch inside meta-<vendor> is permitted, this approach 
is no longer applicable.

Since the BMC reboot cause feature by Tim Lee at 
https://github.com/openbmc/phosphor-state-manager/commit/2bfb1efc4bc7e781224e19c05b51e6675f13a488 
and with the watchdog driver support, we have the reset cause 
information via both dbus and kernel /sys:

    # cat /sys/class/watchdog/watchdog0/bootstatus
    32

    # busctl get-property xyz.openbmc_project.State.BMC
    /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC
    LastRebootCause

    s "xyz.openbmc_project.State.BMC.RebootCause.POR"

I would like to check if you have any idea on how to use the above 
information to prevent the power restore policy executed in case of BMC 
reboot.


Thanks,

Thang Q. Nguyen

--------------3WsMDZtmcIRga0hY17OYPelW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>We have chassis power policy that users configure so that the
      Host power can be recovered via the setting. In
      phosphor-state-manager, there is
      <a class="moz-txt-link-abbreviated" href="mailto:phosphor-discover-system-state@.service">phosphor-discover-system-state@.service</a> service to check the power
      restore policy and recover the Host via the policy users
      configured (always-on, always-off, previous). The problem is that
      when BMC is rebooted, the service should not be executed as Host
      power status should not be changed in this case.<br>
    </p>
    <p>Previously, we added a patch in u-boot to add reboot cause to the
      command line, like:</p>
    <blockquote>
      <p># cat /proc/cmdline<br>
        console=ttyS4,115200n8 root=/dev/ram rw resetreason=power</p>
    </blockquote>
    <p>Then, add condition to the service to just execute when
      resetreason=power:</p>
    <blockquote>
      <p>[Unit]<br>
        ConditionKernelCommandLine=resetreason=power</p>
    </blockquote>
    <p>as now no u-boot patch inside meta-&lt;vendor&gt; is permitted,
      this approach is no longer applicable.</p>
    <p>Since the BMC reboot cause feature by Tim Lee at
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-state-manager/commit/2bfb1efc4bc7e781224e19c05b51e6675f13a488">https://github.com/openbmc/phosphor-state-manager/commit/2bfb1efc4bc7e781224e19c05b51e6675f13a488</a>
      and with the watchdog driver support, we have the reset cause
      information via both dbus and kernel /sys:</p>
    <blockquote>
      <p># cat /sys/class/watchdog/watchdog0/bootstatus<br>
        32</p>
      <p># busctl get-property xyz.openbmc_project.State.BMC
        /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC
        LastRebootCause</p>
      <p>s &quot;xyz.openbmc_project.State.BMC.RebootCause.POR&quot;</p>
    </blockquote>
    <p>I would like to check if you have any idea on how to use the
      above information to prevent the power restore policy executed in
      case of BMC reboot.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Thang Q. Nguyen <br>
    </p>
  </body>
</html>

--------------3WsMDZtmcIRga0hY17OYPelW--
