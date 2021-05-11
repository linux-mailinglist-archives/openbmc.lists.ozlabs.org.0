Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47137A8A5
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 16:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fffxj5RzPz303q
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 00:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=QdSidzdk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.91;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=QdSidzdk; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2091.outbound.protection.outlook.com [40.107.243.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FffxP595Bz2yWN
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 00:11:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6gZT147E2z+P3O9fHdCQ1Ct3H/qqcwsA/d5oj/r/kAuF09R3JaNdgXe05be+J66KM8DjzWYKz3Mneu+lL0J79ZBL3ypjLHGYs49Yvc0PR9iSKGGpvzoBF3FfKyr3gM8v4h3qppbscBkQJcilKQI7OIo3TQYdSv4/rxHePmxOzl1/WsYlZIFt23bap23w9bMumovYo/GwfeT4hM6fPHREN+UapbnQVNCoEdV8Q9oNHZaKLcE6RD5bKs7OFem1+NdDDY2Qqw1aAMkpPG3AELqvNqfuuLT8bEhQG3vK/Yr3udIoxdt9oRiCDKG2fmlBzHWLYOdoTVjkVAbWqgr09zyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ACGRLxa8muME333kUi3uJNuS+DQr/7wdusc1cISV0=;
 b=HCnk6qZwDRmTtpStK3AaXf7ocMZZpJuy2sYUYuiz4agUgRfOXqMninV02LEI10NWLtN6pYIpIkTcidX995U+A8pUypIdWbICOUOKOmBAwPfLByAyex2SNhiV+xqcrIFjyu0bOjdj2Zxjvzvsre4N0iXEskntUneNyppQ8XnpK+l9TjUp2IEMvKQY1u6koLLkAvTakeHQFFxhBm+guXo/NlTwflkTZzpvu0YZcVnVNVz16LbzowaO76Y/OE7QUJuGFSSGLgL4ldrmNHsVtKkO8G+IivUZwPHxeTs5cwF4KzYrFmr/3ro0Lfg0RVi5phfheUHhwrda5jYe/1DSevDYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ACGRLxa8muME333kUi3uJNuS+DQr/7wdusc1cISV0=;
 b=QdSidzdkF9NWqZ0V5cUd/LZFOAdutBualYfElVTjZHimosVPl7QbtpNo/S3g8q8DNwz+z8CJG9YYuNnwj+VO0w+C/dbL1gQI5KKyp7YzThhzIf9Oz41qaNAEDX2TZp94gsoS8KYzXoJx9JZPfoyjdZ5ezdthUkmkYK0MpxETUfw=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5835.prod.exchangelabs.com (2603:10b6:5:14f::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.27; Tue, 11 May 2021 14:11:42 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 14:11:42 +0000
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
To: Matthew Barth <msbarth@linux.ibm.com>,
 Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
 <DAC41731-7B29-4743-87D8-40324324FF96@amperemail.onmicrosoft.com>
 <37873411-cdda-bcd5-0a2a-6cd46192f80d@linux.ibm.com>
 <6F0BA8AE-40E7-47EB-BA16-B445738548D2@amperemail.onmicrosoft.com>
 <17e3409e-64bb-0c3c-cbe7-028d88df17ca@linux.ibm.com>
 <fc3155f3-87d9-a93f-1115-3a9858e23fe4@amperemail.onmicrosoft.com>
 <2aa18bfd-0229-c73d-51ad-510d68619479@linux.ibm.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <64a79ec3-c2cc-596d-d547-8f35b1973e4a@amperemail.onmicrosoft.com>
Date: Tue, 11 May 2021 21:11:34 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <2aa18bfd-0229-c73d-51ad-510d68619479@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:392d:d5c7:cb15:b108:6a77]
X-ClientProxiedBy: HK2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:202:16::21) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:392d:d5c7:cb15:b108:6a77]
 (2402:800:6344:392d:d5c7:cb15:b108:6a77) by
 HK2PR02CA0137.apcprd02.prod.outlook.com (2603:1096:202:16::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 14:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ef311fe-1473-4376-fa28-08d91486b36f
X-MS-TrafficTypeDiagnostic: DM6PR01MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR01MB5835A4F09BF5BBB1DCD5492090539@DM6PR01MB5835.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJRqo8nfDBBi1A4DQOQcXgsblIjNot5ZAebx2qWMzmZqyuddoe+zKme84cbrLjOEWf1Vu/I7H9EMMa5rCu11QV4ljhgsu5McnPJom4A9bBKpCv4/s/SDGI6V6p6bnu9nWTyLiYbdx6ovIEAGJE6xvFpeUGkASqjuLD+jr/ro/Jhl4V99QwMCULyE/ulRm11jHwqKJl7e90XML2QzItRKHgt0SRKTQHeJ87Z9ZOLxiSUC/poCPOZee5VUBzrze8jQ/s7eyJoAOaESf4KMyiLa5Pmdxwy/XYLUxPo1zxplzWzz8ViOGMr3h1VT4Q7NAyC+PaiWhdofE477DZJzFX6GDwONPG0Lp7fKaikfgfk9xS328GvPvwdp2tZ+y6BljLO5ZZVa+SW6dgG/Q2MPrpHLdBPwvOyGvAuPvCp7wTEKTYy+f2byhxhUuGxaBlSC5bdC4W7v3LQZfwcZcEx6Auzbu48ChS4vPrtjz0DaKxpb58+b5JCFSIyjc6a4/nPcG5+q0JTYL6wCqCsSUvbrRRc2wTklJelPciNFhS6mMyyS48VMtnb6L0g+C0eDxSi0oJZ3Fa5t/D0DRMzJG0sYfCM+D6ZgmL2Ku62F03FMaBpIQMNqSfgdTW0E4axcB1MUMOMHYx0tffEA6VMoqblg9dQerP0Yi/akTHO0Z39cWdif0XdgM0dKOZBPIA/5RsmyoxDqulTqtOOxMgWvsenmnI1OmLZA3IWs1jAxMbSotxC9QXLTwLb5jwzcSlieDKJaId8/pmi6yzPJ6LGPoIbQNwucqBOVtmxRLyYW4o5BWQD6yjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39830400003)(376002)(31686004)(38100700002)(6666004)(6486002)(66476007)(53546011)(66946007)(52116002)(66556008)(83170400001)(478600001)(5660300002)(186003)(31696002)(316002)(83380400001)(16526019)(42882007)(2616005)(8936002)(110136005)(966005)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDdwWTVaNEliVTFVZVJrTGRGVHdlMFF0K2x2azYwbU5JRFdWaUVEMHRxQ1Z3?=
 =?utf-8?B?Tk1QZFVqcjhZQVNaS1VrSXFnTE1DRWlvK245Nm43SzdKVWVDL3Z4WkdTTGdT?=
 =?utf-8?B?d1Zvd1d6MmZiVnpWZFRheHZndnpySnJHaEloWDBFcXBjUTNPRklJL1JsdHNs?=
 =?utf-8?B?RVZTWkxqZDAvTkF4UGhoWjhOTlgvc2lYK2ZScnE0anhTNWdsU0sydE9tMG5s?=
 =?utf-8?B?S2ZMUkdVS2ZySE44VExmR3UwUG1ZTzFtV1pQREQwdUcvTUdRMEUycXpMc0Jj?=
 =?utf-8?B?d3ZaS0pUd0hEbFlOc3JiYU11WkNXNmhWbTRFN1p1UTJNK2cxeTRiZ1VxSEk5?=
 =?utf-8?B?QmhEY3BhY2k1WTBFdzh4OHF6QjMvMURKN0ZxQXJCcUpZOHZOWUJDaWNZUkow?=
 =?utf-8?B?T3BjMGxQamZ1MVk5SytGQkgxc2Nna1cyTUxIRnpVamlnZzNhaEpkVi9EOWNj?=
 =?utf-8?B?QWNvTVlZSHRZZjV4VXluc3pZSmVkcmhjYU5xeWZEa29HaTVKeXU2TlI5RjZi?=
 =?utf-8?B?RTZLYm5mOUpwZXVBSVlqTUJxMStwdzZtZ29UQ0xITXdhWi9INExEeG5yeXdP?=
 =?utf-8?B?c0hLU1ZwTmVjcTJ2TzlkRGlWRzBvTWhHaGhsSGh1Q0J5N0FZN1dKblEwTExj?=
 =?utf-8?B?TXM4Qk4zNWNHaGJJRUdvVGNiRi9rT2xFR0V6d2VlMStaQ1lqVTQvemZ0Qzl6?=
 =?utf-8?B?dVNtNUNmYXI5NEQwcEdJa1dqZFlrdEV4QWR4a2tUc1pPOUtRMUNqMHYvZUlv?=
 =?utf-8?B?Q0VmbzhKSlRJVWhHam90aG5LWGJLQmcydU4zQ2pkTTJ3djFGZmF1Z2ROV1pq?=
 =?utf-8?B?ZjI3KzZ2VWZCQnpMa08xcjRDS1ozdmJRS0IySitXK0Y3TmYyUlFkU2F2anJz?=
 =?utf-8?B?citRemk1RWJjbVFnRTBiNnJzUThuNVZtTVR2VVdqR1lrcWpKTlU5aE96Tk9I?=
 =?utf-8?B?RklyRTh3Z3kzK2NpaDg2eHhGVU9jNTdNSkREc2hmZU9PNVBIcmxScTlOdm1w?=
 =?utf-8?B?Y1VYWGxqQmhJWSs3WUZFT1loVk1TSHg2MThUTlZPb0YxZkEzYXpJbzU1bUNo?=
 =?utf-8?B?dDdoNW5rODhQOGEzM21lTWJuYTVsUXF3cTRxSGppbHVIM2NIR1Y4dUxDcmp5?=
 =?utf-8?B?eTE1Ym4raytsczMwTnQzcUhoVEdGNmtGUmQwb0ZKbjJkLzRwMU5URE9ZRWp0?=
 =?utf-8?B?bmEzMjNYY2FMUU50amVXblp5Vk5PbEgwdXgwLytFQWVLRVVhdHIrbFArMjI5?=
 =?utf-8?B?aStuaG4vNWVGNGxCL1BHd3JHK1pNbFVaeDRjc1Ywd3pMcmxCenNiMzFsS2lG?=
 =?utf-8?B?QjZLL0o2YlV3LzNWKzBSbGEzMXlUQ3dFM29JajVuRW1qVGNRanBDTnRRQlg4?=
 =?utf-8?B?UURxNnVSM0FQSmhoVnN6TE5Cak0wZm9OazNLVG5QTHQwSkI5Sng0MlI4Q1Vl?=
 =?utf-8?B?TkNZbWFNRG1RTnhsOHovR3Z1RFBFSnhvVVZVeWVVZGpxd2hXZEhRVDJDRXV6?=
 =?utf-8?B?a1owd3kyV3VhWXlhZ2FUY2Z5Uk5vT1NZeEJTV29POW5SZnJrLzN2ZlZOV0xJ?=
 =?utf-8?B?ZTE5NmI4VkQ2K21NVmdjZ1FwMnJXdTlZdm1rTFBQU2JsWHdkVlNIbml4UmZh?=
 =?utf-8?B?N0poYWlsNVlYSU51MXFsVi9seVZXMHlWZml5RDYrQ2ZXQmw3SDVKRnZUWEdj?=
 =?utf-8?B?VDcvakt3ajNhckE5bDhrWEUvKzBsSEFoV1p6aGJLU01BOXZvL3M1K09WTEZF?=
 =?utf-8?B?b01jUm5veTN5VkFoUEl3TjBmZUtCdXBCQVVvdHpBbVExZ3ZERXRnNFZhZS8r?=
 =?utf-8?B?dkdkd3dMbVVXS2MvaUMzQzlwcHVEVDRNNXQ0OUV3ektjVnUrVm02eGFaNjdx?=
 =?utf-8?Q?BlQ0W9bLlMO5W?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef311fe-1473-4376-fa28-08d91486b36f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 14:11:42.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzVHS9oTm0M+mGq8r4d8pVXIwkzxDvDWA6Vw2waqyudujXeoTpVgbA+pG3T4RjUEGh1le9gpk/XqACKvDdu9G/Yrp2WbsONWvCRWrAwqAmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5835
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


On 11/05/2021 01:14, Matthew Barth wrote:
> On 5/8/21 11:41 AM, Thu Nguyen wrote:
>> On 07/05/2021 23:22, Matthew Barth wrote:
>>> On 5/6/21 5:34 PM, Thu Nguyen OS wrote:
>>>> ﻿On 06/05/2021, 23:30, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>>>
>>>>
>>>>       On 5/6/21 10:59 AM, Thu Nguyen OS wrote:
>>>>       >
>>>>       > On 06/05/2021, 20:09, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>>>       >
>>>>       >
>>>>       >     On 5/6/21 4:22 AM, Thu Nguyen OS wrote:
>>>>       >     > Hi,
>>>>       >     >
>>>>       >     > I’m supporting the fan control algorithms using phosphor-fan. Phosphor-fan monitoring and controlling require interface xyz.openbmc_project.Control.FanPwm in the fan inventory object.
>>>>       >     That is a sensor interface, not an interface that's added to inventory objects
>>>>       >     > https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>>>>       >     What you linked to here refers to where the fan inventory object is located and nothing to do with with the fan sensors that fan monitor is to be monitoring.
>>>>       >
>>>>       > [Thu Nguyen] The link detail about the inventory configuration in monitor.yaml for fan monitor  and fan.yaml for fan control feature. It should be " The relative path under inventory where the fan's inventory object exists ".
>>>>
>>>>       The README links refer to the use of JSON config files in place of YAML. YAML based configs for the fan presence and fan monitor applications has been deprecated, so please use JSON based configs instead. Fan control is in the process of getting converted to JSON based configs so that it too can have its YAML based config support deprecated. To enable the use of JSON, supply "json" to the PACKAGECONFIG and to continue using YAML based fan control, also provide "--disable-json-control" until fan control's support of JSON is completed. i.e.) https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/fans/phosphor-fan_%25.bbappend#L59-L60
>>>>
>>>>       > Look at the example of the fan control configuration  file named fan.yaml below you can see the yaml file includes "inventory" setting. And xyz.openbmc_project.Control.FanPwm interface is required interface for that inventory path.
>>>>       > https://github.com/openbmc/phosphor-fan-presence/blob/master/control/example/fans.yaml
>>>>       Now to address what you're seeing, the "inventory" entry for fans.yaml is just used to name a fan object created within fan control and not related to anything actually in dbus inventory. This will become "name" in the JSON based (fans.json) for fan control.
>>>>       >     >
>>>>       >     > But FanSensor daemon of dbus-sensor only adds /xyz/openbmc_project/sensors/fan_tach to inventory list, and this path don’t support xyz.openbmc_project.Control.FanPwm interface.
>>>>       >     I cant speak to the support of dbus-sensors and the use of the FanPwm interface, but phosphor-fan-monitor can support either the use of RPM or PWM fan sensors for monitoring and updating the corresponding OperationalStatus of a fan in inventory.
>>>>       >     https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/sensors.md
>>>>       >
>>>>       >     Supplying the ` "target_interface": "xyz.openbmc_project.Control.FanPwm" ` directs fan monitor to monitor the fan sensor using the Target property from that interface. When the "target_interface" is not provided on a fan sensor, the default is to use the "xyz.openbmc_project.Control.FanSpeed" (RPM) interface.
>>>>       > [Thu Nguyen]
>>>>       > The point here is the phosphor-fan-monitor/control expect xyz.openbmc_project.Control.FanPwm or xyz.openbmc_project.Control.FanSpeed is included in /xyz/openbmc_project/sensors/fan_tach.
>>>>       > But dbus-sensor don't support that. In dbus sensor xyz.openbmc_project.Control.FanPwm is only available in /xyz/openbmc_project/control/fanpwm.
>>>>       Ok, that clarifies things...and I welcome a proposed change to support the different dbus object paths in which the xyz.openbmc_project.Control.* interfaces that the fan sensors can be be at. Before dbus-sensors existed in openbmc, the fan sensors were provided by phosphor-hwmon on the dbus object path of /xyz/openbmc_project/sensors/fan_tach regardless of being PWM or RPM so that's why they are looking at that path.
>>>>
>>>> [Thu Nguyen]
>>>> How about add target_path option in fan.yaml and monitor.yaml to set the dbus object path?
>>>> Example:
>>>> target_path: /xyz/openbmc_project/control/fanpwm.
>>>> The setting of target_path will override value of "FAN_SENSOR_PATH" in fan.cpp and tach_sensor.hpp.
>>> Does dbus-sensors place the sensor value of the fan on the same dbus object path as the target? Fan monitor looks for the interfaces of both the target and the sensor value(feedback) on the same dbus object path.
>> [Thu]
>>
>> 1. No. Dbus-sensor provided three difference path for one fan:
>>
>> /xyz/openbmc_project/control/fanpwm/<Name> have xyz.openbmc_project.Control.FanPwm.Target to control fan.
>>
>> /xyz/openbmc_project/sensors/fan_tach/<Name> have fan tach value in xyz.openbmc_project.Sensor.Value.Value.
>>
>> /xyz/openbmc_project/sensors/fan_pwm<Name> have fan Pwm value in xyz.openbmc_project.Sensor.Value.Value.
>>
> Ok, so then fan monitor would need to have the path given for the target and a separate path given for the sensor(feedback). My preference would be to have an optional `target_path` and optional `sensor_path` configuration options for the list of sensors on a fan to be monitored. These should be optional in the YAML based configs so we dont have to update all the configs of the systems upstream that were using YAML based fan monitoring.
Yes, In that case we have to support two more option in 
phosphor-fan-monitor.
>
>> 2. I tried to update fan control to support "target_path" option, but still have issue with fan monitor.
>>
> This is fine as an optional argument in the fans.yaml file for fan control since it only deals with fan targets.
>> 3. I wonder when I set has_target=false in monitor.yaml, the fan functional in inventory is set as false.
>>
>> If don't have the fanpwm value, fan monitor should bypass checking fan failure in programming speed.
>>
>> Is this right?
> No it should not bypass it. If there is no target for the tach sensor(s) being monitored to compare their feedbacks against, then what is the point of monitoring that fan?
If has_target should always is true, then do we really need it?
>>>>       >     >
>>>>       >     > Do you have any solution to make phosphor-fan work with dbus-sensor?
>>>>       >     >
>>>>       >     > I’m currently update FanSensor in dbus-sensor to add xyz.openbmc_project.Control.FanPwm to /xyz/openbmc_project/sensors/fan_tach.
>>>>       >     Refer to the doc link I provided above on how to utilize monitoring fans that use a PWM target on that interface. Then phosphor-fan-monitor will update the fan inventory object's (as configured with https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md) xyz.openbmc_project.State.Decorator.OperationalStatus Functional property based on how you configure fan monitor to monitor the fan sensors.
>>>>       >     >
>>>>       >     > Regards.
>>>>       >     > Thu Nguyen.
>>>>       >
>>>>
