Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8E4FE0C6
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 14:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd5C71hnBz2ynx
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 22:49:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=tLzgBEWd;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L4RJy3aW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=tLzgBEWd; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=L4RJy3aW; dkim-atps=neutral
X-Greylist: delayed 4479 seconds by postgrey-1.36 at boromir;
 Tue, 12 Apr 2022 22:48:57 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd5Bd6BtLz2x9B
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 22:48:53 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CAEZmF018804; 
 Tue, 12 Apr 2022 11:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2021-07-09;
 bh=9t7Eovz7qySeWBEEqSRdcDUAR6BMcvdkj8UB08eXOzM=;
 b=tLzgBEWdRLTTQAnRRqy1ZlP+OuG7fbvMZKGd6U7f5xuG7EfJ+6BQOjDnO6RrmwSeFv2y
 13A1L0mQFQ5jCxKLaBCzaG6Kt4AHKxxLO1HI45GFoeaeqkfjaQQiUudrrOUq/EYrNvtg
 Xk8BkaQ18ub7Bg+EI1ejdRDh5ZHVrtVk7sd6wP3OoRK4ruYyReYwGUa2H6Uxft8Kakd1
 6cwnpccGYsl1Eig651QdVKDxF9t8GEo/uUgLuMbtOo8rCvNie7pVOdf1PB76Y+8f/sQD
 E6KIi/cA+3Y4KegErcjcSBEBQUFcRpZZJ/23uObdUaxh4Mdi+l/NM2+tkErAWGpsP+h3 nw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1egcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 11:34:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23CBGbrs005619; Tue, 12 Apr 2022 11:34:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fck12kb8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 11:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E50HNK+86UFAKdldHrPiLhLAz1yE3SXoTHa6sW2gA5UYXDPWvlzx7YvmfHubNeO4XjJp0Wuf0S4n2UNb5Su3Bon+gZwVjBIHDe61N/M5Kzd8rMd/7lr+yIeqlR+VU3bv0lbumCZpU/HHEaYakmHGWwPYOozpnKk6QWB/m5GiPkCBx8yO8Y6DBzRiLyC6DvhTeNNOSaurPp6QywFWYIFHQz8nj7/L2LCLBDerBlsleJccngAqY6eR9B3dvhQvpOjeTd2E1lZDn4vZTWOnDvezdd5U9ridTczcNzRUHPJkvH/wrBUUpjjrX4IbTQ9pbp/Jwbw28N6rkEgTX3ntXzNxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o9hxepA6G4EK/bWrjmMlwJr8uVfmjr8DqZwix7UD2A=;
 b=Qv/XBmEcym/YS3sSrYn+mYFsJSscKSv5u/t9EVBaSwFTeHjqhqUnuywhqKGAIL/cBYsVrp8AoOb6w3ygwmblRO2yUVuWrurfaZtl4v9LNNwGy3okJxRyeMTQ2/cJ8lsRxROXyTnNhTDvnY0N78MKtmpFikkvD+zIMRDQU8ZN7x5nZaC6wPLxmefwRHvkEjwxfB7Js7DFr9WwWQq+QrR9RW/jTQkg4loHUe6dpuzSWBY0wlGslm/FVWrcm0B0kgYRWxIWwrm3Km1y0Vx1dHa7609Uu2NvcIlA/gGDN9LEBVORzMMICU+3mM1zYHkFeegpmzwDZ7A2F9gT8+WpbEC1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o9hxepA6G4EK/bWrjmMlwJr8uVfmjr8DqZwix7UD2A=;
 b=L4RJy3aW8Hpm05QszqQp/l7S3MTrkbjv1F4j2MpP004Q+0mpzv6GI/lm+Rmc+goLwZQKiC6kMhupighnNzMqG8nvS6PSFl4t01e0h/XKkGadAaeGVK7EYiwRt66r+muJ70N5HA8bu3lGITBd0xVJNn9fJdvpQ1qQfwmSGIbZFUU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3536.namprd10.prod.outlook.com
 (2603:10b6:208:11e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 11:33:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 11:33:58 +0000
Date: Tue, 12 Apr 2022 14:33:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Eddie James <eajames@linux.ibm.com>,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: pca955x: Add HW blink support
Message-ID: <202204121953.zHZcX6EV-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220411162033.39613-5-eajames@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197abdfa-ada6-4db4-9aad-08da1c785537
X-MS-TrafficTypeDiagnostic: MN2PR10MB3536:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB35363D7D7EAD03AB22538C3D8EED9@MN2PR10MB3536.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3CIdujU5xEhU7UxZ8sPgKiotWXffay1aLDzp1l1WLgiLhdQf0h3JlU8/8w2bLrCIcqfds4YqvfI6FKOJPvy2W97/oNUzekvz0RHTbtnOAoPNI35uQu60yQCXfTj6H6mIpPCM5J2ZQBKJWYtsxKrb4nEwPtua5i7sdy9NMcV320rrI4r234CI/C9DurSA99KYRO0hZOyOTOhL0JUH21uat4jloC32Kohh4Tm6sdphRP9u+JSqzej4s01NLn+BZ6KGKtqehN2Jgz//UPeGhXGT3ux8d3QGcK2br3JEiFgIAQyKNfa9y6cE2ARPL1E1dIYynmfybKvMBPrV5Ha/HhXEHjjTmh0zOcBeToUMlLu9QNYQWRwtHhgwEck3LjQayJeZitcPOskLn4XdAaSHO5kflkzSnEMPR28PwImCsq/PbjAb8993mZj/0aahX6E/5kWYr+9bnhChnza5wdAm678sHzI1EL+QIaKAcBs8i/atyXH8pVx5XTZ0M4bCtki2F6683YMlaNgRSJMTTZz3pTzynCtdXkoXrT2gF3et+6XxzaIlyA7PxRcQiPFD+p58LQrz6pC+23APF4QeP2f1Yg8lVZ8TZflDz6lPXAtUGMv7ngatzOf5IyWt+JLIYTL8ZjplVSAUJRKiZb5t7Af9F5lmlrIGGN9Cz8Rj2t28zk8aSUuovme62DqP/tftvg/L1Krlp3ARnQtwcfL6y6+uD8h1yoXKjDOovQl+oGNFc/na4G044Tn/Zhl0voPKuOrl0AC/E/u8vT1WnS0OJjZd+NWbhZaBI8h2cwgXTS8votMUzEq0GPW+J66C92nUuTY6KmNeN07eHMFK4m7hqkHar+GgEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6506007)(6512007)(316002)(9686003)(6486002)(966005)(83380400001)(7416002)(38100700002)(5660300002)(86362001)(52116002)(6666004)(8936002)(186003)(38350700002)(2906002)(44832011)(66574015)(36756003)(66946007)(66556008)(66476007)(8676002)(4326008)(1076003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oXl4jLnJ78pV5bQjGBEDOW3vlatc3oVBcuvmXKTzco7IUnsSu5fSpnYTCk?=
 =?iso-8859-1?Q?UVx3hp3TzCWqM0065tDK8ViqtMSBSCZqfZcLAdsHHgd774C49d6idVtSIX?=
 =?iso-8859-1?Q?/sxkSkwVFCIB6yh3c6iiKNXo/drBrv6QDUuSyD58aZEOZG75BN9nnCjwAj?=
 =?iso-8859-1?Q?atDWjn2cBY+Wt9umLIP07TsF1ViYRfkZrFRMJa07YWFNxEZSuJRj9wdo3W?=
 =?iso-8859-1?Q?cuyV9VP/KgxTGySOV3exg7C9xd8bveu3uCWduzWXy1k+eOGsReJ6tbunSe?=
 =?iso-8859-1?Q?mw2ucW8R909PgTn+qkAizDR46vjY13j+8aXK9UT6OFOqERWorf+GLo27uN?=
 =?iso-8859-1?Q?5ARa6ElWmrf1Z0DIFVIKGR6FS48zP0PqjIxG4+LOTH57ISUdd1Z+JDfNR7?=
 =?iso-8859-1?Q?gus2ErGv2PQdPOSA5Fm4Tl3t0AqWEaZOhrWK0NZvvmudizUp9x5dMzFZcI?=
 =?iso-8859-1?Q?hjYxPOqw6tKflUF8sC/EEhvhXQcattwrXJiobYGDJS4XVTc4XyCYNVmRtn?=
 =?iso-8859-1?Q?mvkUTruUlF0hS0pHnxo3cRjmsOpIpAJxbrDmhS/OTWT+8XnVk5hzreNBIG?=
 =?iso-8859-1?Q?crwTZqnZFZjPB6VZb5LQE7UfAVe6dhKbY9mBqORztPgIeS7jDxrrcFfhhl?=
 =?iso-8859-1?Q?Oz8BckTSn24p81gAZYhR1njkfoAbX21qUAMtbGATsBvf1s4HKfKm/Uex2u?=
 =?iso-8859-1?Q?WnhQrOYXvOsw0pLTfSst7iTVI/6PEt+iAAEVrgXyxP5qfej75M5jovm407?=
 =?iso-8859-1?Q?tTeVvz4X6QeT2AtCrUMj3XuXyA/3ePlj38BKE8M2MuRQuuKRHZnEFWeGrl?=
 =?iso-8859-1?Q?P+e15TG9v+08yf7Uu+jHnSoGKuEFOqPW2ds2Kywr5FBiit2kLT/jM3axDX?=
 =?iso-8859-1?Q?4zd6001CmNeIn3QrLhZ7ZbBhWtKU2TmRNx1usmozOV5G2PXslDsF0tTY64?=
 =?iso-8859-1?Q?Fedu51AaVRvBXchWMvev5RUzWvdB6qBQ3CrwQsXTFH9mOJLUAJDm36u1VL?=
 =?iso-8859-1?Q?8D2IP2Be9P4tIEbA0yP0f3VTDvVrAmAqqO0HsUVqhYcORqyRUIrdtwhVvg?=
 =?iso-8859-1?Q?cK10mi8zdkVOaaa2KeUOOcrBeDE43jG4+P/tXGy4OahgEQPGPeZC268WZV?=
 =?iso-8859-1?Q?Gb0a5bZbKWRIZTf8LbKfEZvNVkRifwGfyZXQXy0JqLqaybVqSLrHH/t+St?=
 =?iso-8859-1?Q?0GgNwfnwTY8H32b5nUxkB0N1NU4o8/Xv4WfmBnucPX65+APz82mJd28ilP?=
 =?iso-8859-1?Q?yBaXkCDW8wpYYT+EJg73K5BbXU2/0g6oJuz5/e67iK+nlfgK3kRd9Kj8rs?=
 =?iso-8859-1?Q?dHLQwOTF0Xlsomci1HwYamEyIx+rlymkPB4iB/6+PYl2rIAgF1GzxxO33Q?=
 =?iso-8859-1?Q?bbAtd2hHcflY5qsdoPz7e0AehZ3juMyzkDcPK1OIZ/G4G32Za2VGMVouUu?=
 =?iso-8859-1?Q?V3bDopwdgVwlQCPpYNN3pN2X/nG0y9+SukBliH5SF5E1m+ysXw5k5AhYRK?=
 =?iso-8859-1?Q?/Wjhep03al/dZ+0+rojZvwx2ShNeSTWMxoB8Z13H6Av1K9rK1LhqAe4LIb?=
 =?iso-8859-1?Q?o+uo8Q3mDilWslITyi3XkJPTV5X6VSfbgAjmVni/DSEJHz/ehEyKhUrsQk?=
 =?iso-8859-1?Q?IHsAE3V3mPYTJQNugI177KVrdiSNAAjpSwfpg4nd95TiUBYZ3xAVIi3YUG?=
 =?iso-8859-1?Q?fugugmKLE2FxcdMaLoLEbPuVukWbkU2mG+oSZQZyjGLiXyPIq1+rDcK9ws?=
 =?iso-8859-1?Q?ZNEd9ncHOWeU4xXze9fFIGNO2BvIf7rk0ZFyQaVGGhXG+RvEjxZBgHstYA?=
 =?iso-8859-1?Q?eFOXrink4SdcRPhOqNgKzW8GzP3Ce+4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197abdfa-ada6-4db4-9aad-08da1c785537
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 11:33:58.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeCvg9W+xdRTl7ENz7tsf7Q/y8TOGI+djeSNBbvU0OC5nCKOl4V/nMZPh4sN00pR+jkrV59UP8sPIzOPYcx1F9BUShA+qtlSHgJh+Hc0Bes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3536
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-12_03:2022-04-11,
 2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120053
X-Proofpoint-GUID: 719RWt_6i1t8dZTX43B7193-INeh8lTk
X-Proofpoint-ORIG-GUID: 719RWt_6i1t8dZTX43B7193-INeh8lTk
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, joel@jms.id.au, pavel@ucw.cz
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/leds-pca955x-Add-HW-blink-support/20220412-002330
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121953.zHZcX6EV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-pca955x.c:455 pca955x_led_blink() error: uninitialized symbol 'ret'.

vim +/ret +455 drivers/leds/leds-pca955x.c

3b7b1899f6cc6d Eddie James      2022-04-11  390  static int pca955x_led_blink(struct led_classdev *led_cdev,
3b7b1899f6cc6d Eddie James      2022-04-11  391  			     unsigned long *delay_on, unsigned long *delay_off)
3b7b1899f6cc6d Eddie James      2022-04-11  392  {
3b7b1899f6cc6d Eddie James      2022-04-11  393  	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
3b7b1899f6cc6d Eddie James      2022-04-11  394  	struct pca955x *pca955x = pca955x_led->pca955x;
3b7b1899f6cc6d Eddie James      2022-04-11  395  	unsigned long p = *delay_on + *delay_off;
3b7b1899f6cc6d Eddie James      2022-04-11  396  	int ret;
3b7b1899f6cc6d Eddie James      2022-04-11  397  
3b7b1899f6cc6d Eddie James      2022-04-11  398  	mutex_lock(&pca955x->lock);
3b7b1899f6cc6d Eddie James      2022-04-11  399  
3b7b1899f6cc6d Eddie James      2022-04-11  400  	if (p) {
3b7b1899f6cc6d Eddie James      2022-04-11  401  		if (*delay_on != *delay_off) {
3b7b1899f6cc6d Eddie James      2022-04-11  402  			ret = -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  403  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  404  		}
3b7b1899f6cc6d Eddie James      2022-04-11  405  
3b7b1899f6cc6d Eddie James      2022-04-11  406  		if (p < pca955x_psc_to_period(pca955x, 0) ||
3b7b1899f6cc6d Eddie James      2022-04-11  407  		    p > pca955x_psc_to_period(pca955x, 0xff)) {
3b7b1899f6cc6d Eddie James      2022-04-11  408  			ret = -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  409  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  410  		}
3b7b1899f6cc6d Eddie James      2022-04-11  411  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  412  		p = pca955x->active_blink ? pca955x->blink_period :
3b7b1899f6cc6d Eddie James      2022-04-11  413  			PCA955X_BLINK_DEFAULT_MS;
3b7b1899f6cc6d Eddie James      2022-04-11  414  	}
3b7b1899f6cc6d Eddie James      2022-04-11  415  
3b7b1899f6cc6d Eddie James      2022-04-11  416  	if (!pca955x->active_blink ||
3b7b1899f6cc6d Eddie James      2022-04-11  417  	    pca955x->active_blink == BIT(pca955x_led->led_num) ||
3b7b1899f6cc6d Eddie James      2022-04-11  418  	    pca955x->blink_period == p) {
3b7b1899f6cc6d Eddie James      2022-04-11  419  		u8 psc = pca955x_period_to_psc(pca955x, p);
f46e9203d9a100 Nate Case        2008-07-16  420  
3b7b1899f6cc6d Eddie James      2022-04-11  421  		if (!test_and_set_bit(pca955x_led->led_num,
3b7b1899f6cc6d Eddie James      2022-04-11  422  				      &pca955x->active_blink)) {
3b7b1899f6cc6d Eddie James      2022-04-11  423  			u8 ls;
3b7b1899f6cc6d Eddie James      2022-04-11  424  			int reg = pca955x_led->led_num / 4;
3b7b1899f6cc6d Eddie James      2022-04-11  425  			int bit = pca955x_led->led_num % 4;
3b7b1899f6cc6d Eddie James      2022-04-11  426  
3b7b1899f6cc6d Eddie James      2022-04-11  427  			ret = pca955x_read_ls(pca955x, reg, &ls);
3b7b1899f6cc6d Eddie James      2022-04-11  428  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  429  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  430  
3b7b1899f6cc6d Eddie James      2022-04-11  431  			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
9e58c2a7bb91f6 Eddie James      2022-04-11  432  			ret = pca955x_write_ls(pca955x, reg, ls);
3b7b1899f6cc6d Eddie James      2022-04-11  433  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  434  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  435  		}
3b7b1899f6cc6d Eddie James      2022-04-11  436  
3b7b1899f6cc6d Eddie James      2022-04-11  437  		if (pca955x->blink_period != p) {
3b7b1899f6cc6d Eddie James      2022-04-11  438  			pca955x->blink_period = p;
3b7b1899f6cc6d Eddie James      2022-04-11  439  			ret = pca955x_write_psc(pca955x, 0, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  440  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  441  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  442  		}

Can both the !test_and_set_bit() and pca955x->blink_period != p conditions
be false?  If so then "ret" is uninitialized.

3b7b1899f6cc6d Eddie James      2022-04-11  443  
3b7b1899f6cc6d Eddie James      2022-04-11  444  		p = pca955x_psc_to_period(pca955x, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  445  		p /= 2;
3b7b1899f6cc6d Eddie James      2022-04-11  446  		*delay_on = p;
3b7b1899f6cc6d Eddie James      2022-04-11  447  		*delay_off = p;
3b7b1899f6cc6d Eddie James      2022-04-11  448  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  449  		ret = -EBUSY;
3b7b1899f6cc6d Eddie James      2022-04-11  450  	}
e7e11d8ba807d4 Alexander Stein  2012-05-29  451  
1591caf2d5eafd Cédric Le Goater 2017-08-30  452  out:
e7e11d8ba807d4 Alexander Stein  2012-05-29  453  	mutex_unlock(&pca955x->lock);
f46e9203d9a100 Nate Case        2008-07-16  454  
1591caf2d5eafd Cédric Le Goater 2017-08-30 @455  	return ret;
f46e9203d9a100 Nate Case        2008-07-16  456  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

