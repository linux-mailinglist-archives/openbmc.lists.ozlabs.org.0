Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1F42E798
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 06:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVtGV0xK3z306m
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 15:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=uHSfkQh6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.95;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=uHSfkQh6; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2095.outbound.protection.outlook.com [40.107.220.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVtFz0kXTz2yn4
 for <openbmc@lists.ozlabs.org>; Fri, 15 Oct 2021 15:14:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0xu7pBdSpx0n3gqUNtVEHYMI8M1YBqEnht9zx0VAxk5PJNauJIjaM3Tq7Q4e56+pqsTzSAtcLh8Nn8vTCsA8REyPY7Ce5aceC3Ei17H8STbdqSm497PlNmFNKDK4I9T08mObFykoMdkuQlLsAiAHhXJhvEjrWEzYQiNtSwxmeqJpzBAU/GIR1gGjq15IUKLcQhLfX8AsaOl2LNBTXBv1vo+OlykagqUkr0fDySUHJv56SfmsN2ybPyN8Y36o2WxXPRxKzRzw5oxuxaOe4QGaoZwlOaohP3Rmd9kSDndujbI8U7IaEWg3NMcZ6yvklmfzYVT+NeU/5zNjzaOuIw6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzhkCVc2AYzmPt9iEs8MIz0E3iI51KeU4eOsOR8f0uU=;
 b=BotXbYFTa7ert51+r0Vbt+eV9fvvrPBKNicCUseI9XrAfBX89+0J4uS4dJYj4X+ZIw/hdX1Ooiorl3CYaTqhNvgjAiVuifzJ4L1dEY9KbFeEAKy7z+GOqGHFs2JsiFsYIOq7okATuYYOKSGp8Stz0Z1Lsp+5REwGY9rZOEEGG4GqrfuJ6FQkG7WGpsjPgdeulJU7R+StBCSn/AppeAhJxsRGPmlwxtzB+Rv5FexUrNRwhiauXitF+7NSPN5ULgS5klQVXlwA30qlOPSnq4B8iPVZdx1Y5+Y30mRYD1PgSj//lGWcHGPxKiqUEmYgnFvb04EnEjfiE8sn9v57SO2i0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzhkCVc2AYzmPt9iEs8MIz0E3iI51KeU4eOsOR8f0uU=;
 b=uHSfkQh6T5GxliP32h35BofjEzGHtRSlaxtIdRIMmFxxGnOcRS72+5yj8lWBNWd6SKTcvo+8F/Ew8fN4z0WyDSRBNUUEZCwx3I6J9aHLNhkSmMHanetmH3lu7nVYANovRz45Y5mW1b9an6iHz8Y7jg+WIFu9Ost5DwJ9zr2VyEA=
Authentication-Results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR01MB2569.prod.exchangelabs.com (2603:10b6:3:3a::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Fri, 15 Oct 2021 04:14:25 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0])
 by DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0%4])
 with mapi id 15.20.4608.017; Fri, 15 Oct 2021 04:14:23 +0000
Content-Type: multipart/alternative;
 boundary="------------ei4krnHbINPCXEJmghPWZzQf"
Message-ID: <2c5bc5d0-2e1b-2cf3-0452-b852afb4174c@amperemail.onmicrosoft.com>
Date: Fri, 15 Oct 2021 11:14:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Softoff features in PLDM lib.
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <702956f7-e667-8fd5-ed8c-4ddafbe67ccd@amperemail.onmicrosoft.com>
 <C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
In-Reply-To: <C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com>
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPV6:2402:800:6344:422a:e950:caeb:45fe:be34]
 (2402:800:6344:422a:e950:caeb:45fe:be34) by
 SG2PR01CA0182.apcprd01.prod.exchangelabs.com (2603:1096:4:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 04:14:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2d9e578-81c2-4a1a-f445-08d98f924500
X-MS-TrafficTypeDiagnostic: DM5PR01MB2569:
X-Microsoft-Antispam-PRVS: <DM5PR01MB25697B23D36161A61398056490B99@DM5PR01MB2569.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3riBqzCtBS8o1Vcht5gouiJZb2c1J+C/BJrkTf2Xry1YgovgsOta9hlP82Pv+P59nzVuWp3vGFhm4rIashP8fIsfgnt9i+jEPkFath0lry5YQuOZWafvKSZ8L0wd+4pAhM+Uf3nLFvLhVSnco5CGdFJYvtm44XJSMMUu1QSiSvelIMrRf7W5s5ykwE9MJ/ikXQXbNZEtzh+vL9IFROXyd19Q5TDIcjdf1pFyA/EBhxEzVTh9N28fOOT08fzyoDxvE4EU5l01G5brXKgOdMjhDKL718c7YN4sJkXzXURY17hzfGhAxOpFPjnqMyPshy/RQqDyym2cVppJ44L/Qz6hGJxXUo1kaekifkPlRNUTdK3YAsBRXSc2/i0gxVLh/C36F3vS4rPPmW3EcZhTU8VdIyeNCwPfZ35v5hl6Qx7uJ4QAK4h3ZEnoHBMIeA8FstvlYPgFLrgx5CG62iBXSHtKma5ZVLVWxT5RUUm6o/EJW+aphelAz2x/rVDRtpy4HlfkoAjgg1QS7Nx7e5HJHJbvaJ9/UIuh/fN+YqLbFsE08s8UAzYjHKyKm9cvUSFpBtuRkskQL+cvKjViDcDrPQyuemMtZusq8C0m745yZmxUpyfRRiZvUcaohaF2WvHqJjYmbbLUlepzy9UvxJmrxRQaDw/lF1rXsk2YSPwnKJKwwPA3VilT6I4tPX5i5AXqb0WPBvL7R8lEUOfx2ex8s7VWUdMHkCwJJUuMRfLS1KQbErApb3qnNNVWiCnG4I+8SXq4/NDnqPZNX/mhMH2ejx/NNE5weHp0oavefE22mnDshVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(2906002)(2616005)(8676002)(6666004)(31686004)(31696002)(52116002)(6916009)(316002)(66556008)(38100700002)(33964004)(5660300002)(83380400001)(6486002)(42882007)(508600001)(66946007)(4326008)(186003)(966005)(166002)(8936002)(83170400001)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpDYVBCWjZ4MXhxeUJpc2NrWnhxTS9ROURLM2J2SHR2ZW1oM3VoN1VTclBu?=
 =?utf-8?B?TlV1dmxlYTFScFBkZEE0Syt2bU1RNkRib1ZseTFuUGV2MWRsUFFLQXU5cHhs?=
 =?utf-8?B?RU11WklSdG5MeTBCQmJCYWJPb05nQVRUckZkM1k2M0RuaWhaUTk3M3IxSVQ5?=
 =?utf-8?B?THNndW9ZeHJ5VUFhVHkyQlB3MjdXdFdkbTRLRmgwY3NVQjhSWkpxQXk0djA0?=
 =?utf-8?B?TjJmaVNqb2hFQ1EwMWFkSE1CMi9QTFF6ci9RejR5Q2J5TjRqRUFzeVdkelhp?=
 =?utf-8?B?aU12QjMwemtJY2FUcmt4Q0pzd21aTkV5cjdpR3VhTEFFeG81WDVWQlUrQWts?=
 =?utf-8?B?N1Nxak5ZYnViSExEck9JMzR3bG0zZnA5eHJJczBQNmkreG8zZkdudWVhQUkr?=
 =?utf-8?B?ckg5ME1IS1JRUjBkQ054dndpRlRkdk56dmh0SGROVjdCMld2eFIzUkZxMHZq?=
 =?utf-8?B?aWdnNGJmdmg1VkxSMDExS1BTQlNkVGVSbEFEQkh2K29lWUswVjcvUFMzVWJO?=
 =?utf-8?B?blZwektzRDM4cVB5dEIwRnVsOWJEcHlyamNXcnZXZDFUaVY0bDJqWEJHQ3Rl?=
 =?utf-8?B?QldVMExoYUd0ODBJVExJSTV3eXMwOVhGTlhYTC8xOXpKWXdsQW45ZmlIMnEv?=
 =?utf-8?B?WjFubzBQMlQySlcrL1NIRkh6cXUxMFhsRHhycVJGQ2YvZm1tOU5zZUl4dkww?=
 =?utf-8?B?QVBuTDVCbC9LZUFnNXYzK3BxbUh4eUdUTE91NGVTN0ZuZjFZckxYNFRrSFk1?=
 =?utf-8?B?Q0dWVlNyTVlpSmQxaDJVQ3Y3U3RXVThkTkZIT3dKRFJrNnhIdjRrTEpGWHpw?=
 =?utf-8?B?bFFMNjdiaURTOTZsbWQzOWJkYTdmYmh0bWJaMVJPcHF1a3RPZVQvNlZJeEdp?=
 =?utf-8?B?SEp4ZGVpcWIxVG9NN0xXeW1PSHFONlhYV2ZxWWJ2TGU0N0RwemYrZ1JvcHZn?=
 =?utf-8?B?UXhwejArL0liSURSVFFqRk5VMUJTNkxPYStsRW9qbTF4WFlSajltY0pYY29J?=
 =?utf-8?B?M200UmFPQnhwL2ZmM2NldExMSUF3RnJUd1ZoVHN2WHpYNzFadk40T1pXSlox?=
 =?utf-8?B?ZmFCc0NkSnJHdEdRWjdKSnRwRUlLVlR0Vk5pMHgxSHF0MXJnL0w3UFZkV1Jj?=
 =?utf-8?B?R2EwL2RvZjhBWXl5NVJQektnbmM1NUd5MWx6ZGpEeUJDTXU3bzFhNnc5c3hz?=
 =?utf-8?B?UGlVWFZ0NDJWRmwxYkJ2cHZ3RVNGQUdyWFVmRGh4ZEhLS2duRzlhdDNMd29q?=
 =?utf-8?B?dENvUjE3V255UmwvOS9GOG9wTWZLRVNuMUJteklzVm5ZMmFsaUovQ1ZPTEI2?=
 =?utf-8?B?cEVWQlBXb25YQVQ4MlI0bzdENitHR2czbldxRUI0bXBXWVNzb0tTSHp5dUJW?=
 =?utf-8?B?UEdBb3FEOVFaZzdiVUl0amJwaUdqOUZFUjhRRGdSQmZacWxrWUhOb3QyZlVM?=
 =?utf-8?B?bVBLYmVZRlZ6TzB3dmRoUDU2djRuRzBXb0J2bkFDUEpRQUc2Tk42ZmpXWFhF?=
 =?utf-8?B?M09mNUNZTFdUSGJWU2dSaVNuRUUrYVZ6NzA3dFd6eFg3SXdaN2xFbmppVVVR?=
 =?utf-8?B?cndXd1dIK1JxS2djUVg1dm1YNmVwY24vUGk5ZTRLWUVjdFNBd3BiVWtneUx4?=
 =?utf-8?B?QUpBNU84VzZLTGRFMXhJT0FmM2pIWU5rU2EwK0ZXZnNHTHhjbDdJSE0yM09x?=
 =?utf-8?B?OGdtbWFtSjExaWhySmJ4UG84K1g3dTFkd25VMmVzcnhPSWRkZGtueWRhbmE5?=
 =?utf-8?B?dnM4REIxR2N6RVp2SjdNVmRPdVNWQjEwc29PTXFHbGordjF6cWR5aVNqSTZS?=
 =?utf-8?B?cDZ3L2NXM2w5N0kzUEs2WmdoMDhKTVh5UkZZdzIxV0t4UHBjSGFLS3luS2xB?=
 =?utf-8?Q?qbR2TLyzkWNiX?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d9e578-81c2-4a1a-f445-08d98f924500
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 04:14:23.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYrHB/Saw57kgcOyGekoPHn8SwUJ9hD6/cXLIGGj4fy08mwIhE6ku65Zzz7taRlbxm8/GH368/0cgW0uqpi54/Jw4idjafljIcqfvKiWgII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2569
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, liuxiwei@inspur.com,
 duanzhijia01@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------ei4krnHbINPCXEJmghPWZzQf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/10/2021 01:01, Brad Bishop wrote:
>
>> On Oct 9, 2021, at 7:47 AM, Thu Nguyen<thu@amperemail.onmicrosoft.com>  wrote:
>>
>> Dear Chicago Duan and George Liu,
>>
>>
>> In PLDM source, I saw that Inspur supported graceful shutdown the host OS thru PLDM commands.
>>
>> https://github.com/openbmc/pldm/commit/184f60263a0e4c3dda934d94ecb2a904ef835299#diff-59fd39a9594f6d6f82af25037f211858fafa418aacc055e85b4cc29abccf9dee
>>
>> The feature used PLDM Platform SetEffecterState command to request the host OS shutdown.
>>
>> I wonder which part in the host software will response for this PLDM request?
>>
>> Does the host OS ( Centos, Ubuntu...) directly handle this type of command?
>>
>>
>> Thanks.
>>
>> Thu Nguyen.
> Some POWER architecture servers run a type one hypervisor called PowerVM.  This is the only operating system I’m aware of that has a PLDM implementation.  If anyone watching is aware of any others please correct me.
Thank for your info.
> The BMC code you reference was written specifically with PowerVM in mind.  In theory any software running on the host processor _could_ implement mctp & plum and support this effector but I honestly don’t ever see that happening in say, Windows or a typical Linux distribution (Centos, Ubuntu...).
>
> How did you implement soft-off-via-bmc before OpenBMC?

The softoff in OpenBmc is using host IPMI command thru BT interface to 
request shutdown the host OS.

In Ampere, we are using feature ACPI graceful shutdown, Bmc will trigger 
GPIO SHUTDOWN_REQ,

Linux host OS detects GPIO pins then shutdown the host OS.


Regards.

Thu Nguyen.

>
> I’d be curious to know how this soft-off-via-bmc functionality is typically implemented in x86 or arm based server designs with arbitrary operating systems.
>
> thx - brad
--------------ei4krnHbINPCXEJmghPWZzQf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/10/2021 01:01, Brad Bishop wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Oct 9, 2021, at 7:47 AM, Thu Nguyen <a class="moz-txt-link-rfc2396E" href="mailto:thu@amperemail.onmicrosoft.com">&lt;thu@amperemail.onmicrosoft.com&gt;</a> wrote:

Dear Chicago Duan and George Liu,


In PLDM source, I saw that Inspur supported graceful shutdown the host OS thru PLDM commands.

<a class="moz-txt-link-freetext" href="https://github.com/openbmc/pldm/commit/184f60263a0e4c3dda934d94ecb2a904ef835299#diff-59fd39a9594f6d6f82af25037f211858fafa418aacc055e85b4cc29abccf9dee">https://github.com/openbmc/pldm/commit/184f60263a0e4c3dda934d94ecb2a904ef835299#diff-59fd39a9594f6d6f82af25037f211858fafa418aacc055e85b4cc29abccf9dee</a>

The feature used PLDM Platform SetEffecterState command to request the host OS shutdown.

I wonder which part in the host software will response for this PLDM request?

Does the host OS ( Centos, Ubuntu...) directly handle this type of command?


Thanks.

Thu Nguyen.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Some POWER architecture servers run a type one hypervisor called PowerVM.  This is the only operating system I’m aware of that has a PLDM implementation.  If anyone watching is aware of any others please correct me.
</pre>
    </blockquote>
    Thank for your info.<br>
    <blockquote type="cite" cite="mid:C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com">
      <pre class="moz-quote-pre" wrap="">
The BMC code you reference was written specifically with PowerVM in mind.  In theory any software running on the host processor _could_ implement mctp &amp; plum and support this effector but I honestly don’t ever see that happening in say, Windows or a typical Linux distribution (Centos, Ubuntu...).

How did you implement soft-off-via-bmc before OpenBMC?</pre>
    </blockquote>
    <span><span class="ui-provider tl b c d e f g h i j k l m n o p q r
        s t ayv ayw w x y z ab ac ae af ag ah ai aj ak" dir="ltr"><span><span style="font-family: &quot;Segoe UI&quot;, system-ui,
            &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;,
            sans-serif; font-size: 14px;"><span>
              <p>The softoff in OpenBmc is using host IPMI command thru
                BT interface to request shutdown the host OS.</p>
              <p>In Ampere, we are using feature ACPI graceful shutdown,
                Bmc will trigger GPIO SHUTDOWN_REQ,</p>
              <p>Linux host OS detects GPIO pins then shutdown the host
                OS.</p>
              <p><br>
              </p>
              <p>Regards.</p>
              <p>Thu Nguyen.<br>
              </p>
            </span></span></span></span></span><span><span class="ui-provider tl b c d e f g h i j k l m n o p q r s t ayv
        ayw w x y z ab ac ae af ag ah ai aj ak" dir="ltr"><span><span style="font-family: &quot;Segoe UI&quot;, system-ui,
            &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;,
            sans-serif; font-size: 14px;">
          </span></span></span></span>
    <blockquote type="cite" cite="mid:C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com">
      <pre class="moz-quote-pre" wrap="">

I’d be curious to know how this soft-off-via-bmc functionality is typically implemented in x86 or arm based server designs with arbitrary operating systems.

thx - brad</pre>
    </blockquote>
  </body>
</html>
--------------ei4krnHbINPCXEJmghPWZzQf--
