Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A43D27B0
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 18:36:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVylN60Gvz302J
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 02:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=DPABuwHY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.134;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=DPABuwHY; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2134.outbound.protection.outlook.com [40.107.237.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVyl15ssFz2yL1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 02:36:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBT5K4JpJTjjGxE7ssRZMzSWdiZX1TjVsPZyv67PhdXyAqOfH+9lxDuTMjabtEEYOw4mZ2gNQZbeJO73BiulzedllB8o2Dqfw3kYT8vrYXGgWRXDkFaOEpT/UVeBJboCocrLzUePMU1DTZ5IwSmspr9KA7DhlqpeSvE1g8H+MLKdkbV1UDBUhM0CzU/IGieMvqIy5lDXfcejkM8OBXB2MxNhA/0p9AznxyT6CxpBJ4RolyiMVIwu2mpqCVzLNhacGRrTG4nQlFxGZoU28Y9/MjGGcOGmEJJzvUTsjjXKpSHoMeD8wsUU74W6+FZ2R/nhaqGyIaFiL4Je3sbe8jvVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuNWg+jjXoG7HT0taHnZOIyDQwuHl+0DDw7xRx7cUhM=;
 b=obfg4NJ6+SlyFKiHT/DbMPdkMHbpItLAxCskBgOqJrLugrQj+dG6SPI14mfA+F26sMFmu/tDSKxjEIyZBMBhAeQSFZNntkp459mOsFi3pfAp/i6pKzii28dSjhmi/KGAlDCfZN0cj8dl0Q9N9Rt+xK6mZETJTyh7vAWr8J8U+FFigbQFwSQ9dvjAfSVABshIanDOqFCNouqW43iilm2/swleZvJe3vbajXIgbsAFIRbZtyYWoPsBq6jZ5cox1RGga/V7iGGEPI+TutonygmC3jXH+gN2KPYwhXW7ggYFfd4boRG0FORd0htulH8hQMVIQolWBx+IiZ0wze18RGv6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuNWg+jjXoG7HT0taHnZOIyDQwuHl+0DDw7xRx7cUhM=;
 b=DPABuwHYJLv7he6mHItrv5I45968w/2LRDIsAW7w9VDOeJzN0Z9hJ4JmzXre9H0rj3Qq5Q++ogNGwUJ/YnV6XqCS1Ig6oskjv4X/eCljDWVhxgW5aFYh7rh7JqMOznJT90jw1uwukKgjH9cwNLS4ALoIhCqFJwMCfFs3ChNZDnM=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5995.prod.exchangelabs.com (2603:10b6:5:14d::31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Thu, 22 Jul 2021 16:36:07 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::a40b:475:ce32:50ab]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::a40b:475:ce32:50ab%7]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 16:36:07 +0000
Subject: Re: Add socsesor daemon to handle Ampere SoC sensors in dbus-sensors.
To: Ed Tanous <edtanous@google.com>
References: <e8730a3b-9cf3-7167-20f2-e7031a6c6f69@amperemail.onmicrosoft.com>
 <CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <0e248fdd-4517-434e-3288-6037bee44af1@amperemail.onmicrosoft.com>
Date: Thu, 22 Jul 2021 23:35:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5FC95433359985C59A07274E"
Content-Language: en-US
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4ed0:4d24:37d2:acb3:1492]
 (2402:800:6344:4ed0:4d24:37d2:acb3:1492) by
 HK2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:202::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Thu, 22 Jul 2021 16:36:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61ce35c4-dbf3-4780-9eaf-08d94d2ece45
X-MS-TrafficTypeDiagnostic: DM6PR01MB5995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR01MB59959A15CA4661192E3687A290E49@DM6PR01MB5995.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNviJaks5zJqj4LtLZA4zxUUmVv9xXvXTiy3wKo4RlTeJqJi+oPkpusrnwlQIZwTXX1oQ2gGCd56WV13ZebAx7S8BSfgY2lekECTyYFBrm86QIvdq7QgWZ3ep159wJubzmBi2QwATQ7y76CaEBkOvyXRvLXnc0uiDPs5VQzif8aVVI5tPylkNsOiVGetbo4PH9vYZRRi1sb3P1DTD82fu5/WCdK1Z6/l8EmVDmSlWCEtF0pLrTHx3312fXZK5Ui3n+wxNtC0JIECRQKIuqzGnPPDVjjoQ1Hw+0YnbisV9RgwHmshyEqEs700Hlm/dg5CHfY4osHfIQUVvimmwsCe9WpnfF9peLncMhNX/A8JDKI5G0J2tk+2e6Wda7uWfunTNInV/GpJNzM+hD5MBMGL52odM38LfMRqpxJusTyFJ6AahpyOj6Pb5FPotkzaGaCcPJ2I+PUrpGVbeXK0TNqI74VaSxAw4xrqUrXVQpE2qbNHNQe+PAzjm/ewVV0DKoYq1k3BtKSuTDllEHOkROKC0CnSMZIuoJLQyE7kBk1Sci+Y2f1FaLv361p9ZTdpusXwlQUygO/Iu/JiCBiz0H8CHxEkWJbvUGPtRlnPFYtsIqgV9Qo/vcD0a5KRF4ScmyS8/tA//ikEe0WWedsHqffHCgkAagGFncpY8opbKJRp8vw9wbwSWUkr7iUy6XQakfujEPVWgscO7CJ+LjoMz0mYvA9yoDKRS73Pxo1EGJvVoaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39840400004)(136003)(31686004)(478600001)(66946007)(83170400001)(53546011)(6916009)(66476007)(66556008)(6666004)(33964004)(83380400001)(2616005)(52116002)(5660300002)(31696002)(8676002)(2906002)(30864003)(4326008)(42882007)(8936002)(107886003)(316002)(186003)(6486002)(54906003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckViTHhrUExrZzg0ZGwzemhwdVkwSm5aYWJlVHlmT1pOMkl4TUZ1WGRMSElC?=
 =?utf-8?B?MStmd2ZCZlEyemFJOGpGOFJBQWwvaFZ0dkpNVDQ3amdpbEJaNUtvUlQ3dEZl?=
 =?utf-8?B?QjRrcWgwUUFlWGhlYlgrSGt3TzRPeTEwZXllN3hXaVRobnhqdHdHSEFUVUZv?=
 =?utf-8?B?U1RzSGhnaGtCYXAzNlppNm5oN0ZiNHF5dHhjWit5SDd4UzVPMDJJbmNPSWdL?=
 =?utf-8?B?K1Q4Nm1WaTAxRUJIR05URFgzUFBTYWdjTytCTHk4OGg2MFhyNjhPK2JpSEND?=
 =?utf-8?B?Z1dBZ3cyejNFbWQzaWRadGxlYlhKalNWQkZrL0JZMDNLTUc4U04zOVFlMTRQ?=
 =?utf-8?B?MjBoWDBDQjhKM2pyT216UEQ4QTZVTnpVNElCYWlSR2hGL2dnWXNvM2ZxM0F4?=
 =?utf-8?B?dVFheS93WGdUNTVoMVYvWGVyZytsTVV3YjB2azQyS21VeTUvMHZkVmlBUnR3?=
 =?utf-8?B?dTd2cnN6Wk9NRmxKZWhCcUh4cTQ1WnM0dkNqRXV4TDZOdkhQL3Q3Yno5cW9k?=
 =?utf-8?B?NEI2MXF5cGlaaVpsMHN2OEhFa0lTQVVYbGJ4Sk5mTDNrRlUrTXFBdlZESlVE?=
 =?utf-8?B?OVhtcC9uY2VlSlByMXZWZWQwOXBUY0ltOVgwNmx6QlZhdlk1eDdGQ05PZUFB?=
 =?utf-8?B?bkREWWtnUnJWN3ozSk11a2tXeGlRMlBRRlJFeFV0MGd1TWg4M1hKekM0ZEhD?=
 =?utf-8?B?T0QrK29DRGlrMUdqWDEyOExFM1lxblpWdzgvN1ZQZmhPSjA0dXY4cmZEQkdU?=
 =?utf-8?B?SnhOSDdUSnl4bW53WlpLWTBqdkVMT1A2NHJVRzZqNURXMzNqSVIrYnUrSkth?=
 =?utf-8?B?RGx3ejlDbllweFQzajNjYjcvZWhMa0dzZGR5UEprZE1NcUpDLzZhalZORG9m?=
 =?utf-8?B?UTBaMnBsZXpnSEtSV0xOVkgzQktJNWtFdURRYzFLM3JaSW8yNjFVU1d3Tytn?=
 =?utf-8?B?ZTBETThlcW91YjRzQmR1MkRVY0pRTGEraE9HZXptOFlkaWNWS1ZoNXQxYURl?=
 =?utf-8?B?YnVxYkJSRW5qRER6NVhzOE1NbGMyQzlKT3lsa1dvQmhCMnBSRDAxNldpRkVu?=
 =?utf-8?B?SjlZbzZXTzU4bi9XTkFvNHgxM21vQldhYWFBL09KN2Z0Qmc0WnMrNmZlYndL?=
 =?utf-8?B?akQvQmZnd0lJak5IQTg5ZjMrNmxKWWZtNStSbkJKNWl6aFo2ZjVOTFIweFJw?=
 =?utf-8?B?dERhQy93LzVqeU1JbGxwRzRma09kdnF2WDdPdGNJcDVMSVpCbVQ5NFgvWTR0?=
 =?utf-8?B?Z0pGMElNT293c1ZaUEVwd041UUNXNjNBKzJKd1RhU3ViN0Y5ZlRPTFpRYzVV?=
 =?utf-8?B?bXlJNFowSTAxbm9POG14cW9jdFJKLzZNUmYrSU9IL2JZcmFIYUQxd082YmFw?=
 =?utf-8?B?K3J5ZWxiUHdDcTFHRUxwUzdyaFdRK2NqbUkwcGRER3RFVTdDWXpMZUI1T04z?=
 =?utf-8?B?VzJBQ2Z5ajgrdmt5djA0OTNnSWhKemhId2tMWHpIbnREVGpNZHpJbGtpLytD?=
 =?utf-8?B?cGI4c21CWmVWZDAyaG9NcEI4c0lJSG0yZ1dMcE1IWUFHUmIvb1J2NzZmYkpj?=
 =?utf-8?B?R1FCYTdOOHRUT3piVVpVTUtPbVA4WHA2VEp5SjE1eW1TTTMwL1dnZkd0RC9y?=
 =?utf-8?B?WGRva0VEWDBhbXdPdEdBSGVodXBuZ0ZFRnpBQ0JiWlNVbHY3cUZkVE1VdjNk?=
 =?utf-8?B?d2daNkRBYTNsbk4rU21COXNyYnFQUDh4bTdMWHBBUTVpU2w0bTdha1huN3oz?=
 =?utf-8?B?cWlKcURkZDZnYUlkOEh4eTNCdmhEL3F6T3dudW5LZzg2MmtVZGZmaU9yZHEy?=
 =?utf-8?B?blJtc3BMSEI0NytLRU0vczRid1hKenJBZ0VqUEV2SmpFR2tDVXNvYkgxQ3Z6?=
 =?utf-8?Q?u5vp5e+WN4W+v?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ce35c4-dbf3-4780-9eaf-08d94d2ece45
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 16:36:07.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDDMM+EN/Bf7LNEU0E5fajHLpIuvtJBKA2K3plEPXqeDHI4ROX2ucOATWLwYbd3Ykuwvl6YcP/MQTRbnM2znoKzlnxs837lMBh4eznvNGGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5995
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------5FC95433359985C59A07274E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/07/2021 23:15, Ed Tanous wrote:
> On Thu, Jul 22, 2021 at 8:56 AM Thu Nguyen
> <thu@amperemail.onmicrosoft.com> wrote:
>> Dear Ed Tanous,
>>
>>
>> As we discussed before about the Ampere CPU daemon in OpenBmc general discord channel. I'm planing to submit the some patches which will add to AmpereSoC daemon source code to dbus-sensors for reviewing. This daemon will handle Ampere Altra SoC sensors. The functions of this daemon are the same as CPUSensor daemon which is handling Xeon CPU sensors.
>>
>> Below is what I will add.
>>
>>      1. Add some files to to Dbus-sensors source:
>>
>>          ./src/AmpereSoCMain.cpp : Match the sensors configurations in entity-manager configuration file with sensor paths in the device driver. And create the SoC sensor dbus objects.
> At this same time, we should rename "CPU sensor" to "Intel CPU" so we
> can easily differentiate.  Ideally your new daemon would also be
> called "AmpereCPU" to keep the naming conventions the same.

I will use AmpereCPU name. And will rename "CPU sensor" to "Intel CPU"

>
>>          ./src/AmpereSoC.cpp : Create the sensor handler and update sensor values to the sensors dbus objects.
>>
>>          ./include/AmpereSoC.hpp : Declare functions and constants.
>>
>>          The structure and the functions of the files are similar the files which create ADCSensor daemon or PSUSensors daemon...
>>
>>      2. Add AmpereSoC daemon which will be named as "xyz.openbmc_project.socsensor.service".
>>
>>          Below is dbus-sensors daemons in our system:
> This list seems disconnected from AmpereSOC.  Was there something you
> were looking for input on there?
>
These are the list of daemons in our system:
~# systemctl | grep sensor
phosphor-virtual-sensor.service                   active running   Virtual sensors
xyz.openbmc_project.adcsensor.service             active running   Adc Sensor
xyz.openbmc_project.fansensor.service             active running   Fan Sensor
xyz.openbmc_project.hwmontempsensor.service       active running   Hwmon Temp Sensor
xyz.openbmc_project.psusensor.service             active running   PSU Sensor
xyz.openbmc_project.socsensor.service             active running   SoC Sensor

>
>
>      3. Add dbus interface to public sensor dbus objects. The name of this interface is "xyz.openbmc_project.SoCSensor".
>
>          Below is some sensors in this dbus interface.
> Neat.

Below are some Ampere SoC sensors in SoCSensor dbus interface.
~# busctl tree xyz.openbmc_project.SoCSensor
`-/xyz
`-/xyz/openbmc_project
     |-/xyz/openbmc_project/inventory
     | `-/xyz/openbmc_project/inventory/system
     |   `-/xyz/openbmc_project/inventory/system/chassis
     |     `-/xyz/openbmc_project/inventory/system/chassis/motherboard
     |       |-/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_1
     |       `-/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_2
     `-/xyz/openbmc_project/sensors
     |-/xyz/openbmc_project/sensors/current
     | |-/xyz/openbmc_project/sensors/current/S0_Core_VRD_Curr
     | |-/xyz/openbmc_project/sensors/current/S0_DIMM_VR1_Curr
     | |-/xyz/openbmc_project/sensors/current/S0_DIMM_VR2_Curr
     |-/xyz/openbmc_project/sensors/power
     | |-/xyz/openbmc_project/sensors/power/S0_Core_VRD_Pwr
     | |-/xyz/openbmc_project/sensors/power/S0_DIMM_VR1_Pwr
     | |-/xyz/openbmc_project/sensors/power/S0_DIMM_VR2_Pwr
     |-/xyz/openbmc_project/sensors/temperature
     | |-/xyz/openbmc_project/sensors/temperature/S0_Core_VRD_Temp
     | |-/xyz/openbmc_project/sensors/temperature/S0_DIMM_CH4_Temp
     | |-/xyz/openbmc_project/sensors/temperature/S0_DIMM_VRD_Temp
     `-/xyz/openbmc_project/sensors/voltage
         |-/xyz/openbmc_project/sensors/voltage/S0_CPU_VCORE
         |-/xyz/openbmc_project/sensors/voltage/S0_DIMM_VR1_Volt
         |-/xyz/openbmc_project/sensors/voltage/S0_DIMM_VR2_Volt

>>
>>
>>      4. The causes of this adding are:
>>          + The Ampere SoCs and their interfaces are quite complicated to use the current daemons.
> Considering that ampere CPUs support their own disparate OOB
> interface, I suspect it's ideal that they would be separated out into
> their own daemon.

Currently, Our openbmc uses I2C and GPIO to communicate/monitor our CPU thru SCP to get sensors, errors and events.
The openbmc is depend on SCP.

>
>>          + We can't use CPUSensor daemon which is specific for Intel Xeon. We use I2C interface to access the SoC sensors which Intel Xeon using PCIE.
> This is fine, and what I would've expected.  CPU sensor is fairly
> specific to PECI today.
>
>>          + Our SoC hwmon drivers are different with the other hwmon drivers in linux kernel. We are using one MDF driver name ac01-smpro, it have three sub drivers ac01-hwmon which report the temperature, the consumed power, current and voltage of components in SOC.
>>          + In the near future, We append AmpereSoC daemon to monitor SoC RAS and SoC events as you suggested.
>>
>>      Please let me know if you have any comments about this plan.
>
> I'm looking forward to the patches.  I don't see any concerns, as
> everything above looks like you're following the existing interfaces.
>
>>
>> Thanks.
>>
>> Thu.
>>
>>
>>
>> CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, is for the sole use of the intended recipient(s) and contains information that is confidential and proprietary to Ampere Computing or its subsidiaries. It is to be used solely for the purpose of furthering the parties' business relationship. Any unauthorized review, copying, or distribution of this email (or any attachments thereto) is strictly prohibited. If you are not the intended recipient, please contact the sender immediately and permanently delete the original and any copies of this email and any attachments thereto.

--------------5FC95433359985C59A07274E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22/07/2021 23:15, Ed Tanous wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Jul 22, 2021 at 8:56 AM Thu Nguyen
<a class="moz-txt-link-rfc2396E" href="mailto:thu@amperemail.onmicrosoft.com">&lt;thu@amperemail.onmicrosoft.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Dear Ed Tanous,


As we discussed before about the Ampere CPU daemon in OpenBmc general discord channel. I'm planing to submit the some patches which will add to AmpereSoC daemon source code to dbus-sensors for reviewing. This daemon will handle Ampere Altra SoC sensors. The functions of this daemon are the same as CPUSensor daemon which is handling Xeon CPU sensors.

Below is what I will add.

    1. Add some files to to Dbus-sensors source:

        ./src/AmpereSoCMain.cpp : Match the sensors configurations in entity-manager configuration file with sensor paths in the device driver. And create the SoC sensor dbus objects.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
At this same time, we should rename &quot;CPU sensor&quot; to &quot;Intel CPU&quot; so we
can easily differentiate.  Ideally your new daemon would also be
called &quot;AmpereCPU&quot; to keep the naming conventions the same.</pre>
    </blockquote>
    <pre>I will use AmpereCPU name. And will rename &quot;CPU sensor&quot; to &quot;Intel CPU&quot;
</pre>
    <blockquote type="cite" cite="mid:CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
        ./src/AmpereSoC.cpp : Create the sensor handler and update sensor values to the sensors dbus objects.

        ./include/AmpereSoC.hpp : Declare functions and constants.

        The structure and the functions of the files are similar the files which create ADCSensor daemon or PSUSensors daemon...

    2. Add AmpereSoC daemon which will be named as &quot;xyz.openbmc_project.socsensor.service&quot;.

        Below is dbus-sensors daemons in our system:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This list seems disconnected from AmpereSOC.  Was there something you
were looking for input on there?

</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">These are the list of daemons in our system:
~# systemctl | grep sensor
phosphor-virtual-sensor.service                   active running   Virtual sensors
xyz.openbmc_project.adcsensor.service             active running   Adc Sensor
xyz.openbmc_project.fansensor.service             active running   Fan Sensor
xyz.openbmc_project.hwmontempsensor.service       active running   Hwmon Temp Sensor
xyz.openbmc_project.psusensor.service             active running   PSU Sensor
xyz.openbmc_project.socsensor.service             active running   SoC Sensor</pre>
    <blockquote type="cite" cite="mid:CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">


    3. Add dbus interface to public sensor dbus objects. The name of this interface is &quot;xyz.openbmc_project.SoCSensor&quot;.

        Below is some sensors in this dbus interface.
</pre>
      <pre class="moz-quote-pre" wrap="">
Neat.
</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap="">Below are some Ampere SoC sensors in SoCSensor dbus interface.
~# busctl tree xyz.openbmc_project.SoCSensor
`-/xyz
`-/xyz/openbmc_project
    |-/xyz/openbmc_project/inventory
    | `-/xyz/openbmc_project/inventory/system
    |   `-/xyz/openbmc_project/inventory/system/chassis
    |     `-/xyz/openbmc_project/inventory/system/chassis/motherboard
    |       |-/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_1
    |       `-/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_2
    `-/xyz/openbmc_project/sensors
    |-/xyz/openbmc_project/sensors/current
    | |-/xyz/openbmc_project/sensors/current/S0_Core_VRD_Curr
    | |-/xyz/openbmc_project/sensors/current/S0_DIMM_VR1_Curr
    | |-/xyz/openbmc_project/sensors/current/S0_DIMM_VR2_Curr
    |-/xyz/openbmc_project/sensors/power
    | |-/xyz/openbmc_project/sensors/power/S0_Core_VRD_Pwr
    | |-/xyz/openbmc_project/sensors/power/S0_DIMM_VR1_Pwr
    | |-/xyz/openbmc_project/sensors/power/S0_DIMM_VR2_Pwr
    |-/xyz/openbmc_project/sensors/temperature
    | |-/xyz/openbmc_project/sensors/temperature/S0_Core_VRD_Temp
    | |-/xyz/openbmc_project/sensors/temperature/S0_DIMM_CH4_Temp
    | |-/xyz/openbmc_project/sensors/temperature/S0_DIMM_VRD_Temp
    `-/xyz/openbmc_project/sensors/voltage
        |-/xyz/openbmc_project/sensors/voltage/S0_CPU_VCORE
        |-/xyz/openbmc_project/sensors/voltage/S0_DIMM_VR1_Volt
        |-/xyz/openbmc_project/sensors/voltage/S0_DIMM_VR2_Volt</pre>
    <blockquote type="cite" cite="mid:CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">


    4. The causes of this adding are:
        + The Ampere SoCs and their interfaces are quite complicated to use the current daemons.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Considering that ampere CPUs support their own disparate OOB
interface, I suspect it's ideal that they would be separated out into
their own daemon.</pre>
    </blockquote>
    <pre>Currently, Our openbmc uses I2C and GPIO to communicate/monitor our CPU thru SCP to get sensors, errors and events.
The openbmc is depend on SCP.
</pre>
    <blockquote type="cite" cite="mid:CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        + We can't use CPUSensor daemon which is specific for Intel Xeon. We use I2C interface to access the SoC sensors which Intel Xeon using PCIE.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is fine, and what I would've expected.  CPU sensor is fairly
specific to PECI today.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        + Our SoC hwmon drivers are different with the other hwmon drivers in linux kernel. We are using one MDF driver name ac01-smpro, it have three sub drivers ac01-hwmon which report the temperature, the consumed power, current and voltage of components in SOC.
        + In the near future, We append AmpereSoC daemon to monitor SoC RAS and SoC events as you suggested.

    Please let me know if you have any comments about this plan.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

I'm looking forward to the patches.  I don't see any concerns, as
everything above looks like you're following the existing interfaces.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Thanks.

Thu.



CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, is for the sole use of the intended recipient(s) and contains information that is confidential and proprietary to Ampere Computing or its subsidiaries. It is to be used solely for the purpose of furthering the parties' business relationship. Any unauthorized review, copying, or distribution of this email (or any attachments thereto) is strictly prohibited. If you are not the intended recipient, please contact the sender immediately and permanently delete the original and any copies of this email and any attachments thereto.
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------5FC95433359985C59A07274E--
