Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC045E404
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 02:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0cch2LzDz30CK
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 12:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=BqncU6Sd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.91;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=BqncU6Sd; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2091.outbound.protection.outlook.com [40.107.237.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0ccG36zNz2yLJ
 for <openbmc@lists.ozlabs.org>; Fri, 26 Nov 2021 12:29:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN4RbyZ8/3sITr47RuSBeSxdFWe3xhndeJGVQar9Id7yvbOJSy0hasDe7/5mabz6ryarUm5zMyUKPM4NDGezq8W9P4guZKXNx6bjrXLqAWjHqfIJ4wKkiiRpJDWiPzlt7nI3+yRjMQYOucvFfyZ4FShlQZon4JZwWD7X4pLjitsUydHPTI7Dqzxzfu1IVUFGs/D6DOIv4/N2ad2eHmPShzbqCi7AqBvEuOUf9VpPBusxaD3PvEJsiZJYoEVanfDKt90E8STlafD5Yk33zOqCvICnwSPopcIkd/d5ppXky7nNeqhLJ6dU2WGqqmkafDjPKqxOuKriGKpezWLwniulhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVZNFatTRXNFQCiPeRlxUUkin8tEHZ464iMK94dh3R0=;
 b=YJEMFYcmJEgnuhaoWFp+eWhph2Y4PJiXr1CzhgncHpuV6Ml+G7Z+sJg6yCfepRlQoae+oMrRj1g+yAaz11ZMlKimdwRNUKSXRdarYoWMBpI+5sKTu/YZgOI3ODHYuT56wX0lkP/xoBDuZCuMhH/k5yaan2TdCrIa96MzW38Nw0l6jz8N2DeWIfllt8lxpDHftRqutZUGgoGYFTqMzEPDhmcIe229l/QlmOT6SL8Lzh3RllSojKF/OuvVVv0+INHSsaJKq73mgqYqOhyfyxyIGarTmKQfbIf/4zgtu0VCf2ybRgmByKi2xqg6+YNER0hMgLtrEGsHTh2k08j1fBc85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVZNFatTRXNFQCiPeRlxUUkin8tEHZ464iMK94dh3R0=;
 b=BqncU6SduMqvqcjhsKuz28i28aZK86OxYCDwPKClCj2fow5f1v9f6pKfEbeMnzlqGlgnv3SLpduiX+XvcnxioWP9/YVVPA5NrES3SQW3LcIQgLHc0sDARSO7fKVRVYw9xOV996BqovhF3vXMkbiuikSlQu+h+6+ohoNmmE9Po9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4648.prod.exchangelabs.com (2603:10b6:a03:85::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Fri, 26 Nov 2021 01:29:28 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::6476:8a6a:53f2:4bb4]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::6476:8a6a:53f2:4bb4%7]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 01:29:26 +0000
Message-ID: <0e67b572-382d-d9a1-0cde-a01177ce9e63@amperemail.onmicrosoft.com>
Date: Fri, 26 Nov 2021 08:29:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: Check on BMC Reboot Cause
Content-Language: en-US
To: CS20 CHLi30 <CHLI30@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Tim Lee <timlee660101@gmail.com>
References: <0653d3ba-7bd6-c01a-741e-8b8cf5ee3655@amperemail.onmicrosoft.com>
 <HK0PR03MB50907F00CC0A0305E6269801CF629@HK0PR03MB5090.apcprd03.prod.outlook.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
In-Reply-To: <HK0PR03MB50907F00CC0A0305E6269801CF629@HK0PR03MB5090.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.140] (1.55.198.3) by
 SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 01:29:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0d5c81-5f0c-4326-fedf-08d9b07c2e86
X-MS-TrafficTypeDiagnostic: BYAPR01MB4648:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4648BF6AA3C3065BA836DDB18D639@BYAPR01MB4648.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9x5qWg3lXf9RCe3fI0P9BrOkNX5aR/xZ+qocUYrU/sMG0yofCegYLZeu5Zf8UkTBWH9ZLc2bvFjS//fBhgHvEo2wVBbMCr5USBj9FOw3GbYNvUG9y47vhDx4LK5Gr4ezMoopOZwBkcuZIKGiKe3tQy83cE+8LYd+DtWdQhXfi6pImVbI34R2rGq60uVOvP9egVoXPKylMFL8ntGoTvBF6aO6JdaCRjuLJNxKg4+nqjaZDtMt8ROvsBL14x3tkxzCLfJzqMXp5DvFgtNo1tLqamqUwwjT0clERqhIV8nmsGLU6TElbjGbnWIzRXo7WxPKobTR4KvyiCm7wyI5lLs0IKAnkhTGZFxW79sBYDVya8UFCDVkxvfop62HpcoI2fNYSeIwXgL7+9Gmk0mJ7bJUHajE3muULvVb7BS3wmGg1k56JUUOuKuI6lry2NomcLBbB9WPLT4GQrPz2l8+xlUtPkexB8iv1IrMVO94agjUxSZIhI3yK8cnRUpK0D5eqALVQJ4xdPanDy3W3P+UogeW0ORivd+pu5hf1AJUZMo6Ggneniwb26pMH5lRT7Yd+ROe1ioW8xBo5x2FyPkKdYZVM5vQSHUtaKmEWhMdOT3cFWF664A/f7wDIVZNZlON1RgoIkWUTMve7eGlZCoqRRf7tCcsVs14z+lS2IXNcNsrGsqcUvwfZJGOKtpOmp7/w2FKE4YJxVleiVHllFJPWlLW2Uowms+gsiK9qQ+jLXDSlnjHU7ehZXFvXJp6OSNDhYc+eP4U7MxQNlrh3uJ1lx7rKeef+I97DsiuU1SyQpzxndJKJgzxJi9muQ+eyGT+Yl8cHI/yV2D498kM5p+XYH5IhivTYfhjwy6PemDsHGKL6AGDuQjhhHeSUw2G4r85RJjY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(84040400005)(31696002)(53546011)(8676002)(508600001)(8936002)(38350700002)(38100700002)(83170400001)(316002)(110136005)(42882007)(5660300002)(186003)(16576012)(31686004)(956004)(6486002)(2906002)(6666004)(2616005)(66946007)(52116002)(83380400001)(26005)(966005)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZSdWg4aXI0cFF1WWNJT1FPTUd2Q3dreFdYeU05NDBhMWJBdStoT0pxRXBN?=
 =?utf-8?B?Qzdxc243ZzZsczgyWTRWWnVYbE4vdzNaRW5DemkvWXAzejV1bmtYMzFBeVJU?=
 =?utf-8?B?N25hZXllSTBzWkNIL3ZMV3U3WHF4VUVuUjBQMTYrV0x3R210UmZ2cGhIMS8y?=
 =?utf-8?B?Z3pUcTF0MytjVUs2ejlCMzFPU0JaaEFuYlZzMFZiT29yVk9GNDVmY2sveDlP?=
 =?utf-8?B?b25kYk83RENtY3NkWXJuM0RQdDBVOEJ2SCtkVExJcGtXNTJCUUd3dVFuUFMz?=
 =?utf-8?B?ZXdzaHFETE5vM29meGRMUlpGNW5GM2h1L0F2ditzMGVtMTRScDIvSVl5a2w5?=
 =?utf-8?B?OWgxcDFJNlBpc010ZVhVdVRYWUpLeXVOUW1DNG02czY0YVNpNHRFQkZRdmxZ?=
 =?utf-8?B?MmhicEdFVUhkRUJUamFMaVIvRW4rNWlEZzVlOFZVYWRuVncwSkg1YzJmRUt5?=
 =?utf-8?B?RVRGdnhISGNkT0Fna3RVc21LUFRHa1BsZ1lvWkg1aGVmOE4wcTRLbmtHckJ3?=
 =?utf-8?B?dFlXZEtjNWVkY01UaEtaWlJoNkdWN1FvWHRoUlpmM3VOai94THBlL1o5VWJB?=
 =?utf-8?B?T1ZjNkJpbWtRb1R4LzdlOWxNOU1kWkh1TDhvT2lYNEhZcDU4Y0NPT1JwTWtO?=
 =?utf-8?B?am1UU1pIS3l5dWJsRXd0QzlYUjcvQ1JrdUhILzVBcFZvTTBadk9icTA0RkNu?=
 =?utf-8?B?WHBZckRIY1JCOU9qSzhBaUdVYmdXczVvMU9HTjUvTlFhTnhIOFZlSXNDelBm?=
 =?utf-8?B?T010dU1IOXhpN2RWN0dvYXlUM0M0N2FuS2N0ZnF3N1VCcUNOc0NVVDR2RnlL?=
 =?utf-8?B?blRRbmtJd0R5YVBkV1BUeUR1YjM2Zys3Y2RHZG0xWVNuN29RN3RrcVRtT1Rh?=
 =?utf-8?B?Q1JjcG00VlRld0UvSVlNMVdhY1YvdW1wV1NZMHZIcmpBRENpQS9qVjV2YVMr?=
 =?utf-8?B?UCs5V1RJRHdKSDhJTE84Q3loMVhWSGphZDdaNDEyZlRQVTBaWFRuQW16TGU0?=
 =?utf-8?B?Ny9idmpCYVVYeEl0ZFBHQVA0YzA4alM0VlFLVG9oVFQ4N3BTVXRBQW9sU1ph?=
 =?utf-8?B?M013VDJncGMwNzFrL1ViaXZycGdSQTBnNmJsOWNxQXJrRUt2MHFwdU5FcEly?=
 =?utf-8?B?WnpYbk9aZmhteDcyN3dEcSttL2U2amxVOU1kaGhmTGF6RUFGK3pRL2xIaWpV?=
 =?utf-8?B?aVNPR0QrKzV5ZUtwSSswMlA2RVI2djhicTQvZ1Q2RW95SCtCR0ZidGFHWm1P?=
 =?utf-8?B?TTNuSXdEWEFKSkdleVRvV1M5UW8rbHR3dStBTWVGTTQ4VGJLbDdtUmtNSEFo?=
 =?utf-8?B?N2dXTWUwSjFpaW1mK21yZVFQMmhnYm51QzZmazE2ZHdsN0xpYjRQRDBucG13?=
 =?utf-8?B?TTI3VTRqMDdUMkpRWHo5QTdqVjZoTHQvWkE3UDZRQThKbHZqMHFkVnl1czZE?=
 =?utf-8?B?d3JnQndHVUdCK3JWYno3djdJNzZIenhFMFd4bEVHUE9FSEprTStvQUZISEZJ?=
 =?utf-8?B?VzhWazBySDdBMWtpUHhndml4Qkw5UExJblFaRDJCejN3dlM2N09Ub0VXVThW?=
 =?utf-8?B?QUp5ZlhHYllZTWhPY0kvK1lzemF5TC9FM1lFUnBBNUR6TWE3djB6aXdBZElU?=
 =?utf-8?B?TGxjVjNxL1c0WnlMVXI4alhkNGh6VW1tSG1ZZ1Y0R2hBOHFZNjdWK3VTV0ph?=
 =?utf-8?B?Y0J4NXJ5disyNXp3dnVPZUlIMWFhdnA0Rk81aE44QXRvaDU3ZzQrOVF0eVNl?=
 =?utf-8?B?dGFnVDh1cWJOQjZRMkhIRzd1dUVkeEhDV2JDTVZLZEZaU3FHY044cTZLdTRZ?=
 =?utf-8?B?K3dkZ3RhbUhEN20rcE5UTDlZSmE2Y2dnK1c3NXM4R3UyYWZXdWdGN281bEZN?=
 =?utf-8?B?TVlLbzBiTTF5QzF2TFZwUmVYTWF4TVAwSnViQVNwdUQzQkx4T3hJRjE3WlhR?=
 =?utf-8?B?T2J3QXZrQjZyV1dNV1YvRVFyaWQ5SC9FMUNrZG9mNiszQzRsUWNoYWhvY2Yz?=
 =?utf-8?B?dFBNMm1GVnZRclFoM0xzM29Eb1lQdEN4aS80SVp4UTJ1YkdsVFMxbHpPVXBm?=
 =?utf-8?B?Snk0djR3Tjh6QTZ3WC81STA3QTFINmk3d2tXVGgzbE9tUlJpTGVvOTRWNEha?=
 =?utf-8?B?UExRWUkxd0hMandRSm9rK0lIdXF6aVBOTUlPK000WWtGZG9pUDJxZXk0RkRv?=
 =?utf-8?B?UDBTcDVYbWhWa2hjSU9VK0hha0tCU2pvVVRldVZJR0czWll2bGxoUDRGeUZs?=
 =?utf-8?B?Y3d6MEkxVldKemwvbkF2N21aOEl3a0lVY0tDemJpZkhlNXV3VGtQdHVEZjh4?=
 =?utf-8?Q?0W0QJu5j34iezN1imI?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0d5c81-5f0c-4326-fedf-08d9b07c2e86
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 01:29:26.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wJNSQofW9a23SmsdF9Aa87XjdFwMKJtF6yCnUBZ171Hz2Zsvymuh1EBEuPxeQLfUb3C384aqnAXu9gKabyI5cCZcN1z4OsLL8W15tYP1A+QKv6uBvp6kYm6l6w4wvqx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4648
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

Thanks Tim for your response.
I have one more question on this topic. With BMC reboot cause supported, 
is the information used to check if BMC is rebooted or powered ON to 
skip chassis policy (always-on, always-off, previous) when BMC is 
rebooted? The reason is that the Host status should not be changed when 
BMC is rebooted.

On 25/11/2021 09:10, CS20 CHLi30 wrote:
> Hi Thang,
> Sorry for late reply your message.
> 
> In my opinion, usually BMC play rule of card and be pulgged in server motherboard.
> However, according watchdog.h the definition WDIOF_CARDRESET is more reasonable
> for power on reboot BMC card then the other definitions.
> 
> In NPCM watchdog driver, we will provide dts flag for customer to design their watchodog
> system. For example, we provide card-reset-type, ext1-reset-type and ext2-reset-type.
> Customer can define their own reset type according their server motherboard design with BMC card.
> 
> card-reset-type = Power ON Reset
> ext1-reset-type = Watchdog Reset 0, 1, 2 (depends on your SOC support)
> ext2-reset-type = Software Reset 1, 2, 3 (depends on your SOC support)
> 
> Then according your SOC support to assign bootstatus as example:
> if (rstval & wdt->card_reset)
>          wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> if (rstval & wdt->ext1_reset)
>          wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> if (rstval & wdt->ext2_reset)
>          wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> 
> Sincerely,
> Tim
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+chli30=nuvoton.com@lists.ozlabs.org> On Behalf Of Thang Nguyen
> Sent: Monday, November 15, 2021 6:46 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; , Tim Lee <timlee660101@gmail.com>
> Subject: Check on BMC Reboot Cause
> 
> Hi Tim Lee,
> I checked your change at
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fphosphor-state-manager%2Fcommit%2F2bfb1efc4bc7e781224e19c05b51e6675f13a488&amp;data=04%7C01%7Cchli30%40nuvoton.com%7C5e09ba4542d844db827108d9a82559f0%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637726413598056663%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7nPq4H3s1hhZVqSfLwVHas%2F%2FVm8eWZ9ceexUzZ8bvR0%3D&amp;reserved=0
> to support BMC Reboot Cause feature. But I does not understand about why
> WDIOF_EXTERN1 is translated to watchdog reboot and WDIOF_CARDRESET is translated to Power ON reboot. Can you help explain about it?
> 
> I checked on
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2FDocumentation%2Fwatchdog%2Fwatchdog-api.rst&amp;data=04%7C01%7Cchli30%40nuvoton.com%7C5e09ba4542d844db827108d9a82559f0%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637726413598056663%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GRpNzdv9PYTVsFWB%2FAE2h0X1lFRXoX4LHOIOOSJb5s4%3D&amp;reserved=0
> but the explanation seems not clear.
> 
> Note that we are trying to make Aspeed watchdog support this as below but I still not clear if the use of WDIOF_CARDRESET and WDIOF_EXTERN1 are correct:
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c index 436571b6fc79..c5c3f80dfc48 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -54,6 +54,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>    #define   WDT_CTRL_ENABLE              BIT(0)
>    #define WDT_TIMEOUT_STATUS     0x10
>    #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
> +#define   WDT_EVENT_COUNTER_MASK       (0xFF << 8)
>    #define WDT_CLEAR_TIMEOUT_STATUS       0x14
>    #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)
> 
> @@ -369,13 +370,19 @@ static int aspeed_wdt_probe(struct platform_device
> *pdev)
> 
>           status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>           if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -               wdt->wdd.bootstatus = WDIOF_CARDRESET;
> -
>                   if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>                       of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>                           wdt->wdd.groups = bswitch_groups;
>           }
> 
> +       if(status & WDT_EVENT_COUNTER_MASK) {
> +               // Reset cause by WatchDog
> +               wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +       } else {
> +               // Reset cause by Power On Reset
> +               wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +       }
> +
>           dev_set_drvdata(dev, wdt);
> 
>           return devm_watchdog_register_device(dev, &wdt->wdd);
> 
> Thanks,
> Thang Q. Nguyen -
> ________________________________
> ________________________________
>   The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
> 
