Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B3311B07
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 05:44:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXfnZ484fzDqJW
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 15:44:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.126;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=dKUzxgwQ; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2126.outbound.protection.outlook.com [40.107.243.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXfmd4f5HzDqFK
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 15:43:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYAEvUJ+iZ3YYvAdB3dSdnSUwOMw4AOjuhsMtxAlLAnUhOLgZBia2fdbcV1o87v5zNSEi6eefXtAJJDKzkPZzbBNINj7HrJt8YXB/6U4/7vNpmvT1OKqgVMML/IU4WyodGptb0z2ynVrKB6YncWMt85OtxqlY/HFFt639m2UP/z2uBsqj7ERZuBrg4vCOjzjzzZ993kcv99e99PDhhmpMBYmjvcfLsiqg+fwpjUtasyp5OXmAO/ZC3xGjIhcni50QHIzkpIUdjBg4rj+kWekRygX9oSkp6Fny8lHOWmWWc1x3J8R0M6foTUM2DfzRzV0NKWtNhz2AE2p9L8sCfdVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUDSGTKgpT3lagaNDri+WrUfojbGysnt6oGtMISXp1U=;
 b=gvxHJ1Adr/q85Sph4VqLo6c1QV3VRjNeqjAV/Womt9SY9w2YEM2R/g/vQhMvLcEtLRiNJAGjGVM3YjN1WX8uYHhAPc+vZzeNvIanoM0S4FxmEy7xleYcC8ucXGqcTgWdtn/DXZc51UbezL+75fyJhVRYAxXDSZsL9J9lL+XNbID11g8qYWwuaQXhub7AhJ+EV7eFjfvn1VUkPo1GzgJMWlrAof7FtB/taENc2wPvIFXHAK87UU7/OM6qzm5wBs9knr8fXsi4oB01ViivuKb5eH+dZnMrbxmNTjP2+lNVtMlz336sk/FudM7AVjr7VeQPTH5HmLtVodRjXu+0SpVulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUDSGTKgpT3lagaNDri+WrUfojbGysnt6oGtMISXp1U=;
 b=dKUzxgwQVY+fsI26E3Ehdjs4HaQVaejomFJ29IyBka3x0LxOhpaxRDxFdDMo6elq5mIq28nSZxNk/9pR2NA5YdRvWBFlXj2Lq7lriGGbCbkif/HJIdxRYCyNj6Y2lwqJLus13XgIH+5FvwbjtFAxcNBdVfTXdcLmT+mCCHouWrE=
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 SJ0PR01MB6237.prod.exchangelabs.com (2603:10b6:a03:2a2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.22; Sat, 6 Feb 2021 04:43:04 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3805.027; Sat, 6 Feb 2021
 04:43:03 +0000
Subject: Re: create meta-ampere folder in openbmc repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>
Date: Sat, 6 Feb 2021 11:42:54 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [42.119.148.40]
X-ClientProxiedBy: HK2PR02CA0171.apcprd02.prod.outlook.com
 (2603:1096:201:1f::31) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.150] (42.119.148.40) by
 HK2PR02CA0171.apcprd02.prod.outlook.com (2603:1096:201:1f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Sat, 6 Feb 2021 04:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d945964e-28dd-428a-c551-08d8ca59b08b
X-MS-TrafficTypeDiagnostic: SJ0PR01MB6237:
X-Microsoft-Antispam-PRVS: <SJ0PR01MB6237EE2D8BF94F563D4389D08DB19@SJ0PR01MB6237.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+hwX82RQ8jBCk8B6dY0iiakjQDi6rdOiKQJLNKSj14hkXGd6SVGyIY0SLya1Xe2NU/mOxMmZKQmcJuxVQ15GAQG/MC6qH/nEy2kyyj+7JQbdIxl24fj6TIcPSeP0z1raXWqTwNtd8mZlgbezvL4nqMS+Oq37F0KwxrtVGx7LZYp9sN8VXY3hv+/DsRLE7d4bQFJgkztOcsLsO8UDAGhGS5JaQMqYJlwvYnh1O6XbDl08c5LedpRP7RkSUsmR3w2bLNYlgxUEW6OBP56E1hN4x9V00QoA+Cggi5xHHH2iloMrqYYLO6DqcvyI+N5HhsqyhzZacPoIN97KkbntcK0xenf6sLfMOYRtT+JqSijUVUO+Jr4oBUBoBYLrFrQtHXzSbigwtf0Igq9SCeepUViPMGy2aafhyzhRowPTzkh6aZ3nW1NzYJhQa84bCiIQ8Nu+ojtahCeVF1IgAmXc/nrNa1yKC/F1hzdh2QspjsTXGEjjDV+BS5mfhxIpfUXS3OyVLpstSay/xmDQhwzagMGQou/x26L2nN5iDtMLy/qNZZBxL6Hz0uX/WRlnv1BOCB7piDb80VIDQkluO20eLku64XyE2QL7PlBgXggWqpVYudZF8A4vUev3o/qEGvV2tQX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39830400003)(31686004)(6666004)(4326008)(66946007)(316002)(6916009)(8936002)(31696002)(16576012)(2906002)(86362001)(16526019)(84040400003)(5660300002)(478600001)(26005)(6486002)(53546011)(4744005)(2616005)(66476007)(956004)(8676002)(52116002)(186003)(66556008)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTJJMkRmQndFTjJha1lSb3dpRFkwN05GODZIbStsL3p6WFQ1TGpDOUdUR2lS?=
 =?utf-8?B?R2FCV1k4MW1vbEF4RjE0MnYwem40aG93TC94WmdRWENvNE0zcCtjVllJNXk4?=
 =?utf-8?B?YS9DWDg4ZlpCNVo0VVczZlUvR3IwUm8wdGo5R0M2bmhSMy91V2Q3V1YyUVpO?=
 =?utf-8?B?b0hLUGE2RHpMMU82OFpzUHpOc0tMdjNYT0Q3cExqaGVCRFJYaXh6R2tWSkpi?=
 =?utf-8?B?dWIzbmtMNDR4bmtrdzNiSHJBSEU4ZlRjaW5NbUE3OTliQW9kdFlvaVgxNVA5?=
 =?utf-8?B?QjVxUWlVbnp4a2kxaU1xcmprMllZYnFWVk0vb2sxRFRsQ09aTmxOTllUOHI2?=
 =?utf-8?B?L3NoR1c4clREVEp5OVcxRUoxRGRscVd0bzdUOENqSkVxZk14RE5NeEFYWXgy?=
 =?utf-8?B?bnRUZ2pwczVFQmQ3YlRORHl0SEx2dGtMNVdYdlRrd2tkN2dQZmJmMjZYSldN?=
 =?utf-8?B?MDl2bXVyMHppMVVnWDgyVUllaFNockt6VDFwWTl4c0dleE5VYjNTV3JHdkN3?=
 =?utf-8?B?aUtxYTRxTkYwcHlrR1RJdGZFSktPV01aM3Y0SzBYdDV0eE83N0NTbUl2MG9i?=
 =?utf-8?B?OG1uNXA1M3Bpb0FMSUxpcndLbjRZVmpha2I5NTBBNStSSDI4ZUU3WFJJZ0Mr?=
 =?utf-8?B?UEJkdFN5VzF0TGlRWFpUaS83UlZRQnlEVi9JNkpDSkoyMzNNNXdGcDFHMnJ0?=
 =?utf-8?B?c1FhNHRmVGJqT3dMejZDbm1xWk1UZWtmcUVVbHU5VnVNUjNxbktlSFJ4WUhC?=
 =?utf-8?B?dEpKVi9vaXU1VHdaUHB4YncwUzl5LzZNcWUxdDhLRGZUc1E4Y1c3TzhyaEpH?=
 =?utf-8?B?bVlSZ1hzajN6cXhrbGJ0bzFrNWhVSHBpclY0Q0NkNDFrY2FyMExxUXNaYWZl?=
 =?utf-8?B?SjRPRTQ0RFlaQ2tjenprMTFwanNOR2xqY01YL0N0TnBJWG55eHdxUzJNWDJP?=
 =?utf-8?B?dy9SQUdRZ0tIZUZvUEo4VkJsM3l0UDg4UldGZ2M3ZTJnRWxBeSt4UVlTM1h1?=
 =?utf-8?B?d05ROUtyVFBTdExWOWdiMDRiWmpVS0VPdUlJQ3JjUGVjWUU3bFhhaXUwSWFh?=
 =?utf-8?B?U2Y3dGV2VDU4R3ZmUEQ5MXJtcnhZci9xWXF0d1ZRSWUvY0sxWWU0ZGJjT09v?=
 =?utf-8?B?eVYrM2Zud1NwNE1zcFNpd2xEYmxxN1JVdUlzT2dJcjBUNlRId1ZlTjJqRGJp?=
 =?utf-8?B?VmpYSmppZk4yMFZDZkhOTy9CZFZLSXVjdHhLRXJJQ0pHQVZrMnNlenNvN2dS?=
 =?utf-8?B?Vk9TQlVhSnNiVWNlaXU4TnkzcWZxZ3lQV1Q3K1dVZmt1Uk5rRkxBWnhOZURS?=
 =?utf-8?B?NklJTkhmVjNJSDh1VzZxZ3RDYXc2OWZqTUFsejRTOHBEaDFkQTRYeGRxU1NN?=
 =?utf-8?B?UEFzUUxTb3NLOXl5MENzbmJCWmVaaTE2eWR5ZUsrZDY2TmJmTEJCTEh0VEJK?=
 =?utf-8?B?Z1d6RDVGVWtaQ2JSVjdhQUNOTVJZdEZlOXJlV2V5cXc0Nkk1NjE3VFlkZCs5?=
 =?utf-8?B?MUpZZm5NWHR2RitYdUtKTUE1VWtoVDF6TE5ZR3dSTk5TTUVkQmVFaENLVFhL?=
 =?utf-8?B?SkE3TlhEYXVnT0pub0grQTVUbDlreXQybCs4WCtGYWovSEl2VG5oVk9RYURa?=
 =?utf-8?B?M0pYMFZqUVlMRkRJQ05maEVnenNYdFNIUTdSSk0wV0xJVXpmaE5uMmlWOGhp?=
 =?utf-8?B?YjJKM2MyZ25YTzRteU83c3pjbkVGazhjOXloTlczL25vQ2o3YW9MbmJwRVJ2?=
 =?utf-8?Q?rMVVFNX44XNU6simADaKltk80KLN8SJ2Au3xWgO?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d945964e-28dd-428a-c551-08d8ca59b08b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2021 04:43:03.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT+pJgQdrP8WicmQchMvGP0t86ihYaXJnenp9oBZPxyMuJ5SVnZaYOQJ+LrEb62mJDmWnaYn75+dbe6M5J5Robf1QpKprtse4n2/zI61SV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6237
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Sorry for asking for your help again. Currently, I just have +1 or +2 
permission when submitting codes to 
github.com/openbmc/openbmc/meta-ampere. I don't have permission for 
Ok-To-Test and Code-Review-from-owners. Can you help check?

Thanks - ThangQ

On 01/02/2021 20:48, Brad Bishop wrote:
> On Sun, Jan 31, 2021 at 08:01:08AM +0700, Thang Q. Nguyen wrote:
>
>>
>> Hi Brad,
>>
>> I just see 3 commits in the meta-ampere folder while we have 17 
>> commits in github.com/openbmc/meta-ampere. Are the remain still in sync?
>
> Oops - I'm not sure what I was thinking.  I pushed the remaining 
> commits - please let me know if anything looks wrong!
>
> thx -brad 
