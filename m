Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363444A7E8
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 08:53:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpKxJ2H7mz2yK3
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 18:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=GtGd4Kx3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=2a01:111:f403:7004::816;
 helo=aus01-me3-obe.outbound.protection.outlook.com;
 envelope-from=dehuitan1988@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=GtGd4Kx3; 
 dkim-atps=neutral
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn20816.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::816])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpKwp5C8jz2yZ6
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 18:53:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGRs2m5A5PrqrowYgl+5/B6yprq1QkdmaTF1YEctOcsAeA0V4nJQHBxkZ5IhwZBMc3uvUPa8GhYYJY8HgOYyKuQrnCxB4ODC+4oE494w3bFO7MKVFdEdwdF6J5Fl0rxpMZUwnoYLBLU96t9TsM4yVmVVs7REfQJj7+OPSRs+8BQHSHqfjkj5egMUezKLCEabnJiJ7m8OxdyRAqVLx5WyZCMq7sTWssircdxuI6bONi/xC6xODcg40aB5aMiQ0aJUgTZ+QzxghKaLQW0Qj0EkF3VPED0/YycJed8XZKMlMlvvnahF/YfjBTGa0I6jRcCxWXLJ2pWoEaPqyjWlcaYiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZEIHKm5RX6KrD3fpT2eq5ybMGvgzMj639IxaI/8sn4=;
 b=O3deTsQu8MdBOUl6iI/RbIQ3++Zgl/1VOaCDjuA6GNY0JrnEotwldHYIE13PIWl6nlt2/D/a7uw837TAsY3bhLRGOpO9o6Anqzh0uUrUxuzJXvOR0s1s4OGZiwp4dBI89Usb/6CEtwIoX1O0IF2U0bHaVPFvy21pMoUWqApD/UIA2Ny6AVXkaaw99JzvaX8EWXCz5IwhdAbaY0IQUUrL51S+IOjUKFnJXf9nMb0O/+ys8jV8N/Nrlj6WwAsTmX1L6zQ98blkWNf6U9IGGYnwTUC2vFIeYdbjtPXfUvAMijKRJr69FExE0I7pHR5vTP2fN0PSEsvV7zRLHUxp4WvmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZEIHKm5RX6KrD3fpT2eq5ybMGvgzMj639IxaI/8sn4=;
 b=GtGd4Kx3YfvT0JAswTBmdTVSFLKMrkEXnUmraodSc55LVJuxUtOXHM9USJY6II6JLj+NJSYnm6hb585gj21AnqjFHNC0/f2pMisKVg9GJgpa82HXc4E24Ce8o0HW0PYdHRnEnt6jkFTMWOHS0VVLpah6LQoALwPiMn/kG70w/wvsHrAjPb223u9tXJu1kH+8IP4YP0Z4sONIlXhxc7XaiU2iIvn1TEXuWArQwq3soOODygmLNgdpDix0vpzuVB8aPLrWOkVkoSEQTbhlnhfJJPsXFjuW1RPJhzI6Vp5w5Jk1a6/r7SSZu0cg0chdSIpeHxhSQH8yEzvGcCD2XdIYnA==
Received: from ME3PR01MB8081.ausprd01.prod.outlook.com (2603:10c6:220:1bf::14)
 by ME3PR01MB7821.ausprd01.prod.outlook.com (2603:10c6:220:136::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 07:53:10 +0000
Received: from ME3PR01MB8081.ausprd01.prod.outlook.com
 ([fe80::f0eb:e25c:5384:13a5]) by ME3PR01MB8081.ausprd01.prod.outlook.com
 ([fe80::f0eb:e25c:5384:13a5%4]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 07:53:10 +0000
To: openbmc@lists.ozlabs.org
From: tandehui <dehuitan1988@hotmail.com>
Subject: ARM aarch64 confuse
Message-ID: <ME3PR01MB808110CCBC2434149E0265F8C9929@ME3PR01MB8081.ausprd01.prod.outlook.com>
Date: Tue, 9 Nov 2021 15:53:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TMN: [ogePY78I8Bn2cTmGP+j5WuIlGVZwcD+3]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To ME3PR01MB8081.ausprd01.prod.outlook.com
 (2603:10c6:220:1bf::14)
X-Microsoft-Original-Message-ID: <70b066ec-0b3d-3ea9-9a9f-d81b2e61eff1@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.2.15] (175.9.143.91) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:53:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8ca4260-ac32-4831-1be6-08d9a355f973
X-MS-TrafficTypeDiagnostic: ME3PR01MB7821:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugpnGA7xhvz1II7KLSlUSSbBSEzAg4bsiiw6e/uwUgoaQu+ruqc9Dti4kg0u62luNdFxeALwnCca0UBDVfGTvjgv5mSn8Owh8CXArmzNP9qdWdVOZICur0i+XSZw2qcNQLXF6TAabz73PZNQWLmDhn44ucG3BekgN/nLsOfJc9767Zth4g2Lryuhr84UcNeWjPnE3boOrTyvmG8lT+b0sgpB/GL3XMBs6HiHjg9jDZ6/Pl/HmJlZlLGh1i0JbEx+uUw5Wyi95KVjZ9vPeFAxkgS2w7ciSTSSXU3JTmCGM42JMsG+vryMc6g/z3bxFKocxV260/Nc8VmGZHGtRXlorm1KLms7zLNqwF7/cCLzEgi7xIRMD66VDIpTzem/89MlMIoMXeQNR3U6vwBeXMXjbLB4RVKv7hswHCa7a0vmiZg5OduGoNfJR6Ioh3GQjuTnPyFEeADuM7oN/N3p4JGdH0Dgy7GoeGW4j0l+JvrFoe38o3m02fPHjZRHGM5YoiqUPkZxKTwLfHbh7JHRZa2lNbccn94PGEoLv8psgIj5MLQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jlJmlMVn3wUu7qMFARMCqoZ7goraiauRowr4mfcf/4ErnkNIUZ9lBaTtkz/u1sbFSsuKLW4hSK1q3HPG2GHltup/9WZUAkinqiqC9hi8XtijdjuxD+UtBKerrAvg346Yr6MtclTCuJ0pV6qSa37YxmX2GeybGzxi4yMmiwwnsMegyurZJYg10TjXBL4nwW/oUdV51QbS90srwKZkNaW1tcBjdOda2a4ljDTxW6DJBtvwkOzTOmbWuHIIn4w2yjU+mDnNpGYgNHnrSzitbrU7IwI3h9QznSc55RBk/qb0EIMuI3nNeBfz+uRguBRnWhuGE017jfaowa0pBVq6ZxOKdVwCVELAdZ2E8EpjsfBYlGwx6HTYSAhAuEPrbvh9yZp2Wtds9eGuUBbWG2r5kK5uBck4kWCzE98Fs+JOcYqkWkr1PNETv/L2YgeyGg1kznBCBrD57y/gXkr+7ehpNrPFrkjZnKvzdVouk67Es0FuEXUBa+1RSNHUozJ4t5+9ls9SGMXC9TkE0m53kPXoMOQgCGyjem5IUi23knt5s1TKs+PDHEaqv4Gvz8fy06gX6jVP0qg7P+dqXlZvSTiJK8AbQsab2wh40/aw5ql7R40JvCNIwktjIeuU/sXKla+Qvrur5+9mvB+C9eZfbilfcKSdmOyAlvG4DfvuwWP15729/oy2v+iFTPh6rsuRkwFL/kz1
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-adb55.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ca4260-ac32-4831-1be6-08d9a355f973
X-MS-Exchange-CrossTenant-AuthSource: ME3PR01MB8081.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:53:10.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB7821
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

Hello,

            I am running openbmc on a ARM aarch64 cpu. I'm experiencing 
some webui-related issues that seem to be related to 64-bit processors.

So does OpenBMC support 64-bit processors? If yes, what special 
attention should be paid to it?

           Best wishes, thanks!

