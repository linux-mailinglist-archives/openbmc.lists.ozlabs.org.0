Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F12DCAF7
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 03:24:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxG5q1RfnzDqP1
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 13:24:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.128;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=IeALCutW; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2128.outbound.protection.outlook.com [40.107.237.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxG4p2JRnzDqP1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2020 13:23:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZwJM1ZtV28yWhd5EvaD7pwDRrsdL9BKDH62Yweuve9Mt0EqW48RGprK4k7RxcCQERQnfvoPyINv+dgsFD5SU6jMvEDejIIs3Go3XMaO6PuNKFYdw+0Cvz9ZyXqH2YvKo+sgZl6YakK7NaSniUY1TIw2h72TYVxKUqDX19vhPNsuUc4S9XIQNGN1rGJ0zVvSZ8bapajA3ODhO1CszsMUkMT9Ctx+OO7yL5vYHHrXpWjnhnm/eQ87/yd8NXyLyb/q4JvUjsf1ZelwieHTKYUAwq8QmmUPNXqwtcw5sadvDwLfIeYTdNuIHPbB9mMgRejL6EPtCXIGk48wrbr4VX8Caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81VVbsrn/yv4WDAoFZgxP7hkJ3FUchESiTzmYU8vBTM=;
 b=kUf7ctiSQ93/CaML8eH1imRivz4b6pwSGus/rDer0HS3ULmaxhuO2nmwkl2BZSedfOurO6G2e6vWTlknN2H8zdRo78v0Oz9ItyfNwdaYLkXrugjHz5vmdRNv+8xenM5wp9bPyo4x6fBAvarwebee7sIyXRAf2G7sZIjWzizLrmOtzxLjAEame0qU0yNVybTJEj+QPHh7G2984JRn6QViNA6q2d7Lx9vLkQdbIF9i1WaOnScAe6jKV3h8r1/pqhEyhx8HF56hWw6oDV+OfcaXYULm6Ivan5I8frEIFT0bN4hZep5dS6dD0LAoH1XPsk+PN2sa2SXBAlo9mx2+j1C7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81VVbsrn/yv4WDAoFZgxP7hkJ3FUchESiTzmYU8vBTM=;
 b=IeALCutWYKNOLm+uDgBK9YMJA6pC375lUbX5y4SvPBUEN8XwkyHd3e2cC9UGG/I2EY9+W7CkDaVdW/WItMb525vyyK1O5ic8+2ZckeCUE/HXGJ9dEuSiWuDgwu30/hbfJPf4s0MFbRv5pEQRnmSESCIuiQOsRpZhvbZXiMIeEZA=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5371.prod.exchangelabs.com (2603:10b6:5:159::25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Thu, 17 Dec 2020 02:23:11 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%7]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 02:23:10 +0000
Subject: Re: phosphor-hwmon + phosphor-fan: Fan functional properties are
 mismatched when unplug fan
To: Matthew Barth <msbarth@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <117d107d-236d-d361-7188-42065baaa656@amperemail.onmicrosoft.com>
 <c610636d-bf38-4077-edbf-5e0ad727a3ab@linux.ibm.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <7d637357-bc60-032a-712a-cc165d96c573@amperemail.onmicrosoft.com>
Date: Thu, 17 Dec 2020 09:23:00 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <c610636d-bf38-4077-edbf-5e0ad727a3ab@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------DCE877D4772BACBB30251516"
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:202:2::23) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HK2PR0401CA0013.apcprd04.prod.outlook.com (2603:1096:202:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 02:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc301e11-0ac1-4415-447a-08d8a232b318
X-MS-TrafficTypeDiagnostic: DM6PR01MB5371:
X-Microsoft-Antispam-PRVS: <DM6PR01MB53711EEAB25A1A24AF702D9890C40@DM6PR01MB5371.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8nnCE0Zewi/3zjJ4Y5LWj5PGjSKPvT/8SyLzB9IOMxmwt0usbRp5oQokGB8bvjWeOT5/n0caRccU0i1DloL4TJiclRmV1D5PjhC0zAT+nYKpLrIAYjo3P1NHajAyxCSIuaj9kmCtnRWva4ql2aP/U997VMIHowxJxdrX63vMEfhtj25El2M8/i1K49uM0HjY6bY4cJTTxRS9VmcWm3fUQiby58LUto+Y5Sf/+Mf218p+HKHvuIuH4rYb0BrhdmH8wgLED6zXRC8uTY+M9NzCHwAuzT7AHirC1YymvKGgm4q2Cjg2QwY3+pL3sLdXtfkm7bbYQMpkUKNdCQJVreF7mIE+FVgAQCV9/8KdI/ldgJvtCPW3ZeUTjdG7j54dYeN8xybgZIfowthH+mP0YpVzLB1G/P87GBuBcxUYlu/Nbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(42882007)(186003)(83380400001)(83170400001)(6666004)(8936002)(316002)(2616005)(8676002)(16576012)(478600001)(31696002)(16526019)(66946007)(66476007)(6486002)(33964004)(19627235002)(26005)(956004)(5660300002)(52116002)(31686004)(66556008)(53546011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0JMSlhrd0ZreXp6c3hYVnhkRUtVRXVpcWlVNU8rZ2Y3N1Q3VUI2c1l0K3I1?=
 =?utf-8?B?R3FTQVRBaDhjTG9raUN0ZmYyUlVQTEZOV3c1MVBOVGhLQ3I0WEdNN3hUZ3A5?=
 =?utf-8?B?bGc2ekloYjRlQnVkQ3gzRXAxNWl0b0EyN3Z4RWd3bVNXb1d5bWFSQXVsMEox?=
 =?utf-8?B?QTJqdUVod21oZ2lQRy9YZnlrKzFFNStwQU1lSVhXNmZMaGZyMnRLKzUzeTVC?=
 =?utf-8?B?NHVqUkV4UHo2d1pQMm1MYVlReC9OTExySGlhYnlZMnl6bWV1OFRyQUh6ZWF2?=
 =?utf-8?B?T2s4MXpWK3o2dXVFeHdsSzY5MEFtSEJlcVFvbTlNRk1KRkhGTCsvM2xieW1S?=
 =?utf-8?B?eTRGMW81aHpXUEFHUWgxclZIVmYwd1pnaHVYY3cxRS9udGNvWTRKUXk1Sjg1?=
 =?utf-8?B?OTJld25YMEVJbGVzbHFjc3JheUwvUG1QNHgrV0Y4Y05tOWVRMmdrWTNlMkJ3?=
 =?utf-8?B?QThsalA0RTZtZ3Zhc0Z1WDR0Y1d4N3RjTVVHMlpja1RRYVZyUkphRzFnMk5P?=
 =?utf-8?B?Z0t3SEJKUzlGY0g5eVM5V1lYZUNabHN6VEpMbkZUUmFqclJBRyt0UXF4QjVX?=
 =?utf-8?B?NEl0VHVPb1FnK0JkUzY3R3Q2Z2lVbml0bzJ0L0M3M0RKOUVCYzIwb3lOTlNu?=
 =?utf-8?B?UGE1SzBNbTc5dVZJNHhHOXJvVzlBQ1FDUEQ5S1F0T3l4UHZoanFPUVh2VDZ6?=
 =?utf-8?B?bmdwQ2I2UXZTL2FIOXEzdW0rU1F1czJnSUVjdktKZWZtdFZXYWhndDFROHJz?=
 =?utf-8?B?KzBaNXhiOWxUNElQZkVvTEsvWXFQT3JTckJTbG8wYkVrcmRpV0RGY3YvQ3NW?=
 =?utf-8?B?elk4UWk4U2FvSXhUSS8ybWZhYzBHckxiZVhGWWk2NmZPcHJyRmh6Vy9BaEYw?=
 =?utf-8?B?L0ZFcUpVUitsV21HMWt2c25tM3JneE1HQkpSZi83cTFmd1J6ZlVqaXMzZndM?=
 =?utf-8?B?VUpGRllCQUkyYWtRcWpGQmxDbVdrZlIwZlZNSVZrV2Ftb2g1L3V4OXpYNHRF?=
 =?utf-8?B?d2pyRHd1TVVqSm9yNzY5S1c3dW5vM2JDckRTdUtrdzZpVkdsakR0V01Pdktr?=
 =?utf-8?B?WmlsNmdDc3B6Uk1aVWRMaEJYL01PQ0tBUDMrT0M3T3lqeGxkQ3IxUGJ4WjVh?=
 =?utf-8?B?THhmR1FXVEhobzZuTTZiaWREVHlVWWZNSGhndC82emR4UE85RVFudXN2aHBY?=
 =?utf-8?B?aEhSN2RIbENwWGg2ZlJhc2VlcnFUZmdqWGJqNzViQkJHK3NIWWxteUVyUWQw?=
 =?utf-8?B?UExxeGQ5eVZNekRaQU50SkRLZW9BV29qNkJDRWx1N2QzTk10RElINlBYclBh?=
 =?utf-8?Q?JnHM+iakb1NLznCKxsjVkCKAcuQZrrnNll?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 02:23:10.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: cc301e11-0ac1-4415-447a-08d8a232b318
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhcGiqAJZlwaCFIGBFRx4JCq6B8/cxyNE/y3EjE1+ZzpLxsdcMjl1iZdvGrN//uWPW37ZdfdKPZgS9nZ4ZAdMB9lkM2QOfvu2fUD3H5xqkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5371
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

--------------DCE877D4772BACBB30251516
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/20 05:03, Matthew Barth wrote:
>
> On 12/16/20 2:03 AM, Thu Nguyen wrote:
>> Hi,
>>
>>
>> In the current code of phosphor-hwmon, when flag 
>> --enable-update-functional-on-fail is set. The fan functional DBus 
>> property in sensors interface will be set to false when unplug fans 
>> (FAN4_2).
>>
>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>> b false
>>
>> AND the fan Value properties will keep the latest reading value 
>> before unplug.
>>
>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>> xyz.openbmc_project.Sensor.Value Value
>>
>> d 4794
>>
>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>> xyz.openbmc_project.Sensor.Value Value
>> d 4794
>>
>> This cause phosphor-fan-monitor failed to detect the fan failure so 
>> the fan functional are wrong.
>>
>> busctl get-property xyz.openbmc_project.Inventory.Manager 
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>> b true
>>
>> Should phosphor-hwmon keep updating the fan value Dbus properties 
>> with error code when the fans is nonfunctional? Or 
>> phosphor-fan-monitor should also check the fan functional in sensor 
>> interface to update fan functional in inventory interface?
>>
> I recall this was something that would be needed in 
> phosphor-fan-monitor when a fan's sensor is marked faulted since the 
> value should no longer be trusted by phosphor-fan-monitor. A 
> phosphor-fan-monitor configuration option needs to be added per fan 
> sensor to check the sensor's functional property and use that to 
> update the fan's functional state in inventory as well.
>
> Please feel free to submit a patch to add this configuration option to 
> drive setting the fan's functional state in inventory based on the 
> state of a fan sensor's functional state.
>
>
> Matt
>
>>
>> Regards.
>>
>> Thu Nguyen.
>>
>>
>>
How about Fan Present property? Should we update it to false when fan 
sensor functional is false?

I think we can add option "fan_sensor_func_to_fan_inventory_func" in fan 
configuration as below:

- inventory: /system/chassis/motherboard/FAN3_1
allowed_out_of_range_time: 30
deviation: 15
num_sensors_nonfunc_for_fan_nonfunc: 1
fan_sensor_func_to_fan_inventory_func: true
sensors:
- name: FAN3_1
has_target: true
target_interface: xyz.openbmc_project.Control.FanPwm
factor: 82
offset: 0

In phosphor-fan-monitor, for each fan, we will signal the fan functional 
property in sensor, and update the fan function in inventory when that 
property is changed. Maybe we should update fan present in inventory also.


Thu Nguyen


--------------DCE877D4772BACBB30251516
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPGRpdiBjbGFz
cz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxMi8xNy8yMCAwNTowMywgTWF0dGhldyBCYXJ0aCB3cm90
ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpj
NjEwNjM2ZC1iZjM4LTQwNzctZWRiZi01ZTBhZDcyN2EzYWJAbGludXguaWJtLmNvbSI+CiAgICAg
IDxicj4KICAgICAgT24gMTIvMTYvMjAgMjowMyBBTSwgVGh1IE5ndXllbiB3cm90ZToKICAgICAg
PGJyPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5IaSwKICAgICAgICA8YnI+CiAgICAg
ICAgPGJyPgogICAgICAgIDxicj4KICAgICAgICBJbiB0aGUgY3VycmVudCBjb2RlIG9mIHBob3Nw
aG9yLWh3bW9uLCB3aGVuIGZsYWcKICAgICAgICAtLWVuYWJsZS11cGRhdGUtZnVuY3Rpb25hbC1v
bi1mYWlsIGlzIHNldC4gVGhlIGZhbiBmdW5jdGlvbmFsCiAgICAgICAgREJ1cyBwcm9wZXJ0eSBp
biBzZW5zb3JzIGludGVyZmFjZSB3aWxsIGJlIHNldCB0byBmYWxzZSB3aGVuCiAgICAgICAgdW5w
bHVnIGZhbnMgKEZBTjRfMikuCiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAgICB+IyBi
dXNjdGwgZ2V0LXByb3BlcnR5CiAgICAgICAgeHl6Lm9wZW5ibWNfcHJvamVjdC5Id21vbi0xNjQ0
NDc3MjkwLkh3bW9uMQogICAgICAgIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZmFuX3Rh
Y2gvRkFONF8yCiAgICAgICAgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5EZWNvcmF0b3IuT3Bl
cmF0aW9uYWxTdGF0dXMgRnVuY3Rpb25hbAogICAgICAgIDxicj4KICAgICAgICBiIGZhbHNlCiAg
ICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAgICBBTkQgdGhlIGZhbiBWYWx1ZSBwcm9wZXJ0
aWVzIHdpbGwga2VlcCB0aGUgbGF0ZXN0IHJlYWRpbmcgdmFsdWUKICAgICAgICBiZWZvcmUgdW5w
bHVnLgogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgICAgfiMgYnVzY3RsIGdldC1wcm9w
ZXJ0eQogICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuSHdtb24tMTY0NDQ3NzI5MC5Id21vbjEK
ICAgICAgICAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl90YWNoL0ZBTjRfMgogICAg
ICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU2Vuc29yLlZhbHVlIFZhbHVlCiAgICAgICAgPGJyPgog
ICAgICAgIDxicj4KICAgICAgICBkIDQ3OTQKICAgICAgICA8YnI+CiAgICAgICAgPGJyPgogICAg
ICAgIH4jIGJ1c2N0bCBnZXQtcHJvcGVydHkKICAgICAgICB4eXoub3BlbmJtY19wcm9qZWN0Lkh3
bW9uLTE2NDQ0NzcyOTAuSHdtb24xCiAgICAgICAgL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29y
cy9mYW5fdGFjaC9GQU40XzIKICAgICAgICB4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1
ZSBWYWx1ZQogICAgICAgIDxicj4KICAgICAgICBkIDQ3OTQKICAgICAgICA8YnI+CiAgICAgICAg
PGJyPgogICAgICAgIFRoaXMgY2F1c2UgcGhvc3Bob3ItZmFuLW1vbml0b3IgZmFpbGVkIHRvIGRl
dGVjdCB0aGUgZmFuIGZhaWx1cmUKICAgICAgICBzbyB0aGUgZmFuIGZ1bmN0aW9uYWwgYXJlIHdy
b25nLgogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgICAgYnVzY3RsIGdldC1wcm9wZXJ0
eSB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5NYW5hZ2VyCiAgICAgICAgL3h5ei9vcGVu
Ym1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL0ZBTjRfMgog
ICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuRGVjb3JhdG9yLk9wZXJhdGlvbmFsU3Rh
dHVzIEZ1bmN0aW9uYWwKICAgICAgICA8YnI+CiAgICAgICAgYiB0cnVlCiAgICAgICAgPGJyPgog
ICAgICAgIDxicj4KICAgICAgICBTaG91bGQgcGhvc3Bob3ItaHdtb24ga2VlcCB1cGRhdGluZyB0
aGUgZmFuIHZhbHVlIERidXMKICAgICAgICBwcm9wZXJ0aWVzIHdpdGggZXJyb3IgY29kZSB3aGVu
IHRoZSBmYW5zIGlzIG5vbmZ1bmN0aW9uYWw/IE9yCiAgICAgICAgcGhvc3Bob3ItZmFuLW1vbml0
b3Igc2hvdWxkIGFsc28gY2hlY2sgdGhlIGZhbiBmdW5jdGlvbmFsIGluCiAgICAgICAgc2Vuc29y
IGludGVyZmFjZSB0byB1cGRhdGUgZmFuIGZ1bmN0aW9uYWwgaW4gaW52ZW50b3J5CiAgICAgICAg
aW50ZXJmYWNlPwogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgIDwvYmxvY2txdW90ZT4K
ICAgICAgSSByZWNhbGwgdGhpcyB3YXMgc29tZXRoaW5nIHRoYXQgd291bGQgYmUgbmVlZGVkIGlu
CiAgICAgIHBob3NwaG9yLWZhbi1tb25pdG9yIHdoZW4gYSBmYW4ncyBzZW5zb3IgaXMgbWFya2Vk
IGZhdWx0ZWQgc2luY2UKICAgICAgdGhlIHZhbHVlIHNob3VsZCBubyBsb25nZXIgYmUgdHJ1c3Rl
ZCBieSBwaG9zcGhvci1mYW4tbW9uaXRvci4gQQogICAgICBwaG9zcGhvci1mYW4tbW9uaXRvciBj
b25maWd1cmF0aW9uIG9wdGlvbiBuZWVkcyB0byBiZSBhZGRlZCBwZXIKICAgICAgZmFuIHNlbnNv
ciB0byBjaGVjayB0aGUgc2Vuc29yJ3MgZnVuY3Rpb25hbCBwcm9wZXJ0eSBhbmQgdXNlIHRoYXQK
ICAgICAgdG8gdXBkYXRlIHRoZSBmYW4ncyBmdW5jdGlvbmFsIHN0YXRlIGluIGludmVudG9yeSBh
cyB3ZWxsLgogICAgICA8YnI+CiAgICAgIDxicj4KICAgICAgUGxlYXNlIGZlZWwgZnJlZSB0byBz
dWJtaXQgYSBwYXRjaCB0byBhZGQgdGhpcyBjb25maWd1cmF0aW9uCiAgICAgIG9wdGlvbiB0byBk
cml2ZSBzZXR0aW5nIHRoZSBmYW4ncyBmdW5jdGlvbmFsIHN0YXRlIGluIGludmVudG9yeQogICAg
ICBiYXNlZCBvbiB0aGUgc3RhdGUgb2YgYSBmYW4gc2Vuc29yJ3MgZnVuY3Rpb25hbCBzdGF0ZS4K
ICAgICAgPGJyPgogICAgICA8YnI+CiAgICAgIDxicj4KICAgICAgTWF0dAogICAgICA8YnI+CiAg
ICAgIDxicj4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPGJyPgogICAg
ICAgIFJlZ2FyZHMuCiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAgICBUaHUgTmd1eWVu
LgogICAgICAgIDxicj4KICAgICAgICA8YnI+CiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAg
ICAgPC9ibG9ja3F1b3RlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHA+SG93IGFib3V0IEZhbiBQ
cmVzZW50IHByb3BlcnR5PyBTaG91bGQgd2UgdXBkYXRlIGl0IHRvIGZhbHNlIHdoZW4KICAgICAg
ZmFuIHNlbnNvciBmdW5jdGlvbmFsIGlzIGZhbHNlPzwvcD4KICAgIDxwPkkgdGhpbmsgd2UgY2Fu
IGFkZCBvcHRpb24gJnF1b3Q7ZmFuX3NlbnNvcl9mdW5jX3RvX2Zhbl9pbnZlbnRvcnlfZnVuYyZx
dW90OwogICAgICBpbiBmYW4gY29uZmlndXJhdGlvbiBhcyBiZWxvdzo8L3A+CiAgICA8ZGl2IHN0
eWxlPSJjb2xvcjogI2Q0ZDRkNDtiYWNrZ3JvdW5kLWNvbG9yOiAjMWUxZTFlO2ZvbnQtZmFtaWx5
OiBNZW5sbywgTW9uYWNvLCAnQ291cmllciBOZXcnLCBtb25vc3BhY2U7Zm9udC13ZWlnaHQ6IG5v
cm1hbDtmb250LXNpemU6IDE4cHg7bGluZS1oZWlnaHQ6IDI3cHg7d2hpdGUtc3BhY2U6IHByZTsi
PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAtIDwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6ICM1NjljZDY7Ij5pbnZlbnRvcnk8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
ZDRkNGQ0OyI+OiA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjY2U5MTc4OyI+L3N5c3RlbS9j
aGFzc2lzL21vdGhlcmJvYXJkL0ZBTjNfMTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJj
b2xvcjogI2Q0ZDRkNDsiPiAgICA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNTY5Y2Q2OyI+
YWxsb3dlZF9vdXRfb2ZfcmFuZ2VfdGltZTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0
ZDQ7Ij46IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNiNWNlYTg7Ij4zMDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPiAgICA8L3NwYW4+PHNwYW4gc3R5
bGU9ImNvbG9yOiAjNTY5Y2Q2OyI+ZGV2aWF0aW9uPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjog
I2Q0ZDRkNDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2I1Y2VhODsiPjE1PC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgIDwvc3Bhbj48c3Bh
biBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij5udW1fc2Vuc29yc19ub25mdW5jX2Zvcl9mYW5fbm9u
ZnVuYzwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij46IDwvc3Bhbj48c3BhbiBz
dHlsZT0iY29sb3I6ICNiNWNlYTg7Ij4xPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNv
bG9yOiAjZDRkNGQ0OyI+ICAgIGZhbl88L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNTY5Y2Q2
OyI+c2Vuc29yX2Z1bmNfdG9fZmFuX2ludmVudG9yeV9mdW5jPC9zcGFuPjxzcGFuIHN0eWxlPSJj
b2xvcjogI2Q0ZDRkNDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzU2OWNkNjsiPnRy
dWU8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij4gICAgPC9z
cGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzU2OWNkNjsiPnNlbnNvcnM8L3NwYW4+PHNwYW4gc3R5
bGU9ImNvbG9yOiAjZDRkNGQ0OyI+Ojwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xv
cjogI2Q0ZDRkNDsiPiAgICAgIC0gPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzU2OWNkNjsi
Pm5hbWU8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+OiA8L3NwYW4+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjY2U5MTc4OyI+RkFOM18xPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5
bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgICAgICA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
NTY5Y2Q2OyI+aGFzX3RhcmdldDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij46
IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij50cnVlPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgICAgICA8L3NwYW4+PHNwYW4gc3R5
bGU9ImNvbG9yOiAjNTY5Y2Q2OyI+dGFyZ2V0X2ludGVyZmFjZTwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6ICNkNGQ0ZDQ7Ij46IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNjZTkxNzg7Ij54
eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgICAgICA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9y
OiAjNTY5Y2Q2OyI+ZmFjdG9yPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPjog
PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2I1Y2VhODsiPjgyPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgICAgICA8L3NwYW4+PHNwYW4gc3R5bGU9
ImNvbG9yOiAjNTY5Y2Q2OyI+b2Zmc2V0PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRk
NDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2I1Y2VhODsiPjA8L3NwYW4+PC9kaXY+
PC9kaXY+CiAgICA8cD5JbiBwaG9zcGhvci1mYW4tbW9uaXRvciwgZm9yIGVhY2ggZmFuLCB3ZSB3
aWxsIHNpZ25hbCB0aGUgZmFuCiAgICAgIGZ1bmN0aW9uYWwgcHJvcGVydHkgaW4gc2Vuc29yLCBh
bmQgdXBkYXRlIHRoZSBmYW4gZnVuY3Rpb24gaW4KICAgICAgaW52ZW50b3J5IHdoZW4gdGhhdCBw
cm9wZXJ0eSBpcyBjaGFuZ2VkLiBNYXliZSB3ZSBzaG91bGQgdXBkYXRlCiAgICAgIGZhbiBwcmVz
ZW50IGluIGludmVudG9yeSBhbHNvLjwvcD4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxwPlRo
dSBOZ3V5ZW48YnI+CiAgICA8L3A+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--------------DCE877D4772BACBB30251516--
