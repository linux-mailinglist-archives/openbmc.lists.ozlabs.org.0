Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18B25B4D8
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 21:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhZSt4XBSzDr1Q
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 05:56:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.237.88; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=Ko807yTj; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhZRj2MbVzDqhn
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 05:55:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABxxknDmU0oaTlPeTb0lqTxG9YS0oad5KdEbuwgrJKNuSyrpXqu8YQ8QOsXov774jVZBtvcHTpxKH/dWq2xiNXWmr41KH3AmKoAUEm9yVM1k4ghk4xikOW3d1KJbpILpg2LOe4qtV7ipPznzVGKpc/qqAsibncO/xP3tET8hr+5OhcbIGSkuhZNGXRhxHofcbVMuYc07Gi79UqFJL0p3tZNhavfTNoaUZNwJii1ciyTdQStNOMFY5jBdx7mEOpg/iRV4/HBqO/MQtxo/wX/UgM/Dd7RW1SZv2haJzNTFkZSmJBg2GHF383MUOuBb0Cgr1pVjlKHMs/7qjVDHf9KE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mhu+b53kp/57gIrW1J8Yom/+cBE26o+CUH5kiQxG0qs=;
 b=DZX9eGYyUgd+9pmkCCF+GnS1vUaMEEx7bZfA2y1EgR6c6vXnADWHNF94TqBGCnaAwQbNxzi6zpgXed9WiGegAdnAnveEQkA4qXILIM7E0D6rgHAzqjIofR2qv/Gr0F8GhFf4jy+bU+PNXwdwwxyVt/WPpX+9wgzSboZCVgM5ltQDzmSr2nJyIXvmbEblfLWsw72dgK/hLJBlD9aY+dUqzYooqgx0UNwIEjZ8gbqhepeJRVfd98+AZma398nce7q7w9tMhcDhXD7Nqcr7kpCEhy2o3ml8Eq2Cr2UaoILHdC4eKXGeda/qCluxYM8dwtboo8smqvb8BOwKx1uIxpbimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mhu+b53kp/57gIrW1J8Yom/+cBE26o+CUH5kiQxG0qs=;
 b=Ko807yTjxy/TbZN02n54ke2wIUUioRhsuioRWWrDz3laYvmyZeA9wTC93/eppanR88HMSUSkYRnOCTBQMIliRLfF3wtoqwTmEnbxqIQx+PtHMgwOKCRRzQVUPFh4ywhscBH/4kRMkPnEEdSE69RMWFQQ2Z4TARll+ysAowEjOL4=
Authentication-Results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=amd.com; 
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN6PR12MB2686.namprd12.prod.outlook.com (2603:10b6:805:72::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 19:55:22 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4%6]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 19:55:22 +0000
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: meta-amd repository
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <3e858b31-2547-a114-75f5-4ccd740641d3@amd.com>
Date: Wed, 2 Sep 2020 14:55:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::23) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 DM6PR12CA0010.namprd12.prod.outlook.com (2603:10b6:5:1c0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 19:55:22 +0000
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27c0a6c7-d696-4e6f-516c-08d84f7a208d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2686:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2686782A3CF8E45BA3C9A5C9962F0@SN6PR12MB2686.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbiyo9IilGaTBlftSpg1P7iVEAYQVyW/UT/IiKj+ytNCfyqLbcqPe+anE8ITkS1cOAsR9iqiYKfJsOuZyoXVlbkV49IXn2ZhTx9sZvSTyPW8LmN+xcxc3Of0dAh/eIy1iUEdgVzLYyflBt1tUOlKblLpX+f5QrwLXrwplAlCsRs15CitlURz99bPGJrSjQwOsugOzoRRWuZqegcfIej96KJWwQxrK//NalQOLssK/zS+5NWF6/pnVIZkviTqJfPD6lw3JFwI2uk2x/h1oqYIWnU4qVv5SNrYVUDfWWZccFdPyQOhDuvjqs1CDs3XeLHFaXG1a0owSGhqh0qY0FkAxfZ1Zfm673fgIml5ui+Qui7tEfDKRVYphZ/0K6fa4ScU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(31696002)(4326008)(6486002)(52116002)(16576012)(5660300002)(44832011)(8676002)(478600001)(558084003)(316002)(6916009)(3480700007)(31686004)(2906002)(2616005)(956004)(36756003)(8936002)(26005)(86362001)(186003)(66476007)(66946007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tvnEBQrO7f6v7mSNhW0AKZaoJKjbgOJuik41jswx4d1tkMxXlqMQI2mmwSH9W//OYc8bJQfjs3q4LzaZsa2HU+X5Jk346q1/t0mPsgiXV6k0Vtl8hy5KPB/Qa9KhKqso05JtyyX4LWXJPywzYMsgy1zb5elDar9pvCw3gjXcilkJ/FFWD++Ka/VWmD1yANQeRqQD7kPfc8h3Urjktmnb+2+FTyaevYAamhGQbYukP8St5yLdXtoKAuvmTEEOM5iwPiK172yli9iymoNRz9IJc8NVYTOQfJ2GkL6ADgJv0xQfN3OR48hZKmLOMEgAtGhcHKUk6Srvm0ijRpb7rf2YkKfhZ412jU+V36Y9k+J8hPmaS516HynSNkmDg/H56PXBEl91I8Kp9RbKDYGPsltEOYnggxkys8hshFnTpRkHkpxVh6M7ea2iT/LaIvYSLGANA5CUs8D8LAht932DWaeGqZDWX0oiL/lvg7+r3GixcxXT8Af7rNHAt1LYMkCfuiCpcNt4+q/IdSkhJMf7OXdHEogjSKBzdpRGRcckLQGSnOOqGlWjgU23lxKkLKaf+uqz2/2WPp/ye2Hi6bNV2FM5/VSDLpVyZZnzemwqnbaBa9ePCttfY6+MozuuebvdhIkuUZRFC+ySmnZbto4/P0CkJw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c0a6c7-d696-4e6f-516c-08d84f7a208d
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 19:55:22.4461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKiyaSTtdoHWnbc90hVKzf9a2DuBYDPJRclRDf+Msqx2YIXsYosSGIwynqhx2TerqkZPhlNSFxLMigfRa46WgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2686
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
Cc: bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Please help add meta-amd repsoitory into openbmc as a subtree.
meta-amd repository has been populated with basic bring up code.

Thanks,
Supreeth

