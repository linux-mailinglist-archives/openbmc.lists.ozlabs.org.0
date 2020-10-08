Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D42287597
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 16:03:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Xx444VdzDqTj
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 01:03:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.237.87; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=4JsT2x87; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Xv75xyZzDqT9
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 01:01:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsCw7X2t3JASWedi0E9Mech0IIWzguqBia8OZrI2xRRXPkx/A7her6t1wcl5VPdraoZbwdx9srBiE7fbSt2a6e4PohDP29K2a/f3zFu+b0+O4nzcekcDdqtiyW2taouo0Y3G/YhSx1uk18ev6AJbLfo0HV4ZvenxbxMhNHI3KUCfBg+t2WZr0Qbuamwcx6O5A7nvXEglVolS2fX0fEHsKw8m6yNyAC7KhfOeayKHrngcRuha8tK9W+uTSRrZZZI+DxztpK2UDb1zjMEoGk2a3+vbNBHwygd5aqYAP8OcxOomspACBHUbdgK9ab6nCXDqUooNJ3Mg2kleHMgqxwZBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR072Xs5EjC4f9veh+UICbcBXkhteFnh61F/DFrWURc=;
 b=MGXRf5oYEh9BEO976DBxSulR5/kkLznbNnjrx/cpScCv27wlmU6g4RCgMJWlVhgb8RSjvNelOne/0oyKiSJQbx+FEQaDqP/h/HW72Qv+s39Mb3PZDvHIpjy1wS3WxRz6DORxfioMRGbJEN0GDGiROL26OfbUwfuPcYuS1Onx8VnRITXJoJQdIome5H6hJYPh64bILmAgac9QJls4ayu6gcXDzPLZ8gatsIHGVvj5SBrBD9YvFsmB5tu+i9PsVxqusCnlt1jrrK0tByX2vtf+43qRR/wqkdfe6gdisYg3/FPYff2JgSO4FbU+pUmQVRN4RMKy/J5WjyfNtw0Iqyd6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR072Xs5EjC4f9veh+UICbcBXkhteFnh61F/DFrWURc=;
 b=4JsT2x87IYZimCl73Va/x6xhCVAv6CEHGywtPnZK4/GlExb4zrlofb4v3WMM+aWhzcs7uR21jEHYuiZEbSG+zaTGU8UayQesqy5PDznbaNm86i7TUnNT8tXKZRU6/A5oqRzPlMAN80W9S2TYczqrRq6O2W46D94XTjdNxtjVrcM=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 14:01:46 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805%7]) with mapi id 15.20.3455.024; Thu, 8 Oct 2020
 14:01:46 +0000
Subject: Re: build error in AMD Ethanolx
To: J Dhanasekar <jdhanasekar@velankanigroup.com>,
 Anton Kachalov <rnouse@google.com>
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
 <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
Date: Thu, 8 Oct 2020 09:01:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0501CA0044.namprd05.prod.outlook.com
 (2603:10b6:803:41::21) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.21.55] (165.204.77.1) by
 SN4PR0501CA0044.namprd05.prod.outlook.com (2603:10b6:803:41::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend
 Transport; Thu, 8 Oct 2020 14:01:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16060de7-e87a-48c6-4f1c-08d86b92b196
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448F8C7FD87F82569C37D8F960B0@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kW5gDs5bvftt/x5QQi7FsAs6fwbpkyZvClpn6ZkRksnoM3WlApkBGmfyCbJpalwDQOh9Fdjpcv6swSGuFe8TdsstzvdI9DJc3YM8G5drMA92hn8R2kT4xLIe036jwD+6zznjfElYxRKUhreTp7zIPM3KPD6Zj5WZoCG0lJD0K4ZZ7gsh6gyeE2Zht7f5nnByoBXvu9LXhtxMOW7+HxgAk8RRClxNGqpW09noS5eEHZXZgbkyLsGOb8PQkjqBDx4Hgc3HcPQbzG6CwcQgSgT0Qqaraj9F/8w9BNkNFWGolmY4I5iIFdNHhrbU/IxFVFOKaykhLPpecKtUm05kw5n/TVhmqCdmF7f4T0vTk/z8xemJ0VewGPRTPCgp20FyBnMT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(53546011)(16576012)(8936002)(2906002)(478600001)(316002)(8676002)(44832011)(6486002)(86362001)(36756003)(83380400001)(110136005)(52116002)(31696002)(956004)(26005)(186003)(16526019)(5660300002)(66476007)(66946007)(4326008)(31686004)(66556008)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cnoXZwFbRJ0xs8/TaZrDml0POYybr+bTUiCe8el3AKDQntlG19STz1JLSZUCaIUlNZUBYQrA5W+/c9bq+sZgqQG30rOGk+JUueblLBY+n855mCg7kAxbVg02GDQQUbHasQf+VSg7EDaPm70yCqfvE7PmChLRY+1Ol9+TWzEltS0Uwc2UmIo4oIFUAnAZck0bbdkTh2d4qYxiMF7FHxcvC+miT73zjdINVlV4/6UojFpc8uYs5cEUUD74etcWuhWXVKbRNNO8aFsDPIddk98d86ASBDNIEH1wVP+oTTQyip05MQO+jHH+09eH6Y1ptUxuTkBk+I0etwOWsuoppLGSFnlf8dZ5EYGYrqJYLZ5OREZMGOS61nc5+Hei+Xhlf8Jg6/VRZfsbmxWXUZTaDU929bIupEjnIiopzWN+ss5H86hRkQuCBsZaBn28WdZVZ2V75eyrOqEeld8lnFr334e5OfN+WSOiN0UqfYk6GUYVaTHsJvF07V/AleYpeYP/7Nvop3bzyOaz+CEhN6+JegClz9AV8FbJBcn/zQk3ZkY+Bplwv3OlIYq2K9+XLnBVaoi7B8XDLO34YuhCMuQo6vUJ79xKw9WRgAhH0uUcfK/fcF4OzxwH2sAaR/U3ipMARmU2wFtrJwnU9RNJNxlGQRIpHw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16060de7-e87a-48c6-4f1c-08d86b92b196
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 14:01:46.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgkU4/d8DpzcwafxfcO30AMU9q77T+iBq9863JxPrFO7pDPxoCWMwOxJzUbF/Ec4lUUA82vD/zIrh4V/18XI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

On 10/8/20 1:02 AM, J Dhanasekar wrote:
> [CAUTION: External Email]
> Hi Supreeth,
> 
> I was able to build the AMD Ethanolx source successfully. I have executed your mentioned commands only,
> 
> *. setup ethanolx
> bitbake obmc-phosphor-image  *
> 
> I built the code in normal user privilege, not root user. 
> Thanks for your support.
Thanks for letting me know.
> 
> Do you have a linux DTS  for BMC of DaytonaCRB ?.
Unfortunately, we are not supporting Daytona CRB yet, but we are working towards enabling OpenBMC on Daytona soon. Stay tuned.

> 
> -Dhanasekar
> 
> On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov <rnouse@google.com <mailto:rnouse@google.com>> wrote:
> 
>     Hey,
> 
>     would you mind to find the *log.do_rootfs* file for obmc-phosphor-initramfs under build/tmp/work. This task has failed.
> 
>     For instance, on qemuarm target the path looks like this (for obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):
> 
>     build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_rootfs
> 
>     On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh <supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>> wrote:
> 
>         On 10/7/20 10:11 AM, J Dhanasekar wrote:
>         > [CAUTION: External Email]
>         > Hi Supreeth,
>         >
>         > Thanks for the reply,
>         >
>         > I have attached the complete error log. Please view it. 
>         >
>         > I have removed the build folder and created a new one twice. Still I am seeing the same error.
>         This may be environment issue in your setup.
>         I am not seeing this error in my environment with the latest master.
> 
>         . setup ethanolx
>         bitbake bitbake obmc-phosphor-image
> 
> 
>         "WARNING: Host distribution "ubuntu-18.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
>         NOTE: Resolving any missing task queue dependencies
> 
>         Build Configuration:
>         BB_VERSION           = "1.47.0"
>         BUILD_SYS            = "x86_64-linux"
>         NATIVELSBSTRING      = "ubuntu-18.04"
>         TARGET_SYS           = "arm-openbmc-linux-gnueabi"
>         MACHINE              = "ethanolx"
>         DISTRO               = "openbmc-phosphor"
>         DISTRO_VERSION       = "0.1.0"
>         TUNE_FEATURES        = "arm thumb arm1176jzs"
>         TARGET_FPU           = "soft"
>         meta                 
>         meta-oe             
>         meta-networking     
>         meta-perl           
>         meta-python         
>         meta-phosphor       
>         meta-aspeed         
>         meta-amd             
>         meta-ethanolx        = "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""
> 
>         ....
>         ....
>         ....
> 
>         NOTE: Running task 4241 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_image_complete)
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Started
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Succeeded
>         NOTE: Running task 4242 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_populate_lic_deploy)
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Started
>         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Succeeded
>         NOTE: Running noexec task 4243 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_build)
>         NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn't need to be rerun and all succeeded."
>         >
>         > Thanks,
>         > Dhanasekar
>         >
>         > On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh <supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com> <mailto:supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>>> wrote:
>         >
>         >     On 10/7/20 5:44 AM, J Dhanasekar wrote:
>         >     > [CAUTION: External Email]
>         >     > Hi openBMC,
>         >     Hi Dhanasekar
>         >
>         >     >
>         >     > I am working to build BMC for AMD Ethanolx platform,
>         >     Nice to hear.
>         >     >
>         >     > After running  *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,
>         >     > I am getting below error,
>         >     >
>         >     > ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'update_gio_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
>         >     > ERROR: Logfile of failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
>         >     > ERROR: Task (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs) failed with exit code '1'
>         >     >
>         >     Can you send me the complete build logs?
>         >
>         >     > Please help me to fix the error,
>         >     rm the build folder and retry once.
>         >     I will build it once today as well and confirm. It may not been tested with latest upstream changes.
>         >
>         >     >
>         >     > Thanks,
>         >     > Dhanasekar,
>         >
> 
