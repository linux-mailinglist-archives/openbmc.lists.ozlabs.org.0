Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5C38B192
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBhp15h2z303H
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:20:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=d4XpncTv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.90;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=d4XpncTv; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2090.outbound.protection.outlook.com [40.107.236.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBhJ43cFz2xg6;
 Fri, 21 May 2021 00:19:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR5KA2UDNQLb4wT4YtHo59xVeCPKhNmO4rvBVqkAk/eYneIjX5X2YXiKxO6WQdL3Ief4xH9gvFv+7B0p0FE+te9CDkZ4NuflEcKkLhG1rS2XxmOcNhzaTonrvZmt4Cp5Muy8d0HPNbw4Tz6vpMtBKaCNwRXKnpqQihS0hoUr+nZqD4kkVBCFyPHGBdKrMWrnqZ6XHEcZXFDuJoFdCXPhBMf1l27C0ediZFKUmBR39HKYU3ez92rA5pxNtcwrVYXrjrjkaetdOaz7vTDKJnIGeE6iX/EgCWBMRBxDCd2Cqz1jjV5E3wZxjQ0PsSCGzx/UZ5lcdDvjTVRF+CMXcjsTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5lT+8hHgy/DEMV2grcjJjazQQttetFwIjJal9lghVw=;
 b=T2l/YOgOqypLf9hTE2/G91F30KVZrphf106/JARJT5/NdMFIDouZhaRVFgRAh6r+Z4XW4lUhmpZzXIxwFMEZFqlt5y0fRTA/t9NK55eTGEmbi3fKdAHLl9ziOCDSkrZxP2erm/hNzfwtI7bVQgkoAH8FvnmblRp0dyT32TanZSujGqGe1SYl+JTqfl7FJpP8ctobV69iaAs0nDMM2++Lnm7O855Q41UQCAd3AIOPA2qu546clt4DoA//b89goUQ0q2WDKabRGe5U1RCgYv9X8JU3dRsl46tEilKSV3xwh+UpQLr819ymfcRPD1PMJuNET9umQbhAth14qunh9ZGF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5lT+8hHgy/DEMV2grcjJjazQQttetFwIjJal9lghVw=;
 b=d4XpncTvqoayUzZcTW6V8npkC+3HIrQCfwAGy6Elpqp/x+W631P0wa+DnAnqKseWjCdRg627ObXv6P8ZzzQoEkQbhkmxyf5VQxmyMSHaa2HjpAEYvhdMeZmhec0rIrVc+rvFhwNUmKPWawWJgP7yNYW7FzdhdyAb4HTjxK992q4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB3197.prod.exchangelabs.com (2603:10b6:301:35::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31; Thu, 20 May 2021 14:19:33 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:19:33 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 2/7] ipmi: ssif_bmc: Add SSIF BMC driver
To: minyard@acm.org
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-3-quan@os.amperecomputing.com>
 <20210519123042.GF2921206@minyard.net>
Message-ID: <be6c1d43-624e-4ecb-be18-91de54fdb60f@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:19:21 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <20210519123042.GF2921206@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:202:2::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR0401CA0015.apcprd04.prod.outlook.com (2603:1096:202:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 14:19:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cd16300-1ab5-4367-3fe3-08d91b9a49ca
X-MS-TrafficTypeDiagnostic: MWHPR0101MB3197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB319774BACE26D70370BC5568F22A9@MWHPR0101MB3197.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6oYWfSglXGVPAflgD1YBU5q2vd8hEi/GGfGVPJ9tscGjHwAOiVyhwKwKtUFOvKu0LzxCdknmU8Ncn8zscGGgVI0CvSx3XAxXC/TYaKZpLkYog3mG9Zjhuq9WldVx1oQE2pwIj7ome+xejZML6p81IGYGFihtplsysKwbEsLbMf7KFXXbMhcL0LOc2T0Npe+jrfLonLiRKEJyY6YgNghbR2GA8GfjUpC6PQNgm546wxIFHqGTQOvGArnhUlAonV9HdO4ZacJPjqQwIlHf4UynDdGL1crnv8XkXsTjVuFBhvWWldBvqWC1ZEY+8zoqWp3s47fTVkHCzL7QDD9mCVlIf4uuFwmqNBUpy4vKgx4H7S23XWKok7JQ6Tl6sYQ97ckE1cAbg912rCetRb+V1L1qTFlXY8IKNH1Mut6F71I+PpA0Soexe6M8+sbgdA1nlOljobLdX22yWPz0gEjz2EoEzZixLHessUet17kK2/fV/l2l2gl4+jr1V9AxXn9YVz+nsvkLChsMAW/043ETfLKaegpP6C29vGvXb7mSXzSkGnVkme2HH8ZjKUhEpioLUPpM9cndCke4R3Y3AmFCcwYiKXjKDh7wL29Ir6Ymvac9oTBQfw60cc6gVZ70s8OIVFzWi8tqeIcufN5fLjOglYqMflOIjWD4PKSV0dkqnl0YbzW/75KpTf7aVtqHJLic1lxJp5gtsXrMIpKh0nQNnVZ73fVWU3GuiSKF+oLpGWgE34F8t+GzvtMtpW9xxNmm7P8+m5+ZCnacWKp9L+KTwe8tzM0WcqFT9qF99IDUOYl0BU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(4326008)(31686004)(316002)(2616005)(8936002)(5660300002)(2906002)(7416002)(38100700002)(54906003)(66476007)(8676002)(83380400001)(30864003)(6666004)(478600001)(86362001)(186003)(16526019)(66556008)(66946007)(6916009)(52116002)(53546011)(31696002)(6486002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDhNZVVuMDJNTytvMFVkZDBTZlYrc0FLYUFaajh4OThJOXhnRld6RHhCc0N6?=
 =?utf-8?B?aDdrWXFvL1BaeTlzL0czdzdtSjBUZWxTT2JzKzdud3VNN2tXRkdwblFoMGdJ?=
 =?utf-8?B?eCswUUhMU1BqeU9hZ0V5R1BJMmhrVDByS2FRN3htMjdWV1JpcjdHdEp5Undq?=
 =?utf-8?B?UGE4NkROL0ZWcEZ0ZzRFWFVJczAvUVo2T29JcVk5eS8rQVNVQzZKbWJhT3B4?=
 =?utf-8?B?ZUtDT0xEUVNyaEptZ0dJVzgxNm9TQVBJZHQ2N2lBWDVId1hId1JZVFlYNk5R?=
 =?utf-8?B?MjNtZDZSZEdMTDRBQkQ1OTIrTW9qeVhTekpieVo0c3p4RENYZWNaK3N5LzdI?=
 =?utf-8?B?bzZLSGkrMVhEZXkxYjd3ZHdodHVzMEJLOGE5ZWhFUjlSZWt3T2F4U3h4aXBT?=
 =?utf-8?B?cmdIVkhUbjRDS21CbkR4Q0xna2dXYnhjZExGdStTUmc0SHd2cllDdldlWlB4?=
 =?utf-8?B?RThua0p2Rk5Qc3dRZys0UW9hTUJxTUZibjlPeW9XMmdEQ2tmOGQ2WEE2T2hV?=
 =?utf-8?B?MUJsYXg1MVoxQk90ZDIwRmJ4RUZvVFFkMEtHVm9WcWQwc0ZyckFNUTFqdUR6?=
 =?utf-8?B?RUNUdUgyY09MWnZ6SEk4TjUrdXppZnFBUEdSMEdxZXVQS1UrbTB5VnFVZzQ4?=
 =?utf-8?B?ZUkvRjhJRlRSTklQOUVjTEd3Ymlsczg4RWhSbTVEdURacHgxS1hqSXVOdHVW?=
 =?utf-8?B?UExZY3dLNWVpWnZYYXBna1B4T09LU08vODFqS00yNWlQK0lJWjVZYkd0MEhR?=
 =?utf-8?B?a0tZZlFwL0RZcm9FWmJDT2g1ajczY0s5S3FUNG5sV3Q2T3IvaE9yL1EwaUE3?=
 =?utf-8?B?WGUzemlTQ1JjOWJRWFJCU1NQZ05MWG5lODY2UHRkVnhHaVpaU29vME4rVWYv?=
 =?utf-8?B?WkozdlhyMm8zWUtJK095Q2FRMW5IeVJYNEtCWTdvVHBTalVGNTdOdVN2SElJ?=
 =?utf-8?B?RnhOM24rd1RMQXR3T1BNRnlaVEhDTkhjRDV5c2lHQkFnT3UraTE4RTkrdHJO?=
 =?utf-8?B?cndZNG5HSnp6VVFJVzZwUjJPV2lxY29oWVdPNndUWkhQZjRlSXp1dmtRK3lx?=
 =?utf-8?B?NG1sTkxiWkd1SXJ1a01DQjFIVlM3N0RVQktGKzhkK3pUY0pnNWNENGg0S1J1?=
 =?utf-8?B?SmJXdUJjWWR1QmdzS0NqeGNJcUhLV0luNFQ1eFhyVFpjSHBKdTdqRGZISzk1?=
 =?utf-8?B?NHhvVysxQWpGVGRhbUFKRkdCUEd5VitLYjJkNG4rUEdLcmZNWE4razZGTDNv?=
 =?utf-8?B?N25BSEdQTFZ3V3BFREY3VzRPbTE1QnhqV2dXa0xZK2pObkF2c3ZGMDdYUWtV?=
 =?utf-8?B?M011bVhrKytwUGJiYmpmVmt2UVBFQTJlSTVIc0REb0dFTWlmaXhvY2QxK3lw?=
 =?utf-8?B?eU9wNldCRVdXc21waVhvUmdlQ3dTOFI3V2w5QXNtU2xXM2lWUUJnN1hZeUlW?=
 =?utf-8?B?SE5VQ0RKTmJNK0NZcDI3cnJmcS85WEttVHJ4YlpuZGVhZzlnVGpOUEFIYXcw?=
 =?utf-8?B?SGcwUElpQWV5ZEJTNVVGS0NlQVA0dXpZdi9VWStKaXFGTkpQbGNvS2VvUmo5?=
 =?utf-8?B?bysrVmk5alk1a2J0SVZPbCthaFZvWUM1K2p6bTR5RW9PZHN1K2RWekEwMTZX?=
 =?utf-8?B?QnY3RXF4bHVEeWlVOFNSanU3QUR6ZFQ0K0dqRjBCeHpqZlZqSWZKWGs0U3dD?=
 =?utf-8?B?dTcvQzFFdVRPQkI3MEl3S2JFSzJ4WGZFWmFXOUJQOFg4cjlrZE1GUG1jSjBl?=
 =?utf-8?B?WkZ4WFQyOXIvVm9TcUZxd3NXeUNsR2xFc2UrRURobFgyWWs5OWtueE5Zb1kw?=
 =?utf-8?B?dkE3Y2JVMXlMN3VPSS9HbEx5dlZBaEI0ZTIzaGhoZE1YdG4xUGxleFNIYkEy?=
 =?utf-8?Q?bYp9NwR8lWlUK?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd16300-1ab5-4367-3fe3-08d91b9a49ca
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:19:33.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcDEb4zGUYlvjLloSVuu1PG5gnQMRAxCKxej7d/Gp8YoIw9DICx+bab31AQPm6waoENwTwT+VupfzyiAp7tB09zGMr5S5fnSSlhYlJIQkKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3197
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/05/2021 19:30, Corey Minyard wrote:
> On Wed, May 19, 2021 at 02:49:29PM +0700, Quan Nguyen wrote:
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + Removed redundant license info [Joel]
>>    + Switched to use traditional if-else [Joel]
>>    + Removed unused ssif_bmc_ioctl() [Joel]
>>    + Made handle_request()/complete_response() to return void [Joel]
>>    + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
>>    + Removed mutex [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>>    + Removed the unnecessary memset [Corey]
>>    + Switch to use dev_err() [Corey]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>>   drivers/char/ipmi/Kconfig    |  11 +
>>   drivers/char/ipmi/Makefile   |   1 +
>>   drivers/char/ipmi/ssif_bmc.c | 605 +++++++++++++++++++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h |  93 ++++++
>>   4 files changed, 710 insertions(+)
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>
>> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>> index 07847d9a459a..ad5c5161bcd6 100644
>> --- a/drivers/char/ipmi/Kconfig
>> +++ b/drivers/char/ipmi/Kconfig
>> @@ -133,6 +133,17 @@ config ASPEED_BT_IPMI_BMC
>>   	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>>   	  implements the BMC side of the BT interface.
>>   
>> +config SSIF_IPMI_BMC
>> +	tristate "SSIF IPMI BMC driver"
>> +	select I2C
>> +	select I2C_SLAVE
>> +	help
>> +	  This enables the IPMI SMBus system interface (SSIF) at the
>> +	  management (BMC) side.
>> +
>> +	  The driver implements the BMC side of the SMBus system
>> +	  interface (SSIF).
>> +
>>   config IPMB_DEVICE_INTERFACE
>>   	tristate 'IPMB Interface handler'
>>   	depends on I2C
>> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>> index 0822adc2ec41..d04a214d74c4 100644
>> --- a/drivers/char/ipmi/Makefile
>> +++ b/drivers/char/ipmi/Makefile
>> @@ -27,3 +27,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>>   obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>>   obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>>   obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
>> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
>> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
>> new file mode 100644
>> index 000000000000..d0ea7059b1db
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -0,0 +1,605 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/poll.h>
>> +#include <linux/sched.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include "ssif_bmc.h"
>> +
>> +/* Handle SSIF message that will be sent to user */
>> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (!ssif_bmc->request_available) {
>> +		if (file->f_flags & O_NONBLOCK) {
> 
> There is no real need to check this under the lock.  It would simplify
> the end of this function if you checked this outside the lock.
> 
Thanks for your reviewing.

Will apply change like below in next version:

         spin_lock_irqsave(&ssif_bmc->lock, flags);
         while (!ssif_bmc->request_available) {
-               if (file->f_flags & O_NONBLOCK) {
-                       ret = -EAGAIN;
-                       goto out_unlock;
-               }
                 spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+               if (file->f_flags & O_NONBLOCK)
+                       return -EAGAIN;
                 ret = wait_event_interruptible(ssif_bmc->wait_queue,

ssif_bmc->request_available);
                 if (ret)

>> +			ret = -EAGAIN;
>> +			goto out_unlock;
>> +		}
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       ssif_bmc->request_available);
>> +		if (ret)
>> +			return ret;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request),
>> +		      min_t(ssize_t, sizeof(struct ssif_msg), count));
> 
> Just curious, what happens if userland supplies a buffer that is too
> small?  Is data lost?  In that case, I would think returning an error
> here would be the better thing, as opposed to silently truncating the
> message.
> 
Will return -EINVAL if buffer is too small in next version

>> +	memcpy(&msg, &ssif_bmc->request, count);
>> +	ssif_bmc->request_available = false;
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	ret = copy_to_user(buf, &msg, count);
>> +	goto out;
>> +
>> +out_unlock:
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +out:
>> +	return (ret < 0) ? ret : count;
>> +}
>> +
>> +/* Handle SSIF message that is written by user */
>> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
>> +			      loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	if (count > sizeof(struct ssif_msg))
>> +		return -EINVAL;
>> +
>> +	ret = copy_from_user(&msg, buf, count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!msg.len || count < ssif_msg_len(&msg))
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (ssif_bmc->response_in_progress) {
>> +		if (file->f_flags & O_NONBLOCK) {
> 
> Same comment as O_NONBLOCK before.
>
Will apply this follow the above in ssif_bmc_read()

>> +			ret = -EAGAIN;
>> +			goto out_unlock;
>> +		}
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       !ssif_bmc->response_in_progress);
>> +		if (ret)
>> +			goto out;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	memcpy(&ssif_bmc->response, &msg, count);
>> +	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
>> +	ssif_bmc->response_in_progress = true;
>> +	if (ssif_bmc->set_ssif_bmc_status)
>> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
>> +
>> +out_unlock:
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +out:
>> +	return (ret < 0) ? ret : count;
>> +}
>> +
>> +static int ssif_bmc_open(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	int ret = 0;
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	if (!ssif_bmc->running)
>> +		ssif_bmc->running = 1;
>> +	else
>> +		ret = -EBUSY;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	unsigned int mask = 0;
>> +
>> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	/*
>> +	 * The request message is now available so userspace application can
>> +	 * get the request
>> +	 */
>> +	if (ssif_bmc->request_available)
>> +		mask |= POLLIN;
>> +
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return mask;
>> +}
>> +
>> +static int ssif_bmc_release(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	ssif_bmc->running = 0;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * System calls to device interface for user apps
>> + */
>> +static const struct file_operations ssif_bmc_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= ssif_bmc_open,
>> +	.read		= ssif_bmc_read,
>> +	.write		= ssif_bmc_write,
>> +	.release	= ssif_bmc_release,
>> +	.poll		= ssif_bmc_poll,
>> +};
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	if (ssif_bmc->set_ssif_bmc_status)
>> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
>> +
>> +	/* Request message is available to process */
>> +	ssif_bmc->request_available = true;
>> +	/*
>> +	 * This is the new READ request.
>> +	 */
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +}
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	/* Invalidate response in buffer to denote it having been sent. */
>> +	ssif_bmc->response.len = 0;
>> +	ssif_bmc->response_in_progress = false;
>> +	ssif_bmc->nbytes_processed = 0;
>> +	ssif_bmc->remain_len = 0;
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +}
>> +
>> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 response_len = 0;
>> +	int idx = 0;
>> +	u8 data_len;
>> +
>> +	data_len = ssif_bmc->response.len;
>> +	switch (ssif_bmc->smbus_cmd) {
>> +	case SSIF_IPMI_MULTIPART_READ_START:
>> +		/*
>> +		 * Read Start length is 32 bytes.
>> +		 * Read Start transfer first 30 bytes of IPMI response
>> +		 * and 2 special code 0x00, 0x01.
>> +		 */
>> +		*val = MAX_PAYLOAD_PER_TRANSACTION;
>> +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
>> +		ssif_bmc->block_num = 0;
>> +
>> +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
>> +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
>> +
>> +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
>> +
>> +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
>> +		       response_len);
>> +		break;
>> +
>> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>> +		/*
>> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
>> +		 * IPMI data plus block number byte.
>> +		 */
>> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
>> +			/*
>> +			 * This is READ End message
>> +			 *  Return length is the remaining response data length
>> +			 *  plus block number
>> +			 *  Block number 0xFF is to indicate this is last message
>> +			 *
>> +			 */
>> +			*val = ssif_bmc->remain_len + 1;
>> +			ssif_bmc->block_num = 0xFF;
>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>> +			response_len = ssif_bmc->remain_len;
>> +			/* Clean the buffer */
>> +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
>> +		} else {
>> +			/*
>> +			 * This is READ Middle message
>> +			 *  Response length is the maximum SMBUS transfer length
>> +			 *  Block number byte is incremented
>> +			 * Return length is maximum SMBUS transfer length
>> +			 */
>> +			*val = MAX_PAYLOAD_PER_TRANSACTION;
>> +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>> +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>> +			ssif_bmc->block_num++;
>> +		}
>> +
>> +		memcpy(&ssif_bmc->response_buf[idx],
>> +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
>> +		       response_len);
>> +		break;
>> +
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev,
>> +			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
>> +		break;
>> +	}
>> +
>> +	ssif_bmc->nbytes_processed += response_len;
>> +}
>> +
>> +/* Process the IPMI response that will be read by master */
>> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 *buf;
>> +	u8 pec_len, addr, len;
>> +	u8 pec = 0;
>> +
>> +	pec_len = ssif_bmc->pec_support ? 1 : 0;
>> +	/* PEC - Start Read Address */
>> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>> +	/* PEC - SSIF Command */
>> +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
>> +	/* PEC - Restart Write Address */
>> +	addr = addr | 0x01;
>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>> +
>> +	if (ssif_bmc->is_singlepart_read) {
>> +		/* Single-part Read processing */
>> +		buf = (u8 *)&ssif_bmc->response;
>> +
>> +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
>> +			ssif_bmc->msg_idx++;
>> +			*val = buf[ssif_bmc->msg_idx];
>> +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
>> +			ssif_bmc->msg_idx++;
>> +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
>> +		} else {
>> +			*val = 0;
>> +		}
>> +		/* Invalidate response buffer to denote it is sent */
>> +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
>> +			complete_response(ssif_bmc);
>> +	} else {
>> +		/* Multi-part Read processing */
>> +		switch (ssif_bmc->smbus_cmd) {
>> +		case SSIF_IPMI_MULTIPART_READ_START:
>> +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>> +			buf = (u8 *)&ssif_bmc->response_buf;
>> +			*val = buf[ssif_bmc->msg_idx];
>> +			ssif_bmc->msg_idx++;
>> +			break;
>> +		default:
>> +			/* Do not expect to go to this case */
>> +			dev_err(&ssif_bmc->client->dev,
>> +				"Error: Unexpected SMBus command received 0x%x\n",
>> +				ssif_bmc->smbus_cmd);
>> +			break;
>> +		}
>> +		len = (ssif_bmc->block_num == 0xFF) ?
>> +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
>> +		if (ssif_bmc->msg_idx == (len + 1)) {
>> +			pec = i2c_smbus_pec(pec, &len, 1);
>> +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
>> +		}
>> +		/* Invalidate response buffer to denote last response is sent */
>> +		if (ssif_bmc->block_num == 0xFF &&
>> +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
>> +			complete_response(ssif_bmc);
>> +		}
>> +	}
>> +}
>> +
>> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 *buf;
>> +	u8 smbus_cmd;
>> +
>> +	buf = (u8 *)&ssif_bmc->request;
>> +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
> 
> Shouldn't you abort the message if you get too much data?  Otherwise you
> get silent truncation.
> 
Will try to abort bad request in next version.

>> +		return;
>> +
>> +	smbus_cmd = ssif_bmc->smbus_cmd;
>> +	switch (smbus_cmd) {
>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>> +		/* Single-part write */
>> +		buf[ssif_bmc->msg_idx - 1] = *val;
>> +		ssif_bmc->msg_idx++;
>> +
>> +		break;
> 
> Generally you put the space after the break, not before.  You did this
> right before, but didn't from here down in the file.
> 
Will fix them in next version.

>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>> +		/* Reset length to zero */
>> +		if (ssif_bmc->msg_idx == 1)
>> +			ssif_bmc->request.len = 0;
> 
> What happens if you get this and you are in the middle of a message?
> 
As per specs, this message should be discarded. This part is still 
missing. I'll try to add this feature in next version.

>> +
>> +		fallthrough;
>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> 
> What happens if you get these and you are not in a message?
> 
Same as my comment above.

>> +		/* Multi-part write, 2nd byte received is length */
>> +		if (ssif_bmc->msg_idx == 1) {
>> +			ssif_bmc->request.len += *val;
>> +			ssif_bmc->recv_len = *val;
>> +		} else {
>> +			buf[ssif_bmc->msg_idx - 1 +
>> +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
>> +		}
>> +
>> +		ssif_bmc->msg_idx++;
>> +
>> +		break;
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev,
>> +			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
>> +		break;
>> +	}
>> +}
>> +
>> +static bool validate_pec(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	u8 rpec = 0, cpec = 0;
>> +	bool ret = true;
>> +	u8 addr, index;
>> +	u8 *buf;
>> +
>> +	buf = (u8 *)&ssif_bmc->request;
>> +	switch (ssif_bmc->smbus_cmd) {
>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>> +		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
>> +			/* PEC is not included */
>> +			ssif_bmc->pec_support = false;
>> +			return true;
>> +		}
>> +
>> +		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1))
>> +			goto error;
>> +
>> +		/* PEC is included */
>> +		ssif_bmc->pec_support = true;
>> +		rpec = buf[ssif_bmc->msg_idx - 2];
>> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
>> +		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
>> +		if (rpec != cpec) {
>> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
>> +			ret = false;
>> +		}
>> +
>> +		break;
>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
>> +		index = ssif_bmc->request.len - ssif_bmc->recv_len;
>> +		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
>> +			/* PEC is not included */
>> +			ssif_bmc->pec_support = false;
>> +			return true;
>> +		}
>> +
>> +		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1))
>> +			goto error;
>> +
>> +		/* PEC is included */
>> +		ssif_bmc->pec_support = true;
>> +		rpec = buf[ssif_bmc->msg_idx - 2 + index];
>> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
>> +		/* As SMBus specification does not allow the length
>> +		 * (byte count) in the Write-Block protocol to be zero.
>> +		 * Therefore, it is illegal to have the last Middle
>> +		 * transaction in the sequence carry 32-bytes and have
>> +		 * a length of ‘0’ in the End transaction.
>> +		 * But some users may try to use this way and we should
>> +		 * prevent ssif_bmc driver broken in this case.
>> +		 */
>> +		if (ssif_bmc->recv_len != 0)
>> +			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
>> +
>> +		if (rpec != cpec) {
>> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
>> +			ret = false;
>> +		}
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +error:
>> +	/* Do not expect to go to this case */
>> +	dev_err(&ssif_bmc->client->dev,
>> +		"Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
>> +
>> +	return false;
>> +}
>> +
>> +static void complete_write_received(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	u8 cmd = ssif_bmc->smbus_cmd;
>> +
>> +	/* A BMC that receives an invalid PEC shall drop the data for the write
>> +	 * transaction and any further transactions (read or write) until
>> +	 * the next valid read or write Start transaction is received
>> +	 */
>> +	if (!validate_pec(ssif_bmc)) {
>> +		dev_err(&ssif_bmc->client->dev, "Received invalid PEC\n");
>> +		return;
>> +	}
>> +
>> +	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
>> +		handle_request(ssif_bmc);
>> +}
>> +
>> +static void initialize_transfer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	/* SMBUS command can vary (single or multi-part) */
>> +	ssif_bmc->smbus_cmd = *val;
>> +	ssif_bmc->msg_idx++;
>> +
>> +	if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
>> +	    ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_START) {
>> +		/*
>> +		 * The response can be delayed in BMC causing host SSIF driver
>> +		 * to timeout and send a new request once BMC slave is ready.
>> +		 * In that case check for pending response and clear it
>> +		 */
>> +		if (ssif_bmc->response_in_progress) {
>> +			dev_err(&ssif_bmc->client->dev,
>> +				"Warn: SSIF new request with pending response");
>> +			complete_response(ssif_bmc);
>> +		}
>> +	} else if (unlikely(ssif_bmc->smbus_cmd != SSIF_IPMI_SINGLEPART_READ &&
>> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_MIDDLE &&
>> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_END &&
>> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_START &&
>> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_MIDDLE)) {
>> +		/* Unknown command, clear it */
>> +		dev_err(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
>> +		complete_response(ssif_bmc);
>> +	}
>> +}
>> +
>> +/*
>> + * Callback function to handle I2C slave events
>> + */
>> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
>> +{
>> +	unsigned long flags;
>> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +
>> +	/* I2C Event Handler:
>> +	 *   I2C_SLAVE_READ_REQUESTED	0x0
>> +	 *   I2C_SLAVE_WRITE_REQUESTED	0x1
>> +	 *   I2C_SLAVE_READ_PROCESSED	0x2
>> +	 *   I2C_SLAVE_WRITE_RECEIVED	0x3
>> +	 *   I2C_SLAVE_STOP		0x4
>> +	 */
>> +	switch (event) {
>> +	case I2C_SLAVE_READ_REQUESTED:
>> +		ssif_bmc->msg_idx = 0;
>> +		if (ssif_bmc->is_singlepart_read)
>> +			*val = ssif_bmc->response.len;
>> +		else
>> +			set_multipart_response_buffer(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_REQUESTED:
>> +		ssif_bmc->msg_idx = 0;
>> +		break;
>> +
>> +	case I2C_SLAVE_READ_PROCESSED:
>> +		handle_read_processed(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_RECEIVED:
>> +		if (ssif_bmc->msg_idx)
>> +			handle_write_received(ssif_bmc, val);
>> +		else
>> +			initialize_transfer(ssif_bmc, val);
>> +
>> +		break;
>> +
>> +	case I2C_SLAVE_STOP:
>> +		if (ssif_bmc->last_event == I2C_SLAVE_WRITE_RECEIVED)
>> +			complete_write_received(ssif_bmc);
>> +		/* Reset message index */
>> +		ssif_bmc->msg_idx = 0;
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +	ssif_bmc->last_event = event;
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc;
>> +	int ret;
>> +
>> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc) + sizeof_priv, GFP_KERNEL);
>> +	if (!ssif_bmc)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	spin_lock_init(&ssif_bmc->lock);
>> +
>> +	init_waitqueue_head(&ssif_bmc->wait_queue);
>> +	ssif_bmc->request_available = false;
>> +	ssif_bmc->response_in_progress = false;
>> +
>> +	/* Register misc device interface */
>> +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
>> +	ssif_bmc->miscdev.name = DEVICE_NAME;
>> +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
>> +	ssif_bmc->miscdev.parent = &client->dev;
>> +	ret = misc_register(&ssif_bmc->miscdev);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ssif_bmc->client = client;
>> +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
>> +
>> +	/* Register I2C slave */
>> +	i2c_set_clientdata(client, ssif_bmc);
>> +	ret = i2c_slave_register(client, ssif_bmc_cb);
>> +	if (ret) {
>> +		misc_deregister(&ssif_bmc->miscdev);
>> +		goto out;
>> +	}
>> +
>> +	return ssif_bmc;
>> +
>> +out:
>> +	devm_kfree(&client->dev, ssif_bmc);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL(ssif_bmc_alloc);
>> +
>> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
>> new file mode 100644
>> index 000000000000..eab540061f14
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.h
>> @@ -0,0 +1,93 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
>> + */
>> +#ifndef __SSIF_BMC_H__
>> +#define __SSIF_BMC_H__
>> +
>> +#define DEVICE_NAME				"ipmi-ssif-host"
>> +
>> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
>> +
>> +#define MSG_PAYLOAD_LEN_MAX			252
>> +
>> +/* A standard SMBus Transaction is limited to 32 data bytes */
>> +#define MAX_PAYLOAD_PER_TRANSACTION		32
>> +
>> +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
>> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
>> +
>> +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
>> +#define SSIF_IPMI_SINGLEPART_READ		0x3
>> +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
>> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
>> +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
>> +#define SSIF_IPMI_MULTIPART_READ_START		0x3
>> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
>> +
>> +struct ssif_msg {
>> +	u8 len;
>> +	u8 netfn_lun;
>> +	u8 cmd;
>> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
>> +} __packed;
>> +
>> +static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
>> +{
>> +	return ssif_msg->len + 1;
>> +}
>> +
>> +#define SSIF_BMC_BUSY   0x01
>> +#define SSIF_BMC_READY  0x02
>> +
>> +struct ssif_bmc_ctx {
>> +	struct i2c_client	*client;
>> +	struct miscdevice	miscdev;
>> +	u8			running;
>> +	u8			smbus_cmd;
>> +	struct ssif_msg		request;
>> +	bool			request_available;
>> +	struct ssif_msg		response;
>> +	bool			response_in_progress;
>> +	/* Response buffer for Multi-part Read Transaction */
>> +	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
>> +	/* Flag to identify a Multi-part Read Transaction */
>> +	bool			is_singlepart_read;
>> +	u8			nbytes_processed;
>> +	u8			remain_len;
>> +	u8			recv_len;
>> +	/* Block Number of a Multi-part Read Transaction */
>> +	u8			block_num;
>> +	size_t			msg_idx;
>> +	enum i2c_slave_event	last_event;
>> +	bool			pec_support;
>> +	/* spinlock */
>> +	spinlock_t		lock;
>> +	wait_queue_head_t	wait_queue;
>> +	void (*set_ssif_bmc_status)(struct ssif_bmc_ctx *ssif_bmc, unsigned int flags);
>> +	void			*priv;
>> +};
>> +
>> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
>> +}
>> +
>> +struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv);
>> +
>> +#endif /* __SSIF_BMC_H__ */
>> -- 
>> 2.28.0
>>

