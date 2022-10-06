Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E35F61FD
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjk7d5vxdz3bjv
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kirTb2G1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.91; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kirTb2G1;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2091.outbound.protection.outlook.com [40.107.94.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk5c4NC5z3c6T
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:46:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4zs2Z5/cgDPlhE2A1OYd/re8so77oFOT3jGBgu0goTCLq87CZ6hbzKYw+Q7bpXV3srq44RNVqcuF3k9pfynnj50X61IA80gLkIx5Y9YSwMJ6Hzf0Sy5GmjMMwpfXOp4GXuL2Mr9isUgAoPnHLPpblTY4zH1r3W/ERALYw1LZafa7LEz1MtpxLw9EtLk2xBF4430Nr/3OxdMr4vSQOwkB4vU+F/UwaG0iRLaz3ev5QM+ZtbpWe083HyHahm0KeI5G8ZJ4VKoWgzaaQ1ZQZSwsLZFo56Zh2vMZyci9qYtDootynJBbUNg8eVcOs9YwCiZU9dz1m1JsyoFJT5usvWNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwzjHXiGekDf4mzqzKOK5JBFyYlLyNSMGzwX1Mb05Bc=;
 b=K+1h1D5Dr08v3KpxIZfUY2I8H3DF8x6HA1JLLg1ww4I2BJuDh8SRHlYLori1SckXejZ5KsZAMG6O+ZGA+IgnCd9RSHGoFdkjdhFB4NAUqWMOcShM0JXdrZ1l9Xuh2GFXiriybsN/dIMKeHrCMBbW49LmAQfscdCeBY26qMpmdouKZ59rcjkOjFzvE+DWxURIJJG5oCkWPITUZERM+hYJNT80uVmwtZwfgUvBVla5mK2JNthu0MbTNa6RTvHl9QZcswc2v9+/dyf1Os8nVfLL5U80Jody4VwV945mtL81yzs1VT04qog8+u0szV8XzQPfaKu9Yl8UN/dgyYX0WMBGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwzjHXiGekDf4mzqzKOK5JBFyYlLyNSMGzwX1Mb05Bc=;
 b=kirTb2G1S42lj4AkPwdpeEUJ3EN4li3O5u8FvPs2bkw128dDJGW5AyxMuIpWJqdHjTg+ndvc/h/LigaKz1Uq6W5IkQy4dZGMzHhUiYSc26t8Mh/+hahjTl+k9+DOX973ovY0DScIWzaHUJJgQz+VVBQ9ExO4bwrx0wXrLT9+riI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:45:51 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:45:51 +0000
Message-ID: <e0278166-0762-2f33-9d86-d268638358b7@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:45:38 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 6/9] docs: misc-devices: (smpro-misc) Add documentation
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-7-quan@os.amperecomputing.com>
 <YzVrwo5oUTx/0cxl@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzVrwo5oUTx/0cxl@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 76de7116-d101-4c4b-69a4-08daa76eca10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rkjNgDezQC3ZBxsB+vB3Y3jPgRXC0UT80rQkK1woPF8lc+v6lovcnmkw0Pw868rApFFYhtZG5GO++Ot/Eqsp9sa6jldl763BsGk3oHJ8ldXEitnhBXG6moJc774+48f7poyMFx9J82i5nGkTaaaDwtvLZT50ypgkerJFXVo8hCgaI8SHCYvxvGzoPwr+Jjpn4bdx+EMkPvD4vxzaVcoWpvXTpdj4cvEqcmvLo9fH24O15tbWrwtDWzyWsVdjtxnHSTHhER8N3LZkrXuXaTKiaPvSQaHlWNgSZ1dcUJ/ICJiJ/8CtIZ5kdxqbEg9WFxk3i9AtPGjE9PN4Sq6dba5bkwKJ3Y50bASWBSD15um30RqQUNqqLgquCefFEk/OUhzmBjG/DGw7lUNY7mVz4s/r1un/XFRvHv33zJ/87EqZ/lY2MCLMa6vTlqGt/RlRgmsK7oswqeIzI4jXwm/1bFxfXNXy5Dc8L1f+F9YLsKNtIkxJrhxzuKIkF+vJL8zjkwk08I31uLTFJSr9JUb3V3ySwdr4wt3lKfrFjMhoDZ/jpy/yyZOJx++GwliIbvSFKncVUHUuo+MuwkPxx4PQw+RnKmwGyqOWs8pRRl3zzTdL5a6q9uP4H+zULBaAxZn/d4onPNDo8TPcVJGtYTejWwfeqEbckgnoaOxLizdwbSmAumgFMHSKEaFu1NtBwW1ZUnZn4b+GAaA6VXg7Pjof26MLHext3LUkZsPZkc1SXL68nO3l9PHFWNfZtR3OAwW+jiRAI/KPlJEQPfs+rXCDGwpyRweMIZPipTMQJFJSvRiXUnM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZmRMYzBiMTVqMHdHYzQ1UkhHS2ZKYUlNT2FTUm5JclZzRWxyLzArcWN2UUc4?=
 =?utf-8?B?ZVZWVW9DV2Z1cU8rK2lscll1MzRGZHdpcEFXUE1ZMCtvbk92VkZXVkZnM1Uy?=
 =?utf-8?B?eFliczFLdGhGSk5PZmJNVWdLeXhPVGxQREd0K1RvR2ZoVEVqa29uSkh1dUdH?=
 =?utf-8?B?Y1o0dGZlOTFkRzgzVGMwTW0xOWRYaDM0aVBWK1NVNzNyQlpaV1FvQVV1YlRN?=
 =?utf-8?B?K0JSbloycjdPa1l5dzFHUGYxR2RNMHYwVU8wNGlIQjQ2RU9BSzNxeDQ5QVlS?=
 =?utf-8?B?SXdMRHl1NkhPTUtQM29CaXM1cXI5VFg1QnZlQ3pUWnFBRVJuVWFGczRDSTIv?=
 =?utf-8?B?cWVVbE1aOFlKMGd1MDFOYUJ5QUdmU3hqNmVkcllFZkl4R0lEYy8wNVAwaVg0?=
 =?utf-8?B?dVY0VXJ4akV3WGNzU1hmQjlFYUIrYzFJVEZmaWV2OWlnS1A0RFlHbFd0TytE?=
 =?utf-8?B?cms1ckdKM0hjazRrci9iN2RQQ1VDSDUrK1VXK1VocG1EWStVbCtKeHZrdWFW?=
 =?utf-8?B?bU9yejdJQmJOckFsYUN6VXNGamhMa0R0MUk5aThSazRjQmwyOGRzWDdidUIr?=
 =?utf-8?B?cGtaK2hZVjdUMjIyN0FkT3ZCVkpobDVsUkZDK3ppTzhSQk9RSGVaYkJrcDA0?=
 =?utf-8?B?SVJFSkhaRk5DNTVpUkpjNHB4ME5xYWdtUXJRdkRTZzJxdXByQ0pRR2Y4L2Jx?=
 =?utf-8?B?cVhza28rZHN1aHp2S0JsbUM2cHBNTndoQzZQU0pOUmhBOVpMVGtLRTl1b3Ns?=
 =?utf-8?B?elVkay9PbXRwckpRdkpSY1p0bTcwc2ViblVXS09pRyt3VVQ4NW1jZ2RMbHd6?=
 =?utf-8?B?UytCSVROaHdVSi9BUm5DRW9pU3Eyc0IweHEyU0FsRHc1SFFHY25pU0hJUENC?=
 =?utf-8?B?VHRoMFZ1cENvTkNPeDNJOHlZSzYrdFBpSGRkK1BoaG82cDRHN2Q2VFNEOEZR?=
 =?utf-8?B?RHlYRmgrL2daeFB2aWtJTmY3aEJlQit5dGF1SURRWjVLUXFiRmpuODJDaVR6?=
 =?utf-8?B?anUya2VaRUZMUDh2QUp3cWk3RnZaMkJ1YnhSejJIemN3UnU3SlZjeUxzM0Yy?=
 =?utf-8?B?SE9qUXl0WmNVMnpOcng1d1lxVW1TOXJXWEFoOUkvSlpRUVhLajBrdmRnRFRl?=
 =?utf-8?B?bTZiTGpNSVR6dDhDcVJrNVVDWGI5bEJzS29HUmFvbmUxNVVBZnRvT2hBcnhF?=
 =?utf-8?B?M1RLRGxCdENPSTVDQ0ZYTE1FWS8xbVZKZS91RHF0NFFTMEVVVWdMVnB1ZHVy?=
 =?utf-8?B?a0hsZG9hanNKc2M3blNrTjBkVkRmVTJ5Q0ZrWUxZcFUzVDIxQXprcVpGV0JX?=
 =?utf-8?B?SG1pb2FRUnNuWXBqS21sbkJWRmNYQVppQU40TDQ4SmpuTUEwUE55NGxIVGxw?=
 =?utf-8?B?NlhOVFF5WVRZaFIrR0dCY1JhQVZtSE1GcG8xOGg5Q2xtWGpQV1JxcHBVSjFK?=
 =?utf-8?B?dlc1WVpUaGQ2R1dSUHFIRVZZV2FlVGhqVHFDbUF6NUdoZWlyT1ZjTHkwUWF2?=
 =?utf-8?B?bThFaWZQdStsV0NjVmVrNFNoZWZnazhiaWIwcVNRVWtyam9wV2JXbVhmaUJT?=
 =?utf-8?B?cWdzUm10UnVNdjRJKzRQZjlxZFRHVjJnVDZZZ09acWpJaTgrYXEwUncxSzZv?=
 =?utf-8?B?U2l4YkE3TXpxL1hOUGZKUG01WTlVR2ZhU0loVHZXZXQ5WVBWeWovMUJSTjlM?=
 =?utf-8?B?Vi9DL2JTQjlmNk1EV3FhRXMwcy9CVEM0T0lqR1VMNTE2TEFyQ1JKTlR5bklk?=
 =?utf-8?B?MjEycE1OR2xFQWg0c1Y2cnJpV0dMSUdQWDFEOFRlZEJIVi9vc2phSC9rVmRs?=
 =?utf-8?B?anZrNmNmZmtlS2ZDWi92U2FhMmtOSUFYUVpnU0RZV1AzbnlqcnFsNTZ6NlBE?=
 =?utf-8?B?NDNwaDAwcnFEaW4zdjZST2RFKzVDOVZzVWswZWlRYmtoWWRhRS8yZWJXeEw3?=
 =?utf-8?B?V2thaUpGSmtCdkQxMnR0ZkdmZGl5cnFEWVI5NldtYmRJRktxYzJYOFFDb3Rm?=
 =?utf-8?B?RWJoZU5VUjUra3N5a0lZSGhMTjB4MEdWQ0J0MnA1Q3p5TTFHemV3WXNNTjB4?=
 =?utf-8?B?NTBLeDFlWit4cHBRYjlVSzJ4bFhVR01vM0Z6VkJwZFZmVWNTUmplcVNGTWxs?=
 =?utf-8?B?SUw0UDc2cTZ0RjdQMFUrZGhDMHZWYXljSkJ2dkdUdTYxNWNjS2dsbWdldm1I?=
 =?utf-8?Q?gpCNzM/E0DYa3sPkP4paux8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76de7116-d101-4c4b-69a4-08daa76eca10
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:45:50.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 686KyH69KKEf7/v0XKqPxQXBQLLXHRxRCKcIMg6o0qggjRohksF9L/WIbOrWtyqn6dKRw73+/4Tcvn5fUj/8hqSgGthgNZlGHAgSEC3t5Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5796
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/09/2022 16:56, Greg Kroah-Hartman wrote:
> On Thu, Sep 29, 2022 at 04:43:18PM +0700, Quan Nguyen wrote:
>> Adds documentation for the Ampere(R)'s Altra(R) SMpro misc driver.
>>
>> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v9:
>>    + Update SPDX licence                          [Greg]
>>
>> Changes in v8:
>>    + Update to reflect single value per sysfs     [Quan]
>>
>> Changes in v7:
>>    + None
>>
>> Changes in v6:
>>    + First introduced in v6 [Quan]
>>
>>   Documentation/misc-devices/index.rst      |  1 +
>>   Documentation/misc-devices/smpro-misc.rst | 82 +++++++++++++++++++++++
>>   2 files changed, 83 insertions(+)
>>   create mode 100644 Documentation/misc-devices/smpro-misc.rst
>>
>> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
>> index b74b3b34a235..b40cd1b402f7 100644
>> --- a/Documentation/misc-devices/index.rst
>> +++ b/Documentation/misc-devices/index.rst
>> @@ -28,6 +28,7 @@ fit into other categories.
>>      oxsemi-tornado
>>      pci-endpoint-test
>>      smpro-errmon
>> +   smpro-misc
>>      spear-pcie-gadget
>>      uacce
>>      xilinx_sdfec
>> diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc-devices/smpro-misc.rst
>> new file mode 100644
>> index 000000000000..d21be4a09e69
>> --- /dev/null
>> +++ b/Documentation/misc-devices/smpro-misc.rst
>> @@ -0,0 +1,82 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Kernel driver Ampere(R) Altra(R) SMpro miscellaneous
>> +====================================================
>> +
>> +Supported chips:
>> +
>> +  * Ampere(R) Altra(R)
>> +
>> +    Prefix: 'smpro'
>> +
>> +    Reference: Altra SoC BMC Interface Specification
>> +
>> +Author: Thu Nguyen <thu@os.amperecomputing.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver support the monitoring and configuration of various miscellaneous
>> +data provided by Ampere(R) Altra(R) SMpro processor.
>> +At this time, these include:
>> +
>> +  * Reading Boot Progress information
>> +  * Configuring SoC Power Limit
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +1) Boot progress
>> +
>> +SMpro misc driver creates the sysfs files ``boot_progress``.
>> +The format of ``boot_progress`` file is as below::
>> +
>> +<boot stage><boot status><boot progress>
>> +
>> +Where:
>> +
>> +* Boot stage::
>> +
>> +    0: SMpro firmware booting.
>> +    1: PMpro firmware booting.
>> +    2: ATF BL1 firmware booting.
>> +    3: DDR initialization.
>> +    4: DDR training report status.
>> +    5: ATF BL2 firmware booting.
>> +    6: ATF BL31 firmware booting.
>> +    7: ATF BL32 firmware booting.
>> +    8: UEFI firmware booting.
>> +    9: OS booting.
>> +
>> +* Boot status::
>> +
>> +    0: Not started.
>> +    1: Started.
>> +    2: Complete without error.
>> +    3: Failure.
>> +
>> +* boot progress: 32 bits boot progress code
>> +
>> +The sysfs ``boot_progress`` only reports the boot state when the host is booting.
>> +If the host is already booted, it returns latest state.
>> +
>> +Example::
>> +
>> +    #cat boot_progress
>> +    0102808454A8
>> +
>> +2) SoC Power Limit
>> +
>> +SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set the SoC Power Limit.
>> +
>> +Reading this sysfs return the current setting of SoC Power Limit (W) in decimal string.
>> +Writing the desired value in decimal string to set the SoC Power Limit in Watt (W).
>> +The range of SoC Power Limit is 90-500(W) and will be ignored if out of range.
>> +
>> +Example::
>> +
>> +    #cat soc_power_limit
>> +    90
>> +    #echo 95 > soc_power_limit
>> +    #cat soc_power_limit
>> +    95
>> -- 
>> 2.35.1
>>
> 
> Why is this file needed at all if you have the correct
> Documentation/ABI/ entries instead?
> 

Will drop this file and add document to both the code and 
Documentation/ABI entries in next version.

-Quan
