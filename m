Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D1937733E
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 18:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FctQX203Yz2yhF
	for <lists+openbmc@lfdr.de>; Sun,  9 May 2021 02:42:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=WnKsU/5B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.120;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=WnKsU/5B; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2120.outbound.protection.outlook.com [40.107.94.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FctQB1W5Yz2xZm
 for <openbmc@lists.ozlabs.org>; Sun,  9 May 2021 02:42:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWE6/cs8oDSKt/cg9QcbOlKP3W3jQGdmXn5EI1lIpO+IeYgNY6O+3zq26TKtt+HMXNTDEEIaLitp44t5iDYeVzgjVikOg7QDebu8e7UiuPqZh3N6CxpLAoRa7JcJfOiRyfkNeyNER3XcISaeVat6rLiP0wbDG8sks35X/OhJIKsc1RFhWtxwPY7+Eivy0G+mZ2Wn0Z/xEn7S4EFHryR9ssvfwHLBl45j0v76KYktrnw1eCyzkfuwhQBy9m/uFFNXtaMdXHcGcTP7p5vJUr7XYnFPi86RTWjob2rB/DYoZFbx1ri964B0uMC27V+UlTH9Q90EIEOxx/zCfxAcjZG49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8xHzqXnzjZ4/KK+l4+A5gAx6JgPMFMcCEv3dLH/hYo=;
 b=VM2RFGbmWSuPP7c6jacGcbKySy1qgTRsXq+TRcz/4BCbRy7GQvgin867b4Z/jEsLLWlEYXyJU4lQoBI8hiqWaGjETec8do3cZgvHlUupcg2wBvOz1J397dRLpRrGqsBAotIiiHopvFvKR3xRuVViGUAKxc7NmWqDnIdyMyMuG4z4JqtKiQyHkz4JCIzunweCN+C3WGGTfQpsGc0C7q38K1ZF01ekQQl/nJo5n4Soji3853pJjzD2rSWBHFKJ43w8SfrLjXmzyyoQNa0n63rL79uaT+l7FsAyLaF2cLDKh6MOE+g/cKKutFEpJsvCVZNJNg7NKGRfiAt0da7tj62yQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8xHzqXnzjZ4/KK+l4+A5gAx6JgPMFMcCEv3dLH/hYo=;
 b=WnKsU/5BYgPtFN6nzm3wpZG914McDhZXdw7/LOiCh3/rmwXs4V+1aFXcjot1le7vJ0npdzeNodDGqvi1Hi41qGp5iuNdEiRXATD/BfYLTfg0nBIGI7L2DSSXZd9Hwnb6AE1pyZbYtGF7wCpHuSicL2F8MT8l2PgkKhE0iWo5xno=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4860.prod.exchangelabs.com (2603:10b6:5:67::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.26; Sat, 8 May 2021 16:42:00 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4108.030; Sat, 8 May 2021
 16:42:00 +0000
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
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <fc3155f3-87d9-a93f-1115-3a9858e23fe4@amperemail.onmicrosoft.com>
Date: Sat, 8 May 2021 23:41:51 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <17e3409e-64bb-0c3c-cbe7-028d88df17ca@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2001:ee0:569a:19c0:b41f:c580:18db:6d66]
X-ClientProxiedBy: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:ee0:569a:19c0:b41f:c580:18db:6d66]
 (2001:ee0:569a:19c0:b41f:c580:18db:6d66) by
 HK2PR04CA0052.apcprd04.prod.outlook.com (2603:1096:202:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sat, 8 May 2021 16:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7ea351-f580-4d20-c4e7-08d912403353
X-MS-TrafficTypeDiagnostic: DM6PR01MB4860:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR01MB48607EC6E42C9552D0F1E41090569@DM6PR01MB4860.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNaQcvKIi6PagvXyIKyoE4RgeaZWfFFQ1irVvd4Vd+v1GJXapjS8aaTo6U888YvKIDB2A3IL5I3YrTyh/krsSeMUPBn+twrMLxOudnxAxYyR1bEfSxMBV19TinFu4sCKKoxxC+bzutjCgL2zPFrRIAh41QJfNmUPCjlP4N3XvmQVf1gWg8VxZEaABCB6zjUhNXu2XwuJ7tUDBgP7pPRWf3XQQ2WZBozH7S+LrCztDzb3cdI800GNjO6bMD1FxbF5u2RX7qGpq2AtyGJq634QFnlOAs3Hi5oJDcPpoJ/fVdoeDQlcLQ2z47zprFAQwzTFuKGcCh6MOU/YfCJsX7Kdeos4XF6g0+j3U78ZJ+VUgcmIxqr0jCq8ZDbKJG/nL20Q29gdGZFdht4MzYLIiK6IsqEJRjiUSFziAeHiaoVtBGfmdCvxcCVVn5ijf/rODUQUE4aE/NJE99Kh9O9oO6kPKWvpT1AuibO/yAbaN02/UaG0l2RWtfIq4J01Z88nVge/ga0aajmxLlau0KQazx9poOdFkj6bvSNhn/tINi9EePR/abVJjVqPIb/Wew8p+1fDsw79ocZMlkJ9v/gQE5QN0teDtczTy28PxV3W6hd9oU6X7/pieJxkclm3NY4FYDnfhG6v1CwPlUHu1PceYoerdafW6MLcIlf4xh3/HxJmgfiMYOmMgvISFjfSOTyEtiRDRsJ8KnQfR1Sv+CO2WElgZyWTcCr1Z6FNd/fnS7obFFm6C4CeGemckL5ZhoSIMIZTbdq/R0yfuBrLr/aowb4gxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39840400004)(396003)(31696002)(316002)(5660300002)(186003)(478600001)(66946007)(966005)(16526019)(83170400001)(66556008)(83380400001)(66476007)(38100700002)(2616005)(110136005)(53546011)(31686004)(8676002)(42882007)(6666004)(8936002)(52116002)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0hhK3hqTUQ1SFFjQ1N5N0sydVJUOWU3NzhrY3R5TkNoLzJNOW50NGVyVWlW?=
 =?utf-8?B?Qk02eVFQRXlMemgwSVh6YWpMRWo3Y0U5UE5laTNzU29VZUhEblNKUWNwcXU0?=
 =?utf-8?B?emltQXRnbzB4ZE5mT0hOWGdOZ0JPU2lZUDdXT3FKczZyMTg4dlpSK2p2RHN5?=
 =?utf-8?B?VzVnUFNMUm8wVVg1WXhYMnJBNWZoSnRFMy9mZU52S1ZVWXM3NVBwLzNvUTVx?=
 =?utf-8?B?dVp0SHZvekVNRGtWblVPUXNDVFMxQmhPSXdiODNJaTk0NzRoNG9Nd2hDQ0ov?=
 =?utf-8?B?VUdSNzlZUTZnYkhRMytDQUxSQmNlcDZzbXJ0TkdlMnE3cVkvUm5lYWtjNG5H?=
 =?utf-8?B?UWRLM1l3UG1URTd3dTdpN0RjVm52ZEpad25DNFJrL3EzVWd6cWRXQXh3Mkpn?=
 =?utf-8?B?c1ErQUZNdWQ0WHV4MzRUVDZVNWN5d05FelZYSjRDWjdNSVRuNHh1ZWVTZGRS?=
 =?utf-8?B?cWdZaGpKc003Tk9KWVpYeG9DaTkybWdPczJRNW41Mm04aThZbGk4OEY0R3A0?=
 =?utf-8?B?Ukd0Y21hL1d2Q0JjWS9UZWtrT2FZSkdvZTFWUHh5cW05TzVXRDcrNGJvU2kz?=
 =?utf-8?B?dDQ1SlM5SkxxekNaL21jaFl3cmNlZWVGMmk5OWdqMnMydUo5OEpUNy81Um5o?=
 =?utf-8?B?ZFNiaC9QRmZDd3l2VmdyTDZmc1EzVCsxNUJ6L2h2VjNpRlBoSkZmZGZGVmZF?=
 =?utf-8?B?Ym9UVlhVTDhkYXNUTlQvaDdLTXJ1YWpReEpJcng1NTZySlUzUnpiMkc3MU9S?=
 =?utf-8?B?UmZ3K2c5TXdQTDcvRUVUUVk2c2xoOWNIWk9OWDJGY2lkRWo2R1FtRFdXMW85?=
 =?utf-8?B?OENaK1ZiYkE3QitGbDE5WnJQdDd4bldHWSsvc1RZL0k4M0gxdDB5ZkNMMUJi?=
 =?utf-8?B?R3ZVRStDRGlYbDEzbWFDb0tML0xsdmRWeGNmYnB0RFdKeW1zZWZ4eTc3YTAx?=
 =?utf-8?B?RFp2aTJHM0pEMnNFL0RwR09iWEdzZkdGVFk2UmNwanNJTk9OVHBkU29kQnVm?=
 =?utf-8?B?Z0RTWkdjanR5bmJmZnBNbHpDZjFoKy96Q0FWakt5WlRVekxLbzRHQllSM1hJ?=
 =?utf-8?B?OFRzOUJiWXRWVEVvZG9sdmQxN1lMTUVsblYwczBnUyt4c2xRWTJxOUV1eEZK?=
 =?utf-8?B?N2NqeTEraFhOR3JXMlA2cGM4OGl2YlBzVmF4bzZpZDhDTkNadkV6c0JHQy9W?=
 =?utf-8?B?RUw4RjRUanY5ZUFYK1ZSSS9iVlRRSStPYVZ1T3ZLZk9XTUdjTndIV2w2dWdO?=
 =?utf-8?B?SkV1cGVSRzVLeDhuZXZzYUZuWjlpZldTaVk2amtsMDdFTDVUNjVQWTRGcUxK?=
 =?utf-8?B?c05sYzQ0MmxRVDMyM2U2TFhmUWlFWExPbzF4UnpkVGF4MnIyc0V0S2o5RnlH?=
 =?utf-8?B?QWtRak5rdWhSU1pHTjE1a3lNSWc0OVY5UGgrdDhBVEh0RDIxY3I0UHd3YkRt?=
 =?utf-8?B?TzlxR1l4ZXhvQjFuLzZiNWRZajVSbmV0cDQrZDhvaVg0a3F6UktqTDYxQXBx?=
 =?utf-8?B?L2thQTJMUUZhdGNiS090RGVkanFyRVBPQXZMc2hkT3hyOWo1SDRWMGVLUE1P?=
 =?utf-8?B?VW1Bd0wxYkxNUnBtYTZWR2grWGo3WUp4bDdSWk02SFVMZVBiZ2VmQlE1dG9h?=
 =?utf-8?B?blQxVUVDMjZ3bWpyU0FybkVRakJVOG5nUER3VWJ0UVN6dVFIYkZTeFJyN3d1?=
 =?utf-8?B?L1Z3TzNZdWtpTTlDQzRNN1JzYkJrMWpVZ1graldENUpiU2dsdUtwb3l6QS9h?=
 =?utf-8?B?K3QxV2hjbC9TLzhZWkRmR3pKNzN3T3pKdHhaUXMxOTJNSjhuczBxK0syS3Zo?=
 =?utf-8?B?T1pkTUpaOGJFYnZ3dGRXcFlLa0tNdGNjNmJ0S2VKY2pEY2QxTmJWQnhsbVBD?=
 =?utf-8?Q?tobZKNyYgBR9L?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7ea351-f580-4d20-c4e7-08d912403353
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 16:41:59.9379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEVmvzNyblmWYv8ghCXh6x59O6mLOSns6ymB1gi1E5O4S8o5r4Q5ewgKOIpALwcCKpbBB6LiznBer6XPV1xT67VMCu8BDuaABhPEgUJA5H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4860
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


On 07/05/2021 23:22, Matthew Barth wrote:
> On 5/6/21 5:34 PM, Thu Nguyen OS wrote:
>> ﻿On 06/05/2021, 23:30, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>
>>
>>      On 5/6/21 10:59 AM, Thu Nguyen OS wrote:
>>      >
>>      > On 06/05/2021, 20:09, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>      >
>>      >
>>      >     On 5/6/21 4:22 AM, Thu Nguyen OS wrote:
>>      >     > Hi,
>>      >     >
>>      >     > I’m supporting the fan control algorithms using phosphor-fan. Phosphor-fan monitoring and controlling require interface xyz.openbmc_project.Control.FanPwm in the fan inventory object.
>>      >     That is a sensor interface, not an interface that's added to inventory objects
>>      >     > https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>>      >     What you linked to here refers to where the fan inventory object is located and nothing to do with with the fan sensors that fan monitor is to be monitoring.
>>      >
>>      > [Thu Nguyen] The link detail about the inventory configuration in monitor.yaml for fan monitor  and fan.yaml for fan control feature. It should be " The relative path under inventory where the fan's inventory object exists ".
>>
>>      The README links refer to the use of JSON config files in place of YAML. YAML based configs for the fan presence and fan monitor applications has been deprecated, so please use JSON based configs instead. Fan control is in the process of getting converted to JSON based configs so that it too can have its YAML based config support deprecated. To enable the use of JSON, supply "json" to the PACKAGECONFIG and to continue using YAML based fan control, also provide "--disable-json-control" until fan control's support of JSON is completed. i.e.) https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/fans/phosphor-fan_%25.bbappend#L59-L60
>>
>>      > Look at the example of the fan control configuration  file named fan.yaml below you can see the yaml file includes "inventory" setting. And xyz.openbmc_project.Control.FanPwm interface is required interface for that inventory path.
>>      > https://github.com/openbmc/phosphor-fan-presence/blob/master/control/example/fans.yaml
>>      Now to address what you're seeing, the "inventory" entry for fans.yaml is just used to name a fan object created within fan control and not related to anything actually in dbus inventory. This will become "name" in the JSON based (fans.json) for fan control.
>>      >     >
>>      >     > But FanSensor daemon of dbus-sensor only adds /xyz/openbmc_project/sensors/fan_tach to inventory list, and this path don’t support xyz.openbmc_project.Control.FanPwm interface.
>>      >     I cant speak to the support of dbus-sensors and the use of the FanPwm interface, but phosphor-fan-monitor can support either the use of RPM or PWM fan sensors for monitoring and updating the corresponding OperationalStatus of a fan in inventory.
>>      >     https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/sensors.md
>>      >
>>      >     Supplying the ` "target_interface": "xyz.openbmc_project.Control.FanPwm" ` directs fan monitor to monitor the fan sensor using the Target property from that interface. When the "target_interface" is not provided on a fan sensor, the default is to use the "xyz.openbmc_project.Control.FanSpeed" (RPM) interface.
>>      > [Thu Nguyen]
>>      > The point here is the phosphor-fan-monitor/control expect xyz.openbmc_project.Control.FanPwm or xyz.openbmc_project.Control.FanSpeed is included in /xyz/openbmc_project/sensors/fan_tach.
>>      > But dbus-sensor don't support that. In dbus sensor xyz.openbmc_project.Control.FanPwm is only available in /xyz/openbmc_project/control/fanpwm.
>>      Ok, that clarifies things...and I welcome a proposed change to support the different dbus object paths in which the xyz.openbmc_project.Control.* interfaces that the fan sensors can be be at. Before dbus-sensors existed in openbmc, the fan sensors were provided by phosphor-hwmon on the dbus object path of /xyz/openbmc_project/sensors/fan_tach regardless of being PWM or RPM so that's why they are looking at that path.
>>
>> [Thu Nguyen]
>> How about add target_path option in fan.yaml and monitor.yaml to set the dbus object path?
>> Example:
>> target_path: /xyz/openbmc_project/control/fanpwm.
>> The setting of target_path will override value of "FAN_SENSOR_PATH" in fan.cpp and tach_sensor.hpp.
> Does dbus-sensors place the sensor value of the fan on the same dbus object path as the target? Fan monitor looks for the interfaces of both the target and the sensor value(feedback) on the same dbus object path.

[Thu]

1. No. Dbus-sensor provided three difference path for one fan:

/xyz/openbmc_project/control/fanpwm/<Name> have 
xyz.openbmc_project.Control.FanPwm.Target to control fan.

/xyz/openbmc_project/sensors/fan_tach/<Name> have fan tach value in 
xyz.openbmc_project.Sensor.Value.Value.

/xyz/openbmc_project/sensors/fan_pwm<Name> have fan Pwm value in 
xyz.openbmc_project.Sensor.Value.Value.


2. I tried to update fan control to support "target_path" option, but 
still have issue with fan monitor.


3. I wonder when I set has_target=false in monitor.yaml, the fan 
functional in inventory is set as false.

If don't have the fanpwm value, fan monitor should bypass checking fan 
failure in programming speed.

Is this right?

>>      >     >
>>      >     > Do you have any solution to make phosphor-fan work with dbus-sensor?
>>      >     >
>>      >     > I’m currently update FanSensor in dbus-sensor to add xyz.openbmc_project.Control.FanPwm to /xyz/openbmc_project/sensors/fan_tach.
>>      >     Refer to the doc link I provided above on how to utilize monitoring fans that use a PWM target on that interface. Then phosphor-fan-monitor will update the fan inventory object's (as configured with https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md) xyz.openbmc_project.State.Decorator.OperationalStatus Functional property based on how you configure fan monitor to monitor the fan sensors.
>>      >     >
>>      >     > Regards.
>>      >     > Thu Nguyen.
>>      >
>>
