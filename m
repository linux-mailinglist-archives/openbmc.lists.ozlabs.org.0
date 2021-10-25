Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD0438E81
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 06:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd2SR6grSz2yNp
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 15:45:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mDNbpOLp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.128;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mDNbpOLp; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2128.outbound.protection.outlook.com [40.107.101.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd2Rt6JyNz2xrC;
 Mon, 25 Oct 2021 15:44:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9QC0mvZnINSqiK6BGKBN2ZAXFMvrot37S/jmPSsPJs/6jhbURP/Tff1V/qigrALdXVV9HbS9FFbDJaCf3sOMnQgfT1bwEIc3RARst0rY5xfFo7Z3d+a725dWTLdtnmg9G/H80OmEqEYOj7pBleQb/XlU9GCRG2Xb2Q8knXmDxt42Qn5ZvoInfCAa/i8Qv4F+d0pYVUuPrj7etod/4OnfNLkknRiN2ciEgTKSjlwoiOoKh+vgSfpU+Yrz32XM6SUscp/kP6TcuLw9E5QKmXbFoOgaHy1vSJmPDA5vZf+4X+6OSIv/v5dpTpnx2qTtkfA9eNllz8qFnUObQB4MF4tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJZSsU8GGjAyve3sDOOa8Yw+07DNAh5XDCZ/vcSZP5c=;
 b=a2VfaZivaYQjulHktlCcZ+vIIfbWJfyNCO3Yglrm8m9ofPHkCFohENhtEcxys/iTPjFyK4RL0mD+vsAVZ53A2wsONd3+wYIa1rBdd2nFLKrE7twAqtZ7tDWn2k/ecvxdIFHJLkMaPVCPfsZCphJwYOfCunMJqWBL/RM5q/4f55h+xQSilZh+y5ZtCfTQgPRwL2q1q+YtXu05dSD28WRf9qD0zd38Y8d4/KgyYjYsnGAuvkjswIz8ERXWYEw3O2boBRyWpQ6IbCMVpbwA/yD+DQg+EKfzdSI5KykwyDx49cdLjyQUdh3DjgL2LbuoqF7ZY1WM1IvP/XXHZIo4m7s2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJZSsU8GGjAyve3sDOOa8Yw+07DNAh5XDCZ/vcSZP5c=;
 b=mDNbpOLpaR2HsbJLJ4c26LHebvGoox3kLBADpUToDJ/ol6NCGvs0ZD93IbjLPzQBj9mQpUw1ft9rbFDVmI93ZpTf4gp4N8SwzPr/PonZAry3uxxskF73IwxiI8penpSDNWhnLGG55MLfrAQ6X0mJoOL5slcJKGNVn2jLwoDHDxE=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB3943.prod.exchangelabs.com (2603:10b6:a02:82::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Mon, 25 Oct 2021 04:44:14 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 04:44:14 +0000
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: mtjade: Add some gpios
To: Joel Stanley <joel@jms.id.au>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
 <20211019060155.945-2-quan@os.amperecomputing.com>
 <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <87d82a93-cdc2-d95a-4ab9-085ff31c4387@os.amperecomputing.com>
Date: Mon, 25 Oct 2021 11:44:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from [IPv6:2402:800:623c:9072:446:faca:b614:6ba6]
 (2402:800:623c:9072:446:faca:b614:6ba6) by
 SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 04:44:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb481d79-5c03-4d2c-ede1-08d99772182e
X-MS-TrafficTypeDiagnostic: BYAPR01MB3943:
X-Microsoft-Antispam-PRVS: <BYAPR01MB3943B6B86BC8AE547A7ECD60F2839@BYAPR01MB3943.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/8GnZu3ffZ0f/UuEQ5fWOc12rjiTZ4lisJ3ZaM9gG6XQjGJ3qKqUFy917yhZOqbEYqXt5ktEcVgSHpoopqPVil/75/NQe7uimpSrHP//kRv6jzisjgIP+Ga2G2XxiRzqCp+PJAzQUtaim0ItbU2vsWP0B/Msyg0L47zKkJx10kVM8t54zoJ/nhluLPfbvgpDqguaeU0yZQ5/LH7tlY2k/IREIegDQL/zutsICBOzvLLUPmGFuIfmuY+O6ImV3t6AGjYnGc8VMPRRmVjz44hbTVjDU+VNOSDm8YfpYmznIIc1ILRYeyEW0Y7Fp74Lhp0n411LeJwA1uswNHKSNt/VTzRWHnnSrruiV0q1QXCWVvjt4GQAnEM8KE0TF7H0fkqeuMqOeUBZzw3FGdEp6psPHMjT7lZE0GglVl9mFmUOa5E8j9ZfD1l7p3S73QSktPU0DkdkyrsoSeTRWYpPzPMVWXk6wsuF8YTiPbtA+u66saXdYyLTDuVPX4dEjL/0trCM830uiCnr1qh/Pdu3Juop+wbE+S5jsuFiyh5eSQxZvwCmOlcoiEUXE+T6hG6axiX6ps572A+UE+cVwZjLp82Kw9BFbegV37RVR1+ob1KNaj800Zph7t1kjCk/erfArAXvSG5mkQp9vUr7L5XD/GAVposNitVwtJikjupaTfv0xw89G2GfAsUIhexpbhHkA4VvXS9m6hpphjc+OEvbNJ61mgkhExYQQlnVRhp+99p4/jme8+du9+xcV46PPg2J11VOQ26eUCWuW1aZYGFHYtvHE4e16DkOnMfBvgcWnQYqGCpqYvknrehfT+GPflsNVed
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(31686004)(4326008)(6916009)(5660300002)(66556008)(66946007)(6666004)(2616005)(53546011)(107886003)(52116002)(8676002)(6486002)(66476007)(8936002)(38100700002)(966005)(86362001)(54906003)(316002)(508600001)(2906002)(31696002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amcva1Z0c0lZNlNXMnorT3JBWXhsMEpvdlVHYmdONmlWZ29OL0RUNzB0WU52?=
 =?utf-8?B?VzRMNGFEYVM5b0hwU2g2QllLY3ExcDh0Rzd6QXliVzJya3JHOVEreGNtUm43?=
 =?utf-8?B?VkZ1RXQ1aU1vNCs4SGttMUtoVVQ0WDM5UUZkTHZEcncrbDRTdUZYTTlyTHNO?=
 =?utf-8?B?R3N3ZXZiMERaaWxUWVFTWkpWRS83VHZRUkNDSmlMWGtlTmo1OUxFN3o5T0Qz?=
 =?utf-8?B?VWU2MlNDZEp5a05ldXhmWnFIbFlPUlp5TlNlRGVEWWpxdVVTQVQ0eCt5L1NP?=
 =?utf-8?B?U2hyU2VBSzFjQWVKbENDSFgyeXBnbTdWSFpscnVDRm9pUk4rYUR1NmpTUVVK?=
 =?utf-8?B?M0ZaUEN4cGZTMEVBQStEeGRYbm8wS0V3ZXVCZkJsazR6eGJGY2E4d01QejIr?=
 =?utf-8?B?NHFpUXhYWW5VTG5kTjdlY3FpdTdxWUdmNGR6UzdrcGJVNXNXSmNvRk0wQVNJ?=
 =?utf-8?B?V1IraGJrb3RLb2Rtck5xbVVqLzF5QUdsSjIyREZsOWFBV1cwOVBLbklyWUhP?=
 =?utf-8?B?T0kwbmFVdlpyL3JSVjVoMEszNktjbjVjcE94eUh3MnZEbVJTeXZvN0ZCMGNm?=
 =?utf-8?B?Wk1uVEwvZlE4YnBYMEo3bTN4bXFselk1TmdwQTF4cmFadEljYmxqN2d3d2xv?=
 =?utf-8?B?a1hkSVpIS3lRM0xreXRZbGJkN1NldTB3SWZjdCtKWWhRV0laNHJ5R2xKZVBM?=
 =?utf-8?B?UnEveExzaytSZWw0SzNGWU51UHE5TU9oZmJlUmFtV281MEhiazJUTVBqNWxG?=
 =?utf-8?B?R3dLWldNSjJjKzQxUEViMU5MRkNmWkJ3cjMwT1l6L29jUkdvaXBJTVhGd3Rn?=
 =?utf-8?B?dG1CZTZ3RWxRMHluWlU4KzBqSDZZeThBVG51S1dZM0RCSGtmZ0IxMWNGRFhy?=
 =?utf-8?B?T1dxY1l0OHFOdkk3UW9qd0NiUlVBTkhGTDM1ZHhmekUxMnQxMjFCMVFEZEtr?=
 =?utf-8?B?c1QyMTdUMHhMdWViTXRHQi9GOHZoMUhzRmhqYS9ZRHJSNjgvYVY1cm4xVTJH?=
 =?utf-8?B?TGNIYTA0aXQ2L3UxYnlXUWQ1WHduSDNLY0lwZGM0am9kYUZKaFgwQVB5Tjh5?=
 =?utf-8?B?ZEt4dGU1U1FQRXNFM0xFRU9kdVNSY295RFBwZGd1b1RLV2IraU9DUTdmSllp?=
 =?utf-8?B?Ny8rYVJNd3ZKKzEzanowZFQyN1JSdCs2RXpjZlJ4Unpnc0tGY1gyaE9CVU9O?=
 =?utf-8?B?c1VCMDhkdEpkRkdML21rVXJYc3ZTN2RrNkV2ZkFMOFVxeElnK1lXVUFObkZV?=
 =?utf-8?B?WVdnN0owSmJ0dUhFd0tPK3ZGMXRLVHA5N3FUVnpYeU8yalIwY2VrZElVbUlj?=
 =?utf-8?B?a05ESFNvaTZMTE9aRXZWNWhOcjNXcXora1VWVHJXckU3VnhuY2d5eHFRZVRn?=
 =?utf-8?B?elpTRXcwbGhlWlVTd3Fva20wWFloLzFLOXA0bWZPMnpvZWxQZ01meDdQSHo2?=
 =?utf-8?B?Kzdpbjk3bUl0OTFMRjhmVDBzdVIyVTFxUjVBUWhmYU9ZTUF6YmRkOFJHUGlK?=
 =?utf-8?B?djFvWWFweWpCUndKWTUyMjV0MWMzUDRNR0JoaW52SU5TeE9FZ1VjZzNBTUhP?=
 =?utf-8?B?SFlTZjVqWWFNcm9yWTRtRzlxWXZFb3o3bStQWHZBZUx4RjR2aVZwSEhRVU1O?=
 =?utf-8?B?WTdXd1pEb29Ib2tDdDBjOUd0WWxleXB1ekVvOC9RbU1zcVVRdXZSRkMwZzcx?=
 =?utf-8?B?aUNjNWhpQWlaZXJKZU9XSWRlNm9leTJrenI2bmhkMHorS21IZmpvbnFaY253?=
 =?utf-8?B?VjBkTVRoWGVZeC9ZVm5uVjY3a2xXRlRWNkk3bjRDSHprbGdrdmdnTndEZTky?=
 =?utf-8?B?c1k1MVplY1dhNmI2UElBM016WWI4eldMZ0QyR2RwYjNlZDZqeXQyc3JyR0N4?=
 =?utf-8?B?N2d1UVNFZG9MYWpzVXRhWjFIZktjbkZybENMQ1Nsbm1lbmJqQWV3K3NOZHhm?=
 =?utf-8?B?YW1tWktXTUVIcFg3bmFuWCtGRzdXV3IweVExTHhVSkcvOHpBcEtmTkxUaU1p?=
 =?utf-8?B?WUIwVVZSR21zYzVVc25iVUhpRnFnUG96SlByWFpuZC9zZG93bXdsYWp2aUJo?=
 =?utf-8?B?aEZHVmF0N0sxRnRyRU52MUF5OFR4YTk4dzJWSWY0NXg2Yml4MmdZeWMvVGpi?=
 =?utf-8?B?V082bjlrdXJpd05xQlJIWm5mYkFFS2VlMUlqUjR3YjdMamd3WHo5WS8yOTJY?=
 =?utf-8?B?c0t6bmJoR21jQkdlSmhXV29IZmdKYksrZzRnM0ZYaERnRUQ1UjdiNmdUZzdL?=
 =?utf-8?B?RjNQTDVrSWlGZ1c3MzVUQno5eFV0S2R6RmxkNzFka0laYkFKY2lUWFdXRWdC?=
 =?utf-8?B?YlArdlRBc3BQNlFwdE5YczJodUNQMU5ZQmlseCsySzloN0huVzZuZz09?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb481d79-5c03-4d2c-ede1-08d99772182e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 04:44:13.9591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ineeb8T3nPiJzVWlsVA/oMzVzvT/Dqpc/cFNQSQbnfBnBb3yvyFWsZZczHZiFEcjKooYkAjHsD/g3PE/bKSaaTjRjYLUATbz5//F48hh1ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3943
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/10/2021 13:46, Joel Stanley wrote:
> On Tue, 19 Oct 2021 at 06:02, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
>> authentication fail on each socket.
> 
> These use the gpio-keys API to expose the GPIOs. I think OpenBMC is
> moving away from this abstraction, and instead reading the GPIOs with
> the gpio chardev interface.
> 
Thanks Joel for the review,
Yes, will switch to use gpio chardev interface and will remove these 
gpio-keys defined in next version

>>
>> Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.
>>
>> Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.
> 
> OpenBMC has started a process to document GPIOs that are exposed to
> userspace, initially so a common userspace can be used across
> machines. I like doing it for the additional reason that it provides
> consistency in the naming.
> 
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> 
> If you could take a look at that document and add your GPIOs where
> possible, and then update the device tree.
> 

There is on-going discussion about naming of the RTC voltage sensing 
enable gpio pin in [1], So I'd like to address this change later in 
separate patch when this is settled. Hence, I will remove this changes 
in next version.

[1] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/48018

About the BMC_I2C4_O_EN, this is needed as gpio-hog to make the i2c bus 
accessible at boot time so I will keep this in next version.
In fact, I'm still a bit of confuse if this pin needs a common name as 
it is just to enable the bus access and does not serve for any 
particular common purpose.

Thanks,
- Quan

>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
>> ---
>> v2:
>>    - None
>>
>>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> index 57b0c45a2298..3515d55bd312 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> @@ -86,6 +86,18 @@ S0_cpu_fault {
>>                          linux,code = <ASPEED_GPIO(J, 1)>;
>>                  };
>>
>> +               S0_scp_auth_fail {
>> +                       label = "S0_SCP_AUTH_FAIL";
>> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(J, 2)>;
>> +               };
>> +
>> +               S1_scp_auth_fail {
>> +                       label = "S1_SCP_AUTH_FAIL";
>> +                       gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(Z, 5)>;
>> +               };
>> +
>>                  S1_overtemp {
>>                          label = "S1_OVERTEMP";
>>                          gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
>> @@ -590,7 +602,7 @@ &gpio {
>>          /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
>>          /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
>>                          "OCP_MAIN_PWREN","RESET_BUTTON","","",
>> -       /*S0-S7*/       "","","","","","","","",
>> +       /*S0-S7*/       "","","","","RTC_BAT_SEN_EN","","","",
> 
> I suggest you create a proposal to call this one
> battery-voltage-read-enable. I know that some of the IBM machines
> intend to have this same GPIO.
> 
>>          /*T0-T7*/       "","","","","","","","",
>>          /*U0-U7*/       "","","","","","","","",
>>          /*V0-V7*/       "","","","","","","","",
>> @@ -604,4 +616,11 @@ &gpio {
>>                          "S1_BMC_DDR_ADR","","","","",
>>          /*AC0-AC7*/     "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
>>                          "BMC_OCP_PG";
>> +
>> +       i2c4_o_en {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_I2C4_O_EN";
>> +       };
>>   };
>> --
>> 2.28.0
>>

