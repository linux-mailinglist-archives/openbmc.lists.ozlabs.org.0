Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D45F66E9
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 14:54:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjrwn3GKzz3c9W
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 23:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sodL2otR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.121; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sodL2otR;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2121.outbound.protection.outlook.com [40.107.100.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjrw91PNcz2xJS
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 23:53:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcSaO2m/dPE958uEeYPRQlvcH8LcJsuhAQRkI/Iv0epfJ07AUWh2JjFsECd2hBNXpXN46Zx6KLunOH76qcZWv15Yj0flBqOTEi+GEW9lmRa7eStC8pSG+/CtVZILFrLiO13CMUvx1oQWejETe5ktwZ8SivRK90+PJJd96tWc62pcuJ4kglF4mziggv7wwGYiDBXf2ALliTv1LYr9OAm3mstSu27kNNuWb2fuTznp72rC69sBUGM7uc9+R5PPmECdqHDB+DWHKlz9dc+BhB++5rhaAhL/B+NjZpqFN3tInuLG16Axe5qh98IIyxpsG5Hv4xMgjxZOAWLaOoMod2tJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dJAeQutHgyfBkZ4s816ZjOQe76ABGR8ihjQGwfeNAA=;
 b=btMhyY/eT0LT8Sookd9ZdMHbFFKNXzPgvJdUS0qxayWmiNjH+MEjCNlk/QbxXPaBCrDjfWd+tssypvLiL/EXVNCORFttHIbExwMj4hKzbTlkenJ4byFaNC5dGg15UCUlCekbPv74uHkNif1mAaDtOeARKy5gru9OAoNMpnIUCvygrJNfzeJ4y0QP/AjsF0wmD60QMm4EmkGy5K+3QLmRKUKMsoWHiY2obnal1P+QHSW1F/iUdbCfDgJ4C4d0980I5TLxbcB5NztNHFM2MoA3/asRpzKVMAfSnW6XPa3VnFyv1g4Bgudgz7pAsxpcDq74VnjFhKD52B5p7sk1N3iECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dJAeQutHgyfBkZ4s816ZjOQe76ABGR8ihjQGwfeNAA=;
 b=sodL2otRJ0ABpr+uduZuh2idpfA0sci2bv8qsRIRFhEx84SqBMaXjRksjFzLTxwrQlskQnLFrIZAf3/yXxLNm+tx1Dg/HS7xG+B4CulzgE6U25VbRh6EkV50TnRY+zSJIPgkewpaxGZhLBSQmrBHGfzu+8YKKboGaqEOuJ6NUj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3394.prod.exchangelabs.com (2603:10b6:207:1a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.30; Thu, 6 Oct 2022 12:53:04 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 12:53:04 +0000
Message-ID: <74784657-01f0-5655-894a-a7689b1a4700@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 19:52:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Linux kernel updates and v6.0
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
 <27257597-8068-ab59-ec5d-99deb66065e2@os.amperecomputing.com>
 <CACPK8XeOV71erRYS9YkkKJqjUnAPTucC4t1Ltfke6+jkVTrmvA@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XeOV71erRYS9YkkKJqjUnAPTucC4t1Ltfke6+jkVTrmvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BL0PR0102MB3394:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ba221d-1434-4ce7-13c1-08daa799b53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	n+hFza+xcj9MTHvooiC7UWgKcRJfEjJC9jZGjd8jbghEJp7g+8Ou9YRHRIvnP6o6112zLkl5FkrstDkJCFHIuiCcU6hItuw1FKXDSqhb4HCV6buomtr56+T6LyooNTYF+MN/wcvVn1v3ht9lc7cXCwtMLiIdxg1YBsaMYmOlc2rSqAKwgvmtsxCcPpw6bznho9o7T7826KlDifsaMbcHAEkqnY2JsUPmxBa/iO8+fcIj5reVlrLk9D5ek+cqvkflH4wl36t0Br460cvCsYuXtDoiH58pz8ypmHfmjvRRsMn8Wmnke2B7TQ56EppvdzHomHHEdcWu/JeQ3F4KMn9pq6kG81RixV51AIXMMStuLwqL5NTTS2ntkjfbSp8bbHkTlBq6QTTWOI66yynj/R7kuQZ5qKdUIosKxIBFogUkUSRTJpNI1UKu+2FXRRsRo+Wz4UbUNPecMCkF0+TSLmEjVEhZR7mHGOj0E9bk9m+pKoQRcHLC4mhtcWryiQbo2A48eyJL+EaRqo+2VDncR0usRS/GfwjPfq0esDUpxhNj5d5NLEGQdhUHnNgXbuO4+7BRMmttJ7enJxiRwypufjYmRwkQLz4pmMcrRHN3oGBN+2lgCQTmrflUW4sxT7nh0uj2/dLo4W6lOyRZgIwWP/8+LgqfW+YjuIo4/VUpi5g8GFOw5bt88n/q0rJfj41l4TSuvDBSfynWb9b74R3X2+NQZ2QxkPh3GxyUJF9uF4eL7cx6R3EIQ5DtmSDaR7mR60nUlHc6ht8Wbhngb/8pCfpWwTtsBPyCSsJE36WqKAu+VUq31b0aZbSxw5+dj087NXnv
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(451199015)(31686004)(478600001)(316002)(6486002)(966005)(6916009)(41300700001)(66556008)(66476007)(4326008)(66946007)(186003)(31696002)(26005)(38100700002)(38350700002)(53546011)(86362001)(6506007)(52116002)(15650500001)(8676002)(2616005)(6512007)(2906002)(6666004)(5660300002)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?d3l1aWd1aWN5V0dmc09hVFpCZWpXMkN5UTVlQkZRTGlFakdzQ2R4VjVkN2dm?=
 =?utf-8?B?SUJBcDViaWdyWGJTcTZJM2NlVmVQU3BuN3pScDNnWGU3dFFUM3pYVjRTblBi?=
 =?utf-8?B?ZytiL3g2K1pDbGxoZHBRVzJGS3N4TTNadytlb0txOVFJRGtwdjJWUmZtMDZ0?=
 =?utf-8?B?M1VlNWxhN3Jpa3hIcjdWVkRERmIvdTQ4ZzU0T3k0bE45aExRcEFlczlaUWZD?=
 =?utf-8?B?MW0weDZYbnh0LzBNcS80OXRlc0lFK29IM3JlOG5MWWFIWW9HWExEWHlTc3dt?=
 =?utf-8?B?aDRsSUU0UmdwbmpXN1hSUXgvM29XcGJkSUJLSTdZSm1XU1NicWN1R01TSkhY?=
 =?utf-8?B?RmtWeW55WnV3bnNSTFlGaGY1OVNHdC9UMjBheHA4SG1xTmFtWHVqaG5LcHd0?=
 =?utf-8?B?TVY5eis0dHF0RjMzNE9FQ21JMHF1SFAyM2JNNTQyMlBkMWpuUURWazVTVk43?=
 =?utf-8?B?TTh4Y3Arb0VrODUyYnRBT0hhNkZsY1B1aXdwWUNSM1dya1RLK3RRWFFJOGZi?=
 =?utf-8?B?dlcxSUl2WC8vanV2MXF3M0gwc2RKei9zYnlSTk1aVHR5VVU0OW1CdEJzclZt?=
 =?utf-8?B?UHRzTkhaMU1OZjduOGNkK2hPbXBSSUlaU2IwamRET05jZC8zeW1GdmZMbUNW?=
 =?utf-8?B?VVJXZzhvSCtuL2ttSFdFSllnNUE0RTNmQWdGT0RUYWtJYUo2MXhISHZWNkQw?=
 =?utf-8?B?b05DQndsY2cwYUJVYTVMeVZGS20yNjlkbkVVTUxxV0VDanpPOEVOMWxZUjQ4?=
 =?utf-8?B?TWEyNjd4dUlyR0IzR3I2S3JMaENpSENCYWpVR2VLSW9GRUZ5RnQwL1g3K3hL?=
 =?utf-8?B?dUlCYk9sdHc2Z2ZENS9Rd00yS3MxRjNLMGxvZTI3MENHVjM3UDI2RDdNeWRE?=
 =?utf-8?B?WCs4QlF2YWNpUUVORmg3eTBHU29wSGNRc1kxVFAvSWk5SUk1M0hybGlGOURi?=
 =?utf-8?B?a2dKVGZ5SGcwZHdsU0tUMmVqbG8zSjN5aEFvNlpWak8xdXh4MGJNVU9jUmdS?=
 =?utf-8?B?YmlWY0N2ZUhDdmhRc0tGM0xFSE9UK3FZZVZXVThOZWJWUngvQXZPdWsrZ0dm?=
 =?utf-8?B?QXA0TTJFMUxzS3c0MDRYcjQwaVlpZkFKQVJMV1hCREIvMy9QMkdncVZvT1VO?=
 =?utf-8?B?WlNINHlxeUVpa2ZybjhOUk1lNmtjK1Z2a3VYNFMyVEp2VnA1Qk9YVGZ1aVR0?=
 =?utf-8?B?NmUvZ0p3c2wrdVZKOEw5TlJuZ2JuQ0pZeFF0ZDdVekNrcWl5Zm5QbFo4bnBp?=
 =?utf-8?B?cjRyd3lGcWtjaytOZGExd3RERU5seVhDcVIzdkxRb1NsSllZR205WUpvU3ZZ?=
 =?utf-8?B?UzFlQzJyU3cyV2pzOFU3eGJlZk1HTFRlWmNMQkNhYjkwRXQrcmlndzhEa2Ro?=
 =?utf-8?B?NGhUZm16Sk1ER3V4RzRPbDAxZkVuRTlSVTMvRU5SdXRjUytjQ2dpelcwMEh2?=
 =?utf-8?B?VlRsbHd3NFR6RnpHZm4vcGpnSE8vVGRyY1FXdFlvUVdmdXYrU0FhY0UxM3Qr?=
 =?utf-8?B?T2p1c2hDY21LbUdTYUF2TnhvRDZWaFhmV1JHanc0dGNHc2RsN1IxcWltOENu?=
 =?utf-8?B?SHMxZzRGMVVuS1lVaEZac0dOUEhuVDBpU2psaUIwa0tDeURyNnZBQnhvZEhi?=
 =?utf-8?B?UnVRb2ptYXk3TU5vUkx4a3dmTWJ2SkFEZTRReVk3TFRuMzc0MWtramJzSEVt?=
 =?utf-8?B?b0ZlRjA1MjhLUThyZGtXVGdCMWc1aGZ5R3RsUGNrYWJKM0VpdkY0QTBiMGdO?=
 =?utf-8?B?Z0dmUFVKM2JGbTZybW90T2NhSmdRZXdKS3JoMThOdHVkWEo0MUtlakZSY3dj?=
 =?utf-8?B?VHpTUmJseEVQZ1A5cG00SDExV2JXVVEvTXZjemowMjdJMXlzbUMreURtcHhD?=
 =?utf-8?B?YUtMWTEzMDZCWCs4Wkd3dmRVTk1YSjJraTNtdTNpc0tTb0JTWmhROTI3b2kx?=
 =?utf-8?B?Rjg4UjVvWVg0ejBneEtxR1BJNllibXE2NGRSd2xSUFV3UFlKaFJBdXVGcDlI?=
 =?utf-8?B?aUdyZGtxRXprUFFydFVLbUZQUXBDZjIxbHFiQUhGTUtuV1o4M3ZZem5xQVNp?=
 =?utf-8?B?bXVyTGp4YytCenVzb01aaitZdm9GZXkwaTI4djJ1L2E4ZjIvbDVPWnFaa2VQ?=
 =?utf-8?B?d3JqRTdyWmFBVXFNVU40RWFvKzE2UTk4SmpZS1lpV1M5dURVWE5WaENBMnBZ?=
 =?utf-8?Q?NZMeLbpAEmPuYWYcU3M4PUM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ba221d-1434-4ce7-13c1-08daa799b53f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 12:53:04.1782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZlW5pCV7+G+xsM+mbjRMg/JmZI/GZ0nYOfYtNpqSLvcQfxupY+0zXNF7N9n/1peYtCSbwbWaYxFjpPEv4RQRCjBJCS/nbUbkw40nYolK18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3394
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Joel,
- Quan

On 06/10/2022 15:37, Joel Stanley wrote:
> On Thu, 6 Oct 2022 at 07:04, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>>
>>>
>>>> Please address any future patches to the dev-6.0 tree.
>>>
>>> If you have pending patches then please let me know that you want them
>>> merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
>>> the list.
>>>
>>
>> Hi Joel,
>>
>> Could you help to pick this patchset to the dev-6.0 branch ?
>>
>> https://lore.kernel.org/lkml/20221004093106.1653317-4-quan@os.amperecomputing.com/
> 
> I merged this but it caused a build error:
> 
> drivers/char/ipmi/ssif_bmc.c:864:27: error: initialization of ‘int
> (*)(struct i2c_client *)’ from incompatible pointer type ‘void
> (*)(struct i2c_client *)’ [-Werror=incompatible-pointer-types]
>    864 |         .remove         = ssif_bmc_remove,
>        |                           ^~~~~~~~~~~~~~~
> 
> I think in 6.1 the i2c drivers will return void in their remove
> callbacks, but before then they still need to return an int. I have
> updated your change with this patch:
> 
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -835,12 +835,14 @@ static int ssif_bmc_probe(struct i2c_client
> *client, const struct i2c_device_id
>          return ret;
>   }
> 
> -static void ssif_bmc_remove(struct i2c_client *client)
> +static int ssif_bmc_remove(struct i2c_client *client)
>   {
>          struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> 
>          i2c_slave_unregister(client);
>          misc_deregister(&ssif_bmc->miscdev);
> +
> +       return 0;
>   }
> 
> Cheers,
> 
> Joel
