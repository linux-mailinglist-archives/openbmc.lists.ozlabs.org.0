Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51F35EF82
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 10:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKwcR4Fj3z3bT2
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 18:29:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=I7XIConq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.104;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=I7XIConq; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2104.outbound.protection.outlook.com [40.107.236.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKwc65wGXz302p;
 Wed, 14 Apr 2021 18:28:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLpRIxYiqQHWdhSyGjQ/wdWgKKoXI1VJzVWNqY+jR2EQWteypGTvHdgja22ryE9NXFYmAsMzPN3T34mwMBF8DZLLsblqsFT/FGFQNzPpdcbnnHLPAvzaWOCuj5b3aklXY8pZ7h3sGjlOhjAmfj2PoDmTcREkwNDoWb/lxMugXfw+O7f8hsAzXZDFzHnEU6nkqWixoc+pylAmA6pxAwocGZ5aIGASZx8FetZUvRGsVlmqQhPFoIv6tlci4c119cYzR0ABPB7hBW4GII1FTLWreNk0y9tx/BsZ61Zl2Iawqz7ZfHkOV9ep6p9rv09PiM+u94jT5Rag2XXRojBb7HJ9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ1xUe+/qyS1ekWew3O16ybPDaCkY1k8XdnKj7opipw=;
 b=geAoLsW+NatBjMtm7NC+rNb5rA1J57KC1SHUwF3k+w3QB3RM8TEs6ZwxrI8MZ7XRJmHwRgbAfqWUl4iD1BucqTM4xUz1dQFz6oDsVEjFd7g7lWRSFVcEjYiv9iY7Sc7mW0+4sOcU8qUVj4xySbR3KU6ZOLM9TSUqiSeGsuX+y83fYoTh7hWpJknge5wt5fLXwckGM+HMKE4Ou5p4uFvQRqICcODFh1llDa7OKpXKN6mwZur6sNpvyGxYnuc0qN/ro2bKLKwN/4IJEdbwdXDZ8BZMJTCtakAo+lyxUYyDEsJZ1rxz0zRZKUaVj+RIq4t96kkhg743KQoQNW/6J85J+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ1xUe+/qyS1ekWew3O16ybPDaCkY1k8XdnKj7opipw=;
 b=I7XIConqzUO47wUal2wcyOvheAV8/Z03ROeHKU5rPy2fljJKBEwSdLG7+f6ouDMaNX30NDNixlhijNmPJxt+SQOOHO5abx3rKv6ZrnIRymN/oy3oAx/2uSNiMKY1p8V9nJTxdsw9CDKRodGvzHvCjphsw5Nbu9Iu9bqFkHtHXwU=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR0102MB3487.prod.exchangelabs.com (2603:10b6:805:3::28) by
 SN6PR01MB4142.prod.exchangelabs.com (2603:10b6:805:a6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Wed, 14 Apr 2021 08:28:44 +0000
Received: from SN6PR0102MB3487.prod.exchangelabs.com
 ([fe80::44b4:b87d:da2:a555]) by SN6PR0102MB3487.prod.exchangelabs.com
 ([fe80::44b4:b87d:da2:a555%7]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 08:28:43 +0000
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
To: Rob Herring <robh@kernel.org>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-2-quan@os.amperecomputing.com>
 <20210413134906.GA1538655@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <8eb27308-03e3-1a90-28a3-d8b3ad720cc4@os.amperecomputing.com>
Date: Wed, 14 Apr 2021 15:28:25 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <20210413134906.GA1538655@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR06CA0162.apcprd06.prod.outlook.com
 (2603:1096:1:1e::16) To SN6PR0102MB3487.prod.exchangelabs.com
 (2603:10b6:805:3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.245] (118.69.219.201) by
 SG2PR06CA0162.apcprd06.prod.outlook.com (2603:1096:1:1e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 08:28:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e23ac0dc-31d7-4cfa-08d7-08d8ff1f5083
X-MS-TrafficTypeDiagnostic: SN6PR01MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR01MB4142679E1CF323C17B367EFAF24E9@SN6PR01MB4142.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piPjTqGYVPau1164/MB7WpS9fFkTutilCmEufP8tslOhHDqflK6JhQ/IlzF/HNxeWQi3YuzaarR09z2kp4wKYMcKWLHnr1NbOr8uAE06UxJbgCOFl62ayAzxCZssPETmJLw5YE0ZX1aGt+MUcpPxemIRVdaG2WdVClCkECmCeWp0+3eoc6aLEhEGd4ciYd+AHTEhxsyQP+I5phsZtXHi3K+a+rC+T6JXvh0SlkTDkV/wsnRwMy7whirvjdQPyjLBvUZk2NvhfWOu2yfkdAIhQj7/B5GutGC1HXrkARYyIb0oETaFegZLdmH7sW0MzbWLIdh1i49vBD0v28HY+TehtjY7bzQz0SXpJAPrGZNAuT0D7L2KAN8YkwvxDcr58IV4CF7ordLbuFQA3rEx1tCunG163Z5+kpCFOYphjpKua9+Xtn10UbmA6ekkZNhYNZ1joBRqq9+fz7LPoZLMoYO/DNFzBFSPhjpCHvr+2pt4W/E/dAq8DppxYlEvzR+HpiPhm5+LU0OFATZzrmodKK38d6JHodLv3TfFc3BQx91Mq/hfa0AHwtizR3PBcR2M7J9VAq+DkN63jXfJwxr0eDKVmd50cYkllrNP+FWoPqJ6zw8PESWXUWlz/OL+vg4fLuzi3RkC3V+endjJoHW4NEAqOQJbnZ+WiEG3lN+y6MH6OTaIlBkDoS8RCB18OI8wm3FzvJKYgb90fVU3NLj0je7oOXZIToMOEGf0pZWdEofTJkFqt9kZoVpX0qWoUfLWukmvhYdm/+su7OGvJzIE/FCF05H2SBg43fnJbKJo700hcG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR0102MB3487.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39840400004)(8936002)(6666004)(966005)(2906002)(4326008)(6916009)(38350700002)(7416002)(16576012)(38100700002)(6486002)(478600001)(66556008)(66476007)(66946007)(86362001)(16526019)(186003)(31686004)(2616005)(52116002)(8676002)(5660300002)(107886003)(53546011)(316002)(26005)(31696002)(54906003)(956004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wm5wNHUzMmFOdnBZSDJxOU5BVUY2dmRoSFdON2wvRnAySEZ4aFRnb1AxeXhY?=
 =?utf-8?B?VWFLUVJyTG14WHpnTmpxS1Z5ajM5M3VJUHl6dFRQMFdhWUluMDcwdVVzaFNH?=
 =?utf-8?B?Z3h5MzVvaVBOR29RWXNKL3BVbjYwN2xFRS8vSVpSTFlMWkZUNURaMFRHN3lR?=
 =?utf-8?B?TnlwR3JVa2taTU1hNjFUbnRPam85dWk1a0VJQ3FYM2tKbEZvVEtVbXNkbkN4?=
 =?utf-8?B?N1pyWUVvOUdGcmx2U0YzZ0F5TittRHpwcUl6SW5rOEs1YWs1RExhSlV0Wmx6?=
 =?utf-8?B?NVpMT1hZYksyajFLYVR1K2YwbWdzVXdtZFlCYk1Iek96YThrbWI4dFIyVXl3?=
 =?utf-8?B?NTZ5cjBENGVEY0JrYUF2Sm1MQ0VtcXQwRExnOTYyR3J1Z292MnR5WHp2ZG1q?=
 =?utf-8?B?cjFQdHFVVFhGSjVhekx2eU9VcjA5YlJjN0NiMmQ3bEowM3ZPM1FBVGI4TnU5?=
 =?utf-8?B?cmlSZmI1MGE3ZXhRemZDY3MwckY2cHcvTjBSR3ZpUlJWTkMzMGJNVnFza0Vs?=
 =?utf-8?B?L2EyTEtSWFBBaXRtTU92OGZoYlVWUGNFdXpCTWFNeU5QODBCbUZPaHpFSXdT?=
 =?utf-8?B?VVlmUDMvWFdVcHJkN1RTYWtuQlZoQkgxcU8rdWhEQkd3KzJSZWh6NjJuSk54?=
 =?utf-8?B?WWpyNURiSjNsaWRUZWlQZStmWTcxL0E0UkNaUXVYUDBDY3dvSFpYL0g5emdQ?=
 =?utf-8?B?VHR3OFN5d0Q3T1ZkYzE2OVdZRmtoQzFVbjF6QVk5SkszOVlMcytoamY1T0tt?=
 =?utf-8?B?d2Q3QlJDbDl0cUQzbDl2dUFRSmxzY2dFTGozQTRxU0FONjlTZzI4TStGZWd3?=
 =?utf-8?B?N1NVcnVhaVMxWU5UVVpqSUlXOGQ4QTNwNDI1Y3YvTGJiSE5xSGVkWStGWC9s?=
 =?utf-8?B?dUlxaHB1eWVJdjd4TTM0dld6NzBXNlhVQXpybnV3bUVENUFubklvT1d4M0xk?=
 =?utf-8?B?c0d4ZFEwekJ4eFRHSnZUVG1yQU93UVVacSs5ZGFxSW4zZTV6ZzdCYkZpUGsx?=
 =?utf-8?B?N2xqRWVMNzAwVHgrQ2d5ekJSQVBLTEpFcEtvZVBaaFhvVlc2NHFMOWc2L0do?=
 =?utf-8?B?V2NDc29tZldocEdNQ041YVI3SCtWMitKTEhmckVnOVY2U0ZDRzh3czk0ekRJ?=
 =?utf-8?B?K3E4R0JlWlh2YnQvS2IrMEkwWFNqdkw2akpQSnhaZjB1dmpEdVBQSnlnbzBM?=
 =?utf-8?B?ZGExUXBseEgva1lrUzZGOUJjSXJQaGN0RjNCMUVGWE9Qdmk1MENoVjRCL0JC?=
 =?utf-8?B?TUdJUkViK3B4ZE5IWlR0UnZPQXMxSi9ESDViT3pMbUo1VEJPaUkyWVkwTjFm?=
 =?utf-8?B?b3Q0RjcrQndhNURMalFxdUEra0FlN3FNNTI1N1N6ZDg2amIvQ1FPVnRTYzhX?=
 =?utf-8?B?TjVSR0FvTWVYTzUzUThBYTJnOTk2d2FqZ1lnZFRDYXJDbnRzdmMxam5JWjFB?=
 =?utf-8?B?TnRoNEwzL1ZyUEZ4ckw3UXR2dTZsYjE1Vy9QbUhSYUJ3cFdneUJPWnNGcnV5?=
 =?utf-8?B?bVhGMFRocEhSb0dITmhIVWZpY0FrT0dwaERqQmNZTDNYU3BMVlFRaXFmbHdW?=
 =?utf-8?B?U3JyY0VXTnRuVkhOczNPa2ZyZjNkcm9ZSWRhU1RCNHVSM3RhYnh4OXlpejdl?=
 =?utf-8?B?bDdKbzJSN2ExMTg3K2ZFeDY3NUJZWEFwV2I0Qm9wSmJrd25vTUx1aW1xZW14?=
 =?utf-8?B?bE13WlNYbE5obkZoU1JtSHFyZkNIdlRkbVV2STJmalVHaGJmVDdyU0ZHczRV?=
 =?utf-8?Q?8fDfJ1ki3I5gpOEuCkk/nhc2NCZz/TlJsaYVtWv?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23ac0dc-31d7-4cfa-08d7-08d8ff1f5083
X-MS-Exchange-CrossTenant-AuthSource: SN6PR0102MB3487.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:28:43.8066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mA5wHi5oz0oa3thOnFcmkZ4kkkcwLwGBZU2eUWKvIASpIUlOL23ZJ/ZSPh0oSVXiHB+3hfrr5OeTBM1b+5fpckMugf7I5C+IIWmyorqlBQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4142
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13/04/2021 20:49, Rob Herring wrote:
> On Fri, Apr 09, 2021 at 10:13:29AM +0700, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
>> reference platform with Ampere's Altra Processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +++++
>>   .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++++++++++++++++
>>   2 files changed, 133 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>> new file mode 100644
>> index 000000000000..fbf7ec754160
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>> @@ -0,0 +1,28 @@
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
>> +  details see ../mfd/ampere,smpro.yaml.
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
>> +  - reg
>> +
>> +additionalProperties: false
>> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> new file mode 100644
>> index 000000000000..5613c420869e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> @@ -0,0 +1,105 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
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
>> +    enum:
>> +      - ampere,smpro
> 
> Again, not very specific. There's only 1 version of 'smpro' h/w or
> firmware? Are the firmware version and features discoverable? If not,
> you need to be more specific (or better yet, make them discoverable).
> 
Hi Rob,

So far, there's nothing to guarantee this is the only version of SMPro 
and neither firmware version nor features that are discoverable.

In fact, it was "ampere,ac01-smpro" specifically in my v1. But this is 
the "ampere,smpro" in arch/arm/boot/dts/nuvoton-npcm730-kudo.dts, that 
is why it got changed to "ampere,smpro" to avoid changes in that dts file.

I'm thinking about change it back to "ampere,ac01-smpro" in next version 
to make this compatible string more specific.

>> +
>> +  reg:
>> +    description:
>> +      I2C device address.
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^hwmon(@[0-9a-f]+)?$":
>> +    $ref: ../hwmon/ampere,ac01-hwmon.yaml
>> +
>> +  "^misc(@[0-9a-f]+)?$":
> 
> You don't need these child nodes in DT if there are no resources
> associated with them. The parent driver can instantiate all the
> sub-functions.
> 

 From v3, there is a "reg" property introduced for the child driver, 
especially for the misc driver. This is unavoidable because other 
properties might be introduced in future for other misc features.

>> +    type: object
>> +    description: |
>> +      This module is part of the Ampere Altra SMPro multi-function device
>> +      to support miscellaneous features
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - ampere,ac01-misc
>> +      reg:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +  "^errmon(@[0-9a-f]+)?$":
>> +    type: object
>> +    description: |
>> +      This module is part of the Ampere Altra SMPro multi-function device
>> +      that supports error monitoring feature.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - ampere,ac01-errmon
>> +      reg:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +required:
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        smpro@4f {
>> +            compatible = "ampere,smpro";
>> +            reg = <0x4f>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            hwmon@10 {
>> +                compatible = "ampere,ac01-hwmon";
>> +                reg = <0x10>;
>> +            };
>> +
>> +            misc@b0 {
>> +                compatible = "ampere,ac01-misc";
>> +                reg = <0xb0>;
>> +            };
>> +
>> +            errmon@80 {
>> +                compatible = "ampere,ac01-errmon";
>> +                reg = <0x80>;
>> +            };
>> +
>> +        };
>> +    };
>> -- 
>> 2.28.0
>>

