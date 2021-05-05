Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69943373692
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 10:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZqyt3Lswz301p
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 18:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ua6hiWcI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.100;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ua6hiWcI; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2100.outbound.protection.outlook.com [40.107.244.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZqyW2lbkz2yq9;
 Wed,  5 May 2021 18:44:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNE/8zbpO75i/Jg1zLzdjOv9XkWXuxzmxpbwqQs7iyJUawT3oHjFqNZoo/LnIgo6MGaspUqSE02Sy82XUiU7i/xU1IJ2ILvz5j7oTSHpZyryjwO84XOARmoPgmgvPO+vXFaVoQpIue9ya0RFezud5V6p29pGBfrLD/RWOBsKO4lhszkXBcHGaYGV0RnIVT6dd90crJ9dnCiWgxLgCnxcEV6kMI46mByVocVb5BPNQ0P/Q2fEoBMdwW/Y1bDL/7/l2q3yqn7ZCceZyC1Ukoqvf8im5BhYYF8E8CHh77ZP9UiJFa6fxiHgP0M4i7FGoVWZilo/wPYCVm06DglPaFqrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQZqyqmRwVdJ97RVHf2k+XA5eGJWwQmpvSjJtW2VGnY=;
 b=aqiMiYsbq93MQa+T52CPt083DsDTiEz08ncYJRThqyX5f/Kry3dfn3j+CRzCfeHZ/MH3erHcbort7FTmZAsOPao/o9f38hH0djDk+st+KaEdz2jlTDHNSedDRJzhulA9G61XVrAP3y+gRT+zM3OYTrrdyBL58PhVX5v0YwYWB/ZYbnLWH2+6Ld+pSgGJbsBCu/hNNeskJCQe+qgKL9OOglp6Z2FhUv6Us+mCE3AJMQqgbPmAjUq2OQacL+QXy4PTmgKqroknELQc+oFVYA5Zm5wr33DYeKeRdFF3snDFamSqyN6rPvKoq1nNyn01nF18CV63iznveLpuYJf4Zo+44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQZqyqmRwVdJ97RVHf2k+XA5eGJWwQmpvSjJtW2VGnY=;
 b=ua6hiWcIeavVO4390DymFNgbQJSHM2JusNbKYaHla2ewpnQTsErlgIlv8KCQtVMLBbS6UCy2IQryAxY8H33OcKCa+FMQM749b+4uRuOVQrQWWGM8vytnNctxMCeQ1x4daIkYcCi5hggg3g9XnKcXZmW3WbbAd/XxDVrbLGt/H3E=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2381.prod.exchangelabs.com (2603:10b6:300:46::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25; Wed, 5 May 2021 08:44:23 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 08:44:23 +0000
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
To: Rob Herring <robh@kernel.org>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
 <20210422090843.4614-2-quan@os.amperecomputing.com>
 <20210430201918.GA3806853@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <52550615-ae38-d88e-a597-29dc9c71755a@os.amperecomputing.com>
Date: Wed, 5 May 2021 15:44:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210430201918.GA3806853@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [27.74.205.135]
X-ClientProxiedBy: CH2PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:610:59::17) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.85] (27.74.205.135) by
 CH2PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:59::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 08:44:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fca1013-d671-4073-1d84-08d90fa1fb46
X-MS-TrafficTypeDiagnostic: MWHPR01MB2381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB238173B790B7FE6A5A23C101F2599@MWHPR01MB2381.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3D73IgSjmeX9PQsbOmE9xUpEiNXIxYuDEADtCep9OmqLjGrj+iudb2PlGrnZ3fz06sEGTmYAdQ5hCpWpx3LkOJ5rR+F82Vu37A7rta6y+uWiMx4hZ+VKFXrnG62zvucGVaAUzkbxa3TUD7NmvpwkqvcJg43TbiTFuveK/ZQDbxoNGyBS4KvLPoEI4kf7rMCkAzpTHiPNmLn4DpIcmerwfFdnrZ2Uxr7hDQAV96r58GB2aqmdhZnoYOAhFToctoFCORdkHi+3IJ05HA0Zo3T5iHW1MHKcwr7PR3anz8nLW7RT3mJB1kGTwClH6GxDJ3TYJ6gnCvqrohBOzeIyTfyt1fObxw9/RSJltCex9Z+K9XO0du1NX5mpNWV+fiw/E7eBwYG11zyitVmY3fDxOKy2ENPkEC6y+WH/GUTcwYdr8PfJr3gTA1erEiffwdUeB/oKNwcHITBTXtkCAE8ccNdnVB0LWPvtwCyUHZ+IgkyKhpndOD7WyP0affRabboHzvPl8FdUHKS8h8z1ZXwZjYzR1SWk8MONRfS96hjYFGom3sTsMuqhWJpAQujBLuaFBG9H3UbbXMJbFwcLM+N3Mg6g9pbCZML9v+Jkq3z4lx25gt9UGvxpNJC+jqiCR5L67RZiF8BtcEbsrXIcT8sLWOa+lmdT1GD12haQWfJZDQftMSOAotaxz3IUzwGVZobHMv45O8dqvMtbt3sm2+Jj8/f8ZZ94+FNy/hh0yvdSzzJj2e+jqFpcXU8bNHZFAhXPYwNUtkGBSv9GS1P2TT9yVLtyd8/Mu7n+RpBHHh+Fs6ET6nk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(376002)(346002)(366004)(66476007)(966005)(8936002)(31696002)(66946007)(26005)(186003)(5660300002)(66556008)(6486002)(53546011)(54906003)(478600001)(16576012)(6666004)(8676002)(107886003)(31686004)(316002)(2616005)(52116002)(83380400001)(4326008)(38100700002)(86362001)(956004)(7416002)(16526019)(6916009)(38350700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGg0a1lWM0lCUi9CRTRWakVhYjNMUFNid1dWT3g5Zk5yRDRvMktMdGpHdkQx?=
 =?utf-8?B?Ny9Pc1kvaVp2RktPSTBncFpnNlpXMUZadDZSRTBIMW80V21UbFRpaU1ZY25r?=
 =?utf-8?B?Z2hLcXIxRFkyL0g1RytuY1g0cEJ2MUhsMVp0dnllN1I0R1pzU0FsQXFYS3Ix?=
 =?utf-8?B?N1hDNVdTMTRkUVFLcmZyQXJlUGR3NXlmaDF3cU9NdURsTjRlR2NTUmRqd29O?=
 =?utf-8?B?U0tJdlB6MUF3R2t4Q2FROEdKSzM0VnJ5RCtlVWE3Qit3TXNrcHRNRUp5aWJC?=
 =?utf-8?B?aEdwNFNMSk9hdXV1Y2NCWW43QUZNY3FLTmFBTkhmN0UvWTBOK3V5a1RMTzRn?=
 =?utf-8?B?Zmwyc0h5MFFBaUNvT2NxVFU0b3E4WTlFZS9xOHhjUUFqSHJnOXl3K1F3eVla?=
 =?utf-8?B?UjR5amd6d0pHbFRRd1NzbFZHYnU3L2JQamZIbE50aDNVNC9nemNnWFJHU0Zy?=
 =?utf-8?B?bjNIbmt5K2ZZL01pd3JDVm1nZ0RrZTkvb0xpdW1lbjlsSEFvVWEyN05BTWoz?=
 =?utf-8?B?VXc4ZlhCT290d2NQWFBVaDI1S0hpQzhFR1JwRVZaZ09LVFlsUjU2UmIya0dr?=
 =?utf-8?B?dTBTMkxwbFk1VE9CSUdqaFYvNm5TaWxvUVR0bFF0cnVFaklsN3lhSWphZ1c0?=
 =?utf-8?B?TFJUamdoelpvZkUzanczT0k0WnhjS3lFWnB2Y0tGT0pqM1gxZzFnTFUraFJ3?=
 =?utf-8?B?TXlFdmJyeFNIekZJTDlvUkc2ZUV2QktsOXljU2xRbnVyN2IrVXNNRkgvVVlT?=
 =?utf-8?B?Y0dEUUs1NjVMc1lxei9hdGRVcjVmQndsS0tLYk9wR0NRT2U0SmRSdFlac3ZR?=
 =?utf-8?B?NGMrRUVRNUNORDRZeS8wZ1BaZTJPZXNjTGVTcE1xZ2Q4WXFJRWE5cFlwR1dr?=
 =?utf-8?B?Q3R2VDk2eE54eXdRRzBsSDJiNlhYWkdWNmIyUWZTTkhiL1lkQUx5UUtZYXdy?=
 =?utf-8?B?Tk5QZXVaUVc5bFFxL1NCZ2FCV1JOOWo2VXNyRGFJU0x2ODZFMHhEQ2JTdzQr?=
 =?utf-8?B?eE1QclZsWXIzT2tEWkRyaWtxd3FKUmgva0NYK1FzT3hXOGNCeVVqUXVZT2I4?=
 =?utf-8?B?SVQxVmFBT1RkQzQyRkFRaGo4UnNaYklPSUxhUVkxcHJwTFpTWWtyaXp3WVVW?=
 =?utf-8?B?dGJmVDh2eTlKaVFqQXNIbVpVN29NMEJiMGprM3JFWExjbkNqdlN6ZlIyU3Q1?=
 =?utf-8?B?dzBPOW9aZjB4L1hFUVlSNmtrdzZ3UTlWRGFhN2w5cnBSWG9iMzVrSlZyVjFD?=
 =?utf-8?B?YTBEZ3JSM2xTTDZhWlNtQUJNSDd2YjNJOEllZjVhcDhRMzhWQURBNVBRd2hL?=
 =?utf-8?B?aytxODR0YjJya3Bid2RKbnpadFY0Q3M5Lzd0QVc0U3NkbjJ6VEllZk91MkFV?=
 =?utf-8?B?eFVhWmxPRUtGRk1oci8zNXp3OXFyZUpZbFVranpEUmVNREhFSkJvdzFGR0Ns?=
 =?utf-8?B?MC9lTDRKNEdhQ0pkeVhiWWgvd21DSjNQelpXbVZ5SlE2cmFuRDRQcUczMGNF?=
 =?utf-8?B?ZTJOZXliK091MWNvdzEvbGZJbmppcFE5UUdvYzJHNHRIQ1d0cG9IT0RmdEZX?=
 =?utf-8?B?QUFyYk9JMS9JakY1SlBaL0RqdG1ScnMva2ZvcFZQSXV2ZDB2bXlVdmQ1azY2?=
 =?utf-8?B?NFM1YkdQcGNSY1h5dTFHeGJYOFcvMlhqRUtLbkxpbkNGK0t5WFBKU3NENDdG?=
 =?utf-8?B?bnV2NlRGeG4waVNRSzRaOEloTkkrSWhGdWNsb01TS3YyN2Rwd01pZHFYODBk?=
 =?utf-8?Q?+qIUHaMreBKsxJoY2Z8pw+aQcsnDbcmfMeTVxqA?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fca1013-d671-4073-1d84-08d90fa1fb46
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:44:23.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TCgcZ2Q9YUXsFkN0K+YKcgvr+u6FrKBHyVTUqD8CXfSqmOJo7Z5YQ1s/pMmDdUU8f1DUF59xdaWYLJz9yN3mlu4jdv1+b71tEZ4hewbqzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2381
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

On 01/05/2021 03:19, Rob Herring wrote:
> On Thu, Apr 22, 2021 at 04:08:40PM +0700, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro driver found on the Mt.Jade hardware
>> reference platform with Ampere's Altra Processor family.
>>
>> The SMpro co-processor on Ampere Altra processor family is to monitor
>> and report various data included hwmon-related info, RAS errors, and
>> other miscellaneous information. This parent SMPro MFD driver creates
>> a single simple register map to be shared by all sub-devices and leave
>> all the specific to be handled by the child drivers.
> 
> Again, just because you have multiple functions aka MFD, that doesn't
> mean you need child nodes for each function. The only thing you have
> in DT is a register address. Does this vary? If so, how often? How many
> different versions of a DT do you currently or expect to have?
> 
Hi Rob,

Thank you for your review.
I will try to explain what I think below and expect to receive more 
comments to improve these patches. And if any misundertood, please help 
correct me.

The idea is to keep the SMPro MFD as a simple generic register map and 
expect not to change or to handle any specific in this parent device 
driver. This is why we see the simple_mfd_i2c fit in this case.

And so, all the specific details will be handled in child devices driver 
and we expect to have child nodes for these child devices. If the child 
node exist we can then add any specific if necessary later.

One case is that, each socket (ie: the Ampere Altra processor) has it 
own SMPro co-processor instance in form of register map and each socket 
could be either slave or master. Some function may not available in 
slave socket but exist in master socket and we simply choose not to 
define the child node if that function not existed.

The other case is that if there are multi instances of the same function 
in one SMPro MFD register map, then each instance might need to be 
differentiated by using is own register address or maybe a DT property. 
Then we can simply add them to the node of these instance.

For your specific questions:

+ Does this vary ?
yes, I think so. The register address in each child nodes may vary if 
the SMPro co-processor firmware change its register map layout or maybe 
other instances of a function added. Child device drivers are expected 
to handle these changes if necessary.

+ About how often ?
I actually can't say how often but the purpose of this SMPro register 
map is to provide the info to the BMC. The BMC will need more info from 
the host so I think changes will be unavoidable.

Please help with your comments
Thank you,
- Quan

>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v4:
>>    + Revised the commit message to clarify how the specific info will
>>      be handled commented by Rob.
>>
>> Changes in v3:
>>    + Supported list of compatible string [Rob]
>>    + Introduced reg property in DT to specify reg offset [Rob]
>>    + Updated description and other minor changes in yaml file [Rob]
>>
>> Changes in v2:
>>    + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
>>
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

