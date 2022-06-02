Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E153B62D
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 11:37:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDLX91hX6z3bnd
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 19:37:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TnhVXVk2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::728; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TnhVXVk2;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20728.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDLWf12g9z3bkW
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 19:37:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5vHIl2nxDF9jb4vu5bC73kYAFaD9bgdhWwTT2+Js/LllqAXyRJjhIdMJ9tmhWLlcTjNMFPLcKqRV1MlKSVbZUpoU5otyd3RclGr+mk9iKkNzB11bB7OJssptfIQabXFJZ1e9rDn4r1hOcSz9LiNwYUd6CcmVb1Sn+3OfZaZLLlDIoCNSoNrYJE+t7KfwxHWSWztfoX67QWkdeu/8R0o6yhG1wguSmiUa9q24POQv83uKEfieDqMdfLD0AoBsAnEwGIrEImpoW1ATeYXCdwxlzAdvWwbUj3bWfpTOc2geQ5zgfWDJGtDFeOQ3GHhVjY+z2vD3NAru4GpAGioZK7OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsuwW5Mi7MWILTc27RLGlxmLVIZ8c/i2SDcmhEPD/5A=;
 b=kTh0M4qmjGjfhXsS3WjqZz9c9ionO8gzHops1MwIf6b/LjnO9KTfTwR8JguJXvJ8qqFMnuAelUb/zw/Hp/YK8QHHCoY7feAmrmDpCLc4luFEXOmmPCoGWCxo5TYCXqeIRvMTFYVF1FMBbRFMQjYqec5c7Lt3WzzEfidgooy4TdjEKaY4q/hzx+6TuU2Kzf0cAVdN/0v0kZiY65BVxiD0O8sVy3BN/KeTo2I6hYxY2A2K/LG15NG7X0uuf6oCl0XCJobgYK8V2ZlZ1SiaHZr8Z+SKfO3h/69pZNN1qkgfSPK26FgxL72tEr/XUxcMwCv38Ixet3WMaQxJuA3Nu0KWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsuwW5Mi7MWILTc27RLGlxmLVIZ8c/i2SDcmhEPD/5A=;
 b=TnhVXVk2p3Nue67KsKoY8JiDYlGgJL3CUCcrmL8zr+8yBE3eWg6w25wezl86jPuQoPthABSSiLOxa065OplkdXwGLNAOlovmVg52mG/KAQWgZotBnPhrDECEUXM5dtB/l+9dUTvQq76bRQxPGQPf1MQrZXQf79FkDPS9V1HCcMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW4PR01MB6500.prod.exchangelabs.com (2603:10b6:303:72::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Thu, 2 Jun 2022 09:36:36 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::e877:bfc6:92a5:d237]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::e877:bfc6:92a5:d237%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:36:36 +0000
Message-ID: <524c6acf-06a8-6e63-c9be-0bbf730fa693@os.amperecomputing.com>
Date: Thu, 2 Jun 2022 16:36:22 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
 <4f5d7746-3747-4a4d-525a-4fb69e706cd0@os.amperecomputing.com>
 <YpcyaTqqsfDJx7HG@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YpcyaTqqsfDJx7HG@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cffb52e-8892-47ba-9bef-08da447b631d
X-MS-TrafficTypeDiagnostic: MW4PR01MB6500:EE_
X-Microsoft-Antispam-PRVS: 	<MW4PR01MB650055C3194D598CA0CE2B4DF2DE9@MW4PR01MB6500.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jr02FCAZ8MSzCD66WU6TeqYAVKYW6nvZlvJN/on567UvC5XIvThbF+AdgUChP2vP5GRVDktUpCXIz0cRzK1vAD5aeH92DqXCP5N9ZikiD/fuy1wSalccmcdowfE7g5ITrWCoB0diWTJTclLKCJ/ffojQI3QYkgZcgq+oZ+s7fK+v04hpDdA5/gODnlx6kFsqgIzffzZATinFxAQI1SLaLoWK3OoZ1vcdtYJDnj0vgdCzFcodCqVZiFY3GZuCB3VEmz8fyHy5Uhp9AP1xx2IPa6YXjoTC9A+QAOpBl5vJJRkS3gnrfGIyxznTR3K6TZu4ZUo72cZBDLT0pRFGPaykOkZZWLbkQv8vXd+dsSKPpwpfgPHl/iUY0cENaPJ8/eHMKnd1KekMDWpFtMgPKUGZm+KjoHzN9g3UbxWLV5Ov81nWJKYaQivrTkpcJ8IPkTWjwp5w2Eo+KHm1+qmtk3va8uPo7TjQuVl/aQ631YY3EDDdBvFn2LdkS7+kKX2L5Fpj7mYBmT15+R8eQHEpyWpqOrwmzxdOoDrQR5MnzJUdJSqtFwOO4qGWlo80G7FHYJuOpppt3TJSRejlu8bhkqmf7TkH4cevpL7eHkdShdRrxyNzJN7fTLkZ+aNa0rOm3GPyr4GiRw4F+Nzu887sT/DMzxP8Nh53I0el7Q09PhE1D5GICzHRDdyIG4/UwuhsgW+NBqzys3/cryA90kIaPQmNUFHlefqLEMlMxLWuoQqn2d0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(54906003)(38350700002)(66556008)(6916009)(38100700002)(53546011)(52116002)(31686004)(4326008)(26005)(8676002)(6506007)(6666004)(6512007)(316002)(31696002)(86362001)(66476007)(8936002)(186003)(107886003)(2616005)(7416002)(508600001)(5660300002)(2906002)(6486002)(83380400001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YnM1UXdFR1lNODRyeG9uQi9CamhwZ29SVzdtdkJSUjMvTHgrOTNqYjdWM2Mv?=
 =?utf-8?B?bitXdVlyOGtaTDdoQWNlN2E3Nm1wRHJCWVB1ZnBXMGVRZ29TaWt4SXIvcGNC?=
 =?utf-8?B?T29BNU9ldnlKMWRuYittakt0Slk2WmxWaHYva0o2QWp1R21vdmh2NGNrK01T?=
 =?utf-8?B?TFEvdWVEUnRFa1ZueVZYWWF4UEI0MjIrL3d2N1lWNkNSbTBpcXh5NHlQNFVK?=
 =?utf-8?B?cmFXZDEyaEM1SGNTdEc1SFRLWjNpSVIxc1VES1BXNjZOWWd4Nmp0WlNjckd0?=
 =?utf-8?B?aHV0Ky9jVldxb0RXeUxpaUl0eWdVWHZzYW44cnVRUUVDWTRZVGFCWmZ2T1B6?=
 =?utf-8?B?NzltdWVTOGJWS3ZGZFpiWm9EUjVVckxzTjFMRmlwbitkWWJmNFRIUlcwY3J4?=
 =?utf-8?B?QW51ZUIyczlwSGdlbDlBOG4vQ3dIMHQxV0NPcmZhbDhyY3FMT1E3aEExVnhU?=
 =?utf-8?B?MWc1WjlRRXJKMEVoZlJnc2p5ZkwzTmtzN1NxWGVRK0NrbVNPV2R3bncwZFEy?=
 =?utf-8?B?ekFkd1lJWG5XR0RnZ3I4QkRuYk9NSzJTMU5MbVN5MlQyWEpudmhuWlMzZ0Q0?=
 =?utf-8?B?U25lZnF0VFZlWWgzMkRPMzF5Tm1CSUE1R2JQY0xuZzdackZEaTk1ZmxnVDJ3?=
 =?utf-8?B?YU9tVWNQY0t1OEZLdEN2NnBoZkR3ZFJDL1dHTlgwUVViVmxRMWRmckdnemxz?=
 =?utf-8?B?d3pEUkRpb2licG1qRWlOUnNrMG0wcklUQUZpNVFERmRCUUdHRnpEM0NsSjBn?=
 =?utf-8?B?NS9oc1hkVUZTRXJ4OE1KUk5YWTFPRTFJbnkva1VIUHo1WitYRU5aYzBKZDN3?=
 =?utf-8?B?MDJFcDlWdmdTdHNsNXZvQVp5b3lyVHNrSEpwU1FoMFVGWEJWazk4U2ZnZ2VP?=
 =?utf-8?B?blk2N05FeHBXaVF1NktGdldSZUpyVnFGUmNUODFhQ0I4VW9zSGxkeTBSUDBr?=
 =?utf-8?B?QUNpWCtlZXEzbXRtN0lRNG15MjhaWXNEdmFTZWo4b2g1WkVDZVZtc1dOdnBX?=
 =?utf-8?B?bW1XQXJLU2tQWTAxUE9PN0hBMXZuQnpkZjNNM1NFcytjM2JIdVd1VUJpeEZK?=
 =?utf-8?B?K2JhZmxlUlVWWlVUYlMxTENHem9hSEZGOXFOV0oyendLMUllRi9Ma0ZwUU1J?=
 =?utf-8?B?d3RPeVVrYU1zeHJuaVA0VUhZdHBiZDVSSERWbnlpK3luWi9BckRIMi8xVHVY?=
 =?utf-8?B?TFFFMTZGZUI2aEMvTkxJU3R0dlB0dWVUZkRYQnIyU3FSZXljSVZrajdmRGVP?=
 =?utf-8?B?NHAxekVrSmR6SlVLOG1iNXRKOCtyVlEvWFU2UlhoZDdzWVBwS0lqTk5yNStj?=
 =?utf-8?B?Q0l1NW5YWTBWZW9qMGY2bkx2N1k3aGVFNU5sdEZ5eTYrVnRmcTlMRGttclJu?=
 =?utf-8?B?ZTg0bVV4bUVjMHRuSG95OEdZN3kvY0RIK1dwRnROMjVYQmVmdTcvRkFNQ2R5?=
 =?utf-8?B?S2N4cSt0cVJBRXI2MVhVeG5ZUWdrTVlSajZia3lkS3lMcS95TC9yNTE3NVRi?=
 =?utf-8?B?blYrTUl6NG9vZHRpVERBK3JBU3B2WUtOZm5hZ3QzRGc3c0RteDlVckhzSHBw?=
 =?utf-8?B?NXFQbi9VS0txeXV6cVpoUXpmTGhUOHIzVDVBYlBXNWlwcjM5UE5YV00vRXV5?=
 =?utf-8?B?WXJUUzNiSE5lUHIvUWdRL3BlVUxuMjRsVDJWL2ZwZFdNckFIT1dCN2J1MFow?=
 =?utf-8?B?OVZyUFJOb2tKNEtwSzBkM1lvRjAweHhDa2QxU3ZReEZMRnRYcVV4NGZYZGxY?=
 =?utf-8?B?NWJSanZ2V3E5WUJXVzhuODAwQlZseW9RTDRCdDQveFYwcTZKT0F6R0JNWUZs?=
 =?utf-8?B?MG5pZW4wTDFEWmVkWEpBSUF4ZjVVcngrc2hoa0VhRkh5OWExczlEYkZCY3RD?=
 =?utf-8?B?M3NzbjZNaXV2L2grNmhtM3lUaHpqU3ozTlRoK2JDNlJkZFMrYmRJUVFYQklr?=
 =?utf-8?B?YnFNeS9vTTBWL2RSN1c5V1JoMStuMlRQL2tJbUtmdHM3cXlia3BGbEZWTDBL?=
 =?utf-8?B?ejZHalNsZ0RsdzBKSGlldDZMRk5VZlRYeGJPL3pMazhLeGcyWjU3QW1zbDBS?=
 =?utf-8?B?K0RqbmJmSFFpZzA1Z1o3bTVqdStyTzBBSU5MMXAyM2NHVVJQaEJDOWpjcS9I?=
 =?utf-8?B?NDNaWlZVTS80a0ZuS2JrdXl4ZGdsQ2N0VGJFd1kxU2tXODVpbXhNRWFCcWhw?=
 =?utf-8?B?SHhZN3N3WXI5dUt0UlRzRVY3TjJsTHBwUS9jbytRYlpack95LzAvUEg0dHdQ?=
 =?utf-8?B?VFNhUXd5NVlrczNvcXRNK1JBcnZHTCtPYnl2MVJRUTFiSE1wbk9nejVaZmFT?=
 =?utf-8?B?d28xSjNma2wraUVzbEwrZDBHVSt1WW52YlRZMWk5bUN3S3JZS1pXdHY0dFR0?=
 =?utf-8?Q?BpvCVbqvKk9Qxjsf0T7BuwxYYqsYmi8bMruSK?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cffb52e-8892-47ba-9bef-08da447b631d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:36:36.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ggbtl/0QJWgI2zemSGClzIiEEdEwx25fkOGixHcH0uUheOc33oVldHC7Cmpi+/5LNQAeY79jfqGvM0M4fxmP6x5pQ/ThGB8mo8uuzfW9Kwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6500
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01/06/2022 16:33, Greg Kroah-Hartman wrote:
> On Wed, Jun 01, 2022 at 03:21:47PM +0700, Quan Nguyen wrote:
>>>> +	if (err_type & BIT(2)) {
>>>> +		/* Error with data type */
>>>> +		ret = regmap_read(errmon->regmap, err_info->err_data_low, &data_lo);
>>>> +		if (ret)
>>>> +			goto done;
>>>> +
>>>> +		ret = regmap_read(errmon->regmap, err_info->err_data_high, &data_hi);
>>>> +		if (ret)
>>>> +			goto done;
>>>> +
>>>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>>>> +				   4, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>>>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>>>> +		/* clear the read errors */
>>>> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(2));
>>>> +
>>>> +	} else if (err_type & BIT(1)) {
>>>> +		/* Error type */
>>>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>>>> +				   2, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>>>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>>>> +		/* clear the read errors */
>>>> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(1));
>>>> +
>>>> +	} else if (err_type & BIT(0)) {
>>>> +		/* Warning type */
>>>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>>>> +				   1, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>>>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>>
>> Hi Greg,
>>
>> Since the internal representation of the internal error is split into high
>> low chunks of the info and data values which need to be communicated
>> atomicly, I'm treating them as "one value" here.
> 
> That is a huge "one value", that's not what this really is, it needs to
> be parsed by userspace, right?
> 
Thanks Greg for the review,

User space needs all of this "one value" to know what exactly is the error.

In our latest version, we remove all the if...else and simplify the code 
as below:
/*
  * The internal representation of the internal error is split into high
  * low chunks of the info and data values. Rather than temporarily
  * dumping these into an array and printing that, skip the intermediate
  * step and print them using a concatenation encoding.
  */
count = sysfs_emit(buf, "%04x%04x%04x%04x\n", info_h, info_l, data_h, 
data_l);

/* clear the read error */
ret = regmap_write(errmon->regmap, err_info->type, err_type);
return ret ? ret : count;

> And why does this have to be atomic?  What happens if the values change
> right after you read them?  What is userspace going to do with them?
> 
Because the error is bigger than single register can hold so it is split 
into small chunks to report via multiple separate registers.

Firmware stores each error in a queue. As the error's chunks are stored 
in separate registers. All of these registers will need to be read out 
before the error is clear so that the next error in the queue can be 
reported. That is why we say those chunks must be read out atomically.

User space will need to parse these information themself.

>> I could dump them in a
>> temporary array and print that, but it seems like additional complexity for
>> the same result. Can we consider this concatenated encoding as "an array of
>> the same type" for the purposes of this driver?"
> 
> That's really not a good idea as sysfs files should never need to be
> "parsed" like this.
> > Again, what are you trying to do here, and why does it have to be
> atomic?
> 
> thanks,
> 
> greg k-h

