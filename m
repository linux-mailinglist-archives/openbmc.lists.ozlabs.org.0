Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5C403A7F
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 15:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4N7p3PPfz2xWT
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 23:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=SXngzoHf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.138;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=SXngzoHf; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2138.outbound.protection.outlook.com [40.107.102.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4N6f45qZz2yK2
 for <openbmc@lists.ozlabs.org>; Wed,  8 Sep 2021 23:20:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+/PAvFD83dazYjtZhgx9S4qwTdZL+ioAE/12sPsBMFY2ts5crXQSEOl+FuXQEKe9J/57Wsc6mfYa4DX2MKFlECMyqOidAE7CC/cQN08oKFNcrQhgbrBjdx5zlMOYU1JYgYfkaNLwkKyP9Ly7LKi7DbaK07iTOYjM/Jbo9G/eiiZAQJdqbjEzP0CK3pSVCdvMutvNs9FulWj6gyo/q98+gmKgUKMgv9erXb2QOPXz/XCs+9RvzxnwMn+BB6iAwvdaEwNXIGeNhAlPLuEQYbL+Eb8p3Ps1LoAyF15/cpeXnXF451tf/SSE1fvb3+8pjLEhmLlWfzFBXZniAg/LixGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4KWdpRYmdtEpmLBpuLpd4qIt+lFiKc4gk9PWDxYMIyE=;
 b=hL4uASUZc1pO4mHOg5N/vuDIi3j7T5neSaO0KHd+YqnL1p2cdspJnk4dofG5kEIIcT+9i3xLw7/61/BILqqvZxv3DbXiK4r18gJ6ziU5XQywyIKWcQOwqXGO/pHvC6xYow1VhGVPjKU/PpHzOZHTKs/A5OcTo7Kg57EcR9sUC90gl01xaza4VEaGyVAWFQKu/ZWilaD+8Z9tNXIf8ceVnTF6DoQ324YdEkaBi9DOsW6TtNhZNfnc4JbMUl6PR7cVSu34d5H1KYR5ABN1yVNk7Q/28Z4gxaeGllqMxvLLktsxToWszSftKhc41/i0p+ftAYKABpdc3O52LpZ6+MvReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KWdpRYmdtEpmLBpuLpd4qIt+lFiKc4gk9PWDxYMIyE=;
 b=SXngzoHfidI/brvQSu9cec4atkac9848A0FKn3wOsZqOJXfAJNI4L+0ZT6DQsnZWYj6m/CCGt+PacMLGm7sqcEcjmFXCJC9v0JK4wUBDqhiGeaSEyEOMXWfbBpk6JvZRMPekNUh7rvQsEGNSEyvqWoCmOF4KPbHh7vgiuyGj4Kw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB3689.prod.exchangelabs.com (2603:10b6:5:84::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Wed, 8 Sep 2021 13:20:06 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b%3]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 13:20:06 +0000
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 geissonator@gmail.com
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
Message-ID: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
Date: Wed, 8 Sep 2021 20:19:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR06CA0154.apcprd06.prod.outlook.com
 (2603:1096:1:1f::32) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPv6:2402:800:6344:78c8:b4e1:7eb1:7fee:6a7d]
 (2402:800:6344:78c8:b4e1:7eb1:7fee:6a7d) by
 SG2PR06CA0154.apcprd06.prod.outlook.com (2603:1096:1:1f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 13:20:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66b7ea1c-7b32-4d7c-1569-08d972cb5fae
X-MS-TrafficTypeDiagnostic: DM6PR01MB3689:
X-Microsoft-Antispam-PRVS: <DM6PR01MB36890D32D09091342ACE47C390D49@DM6PR01MB3689.prod.exchangelabs.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64Y5AwPbbnnuYY6R67ofrA+2CD/wOJC1zC1A1Ic8+EYh7+qSIW+L++37UPdkdH3hCvLkSfnw/4V9igiI8gyNTaZcTZfSfSwZ3sDWDP9qA7I6W4Lk+qNi5eTJV+SQ7XlXcR8ukf3I7xe7V1sr4AYOe+Iv0/p2e1z8ezo2drkHdngCTnBqbJTDly+A1tRYKPySigsWNVR9ia4xeWEFmzsNg7d0oHWm8qzPBeLZGLNaRe5fZAcAlMqct1FlldDSQ4Dsah7Vgw/YLcF5T4uwb/j3affZEwWTHQrRfDJWVo2kOLTSb2ZR63E3mImbU8UUWx+6M18I5dTcaecos9OaaURS3P76+sDJqO1NgqixWhlK8gVEc9i9yUW4FZv8Oz9cvf6DsljnrYoSMxpweoKGszKz8mXfCI6+bIdG1PlfoiNEOeWlqpDpFjxiWuIFfrwZpWSQcpPDEMraonC8HdhqmqEyNZ+5kZkcdl0EJYA+MAA7+1Nl60CaO35t0v4je+gbshFRsAfvmjxhBLmmueSo5eSRnyGhRAx2o4xpoyELR55qcMi9nl8mi6HmtLUtdeU7068M0XnzVJfF0wixcRhHfdpFabja0mmit0lqHG8B2dt6VmoWCQ7YIpH7Nt96CuALp95Clnd83kbFKVkxlMSYCltmzq04Zhut7raW24nJ8Bs8+7fsx+CMTMim5WjztYLixSFny1I+laPiDBEXIF+W+sW3guWrUrnC/DX7SLDHbzWvU3wjqk/RjVuOeDilSniyUZ6LNw+E4piN2OTDi2OHU8SmfG5/lVbaTcqm5RxQfhRXg3rXZ0wsp6bw+3Wzcc/vfqpj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(42882007)(6486002)(508600001)(966005)(83380400001)(4744005)(31696002)(66556008)(316002)(52116002)(8936002)(83170400001)(8676002)(2906002)(186003)(5660300002)(31686004)(6666004)(66946007)(66476007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZFVks5elZpWDRVdFVIREkvd1NEc3JHblJnYTZlQWM5c2Iwb3ZBV2tYM2Fy?=
 =?utf-8?B?ZUFWckZnOVAyT3RCcEFMdVVtdCtZOGVZQURKSUZ4ZHdJNkh5aEQ5czJ5Q1k2?=
 =?utf-8?B?czBLSkJJR1kxMkhzRmtsc0lhL0c3Mkplbm1zSmRVM2lsWEU3ZjdERmU2eDJm?=
 =?utf-8?B?MjdKN25UMkdiMzJBUVEyN3Izbk1WYjhIakZRTWVoUXVCanNyeURrci95NjQr?=
 =?utf-8?B?bEw2Y2hVNExjT2VrZzZDRndDcEZDd0F0WVpNNEpaSkg3MEZYMUhWYmR6V2VV?=
 =?utf-8?B?bnlST01nejJ2ZUY2MmxpWTlKQ05uWTFlUVdacVFRZGRhTnJFaUhoZFBuSlZ6?=
 =?utf-8?B?S2p1UEtPQlN5b1BMNDhXTXBhVXdsc3hlUE8vRkwzMHpST3VsczFRcE9MVU16?=
 =?utf-8?B?Q0M1RW9IWUZRallqKzUyZENsNlI5WlUvR29lY1ZaUld6TitjanY2MlJqbjJv?=
 =?utf-8?B?OWdMNjdnSENPa2dzM0dzbWFYQzh0Zm0rRWJYWVFBNTJOSTZDbTF4RDB0K0di?=
 =?utf-8?B?VnNWR1RXWGsxTi9RZVpWL2RmZ1Vkd0VyM1NxNGpNK1lVVUQzTlp6M2c4Ri9y?=
 =?utf-8?B?cjNpTFJnQWlYTEhlUElzL3JsbERuU2J6Q0M3ZTlQcStXL1lMK1pnbmhDSHhC?=
 =?utf-8?B?VENIMTN0eDRDVGFic0w5UUNXZy8yN1VlYVdCZGUwS1hmc0tLazh2Q3Z6WTVQ?=
 =?utf-8?B?aHduZlpXay9XZUMydDZaR1BjUkNIVkpEbVo3Zm52NzRoV2ZMWmJvNWlCRXA5?=
 =?utf-8?B?UzdrclZtUWVzQXNEeXBBV0M0QWFvekIvemM5a09senJYNTBSQ0ZLTmw3eUtr?=
 =?utf-8?B?MU1LQ09vbXlBSVFQcjFnTHRkOVJXQ3dSR0d1OFJHTUlwYmdGdmFnTkhjNHFQ?=
 =?utf-8?B?cS9hY0Jqa0FZdkhXVFVCSFgzNmk3THN6d1M2akZFTGFGMlA3ZHBOTFlHbHlY?=
 =?utf-8?B?cDA3MGd6TDRxSW50dUhmL1hHUVBudUNIY1RKNzdhTktIZGI5ZStFSlNsemhW?=
 =?utf-8?B?YW5IWS83MWV6WEJxY3Vkd0ZtenVXbVF5djhkOGltY3UxTVpTUiswaFpEM3pt?=
 =?utf-8?B?MFRRa0RHU05SZGJyVTlWRGFJcjMyTFpPUUNOOE0xM1MveDFWZTJzN2JzaVNn?=
 =?utf-8?B?dTdIZDk2WGp0MHF2eW9CVHJLWkdJbW5KUXpuRE83TkR6RnoySGI4ditYZUtw?=
 =?utf-8?B?Wm94V1NQWXRic1ZYRFZMeTl4MWdlUXlqQnVFTU9RL2VMODFOM2c3OWdheW1R?=
 =?utf-8?B?d2hiWGxqWmxFZUxnd2NsajB3ajRzdmRqcWUyMHpVNk9Qc0ZOVjdJWnZxQlB6?=
 =?utf-8?B?U3FVOGp6YkVTTGxSL0dvZ2VGdzQweGROU0ticHhITitOM0tQVHZMZFg5U2hE?=
 =?utf-8?B?Z2djTEppaERSM0xiSGNTVEV4b1Rna2ZXKzF5RU1ZRGdCczdBVGZwZHg2R0Q1?=
 =?utf-8?B?S0Riemp5TXBUZFQyYUlBeWNONnNVNXJJd2pLeHVMYVFhUnF1aVh6YTRMdHJQ?=
 =?utf-8?B?UzQvQ1p1WVFTY3RkSGpQZ1U3bFJJcXpQTlF0S2xJRXNPVFNwYWdncEZ1Q3dM?=
 =?utf-8?B?Y2k1MWhDeE9YSzNqK0djYjdEUWQrd21rMzRTWmhkNWFkMGRDbDBDSlo1RHVr?=
 =?utf-8?B?SXFlaTFUeUZYQ2ErcjdTVHNxZmxUanZWMzlFSXlYWEsybTYxZUNWb0pBZ1Jj?=
 =?utf-8?B?VUtZbUI3a2lZVmluMWFib3I1SkROWGJHMnkyNEJibnBrL1FZaXZyZWhoa01L?=
 =?utf-8?B?aytQNnlqcGRueGZTUjVpeG9zWjB0cDdOQlQrN0dkWkNHbWtRSFovTGZMKzlZ?=
 =?utf-8?B?UytQQkFwbEIxNm81Vmk1L0xhYlQ0TDBNSlRsaGVyQ2IyVWxacTBpR2k5Y0NN?=
 =?utf-8?Q?+UUwWrROTmZZ2?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b7ea1c-7b32-4d7c-1569-08d972cb5fae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:20:05.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXmbu6lpmZmS6jdBhU6hgepY9MqkU9AEGO9mR0gsV7iM8C/kYjV3H1cHvJ0gSt7At8BMOsDKPgpeZZBSCp2Bon7FX/pezgnW9ErLyJleaN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3689
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Geissonator,


After commit 
https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0

when BMC boots up, phosphor-host-state directly checks  the host state 
thru interface xyz.openbmc_project.Condition.HostFirmware.

It does not check the existing of /run/openbmc/host@%d-on as before.


I plan to implement "oem mechanism" to handle the interface 
xyz.openbmc_project.Condition.HostFirmware.

Which will use the GPIO interface to update the host state. I researched 
the code handle this interface in phosphor-host-ipmi and pldm.

I wonder which repo should I upstream the code? Currently, we don't have 
any OEM repo in github to upstream the code.

Do you have any idea to handle interface in bash scripts?


Regards.

Thu Nguyen.







