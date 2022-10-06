Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5015F6126
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 08:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjhjy27qjz3bmK
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 17:44:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=e8pcYqnR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.113; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=e8pcYqnR;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2113.outbound.protection.outlook.com [40.107.93.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjhjG1gTdz2xJ0;
	Thu,  6 Oct 2022 17:43:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjN3gw7bbcQ+9VJuywUzjbMufZ0cL06ZfCFYjvVw7PmVPMq+b88b54bJfoqM5LWgoX48/qicUbo6nflf3Tcsbd8Ub0zMYOO3BaIgZZcI6ABag4xZdx7V1uFrQtTap+7vC7jYUX9Rf51orZ5ccy7JqACHb2zqEtylb++/ADHthX6Tv09N7CtqeUAlTtsASE8P3BJTZHgnXKw4popib+fpaWdK3GwEwzgYKtd69OBHN/RBCg7omdLEI1lrYgd6IHbUAbqbd5JYizFdqia6YLpjeLbW0z7RZsyW4qSAv65H3pCk8QgWUXSZmxDqDmxkmgmWbul5eFDNhhucdNF2bdESPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sZs4kYPXDunoGhOnZf1eHOiVNR1P/nKmANgZRq3/Lg=;
 b=lWF4YlZkiaQ2eBeb7GMVtUlufeK8puHBwS9GVVqyhLRJj+1/dZBSh8/57qJotOmHHPThC58f8m4NTXRvtUQ+5US+tMvA4WYYrfD8Qr020ICkiTEoPyQ1FDcDDKBb+V3dQ4KE/bH/R2PA6DjUoZI6zeLpIZmWtwJhNmkUSGYSMGzLxzj5mXK/FKSowzaKjg/VbcP9p0Sb8RCNHGJUSrrwvUwUnpqvwm6c2Yqq5aJyfzmpbqrr3YT67/zW/aDs8O9soZhTu4WkUT5mJMKtEqLpoT+lmnMfv0J2EpfzMEW9jVWV/5XergePBuSStPkN1Wir92f1yuMaCXoMfL/y2tcfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sZs4kYPXDunoGhOnZf1eHOiVNR1P/nKmANgZRq3/Lg=;
 b=e8pcYqnR6PtenwQ7ZY8s37/n5ur6OnK4Pz8FkjWlmxusY5FB+ooO1f1Fx9SLBSW0aNIkdMJP2gxHffLrHuk1AxSMBs7WU7jkhH95YPAaFs0y/AzWlby3U7GoIOdZ+Ke/mICmdcF1lN8w3W88R8C+QPxB0QvNyBMDAW+bf8UWGbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4492.prod.exchangelabs.com (2603:10b6:5:34::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Thu, 6 Oct 2022 06:43:09 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 06:43:09 +0000
Message-ID: <47c67c2b-fb1e-af56-8e7a-06349ad5604b@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 13:42:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v10 0/3] Add SSIF BMC driver
Content-Language: en-CA
To: minyard@acm.org
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <Yz4Y4piC+e1mftLi@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yz4Y4piC+e1mftLi@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|DM6PR01MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b37938-602d-4dd0-5d8d-08daa766080b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dvzVSQ9gUrCAY7MyI7xpsguT3BbGHpNkfz5lJ5T97pkxEwMl5TQN5N8Y8FW3wUxradGy3xx+vrSpmFsG2mbC0ny14O6T/pVOyba/wRT5FN65o05Tuhg/G0Rx6plE3HZ2kYISb3nL8WoES4gQizJvxv6nOMkPNCF6Ydx69tqXgxJWFZTAbbdDKQe0GVZcNxY3fKryqtB7gQJVu/Tabnq83l5mLJ4a16PpRGTvf3rydewcGlmSDhYtUIaivzBN7QX3elBMCF+KgH7ZJ5C/lu6fhv6FTzHDuDDMrAJiP1s9iYCE1OfwNm/XnqCOzdz50+pSHg8WcKbq4vD1qW97nWMv2Y6aVOnnRWqxGQKukxx+XsjbX0vtEvEyt+t9R0wkeiZq84+/teiNxh7iIV9fDaUm+iAAzVARIsJ+rCiX3LN0z+hWvcrHYHgYobskg00SCpIE5tkP7RDGNZBRvgHYFY2MNUqBRETrcX2ND3tRdtz3zlvU5Ckcz4mi2HyrVXXEz7Z9Cw6ToPrMstpu9M/TsLkwL9l5uH3CJFfYFi8nFsdhgU2W6ck1iDvV+QrLzNuG+3OY8ZK+NOJbDENwV+Wru015rWrQUiQCRmWsAO1dB1kyj+iURq67D/TTFE8r3jFKQsJPsCnlmGeJtXEY0j0r/1k6QFrucM3u3toSCbjfLjxajvSG6Dxhw6vuRGBqDQ9vh0jvVgdi/BWPos8A3LdMxe7pTwCPXTHDHuzrl5AD4nN5DdNxR/JPuCeuh8Oqzr5k9QdKHnT7Q27KH8XxWxP+xOCdmBsklnHd19eKkdNoBVg9S/EovKnxqBP7FkZDBsP348oMadTnUKq32g9sY8uJyHyXVQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(396003)(39850400004)(451199015)(966005)(66946007)(4326008)(54906003)(6916009)(6486002)(478600001)(8676002)(66476007)(66556008)(6666004)(41300700001)(107886003)(7416002)(38350700002)(6512007)(83380400001)(52116002)(6506007)(53546011)(38100700002)(26005)(86362001)(8936002)(5660300002)(316002)(2906002)(186003)(2616005)(31696002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZE8zeDZOUGxQWXpOVEFpZ3ZwRTlzOTJybUdWeTlkc1Z2VUQxSThuREdZcE96?=
 =?utf-8?B?bFoxbnVmRVRKdytpZ0dkL0lPTVdaQldPeW1aK0E4VEVPRVlhRWRXTHVIZGtj?=
 =?utf-8?B?aXg4YW55ZjdNWklBdU1Lekl3YnlQYnd0MDlhbC9FMFRsaXVuTkg1QThVVDgx?=
 =?utf-8?B?MHN6ZS9LU1pMTEM0SnRjdjIzVmYrTlpZTTdDQk9LUjE4bXBqbHd6K3JjbVZR?=
 =?utf-8?B?eHFyTGJYa05zS2NDbXZLbTFQWCtiWkI0QWJXQmpNRlpCejBDUUszcG43eXVz?=
 =?utf-8?B?UEtZNWNwUklKMUMweVh6WHFuclhTNFFTOWJVWWszOEFIczMrZ05GQ2s0Z043?=
 =?utf-8?B?dVNWc29rNDF2ZlFKdlZMaWxmMHJyWTh2V1dSQjVlOHZLN0tWMkdCQk5odmNS?=
 =?utf-8?B?RDFObkVITCtDOUNKTHhWSmpyVUg5aE1FYjFFNEdmS0J2Z1d3L0RnV2tCY0F0?=
 =?utf-8?B?NVc0alFOMUVCQlZsNjl5OUIrTDhzWUpnRWdibDRmcHNseHVzVkxvSWFNL3F3?=
 =?utf-8?B?UmQwTkdJdGVaYzE1Sm03NENmT2pzTjJ3ZnJFbWdWa2VrbGR1Yll1bFM0SnNt?=
 =?utf-8?B?S0U5Z2M5VmpHdWFJTWhVSC8xZnFlZC8vMVc3UGdtOXRxaUNVZklzSVNyWU00?=
 =?utf-8?B?MWpsYmZzYmlTMXd6V3N5WFQ3ZGN2R2FnMXBWMTFCMmlqajdnU2ZRTjNBQU4v?=
 =?utf-8?B?QlRYK0JhNjJTUXMydlgrNGgvYW15aXRFdmYyNXpSRUhoa250T1dKYkxHWERo?=
 =?utf-8?B?cm8wM01URE9pazgrNCtIZ0RoTUtHdEFxQmVXWEgwVkZBL1hUdkF6TTYzUFBw?=
 =?utf-8?B?UkozOXM1YVE2ODlEanVHOXMvUkFhNHB5TmI3OC9RQlM0VzlMMngzMk5nMW9Z?=
 =?utf-8?B?aUh5a2hkYUFoZnBNRjR6Y3Y2dThVbjdEcThNazQvbWthTWlpUkFPUmxaa2pO?=
 =?utf-8?B?Z3dEcm5DVm9qV21RMHhDM1o3VGxQSlZlQWwwRERMV002eWx1cG5BNHZrOXFD?=
 =?utf-8?B?b3dHMlp1cEE5eFFlbVlXanJBZXRwUm1iaGJhb0REZmRsQWVQU3YxTjhyWnpD?=
 =?utf-8?B?VEpEc2hQa2oySXExKzYvVzc4ci9BaDlxcXdnVWVJbjE4RitmWTdwZ3lpbTY2?=
 =?utf-8?B?cG9GM013THVpOUxNQUZLV09HYnpKYzMrS2M1ODN6VXRoRDJ3RVlldFMvSkdk?=
 =?utf-8?B?UERlZSt2KytZNHBsWmdXbzRCYU96YU1MUCsrYXFZbG0zTVRmOVNGNUo2bXFS?=
 =?utf-8?B?MS9NaktjQldUQkVpNzArYnNEVzN1bWlOcjFYM21LeGxYTlhWbks3ZlljSmFv?=
 =?utf-8?B?Snk5YXZnaHU5NkdMQjU4M3J3RjZpeUsxaWtXemZ6Ykh2M0Q4aGp0N25SMUlp?=
 =?utf-8?B?bnJqa1htdFpvUHF1L0J6UHM2c21rYXpqdkdlb1Q2cms2bnpGUk1uWk1MbFlx?=
 =?utf-8?B?Yk5DMldEUDJHRUpOZTdYMS9yQWpWRHZqYVVNYUZHKzRsTkdPcmE4OVNtS2dR?=
 =?utf-8?B?UEQ2SzJxZmFXUTJsTWRKbFlMbEFpZEtHTG1YcjNyZmlPZ2UzbExEaHdDdlZK?=
 =?utf-8?B?OEZUSWJpdEF2YSs4QUY2eFJUc21SVU5lRHdjeTd2cGJEeDBqZnFtakpNUExO?=
 =?utf-8?B?YTk2enlkQmtHL0J4YzZMTmNpakdFK1dLdDVjRW5wUXlOaW1zZXRWNG1Lc2Iv?=
 =?utf-8?B?OUcySE5vWjVQZElGVnZNMEExWlN4NGdyWk1sK3h2RGpPNUhMNDlGMHZUN0ti?=
 =?utf-8?B?VkFENzNYZHNpNGxEMUNuY2MxaWpON3RHaDQ1WDlVV0d0UE9ISXhOQXl1SWVX?=
 =?utf-8?B?S3c5czJMZUN5VklTdUkwUlgxT1NubHJubTZiKzRPU3RqV0RvZEdFdFpsdjJw?=
 =?utf-8?B?OStxb2NSYTFSOXBWa2dMV0JVdzQyeW4xOUdJVXBlNW1HYmNJVW9qV1ZIeDFV?=
 =?utf-8?B?bUVYWnNIeER5ajRHeE9UUHJHOXZkNllvaWZmamZPVHRqaGQ0LzU5Nk9SY0ln?=
 =?utf-8?B?Wk9TV1NYektzUGhQOG5mU1M0TG10NVRWTWt5aW9RWlFoRzREVndRUXFtOE9W?=
 =?utf-8?B?LzdlbVhnMEQwRTJUQjhYNVVkbXAzLzRIOE1Hem90MHJxUUo0UFpxTTd1Uk1k?=
 =?utf-8?B?Z0dMNExCV3dvNXVUUVhtOUdHUkVGeWJrWXZqYmw5VStrQTEzc0taQ0dKUTI0?=
 =?utf-8?Q?sjfl1U7VyOmI36sB9x3kUWA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b37938-602d-4dd0-5d8d-08daa766080b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 06:43:09.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29ZXXxR5Yh0tHh6AqFhQ3A4QkxU8me4ofoZGDcua8Q7Dv3e+v01h7DlKSE2kx5+14KIYkM4PKsJ6wg6k9m9AyTbYu3BsqAmLPmNVAFQGfMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4492
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
Cc: devicetree@vger.kernel.org, thang@os.amperecomputing.com, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Corey,

Thank you so much for helping me with all the comments and guidelines 
you've shared though many versions.

Best regards,
- Quan

On 06/10/2022 06:53, Corey Minyard wrote:
> On Tue, Oct 04, 2022 at 04:31:03PM +0700, Quan Nguyen wrote:
>> This series add support the SSIF BMC driver which is to perform in-band
>> IPMI communication with their host in management (BMC) side.
>>
>> SSIF BMC driver in this series is tested with Aspeed AST2500 and AST2600
> 
> I have applied the two IPMI patches to the IPMI tree for 6.2.  Thanks
> for sticking with this.
> 
> -corey
> 
>>
>> Discussion for v9:
>> https://lore.kernel.org/lkml/20220929080326.752907-1-quan@os.amperecomputing.com/
>>
>> v10:
>>    + Issuing RxCmdLast command for all errnos                   [Wolfram]
>>
>> v9:
>>    + Fix dependence with I2C subsystem                            [Randy]
>>    + Update missing Reviewed-by tag from v7                         [Rob]
>>    + Remove useless error handling path                              [CJ]
>>    + Update comment for SSIF_ABORTING state                          [CJ]
>>    + Fix "unknown type name --u8"                     [kernel test robot]
>>    + Update commit message and add comment to explain
>>      the effect of issuing RxCmdLast when Slave busy               [Quan]
>>
>> v8:
>>    + Dropped ssif_bmc.h file and move its content to ssif_bmc.c   [Corey]
>>    + Add struct ipmi_ssif_msg to include/uapi/linux/ipmi_ssif_bmc.h
>>    header file                                                    [Corey]
>>    + Use unsigned int for len field in struct ipmi_ssif_msg       [Corey]
>>    + Avoid using packed structure                                 [Corey]
>>    + Add comment to clarify the logic flow                        [Corey]
>>    + Fix multipart read end with len=0 issue                      [Corey]
>>    + Refactor code handle the too big request message             [Corey]
>>    + Fix code indentation issue                                   [Corey]
>>    + Clean buffer before receiving request to avoid garbage        [Quan]
>>    + Fix the license to SPDX-License-Identifier: GPL-2.0-only      [Quan]
>>
>> v7:
>>    + Remove unnecessary del_timer() in response_timeout()         [Corey]
>>    + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>>    + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
>>    + Solve possible issue if both response timer and ssif_bmc_write()
>>    occurred at the same time                                      [Corey]
>>    + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
>>    + Refactor and introduce ssif_part_buffer struct to replace the
>>    response_buf to manage each send/receive part of ssif           [Quan]
>>    + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
>>    + Support abort feature to skip the current bad request/response and
>>    wait until next new request                                    [Corey]
>>    + Refactor the PEC calculation to avoid the re-calculate the PEC on
>>    each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
>>    + Fix the use of error-proned idx                              [Corey]
>>    + Defer the test for valid SMBus command until the read/write part
>>    is determined                                                   [Quan]
>>    + Change/split unsupported_smbus_cmd() to
>>    supported_[write|read]_cmd()                                   [Corey]
>>    + Abort the request if somehow its size exceeded 255 bytes      [Quan]
>>
>> v6:
>>    + Drop the use of slave_enable()                             [Wolfram]
>>    + Make i2c-aspeed to issue RxCmdLast command on all
>>    I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>>    + Make i2c slave to return -EBUSY when it's busy                [Quan]
>>    + Drop the aborting feature as return Completion Code 0xFF may stop
>>    host to retry and make ipmi_ssif.so fails to load               [Quan]
>>    + Add timer to recover slave from busy state when no response   [Quan]
>>    + Clean request/response buffer appropriately                   [Quan]
>>    + Add some minor change on error and warning messages           [Quan]
>>
>> v5:
>>    + Correct the patches order to fix the bisect issue found by
>>    kernel build robot
>>
>> v4:
>>    + Fix recursive spinlock                                      [Graeme]
>>    + Send response with Completion code 0xFF when aborting         [Quan]
>>    + Fix warning with dt_binding_check                              [Rob]
>>    + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>>    + Added bounding check on SMBus writes and the whole request     [Dan]
>>    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>>      corruption if somehow buffer is written past the end           [Dan]
>>    + Return -EINVAL if userspace buffer too small, don't
>>      silence truncate                                       [Corey, Joel]
>>    + Not necessary to check NONBLOCK in lock                      [Corey]
>>    + Enforce one user at a time                                    [Joel]
>>    + Reject write with invalid response length from userspace     [Corey]
>>    + Add state machines for better ssif bmc state handling         [Quan]
>>    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>>      SSIF BMC driver                                               [Quan]
>>    + Change compatible string "aspeed,ast2500-ssif-bmc" to
>>      "ampere,ssif-bmc"                                             [Quan]
>>    + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>>    + Added slave_enable() to struct i2c_algorithm to control
>>      slave mode and to address the recursive spinlock      [Graeme, Ryan]
>>    + Abort current request with invalid SMBus write or
>>      invalid command                                               [Quan]
>>    + Abort all request if there is pending response                [Quan]
>>    + Changed validate_pec() to validate_request()                  [Quan]
>>    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>>    + Print internal state string for ease investigating issue      [Quan]
>>    + Move to READY state on SLAVE_STOP event                       [Quan]
>>    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>>    + Introduce functions for each slave event                      [Quan]
>>
>> v3:
>>    + Switched binding doc to use DT schema format                   [Rob]
>>    + Splited into generic ssif_bmc and aspeed-specific      [Corey, Joel]
>>    + Removed redundant license info                                [Joel]
>>    + Switched to use traditional if-else                           [Joel]
>>    + Removed unused ssif_bmc_ioctl()                               [Joel]
>>    + Made handle_request()/complete_response() to return void      [Joel]
>>    + Refactored send_ssif_bmc_response() and
>>    receive_ssif_bmc_request()                                     [Corey]
>>    + Remove mutex                                                 [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>>    + Removed the unnecessary memset                               [Corey]
>>    + Switch to use dev_err()                                      [Corey]
>>    + Combine mask/unmask two interrupts together                  [Corey]
>>    + Fixed unhandled Tx done with NAK                              [Quan]
>>    + Late ack'ed Tx done w/wo Ack irq                              [Quan]
>>    + Use aspeed-specific exported aspeed_set_slave_busy() when
>>    slave busy to fix the deadlock                 [Graeme, Philipp, Quan]
>>    + Clean buffer for last multipart read                          [Quan]
>>    + Handle unknown incoming command                               [Quan]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>> Quan Nguyen (3):
>>    ipmi: ssif_bmc: Add SSIF BMC driver
>>    bindings: ipmi: Add binding for SSIF BMC driver
>>    i2c: aspeed: Assert NAK when slave is busy
>>
>>   .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>>   drivers/char/ipmi/Kconfig                     |  10 +
>>   drivers/char/ipmi/Makefile                    |   1 +
>>   drivers/char/ipmi/ssif_bmc.c                  | 873 ++++++++++++++++++
>>   drivers/i2c/busses/i2c-aspeed.c               |   9 +-
>>   include/uapi/linux/ipmi_ssif_bmc.h            |  18 +
>>   6 files changed, 948 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 include/uapi/linux/ipmi_ssif_bmc.h
>>
>> -- 
>> 2.35.1
>>
