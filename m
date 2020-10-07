Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8238128676E
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 20:35:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C631l3LvyzDqQj
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 05:35:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-dm6-obe.outbound.protection.outlook.com
 (client-ip=40.107.223.81; helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=iR4oiQPi; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C630l4vDpzDqP9
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 05:35:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJT9S0SQFgXmJlp3yP9z9siPoqNnzYZ1Qcfm1JA+cclcQHAgJPlfDjdth5SZTxqlhGmB1PtGy9ia+R6R969hRyLPbriENZ/6S91QAIeesNcPrdN3pnu6XUSxI7vpvjOix0EchRMnQ/OYZg2TPVJA2mD81GH6ZcTrJcSZ90k7f6dSRVH74tSKtk8QMqq1t6XuxhepKmW+f9tuhwvUEbG9DIrdujHFuEHITCLTkxu1vySyTf/SM9UDFsnHZHHJa7Q0Il5F013Il6FFH1DxlSorsG5+09LhNu5plOIWjP1wCXQuUH/Hcn/ZDOJMWXczxYLz0glXL7dcSRpiwz+XErqZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xySJvDOL3MMo/zOeDe1aruPbGKEcL6wn2JTamvx1+8=;
 b=M/emdOLMnV4ZQf0k30wM69jJlZHuc6KDj8IztgIJPn2A/BCclq9DdazpfTD4W4G5tELUfadFMAgDOaxEQJWD5WReY+gBW8LCfklA9qH/jrsPNU6w0y8qRGNgRMMNalIkj6fulhWFE0gtQu8mgnl4ZYEUPnEInVjIuGJn1Qb6zg1+MkdOIhFMZIP9+bt3ssgDCAhwU/RU6odqNFt3z9eKe2KjgtzH1DzrEKnRtdak9B9t411rNRhC9iFHoLQGjBTVZFimfGbgho24Q9M0kZDWmRmB2o9i8Kw9aCEd2/EjpYEtHQg1z6tFKi4afw3bzkYe6mIw9E1PTwojL5HQmadLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xySJvDOL3MMo/zOeDe1aruPbGKEcL6wn2JTamvx1+8=;
 b=iR4oiQPi3joKYBd9RuVNzwORCU3fNaIX6d67ydTu0+WOJbNPVUSTbkH+svwe9FyUZ469UAqiYkgweDJrhKQILiUVCVURet8vItRijnFSw0btZ45jnM8fCj7ipYy/5cvjwEkJyOfSAj8UEMnC9ufDQmQjkG+HThJGjjNdoBav/Js=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 18:34:55 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::10c4:c28f:2a60:c805%7]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 18:34:55 +0000
Subject: Re: build error in AMD Ethanolx
To: J Dhanasekar <jdhanasekar@velankanigroup.com>
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
Date: Wed, 7 Oct 2020 13:34:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0701CA0028.namprd07.prod.outlook.com
 (2603:10b6:803:2d::29) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.21.55] (165.204.77.1) by
 SN4PR0701CA0028.namprd07.prod.outlook.com (2603:10b6:803:2d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 18:34:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8d6ef49-de67-4aa6-2aa2-08d86aefafb2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45743C08FE040257B3BB7E5D960A0@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: patlP0jZqQ4WYlsEQFnuIuBQbujn5jpggADsObOU7omf0wGMTUckOxy0zF+YAWL9nQBjSOulwkmNTd/C/s1m0pU36GwQbcM9MCF7J1DffBCdMjSmROaCYTo3Hk5lpNjZThqrxzQFY7/vVE27kVnf4zMjuHOAE6mHJ0l3Z9BQvVbxPllhAjy4kj6Lv3vDAai40GcZRyB2vJb5QeAaE0eJoRMO7qtg2CqtZeyckT9wSHdzaMJqOBsJ+0EcGw9sOHPF9ZHeZAKZK+qLTmHlUtLIyuyJYbYwVxOlOAtxVaSrMHZa/BSHr0t0t7WBs3AJtWrtqJ42CKOCKTC3ULnJ0IiExPAZ15PCfE/5pzVPIqRUKtI87cNPBx4iXg7WlAAhnfuB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(26005)(186003)(16526019)(2616005)(44832011)(5660300002)(2906002)(52116002)(16576012)(83380400001)(316002)(53546011)(956004)(66476007)(66946007)(66556008)(4326008)(478600001)(36756003)(86362001)(31696002)(8676002)(6916009)(6486002)(31686004)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hkgD8MU1Eq+e/4R54V0uLz7U1FMU75ziWOA0oSjZ9vx/eEt5ZA+mTEvG91EJNzii2AHE5r85LWUNHzm9SIeYfviL7yIyxHcL8783hcnwNJyoGAJbRFP77WCxqJXGo9Jb9K02nQ0AYzPkYNDx1yg0ejv2cG2TVlX5PLyB1rL7KJuHt1/J/RRPX3qjhVdvB+eLde45sjNTspRSpk64YcKHh9E8dHd26M599rLxucrEMLfofOtrbJG0QeUUe9WMdtzCHL3U/q7OZ1GpvYe4vgK5ZfMrNXmGH9nL3zDCLbCszYiQO4eXjOTmJfBhmskQwjv8geUQa8g68Q9RwRLnksSfYVlxd/0YMIa6yzC3UiYeRdWURyayrCK54o3uaUe6FK2Cui9qtTSxf5bKp+AsVs3ggBhBP5LQsMbsY3zgbWHkZD78u44+xO8SaL1YwQDE2mS5PKq4Hu/uacc7AMgYAb/IKywMV7dxXOp/rwecXmpQlOr0HxtlMpxmwo13O89cXJ8ERq5hKMZstylmAUXcvM/EkbowczoyJaAOZwzDFp07JTzcvIRaSOsmy8b2g0cfLVNd+HI1qCDbf7VdGtua/ArnP+uvugtMEsRo90AM6yw2oyHtg/nRBHpmTE7D2lwZ3t1qlHq4VR9+Dr91uiZQfeWlhA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d6ef49-de67-4aa6-2aa2-08d86aefafb2
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 18:34:55.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFgh+D5Mx9sMxOhbB1rc3rpd0jSyCyg+UX6gNL8VE/aSW8Al9HHu07Zu7vZXFHcea4xVQ0u6zRCphLrT0lcGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/7/20 10:11 AM, J Dhanasekar wrote:
> [CAUTION: External Email]
> Hi Supreeth,
> 
> Thanks for the reply,
> 
> I have attached the complete error log. Please view it. 
> 
> I have removed the build folder and created a new one twice. Still I am seeing the same error.
This may be environment issue in your setup.
I am not seeing this error in my environment with the latest master.

. setup ethanolx
bitbake bitbake obmc-phosphor-image


"WARNING: Host distribution "ubuntu-18.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-18.04"
TARGET_SYS           = "arm-openbmc-linux-gnueabi"
MACHINE              = "ethanolx"
DISTRO               = "openbmc-phosphor"
DISTRO_VERSION       = "0.1.0"
TUNE_FEATURES        = "arm thumb arm1176jzs"
TARGET_FPU           = "soft"
meta                 
meta-oe              
meta-networking      
meta-perl            
meta-python          
meta-phosphor        
meta-aspeed          
meta-amd             
meta-ethanolx        = "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""

....
....
....

NOTE: Running task 4241 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_image_complete)
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Started
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Succeeded
NOTE: Running task 4242 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_populate_lic_deploy)
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Started
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Succeeded
NOTE: Running noexec task 4243 of 4243 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_build)
NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn't need to be rerun and all succeeded."
> 
> Thanks,
> Dhanasekar
> 
> On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh <supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>> wrote:
> 
>     On 10/7/20 5:44 AM, J Dhanasekar wrote:
>     > [CAUTION: External Email]
>     > Hi openBMC,
>     Hi Dhanasekar
> 
>     >
>     > I am working to build BMC for AMD Ethanolx platform,
>     Nice to hear.
>     >
>     > After running  *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,
>     > I am getting below error,
>     >
>     > ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook 'update_gio_module_cache' failed, details in /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
>     > ERROR: Logfile of failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
>     > ERROR: Task (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs) failed with exit code '1'
>     >
>     Can you send me the complete build logs?
> 
>     > Please help me to fix the error,
>     rm the build folder and retry once.
>     I will build it once today as well and confirm. It may not been tested with latest upstream changes.
> 
>     >
>     > Thanks,
>     > Dhanasekar,
> 
