Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93824DC180
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 09:40:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK0vf4j0Vz30Jj
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 19:40:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Pcufnv4c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sXCuceB3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=Pcufnv4c; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=sXCuceB3; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK0v44pWcz2xDD;
 Thu, 17 Mar 2022 19:39:43 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H8Ox7f018273; 
 Thu, 17 Mar 2022 08:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=isGr2vYRA+oBHHiT3n00ItRdKoBZ+kfEMAe8iSLq66o=;
 b=Pcufnv4cybGTmNhbL9yn6iQuS/vCOcYk/I2FN3vIL3SggJkWHNu1QlLkr7rJhg+XIFxr
 cUaHEmUeaXljTo/MB+sPz/onG2vg4yAsHk2USv4kh/dX7I0CMIsbZ/ONW55AVSgIHIe/
 toXRXmQFPZICXCG+RQ1sG7NLLJvRiQLiYZsRW7RSmAcLKAF3kzgeM/iquISbXkqG6Zsi
 fp+WibSDNHRMYa5q54na2TwOYSckF4nKULG4TzeeOwmeQcVfAGgDEyRH6rkWRAXS/5BG
 vcb73Hb8BoNAIf/9tKDJB3z3i44J5KUEJRKgMZuJWUvhMNU1pomYJ8RHpwxSx8xtK4po QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rrkx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 08:39:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22H8avr9092454;
 Thu, 17 Mar 2022 08:39:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by userp3020.oracle.com with ESMTP id 3et659c02a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 08:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dArbhV1+1Tp/5eNV8JWUbR++qJvhsMvgvpNDEfEuVX5azeZZgf4b7XukkcaleLfTa9d41cGNSyfTvV7SRggve5NmJaA1RegBOayigAQDjvkZR7bWFPwWd7ZNRF+5hro6BCfFq6EMkFN6ZI+bEEUgyFUu1LmIHri3/4CyaRqGCSzxVZhIhSZZjnSY2ur/6LIRLZrEDwcbbNJmRSpnpOZZhbbIp5sFlGghnI2lLtFG6O/iBLaPS6gbH/4ZW2SxYYKuZ5JEK/YteVrA0fUKVZga4wi8FPSuwtj0htDF4bVlxqdZIipUid3js9hhsK7vFUVvh4A95RHSl1avhvR4wZ59ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isGr2vYRA+oBHHiT3n00ItRdKoBZ+kfEMAe8iSLq66o=;
 b=dGbKN4jlGyH44Oa30+8HyUe9i7rq7yzo+YQnxLZ/tQYszhjnnNtkSdQb7iEqAttUztJvTC2N0WZOvCJam+CLwBvInwgmJ2g9kC1+nQaouBOU/PCQIAKmbINJrO66usb377O9fAPO+3eRNT9ckoZF4SQpYSE5oWtM73RA4Bx2ztjMj0wpXAvBXWOt0od7vJCV/oWAB0E1+32M94EdvElcpQJrReHF+xFcrlOF5Ft9MzOBhWapO28QgC8G0xHi6B+IcitM0aB432MWE/M7wRTYnY3p/bOZxjhLyeZjM/gY1W8JAmWMguf6G8ojsyI3DF8Gjl6VwkCd20UYuWf+7noQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isGr2vYRA+oBHHiT3n00ItRdKoBZ+kfEMAe8iSLq66o=;
 b=sXCuceB3kHwz/fc/DC5loa5Fq8g8UlwFtnpeC6N44GoLrE25hFY08Uvhzo9xUgKuiM6cGBXd34cbxYlIYgf9Soqyfl1PWYPYORZJVGNfIrTnGzc18lgeX0AS7kXZioGxJzbUnSr7TegqS4NJKfCuE89ANHb1R5W1yR4YGCweq3o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4249.namprd10.prod.outlook.com
 (2603:10b6:5:221::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 08:39:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:39:15 +0000
Date: Thu, 17 Mar 2022 11:38:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 3/4] ipmi: ssif_bmc: Return -EFAULT if
 copy_from_user() fails
Message-ID: <20220317083846.GA336@kadam>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-4-quan@os.amperecomputing.com>
 <YirzJj/BBUQTbKS3@ninjato>
 <db5a879e-5e2f-24f0-c0fb-4971679a45cb@os.amperecomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db5a879e-5e2f-24f0-c0fb-4971679a45cb@os.amperecomputing.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6957d6d-b1ce-450d-35a7-08da07f19e25
X-MS-TrafficTypeDiagnostic: DM6PR10MB4249:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB42491CDD73E726469A843ECA8E129@DM6PR10MB4249.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PLrRU8gWQjMrh7KlxdIYDJipZEhxSm4caJC3d/FoTv9TnpnkZq6/tTmaiHS00f/rn6KDMSW6Ugkal69qNo156moKZTP7axBjyeFsniwZTVf4RZlKldsknk53ShpjnTNxdzSSfi7DAOM+rUFsYUrrOmFtRvArf2zElAZuLpRxTm+t+kZNsymFjLgpMuc30LrxcwHyUgW/CxxkoH5/LRjwx951iGUOIv6rLPqI7pVuCxDIv9QAUo2JLVN9QIIC76xe1HSBrWZTZscVcFf9AdSKAabf7O1myTGvlLMzK27c+ZzA0Le77Zbe+YgUbxatld3pxmQBIfEN89izR5zVZhr8d3xgBvNuKKuxmO039hGaodMZwYr76J67sB6Bm/F+ibD04UobXAF1aFd1epb/Rx+0mzwwvfq3dN6iaXxJuJXie23gDUnV+Zaf0/c03O/j/VY/aIE2JabxeCtJP8uGskfK3mHI5hJWwlNb1EmZI4LRa35XnU35VTKqYFS8ZYFzAc+u4LEW1QOd+WnfhbIiYz/Ej3Ra64N10NfrwhWEeGbiMjEaW6ETH2K7BNYA53MAH8ZUX90bmk5QhPKJ4c6XsUUnckIxd/I8nlNgbDpchVe1Cliavr4kBcP/Gka+ojBLXDUBZVwIByXwJE+QBsyM6jC5xuA8G5GxZFdU7iojE4UFPsCWfQ+vxwXZvEH6gUKmFLtTpuGaCEGqSCoj+v+T281/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(9686003)(53546011)(52116002)(6506007)(508600001)(6486002)(33656002)(6666004)(38350700002)(38100700002)(5660300002)(7416002)(2906002)(44832011)(316002)(1076003)(6916009)(86362001)(54906003)(33716001)(8936002)(66556008)(66476007)(66946007)(8676002)(4326008)(83380400001)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUwWrHsW2u0d/STAN5MKS3gOney4oe+gL+izlREB/gHLdkzNfIC8HbYBUmxp?=
 =?us-ascii?Q?49hxUq7+xl0SB0oaEVl2vJ1zxJFC5z+Gh0Vz9+FTkW3cZlxvx8WVJ8riWU5n?=
 =?us-ascii?Q?kvwtqQJYLrdBuexmGg5PfTMDEy6UzuTrajim/yn8pnaC4t+zjY2wCUDvHjZ1?=
 =?us-ascii?Q?fTmwow2+BeDNNAzMn2X/oBK0FUsng93D2pZCN9I0BI7pttOLH1RhMSm36oyX?=
 =?us-ascii?Q?TaeUQu4rCKfChR1imq1aZr7WemVFwV/QjyWJHDp8/FhWAsK7/yzdSg5o+8dh?=
 =?us-ascii?Q?J+kvp3oXmCijcYi+TGHhNFwz8RgF0KB2KxFbNDxqgh//9uMNkRwQvENCwGwj?=
 =?us-ascii?Q?6/VHuciP7m9b6wxct84Ne11VTTX6391lVzkaZxuBIiRg5XrfJTY/Goh4LNPV?=
 =?us-ascii?Q?JdW+nE80LhmvCfiFQ1F7fxEz3woUTXvUpWK/itwN9LEdIGUSU9rPD39lAxNJ?=
 =?us-ascii?Q?dfgf811jWVEEOC8ZVv4MtydJppSbLTaULyU09BBihTvjEWxSIppUxNeDZ+Vj?=
 =?us-ascii?Q?hrEm5TRTatLeMyeCuyq1W3tHMLmSWhYikEh7uCdxns5IKaljrCg+F5NA7SB2?=
 =?us-ascii?Q?+IaQiPOKfg7/NhxZOsYSuz8ZWtmPOYPfDLoib8ksvO6CecICdMjpPNM9k8uu?=
 =?us-ascii?Q?eKJI6U6/8o3i7W6DU8p+B1kUMBsYj9Fdu8eVCnTLTbYP5tHL1sShT212yM0m?=
 =?us-ascii?Q?ZBvPb2YHv7OEBaXvp3JnwGQb2BCGM/d9/dpKLkk12UQ2lEuFgKf90jvwDLMs?=
 =?us-ascii?Q?4SNJ0EdzPmqWfFb+M4hUvbifiUDJx0FO58zZWOyzNeWd/bYXz5+671c8xmEj?=
 =?us-ascii?Q?l6WMcPUZNkWcRMBczFrDPg3vds2uvyNNwq5NiR9vz2sjom1IMQFRzYxzdY+F?=
 =?us-ascii?Q?gVKCgR/15EH/zFOYUraaeeGdlM5rOyg3Qlb+8ACvQAbKx4rtKnP/ZI0NJJwr?=
 =?us-ascii?Q?9bIxjzEuPrhB9lnLl2ZWw6c3SxFKBBtxvQmQLFh0QoOU7Ugnaar2u+PIHyfj?=
 =?us-ascii?Q?Tghts4FzH9INPcwZ77R8FbAlO2NTHolZGRQ6XMp2eQjId5xzD6sQaSA4FWsy?=
 =?us-ascii?Q?QduNtgKSb71yUrAGIrBNDK9th7TusxTR0jiyRNgUmr05wx31n9o1+CoISaU8?=
 =?us-ascii?Q?ATZ7jpN6qjN4XZX1dFSlH7xyAf1FcGGwFKYKBkprX3lST7foI8EqakLn0PK6?=
 =?us-ascii?Q?ZAvEtnwBeJfW5YurwZ20wta7RmVjkA5EKpLv5ZSsdI4y+//LNZA/Uh3xTX3G?=
 =?us-ascii?Q?bxZdj3olfWNgVqLi9hTMQT/XsCKXid+kGw/BLxV1U1HRXd9bGqrpGD/Q+3lt?=
 =?us-ascii?Q?rkt2hGNhm+AlvzphfHmkyStxQSumd8TBU2y1yAQtqt+pqMOmVhseoAthVKii?=
 =?us-ascii?Q?CV+rXvfywycfkPWX5b4NceTW1n4Ss1iTA3cHEIhAKOROtwwLHqAyKBYI05sR?=
 =?us-ascii?Q?4Ej27yJ9mg1CijWvF/cpxQwT60MeDVRQj71TqfUjI96VnDbsUqfSVg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6957d6d-b1ce-450d-35a7-08da07f19e25
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:39:14.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du6fFqrsEqIe/it+N2W6qA8Lf3oKFoF44pRC85p4ZXLZWM0stFCgsrMBD9tiVZaY009BfX5/rRQdVYLAglSR0RwlHhK8d8pHjqAZey1PuVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4249
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170050
X-Proofpoint-ORIG-GUID: Mbq7EFKdFOFXEFIaFLHaieSKo_h6Y4Xb
X-Proofpoint-GUID: Mbq7EFKdFOFXEFIaFLHaieSKo_h6Y4Xb
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 02:45:19PM +0700, Quan Nguyen wrote:
> Added Dan as I have missed Dan's email address in the first place.
> My apologize,
> - Quan
> 
> On 11/03/2022 13:58, Wolfram Sang wrote:
> > On Thu, Mar 10, 2022 at 06:41:18PM +0700, Quan Nguyen wrote:
> > > From: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > The copy_from_user() function returns the number of bytes remaining to
> > > be copied but we should return -EFAULT here.
> > > 
> > > Fixes: 501c25b59508 ("ipmi: ssif_bmc: Add SSIF BMC driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > 
> > It is nice that you want to keep this patch seperate to give Dan
> > credits, but I still think it should be merged into patch 1, so the
> > initial driver is as flawless as it can be. You could give Dan still
> > credits by mentioning him in the commit message IMO. Dan, would you be
> > fine with this?

Yes, that's no problem.  Thanks!

regards,
dan carpenter

