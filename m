Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A974D5F61E1
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjk520r2gz3c3W
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:45:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oBLmLVPP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.96; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oBLmLVPP;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk4R09ptz2xfv
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:45:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl/XSeDV351iZctKTAcGF7LW9jBV/HwlNlrGcYsiZsSTA5yG7wl4B1lbl9JSKt2LlN5h/5gfEKceDRB0S5sGvtQuamjGNxyWocPBuudn/YAU6MiScV19vs2IqcxDaBJM9lO84DMxGucqkIi8zDuhtitPwZdDjLobFyIHLrLlr4GTl6UxOX8UXpXPhstGE6G304zZpPe48eTRAQ/MGTvbs62XxQrolEixDUIVpGK8tp08c8MiEvXSioJpiztBXrxwpgUSQ+K2Cvw3o6nEzzlFAHDcAs93cBn3cZFmpngX65wBWPoMP8UGKNXZ6EGhU00Mp772e9EAib9oremGlZfrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oibkCLMOgwPaw8lp8TF9Ojzwx57K8GCE+0eUbF1cAdQ=;
 b=dcxkKJoiaGbyqxwVDiGZsQMg1M76x7TQTSeHfGUF6SHfzXBYnxFwAiGE21bJqLpLX84QPvaH0Jnh9u+qhwdmlTiSOjQAcAiHjjFnwprCgTpDVXLvt4fubsHYickWgYt/Co86x5omECCDXm4c0SFO2HlimnT7gOOoP94d3pkMncoHmVKB8Df4Ok7hQDtBTEVUVlT9QSKNYCFjKtURIHWzHJm8u3rP1xKsQKFNLs47yiE1RlcQmqkc2ZBI0OJVKHde5tun8QzIAlJ8uGBoKBBJHrIM5PI/J3pH9N+SAZDFl32g8CxBd8n4wUI/01KssHErFYWbd76wfk8xBEcwF6RQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oibkCLMOgwPaw8lp8TF9Ojzwx57K8GCE+0eUbF1cAdQ=;
 b=oBLmLVPPBdX/i/BBIeH4G601GED25tcNkzaRjiIx76Lnxs8Lu9DB7VEk0eTSkhQkzWnti6NxQc9DwUoIHDz1f66PzyXhJoWLy17kd64225MEzuB3aCnugVGgmf7Icav3U/bdga8KPaNsXArqyWPG2mHvd0OJszy26+P+u+TmGGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM8PR01MB7190.prod.exchangelabs.com (2603:10b6:8:9::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 6 Oct 2022 07:44:48 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:44:48 +0000
Message-ID: <eb05af67-e731-728b-61e4-f478b600efa8@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:44:37 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-4-quan@os.amperecomputing.com>
 <YzVrBZOatELcfDc5@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzVrBZOatELcfDc5@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|DM8PR01MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f945c73-43ff-4316-2883-08daa76ea4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KV7JPxGGsXOv2n6R9azhhdqshFiDYMXBrVvSv6MUVy+ZZ/fiQvGm93CbUPhL27GRRSzK2c0GnexEoRhwvsePs+LzEAyD6gWczHR7HmV1iNbLxw2VF553MUCi9n63WC+lUP4B6rtLoQX3RvyLjv3SqfaEqmjPNin56Y5rdUnHzjQMU5XEpJ0WYy9M5nZCZ0o+miETXSbJ2oSG5Bge+CDlgS3lOJKd1r3JfzikT9T2mll2Tlos3UGASw9erufxZOCJxJnrNxP5V6TYWXDbBCTU51+HjbAWduQK2BCRIuVxuuQLtcWBc22A9ZsYmYlhMDYpX0zIHA+ecozrhl/BtitpAMA7xhBwvCyII98as4qC7A7mUziSmjSD+gRkCxZRsraULSh49qnRfIiwzDYcOzbLQgEaF56kh8DKLwIcIOMzPtt/QgWubqkC2owinQMmMr56C0zD3cr87SBSTU4PIzytKY29HBUMazcUCX3YC1xM+jveoe/Thnq3LMwWVW+c8Ct+Uli5aeMMXY7UuT5JRH323H3fHqEA0q/TdkKSXz/mlk2+BYcmNuvKOGQ8BuLOl7lIzJpg4xR09GsfCF8ug2BPN+zlJYM3Boc8F2sDRwUmisScS85JU2obVfhrx2IQRtFuHTLGqHIXRpuOYw3PaXSHt5a/CoMJzyMKzF6TqJEOKMCmvZuXyWw49JLw3kaaZcPEj9+tjr6h+VD+xCEMtKqStr+fDMpT+kiw7U9nfrEMBC2env31Wg2QUaL+DvYkQJLOQcEPB+39TafoIVcnrEyJloeqxmDGxxtTSzaoIcVaCzo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(451199015)(52116002)(53546011)(107886003)(478600001)(6512007)(6506007)(6666004)(26005)(83380400001)(186003)(2616005)(2906002)(7416002)(30864003)(8936002)(54906003)(316002)(6916009)(6486002)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(38100700002)(38350700002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Vm0xazFUb3J2a3VtSzhFa1MvbnJBZTN4RDJvellPcDhENEFRUzZxcEsxWDBp?=
 =?utf-8?B?Q2l2dDRGYlFtTWpxalpzU2I4RkdLQlg3TFYrQTA1YzlUN2FPVFlOV0trM2th?=
 =?utf-8?B?RVlueHphd2pyaEdGSDRwdlFTajhWeUE1cXR2eFdrbURUT1BpaWlYN0o3Yml4?=
 =?utf-8?B?WjFHQ0RqR1NyYlA1dzZnVUtERzhaYU9IU0dIYjdnV25kQ1BIejRmZDhROFho?=
 =?utf-8?B?VS9xVVZaenhYMEtHL094Um4xNGdWWkgrUVAxSWMrRlhxQk9ReDlTUnFsMGdO?=
 =?utf-8?B?L0xCbnUwOFY1dm5OTWwvUVhWZHhXclU5eG1pb2w4NmVDcXVwUm5rU2phWkta?=
 =?utf-8?B?NUlSWDRRMDJKVXZyVkVnR0FGU010TERDQzJLUnRMb2haSVRvelFnZjNValg4?=
 =?utf-8?B?dzFTbmdLUGtoUXU1aTZsbXpiQW50dzhxT29EbVBBb0lSa3JnbURrL0tXYmVo?=
 =?utf-8?B?ckg3RVV5T1hnckcxeGVFVU1DU0NEaURTeHd4UUMvSFZDbVlsKzJIQWNTdmMx?=
 =?utf-8?B?WUZFVW9GRUJVL1RqbHBaNjBSSEJNUStEQk81ZE1vM2s3UUpsMlRaWWtsdmZt?=
 =?utf-8?B?bjlhcElxY3BBeWRGMnVNUnk0U3ptcVdEQnRwUjFPMGU5cFpVZjhKYUlha1lF?=
 =?utf-8?B?UjgwYlU0OGsvQW9Hbk85WTk4OTkrTGVTRVdvSlZBTmxjeXgxbTdkM1ZtY2Jp?=
 =?utf-8?B?UDRpRmVtQ3Evcmtidkc1b0NvdFUwVWhsZkxBbHBtTEdJQWVlYVBMWURuQkhX?=
 =?utf-8?B?N2EwdHlWb014OEFPODdKWlZSd1pIZkdXRXMvOW14UkdGcWIvdlVoSkprRGlz?=
 =?utf-8?B?b3NDZHlnQVd1U0N6T0F6R0hZYThHMTE4cmFHOTN0K0ZiOUZoMmVLWUxBN3dG?=
 =?utf-8?B?aWNiaCtJRkFxYy8xUW5HT1RKcmpMUHVreE5YUVp3RC8wSlRRbE1mTjNoYnNz?=
 =?utf-8?B?UVhmT3ZnVUZhRCtZZ1h3ZzJjWXNWckNkNzhtOVRIeXphWHVGK0M4NlJnNjhM?=
 =?utf-8?B?M1krSGRuR3dIdXg2RzVPTjRhNDlweDdybU90K1dJUGtVVWI1Z0JkU3Zmb3RW?=
 =?utf-8?B?bXMwQlRhQ1hmTUFQdTQwQ0E2Z2dKdXN6LzVLRXc0S1F3SnNwUGZ5QS9vdTRY?=
 =?utf-8?B?SFlOeTROczUyOWNkVkUxMkl2RVYvUW9jeTBsN215RGU2Wmd1YWZDL1ArY1Bo?=
 =?utf-8?B?RWsxTDdlaUNpNVMzM0RpRUttZ2xQazA0K0pNYzFxazlHN1FodFhVYVZlSXpt?=
 =?utf-8?B?S1dCU1pCelB0aEg2VW8vUFJRRWhwaUR3YWJrR3h0QWRRSkdUbWJUMUlCT281?=
 =?utf-8?B?OTE1MlBiVnhFTm1GQW9VTUxuVUkxUDJjVnRVUXVUNEQrT2lMRG1SM0VpeFFF?=
 =?utf-8?B?S1llZEpFcUg4RVVUbjd2YjZnbWRFbEl5Z3ZqeGJjMnc0MHA4TWd4YklOOGlr?=
 =?utf-8?B?ZGtOWWpOczBFOXRzRm8rVWNPcm5LQkdCaTQ3eDBmMHlMRVlCN0JZV1BtWEk2?=
 =?utf-8?B?Z0pCbDZPY28va2E3S2FtMjVHU01SeXhtQUFUSjk2VHEzcTNLM2dLdlFLUmdL?=
 =?utf-8?B?aVhPb3BjdzVWMWxJYVFkWThGdlB3UzNqZWlXUHBpaFFyRStxKzBlWmJLSUdi?=
 =?utf-8?B?YWl4alVpQzErSnFzVDk4VG1aVlpUM1RSV2ZwcXpJd3NNU3FyRzRlVmROK1V0?=
 =?utf-8?B?b0lrV2I1NDFzNUMrYkFpak1BSEV4eDBidmdIVTRPZ1lEcGdyejZKZmFqZ2tJ?=
 =?utf-8?B?d0NzWVdDUWovd3d2Ri9LMFF1YlZjd3R4WTFINjh3Y1VZd0dRY2xiTzZkQjN6?=
 =?utf-8?B?cXR1anZMUUYycFE0Y1VTQS82SG5WSmdITThYbDZaV2Jpbm55d1ViS2trcHJw?=
 =?utf-8?B?NkdRbzFwZjJPRE50WDNIK3RIaVBlS0NFV1hEVGtlSE1yanRvQ3ZXTWc0ZTVB?=
 =?utf-8?B?WFhjMVRNUnQrOWxQU29NNjE0Q1YwdHFYUEJFd3l0U2poL3ZBbUVVT2lkUE5W?=
 =?utf-8?B?T0dJcmllcTZQY24zaFhFNFVVMXkrSFdHbEthbDhYbEkvbHI4RW1ULzZPK2VT?=
 =?utf-8?B?WG8xUHdlUDVpQ1M3TVRHTzJhOU9BcmZYL25jc2MvTGtiemNZRldnWXJrVCtw?=
 =?utf-8?B?THh3K0RNT3NBZEJRdXRwVW5JV2I2VkphVzBxMGNia1VQNzkwVXFIMEdPZHVi?=
 =?utf-8?Q?z7YwedtKNTPWr9hCpUDPn4o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f945c73-43ff-4316-2883-08daa76ea4b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:44:48.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5H+j+ASV8vvH+r3Kqf8ro8HvobjrI4A3ustvpW9OH1cmZdYjR7VMkHsd8cSEy06FAwEy+25OfPU57l0dqxDoyjSs+mXwppY6v412qW7qVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7190
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



On 29/09/2022 16:53, Greg Kroah-Hartman wrote:
> On Thu, Sep 29, 2022 at 04:43:15PM +0700, Quan Nguyen wrote:
>> This commit adds Ampere's SMpro error monitor driver for monitoring
>> and reporting RAS-related errors as reported by SMpro co-processor
>> found on Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v9:
>>    + Fix ugly static struct define                               [Greg]
>>    + Remove unused defines and update documentation              [Quan]
>>    + Add minor refactor code                                     [Quan]
>>    + Fix messy goto                                              [Greg]
>>    + Update SPDX licence                                         [Greg]
>>    + Use ATTRIBUTE_GROUPS()                                      [Greg]
>>    + Use dev_groups instead of sysfs_create_group() to avoid
>>    racing issue with user space                                  [Greg]
>>    + Refactor code to fix unnecessary initialization issue       [Quan]
>>    + Refactor code to avoid clever encoding issue                [Quan]
>>    + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
>>    + Add minor code refactor                                     [Quan]
>>
>> Changes in v8:
>>    + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
>>    + Avoid uninitialized variable use               [kernel test robot]
>>    + Switch to use sysfs_emit()                                  [Greg]
>>    + Make sysfs to return single value                           [Greg]
>>    + Change errors_* sysfs to error_*                            [Quan]
>>    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>>    overflow status of each type of HW errors                     [Quan]
>>    + Add some minor refactor                                     [Quan]
>>
>> Changes in v7:
>>    + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
>>    + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
>>    + Validate number of errors before read                       [Quan]
>>    + Fix wrong return type of *_show() function     [kernel test robot]
>>    + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
>>    + Use pointer instead of stack memory                         [Quan]
>>
>> Changes in v6:
>>    + First introduced in v6 [Quan]
>>
>>   drivers/misc/Kconfig        |  12 +
>>   drivers/misc/Makefile       |   1 +
>>   drivers/misc/smpro-errmon.c | 529 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 542 insertions(+)
>>   create mode 100644 drivers/misc/smpro-errmon.c
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 358ad56f6524..b9ceee949dab 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -176,6 +176,18 @@ config SGI_XP
>>   	  this feature will allow for direct communication between SSIs
>>   	  based on a network adapter and DMA messaging.
>>   
>> +config SMPRO_ERRMON
>> +	tristate "Ampere Computing SMPro error monitor driver"
>> +	depends on MFD_SMPRO || COMPILE_TEST
>> +	help
>> +	  Say Y here to get support for the SMpro error monitor function
>> +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
>> +	  loading, the driver creates sysfs files which can be use to gather
>> +	  multiple HW error data reported via read and write system calls.
>> +
>> +	  To compile this driver as a module, say M here. The driver will be
>> +	  called smpro-errmon.
>> +
>>   config CS5535_MFGPT
>>   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>>   	depends on MFD_CS5535
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index ac9b3e757ba1..bbe24d4511a3 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
>>   obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
>>   obj-$(CONFIG_SGI_XP)		+= sgi-xp/
>>   obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
>> +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
>>   obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
>>   obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
>>   obj-$(CONFIG_HP_ILO)		+= hpilo.o
>> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
>> new file mode 100644
>> index 000000000000..d1431d419aa4
>> --- /dev/null
>> +++ b/drivers/misc/smpro-errmon.c
>> @@ -0,0 +1,529 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Ampere Computing SoC's SMpro Error Monitoring Driver
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +/* GPI RAS Error Registers */
>> +#define GPI_RAS_ERR		0x7E
>> +
>> +/* Core and L2C Error Registers */
>> +#define CORE_CE_ERR_CNT		0x80
>> +#define CORE_CE_ERR_LEN		0x81
>> +#define CORE_CE_ERR_DATA	0x82
>> +#define CORE_UE_ERR_CNT		0x83
>> +#define CORE_UE_ERR_LEN		0x84
>> +#define CORE_UE_ERR_DATA	0x85
>> +
>> +/* Memory Error Registers */
>> +#define MEM_CE_ERR_CNT		0x90
>> +#define MEM_CE_ERR_LEN		0x91
>> +#define MEM_CE_ERR_DATA		0x92
>> +#define MEM_UE_ERR_CNT		0x93
>> +#define MEM_UE_ERR_LEN		0x94
>> +#define MEM_UE_ERR_DATA		0x95
>> +
>> +/* RAS Error/Warning Registers */
>> +#define ERR_SMPRO_TYPE		0xA0
>> +#define ERR_PMPRO_TYPE		0xA1
>> +#define ERR_SMPRO_INFO_LO	0xA2
>> +#define ERR_SMPRO_INFO_HI	0xA3
>> +#define ERR_SMPRO_DATA_LO	0xA4
>> +#define ERR_SMPRO_DATA_HI	0xA5
>> +#define WARN_SMPRO_INFO_LO	0xAA
>> +#define WARN_SMPRO_INFO_HI	0xAB
>> +#define ERR_PMPRO_INFO_LO	0xA6
>> +#define ERR_PMPRO_INFO_HI	0xA7
>> +#define ERR_PMPRO_DATA_LO	0xA8
>> +#define ERR_PMPRO_DATA_HI	0xA9
>> +#define WARN_PMPRO_INFO_LO	0xAC
>> +#define WARN_PMPRO_INFO_HI	0xAD
>> +
>> +/* PCIE Error Registers */
>> +#define PCIE_CE_ERR_CNT		0xC0
>> +#define PCIE_CE_ERR_LEN		0xC1
>> +#define PCIE_CE_ERR_DATA	0xC2
>> +#define PCIE_UE_ERR_CNT		0xC3
>> +#define PCIE_UE_ERR_LEN		0xC4
>> +#define PCIE_UE_ERR_DATA	0xC5
>> +
>> +/* Other Error Registers */
>> +#define OTHER_CE_ERR_CNT	0xD0
>> +#define OTHER_CE_ERR_LEN	0xD1
>> +#define OTHER_CE_ERR_DATA	0xD2
>> +#define OTHER_UE_ERR_CNT	0xD8
>> +#define OTHER_UE_ERR_LEN	0xD9
>> +#define OTHER_UE_ERR_DATA	0xDA
>> +
>> +/* Event Data Registers */
>> +#define VRD_WARN_FAULT_EVENT_DATA	0x78
>> +#define VRD_HOT_EVENT_DATA		0x79
>> +#define DIMM_HOT_EVENT_DATA		0x7A
>> +
>> +#define MAX_READ_BLOCK_LENGTH	48
>> +
>> +#define RAS_SMPRO_ERR		0
>> +#define RAS_PMPRO_ERR		1
>> +
>> +enum RAS_48BYTES_ERR_TYPES {
>> +	CORE_CE_ERR,
>> +	CORE_UE_ERR,
>> +	MEM_CE_ERR,
>> +	MEM_UE_ERR,
>> +	PCIE_CE_ERR,
>> +	PCIE_UE_ERR,
>> +	OTHER_CE_ERR,
>> +	OTHER_UE_ERR,
>> +	NUM_48BYTES_ERR_TYPE,
>> +};
>> +
>> +struct smpro_error_hdr {
>> +	u8 count;	/* Number of the RAS errors */
>> +	u8 len;		/* Number of data bytes */
>> +	u8 data;	/* Start of 48-byte data */
>> +	u8 max_cnt;	/* Max num of errors */
>> +};
>> +
>> +/*
>> + * Included Address of registers to get Count, Length of data and Data
>> + * of the 48 bytes error data
>> + */
>> +static struct smpro_error_hdr smpro_error_table[] = {
>> +	[CORE_CE_ERR] = {
>> +		.count = CORE_CE_ERR_CNT,
>> +		.len = CORE_CE_ERR_LEN,
>> +		.data = CORE_CE_ERR_DATA,
>> +		.max_cnt = 32
>> +	},
>> +	[CORE_UE_ERR] = {
>> +		.count = CORE_UE_ERR_CNT,
>> +		.len = CORE_UE_ERR_LEN,
>> +		.data = CORE_UE_ERR_DATA,
>> +		.max_cnt = 32
>> +	},
>> +	[MEM_CE_ERR] = {
>> +		.count = MEM_CE_ERR_CNT,
>> +		.len = MEM_CE_ERR_LEN,
>> +		.data = MEM_CE_ERR_DATA,
>> +		.max_cnt = 16
>> +	},
>> +	[MEM_UE_ERR] = {
>> +		.count = MEM_UE_ERR_CNT,
>> +		.len = MEM_UE_ERR_LEN,
>> +		.data = MEM_UE_ERR_DATA,
>> +		.max_cnt = 16
>> +	},
>> +	[PCIE_CE_ERR] = {
>> +		.count = PCIE_CE_ERR_CNT,
>> +		.len = PCIE_CE_ERR_LEN,
>> +		.data = PCIE_CE_ERR_DATA,
>> +		.max_cnt = 96
>> +	},
>> +	[PCIE_UE_ERR] = {
>> +		.count = PCIE_UE_ERR_CNT,
>> +		.len = PCIE_UE_ERR_LEN,
>> +		.data = PCIE_UE_ERR_DATA,
>> +		.max_cnt = 96
>> +	},
>> +	[OTHER_CE_ERR] = {
>> +		.count = OTHER_CE_ERR_CNT,
>> +		.len = OTHER_CE_ERR_LEN,
>> +		.data = OTHER_CE_ERR_DATA,
>> +		.max_cnt = 8
>> +	},
>> +	[OTHER_UE_ERR] = {
>> +		.count = OTHER_UE_ERR_CNT,
>> +		.len = OTHER_UE_ERR_LEN,
>> +		.data = OTHER_UE_ERR_DATA,
>> +		.max_cnt = 8
>> +	},
>> +};
>> +
>> +/*
>> + * List of SCP registers which are used to get
>> + * one type of RAS Internal errors.
>> + */
>> +struct smpro_int_error_hdr {
>> +	u8 type;
>> +	u8 info_l;
>> +	u8 info_h;
>> +	u8 data_l;
>> +	u8 data_h;
>> +	u8 warn_l;
>> +	u8 warn_h;
>> +};
>> +
>> +static struct smpro_int_error_hdr list_smpro_int_error_hdr[] = {
>> +	[RAS_SMPRO_ERR] = {
>> +		.type = ERR_SMPRO_TYPE,
>> +		.info_l = ERR_SMPRO_INFO_LO,
>> +		.info_h = ERR_SMPRO_INFO_HI,
>> +		.data_l = ERR_SMPRO_DATA_LO,
>> +		.data_h = ERR_SMPRO_DATA_HI,
>> +		.warn_l = WARN_SMPRO_INFO_LO,
>> +		.warn_h = WARN_SMPRO_INFO_HI,
>> +	},
>> +	[RAS_PMPRO_ERR] = {
>> +		.type = ERR_PMPRO_TYPE,
>> +		.info_l = ERR_PMPRO_INFO_LO,
>> +		.info_h = ERR_PMPRO_INFO_HI,
>> +		.data_l = ERR_PMPRO_DATA_LO,
>> +		.data_h = ERR_PMPRO_DATA_HI,
>> +		.warn_l = WARN_PMPRO_INFO_LO,
>> +		.warn_h = WARN_PMPRO_INFO_HI,
>> +	},
>> +};
>> +
>> +struct smpro_errmon {
>> +	struct regmap *regmap;
>> +};
>> +
>> +enum EVENT_TYPES {
>> +	VRD_WARN_FAULT_EVENT,
>> +	VRD_HOT_EVENT,
>> +	DIMM_HOT_EVENT,
>> +	NUM_EVENTS_TYPE,
>> +};
>> +
>> +/* Included Address of event source and data registers */
>> +static u8 smpro_event_table[NUM_EVENTS_TYPE] = {
>> +	VRD_WARN_FAULT_EVENT_DATA,
>> +	VRD_HOT_EVENT_DATA,
>> +	DIMM_HOT_EVENT_DATA,
>> +};
>> +
>> +static ssize_t smpro_event_data_read(struct device *dev,
>> +				     struct device_attribute *da, char *buf,
>> +				     int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	s32 event_data;
>> +	int ret;
>> +
>> +	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
>> +	if (ret)
>> +		return ret;
>> +	/* Clear event after read */
>> +	if (event_data != 0)
>> +		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
>> +
>> +	return sysfs_emit(buf, "%04x\n", event_data);
>> +}
>> +
>> +static ssize_t smpro_overflow_data_read(struct device *dev, struct device_attribute *da,
>> +					char *buf, int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	struct smpro_error_hdr *err_info;
>> +	s32 err_count;
>> +	int ret;
>> +
>> +	err_info = &smpro_error_table[channel];
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Bit 8 indicates the overflow status */
>> +	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
>> +}
> 
> Where is the Documentation/ABI/ entry for this field?
> 
It is documented under the entry for the 
"/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|other]_[ce|ue]" 
in the [9/9] patch.

> Please put that in the same commit so that it is easier to validate that
> you really did document everything properly.
> 

I'll follow this suggestion in next version.

Thank your for the reviews,
- Quan
