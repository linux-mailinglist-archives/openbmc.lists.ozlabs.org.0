Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19D3ED31B
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 13:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpBs71dFsz3bTC
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 21:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=LX8Oqs0U;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=X/Gq9Z/u;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CzwbKZpO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=LX8Oqs0U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=X/Gq9Z/u; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=CzwbKZpO; dkim-atps=neutral
X-Greylist: delayed 6727 seconds by postgrey-1.36 at boromir;
 Mon, 16 Aug 2021 21:33:58 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpBrQ6lMDz30Hv;
 Mon, 16 Aug 2021 21:33:57 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G9eb3E018495; Mon, 16 Aug 2021 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=sVOvBm41+sIPs+kjXvjFXcWmwYIaEUuhb1sLlI8SQhg=;
 b=LX8Oqs0U51BaQilfnP0sjRPDc5iaxDosypQstPIq8s0ZOFon9Ws1AU9vG+UAo8y+mr0B
 NbNwgFLOJ+aH/PbAnZnotJ3SfzzHdtAGV6JhakRxTIw9NgCNaMjjVne6uzHlCVgWs5WS
 IQscqxbYKgnpXrB9GmzTCVnmpFvOgcrHDy/c9buhLIQTIqpu+vpSAgd3mr7bXhA78Arf
 +8dGMoTOXKFBBeMtKXLGfK8Xc4O2FUdoUVGEZsNUjZDcCZwpaHb1Xic/POMW2KuDh6me
 Ze1te7YFoyglU88Gg4IrnYlsuJPis8/3HWPg8aBEjJ4VzuP8ndEf3MmFiAab+fyt39Zb 9g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=sVOvBm41+sIPs+kjXvjFXcWmwYIaEUuhb1sLlI8SQhg=;
 b=X/Gq9Z/ubPSH2sMGtn69WMXWIZR3P01IlGvlr16flCr9djCMxSYmpyTl6Vuc5ZdSl/NV
 qCdifZc7os4RZl8SGSzkRjQZKRE/irQQuY4Fgvli0h90hQ6a5pTO5hIvZQ8Jkl5cT/G6
 hX0OJdLAWzJbC2djXKgf6zTrP7EEqhozsMs+GUQwuGVplnkDSlUD2a7Nod3BJEruEDLD
 XxGykE/6no2IYF1tPXJ8Fs6zOGkhPqdzwKJzE5h6keRVcNM9ZXjKybgnE54sE4smzTca
 lbmAKABZUAdzyzs5AlKE2C+i33fATZz8tREJ/pFX4MweiPxYIonrUHvSpk6R5v7bThYe Vg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af83019gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 09:41:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17G9YqUr055440;
 Mon, 16 Aug 2021 09:41:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3020.oracle.com with ESMTP id 3aeqkrutb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 09:41:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLbm62P8KRbMWuc8mcr+V1OYkHRUemcT4NDS+Gv9da2qALhElY59771M+0dPXUHgznD9X/ndkQr/J1JD9Qqeo2ZTVJMtbI+bzOUumEPsHLVlFl/qCcp5XCNsQMcrEN3JlLJ2Nmyg/5/9HInNAlvoSoef2TsDcoi/f4DHkQEqruhdlUmEsbMOzdia+LncwHAX+CUdTisXMwwmslmTzTW9ED4vCug+S34+Ro+/UFLvvE/XZafNItjPm2dSz1A4vM4mhMgjpgAwT0b2ctrK4LzXWUznjQuwpC2RToQE+N80ssisXwD3lPH0Gn6KNkAsJPWsNAgPqvXJ4gqq1DPXMgH4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVOvBm41+sIPs+kjXvjFXcWmwYIaEUuhb1sLlI8SQhg=;
 b=blXkuOVyQ6XCjUJ/pAv563neklbnLFfP6rEV+riTy3/WtAtu029NBg4Ob8U3pzoJ90O6ukKPW2kZjzOTzGPCaGX4hzZOkUQO/llMxuDJhWEzQte7NxB72/G3jNo4gpi07NK/o4WAmAXhSRcstGlrbejGov+f6nauYb3Ss07xHoJiDEUa0nCxdXHeyPJtQVRCdeB/G2ZxtF7Ks/N/GfbTA3635V+vSsi3z8Rj+Y8qbk3Kowvm5x3QaOOFyS6es5cRWoEL7se6mqV4NMz/uwTqVM1If5KX5G6oR1mK5LJDWF44yQIjQUtU+mzcEU7r6SxOGf58yjhMtCdE7B0GqlMkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVOvBm41+sIPs+kjXvjFXcWmwYIaEUuhb1sLlI8SQhg=;
 b=CzwbKZpO87bXyulZXJnqZAIUML7zCk7tJMK/8kzhTgDl6SCJMWlvqAvsgqrCTRro/l/Q9m9V2b+szah++8hExOgCqAGM11TOqAgu7WcED8olK2UNHySa8tEazzlgRp/E7D5o+yHPHaK3OUApIesfbw5qRyJOsXS0EUCKvsCxVUw=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1358.namprd10.prod.outlook.com
 (2603:10b6:300:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 09:41:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 09:41:22 +0000
Date: Mon, 16 Aug 2021 12:40:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 robh+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 cyrilbur@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] soc: aspeed: Add LPC mailbox support
Message-ID: <202108160813.GOZ1P4Y8-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813054758.13189-2-chiawei_wang@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Mon, 16 Aug 2021 09:41:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b87c884-2390-40b2-af54-08d9609a01ef
X-MS-TrafficTypeDiagnostic: MWHPR10MB1358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1358DEC9F16A3C551AFBECB58EFD9@MWHPR10MB1358.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lfUJILokRbre4yQN3x6WXIONhTwEgAULclO8Q1WSLV2YzVN6ZWWq8+ixs7KiWs9Fo/TJfjWwqKy6pziAyPrkps/7zJgocS9J2m33jp74n1eaxQ7C761QIsDFucjMlFpg5OzV0k9RTUnUxFKAF8uAuhJR8sHWw99uMocB3H4svvzbtp7n5ZHMudqXn252bhbiS1yNB3T5jbMcQ+IXjANcL9biIFYupNkSmsDMLJaevj8TW6rpUEScKa+netr8SBQ2G82Zc6KMEHxPrC4P/3GlkkCN+jPPE9RaHd74dWr8YO9XzKX39UnGLsxaA62C3qPGsAB8cqkmpYaR4GjgdGkzoiNmXrNiNdmzV+wmHTLioNjd4EJ//oGEChs6mEZA7SlSpmlo+6w3fuI11R5QzvoJcRuSzTqYFMwNqqsDmJmv7qykXXK3XE+LKMeaeaHkVu8MIav/m4tcF/yRoBGfXIpK22CqX+ESPhTfHO513dl+yu2TGpRVVfC5xIYkk9oorGDE2bVbGiMqrOd/9R2JARwyd19mrmNrHlLazNIioWbK7T7fIA3ubw2nK9hvy8fK9Z8TFfsiUtkQgn4rOiuTLKXfaXz2g1uXXwMvs8GKT5uV+H0bGb9J/HgvPulq6ch4BNv4ObeMedOCr8vcG6zbfAJRssKDhuRIKnxA6yjH9zt1j41gdzhoaZsyszHh0X7fCtJZ6UiHeAkAU9IVi085FT0CU529tohDjINXGzA5YLL40yt9UfMW7Msz2mAnkSWw8c0lzUEPTstAuIBe7fXSAOWiArsBXa1tWHztYf6tYtE+h6jzAc+c7cjTUwh0+gTXFJd1DmtK9jOVeA4goj+vNZOzpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(5660300002)(44832011)(1076003)(316002)(2906002)(66946007)(52116002)(956004)(7416002)(4326008)(966005)(9686003)(38100700002)(36756003)(38350700002)(6496006)(186003)(15650500001)(478600001)(921005)(8936002)(8676002)(6666004)(66556008)(6486002)(66476007)(83380400001)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+zbLTzB1NSkrQE1zXtV/Vy0oOvCLA2e3xEY/jeko+GfFZoRLmaCtZfUSHZ8E?=
 =?us-ascii?Q?8OOcl/X0W3Yancz9mkSm09EBptBQuMOYrFLoLEFR4F7srsNTTi1EgItmJKgq?=
 =?us-ascii?Q?LJgK17rjdWdUHKWtFfqbtrlmW+EudCHLTURjRst5ATRE5ycojuLUGXVxgbgD?=
 =?us-ascii?Q?STYjFHc2Mv49dAlmSV8F00ahXBGHEW4EneB0UOhGswZfo7/uOB3pYirMnLtq?=
 =?us-ascii?Q?yxCGn0+uIT1eg8OR6v3hLl/pFXKXazv444MLurPTnDokgbALw/B4afkT94Az?=
 =?us-ascii?Q?GjPmxSmVzTStKjGgLRZDralkBokt4Gv27EOz8bEWFMjFKs8tkYYt8XZAUjiy?=
 =?us-ascii?Q?K2N7KdD4p3BwIfCIpp2bHvZS/PaNoHozVbZZr2pj1MUeLm/CqwohGXcGxKox?=
 =?us-ascii?Q?xwWsf6CifcTuDPz/nmSOHVmmSfjPPzCvXjKiLNpXywZ9MUcfAfWUfq1iBvm5?=
 =?us-ascii?Q?REUt7GrHZzuLPMlHwURnJ/oYTje/9if2CdJDu7I/mZhKFHTeQTV+js4ZLXuL?=
 =?us-ascii?Q?kokfTKnmRgb2IBw1cOX/IxLx6mjEnmETYkV6ZqFV5aOIrHxQVhveRX8vnAvf?=
 =?us-ascii?Q?5FkEYLC7KyGQPf2b7n+Pbk0WfdaFX8XWoJbh2OpsfCf+bHIhrJ53jaSOTB4T?=
 =?us-ascii?Q?t34mRQmNfpDn/worNVF5zDG7jj0llZFbxD8AH1TPu827XIt7pRm0H9nr60HU?=
 =?us-ascii?Q?gNRWsUeIeaoN/u0QE0xGLPwgHpyus18oFSyAeFI30MD/aaoH8D6LJC7bJ5uI?=
 =?us-ascii?Q?6cFxEbNLi11mVWsPMiB5ZWvjJ0y8Ad2KWbrkwugdSBgaQ6nLN3+b7FyIjerp?=
 =?us-ascii?Q?Ryy+/FHfbq1NXPn5uwDpc3V1dhHEOpJWkbEM/G8x1hi09WXougWUfBY9/XUw?=
 =?us-ascii?Q?uKdJQdOk/CoMcwVKmnBvefxUxxTVM7n+8exlOP4yYcvK4TW+tSIf3LXi5C78?=
 =?us-ascii?Q?FQTBSQnolO1bub2ZFcIbcZUG+MKXvM/cZyTZhXdMVLfm4hH8aTo7oQGtVVYc?=
 =?us-ascii?Q?1yT0Cxr7pRkhrc5tDdU6mKM1UCEmsqWblGrwj1WOjmMOTXdwFDKiaE4kd+o0?=
 =?us-ascii?Q?x4Ox/VtTXwCMDRpZ9OYOuqQa8EaRcZ4A5soHpUOcJzEfaE/Ir1UhStYzz2AV?=
 =?us-ascii?Q?wsCQwD+0ShT5FdTcwEUhvWDBNZ4Ic5+FpT98ARaBUhvineaoljzg4eTBnBgd?=
 =?us-ascii?Q?PvP90YWr14MmpZVxBAoJX32wqbn8aB1yUrR+gLwFVTxlGgQ5Gh+rWDnsO+T8?=
 =?us-ascii?Q?+Dnp36vdglmsq/h0cMKR9bIyKzyWIyhuFcBarEsHzJFVQgtSm2igAska4WPN?=
 =?us-ascii?Q?44cnxAATnKseVAvK88hIoby5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b87c884-2390-40b2-af54-08d9609a01ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 09:41:22.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY1g6zGDNDoWLweGQTNpgLA81lsohGf4MGFb7t5CMi11hW9UNxhxrqfw2VsUkmG5BM9soC5e2PejlVSuk1M0faCZHnvZCBD3COPr+OS2zvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1358
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10077
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160059
X-Proofpoint-ORIG-GUID: IQ3nKwe6lRpC2qkvVJuxKU3rcv6z1mca
X-Proofpoint-GUID: IQ3nKwe6lRpC2qkvVJuxKU3rcv6z1mca
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
Cc: kbuild-all@lists.01.org, lkp@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chia-Wei,

url:    https://github.com/0day-ci/linux/commits/Chia-Wei-Wang/aspeed-Add-LPC-mailbox-support/20210813-134908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git for-next
config: openrisc-randconfig-m031-20210816 (attached as .config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/soc/aspeed/aspeed-lpc-mbox.c:230 aspeed_mbox_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +230 drivers/soc/aspeed/aspeed-lpc-mbox.c

72c5a69dc779f5 Chia-Wei Wang 2021-08-13  214  static long aspeed_mbox_ioctl(struct file *file, unsigned int cmd,
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  215  				 unsigned long param)
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  216  {
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  217  	struct aspeed_mbox *mbox = file_mbox(file);
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  218  	const struct aspeed_mbox_model *model = mbox->model;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  219  	struct aspeed_mbox_ioctl_data data;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  220  	long ret;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  221  
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  222  	switch (cmd) {
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  223  	case ASPEED_MBOX_IOCTL_GET_SIZE:
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  224  		data.data = model->dr_num;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  225  		ret = copy_to_user((void __user *)param, &data, sizeof(data));

This should be:

	if (copy_to_user((void __user *)param, &data, sizeof(data)))
		return -EFAULT;

72c5a69dc779f5 Chia-Wei Wang 2021-08-13  226  		break;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  227  	default:
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  228  		ret = -ENOTTY;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  229  	}
72c5a69dc779f5 Chia-Wei Wang 2021-08-13 @230  	return ret;
72c5a69dc779f5 Chia-Wei Wang 2021-08-13  231  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

