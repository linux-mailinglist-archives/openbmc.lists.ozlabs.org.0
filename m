Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BAD37A2DA
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 11:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfX2V71hgz3036
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 19:00:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vKTsec6W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.76.133;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=vKTsec6W; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760133.outbound.protection.outlook.com [40.107.76.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfX2870lnz2yWK
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 19:00:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoNgRKGZxWCuYtSimuFLO9JvdfWO/jCD4/LObsi6T5Db8MTLtlxaBkk8mvf9wZyl4JrmfJ0wCtcDwVWgBoZmxXdhxDta5esSAZ8uy9uiH2bheQybWseBrLPIAnjpNrySkPDnQ/lS9013ZlaV2ylWZbNoep1mzWK2Obl3gmR6V3Bjr/4anwrGzvcATd5S9llOGLN/6OWsGRxNFtGkD61YKqtWW8yBeJY1es+NGudQFM54eMaXwIA9izstjOmM/GvcoAudCLMGMScFir9olSAzuUk/WympnW+iSxSiYYJD+Z94zAAblbqsNfyOoqwQ2lI5nskw+KV/11Tu73tNhGLxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBKj7o4leYlCnHJH950fbHAopItdON2sCi5i7eDLehs=;
 b=fvOo55qB6gzpcdNMCZ234Bwne2VYrjqCN/P8X6TiulKSkMgEvU9IfXoc18MYqqv6ZGqSUP8Im8NokJB1ts9agm+bBcrJKpne42DrOiel3pBoUGXKEIHGtzuUACTwqIws9z9pp5+sKGfBbxCXpop26LdVOBZwdc3bPGMFrkliZuCzIrq14dMifrgu1MIv/K2uXK3Ip9VIO/DrqvlW7D475wChjbxHn2MS0NCBU6cIUxm1ButhzdyYE0oslVhal0ndTQKS+T7thBGpPyEKTHVXkyLyaql9NqFevEQsbqi8646633ot01UWM9aOvUGM9BCBJAR1gyOxAY784XkPcW8jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBKj7o4leYlCnHJH950fbHAopItdON2sCi5i7eDLehs=;
 b=vKTsec6WhGqbgB5ECTR0/pzk8zs3ooQw9n1SBrB+yJxSOqo7yBahOf/49NFCkk3dmNpGLwwExrSqlRRSxtMqEUs/ilBTiMnXLE2/E5wiXx/2lKBM5eQQGa62Nf+M44ZCktBjF+wxWJ29IozOf9zGgqLwMC8CqFnSB5Wpvj7oYVo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4008.prod.exchangelabs.com (2603:10b6:a03:59::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31; Tue, 11 May 2021 09:00:22 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 09:00:21 +0000
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
To: openbmc@lists.ozlabs.org
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <YILMPOZwlODKqxtb@heinlein>
 <7bec9fb2-35d5-8e44-463f-3eb5c0955f0d@os.amperecomputing.com>
 <YIwTaJ11MRUXY2H5@heinlein>
 <c4c78ca7-f7cf-0995-887b-a7d7543061bb@os.amperecomputing.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <72c90dc8-3e66-16a6-8ca0-54ca4f1797dd@os.amperecomputing.com>
Date: Tue, 11 May 2021 16:00:12 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <c4c78ca7-f7cf-0995-887b-a7d7543061bb@os.amperecomputing.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK0PR03CA0116.apcprd03.prod.outlook.com (2603:1096:203:b0::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 09:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbdee58-740f-49ff-9f94-08d9145b3519
X-MS-TrafficTypeDiagnostic: BYAPR01MB4008:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4008C50A426D78443915F57A8D539@BYAPR01MB4008.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8AQ0aRwZhx8EGuVBFA7BJAN/YW9CcvOG1neObar9MU01yBM2o/Llx5RofbmfHzJYUwQf0sLWbu3rSuh4WK/yGSRWst2NCTfoqLAQcDsM+FlxvLLkvHt5WuzAVfAxXNOLzsSaHSjibzm3Wowq53L1fUBAvRkwkA7tQ5FT7T0TY5WG90ZWD2mawJG7tBDhdF15KIaEawxULEGF+CyQ2QSdz7KSooJwCnxBDO6i2FreBIm0HVfeBr/KxNyydPS44zllU8H8PH96UpqCUPHo3XZu4eVjDpNBEaDnYpWuQNcuhRoXb2mWIYodXTD3VKGxoXfbkGBT9n5sKn/dF2z7Uzw+Mg+sc4I05uTjiApEPpXkezJkEtzOTECHRpq50qdDb4bvnuxZ3ZVvkd8RvrukaSEm9L1LydKIjCCa5oguRVbGZN+FfR+tvVQR9TIIyx8abRX0Z+173wA/ZEYpUTWtAADhmAZwedclMby/Oh5Nffvoj6+p5Q5WgqWJZpbr9t34Xzmzv8JRT2cjCwD0JZrlLXtBWZzPoLSvHYWdelAYZnSxaZ72kW2UVIqujmSGH49EVjmTeouONi/cJHfUlIjXfng07oSLdS6ThAUcb1/+rWhDOTyaBPOngXr95QQbe/r057H9DgqC0+hsyc8G5y9NNDEXreBMTdIbJ/cbOben/Zv6GeIwG8ZJSfsKV3V9b1pHnVdtFiM+NHkN9GcGNhZV5fk0TZYV/Hhc1QHx1Eg+kltxDconu4W6s2eVABX8xgwCYmiWoelF4NtBXpCu+YdtTcC4EY7t3cxCAPABXg+fwhBCF2ng7X8smdqdnqQ94ZGt16ROcV6SVIEO4Cn8OsFif39Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(31696002)(86362001)(316002)(52116002)(38100700002)(2616005)(83380400001)(6486002)(6506007)(16526019)(66476007)(66556008)(6916009)(186003)(66946007)(2906002)(8936002)(478600001)(26005)(31686004)(966005)(8676002)(956004)(6666004)(6512007)(53546011)(5660300002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?dYliAUIjxyFh8zN+7VCJvmFipFsAmKqZQDe4nWMIaOBqH9rCn1wHfs5S?=
 =?Windows-1252?Q?tR0akam+o7wPKywBl/bKoR6f+mB5XqdU0htIsRXEP+zgce8rgJJBveRI?=
 =?Windows-1252?Q?E/OV0Ilq9xYbvBBfukWiz9g5s4sxqA7dENLCu+gvGdM12LBz5DmgAsKJ?=
 =?Windows-1252?Q?c2eDCT19nAB3n205ByzpvZV4E0qgnqpgb8BSg9JphyWA3K5ViKbM/WtK?=
 =?Windows-1252?Q?JzQtFTUo02pvXyHjQwfK+SWPrfzKMm0aLplzL2bVDdaZNOTu1H/oJ88w?=
 =?Windows-1252?Q?YIAe9crxa7YfxJEiTJ/2TsQq5S890SUETflvF0OZHgCSnRWqLWnMImXD?=
 =?Windows-1252?Q?VNotEbvJir90vRlmOMd70h3u9ENVpp2uxdMBg9zo2OGOE2YXlbX3EbF2?=
 =?Windows-1252?Q?b82u9TPzY2e3Ig0iu4WYjzVaOULdT1fp4Cqv8Xc11E0dOHEqJWWRxmO6?=
 =?Windows-1252?Q?e7776FyzKmmo5rm6/Ja+WpimGSncMW6w0SqNNV0vQdDCEXlLRgaSik5u?=
 =?Windows-1252?Q?RwBuKuuNGsa58Cvg/PPy6TQCsdYVns7vmuj4S7OQALZBvFDttZnR67dY?=
 =?Windows-1252?Q?BtVvmH+BLgfnAlxTbTlmt/J3aG1yRM5aDzdRTOiCk0Iq/ozxRNgG1IIG?=
 =?Windows-1252?Q?+/tsFhiH/dz7V2Y8N0yBCxjG3q9tLaiZ1au4bHsxSkFDVjDCwh8CW/WW?=
 =?Windows-1252?Q?Ox5OI3w+68Hj2ZDa2MliJRhfQ+OWn7yCRaEDA087HUf1GLGxziUtOLEy?=
 =?Windows-1252?Q?Vv3N3kFXHdS0mGZtS87imnzYiptNdp7tisZ3BADiGJ/dfHMAMtAjP4fm?=
 =?Windows-1252?Q?k2H2n8pih+335mcEYJTzFIwnn2wwUGpAEHBe9bn64tVv35ZOx6Uhwheb?=
 =?Windows-1252?Q?0zS7RcOoQ8tygnkmP5PwiDRoa5kYjUbiByeMpDJO3waT0Ig+Odxos+yh?=
 =?Windows-1252?Q?9Fz0WWGx2L7eOj5f0VJw1BTbsLCiuojpn8oxbxk7PmPaTbXcC4vIl9Tw?=
 =?Windows-1252?Q?dwCdNh20rc/AyhGQdgxuVS3xGq/cMy4+aVai4L+NTQjIKO14SrfJAwU2?=
 =?Windows-1252?Q?CZCD+FJC/EWZzvsQPbFEA9Xyzcj+wIYExq7V2Oy1HPGHlOx48dkNNdfs?=
 =?Windows-1252?Q?8EE5CrRN0VlLQMFd2gZEMeO6EUDsnSsh3s6j0RzkDhXlySd6HjytR1Ag?=
 =?Windows-1252?Q?Dllb2HDzhQ3Gum5wS+MqVN8T74P2kAuG7fT4g5OKqXWQCnAjfG6rPmkI?=
 =?Windows-1252?Q?QUcWgwy6VjaVqRkT783BZSuELw5wP9cwZpBTX9beUMucr6yM6uIn/jgZ?=
 =?Windows-1252?Q?04Y6L/RzM2gJ8ghQlHwIxOOO4vdaOwdG2SApZBTaK5dhclqJZhGmgFcO?=
 =?Windows-1252?Q?P1/UQQ9xiubHLEzYsYtbKR1fNnissZ540a8xUMbfehn64ET8yRVaR8jK?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbdee58-740f-49ff-9f94-08d9145b3519
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 09:00:21.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cl2/f5lFIWckulqgx2yWw6XsNtpQLMycJ0UTJnNoznuUT412+/+K+UMqap/BBO1wHshkLPOe1ZCK7ofiPdjeK5aSpZktDhWxWwXo5LY2TL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4008
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


On 04/05/2021 08:47, Thang Nguyen wrote:
>
> On 30/04/2021 21:25, Patrick Williams wrote:
>> On Sat, Apr 24, 2021 at 07:48:14PM +0700, Thang Nguyen wrote:
>>> I intend to push Ampere specific features, you can find current 
>>> codes at
>>> https://github.com/ampere-openbmc/ampere-platform-mgmt.
>> It seems to me like all of the functional areas you mentioned we already
>> have some sort of implementation.  It would be better if you could work
>> with the maintainers on these repositories to see how it can be enhanced
>> to support your use case.  As I mentioned in another email thread today,
>> I really don't want to see catch-all repositories being created.
>>
>> If you have specific features that aren't covered by an existing
>> repository or you feel like you've ran into a roadblock coming to
>> consensus with the developers already working in those areas, we should
>> revisit making repositories for those specific functional areas.
>>
>>> It is good to have any of below can be implemented with current 
>>> existing
>>> repositories:
>>>
>>> - utilities to flash Ampere Host firmware and NVPARM: Boot EEPROM,
>>> UEFI/ATF firmware, ...
>> Are these extra utilities or the firmware update procedures themselves?
>> Have you already implemented support in phosphor-bmc-code-mgmt? There
>> are other systems that have BIOS update for x86 done in that repository.

I use the repo also. And I extend the firmware update (by patches) to 
support flashing Boot EEPROM.

I use flashcp to write the firmware into Host SPI-NOR. But the command 
does not support to skip an offset. For example, I want to skip first 
4MB so that the current BIOS setting is not cleared. Any other tool to 
support it?

>>
>>> - Control boot EEPROM based on current input GPIO and log the
>>> information into Redfish
>>> (https://github.com/ampere-openbmc/ampere-platform-mgmt/tree/ampere/altra/host-control/scp-failover) 
>>>
>> This looks like something that could be implemented with
>> phosphor-gpio-monitor.  Have you looked at that?
Yes, I think it is feasible to use phosphor-gpio-monitor to monitor the 
GPIO and switch the Boot EEPROM. And use logger-systemd to log Redfish 
events.
>>
>>> - Handle boot progress from Ampere's Altra SMpro, log the progress into
>>> Redfish and update dbus. Note that the boot progress is based on
>>> information from EDK2 and other firmware like ATF and SMpro.
>> You can probably fit this into the existing post-code repositories:
>>      - phosphor-host-postd
>>      - phosphor-post-code-manager
>>
>> We recently did similar for a system where we get the post codes over
>> IPMB rather than GPIOs.
I read the design document at 
https://github.com/openbmc/docs/blob/master/designs/multi-host-postcode.md. 
As I understand, it is for POST (Power On Self Test) but I want to 
monitor boot progress and log events. I have boot-progress information 
from the hwmon misc device. It is on the SoC sideband interface.
> Thanks Patrick for the information. Let me investigate more on these 
> repositories to see if I can use them for Ampere specific requirements.
>>> - Handle events from Ampere Altra's SMpro (like Sideband controller) 
>>> and
>>> log to IPMI SEL and Redfish.
>> This sounds like it should go into ampere-ipmi-oem?  I'm making an
>> assumption that the SMpro is an IPMB path, which might be wrong.
Yes, it is on the SoC sideband interface to monitor and report RAS 
errors. We implemented smpro-errmon driver that expose RAS error 
information over /sys/class/hwmon. IPMI OEM seems not match this case.
