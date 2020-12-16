Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD62DBBFB
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 08:34:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwn1j4LdKzDqLH
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 18:34:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.75.95;
 helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=pbblpEWT; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750095.outbound.protection.outlook.com [40.107.75.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwn0z54MczDqL8
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 18:33:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G24owgMKFZ46sOFymTbkfu7RgZS7iUqNIWwqpRujm0jpg9zR+fm2gM0xNIOZdTSqbShulfhTAjI8t6emQpDQBIpLB10s8uZgTa8qLrGugtroyaxSj9ti8k53UCPPeeLnltpQsZ9sBEHr6WBUWdBobxWke0FIMD76qdLVJlaaFxHLXipY1ypHM5bmAleGOTukXC4OP1WF8qFHoDaGgejiMecA45IiGRKs+H6bDPpyLcVhyzvA75kmKmOVbGgLS+jhx/Si/gZaNfXJ+ovBmsn+9chEZO85N8L9Bv79ZODrxkvD4yEfISAe58fJpsataB/7Wv4gw4Ljv7KlKI5DfoYB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZNniPgzd4N3X8d1y9nL0izAKWxuRDhgAm4DELJ19GQ=;
 b=jbzJ0Jik5bKEXA1HEXNblc0mrXNusnRTfzTB3GMlyc6Up+3mAOdTnm3lC+m7vpNQTxEjQUEVSV+gGCaFlKlXI0QjSoAd7VrJu5J3kE4QIOGc1lhF58IQzfM8a1UzBgDZHMOaE3luQtZ+6iJ9NWDuK1dEVOywFHJHqOQlSV9jH0hNR/eedeVUwOX/GGcl02CV6ZGKtiHK6nQFwDRhwxDaH1O6rOd01MTY85WgLXM7736d2f77Os9MqLHA3Xm3A/kSMbXsPDy71aQ9tPsdVaPBcYMuh2q7zxhqwxBe3xtSNhlf9flR6e5Fc/TrQMDxiUDeoiNlLyhRJU34V5z2yI3LmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZNniPgzd4N3X8d1y9nL0izAKWxuRDhgAm4DELJ19GQ=;
 b=pbblpEWTH7Bk6T4O4PXCekOxgby1bsgxwmL10qVsxyn9O2tvR9ORNYSFjesdY+6FDuSNgN4FQ7/JUbwxs2YOqSKmfp80B0+7Ev0LTnXVVjz24NahZw93zP+qplxzGgFiWMsmH6m3A0Lb6WmkkFJHYlws1ipB5sufBtSQvkYvoBw=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4858.prod.exchangelabs.com (2603:10b6:5:69::30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.21; Wed, 16 Dec 2020 07:33:13 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 07:33:13 +0000
To: openbmc@lists.ozlabs.org
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Phosphor-hwmon: reduce hwmonio::retries when sensor is Nonfunctional.
Message-ID: <44f90a87-391d-214e-0801-62e9429b3c34@amperemail.onmicrosoft.com>
Date: Wed, 16 Dec 2020 14:33:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0144.apcprd02.prod.outlook.com
 (2603:1096:202:16::28) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HK2PR02CA0144.apcprd02.prod.outlook.com (2603:1096:202:16::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 07:33:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56c96b7-6f4a-45dd-1a89-08d8a194d8cb
X-MS-TrafficTypeDiagnostic: DM6PR01MB4858:
X-Microsoft-Antispam-PRVS: <DM6PR01MB48581AAFA5846DF4080A4BCE90C50@DM6PR01MB4858.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlaHAj4AKFaMqPjpIEkMo9DcXrElUZDZC/MbAyFBiqBbrdmkx4kk5NEGr2d1UdQvhtsJ8Jr3oGsH2dcc91/gF99nNjW3VyEhpWYmP5yO9a68+zx668GuVhbELkGNBp9nsA+1HWmgFlR8YfQNWpynXG/M9Y6IzoPBDiqHNd/oHfEyByqkjn0NvQB9PYmsfPcFYpiaz+BWt9je8jr+CRXQ5EXjZh0HSaDap3Xc8okdMId5tfNuiGPEFT/Z4p22EwDZN9omQ7FIVEQz/2dgRQAsWX25F7GbXPsthu2rqndipHAUP/DFyiNckWKB2AIPJqt2X19rDvBaE0J6fBk/tIxPtXm6ZE23nFdnd9FIz+Mu5RFLJkvYLNaD0iCnIVJ9lcFzCIDPA+vnSPj4o9g19GZ+Z8FLHMtFB70hrnLXMSZkvQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(136003)(376002)(396003)(42882007)(66946007)(5660300002)(66476007)(16526019)(66556008)(186003)(2616005)(26005)(19627235002)(31686004)(2906002)(478600001)(956004)(6486002)(16576012)(8676002)(6916009)(6666004)(8936002)(31696002)(83170400001)(316002)(83380400001)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTV2c0dmbzFCb3pYMk5QYjNOcWxyOThEYVN4Q3BlMis5MU0yS1NOWDFYeXkw?=
 =?utf-8?B?d2JPYzBxbkp3K2VYSU96OUkzMGEyNlNDRWtwMEtlVHlaMUhXUkVINDhPWjlZ?=
 =?utf-8?B?M2hLbEFTODJVQ05ZZmNpYmtaQmV4eFJVTy9xTkY5eE0xb0VUUXk4dGJUYnhh?=
 =?utf-8?B?Z2Zmc3dxTC8vdGJjaWtpU1I2TFRrZXRsQmJXTXAvYUgxZDd4cXVaSTZFL09s?=
 =?utf-8?B?Z0daSmdPay9rWEErcndIY2ExQWRhZ0xuWUUvd1dWRjFTSGpWTklTMGRZejFF?=
 =?utf-8?B?cE9JTHpaT2N6TjYxYk1rTGhSZHc5M3BGbmVLNkl2OGdHbjBmRnJnN09vb1ky?=
 =?utf-8?B?bStWYU9oQ1NYcWVYUExWa05PUWtTQjQweUhSaENFQWF2cUdHdkVZaDlNVFJm?=
 =?utf-8?B?ZGx4Q252cUhGbUNqb0lMS211NXoya3ZHOTkyajBTVFBKQkhuaFA5YXNVQko0?=
 =?utf-8?B?QWNyMnBQM0ZPMXdxaU1adlhkbWdOYmR6MGRtTGpqOXpySW9DOUVoMk4zZmg0?=
 =?utf-8?B?eGV4M1NGOVZMTjU2cDB5L1J6R1ZqVjZRcWFWWGRlTTJwTlhFeHkzQWtyU28y?=
 =?utf-8?B?N2RoRHc0VURobTdaTjFJR1ZZbUM0SkR4RlBjR09wLzMrVGxETDNhcTlta2hp?=
 =?utf-8?B?K3Q0VC9ZTUNIdzN5amZCalJSRllLQVdGMmo5SlVzTkF3c2hxZVVULzRDWnBU?=
 =?utf-8?B?SUZDMzJWTzdJVFRRYU5NNlo3QmNpZXRNL25NeHNsUUdJRzRTeEpOUEFsbmpH?=
 =?utf-8?B?NEtaWWhEWXhRN3lUSStPUlZLT2c5bzdXWURLVEgrM1Y5M1VBR3FDTkxrOTJU?=
 =?utf-8?B?d01DcXo5KyticllzbnZXSlVxbHNualM0QVM4S2ZWZGx5Z21FZy9oWXgwUll0?=
 =?utf-8?B?MEs3LzJ1OFZoTURlZUNsV3IxSkNMWUFWTjIyYyttVGM3KzJUTWJjbmcrR0xW?=
 =?utf-8?B?Vk5CWmhCWEJwSzN1TDRCVUlKYnkyYlQwYkRzem43dlZ2NE9sRThKT1VPZHJL?=
 =?utf-8?B?LzlGNUdaRmorWUd3cDVPcFNXTmxMVnlLMVMwWDRpV2lWenBiR1R5ZmlVRXVr?=
 =?utf-8?B?RDloTXJiVXRyQ0ZCL1RYOUJ2V2VLbjFxUzVnYUdHRXVVWk95b2p4U3Q4MVUy?=
 =?utf-8?B?a0lNQzBkUk5xMXdqdmEwWVdXbDJqcWVxeENQOUN6TlJ6NkpBa3c1MldML2xN?=
 =?utf-8?B?YWw4M0s4ajF6QUMzRDBiQVhmTXQxd1FlS2VuNFYvY0FEZGdVTEd1QmJ5R2FY?=
 =?utf-8?B?NWRrNFR0dW11YWtkOXVYRXVRT1dZY1ZrZEo1Tk83OGlaUlVsanhKMzFkN2ZP?=
 =?utf-8?Q?meTjlTS7ip/wg3/Ae/PMHawte3SxwhhRxx?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 07:33:13.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: d56c96b7-6f4a-45dd-1a89-08d8a194d8cb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxsOMcYuDxLfHnE4dxXmezfA7Qx8CmmJ30s3YsYVil/piaxnZX63sXVf/jfojrpcGSmBKXEFD0aywgOz7lPljVIEOzI41ts/xIGYzgUDib4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4858
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

Hi All,


I'm working with Fan sensors on Ampere MtJade platform.

In this platform, I have multiple fans which name as FAN3_1, FAN3_2, 
FAN4_1, FAN4_2, FAN5_1...

I added the configuration for those fans in phosphor-hwmon and I also 
added option "--enable-update-functional-on-fail" in phosphor-hwmon 
build flag. I'm trying to set fan functional to false when unplug fan.

Flash new image to the board, read functional of fans. The time to read 
dbus property is about 0.05->0.1 seconds:

root@mtjade:~# time busctl get-property 
xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b true

real    0m0.078s
user    0m0.002s
sys    0m0.032s
root@mtjade:~# time busctl get-property 
xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN3_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b true


real    0m0.044s
user    0m0.001s
sys    0m0.034s

After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2 
is set to false as expected. And functional of others fans keeps  true. 
But the time to get dbus properties of all fans have a huge increasement 
event in the working fans.

~# time busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b false

real    0m1.189s
user    0m0.001s
sys    0m0.036s

~# time busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN3_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b true

real    0m3.285s
user    0m0.010s
sys    0m0.028s

The "ipmitool sdr type 0x4" commands is also failed because this 
increasement.

~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr type 0x4
FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
FAN4_1           | 2Bh | ns  | 29.19 | No Reading
FAN4_2           | 2Eh | ns  | 29.22 | No Reading
FAN5_1           | 31h | ns  | 29.25 | No Reading
FAN5_2           | 34h | ns  | 29.28 | No Reading
FAN6_1           | 37h | ns  | 29.31 | No Reading
FAN6_2           | 3Ah | ns  | 29.34 | No Reading
FAN7_1           | 3Dh | ns  | 29.37 | No Reading
FAN7_2           | 40h | ns  | 29.40 | No Reading
FAN8_1           | 43h | ns  | 29.43 | No Reading
FAN8_2           | 46h | ns  | 29.46 | No Reading
PSU0_fan1        | F5h | ns  | 29.60 | No Reading
PSU1_fan1        | F6h | ns  | 29.61 | No Reading

real    2m43.704s
user    0m0.046s
sys    0m0.057s

The cause of this increasement is when it failed to read one sensor 
phosphor-hwmon keep trying to read the sensors with the retry is 10 and 
the 100ms delays between retry times.

Should we reduce the retry for non-functional sensors?


Regards.

Thu Nguyen.






