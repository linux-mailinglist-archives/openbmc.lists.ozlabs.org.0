Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD7327E58
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 13:29:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq02R5jr1z3cjc
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 23:29:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=fDFZiadb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.133;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=fDFZiadb; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680133.outbound.protection.outlook.com [40.107.68.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq00y16hGz3cLL;
 Mon,  1 Mar 2021 23:28:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJTSPZ3TVKemkzAb/FckOQLqHkxTwLM/F1/PZ7L6835+KeTmahoua4ephOdavUsG/kBAsKG5dQCCYdD8CRrUfUIH6NV/8Bn0hjNrM2QPOqaem7OZbzboAN23nhMquzddunOXp4rCWJRv5hnOrysjn+UcNGTFAtAMduSbNU+bBXnlFIxcKpAHXQzpBAlV2wRVJ8FgXbpBIScBVP/QGPekc7m3tlwKuUfq1YD9XTecNY5kIactTCroCgpn0p3ipI23R7q+2oU8Q1XDAlEcflNbFpYyWqL1A0MmDU9WA1yr3LdcwZomkA6sb+ZL5+hpuFJ1MjIRExlF8VcGakZGr4XBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsdmpcySACGmD8slqBuL82hIQ0DaI3fKcXXKDzcEPpI=;
 b=bSozIHTWwo0Ody3OL5dUJOAaD+fXloVjuOS1/ghA2FmcNUwnBr57GtJ3+fZeYHYSVe5HCS+9WEn93g7cTkAsr73bfOGwJRNRCiaNSdYB6ucpYz1bbMm8vpEuwZsT+m19NrJ0xe9K9KWnXNXMs8nByEF7xjU1cIwwOGm4YJKi54ozogmEao+WtV2rXQXl5PS3fo8qsB4KUxayykLeans1SQe6PsugF8axaUVDVeeMWWXnlzBkBGG9nBkpQtZe8IEZ3MvELA+wWfRm77G93jEITqiaz7ZU3z/U71bKw4xCNqrDPbnDlQ4LxkTgBnxfWtdw++PSOnHmOOkOiQawA0lVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsdmpcySACGmD8slqBuL82hIQ0DaI3fKcXXKDzcEPpI=;
 b=fDFZiadbs4xZpFxOL2JWnSA++IOiRZQ9MRcGE3pkBKznJDBgwzdEJieb2lX2uUnB4PNM6wVh/Vi1jAbKzql3oVysOmKPeapPhMUeeYZ8Jmb8785OVPGRIcjYVF/Ds85RfPUUqzNkc6ET82pcJMPMAG49Wok0GEd99K5Qszwq420=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2271.prod.exchangelabs.com (2603:10b6:300:21::8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Mon, 1 Mar 2021 12:28:28 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 12:28:28 +0000
Subject: Re: [PATCH 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-2-quan@os.amperecomputing.com>
 <9f3845c5-ee4b-76d6-82dd-fa838f8f44ba@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <f691a98f-af03-85d8-bf76-fa956686fc27@os.amperecomputing.com>
Date: Mon, 1 Mar 2021 19:28:17 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <9f3845c5-ee4b-76d6-82dd-fa838f8f44ba@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.120] (118.69.219.201) by
 HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 12:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d6d817-15f1-414d-994f-08d8dcad841f
X-MS-TrafficTypeDiagnostic: MWHPR01MB2271:
X-MS-Exchange-MinimumUrlDomainAge: devicetree.org#4160
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB22710D82A52E5CF3459ACE9AF29A9@MWHPR01MB2271.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dp7oTdcQbr7xpcK7fL5qkbH43kp5UbVnkAvPldc8yn3Pq4sw/gRMzsaRy+89eLUDrPH/I02aTzOOdmU7jdXPJC29w3ermREkGUkATabhREULvO2PWsocuRZTihN2ZZpcE9yaPzP0pFG/DDktxBuNGvYriRSChh4wjQT5bpgfmmYevLych/+ZXN9NxHQ2WwIBuuYKT7yuVr0UQ7W5qNa7njjDpAGSDGClSdUVwoUdqv7w2Apvcm0KsHZpggzjBJWhmUAhP2Tsa0f8R95Tg0ku19j5VWB6Rqo/aFrblVQ2+RNGrUVSCy8CbODkL9oLxi3ddjvmQCCR2guOxa291RKdUfl9cLlItPHx3GKDSl6p9doqJPcWkdOQ6WbUKbHjF7U+Dz32eyCUHI+6qmw9HHdWc/yQeQCDhdmHotCerQDEPGoDr0iHCME7py09wKA1yP5gjJUO/1hQI/HRCITN1oC5IlXXkX8qQ9aWoqdSurM8TBjRYiHAom3RL/xDDM8w0eF3EslOYcfJZUp/TW5lZU8UztmML3ndJYwtfofkeDW15gBWDiguuRIR/0hJVCbJHV3gJHhZQi31V33z//D+ohB+xmG0DBzrUTXrYFTMEesn326F3NcGJnHHDyxMsmgFXjLIsdFSPwFeqGfGUYb1dPRSTY1gqBJAxQ/YF9zp44Xnh3VCXTSpmIBJI8j46JOC48tWYAfkZn1VRw4PQhZtwwV9Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39830400003)(966005)(53546011)(6666004)(4326008)(478600001)(7416002)(31686004)(31696002)(83380400001)(26005)(16576012)(5660300002)(186003)(54906003)(8676002)(110136005)(316002)(16526019)(6486002)(8936002)(107886003)(66946007)(86362001)(921005)(2616005)(52116002)(956004)(2906002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTNuOVViSmJEWkdLTDdidGNUUEhQYXI4ejNtUERNM0J5Y3dIZ0xFdEE5dDFJ?=
 =?utf-8?B?ZklocEMvSW9TdVNmSGZXenR5YjBGd2NDQUN2T2JabE9qUUFNeHY4cTFNN2Ja?=
 =?utf-8?B?NmJFR1E3RmYzMUpZOEQ2UG5QZlBtUTUzeXVIMzBvSWdaaGJKUnVwc2dUL1RN?=
 =?utf-8?B?VzFaOU10L2RjcmVmRE5GRWNCZHJqVURSb3Bnd3R2M1ZISk5YTWE3aWZ5L2Rr?=
 =?utf-8?B?TkYyQWhOYnNVYXJuUndsMUg0QkQzZmJ6eStsMGR2d3M1WEZYQVdjT2VCWmkr?=
 =?utf-8?B?TVcydC9zYldaMXVRNjJlYTNnaVBoVmh4SDlVbWVhaWs0MTFxU3U5THZEMkx2?=
 =?utf-8?B?MFk0ekpFNVJva3ZaUHVIWkZ2N2lRcjlmL1Blc3Y3bVJWYmwwdm1ncTcxcVdI?=
 =?utf-8?B?V2VMV0pmcjlKU2VFTlhsSVVKa29XVHdLcGNTaG5CZkp5Y3hYeFVGRmJHNWZn?=
 =?utf-8?B?Y1VjTXhTU2J0LzFXZ3JQOUg1K2NoRW0yd2NkVlpxUXAybkcwRkVMdFp4ZHVY?=
 =?utf-8?B?MXNlMVF4WGxPZzAwUHhtS0FTS3hidjg1M005bWpLdU9lNnM4dGYrMDh2UmRE?=
 =?utf-8?B?SUNjVnkrdW5QMTZ5UVJHUEszU2dNSTQzNU5hMkhtUmRaWElwRG1KOCtsTHN5?=
 =?utf-8?B?bS9jRG96ZVR3dkx2Smc1ZGRpNEprYVRWRWU3V2xIZExCcHBwVjV5ditoekZ1?=
 =?utf-8?B?cGM3SzdKUmV1d215R1pvZ2dvTGxnbVA2aG5ob0FlaDMzSnVTbTcyYXMvOHJ3?=
 =?utf-8?B?bjhRcjZFZHVURmRvaXBJdW1hMkg0cHdyUmU3WVIzdXJGNnhVZHhzYjVTbm9n?=
 =?utf-8?B?c1J2MG9Wd2o2MmZaNFAyOVBUa2E1aG9uMTU2d0QwczU0RytNSzhjZXFRcUZG?=
 =?utf-8?B?WEVNT21hOTlBUldnYzAvMHBDUVhKZk9FT3V5TitIcWNyKzlWY0UrSGdXam5Z?=
 =?utf-8?B?SnE3d1JVKzA0VU1pTTE3bG1mMFpKMXc2RU5hQjJyaXgyRy9HSFRpS0pjMEtq?=
 =?utf-8?B?SFpOb05Vc2RkWXoxWU1adVA2d0g2NFlsZHE3dTdLa3ZrUFZ2RFVORUhWdHV1?=
 =?utf-8?B?dHFaZVpwWVpTcEl4Y2hKMlM3OWVUOU5mOHBuOGdwcjJOMkNSQy9zWDFDK0NJ?=
 =?utf-8?B?eEVYNE1mc0c0VlpER3NxSkh1ajZlMHVMSm56eWVHUTdac0JZb0RuRXU4ejNn?=
 =?utf-8?B?cWpiQTRob2xVV2ZTR3JwbC9YRHlJUkJ4UFp6U0dzbkcveVd2VlplREJ1cUhH?=
 =?utf-8?B?Qy9IQWFEYzZvbXpEZ3NEL2ZIQ1RkemoreERkNWFnSHR1NVFkcjBIMk5JeXFu?=
 =?utf-8?B?QytVcEdwTEtPNi9rMWxsdHh2Q3FYY2dFNVFRcE9YRHd6N3YramtmTHhnd1hO?=
 =?utf-8?B?TUtLZ1E2bE8zVEdGRlpJYWdkWWIrNkJRVzNERTVTQWFBdDlWTngyNlRVUXhi?=
 =?utf-8?B?VGNhdSt3Vm1NY1ZMcmhodDBwMkM4SElxekJDSkxJNldGMmpCV01LbWJ3ZVd0?=
 =?utf-8?B?RnBuRUwwWDRIdzFPVFUvKzlPQU53QU1DTi8xZXZKK0E4NWc3dCthSk9DeWtD?=
 =?utf-8?B?bXRnVVpKalZhbEFFdGRkZVNrY1BzenJNQVpuWGg0cEFMdVlMQ3J1OVBuNjNa?=
 =?utf-8?B?VStsOXpCTXdZdmY0bTNjNlc5eFJYazhhd3BpY3Y5a3J4MmZwRjBVbVF6bld4?=
 =?utf-8?B?Rk1JOGFncDlUU1JYNXZ5UThMVjJwbnl0SmxRS0xJSmJpSFIzMU5PKzJ6ZjlE?=
 =?utf-8?Q?qZPaDQI0971jyTtUXC3lUpVm1SoTflqqH69Kx1E?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d6d817-15f1-414d-994f-08d8dcad841f
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 12:28:28.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDt2b5ceuggXf+Jc50Xe9Iy5YNMgGJo7fhl0nurbkBG4x/hevSSZ1+D5EMHV8Ith+iubWsre8/xYNCHowaSu8oXOZpiONlzIAh9VBtY4XGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2271
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 25/02/2021 23:47, Guenter Roeck wrote:
> On 2/25/21 2:18 AM, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
>> reference platform with Ampere's Altra Processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   .../bindings/hwmon/ampere,ac01-hwmon.yaml     | 27 ++++++
>>   .../bindings/mfd/ampere,ac01-smpro.yaml       | 82 +++++++++++++++++++
>>   2 files changed, 109 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>> new file mode 100644
>> index 000000000000..d13862ba646b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>> @@ -0,0 +1,27 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/ampere,ac01-hwmon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Hardware monitoring driver for the Ampere Altra SMPro
>> +
>> +maintainers:
>> +  - Quan Nguyen <quan@os.amperecomputing.com>
>> +
>> +description: |
>> +  This module is part of the Ampere Altra SMPro multi-function device. For more
>> +  details see ../mfd/ampere,ac01-smpro.yaml.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ampere,ac01-hwmon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> diff --git a/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
>> new file mode 100644
>> index 000000000000..06b0239413ae
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/ampere,ac01-smpro.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ampere Altra SMPro firmware driver
>> +
>> +maintainers:
>> +  - Quan Nguyen <quan@os.amperecomputing.com>
>> +
>> +description: |
>> +  Ampere Altra SMPro firmware may contain different blocks like hardware
>> +  monitoring, error monitoring and other miscellaneous features.
>> +
>> +properties:
>> +  compatible:
>> +    const: ampere,ac01-smpro
> 
> Is that the same as the "ampere,smpro" in
> arch/arm/boot/dts/nuvoton-npcm730-kudo.dts ?
> 
> Guenter
> 
Yes, Guenter, looks like this need to change in next version.

