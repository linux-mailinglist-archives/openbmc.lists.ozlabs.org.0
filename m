Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B758FAEE
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 12:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3NsS3GWGz3bYs
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 20:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L0pMJkd5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wFguyhA2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L0pMJkd5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wFguyhA2;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Nrq0RP2z2yn3;
	Thu, 11 Aug 2022 20:50:57 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B94plP032381;
	Thu, 11 Aug 2022 10:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=F6XB1W6sj+PhVKPImaOE3t8J09DtuXfzxpuF9muXAm8=;
 b=L0pMJkd5W2URbXY2FgTt0Rgr8dROQbgoVHcE03RC+o8eI0jGdLLszCKRx5ImWu27rZom
 5o2LNmvShphMl20cNRTw9Arq91RZ8XpTVh7Nj3a7nYzJLFPPgmYCSQ0CrDTy79xcUyru
 x/9h7PjB1YnnTVQlQ7SSW/ydg80hvKEgTGfNxgr98hcs6X4p5HkDzGKuqSsJrEKdq0h8
 ivdjO0EDGZBUyelgWkpoLL/xN46K5vTcSZyK92TeZb+gZuLgNY3IGkKJPMnwC3MV3J9+
 rmVwL8cdpkKarWmYhxXfkfIsP/X8tEEp6WklYYd7D9pwOnLFzztMyfcihPME23Bjrtl2 2A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwq9maa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 10:49:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27B950MV035254;
	Thu, 11 Aug 2022 10:49:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqk0tsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 10:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPXI+mwOYAo4K5auXUYWVqwkoaLx2iDoC4A1fJffemgXYdYPfkOik3fQEPTjuJZR8NiPse42IAe2/rQVR7UkMWKljY3epIcf+naoa2c7cl1EuDmCqJ8krOuZR/TKzu2GJ2MtrwWus7hGXYe9f7o3iiYN5fn/ZU3opFe9J7EwUnujORZ+hDCUmXPf74gYDb2YaRSeCSnNw1ZCV9eJkmagDnc/QkQ6u+gyEXaQtq1AlZAR59A3yH93gi0Zzw+1Il6hiZa0YI/JHJgdodQl1FBbx2I6kN9Qxe/NgAzvxvS+wrq0Iv8CShRpeWzdBfgecJSPwzTnhHPSfRlxVan5CrSZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6XB1W6sj+PhVKPImaOE3t8J09DtuXfzxpuF9muXAm8=;
 b=Rfozv90OaN6kft9x/KAvyBKQi4gRWCg27UFHsQHf9QW4NL2s3c1Zql0ZKJbnalH84D2ubiSkcomfeBi1LXdL8Tbl4DiB29eZogBDPDnkiMtrS8WmwmAbFsRa0sLuiSQiM8WnJgL7/N8nAfY9fr50HAGDYu9kivN2jdpS8U3HQsdmDwlVNigMAx2X0pZvhiGrVkDRm+lxy79NfYJCKm3pWTNImk2g/uSpds5nmLGFCWTmg+IlliW9jHzzYctsclU5WnHTXhDpcq13X4d85EDnaiwnXV8Y/gdMoUCKXMMkiuDm+6nJ5kJ8jwSWgQogh5QTMufUlaLxP27kGm23QHxwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6XB1W6sj+PhVKPImaOE3t8J09DtuXfzxpuF9muXAm8=;
 b=wFguyhA2Hiu6BBKSM/NhNXx/5lCSZBS4SEA6WYfzRNfBxErKKGT2C1r4r8yObmuJB3YdvfZ52k25jkwxsh4NBadn+/AN58wLYC8kZU44DVZjXMdFIXEE2e4F7fNhJtHOZqMOqEzzG/a12y0f0TMUC9I0kaRW/1kaEScvgBoAg28=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY5PR10MB6012.namprd10.prod.outlook.com
 (2603:10b6:930:27::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 10:49:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 10:49:44 +0000
Date: Thu, 11 Aug 2022 13:49:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH] peci: Fix platform_get_irq() error checking
Message-ID: <YvTettdmRKZw46mb@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 378a85d0-41c2-4b48-5706-08da7b8732ef
X-MS-TrafficTypeDiagnostic: CY5PR10MB6012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PSEh9OgeRrenFonYKI9PN2n5lTr2Kc1vJpLMUMYN1e8V7ENebf1mcOJY7qNBU07zJJUU7ov8CGXRHuMb3ISqM+mfHaYs/+OxPPMqQcT+HNEYYX/vtoYithOMmYmTGEIAzwsVCdFpBjZqjD5ezKHFPop7qJCTYQmTSgdiYsXXddxfxOryeMrGqYlPapq8OUqA2ILR2R10lGV/xW6++FZTCjMgtONXTgzK/48lWBSwGcqeDNDoZyBnmwyFH7k2iWzVNst6euRMhpJ36Dtq2GnI2Fs1W92a4/YLU93Q0Ixm2RkIsahyjqE/4U2E9P1kYiV89dDbxjS8S5vKHqt4PG9lK1k3xvhe5CvFdBgOOGkx9tDJQ+duiZkUYOfHQzETcTSXeuMf1P1ZBLxXbOa6zlOtEYbC5dDPqWnPj9qb9AHUXBPKrJ2I5n+l7FKFwgMbsj8ID1yrNtDwcrxQggy6nA7PRLZV+2nivkNggGRmUoJpKCpQkmCZVt43X3N9fJSNv84HqCEN4prFPYnCtI7NDijTbVkRVyctStH8QGZ5Uj5QaDmeTm21+5e3C30tliYigwRsFJNvgdTt5afHXiMdrNCZPJ+3vbqE5SkKAbeYyhzBxtKjuw45Hm4XhMFeAbCvxY6pqAJwTG6sYlpZUBjzMlmccZRszNUZLJE/vZwYKY3is16OscUZhvjYwr4UZOs1Xd4SHXPtxysBiTaq995gYuIaiKXdb7kEJWhOKWV8IF6LZQfwSyHo25l3/rFbvpSxY4weEMTTkZtglU3AKmQ5ltroxe/H+af2TsP9oyCHfhjCosM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(39860400002)(376002)(366004)(136003)(346002)(8936002)(54906003)(6916009)(316002)(6486002)(83380400001)(478600001)(86362001)(5660300002)(38100700002)(6666004)(4744005)(52116002)(186003)(6512007)(26005)(2906002)(33716001)(6506007)(41300700001)(4326008)(66556008)(66476007)(66946007)(8676002)(44832011)(9686003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uZhOzUnMonnUMuhAbglrektgHZkedd2kgCQsCmAK2APZ0MpxiKZjr3AxnQI4?=
 =?us-ascii?Q?iXyIPOkm/OBWQ/3oOimeyqzqqopJwXRgQl4gWFoyOJi5nI+mXG07Z83RvyW7?=
 =?us-ascii?Q?wQybctieRa+2tzm9BOqL6iZJ6TW64MRRMSXdtgl+kd3G3EJYOs5msLSoRAMD?=
 =?us-ascii?Q?G85vqgVxCDGeO2hbts9mbZhfM42dM0qbS4cwnDCN0KqJgO3wEeraZDsaD6I6?=
 =?us-ascii?Q?q+qvys0LbIVK7iF2kLZ2I5D7ZNjE064+7GWP5MJI8uESS3btiiVStxQ+r+Tr?=
 =?us-ascii?Q?YRc0NKSug0HNBc8IVjTsQ3kYZs0vQKovpdsMEWEuNZwrrQmPYaLsbUi/tZr8?=
 =?us-ascii?Q?d/GY507kZpEvOlRqgmMP3EbjC0OkYEX+ScxHztKisDaRtCuQcV2w6E6QUJG9?=
 =?us-ascii?Q?mcg7Gjejv8vKKb650LZDx6+kVzmee4AKjFFxE8MMj+5si5Cjpd/A9joRQWR8?=
 =?us-ascii?Q?luzsZwO1oyzpYBzLwqfNIxI8tC80OUjV2wzrglkwAIbAXPXFe5rHJpUskTvI?=
 =?us-ascii?Q?iNWcBPQO68ag8JbTNaVRUCcGkVh3CUcwrxIw2Q2SqaefqXjvbI/XIszO5CUF?=
 =?us-ascii?Q?+DiORf0fZ9VM39aJTMSrRyttjJn/nrrabzyde7dXy4Q2+fAxTO/wTxbBaq+C?=
 =?us-ascii?Q?6+PQNCrDaCiUf8oIeOi1QrBQfLHLYnBPGy25tolIMdH08w7xGRYkQ470yAE7?=
 =?us-ascii?Q?qSyPNXI/nw5MBclVRSb4zttTcwRO0c/vqFC3f+P9jlPAlht+1S2hAxl8YJEo?=
 =?us-ascii?Q?Q4BzFVmllufivLetR754wSvDHYlyzHjGaDi6tNdOB58KbodfHoc1QyLY3Y1k?=
 =?us-ascii?Q?TnR0GGuj+YwpSvp39Mtw+WPLfayZGjG0hKMfzwNcExRYJIH7kTvEKG9ih7mX?=
 =?us-ascii?Q?SojkbH7TazLLztYk2FjSysodhi40pWmZbyXGfkk31cXMyw+yP8dc9V91DZ/3?=
 =?us-ascii?Q?r9k7qgpxWw18ISp2YKqw5h6RX86WbXZ+I4SUm0yyXKzRB0EM5ax5/EXnAjS8?=
 =?us-ascii?Q?V2k9jz2FVzDptuT6aOHYIR3EPhwfWDFnm6CUYPN/nY7RD/nCMgIhUhn68hdu?=
 =?us-ascii?Q?oyIUbXYYOfb2eR1XzfMl45otjTD/byZRpvlhAfY1Ut7UJmaVlhqzYwm5L5a4?=
 =?us-ascii?Q?761TsKKBrU73mSNxOf59nX+hW15mAdUVVu6kCfBGniauHmiuIa2MzPwqAYYA?=
 =?us-ascii?Q?sOliGN9/WfeolLjVQjGwy5WSWA40KJIB8blO5TmFmaD3iibN+1Bh3LxLz0JG?=
 =?us-ascii?Q?Di+ekIJgHEVrqySAHiFoAvyUMb0c69RJhgPwgWPSKuRnUlk9SKGUfM36QGKn?=
 =?us-ascii?Q?xfVSnMxXx/Z+qsWd41XqiKim1Pb7xmVAXBUYIwgb2xelJo8Y/j9ymPJaQ4Rc?=
 =?us-ascii?Q?kMRcEs39Phggq2FHUKc4axXTxm23Q7xjFHa6VWlpl7DKD2gqkTuSxWAfptEY?=
 =?us-ascii?Q?/evNZ6C2aOlUQjG1OgK60qvz6Y/ypXIoPYnpGLASmiXCeArs5SsVJRNwsmeG?=
 =?us-ascii?Q?PSRCuJMbfShK7nz2KZn7Dx6LJm/FvSugyebFLDscM8qzndbemgscuyMwtfqu?=
 =?us-ascii?Q?dRdIONf2jU17Hd5xOEm8xLruj82+pX4T68OvzWMrm6xQ/UprhFQuycd0FWHT?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378a85d0-41c2-4b48-5706-08da7b8732ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:49:44.1224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAmQ6OlgG5iJb4uDTcG40p/kZHAFKu/YGabbLHd7xFpsVbDoNYRUXpGhpoDvEs99puTgqaVVejykfpmkyq7BPUXWwUvBQYuMO8GgDTdTAgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110031
X-Proofpoint-ORIG-GUID: JsOzqCNfVdaZRGIO3z2-T-SEWQAfEjYk
X-Proofpoint-GUID: JsOzqCNfVdaZRGIO3z2-T-SEWQAfEjYk
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The platform_get_irq() function returns success or negative error codes
on failure.

Fixes: a85e4c52086c ("peci: Add peci-aspeed controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/peci/controller/peci-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index 1925ddc13f00..731c5d8f75c6 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -523,7 +523,7 @@ static int aspeed_peci_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (!priv->irq)
+	if (priv->irq < 0)
 		return priv->irq;
 
 	ret = devm_request_irq(&pdev->dev, priv->irq, aspeed_peci_irq_handler,
-- 
2.35.1

