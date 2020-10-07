Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41E28615B
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 16:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5xmb1MNjzDqQF
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 01:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-mw2-obe.outbound.protection.outlook.com
 (client-ip=40.107.244.82; helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=H0wEVh/2; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5xlb3LkbzDqNP
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 01:38:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VblYKm9CNVVrqEWT+8lV3XqsssU6ofZJ5ATTjYteMo4K7uikzJND28Ml1vmaP66VsKHFFvKxsGON0RliZNe9+jEUQ3BRdXjJ+zzhG/YKY3p2FTHyNJ0wr9rwS5q0+/L6orbr7A2NuftOIYlvvo/F2TdEUnd8kQV1A6JkDHzOyquan4r6E+ws1YwBp6sO7c8WiALs0uqSSU/NPajfep95AFsBgOJZgQEOQsYUsBUojYHkn2yz3RjMe4ld1L7OzNZmXWxWyiYkOzurpADx3V5+cjQstA5Pm3JJxx+0Q7qxgLB6u83wtKLcVLZjN7lh333ltoyiR+qCmGnLNlgqFnRfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYJQEfrd0ruCPMYTcl+nntOnHbESJ5NHs+FqZYXdWU=;
 b=RYQ5Oozfel73CqEXZn2Awp4tXm5+W5r/YSxldBLlQ0MftniVmK3ni9+Fq7VGI8jVOQmqy6bxNhSKPNInZabxaBqoAiHJ31FtHXUJT7MI6DX0isQNp1ep2vDEGznbO8GJG074nDpjSUU+BW5zhkPyO9XMifUo2n59wbzdr0Th90UEEs/ye95PcBGhTOBsdEy7qX+gRfUKEe3mCMEf4yyVCFNjbeIeAsTI9uoLZIpTouqia9Smt1SAdfkNxDYAfcPlKPzGOumv6ZGgO69FkNx93D1LewO9V/6ORZ/6zxIqGJ7+JInyaHFGvN/9ZGM29ayqGjBKrRoC+9ZV08rOEnH/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYJQEfrd0ruCPMYTcl+nntOnHbESJ5NHs+FqZYXdWU=;
 b=H0wEVh/2FpG5VFtC9GGV3FrlVIbQinCaie1XNbsfQsYCFrrOdXf4gP/4uqHOrYVMEv5dTgoOABDdqkC+8A6CO1U2OLFCq69tZ9Q9poxGbaZgux/uEvNMvPSxecsNzPOhyexVacIGHQSQmzoV/TZ6Un3UNmRqbWxv6JBpPt1tCCk=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Wed, 7 Oct
 2020 14:38:06 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805%7]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 14:38:06 +0000
Subject: Re: build error in AMD Ethanolx
To: J Dhanasekar <jdhanasekar@velankanigroup.com>, openbmc@lists.ozlabs.org
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
Date: Wed, 7 Oct 2020 09:38:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0201CA0031.namprd02.prod.outlook.com
 (2603:10b6:803:2e::17) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.21.55] (165.204.77.1) by
 SN4PR0201CA0031.namprd02.prod.outlook.com (2603:10b6:803:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 14:38:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cbecffc6-0fbf-4336-9784-08d86ace9a81
X-MS-TrafficTypeDiagnostic: SA0PR12MB4575:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4575652E5911C721EAA9EC49960A0@SA0PR12MB4575.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDYwCw3RQnwk+fHcsWb+DE8wIY9SiyMpZ20xubBQZGOtFrMSa9+F/6UElE2JwubvTCHcrAvTkjTOPZrLTtpemzRgaRHqllsGS/kfGqlMoRDxxNAtNvlS081EHyNxtzxvjO3FajXgjwbfuDIKK1PTNEUUoWVz++sN5h+e+PRqdSUxm8puEFFqV0eka2KlhBiVrNJsql2Foz6RiK03BvO5mqP9gnUAW+pDPtyap0Kka3W2rz2LQ3v9KPQW09WJfqLwZj0GVXT56heNnyAiWvsgznUuqHKp+XMt7xbgyFklNR4YPja0MINbQR5fnA12g+zRlZBmG//pPKERvaY2EMhn3BAuFdN5kz3r+cvVCh71ks0q7Y3swjzMb055kccsOCHr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(31686004)(31696002)(16576012)(316002)(478600001)(2616005)(956004)(86362001)(16526019)(8676002)(83380400001)(53546011)(8936002)(52116002)(26005)(186003)(5660300002)(36756003)(6486002)(2906002)(44832011)(66556008)(66946007)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WHgRHb/ZqQZuwh1oHNIhm7yoXOryqktK9Mt2YZqKiDG+sFNRJBAAyWiG8YcDXbrmezAzEBt1wXykDA65EY2BasrPQq/hjbsZMISeuWdq+XAHOMxVaZzmzdCSFZc8IXADVDKUl9lKn3egbO5ko8Byl8TtTJDne0s8xFDkYsRRfViqNylBb5v4vG7x+PwCgKaglhy/qoKG2TiTlH3IqIYE7upgEk8zvp8+I6+Fj0LjCjmXWu/t+GNMViSkZFssgyOhi6PiImAouoL50EfjauIYRAEtV0ZgfRF7OTGhJivZykkSzzfAtQXEXX/oL82lZUeiwHzrjWgl9D6i1bqyUt2bNioKhi7hgxJhyAUa8iBJi25V8vvAjq22lIwq60RAfho+RZt5d45kto7wEplESb3ufpNTCvnblwkbTuTqgOqlDKRV3G80VeyZomVAnNb6FdyVLJRdN0nHYtdRBqQ9iNROKFDFtxxK7kukQcw25JZnTQg/gXM69Tbr1sQoEu9dvar83MeiajKkOsC6MqEEF0VXO9PQyVtMxhhfSz6G1I7x9NE+zCc88NVMUMUPVzOIozyKVLK68/M1wNetxtzqaZTAHfxumq7/DmhzbbQ0isnhqrpLHX+gKSX+Lf7JHOFTK3Gmfifx+xYcFEf2g+wSFJzt0Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbecffc6-0fbf-4336-9784-08d86ace9a81
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 14:38:06.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/3pNlwvz7JB6VnKIro9FxopDmLNxXXVOZ0thkGnp97vi+p65Fd/jEbRjfRQICRvgmXw9kFTb3KqOffemf8lJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4575
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

On 10/7/20 5:44 AM, J Dhanasekar wrote:
> [CAUTION: External Email]
> Hi openBMC,
Hi Dhanasekar

> 
> I am working to build BMC for AMD Ethanolx platform, 
Nice to hear.
> 
> After running  *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,
> I am getting below error,
> 
> ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'update_gio_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
> ERROR: Logfile of failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
> ERROR: Task (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs) failed with exit code '1'
> 
Can you send me the complete build logs?

> Please help me to fix the error,
rm the build folder and retry once. 
I will build it once today as well and confirm. It may not been tested with latest upstream changes.

> 
> Thanks,
> Dhanasekar,
