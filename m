Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC869BEF3
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 08:45:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHf12zLQz3bgd
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 18:45:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mRZ0teVz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nAScSLeZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=nick.alcock@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mRZ0teVz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nAScSLeZ;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJDKn0YqTz3bjd
	for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2023 01:12:42 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7hdvV027181;
	Fri, 17 Feb 2023 14:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=P+zBh7KfcsUZ8Dm2mG+7H1S2NXLf1L82qU+PkRjBPwo=;
 b=mRZ0teVzhhBhd56mgJdwHMPJ58ULTnBzTeRer9YVWjuMi4+CjFgPv/m9H3vcbxxqrqjq
 vB1lEGzjZtDg0SdcmoGto7ZorXCcPFBlb7n6BBVftTj+fbqQMt/Q3bvagHTkxXWcHpTn
 pbhf9ODa3JxAbWdE1Anvae9NIeYVbwUIQ9Pr5hty/Eb0qZzhhMsCy94YFJbKhSc8H0Ux
 0L5QPpYBpR0nJp6jTB2QvvfIuAJpYL/C7hTzhbs2cf5wsahFk4/3DSJKbL2IjYtAcSpw
 xajYvWhFl781TCp2G9GOAjFZPSkl3O0zPHD5oNbYOrOK7L23J6EFCJCDxRpYnmAbNoUh fg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np32cp0dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 14:12:35 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HCtG1j013863;
	Fri, 17 Feb 2023 14:12:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f9ujhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 14:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuTtKMvdZuW39Ee7dh9cXSsbsP3nFqTTSenu7GNBvL3Xnx33hppKyuhHus8SwNFVWIM8VlNM4o5PFpTEJyx8v/aUA7liCe9SSWDfyvTj1frUOny2XdIkjqlBskRf1gJ/qv9zDshGoirft21N68KUfPhlq+wDtfD8a8K3iRmD6GK2UPVZawloJKsbkTRz/nbGCzX1xjP8Ved5txFR9z2lF/ysJH19b/313GH2nCZ8S1w1myGfn2CYTVV1W0/g8oFAUA/N5Nx9dOqDO+3DRNctyR5Xe/QREp3SI7aVym3v3WNh+UAAOGNFBhFaJioZxqLAnx+z34rjPrusfTVO+Mbajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+zBh7KfcsUZ8Dm2mG+7H1S2NXLf1L82qU+PkRjBPwo=;
 b=H7orq535tBKxeL6SM3SbgrY77j5f9xP6IhtCBANSaYCF8gj+GaUpMX05FZqDAt8NOoVYoaHxBXHs1woNiIZomCISX1B81INlJNFr5+IbSzeGG4FdLrtv22pMusaFyqOnVyKS/UsFgGkZnACISM7xxwDyYVpmUIN/gYv4ZgEaQG2zlEJZs9hDXXFSWqwBXUo11c1IzXTmPd+WcRAK1i9K/xjCgNPur4oNak4CYd7qKWo748NbWv+XC2pxknpDEEvHJFs3g0pd2O+trqs/uQCekKbYqWwBLmjAYfxBr98hyj4EoSOtHLefEnvS47PNQLTOFOfQZHymIA1WcCchIt2bRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+zBh7KfcsUZ8Dm2mG+7H1S2NXLf1L82qU+PkRjBPwo=;
 b=nAScSLeZXdc72eOgK7PZMGGdJ7Tnd8DUTZQ5TEs4RgxyiTU45GpGyWAUOBe/wWBn6Bcf/gqY+qe+YJrm2SQ6dfFIYW72gxCyor9pt+HAdlVXjxzTjglDy0+D+S7RoKS/vD3Exx1C2Sw0OV2FaUK48HNa8Kmb1cKxwXV/yzI4mOo=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by SA2PR10MB4795.namprd10.prod.outlook.com (2603:10b6:806:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Fri, 17 Feb
 2023 14:12:31 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.006; Fri, 17 Feb 2023
 14:12:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 17/24] kbuild, pinctrl: nuvoton: npcm7xx: remove MODULE_LICENSE in non-modules
Date: Fri, 17 Feb 2023 14:10:52 +0000
Message-Id: <20230217141059.392471-18-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230217141059.392471-1-nick.alcock@oracle.com>
References: <20230217141059.392471-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::9) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|SA2PR10MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ade3a9e-5b04-4825-e171-08db10f101b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UIfVyry1b04gdXAYxYcQhH18PEtbqXC4OdMRe+xhHhN7hxejf5A3nxV6wUQ6CP4Yr/WKlE7XsAbyYi1VxS0EPYzE+KvUITgfTVo9Jgfz3o4Ol5jArfd8RUYwvzLp+j7/YFE0sVjRWXVWLBRLdDWWCiVzRbiJHs22rGu4lYnti/skO3GaWozKg5hb8lNkR5+mfqImEemaJwr5aw+TajEhGeFAE9DcjjiGUWD8ZTQi0Ylu6EbHPC+vmLcjRQfn0fuFWBeKpgBIosQWvvlvKkYbutjDTei5Pt3dQR5uAWAOOQfHjgqtIT+rYtCUBVaoINZfWbULDShMV084vHRRvGCr/u7FYnRhMyD5BphbvucaJq1V1ZEHnb0XYm4phiN2onWfdnoDmEX/MW5XT4++1SftayABlSp5kcR19bCIcfD2voR6P6b/amebPp236/8cyILemYJIgL7TmsbHNpXeTCF/p0iiWVBiR8VGfgOzx48XiE0B4LaO6t4XS7U7lKkWAU2+IFdDF28OJAna8n6Vu6aErL4e9AHjAVWG6BnwTGc8944/ank3bxNsQ++XTvQz5zwBgZnG3NZ5FIM1rdq7fPa3IZ3kfYLk9M3hH/GgW74HfmHCCU3BY8y0Xl/CCz37H7E7L0mT/2vzGqWdeqmv8VfVfA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6798.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199018)(2906002)(44832011)(7416002)(5660300002)(36756003)(8936002)(86362001)(41300700001)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(38100700002)(83380400001)(2616005)(6512007)(186003)(6506007)(1076003)(6666004)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Nsdfni+Dm3LqLetFmh/sr976UCTHFxCwgl3vEj01KGV5IuYkZTagTWVxJNu2?=
 =?us-ascii?Q?Y16p/baeuukvgG8RDbfmXTsOoxa+xBZQYaytBPDrUOd+ri675xR36SJgDt0u?=
 =?us-ascii?Q?Kle63o1w4XFkjSHV57UuUAX1RA1rg4JTLj3748SDexJBfy5SR6YaG5UwEG84?=
 =?us-ascii?Q?TKRCEiuH82EdGOe6jUMbn6yGcRBSqCTF/Aa6cIEL2vbPyXQp4W0kb+pxi3eZ?=
 =?us-ascii?Q?6L7aKvczUsJ3QUfIiihpMITpmIq0GgD92qDjILftFKOMvK/Gyq8d5kKAMqe3?=
 =?us-ascii?Q?g6jl/pn6P6gNPwEOWQJuB9wpeWhfqAHRtDKGMHeEqLEWsdS9u7cynJWbAraM?=
 =?us-ascii?Q?MQ66poHT5nbA0cegfX05askiVxdsc3xCvkOa6UmtjKhzqwmEvPDkVCb47EGg?=
 =?us-ascii?Q?m7qeeKsT4fnvY/hM8zJhb8FeH8BFxf7aAqAIJNPiMkLZm30K3woOmlGRXqNP?=
 =?us-ascii?Q?bNkuRsGtjjK19gj5QHiyjMzbwQ8aOfwdU0nOeuo2U1P47VBAOZywyt5IPmdV?=
 =?us-ascii?Q?YrTMxYb+PsKftawAV922NyAzyBmPhrXzTlM/bRj0laHxk4ghnGCAstx/YiB/?=
 =?us-ascii?Q?uUhJEjTE4QAnVTbogCuzS8xwmM7iLZpYx0xhREUkK0POUVEVLFtLXEgdrZfZ?=
 =?us-ascii?Q?O8KgtRzna6IkwDru0GgPxeJ0eyGIuzBA58hchkxC6M8qqmhRHAriiB7ZKHTJ?=
 =?us-ascii?Q?Y9EuiSFJ6TnfcmEljziON6ZXcUFZsrw7jtB37qEWmUxcdsWJYUuA2+ApYNBB?=
 =?us-ascii?Q?W2HWVYO7yH1Bb2zWOk8S/yvC3ErAQoexylp5sWBQ7mQe1pWZCPnI569Prmwk?=
 =?us-ascii?Q?m6O/n+bwSZIj/9rIkRdXKPW+G9g7oALJuIQ6h9QWS4H8nftXE2BIcrSihkA8?=
 =?us-ascii?Q?O1J/gGG+vJHpZyYJzU6bHRwVB0UHW98F0LMRwVXlE+kJDxmXkFL/UAvRdqlr?=
 =?us-ascii?Q?t3nl1SvAGvuuNp268ueyJ3GWx66ySgHyGMncjI1A73T3ZR9fqhFgvhbOyrSr?=
 =?us-ascii?Q?/PGjDpHAzQ2lV691XfjKHj8SAtmzkaCDkUJFDwzerX9paHQqUWYTc6rEa7ND?=
 =?us-ascii?Q?VLQOwidvtgjEayOZUAa6KVB8BMyMYwFtFNx436HVMUPJx4iuM7pPEtD8RgHa?=
 =?us-ascii?Q?asAWv85nqimvZEyTRxepzqXOQdnFQrIqCmFGy0Di8pRs1X1cNxl9gnSaQ3Gn?=
 =?us-ascii?Q?YW8N/dzR/lInpeJJhWVllRp3QNr2/Z5k7oabB7pixMRIndlgvIhF2z68CVx+?=
 =?us-ascii?Q?BW4+K8CWdYEXVvQmk7ZeAIevLDNnpMy9giWZIPgLoawt7hJJeoQDyuoCEo/5?=
 =?us-ascii?Q?62lU4FOnOy+c2G8eLzwxgZdHnOkZzSRbzF4BiY1o+1Ec7FtlGofBqhFCgj+s?=
 =?us-ascii?Q?alzxaGFgM9ytHLIu04gfNtMsL0pEv+KGRzPQBfI7RqlhWPJO8XoPX0thHQ60?=
 =?us-ascii?Q?HGFgHAYH9jAPqWZg4s5g/7HweW7D+w3bBRsG3LLWiwFnD099erJcYNbgFklD?=
 =?us-ascii?Q?bhm97Hi2gfLeBYZAjqgpvc2nycf9Kx6gSolvElgRur3TUknvtYFqgj8xh70f?=
 =?us-ascii?Q?F4OrBqwrAcDtIp8eCstrtiISbycIXf0Bz7aUrc301S8xsBMLCrTd41b+gMdG?=
 =?us-ascii?Q?9EY9rCWKj76mEyiz5RzA1fw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	bUeVQ4IuZtEUFOvSOpJ9yBnTQM5qFhmRFB5Ssv1h5/rtazubqqUTOkONkMLT4dDVh3gv0vZ4ApyvT6jR/hN4HNBUWtvAHErOXw2CYOTVdtR40JYcS1l73ebeMzNlR3B6AS4dXk5MnlduBJQnZASbKmZPJnnl9HEm+CnYR3u4vzWIbrhTx3FzOF4PIkZmNvsChEffMzKlwXtFUuD801+B2FpUKF5co0Q4acCwp0Bjvcy9vRIR3PRFglgRzc4T7mgNpvZhh+Yj1KcreQE6HDnwFQ49xIgcGcG3l1rjey3zr/KtiU2X74Cb8f24DhOJhLzjOa0VsPrS+ocn1Dxrag8S5gKiwb6RWf43vyk1exonjRY7RIzsWs5zF206vT6WB9iz6qfAT8ooUOtFrfdq7ze4AbFzU6xakaqCdK67gfkf6cm+kC94tnKzoC5K4gkdgzZNKTZ02/7XA8Ateg9/jULNWLSFFBDg0bKHuzyx0DDRAW7sOWqegkk3ldvhj7AMw3NbcXZSNP9Sg5MsMM1XASepTgXSqDeXxbkTnmCNUNhtl+1dXa1RYbrvGeTONPeOOcSkSFa7KgB3PqqJJ7vOE+zp4ZtUpguFkPMfLEKjiorisNw4jmp41hrNrfn/2QJ2y82mbSNwmwJTTm3Tl+9Pv/D2bLLjso+mWs65ekHc4soqx6ssaq60YG/fV7cONZQF+MgCVMr3tIleCwAXxIGlFaCZBA9G7DKEVLZIlsUh7B7HROmzxxL2zAT9nj9OPyn0O0csy6QkjPUYq1HKl2c71LopIVjKwbI6deFIQYIwE8NUfYFhbQtuDeqaSLp5zIQSmiHxYlsz9RJfBMtJz3C4/uQDVMa177jVSByflmn4TAo4gHuGoVmh9usVVpyUJ+lEMrgNtdpFR9oU1BFOFob3VC57O8HKd+XGJnlgo94jxaEn2IM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ade3a9e-5b04-4825-e171-08db10f101b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:12:30.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtaI1R6wcZpX6YFZTKgDdC6c9uDysKhzPY0RB2jD+Gg+P9a46f44H5zpFYOKfY1Ko1OwhVpbQeeBH4ExPgnJ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4795
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170128
X-Proofpoint-GUID: 3yBYfD2sqg700Z0wuevRkj6n-7bAxCvJ
X-Proofpoint-ORIG-GUID: 3yBYfD2sqg700Z0wuevRkj6n-7bAxCvJ
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:41:14 +1100
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: openbmc@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index ff5bcea172e8..4e12b3768d65 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -2046,7 +2046,6 @@ static int __init npcm7xx_pinctrl_register(void)
 }
 arch_initcall(npcm7xx_pinctrl_register);
 
-MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("jordan_hargrave@dell.com");
 MODULE_AUTHOR("tomer.maimon@nuvoton.com");
 MODULE_DESCRIPTION("Nuvoton NPCM7XX Pinctrl and GPIO driver");
-- 
2.39.1.268.g9de2f9a303

