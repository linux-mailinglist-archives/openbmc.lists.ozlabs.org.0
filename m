Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715164DC22B
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 10:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK1Mn2Z3Sz30C2
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 20:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YokT8xMi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::70e;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YokT8xMi; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1MG1JbMz2xTq;
 Thu, 17 Mar 2022 20:00:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csA7nIFDJvXbu8YU1hLJGHhD58jZJmFtPPmCAQdysy2EBZ+1u7ycEImsugx6ArgWwUjhR8Gn2YL4PS/9MCK28PBVZ4RxdRSi1nN6xDhxNdoA5+u1L57Gs3tXDSN82BWPhj87CCYXS0vzSJVYxs2MUJ3seYBCAC+KBTocfmPe8DlUDZO5ZPuY6yu8iWHv7Ljl/cmt04rsahKhOxl9ykfSOBQGhNGAS1oFVMsYARUmeVNYC90353RFDSMgGqyg1Oa8mR7DTlfIINTtK/2pzU7MBK8i1mw/jJb5b5k1DKFTAA4p3CwqpCy1EMb3Ynr43OmjZJYLtZPptpPecT46BwUKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mvKKCUlLwm6dvjixifPyGGrXPmDURiGSZ/YPlI2wNA=;
 b=ihdHBloWd1dIEMEjmJeFoqVq6zkAfBPccabWnuat4Rrl0/l6a5Kxy8RGNR625zeQD7/py2ey55uW5XNP1agR1e6sWLSdYGUxlvq+SSg1LIrX+XOqTgVrXYO5uHhVZGvGIr8Od8lZ1do4eAaYhw/g+fRxWWwpAmK6YLiX0IkRB4thLeC4icS86c5bqGxJsoRga1OADPbU+kpJTFGscB8+kybpouqPEFhI0fyexD9L2yQ6mWK87VoA7ZN3BubXLaVF/iyymQdsgsnPwHGlnyZCVNjx1/R6UkxgqckLeGyGaEtC5I+m+SV0rpVAkwlElQK4iuZj988INUUaJilgEsweQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mvKKCUlLwm6dvjixifPyGGrXPmDURiGSZ/YPlI2wNA=;
 b=YokT8xMinaih3bY9uchW6WkMCvDZEb2MK9O7n9BibwDscWMZazitLFeoqw5Xzw7/UYOudMpBUpuRTFgpvOef26c1EQGRhZCykir+x5eNxellYJHHr19QUxBUmf3dSlvto3dSmnKRRr7aka8yhiKJT7go7IMV24usjHFpKeq2PeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5236.prod.exchangelabs.com (2603:10b6:208:77::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.15; Thu, 17 Mar 2022 09:00:18 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 09:00:18 +0000
Message-ID: <ba91c809-ad81-1f69-cc02-3f5cf28f6350@os.amperecomputing.com>
Date: Thu, 17 Mar 2022 16:00:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Corey Minyard <minyard@acm.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
 <7cd9301f-f417-e555-6025-74acfc53598a@quicinc.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <7cd9301f-f417-e555-6025-74acfc53598a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR04CA0068.apcprd04.prod.outlook.com
 (2603:1096:202:15::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 617915d1-2e4d-4542-85a2-08da07f48f02
X-MS-TrafficTypeDiagnostic: BL0PR01MB5236:EE_
X-Microsoft-Antispam-PRVS: <BL0PR01MB523656E9C2BB45C8AA972E14F2129@BL0PR01MB5236.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCQULnP66SYOWsPz7UCaoVtbNml020XkNHjWg623H8BDlT1pyLkkU8s6zY2q+fh7WkOiRsyBg+EZSrIpyfzKpC4X2i2CWn9QZLAMKRO7V0OCPhzMJa3lRS0DL5hJYwEBr4slrFnu3yS/x2gjMFnDupRg2sXCjKj9Y2oS+7Do7uR3YaTzF8GMRKO5fKBY2wNi8SjBEeaEhQoR7UHwMVRCJDmUBNQ5+rNQ0WjAy0RweeZq8iAysKipNFhbmiXDieUKJPpU+uDdpCtm4OVyhFMTlvDRqoef9H4i1dYwLNd8x+mmDCRvex0JaDJ1MkrY6cgAsjX5mGw/ZPmzG+n9Vf2+tW6FSaKuo/vdKsQEmiToKVjY65vAAu81bBypf7YOAFRbfgUWoowjcLAvZMuUNxfqSzI/5av9IdV4MjQWVp1ragPuDTqon5DhFUBVoELxuFxoC/ezvrz4YvxKxFNkv7583i9K9y0R520ngYE0CgaUtJU9twYriz8hdv3KORwG+LO0KsBI/CqL3E4ASeEwS13yEKdVsORB0cQKJkjjaxyPEbREdjMrFi1GouSYXSqI8H7hfr5+2ye5gF1Iiin7fg5/dagVaNZssG7Sreq6XnBk5kz0yMdDqzqwIhh8DxyF2FysjS1MJrp8oI+FsONPh3AqNG7myd3dK1pObdVMT5m34GmTa+L8hVqvfvOGGeKjYpaGqXRvibpC+bH+MYoQrax9eG4p5zN3Ewojkd7EMCC8nDnSUB8Te9xANrq7k88GhzlYH1Y0N0Lq5DwmB/cqxJ2ijg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(6512007)(6506007)(2906002)(921005)(6486002)(54906003)(6666004)(110136005)(508600001)(83380400001)(31686004)(66946007)(107886003)(86362001)(31696002)(8936002)(316002)(4326008)(38100700002)(8676002)(2616005)(52116002)(53546011)(55236004)(38350700002)(186003)(66556008)(26005)(66476007)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJ4M29KK3J2YWFPWW9FWEJkL25uMiswSVlBZTNKalU1a3ZPdVZ2SE5ubmh4?=
 =?utf-8?B?SlU3WHRDeFV2L2FreG1uY3dXc2xxSHpsS3RFSm1MaHFUTTZMaThqRlpCc3BP?=
 =?utf-8?B?UGJBcFJJSVNublY1dlo5NzFUaXFmdDZUdXhvM1hqSS8xRjBIVFhjNmJBTGtx?=
 =?utf-8?B?dTRBZHlHNnAwaHlUb0lYY3NVQzVvOFhTNjZxTEFaT28xWEo2T2thQlBob0Jp?=
 =?utf-8?B?Q3lBanVtVzFVNHJVeDFXVVpTc0dnbVlsWis5NUtZdm9NT1JFMlpma050VDRE?=
 =?utf-8?B?VmwzdnRVSVA0Q0N5cW12OWlPeVVjbVljQlJWOHRRUGRGV2JySk1mMjJFclNB?=
 =?utf-8?B?K1gybzVkUWVzQ2hNaUxYRTV2NmdNVXBJU1k2dDJ3ekhZamVhUTRXZ0hCdDU2?=
 =?utf-8?B?N1ptV0dFSEVsRTM3U3pUdjNVcXRpZjFiRHpRbWEwVTN4WnYyRmlsTkkvaHA1?=
 =?utf-8?B?eW54bGJpNHUwNERzUkM2ZldoWUtSYkFTSG9JR3ZBU1pKR2psMFByR09ac1dR?=
 =?utf-8?B?VjFjRUxJNmc2VlBZZjlURzdRb0ovVFJYTm4zRkdEQVNscENVaVB1WGZzYjBr?=
 =?utf-8?B?WEthd3ZXS2tOOW1sK3NRQzJxaTlYaEFkU1B0azhQSkFKWXVDU2doOGRjVEhL?=
 =?utf-8?B?V3o0T05uN0tPY3JDREtZYWFzVmV0emVraStscnlPREU3UTBVNkhhN2VqNXV4?=
 =?utf-8?B?dFgzZ000UXRtbVB4NmpWbHhuWWtIY3RHREFiYTBxdjNtMklMYUN3Qit3VUFZ?=
 =?utf-8?B?bW45NHl5Tm45Z3B3dFlmdUY1WHh3dUVPSFlhRUJsc3BPVEcwNmlSNWoxQUQ3?=
 =?utf-8?B?RU9YNVUwcU5Ra3BWTkxnZXhWaTh2L0FEK2VIVzN6aW1scERhZFc0ZWJvMXJa?=
 =?utf-8?B?aUlvS0ZmQlpKOEYzQmxGeFhTV1MydlprMERLS3pBZWdkdkZmWGQyVDNVRmM2?=
 =?utf-8?B?T0U0akRSQnFtb3poOVJVN1pzSTRlWGRHWE90Mm9Jai9WeXpiLzlkdmppekJ0?=
 =?utf-8?B?amJMRWQwdWViK1dHbXhCb1lVYUNmTVRPVkFFTmN4OTk1WkhSOGpSRjlnbkIw?=
 =?utf-8?B?QzVaQ094czR5QVFkT3pueWt2RnU1T0tsRk9kVlhSTm1oYlo4T1ppS25XZWwx?=
 =?utf-8?B?QVV4WU5nSkdzUUJKMkJ0NVFsNTdmZDdWWnAveEp5RUU3RXJxa0szUXp1dlQ5?=
 =?utf-8?B?UVd2UE1oWVQ2MXpyMGErZjVOZzZNRzZLUWxUWmJUaXZuQ2xQYUtYbnhvL3Nl?=
 =?utf-8?B?K0V3dGJrOVVpakNVSXg5SGNtNGpiTmpRSXV6dkFVZVEvSFphVjF0aUFvVXZ4?=
 =?utf-8?B?OWNFMmpIeUZTVlRVY2k5MzRuRFJNSTNtTzdlc0VFUDVmTG8yK20yM2ZrYzE4?=
 =?utf-8?B?T21FRmxmQmhIYm5DeGM3b0JDU2oraUpnbVRwOW93U3hxaHBwSEVUT2JrRFNX?=
 =?utf-8?B?SmpDV0hWencrb0cxNHB0dkUzbTlib1RVWVZ4MTNRWGVGSTJZS3JISmJISUlT?=
 =?utf-8?B?NUoyMkFlVUFqQjBxMHlLYmtlVU9NQnl2aDU2SXdFOTdPOWZ0UmhJSlQxcy9W?=
 =?utf-8?B?SUFqdi9rZm9FekYrV25vZVNOajA4US9ReFdCSmo3VDVLQVNCUXJnYUpZczhp?=
 =?utf-8?B?R21jek9ucWlpNlhZQjIzZ2EycVRKNzNTODhpdzF1Qk14NHpEbFIwdDlaOVhU?=
 =?utf-8?B?NjhGSjU5WGpvRFplNXZ6ZVd5Q3JGZXdadXBTSTNmR1BXV01wT01CUkF4d2Ra?=
 =?utf-8?B?NTkxKzZ2azN3SjdUbVU0NC9QWE1kNmMvaDJyR1lrTjFWWWlUaVZRQW1pWUF4?=
 =?utf-8?B?Zk01UDBRY2UvM1hFRzgzV0xxejcyRG9Mc3kzUkVYQkpqOGRjZDU2MS9NVmRK?=
 =?utf-8?B?Y1FJOFkvS0xSb0g0M3ViSk9QMk85VzFYRnAwZHhZNll2S3N5Z002S3g1VE01?=
 =?utf-8?B?YkMxd2F4S250VithVTN6SklDNUhZWlBxVGJzbFV4aHRHdDZHVjZ3S0N2Z29L?=
 =?utf-8?Q?sT+b06ivwDh56Z3p/DX2IlkmCi9uwU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617915d1-2e4d-4542-85a2-08da07f48f02
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:00:18.6578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: honCA59C7zFdfmNs04QZq+tGoKoXKU2E/G5hM0OKnUjVOrKSfaDs56I0HyO/hLtnOQEAnHNsM0bYpzN4S05MV199iTWbYvSZwTE3DxLKN+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5236
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 15/03/2022 01:15, Jae Hyun Yoo wrote:
> Hi Quan,
> 
> [...]
> 
>> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 
>> *val)
>> +{
>> +    if (ssif_bmc->state == SSIF_READY ||
>> +        ssif_bmc->state == SSIF_START ||
>> +        ssif_bmc->state == SSIF_REQ_RECVING ||
>> +        ssif_bmc->state == SSIF_RES_SENDING) {
>> +        ssif_bmc->state = SSIF_BAD_SMBUS;
>> +        dev_warn(&ssif_bmc->client->dev,
>> +             "Warn: %s unexpected READ REQUESTED in state=%s\n",
>> +             __func__, state_to_string(ssif_bmc->state));
> 
> It will print out that the case happens in SSIF_BAD_SMBUS state always
> because ssif_bmc->state is already assigned as SSIF_BAD_SMBUS above.
> Move the assignment to after the dev_warn printing.
> 
> [...]
> 

Thanks for pointing this out. Will fix this in next version.

>> +static const struct of_device_id ssif_bmc_match[] = {
>> +    { .compatible = "ampere,ssif-bmc" },
> 
> Does this driver have any Ampere specific handling? If not, it could be
> "ssif-bmc" as a generic SSIF driver.
> 
Will change as you suggested in next version.

>> +    { },
>> +};
> 
> Add 'MODULE_DEVICE_TABLE(of, ssif_bmc_match);'
> 
Will do in next version
>> +
>> +static const struct i2c_device_id ssif_bmc_id[] = {
>> +    { DEVICE_NAME, 0 },
>> +    { },
>> +};
>> +
> 
> Remove this blank line.
> 
Will update in next version

>> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
>> +
>> +static struct i2c_driver ssif_bmc_driver = {
>> +    .driver         = {
>> +        .name           = DEVICE_NAME,
>> +        .of_match_table = ssif_bmc_match,
>> +    },
>> +    .probe          = ssif_bmc_probe,
>> +    .remove         = ssif_bmc_remove,
>> +    .id_table       = ssif_bmc_id,
>> +};
>> +
> 
> Remove this blank line too.
> 
> -Jae
>

Thanks Jae for the review, will update in next version.
- Quan

>> +module_i2c_driver(ssif_bmc_driver);
>> +
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF 
>> interface.");
>> +MODULE_LICENSE("GPL");
> 
> [...]
