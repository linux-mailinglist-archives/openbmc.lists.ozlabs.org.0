Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21273356840
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 11:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFfZd14hJz303t
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 19:42:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DwjVtWVj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.77.100;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DwjVtWVj; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770100.outbound.protection.outlook.com [40.107.77.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFfZJ379kz300V;
 Wed,  7 Apr 2021 19:42:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpqCRQ7Jys4M/YzkOxO2A2rZHlib5VeG9icQV88j0B3qD9DuhtV8I8Q6FY9mz0X92X3tLPYDMeXZXQ8YF5xVLChIPWJErAtPdFScvA1OfknUPIpkfPKIuPUM/Hjfr02aacy8honEOL4RHOCOI9sTQHPxBj+qDLLgAf/8M7pMorwWBRpWVABUCcw9kc0GjsdoUNsHidS4biX/FKcqmQ4E+px3luHI0by1QqOhzawDNLgBim6m9YoFfyWS8YCx30dZrhg3FevxHyM7dPyoFHyAeKgiRSTwXBYIj2orfvlHHk9tgISwU4FgLxJYF2ujZb6tGj/504dEoNcFYceSGTZOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuivuO6bq/+oX42yXCpWzRQ6SIbouk3hv1im4RnK818=;
 b=M/GS8FmiL4ZB/8wY+BR5mFnUgkWDzJ2KXbzXIARqcP9UtAqJmxgThvxniMzIa9PFsGGtpUGfcGF8a7GfMcQ5acS7w113cIJEGMIRVvuGvM99R0j4NBQmD1pbxaWUHJfawgZ9EjA8b+C/rRBN4IWd19KFXC7VPO0ttNivkLTqTcXYA/h1/XPQ7mO+C9YsVy67sMCLAOammBXr/5n05pCbp8scYOO7A6IuvcRHTIa3harIh0cTx1ltjZQ87AgjSBNufJ4igCH1gQxWYWZ/OFMePGLFITHOb67ZNOWADQnQPgSG1zcRF0vy64hKsP4FfZeN4qdddGhZ+UaDa8VpzouoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuivuO6bq/+oX42yXCpWzRQ6SIbouk3hv1im4RnK818=;
 b=DwjVtWVjzI06MYLXnQDZZ9ClYU5lsOK+nlX5NtJJ+4KuhxvBPw2oEVpZ2BDuCJgj4DrI562WZP5RQbLfZ1nfhdSD8V0Qs9XmE5I3ShLZuwz8MXaLUhLWpa2OsAFrHKDEv5o8D50+aHtq8Hz2FsG7uUmr3d+5wy6NUOGaL2/Ira0=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2974.prod.exchangelabs.com (2603:10b6:301:2f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Wed, 7 Apr 2021 09:42:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 09:42:18 +0000
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
To: Rob Herring <robh@kernel.org>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-2-quan@os.amperecomputing.com>
 <20210330211443.GA326528@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <29f5f458-5694-aa70-ea90-2bb239e825b6@os.amperecomputing.com>
Date: Wed, 7 Apr 2021 16:42:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <20210330211443.GA326528@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.17] (118.69.219.201) by
 HK2PR03CA0063.apcprd03.prod.outlook.com (2603:1096:202:17::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Wed, 7 Apr 2021 09:42:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2c37e6-713a-4bc5-65c9-08d8f9a96f40
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2974:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2974E7CB7548368A099FB5E9F2759@MWHPR0101MB2974.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sE49/WKYe/1E+8jpCjJV03qHvbGDsVrp0iv84Lx4un97iqyGQ+0ChP42hp2ttkac5pQbC2o+jDCLjrRgvS3G/fVqI6N/3iq/YJGgg2B29rxdpm7U+Yx62xyA9jbXW3Yp+ZmZKrf9fJWQwbVf+x2T+Xv+V5dFtZgwmEMyK4CDC2NUTdQIy+IsGfxjvcJWyyYetRnQF0xD9DQvzpfAMVYA/MJXsuq1LY4uY7iL0UMjMq0qUUSfkBNjhrEYN3ExjwiBcvjj0vHqQioYfceoo3ubeasd55ORtwTsaIMpRGVYY4uuY6eNH2l8gx91uRCO+XdRs0nGsPDyXVO6aG0R6DhhMZ/TNMtDzGpPNOlteDWEY60XxPX0uXIG1oh558Vm/yvR5mC1NjW4/ucohQ7LJVlJIc2ugq9/oPFERtopPtDVZ8CnVVX3jCNYBvJnUyHaulUWH8AklbRs1mVumk8KpNumYPtr9t7eMGFRl6oIRJv0V4xMz1cav3ayKu4sSKDVO7QDELihMxFWUOXxpuPd4Fm96ho5uvv8aSPFZA3qE+6T0rb31s6rzx/bZKkRw9gYFEMOqZM4Pc9ZpE7s9wBWc9xkrEthPgC5HBAgermoLyVmqvZ018heRcm3Z7C0acYyeuLLY3/6RmM2CT/svyr7XDeWuHAZ/UIob2KscCdTxMiXMQpybAfPf/FXhzsQJKiiTjJCbaBVOuRWKDNKskYnYx7thZoLnuMyM8E99gOetZ4IQlXgRE3jLe4s242v/hp+i6MOYXmtJ9I5Z1leW+6g5ML1Y1sR4Ielwa7df+hHmIir6K9ypqmPDYSIZzqOE8hG/jsKJzSrQyg5lgAqMfOfVxFotg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39840400004)(396003)(2616005)(4326008)(16526019)(8676002)(66946007)(186003)(956004)(5660300002)(38350700001)(66556008)(38100700001)(8936002)(6486002)(7416002)(31696002)(31686004)(6666004)(53546011)(16576012)(316002)(54906003)(2906002)(107886003)(6916009)(83380400001)(478600001)(66476007)(26005)(966005)(86362001)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c04zdUNvY1NMbUpZdVA0K1hqWmZtSDlrMzVIY2MzbVRmSEFCQlowaUptU0c1?=
 =?utf-8?B?cG1yWGE2R2dGcEltZDE3MEpXR012cEJNVjN5bHE5RmNmSkh2bGhpL0hPUUt6?=
 =?utf-8?B?dVM0TFl5S1NlbysrcFN3VGtIWFlTdHNMZFZYNW92YTVTTjVDMkJ2ZGpDSkhs?=
 =?utf-8?B?eklxVGRESWJlSmdOckd5Zm15dkdKQkRmMjlJQmM4Y01iVXdmREdGeW1VckdT?=
 =?utf-8?B?V29pVUFKWWNQVlhRK3RNTlp4OWhpN0l3cXQvbWNJRFRaNTliMFp3cFJSYTc4?=
 =?utf-8?B?d2ZoK080YVZ0L0JQNDErZ2lMS3JPYWgwUzJjWHdDOEUyTTlDcEJrSlVmSnNM?=
 =?utf-8?B?TTF4NEFUY2FDOHoweFQrYURtQnFrcjZsbWNDQVVwMXZ6ZEpLa0VaU2R0YkdX?=
 =?utf-8?B?Y1doUHUyUlE5c2U4UURWTmRsNW94V05UY3dZVDdpZjNaYWZvc01ValB1N2c2?=
 =?utf-8?B?UjNrVXVVSDBlQU84YmRMRVRHb0owbzVadjJld21zNU5XdkVmUm1ZcEs4MFZm?=
 =?utf-8?B?NlNVR0g1NUV3TVVQc0Fha2hGM1I4NnRYZFNrTWtWUDg0SFZaU1h5NDNmWHM4?=
 =?utf-8?B?aEpGdlhDM3ZIUzlyL3AyNytJczhsN1BEa0gwNWdJWG42UjQ2UXJpMXlscVIy?=
 =?utf-8?B?d3JpVytFUzc4bVprNGRXaDIrL1FEekQ4MVNOOURXdkoxNXJwc2xFWTRxODFF?=
 =?utf-8?B?RlhCR0luUThML0tMbGVYZE9VSndYY0JiTWpsaVRZVkc3V3dkN1JabytHWmIr?=
 =?utf-8?B?TmxnMHVCclcyRFpwWElqTndOUVFOeXhyajF5S1Y0VmFmL1BjbWk1RDcrTmxO?=
 =?utf-8?B?VDRJQXFrYjF0NlJvemxsSFZtem4zZEl4TzYxVUd2MGhDb0hiOVFwYUZTY1I3?=
 =?utf-8?B?cjd6SnltcmdXVjJ1L1d0WFFwTW1pTUhPNHFPMmovMW1WZEZuZ1RQZnNBTHNa?=
 =?utf-8?B?OUlPODM4ejVseHVwQlVPQk5wdVFiUEdMK3RvTjIwdDdkVGdTekJ3VmE0Ny9j?=
 =?utf-8?B?aGdyOHJqT0piZVU1ZFNSdHc3MW5WZDR1L3lrNGdsZWw2Qjg0aG1Yc3I5elVG?=
 =?utf-8?B?RnJ5Q3BMRXlUZzM5WFZHeDhZU1FFMTBQRkovc0hYN2pCaU9TdWVzYmlSZWtr?=
 =?utf-8?B?QVhVa0Ywb0cwaS9yTDIyeFM5RkY3d0wvT3c2L3NpNmVZUGpKS0J4QUJaZ1Rs?=
 =?utf-8?B?d05MVUU3QWhjcWd0dFpzbWlsZ1B5OEJvN0tTUVhkdVZMcFFQdGp4QUZuTjdo?=
 =?utf-8?B?eWVaVnU1UkRLcll2YStGR0lhb0ticnJpbGw1TVozc3Vidmp3bjlCNHF3RTZv?=
 =?utf-8?B?S2hBUnhPY05tZVJFMW0yNm80RHkrdXBNd3Z4Wm9ITzFEWGdUdThxV1lJWFpn?=
 =?utf-8?B?dmlqTmFoNUtGMTNZemhQY2tDVjBLWHFRRkczMGs3VEZ1bGdwNFh3WWluQ1Jo?=
 =?utf-8?B?MjdRcVRId1ZWQ1NqaTlCYnB1WnJ1TjluOU1qcldWYjYvdUkvMDY2WjM0MlVD?=
 =?utf-8?B?VUZjR01aQUk4Wm16NUFwMGxmLzd4OXk1VlJJZEgwWVljdXlPOElwaW9EcE1s?=
 =?utf-8?B?QitJaG1aaWN1VjYwUXF0SVBJNDNEaytMVEo0bHViZVFaOFFpOU5hSkJtZFlj?=
 =?utf-8?B?eHFYQXBadERqYjQxNXV1cTZaRktSMTRGV091d0RScWdmVlZvdzhwcUJybjFF?=
 =?utf-8?B?Nitmd0xlWU9UaGIvY09UbHhvUVBmVVFjUTdrRVhaWGNlTkFFZE9oOG8wTFdq?=
 =?utf-8?Q?MORDx7W/aQa88FXNIoU1MsXVJaxZqGqF6KSsr7o?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2c37e6-713a-4bc5-65c9-08d8f9a96f40
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 09:42:18.8113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcNzl3nzCbuxG6Op+nF3RyDpXbrouj+6425pH3y3snFbdYZDkvimwW2L7Khyo4XCRiIAT52EF0tEWcvIZ9BD3oRy1AetE3HEXzXK5BWYoKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2974
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

Hi Rob,
Thank you for reviewing

On 31/03/2021 04:14, Rob Herring wrote:
> On Mon, Mar 29, 2021 at 08:52:35AM +0700, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
>> reference platform with Ampere's Altra Processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   .../bindings/hwmon/ampere,ac01-hwmon.yaml     | 27 ++++++
>>   .../devicetree/bindings/mfd/ampere,smpro.yaml | 82 +++++++++++++++++++
>>   2 files changed, 109 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>> new file mode 100644
>> index 000000000000..015130a281f4
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
>> +
>> +additionalProperties: false
>> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> new file mode 100644
>> index 000000000000..bf789c8a3d7d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> @@ -0,0 +1,82 @@
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
>> +    const: ampere,smpro
> 
> Only 1 version of SMPro? Needs to be more specific or provide details on
> how the exact version of firmware/hardware is discovered.
> 
Will change to enum in next version.

     enum:
       - ampere,smpro

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
>> +    type: object
>> +    description: Ampere Altra SMPro Misc driver
> 
> Bindings describe h/w, not drivers.
>
Will fix in next version

>> +    properties:
>> +      compatible:
>> +        const: "ampere,ac01-misc"
>> +
>> +  "^errmon(@[0-9a-f]+)?$":
>> +    type: object
>> +    description: Ampere Altra SMPro Error Monitor driver
>> +    properties:
>> +      compatible:
>> +        const: "ampere,ac01-errmon"
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
>> +            hwmon {
>> +                compatible = "ampere,ac01-hwmon";
>> +            };
>> +
>> +            misc {
>> +                compatible = "ampere,ac01-misc";
>> +            };
>> +
>> +            errmon {
>> +                compatible = "ampere,ac01-errmon";
>> +            };
> 
> None of the child nodes have any resources in DT, so you don't need
> them in DT.
> 
> Rob
> 

The intention was to re-use the drivers/mfd/simple-mfd-i2c.c and dont 
want to add extra codes to this driver just to instantiate these 
children. So for this case, the child drivers will not be instantiated 
if there are no child nodes in DT.

One solution I have in mind is to introduce resource (reg offset) for 
each child drivers.

-Quan
