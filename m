Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDB6032FF
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 21:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsNcx6G7Vz3cBw
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 06:06:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=IywbLU06;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=prvs=029029cdaf=troy.miller@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=IywbLU06;
	dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsNcJ4XQYz3bwQ
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 06:05:50 +1100 (AEDT)
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IIe4Kb010945;
	Tue, 18 Oct 2022 19:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=message-id : date : from
 : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=dJAXZZyFYcV3AN1ODMNDb0+ZhyTFmfA30lYF/ulYdPw=;
 b=IywbLU06TkpWaGY77dkPNwCH5zXGakrkhTWYVhWjxjASMvczQx2sGRRE/IrZzUZiM+Iu
 ldtDuGFI1Y7+HrHOWIrX9LCWCuKnV9knas2Dv1XLWUCCNKLA1RV4HfiZGcayLHGqktvH
 hGtr65IVCMNTaEyVF/UQ4X8y5qCUwBJWFefSBtGR+h2esWboPMJoSl35VrRfRJRz5meh
 +yWciiO+htt3BBjBosHhFmOxkh9tYCI59B0F898Zgq7SYlGRRl8knS1VCpSmNK7Hjxbb
 7eV7PjcpazjIKEgu/P16OhPo30hVjRpklV9LdiskuC5ziakTOyjB5sSC1MmyiRpUCW02 yw== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ka1m686ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 19:05:46 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id A1B288040D5;
	Tue, 18 Oct 2022 19:05:45 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 18 Oct 2022 07:05:42 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Tue, 18 Oct 2022 07:05:42 -1200
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 18 Oct 2022 07:05:42 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baq470tXwQDsAW5ckIKuaAdPf0Tm6719XNipS6P5hJx3OryXIZCH+iXYr+lZR9Q3MC5Bdw/IE0gV+pM/Ql/uyZ9TJg4C4ZXXoxm6OoR+da7RN9AcfB4wlaezVfhxKerdUcwWr5vkEWSw77mU6pIn3J4JU3tRydJxHepqMVJF3CYGKeLs5ER5eWUHgmest+e7A03iVRed3uf942V9RFr5SKdQ3VL1IAPLZ+nM0nS4MjNDgwCTYX1v5gTIy2Bj+8VPE+s/VrqseiW7sTAKFU+dMmxkYFuYLVP1z3p7IsahnkPQZkuaMvkSsNLO/KkSlF1NWep1TdY97sllnzrmZu2QEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJAXZZyFYcV3AN1ODMNDb0+ZhyTFmfA30lYF/ulYdPw=;
 b=Pqcxi74ockMF/avFCXc4jpuiSe8YSMo8DbDtiYGgpEhfXEhwE0sZwK3aTvbhmXfE972EvBoxZjLEzL4Vv8K9/NI3fKY8lmuaA5lsfKclF/EUxemgEmFqUs3JWZB2LEhaWdy/+UC3Cm/261QkO3Bwz8duZYbnYYy3UzYgm5HrWxAax+B9XKckL3qc6/aD/t/A1k1iUpakd4vA+xEDvL/ih6roDiV/eLnpxrLXtZam+CA2Lt8Les8UIox5rmAVa8jFrckemHrfMSkyIs2yF2y2N7buObiQCnOVkJzVKabJTTl0WfnVtDTrVSsvuz0YaSTKv16xoo4IKCltQJWHwI3t3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4d::11) by
 MW5PR84MB1641.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 19:05:40 +0000
Received: from DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::849c:32e5:8fd2:11b]) by DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::849c:32e5:8fd2:11b%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 19:05:40 +0000
Message-ID: <acf64248-8ba1-56fb-66a6-9c07d6d9112d@hpe.com>
Date: Tue, 18 Oct 2022 14:05:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: "Miller, Troy" <troy.miller@hpe.com>
Subject: Re: Are there plans to merge up to Honister 3.4.4?
To: Patrick Williams <patrick@stwcx.xyz>
References: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
 <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
 <Y07lMANd/vVL9ph6@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Language: en-US
In-Reply-To: <Y07lMANd/vVL9ph6@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SA9PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:806:a7::35) To DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:8:4d::11)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR84MB1806:EE_|MW5PR84MB1641:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f1e5a1-bc25-498a-0701-08dab13bbf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ua0wkI8zLhTAg5gI4Jm81zvR/nVhgIVU9YUHZ7Oj0+7dOJLjePSUPdPzX8seQCMuj9Q0pS8gwbfWerBY0lNOvwsiViHO3mAnbIB9saHmjebxVos3KbP1yYqMa3dETP4Z2wp9A+eicvui16yHf45WzUE8FAG9f3+lQYV96ghojMaV/WLwzBrFbkDARFLISA7jW45+aTTPsEx2SmgHEhS36dJfWViDI3GkoLO/A9dsIrAXu0LLlYO5wm7akvxzhAO0Tp3XzEiwxkELtyufLpqlN+nAs2OR5940KWNRFVi/7ZSNyiHrHwjBtTM+7XAtRhqJ7HKtNoMjtBxx11jXUu0VT6c9PuszKDUbjZD4AFjQDzfI4QghZB49Htt3SOElec96lZI/nN/AYPvcfqrVJrnrcJsXOLl60iBT7hPcTMnwwwMJLK3FEn/N08ZxnemPIYJYiI7HN1/enjCdld2G+jOFJHVBcqs+Xr+WF9MNovibwtXgLJF3z4UNZw0hqORJOt7XGGvCN+MoCr/ha3sazChjwsixbrIUBSJbYJFtKBfQy93xY4W9VPWPWKjKMOKBok4Mf9YXyE/Iek8zARTOGciroDGceBj6avDdX3KGbEKcpS3SJxD79FrKsL24xrDQL1SWkcIGaEkh4XrHYkp2BAyFvIKA5qzgwR0XykIr/H00UVXrrALoooC/pfXVKujU42NUGB3upIaFDcdShs+qQhDQKueShP28nyVtwhb32l5cq+TgdBvS4Qmz0LnkCnk8kTQcrbAuGUyKO/amLpGcgUFbZKFY9tjGxqTxcFZK7dvSyvbeXRw44+e8OkA3i5Fh4wzl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(83380400001)(82960400001)(36756003)(86362001)(31696002)(38100700002)(66556008)(316002)(6916009)(66899015)(31686004)(5660300002)(4744005)(8936002)(186003)(66476007)(966005)(6486002)(2906002)(2616005)(6506007)(66946007)(478600001)(6512007)(26005)(41300700001)(53546011)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGxwWGk5SElnOTEzQkplSzQ0RGpTb1FXNytUcGFvVkgxOEpyaDRZeTdyN2p3?=
 =?utf-8?B?eGcxQm0zQVNtc05FZEI5M1Q1blk3c1lDS1oyM2pSUm1uSEVaRmR6SzN4V2E2?=
 =?utf-8?B?UC8vWlZtSHdlVndIMnVDbjQ1RUMwMkR1STVWN290VFBkcW93YktpSlNoaWF3?=
 =?utf-8?B?anNDTGVwRUdac0J0VFJnNUV4cG1RdEJyYWJZTzFvMHVhTW50cmpiN01xL3li?=
 =?utf-8?B?TGZJNUpMckluTDJ0cEFIRldiYTlLOGlub3dFMDZRbnlKUzR6Yks3WFc4SVdN?=
 =?utf-8?B?S1lxYWZXMHdVZW05clF2OUpsT2hrVmdxZjFRb0ZiWG1LSytSZWNQWUxmSExZ?=
 =?utf-8?B?YW5IbythZEc2REx4ZHZmR0Evc1dSUDd6a1QzaWp1Y2xHNkgzbkRvN0tCMHFF?=
 =?utf-8?B?b0pDZDBRQjdnUmRKQ2hwcUtWRVBHZmQxMmRBVHNGRVAxWUlNb2R6WHVxVWo5?=
 =?utf-8?B?OVQ4WnJyNEZ5ZEdsaXNBWlZ4cUxSVTUwcm93VUE5eGtJd1hrdUVpV1RTR3VM?=
 =?utf-8?B?TXNKSmtaZUNLREhYYjltY0JnYVYwRHN4eUw1Qkx5a3V4U2hvaVRuZ2dWR2h6?=
 =?utf-8?B?K0tBdEFsYktNVUZBa21TSHVvUHFYY1JwR2t6aTh0enhDV1R2RDZRRUFhd08w?=
 =?utf-8?B?cERFY0w5eUp2azBxb1Z6L25HMDlMU0kzbE9xOVRhWVI3dWFTWnRQaEZSWUNN?=
 =?utf-8?B?WkRqMkpLRHE4TkgxSEFiS1NiYUhXRmNkZXhBWmJ2eVJNMFlRRExLOG94clJX?=
 =?utf-8?B?OFdITUNkaFpDbVlvcDNhSVhZM2RIVVZxa3lqUHU0UTE3MWVYVWxsT0Vlb1Vz?=
 =?utf-8?B?VjJqN3g2cUFNakprZk5hbVVCZVhxMWM1L1UvcDR3Ry9MQ0FJSnRvamdIOU5D?=
 =?utf-8?B?MFQwYlc5KzJmVDdWSmlzQU52dmNmalIyREJhcSttdmo1Ympkb0F3dDdHbTB2?=
 =?utf-8?B?N1l4WWRGMU1nVC93UGVnNEdvbVl3dnJvVUpHeWs0MjJMQ2RKUHB6eUR3bXRu?=
 =?utf-8?B?YTlZaks0c21PTlNtZ3BIUWJmOEpNOHYrMGZ0aEJhUi9LNjdBZjN4VlZSUXNt?=
 =?utf-8?B?R0ZTVi9KUkFJTEg2WEZveGQ4UTdFSEZOTjRJY0FRaGdxaURGTjdaelBNZjc4?=
 =?utf-8?B?NERHWW5PdW8xTzFlamNKeHB4RVdpUHJGelNiTHJwc2lmTE5wcVA1TTNEOEY1?=
 =?utf-8?B?K0htYk45RjdkUjBzM2ZwZVBmOE16K0ttNlYzdHJDN1dyR0VJdEJxSVN2T1ky?=
 =?utf-8?B?TzQwdVJkQlA3cGNuVHhiUVFoaHpRNzFmUXZ1bGx5d1JDUWZFWW1HOVIwNjV6?=
 =?utf-8?B?c1pyTDhCZWZ1Z0NhSUdRaFdZK3Q3MWxTYW9ZWGs2ZVRod1RpbVordHFDUDVN?=
 =?utf-8?B?cyt1U2VTYldqU09VUGZnVTNySUVQdlU2bEcvZEVzY0R1bUw3VUdLVjF4SlVT?=
 =?utf-8?B?d2ZyeVhDcERhVFRUbXhiR2llRHYzTXI5cUcyUkViN014c1BBY2pXZUd2d1RH?=
 =?utf-8?B?dlJJRnNUV3ZyZXFEYkNoSVBtdmllNTNvazUzc0JkSWxJVXI4ZnVxNlpqK0l6?=
 =?utf-8?B?Y09FSzBhb1g3TFB5OSttdkViek8xLzc3empuZWdMbEFROURnMnZUVGVZUkRC?=
 =?utf-8?B?UGRZTndVMDREM2J4MEJpa2ViQ2twNUltaDhHTnFmR2EwclN6S0UvWktkeUZJ?=
 =?utf-8?B?Mmwvako4RW5xQ3VXeUtpZE9YVmE3dmVPdnNiOHJTcG8zWC82anYySzVYWFZo?=
 =?utf-8?B?TmhNMG5OMzhoekRTSHBQd2xBd0JJbmpYak1EUzZ5M25zNGw4UU9rTFo3dFkx?=
 =?utf-8?B?bDJ1a3ZXaE5oMFFDMDNncnBmdGp0NU1PejdiNlQxekZsZWhlclc4OGZCZFFi?=
 =?utf-8?B?UVYxZUhvRjRaZzQzVWpHVGd3RjV2cVh0OVM4MUpwbzQyS2dZa1ZiM2V3Z3E5?=
 =?utf-8?B?enpiSXFTcEVTLzhqZ2x1dEwyS1lBWmpLcWFBQXdXdnBjdytNOElNRGpSbk5u?=
 =?utf-8?B?RXU5YmxzK0I5ZlZ6WFJBTTRmQ0pSY0FzQTViMFZuZUQ0WmRVTitNMGQ1YXZl?=
 =?utf-8?B?Q0RNY09aMzgvNWRRZkw3dVRpUHBwTTdjNjFpWWtqMDgvTFBvUkxJY2lHWlQ1?=
 =?utf-8?Q?IZKiTWdNaku0BsBF1fmLjToQG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f1e5a1-bc25-498a-0701-08dab13bbf94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 19:05:40.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nb+699keCzPwUshn9wDSHb9sFs2WVlAlwBYAoD5l1JbkmFutvGgk2Hj2BsWcKK2DqplUiPjb0TYrOVL4gjJgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1641
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: MnMinO2I6SixgR-hopbr13AGmFPaXXGL
X-Proofpoint-ORIG-GUID: MnMinO2I6SixgR-hopbr13AGmFPaXXGL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=823 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180107
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/18/2022 12:41 PM, Patrick Williams wrote:
> On Tue, Oct 18, 2022 at 12:33:29PM -0500, Patrick Williams wrote:
>> On Tue, Oct 18, 2022 at 04:04:16PM +0000, Miller, Troy wrote:
>>> The Yocto repo is showing 3.4.4:
>>>      https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky.conf?h=honister#n3
>>>
>>> OpenBMC is still at 3.4.3:
>>>      https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/conf/distro/poky.conf#L3
>>
>> There aren't many people who seem to work off our past release branches,
>> so we don't always keep them promptly up to date.  Since honister was
>> EOL, I assumed nobody was using it and hadn't checked on updates in
>> while.  I can do a subtree pull for honister.
> 
>     https://gerrit.openbmc.org/c/openbmc/openbmc/+/58003 subtree updates [NEW]
> 

Thank you for the pull for the Honister branch.

I agree that moving to Kirkstone would be ideal, but not in the cards 
right now.
