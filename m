Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FF2EB802
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 03:15:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Xyv3pPzzDqVK
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 13:15:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.97;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=mZY7Xw0o; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2097.outbound.protection.outlook.com [40.107.220.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Xxp1xGHzDqTl
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 13:14:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS7EBBib2XnJLGXRDENqNKDYY3ZYuZqOKaamJyYZvhGZJHA/wIKWfdWohbveuYNCc1Tf9AQCV6diRwIgfVPHur94KuCt1zHhG01ZUkgXVxlBgAhxed0qMp1P+lrrC7VS5Q3fpdZ1q1XIo7YwG3/60fOguyAofu/+ZVWoTlfIgJNB6esJn3Opt0dSyaQvAdSmu6fkkkS+AoeHa3obxrerH5RWQpGHVp5glwuPlVxa2w0ZtoyqQbnw50Kp8NBX9BvzD7afCbt7a258yVgCjDERN4QmEjXtZNBJvKh8SNQbrWwZMYDHwn7E0QKmN9mffYYg2wMqKDaufJmD1vraTzsoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iTVhYelxmDmVMdJLEtM8bdMmocAQMjVLNlm5vlzUrU=;
 b=EgtTo1UuTiys4ugnR0HI/ziwmQfLrUCHmLZEc8mFdmL9qmbN0zjn3TzgenzRNQl6I9Ozev6NUyWK1z8xQOdj3NYLkWg9tYxy6IQpC2qZPOjrRo3SuzGWXl+3dpMtys7ZvNaBBpC/kLxc8Rk8B6z29JXi9fRFnTW5Jt42YDKNmtRzX1Qz+pLYNi8kUzvin6QxrE0NcF5XrgDMkGcK3yvon3X70MexmjRmObTLbjtxbcSp9xREtyXSPDQsu9dGYFmMjlMC7HqjaGYLuY34JBGJbFeKi5RwnurloMi2rqk3na2mzhY1Fuegj4E9cgiUlRoiFyDXH/gvSxI3/0QJtP8WEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iTVhYelxmDmVMdJLEtM8bdMmocAQMjVLNlm5vlzUrU=;
 b=mZY7Xw0o5KbWbY0IT6/WpA+1lFjiNoHQq9um3O2sxv6f8Va5ujhL/wDffFmvW6BviTQdgT7+mqixbwMDOxuMrIr4w9CHq61h6RXuD9ba3H+vb+fwm1lggtWfLDTkPidDcwiBdaxJgRPMrSydAvnrn+xtNhbYVhx/2TZOgidgwVo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR0102MB3576.prod.exchangelabs.com (2603:10b6:4:a4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 02:14:46 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%5]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 02:14:46 +0000
Subject: Re: GPIO pin is reset to default value after release.
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
 <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <a25a3990-b180-9579-b934-62f4d3a53e3b@amperemail.onmicrosoft.com>
Date: Wed, 6 Jan 2021 09:14:38 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
In-Reply-To: <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.118] (118.69.219.201) by
 HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Wed, 6 Jan 2021 02:14:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c435379-8a9e-4364-637e-08d8b1e8d69d
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3576:
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3576BFA78F3969DC5D716D2890D00@DM5PR0102MB3576.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DD5/ahnF6RS/qLQV5HUXkoxjPjrNeoNV9UaQ8NFWIzEpIUoF2+KrSMc4VziRRUdDeN+2QvPz5d+0IcTdpM57aD817RhZG8Xh99Y3kSmtIb4zNehV77byFXAYD/TpViVzHcXPuBY7fFVtN3HzZTbBAG1yW+aby9u0YX4Z4wgrOTh784GyiMFu3Sxy5cL6RyC8IoTX76bg19cLvus/7w3rvjBlP8Jc8nEbs7IhWfZZdPDEnz5PYGIL4GaI9hwdKYCo1SmY1GT7heVSgJACUBDieqeTUrnF3/cBdal+Kvs0WXoZLzYnPQ8TZawv7x9D05VMnpDK4ZgyK1/QIGHopFctpfG0XnoCWpDkeNEkzwIgKQzNvMiQtkgZrF7waFYupN4zphCK28yULElRGhuSkbutJiol5XMTLZPYF4GqKDJdUDNUnlHhX1HOTmG8AhgZqet10nMgCwSD8nwCxwttfuL8G7zKeS2whr6PNCkMwsn0NuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(396003)(346002)(478600001)(2906002)(956004)(8936002)(42882007)(2616005)(5660300002)(26005)(31696002)(53546011)(66946007)(66476007)(83170400001)(6486002)(316002)(16576012)(8676002)(66556008)(6666004)(16526019)(186003)(52116002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGp3R3d5dVJYeG04aFVVMFU0VjZ6WUpHVlYvaWxSeEZwR0xOWVhnNGJTSmw5?=
 =?utf-8?B?MjM3MnNBcHg1RnhrNWUvOXVYYjVINXpyK24vaDBxQVM2Q2hYM2RNMjlJNENR?=
 =?utf-8?B?MTdmMWdXUHZNczIrVHJwcjNtWVNVQjVUNUlkTUVGdFd0SDhJNDlNUlBTTkxU?=
 =?utf-8?B?QXg1N1hjRllWbnBHeERZSlh2ZmVBdWZXcmFyNjh6bnZMY3MzdEpXWkJ5bFNw?=
 =?utf-8?B?R1p5SjdpYjRUVEx1UG1wNkhhaU1FTkgrV1ZDYnNZL0NmVUdFRTllWm1LTHZk?=
 =?utf-8?B?K2JCWXRWY3htQjl6SEZMZm5WNWU1TWljWWJYYmJZVmZ5T3VBZlV1c3cvdzNw?=
 =?utf-8?B?VVljNnk3OVVmRU5uMzVmaGtSMEw4T2JLeWpIT21GZ29NbXJPTFJmNXhHRGlU?=
 =?utf-8?B?TGsvbmpDK1poTkdUSmhmMUM2TnduQktmaGZWdWVuYUtYb05jS3podm0vdFEx?=
 =?utf-8?B?QU5sblBBTlczZXFkb0NwTFVPNzJvY2lteEZyb3RMUS9VMGRqYXV2K01TQ0Rr?=
 =?utf-8?B?Z0pTK3UwRHF1aWpyYzJUS1UrOE1GTjBjbUdEU2FURWVWcG1HaG01RGZWZmJq?=
 =?utf-8?B?aDFqdytOY2pTRXplNTVPTytWYkRiNE9XVDJQRkplcThmNHJuRkp5TXlydWFU?=
 =?utf-8?B?R3NYUWFBMjl5SDJKL3dzVTk1TDNvTjVLQzJ5elovN0EyK0tWSjRVdTdINW0w?=
 =?utf-8?B?czJ5TEc4YWVSU0xaOGtLb3NxZCtxTFNUc2NSTXQyaVE2U2pFVXhqeVYrcXc0?=
 =?utf-8?B?TTlITEFCRXRDVXArZEM3SXBVOFlpekJzdmJhWXJ6V3loWnE2cHlZSHZjMHRX?=
 =?utf-8?B?MGt0eUZZdFRIZ3FPdjZib1BwbGU2MW9KeXJGdWNkb0xoMy8wUjBBQmxBT2hF?=
 =?utf-8?B?TlIvOVJDRVlFSzdiZ0pybHlRc2ZseEJnajh0cjJMY3hVdmtjSXErZ2d3ZW5r?=
 =?utf-8?B?UWVkTjdqM0FqeFJnWGtRQmNaNkVab25kRlc4WWRSVWZWUVdESDB1Zm0xQThs?=
 =?utf-8?B?WVZXZzFYZzdrL2l5aURnTU80YWdkUnU2bGgwRXZKZXR4dS9pbk1sWlpsc0RY?=
 =?utf-8?B?YzVpMzJwZ2xZZXdDZzkxWXRPQjc2RFVubS9KckYzQkxxdHAvQlA1MW92QllI?=
 =?utf-8?B?cWdCQU5LeGJ5b2EzdUpFRmptdytrQ0RpMU53dXFobXpJUko1UTROYk4wRlZx?=
 =?utf-8?B?UHpwS1Ewdkxram5uRFlleURvTlZzWXpVS1BrU1IzN2tNVDJFQ3NHbnVxa0NS?=
 =?utf-8?B?dGlURzJNU0Y4dmROUWJrb2wyTWRWS2dpMlNSazduR2lTdUNvNEZrY2pyY3F4?=
 =?utf-8?Q?ZArFM6AkHKJiKGttucfasSPhI18TUo/tuF?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 02:14:46.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c435379-8a9e-4364-637e-08d8b1e8d69d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0xq3CW8Bsbo6VUdbwjfbXESh62EXYruHCWZ9ZjOoAXu/Kq1avdweMukCUsNHPoI02sdqKukp/wiVz2/T7FXHaOfqGrB6bHYL0JPxGWn+Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3576
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

On 1/6/21 08:12, Andrew Jeffery wrote:
>
> On Wed, 6 Jan 2021, at 02:57, Thu Nguyen wrote:
>> Hi,
>>
>>
>> Current I'm using two difference GPIO libs gpiod and gpioplus to setting
>> GPIO pins.
>>
>> I can set the GPIO pin to expected value in a service. And GPIO keep
>> unchanging when the service is running.
>>
>> But when the service is exited, the GPIO handler is released then GPIO
>> is reset to default value.
>>
>>
>> Do we have any gpio lib which don't reset the GPIO when the handler is
>> released?
> No. This is a property of the GPIO chardev interface provided by the kernel. libgpiod makes the kernel interface a bit nicer to consume in user space, but isn't where this behaviour is contracted (i.e. any use of the chardev interface might result in this behaviour, libgpiod or otherwise).
>
> At the moment the way to get the behaviour you desire is to keep the line handle open.

Yes, This is what I did at this moment to keep the GPIO pin unchanged.

But the GPIO pin will be locked and no service can read that GPIO pins 
when is is locked.

>
> The deprecated approach is to use the sysfs interface instead, but that's strongly discouraged.
>
> That said, your problem is something I have on my to-do list to address with upstream. I'll Cc the openbmc list whenever I get to it.

I thought about a GPIO service which will create DBus servers and Dbus 
method to set/get/release the GPIO pins and keep that GPIO pin unchanged 
until next setting.

That service will handle and keep the gpio line. All of others openBmc 
services will access GPIO thru that service.

It can use the same ways which phosphor-sel-logger do to provide 
xyz.openbmc_project.Logging.IPMI service and function IpmiSelAddOem.

>
> Cheers,
>
> Andrew

Cheers,

Thu Nguyen.

