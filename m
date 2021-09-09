Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D353140435E
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 03:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4htP4lG8z2xtf
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 11:55:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=uAk80pYO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.104;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=uAk80pYO; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2104.outbound.protection.outlook.com [40.107.220.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4hss3k3Wz2xYX
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 11:55:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4VIArBQUrksoFc+xKO/t80x5GJqUErVbfS4zBkwoctbmR3Hb44uiP19E3YquqsCpdjxpPqZUGouHcPeSbaBuevpxqJYpUliwL1q8QH4mLPPtDMSDilv8T+8pG4tY/+cCNW+TQ8/ImaE0GCe/OS7Pjv/exaLCrKSehQNgg4R3yO0QcdTJRTeewMhgzchTl+igTQyHbt/RSZDcH5BBK71r7TW8BtXeTq5qRgXFNoLgc1sjARzInkpMyS+ASTqQ/y+jgjBOcpIucj86lrtjZNEmf1k6w3MEp3A/gS3wRXTSo399bO0fEZRCLPYS1Oersu5+A3kvyraWq7x8Tr+9P/x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2TKVV9FjS741x9jxKgpy9N0L1ADgpB1DvhCuzhjweqQ=;
 b=DqCTcddmhB/v4cLFVIWmhc5sG6u8qPD63zFJXJ7/lHsq8Am8IzkBM2bjjFFGAM1i39ZwdS8JvA29cehSOFNF+DL+bRL/PgIchV0S3dxu6WQ1NKedpdlscX1JOGPQkbcINOWuDO+VO/Jokto39ito5U2ZHMwy+0p2Q50zllDPLZtgVz9z/ORMFR8Z6UirK8G/huXc4Mn+iIQlv2tQVKGFyLylL3P/WhqYALm0XkRJRUkjhR1fe5t8vBord7VDfxo+qThMQTRd4Bhqx0QYxZsaJkGj2VbhZlAOWj/KyKSscYTheuRYKmvdpeo6v2g0d654Ezuo/2tTFRKGBanixnvDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TKVV9FjS741x9jxKgpy9N0L1ADgpB1DvhCuzhjweqQ=;
 b=uAk80pYOHCRxZqUfZtd44ce4MJ8vhtp0IjaSbPh+8KmUkuj8q+eP2ndgzW7P8PBd+b7bI7ICvg7l88w2N4rpiHgE0HuaVvgBSaQoAKzYhloxs4CYzIp1g1Gr/Q6Z77PKuhJenIpI9qTZYGBR5DePKQEvPn4Ur1E/97FSWptTbpk=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB5445.prod.exchangelabs.com (2603:10b6:a03:11f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Thu, 9 Sep 2021 01:55:08 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc%6]) with mapi id 15.20.4478.026; Thu, 9 Sep 2021
 01:55:08 +0000
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
To: openbmc@lists.ozlabs.org
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
Date: Thu, 9 Sep 2021 08:54:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from HCM-FVFX4014HV2J.local (113.23.111.132) by
 SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 01:55:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd80671-c174-44d7-1913-08d97334d9d8
X-MS-TrafficTypeDiagnostic: BYAPR01MB5445:
X-Microsoft-Antispam-PRVS: <BYAPR01MB5445FD9A145FAD5D07966D058DD59@BYAPR01MB5445.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jjlg+TrDgDFz3jp929N8DMoFdXKMeZ+2VG3la5/gPH88hUyw0u8KGNsxwIFpBzh3Wmlzrbe9EUAxSx/kMjQsS1Vw5YW0V2AAcsAx0pDnHc3A36hefWtsfXQJH/hGnFKVa5j12FFx6yZWfSGaBN8/VkTroG3NoKwX4spQsZ5tmum254i1VfF5BxkCswyxRJoYbrZOurK4kFyQy2rC3Jv0TTlCscW+fqXbncpEl92ilwIrs3Pl+qR8j58Y47a/7toz3X4xRupNQAUgxmcSP+RBrIMXObTcnRXJTJTQzMDGONd9yF3fUsKH9Lcoxf+pkzto1mwbqapXjknA5fLa6tesX/ttsbU7t867U7NwEzlD0pktYogKpZWAQzpIJbSe22Qwllvjw4/ZuFRDNLTlktHLNN71FW2I0XQiwriuqA3WaouLkuBC7H6cf/DWknxELsty052qU5zsP0Afi2y0dNdNSaTHlczF7uzmwUsQMNyhmtadvSYUBEsJ9ZA3Vr2NYLfzvNqzKfNT8+S37uw6vVdwDMmXZn9hyrQFJl+KI6TbNrkQQZftalZ2z9HMNDPNNDmY9g9Rmcc7OyLhZQjjmrsohWinaLzoR9LgMVbAk8aIfMdaaXvHltkTsrWSJMrBvxp1l5eZhn/OpGKtRtGaRtbaUurK1yP0lilqQyZ+hy2KljyiNvJtLE9iBdPEpHJfnXJwbssmgv2aU6ud1al2sFTaPtYtudvk9fpu+PM8Vo94aw7mtJnt05R06/zI7XSjojWE4FyVCR1X6kVfvy5/3o7P12CejHgK12WDXxTsLPFAbHKFbAwNkgWBQE1H2L/NaSlpoguzQPUYmYLma+FplGTB7tFx7Pz9P2kmtjPlKvV+2Ge9snikOBGvTBrw37aTnRrk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39850400004)(66946007)(6486002)(83170400001)(186003)(6916009)(53546011)(38100700002)(6506007)(966005)(316002)(26005)(31686004)(2906002)(2616005)(42882007)(52116002)(956004)(83380400001)(66556008)(66476007)(478600001)(8676002)(6512007)(8936002)(6666004)(31696002)(38350700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dytKTDNLUHZab1RkOWh5MkozZURVOVQvcWJFRjBHSHljaGlUY0xWeXJpVzlw?=
 =?utf-8?B?NmxTVnlNSHdvTm1sWE52V1pJZ0tBMnQzazI4Sk9MZ01GQzJNMkJ2dWpvZWND?=
 =?utf-8?B?OHkrc29NZkwxSzQraEkxbnRlTFh3cHV1QkFmei9CWnlYdDMwN3drTmFEdmVG?=
 =?utf-8?B?Z2JYRFY5R3IvZmwzY21XSFBObFhrVlo3clhKV2tFMFJMN2puUDh5NU8vVHNr?=
 =?utf-8?B?YmpxZ2dMT29ZeXFxWWJyWGNad1MyNlVsKys3UXpvSFQ0bmZ3NkIyd1NLQUs3?=
 =?utf-8?B?eXlYZWQ3THcxTDBJUnBSRjlrOTVnRUdOM2YzcTJUdjEwaGtQTmE3SXo2L29u?=
 =?utf-8?B?Q3RrNVpNYmNQbkZIUk1TdFpoQkZuOVo4TzZCUzRSdkwyTlZ1aXU5YW9ZSlNU?=
 =?utf-8?B?K2liT1NlemtxOWFxY1NHemd0bVZTWXFuSmhCMGxoVElhdHEvY0Eya1NZR25j?=
 =?utf-8?B?bFpkNy9UZWxTT3AveXZ2QnNKNTIzdkZTaFhWd2laaE1CeGJYaWtwOCs3L3Np?=
 =?utf-8?B?M0wxTUZLWTlYcDBqNElNNEpiT2w0SjJaUnlZaUE1ck1rMWt2NGRTYXJNR01t?=
 =?utf-8?B?c1ZzWlVmYWNPUHdENG5Ja2pxeGtTOWdYRE9yY21wdFZZaFlIOHNMeDA3emhw?=
 =?utf-8?B?Nlg5d3UwWVhxQ0Y2SFlwZWdRTDJlMGdPMHEwYWhRdWIrSjVzcVhRK0U2czR4?=
 =?utf-8?B?Wk4yUFFjeTBTTHJieVpoU1JYMmJZY3VLZjl5WXJYTnhpL2tXYUpsem80SjhU?=
 =?utf-8?B?R2JocTd2aHZTb0VRenZSQ3BVQit5a2ZyV01ES0plbUtwZnA3aENjQ2U0TlRE?=
 =?utf-8?B?NTdhTnJhSDhOUE9RcFI4SXBzdHVwT2ZuRmRPRlpZNmtGSkFWY256SUF4S3lM?=
 =?utf-8?B?Y0s3SjdEYktwVUNVTEUrM3NhN1hJMWViMERlMlRVRUp1NEFVQStHbGE0eE1R?=
 =?utf-8?B?RTc3RndjVVBxVzV3UUNmbWg3L2UxWFBDSFJBNWdWS0dUd2c0U0hFdFhhYndp?=
 =?utf-8?B?Z0lUSFBQZHB3citMMzdZckx6R1U1alk2bHUxZk9uRTl1QWxBNnlVdER6TFJB?=
 =?utf-8?B?a3pnSjV6TzlCMVJ6R2tOZEZ3UG1hY3ZaeEx2bnBjQmpkdG5admFDaFlMREkw?=
 =?utf-8?B?dDMwQjRGYXhNR0tZUHN4V2YzWUkrbGp4elh5L3pFK1gwNENqdkpvRkdYZVdu?=
 =?utf-8?B?L2tOYm96d0h2NkIweTFVbHVTYSs1c2lDYVlsZDBQSVpEYW1EUmNJUlRsOTY5?=
 =?utf-8?B?TzVDUTNJYWgxVW04QXU0cXN5QUtjTVo0Y1Q1dTZTZmhSQ3pVVkxhT0VUYmZn?=
 =?utf-8?B?VlVkOUFINDkyS2tCT3JFRVR6c3FoRUtJSEV2Y0RUR2FpMGl2NXNreEZ5RWJi?=
 =?utf-8?B?cFAwQmFqVjJwR1Z0am1KbW9PYkZZWHc4bmhzT3NNRmRNcysyWjMwZnN2Wjk2?=
 =?utf-8?B?T0hLaEZ1b0lZUURJYVhYQlBrKzRJTTQ0cC80cy91ZERVOTZSVjV3UlRtZ25x?=
 =?utf-8?B?UkdhaWVOem9DUG4yWUtvYkpUL1JRd2dmNmhzclR0MWZ3S0pOUVpVTjI1MGdy?=
 =?utf-8?B?VGhzRktMVCtMUmZLSGVTNWRWdHRFeGhaUnhHVktZSFlXU1lFYU5PU2kzK3dm?=
 =?utf-8?B?T0FBSTUyenQrSWJEOU44cC9GclVVSzBjK09FM2EvV09jM2kvVUxJSXRkK25j?=
 =?utf-8?B?cVJFbVhqbkhwUTROS012Z3B1L0FXQ3E5bnFxVnVldlh6UzBBQmNqdjB5bnQw?=
 =?utf-8?Q?2JG6/JNSR0buplvmHzHZC1DrGdVuE12MlIXRQ//?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd80671-c174-44d7-1913-08d97334d9d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 01:55:08.1276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yFiItF0zqnCss6R3kVNnznk1q4N5dlOmN1Cigv/GYfK44WdX1DCj9iQvPmkoQfr5HTmXGso9dLJgsNEm7F4J+yLwxOPPN1rDJIBzjMQfulHCa7XzP0Bk/IhtVo4Rbe+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5445
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

Hi,

Let me explain more detail about our cases:

- Our system uses a GPIO called FW_BOOT_OK to detect if the Host is 
currently ON or OFF. The Host firmware set this GPIO when the first core 
initialized.

- We have no problem in Host State with power control. But the problem 
is in the case of BMC rebooted while the Host is ON.

- Before the commit 
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0, 
phosphor-reset-host-check@.service  is used to check and update Host 
State in case of BMC rebooted. But after that commit, the service file 
was removed. This makes no target service to update the Host State and 
the host check is fail at 
https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e030ba0f618a4691de58d4/host_check.cpp#L109.

We would like to ask for your idea on how should we implement for the 
Host check when BMC is rebooted?


Thanks,

Thang Q. Nguyen

On 08/09/2021 20:19, Thu Nguyen wrote:
> Dear Geissonator,
>
>
> After commit 
> https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0
>
> when BMC boots up, phosphor-host-state directly checks  the host state 
> thru interface xyz.openbmc_project.Condition.HostFirmware.
>
> It does not check the existing of /run/openbmc/host@%d-on as before.
>
>
> I plan to implement "oem mechanism" to handle the interface 
> xyz.openbmc_project.Condition.HostFirmware.
>
> Which will use the GPIO interface to update the host state. I 
> researched the code handle this interface in phosphor-host-ipmi and pldm.
>
> I wonder which repo should I upstream the code? Currently, we don't 
> have any OEM repo in github to upstream the code.
>
> Do you have any idea to handle interface in bash scripts?
>
>
> Regards.
>
> Thu Nguyen.
>
>
>
>
>
>
>
