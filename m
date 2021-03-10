Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80374333412
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 05:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwJPb3kkqz3cRt
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 15:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=G30Fjuz4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.116;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=G30Fjuz4; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2116.outbound.protection.outlook.com [40.107.95.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwJPG58nGz30QX;
 Wed, 10 Mar 2021 15:04:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atuIZuQJlJGFlGr4R67HoS0TioPo3Oj0Q8wqFr5MAQnpt/g77dofDgpB6yUUW74PN/h5mJfNgkyL8c02q+HJIN2mCbF2UGQ54jXr5dY3XyLZ9br73pLufsRiMsUoZcCLFiC8co5DDjQsGGX/Wy9Jz/tF+nDOUY2ImTiymWysIpXPGXhtnWxT5IKtOtHsnhTA93VOb+EA2//nndhM52UO7At24oJ7DEDQQ8eHx3T3eyHcgHuqgUSO7IGHZd7qfmeANqrzNpIU6RN6TfJ3lO5aLhOq/OcnVN9vWy0W/doeVi0XP+tJgLOmkn14r+JNhUSH+9MNy041gH/RA4Wu+oyRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFhQEwcUfHwKZF3cyQr8Mj6ICJsAVEgZpnNQdW05WmE=;
 b=oCE6GIhdTZPnBH9evSTq8LlyHi+mqTUnsh9fY/gPCzppPFiUexRfiKkNlKJT2LN7g6HwT7GZHTlnESE5db4P8KCVGPNZi1b0j4FovHHaQJdkEth58eXc3+vbjnSWg5Q/G8FePqTjE7hBtlC9En8mXrPwWr2u6XOLGokuAcPm9fE1OgxpsEAMAyLTuDBzGmE8M0kqVwJ89NADgdr1OW3dSyePkCs9Xm8VCpVdh+inJz/HLYjSLbgxo/2V+2RvB0OFH3Fv9rz6YwkrANWgUVN3pwX2GlbRxuykLweZzZF8bLCy5TNfj4gsoFiClike+GzNKFhbWYc0h3pIwj03jMev4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFhQEwcUfHwKZF3cyQr8Mj6ICJsAVEgZpnNQdW05WmE=;
 b=G30Fjuz4LcgRco/WjmUW+BTyq8kMNQgha0TMFp4Gu8sWgpSz9xBrsPq5FfksjSC2Haj5vvqhJXZcM+78BGr+XJnt9RT0Ut/gUhev3bIWxdKDSA5LzxyFKKoRxoH653wo41hkju0TyBudGIrtgsuAoIlZce2/k+CFeyc4dWsweSA=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6196.prod.exchangelabs.com (2603:10b6:303:71::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Wed, 10 Mar 2021 04:04:25 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.038; Wed, 10 Mar 2021
 04:04:24 +0000
Subject: Re: [PATCH 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
To: Rob Herring <robh@kernel.org>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-2-quan@os.amperecomputing.com>
 <20210306205855.GA1195877@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <67305f3b-7651-a2e0-5074-3f39b18d188a@os.amperecomputing.com>
Date: Wed, 10 Mar 2021 11:04:15 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <20210306205855.GA1195877@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 04:04:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bd41a47-9f1f-4861-7e8c-08d8e379976d
X-MS-TrafficTypeDiagnostic: MW4PR01MB6196:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6196FAF1A5DD6E6264E3C1D2F2919@MW4PR01MB6196.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K09pQgqpT0onrzyeCmWuqD1SvC4yJr5B1AX0bmiwZaj4yoDj72gr0/55YSTY/j3Gqq80WaOPXFA/cuYpOa49eBxMrvXaCdOzfy2+ikoYi/Eh+EUopTD/RKN0C/WFdYTgx00ce59GjtH4wFhhyn+VoLaNEM6JivDSGgX7KuqOEeLRqIlHGcSP8URY9B/LqDaIHhF8Nj1eibRojTN86tqGUD+XKCBMnb5OEmPCc9EBPtJ5UFKvcXyNUmrowqNnGq/TcJBfqJy8YrCquO61RON/wncm8/0dqrF+i2xWw2ygmHz4PgLF+8iy0tE3z+O5h+4VQysvCZ+vyl/FcHtQuqt0Tfbzx29SuSLIMZQVyJTIqZhz3XJtQHkCifO7DAFQmLLsVWPvXZmYL49DAq2FwrufIcEEP37aV6hYTE/rfA7jHB5I7U0crh6BoDe9DI5rrIpR00RFOEkfYxM6hPNs6HJoYra43G/UV5y97PJ0EGr7ut/oiYgSx3MlmjzgyW2+Y7Oo10piKDW6CJdzGIHfR4JYJ2odqW1QSfTTPqDWbcBaUORWwdQjarkZaSVyRelxSBSDP4+iPOWdAZGHPmg+m9HhYZX4DuYh2IXQQZPG9tLsGviFtIJO98i37yMj99+sVmc/kGgEjsOBkmehcSLua4lH8d6nWXjCOes1Ww+SpgsOecEEmGaXGGtihzlE/dS1uyP8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39830400003)(136003)(2616005)(956004)(6916009)(966005)(478600001)(6486002)(16526019)(53546011)(31696002)(86362001)(186003)(2906002)(66476007)(83380400001)(66556008)(5660300002)(6666004)(66946007)(316002)(8676002)(31686004)(54906003)(16576012)(8936002)(7416002)(107886003)(26005)(4326008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUdOWEFENDRBMmppc29yT3FOc1llTG1keEJRVEhjQ1gybjV6OUtIWGVsN1Nr?=
 =?utf-8?B?NE1Qb1RZZWFIZ2lLL1RVSVo1Nkd0UitCdXNxeWtUMzBjdC9JZkxVenZVR3I4?=
 =?utf-8?B?clYrT0oyb2g5aU9nNXI1eFh3WnpjSXQ1dkk3WjBuclBnOWVoSGdBdTZKN2pL?=
 =?utf-8?B?TmxJT1JnT3p0cFRQOTJMK3ZRKzJaS1JFUlM4ZlNuZVJtNmtwcmFPWFdJVHp0?=
 =?utf-8?B?Q2dBbjdaSU1Sb29MYlQ2bklGVWFJdzJLQ2hkampUMTJVMG5YcEY2MzRLREZy?=
 =?utf-8?B?VEVVd0xHL0dHV1pyaGJJaTdodFFGYkY1VE5tQUxZbjMrMXI1V25RcE8xdDdH?=
 =?utf-8?B?QUF4ZGM1YlJUMGRVT3VVNXFGQmdiWGpaSlBOY2lTK0pnNjBjNGtVWlNVUGtR?=
 =?utf-8?B?bWVtSFRqb1NsQWxNRkdIbHBZNExKcmhnWnhlL1NPUEZkNmVDOUo2QkpzVFdl?=
 =?utf-8?B?cnRzQnRnWmIxMVZlUUhPbTV0WlFhYXRFOVB0RXpTQUFDY3E4YnhTTFVrb2V0?=
 =?utf-8?B?T1ZTS0RqelNNek9iVUIzazJjV2drc1hiZWp1MThsRGRRVTlPcDdaSXRBUW5v?=
 =?utf-8?B?MTFHRlhYWG4ydThtMStOMmpFRDA4RFVVWXJwM2s4UUh0ZWgrbVU1Q3RPYTNQ?=
 =?utf-8?B?ZHczTWpJelFYUENQN2JCSVMyT3JwUm02QlhrTkpJN2N0UFNuNXpuWGxXYU5s?=
 =?utf-8?B?MlRoVzlGbzhvWndHMGpvM053ZDhscjNoLzZMUWdEMnViUkoycXRkUy9kZWtE?=
 =?utf-8?B?bDFBSU40V2FpOENqTGs2Y3FnczRlQWtjOWduK002VDNMUGIrQkVyWXpGMmtE?=
 =?utf-8?B?dWltb1R1WThxV0xMM0lxcklYbHRhVGp6am03QUxDZk8xWGFkWHFqdjFHVXA2?=
 =?utf-8?B?UnV0amh2a0ZRYTVWZy9tK1RzS0lzSUNQRXJYVlVpQ2pDOWFsWHRxOHFWZWpq?=
 =?utf-8?B?SEVjK1JkN2VsR2k0UGk2Ulk5UU9FckwwcVhzWEhmSCtwNlFCZWx6TzBRTFFI?=
 =?utf-8?B?L1p5TWY5QWl5UU05Ykpuc2NXZU5NMXlOVkU4azd6REpacGV6RXlXWkJNU01K?=
 =?utf-8?B?RUF6dFdPQkxQY0V1Z1d0NlcydnFWR3c4aURJSDNpVVZhUkJ4OWZ0YUFTOHB3?=
 =?utf-8?B?SHQ0cUZWT3JOQi9TTDlmeG1COThKS3M4N01uMjV0OEZPWkZYcW1qSVBobzdi?=
 =?utf-8?B?TFMwUVh1YW1EZVI1cmVlUnE1YVg1ZU5qRGFOMjFFdW5xTUQxbWR5ak9CSmti?=
 =?utf-8?B?d0czbi9tSVBXZ2pocmZ1c3pXZEdqYjNMa1gyb3pqUHM1cjBKZklJNE5pYmk4?=
 =?utf-8?B?OWc0dDRvK0JUdUUrOS92YlJkVGNxeWNMQXovZk5ZNlRtQmc4VGtQMFJRNnlD?=
 =?utf-8?B?NklsYkxTTldJUlpMZS9pN2R5ZkFhbGJVZHU5Mzhydm1SRWlrMk5XdTRHWmNO?=
 =?utf-8?B?UWJrRXgzS1RzUituZ3Jlb2gybTJHV1d3dHllK0w4Z2JlTmdSOW5ra1B0Mjc5?=
 =?utf-8?B?VTg0UDNUOEp2TXNLODVVWG0rV0hkSm9EYW4xVXNJa3MwWUh2VFZTNXdZK2Zk?=
 =?utf-8?B?aE05aVJ4SEJSd2ZKTjRDRnoxQmpsK0dGaHVGeXBNYnFhdHMwSHJLR05mdmZU?=
 =?utf-8?B?ajAwck4rN2pQbEs2aENGSDdhSndacHdaTzFsTXZjZGp4ckpMcml6c0hqRDJP?=
 =?utf-8?B?aFdDbGRPVDIvUVo4QVVjRytqZWlHWXFkZld3dG5NaitXVnVkVHNEa0xMOVJU?=
 =?utf-8?Q?O3FU9R3g2nEQRP+RPtcqeJwzSjpbzQOFDtLq+pw?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd41a47-9f1f-4861-7e8c-08d8e379976d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 04:04:24.8286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgsEjWpJbaOQhSfph2d3sPbQXJbcQvnS9zF5HFhl0OmDWxpvmbvZ9dJzh4P8iEKM4W4MTEtamUaMYys0tUziA84ie8qFW0GvIzQQJXboKzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6196
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

On 07/03/2021 03:58, Rob Herring wrote:
> On Thu, Feb 25, 2021 at 05:18:51PM +0700, Quan Nguyen wrote:
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
>> +            compatible = "ampere,ac01-smpro";
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
> No of these have any properties or resources, why do you need them? DT
> is not the only way to instantiate drivers...
> 
Thanks Rob,

SMpro (MFD driver) reports various data included hwmon-related data, RAS 
error monitor and other miscellaneous information, and we need three 
difference drivers for these purposes. And that is why hwmon, misc and 
errmon nodes are added to instantiate these drivers.

I'm wonder if this is the right way or if there's anything that can be 
improved ?

- Quan
