Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D1418E06
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 05:48:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHpWt44dmz2yMD
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 13:48:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JGRmh9Sr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.99;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=JGRmh9Sr; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2099.outbound.protection.outlook.com [40.107.100.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHpWJ6PJkz2xY9;
 Mon, 27 Sep 2021 13:47:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By1lqdUmyYH8rqA9+YlTmn1MXzMBsF2Ra/t+pguDXyvk8XT2+CcgCpe+dKyPqlVWcV5FJcT2alTfud2zJpYEkotTeM7aTig2Ey0lIYamR1QAiKsuJmgOP2tZAYPGOrWPl6VX8HQEOLJoE6gyyaZOgvWDpBXVsPNKNVjlOnddCxQnlmr62Mydl84zOzSCcwhvqo0DF7R6S+4wrDZMUNzSQqyRef1Qw/WM2BEsNHOOppTM/5QrhsV+YNopHsO3gc4HLdPI5YybU80+rNsnFL9cxyhuonx+5ykzmmTr6U5owzn6Z9xPmxU3bdD0CElfNUWRIiXdDqyhDPre2EJPK/dd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NINdeaaWYFdE/0HR5rKd102V1HkNd9gID5pR/mdt864=;
 b=QLMX7O4+56VArIfzk4XTJMi/n/xdCwuZlmR6pG5KOIobwU6xHRV9jFOHxrtdtRDFX5GY1IIUQsJDaQ9Yb38C7O8umppfkyVZhMDS8rlgm7bZhwT19hziAprDTRYL18KC79FsTrcbZEkSnzzjTNcSF5r8rUzpkmJoLF9SqvWxoXazyLSAfwL8RITb9Jib5EQLUPnCu+p/S8F2JCz9PvorN/DrrHIfDJO4CMVng3q55i4i/qoN5ziCpWwvLZgqhja+8XB4lgScCsrSVuv7ZUXfzIcvXd6uIyBetHaSnzhNInzoZ1RgNUiuw52Xl1fKK22+/3/ManfEy1KfqEGT3LO0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NINdeaaWYFdE/0HR5rKd102V1HkNd9gID5pR/mdt864=;
 b=JGRmh9SrN+GLogtU0Mwj4xVRiephmhhwd73gVG2lnGhmxfLRBmRVU6r99UIsUKduLjJNCRhtikJy3IJoS3cQu8C9Zm8dgn6jwEM4qxNrcIzUd8QvOniG/fvahHMaJbblTXfXrwf2ImOLwdK49m4LGlHeQMFYEBA7aQNgUBLasM8=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB4774.prod.exchangelabs.com (2603:10b6:a03:88::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14; Mon, 27 Sep 2021 03:47:36 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 03:47:36 +0000
Subject: Re: [PATCH v1] ARM: dts: aspeed: mtjade: Add some gpios
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210917082945.19111-1-quan@os.amperecomputing.com>
Message-ID: <96f3eda9-bb90-35c5-a6d8-870212046dff@os.amperecomputing.com>
Date: Mon, 27 Sep 2021 10:47:25 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210917082945.19111-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from [IPv6:2402:800:623c:d199:293e:d08e:271c:5ade]
 (2402:800:623c:d199:293e:d08e:271c:5ade) by
 HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Mon, 27 Sep 2021 03:47:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52722d80-976b-472a-f7b1-08d981698af7
X-MS-TrafficTypeDiagnostic: BYAPR01MB4774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB47740C3080DAD2067298863FF2A79@BYAPR01MB4774.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBkOQjx8eJHRs+0x3NpoB5nV0bav5eMu/N2hfUyIDisUBk5dMF1kY6nz8NrbMx1OlT4P8x0u4qsaWgQz8Zw1XriRkYVQlSgFNhQsy4NTa0AXzGK2quFEMbTFAtPgt4ytVi71EY3ICodPjzPvxNPhWqjm5FxynSDYUoGWLoFpOweZKRPfOheUBJLZ2cLK+1/faDDBaUqJL2BeJ/ojSVwPU7Pt6Qi8wWs1bUo6dXDY9Ahh7ZLk4HAi6oKUOtxu8lpVZul1SCQezbIYGCVqS5wU9Rm8mqIXGjLv5PdnYHX2QjQl7SMsGeO1jlY+B1ZhSu4JNF/UeliOm+MY0Skz1ubyuu0uJO9F7b95cy0wDFhwB1y3dEglnekRS7araSGDNC8FJQusNw/M9BRanCMCEow4tcdAXkEV/vSay3jYCzZrKbb29nM7NR4Fjc1BbGhJN25o+4T2f9P+9cnPO6VOzuEeCyLQFjD3u/Mc7qD71Omga1C4XdvfvTK+PkgIZaOTj3xmD5ES90phBXJWGkjAQFNi+xK0qzEHfMx19YMGFrrt+u1xfG81BXyxY/lXVbsFdQEiKBCWq/xh+rb+4u8zsdZ4E5bGpjhal1thzRR0OF/bzD298kUgVFmHtUshirtGLjdBN3zMKBPUzNf4pwKkelBg40bE4YXikv4WpplaU/yXrOdPqb6/rilfJpERoqyLloj2lTTf5V4Y+KvvBGN0rx8FAIQQpHVOXKeO2rfjewLyFmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(508600001)(53546011)(316002)(186003)(52116002)(6666004)(31696002)(5660300002)(66946007)(110136005)(54906003)(31686004)(8676002)(66476007)(66556008)(8936002)(38100700002)(6486002)(2906002)(2616005)(86362001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpIL2sxM0xOVTRraHRBbTZIUUN1UkZZZnNDdURjMk03c1VxWktJd05rN3Ra?=
 =?utf-8?B?ZGJDQjFOQm5IY3NIQk53cEhuWWcxbXZHQU8zOHVsWWp2Yk1LZWR3WFp4Sm5v?=
 =?utf-8?B?RGh0cGlTYlUySlV5d0JMUWFVVWs3T0VKNHorRHdjMXVBNEkyV0pnKzZTYUJB?=
 =?utf-8?B?dUZnM2gyWU1QU1NyaUFtUW5nMjlxQ1hYOW9yb2dZZzhyRHJuakwzZHVyWDcw?=
 =?utf-8?B?NzFZaTNaN3ZBYUMzWmduQXI2eFZjVGlkclRXUWdyOFhRV3hobEVOZ1A3cURn?=
 =?utf-8?B?K1BQbXd3dEpJWW5MQURzdFBHQklQQVJ3QXlydzd5dmJ5YndQTTRzMkdhWE5j?=
 =?utf-8?B?WTVmeWVRQjV4bE9ROG5oVDFTZDlhSlNIRDZLUldKc2QwUnlhcnBwaUxlanpI?=
 =?utf-8?B?blRhUkdxZzRCNFhnRWh6ekthVklVbjQ1bVVWNFRLZG8xN0dISG5WdjU0ZVRo?=
 =?utf-8?B?eHhzcGQ0dlBERDJiVU15RFNtK2lzWUxBTGRsTVlTeUN2c2xxTU9vd0gyNk5N?=
 =?utf-8?B?dGZ4TExKS1FIeVVqeGVLZXJHQVU3bWoyZUtRUlp1Q2VTN2NLMUtmN3d3dmpI?=
 =?utf-8?B?Q1FDa3R4eWRXcElSa0lEeUxSNndkR3p0dlpGMFdWaE9nTXVrVXM3UlFzdUN5?=
 =?utf-8?B?MFhheWxIbHRHUXRWbnpxNEJBZlUxUUIrMlZsQnBpcXhuTHpyV0diVlFzaDRm?=
 =?utf-8?B?UXpVZG9BTGJqMVdDZFlFUzdwV3NCK2Z4Mll6eFlhSGJXNjY4MDFPNGhIalYy?=
 =?utf-8?B?ZGI5RjVESm8wd2Q3VWN2NTNsMGNabWQ0WForL01uV1RiT0hzd1lFUDRiQUpD?=
 =?utf-8?B?UzcyRHgxUUF0SHc1RjdCY0JaSU15UXFtSDZRNlBORzhpa0NJcnNCMmszS1Nu?=
 =?utf-8?B?eWxhS1pybWo1ZURxbUdESEJGYlZlRXc0ckJHM2FyTUpFZTBxa25BUVZkbDlm?=
 =?utf-8?B?aUlXTzAydzhKT284Tmc4V1lJbDNvWm5CT1hUQTJRU1NOMHd2U2pUYXlDbUxZ?=
 =?utf-8?B?WllnaGpWdmp2WWJsUTVFeTRmbnFSM29QU0RFc1FBMDRMbEVIVDlrbHJhUlhR?=
 =?utf-8?B?NkdJRmlCYXJITGlWVkhOenoxUjNuazgvbUtYTjJGVFhnanlReE83bXp2VTRI?=
 =?utf-8?B?M1FYamJNVC9lVzRsUUx6WWtzQVpueWZhWHRRNXJFNUU5TGowMENYUmttREdD?=
 =?utf-8?B?NWN6eElrVTNLOUJ6alZBcDJJMHRaM3Jycld4SWFKbjd6RFMxZDh2KzRaN3lI?=
 =?utf-8?B?WWIzYmJ1WjRlNDZVazhGK21DcjBQZVV0SmZ5NFVoSmlYVjJuVmhNYnFNZU1M?=
 =?utf-8?B?eElTMjNtS0lTTDJQK3B4enJGbEV2VjN6emhXVi9ENWZNdjhsT291My9XRVo4?=
 =?utf-8?B?QUZ2Y2JlRzBCN2FnM2h3Qm9LcC9IeExETnphdVJFcStaUSs1NUJmeDl6R0Jw?=
 =?utf-8?B?TVIrZC9Dd1RwdWNsZ09lNG5qV0IxcnZXTDBvN3FuMW15YTFaSkZucU9zdzlR?=
 =?utf-8?B?WjBSVC9oQXdYTEIrQTdLNmlZajdaY0lPWDZDSEx0OEpvM3BqaEFYbk15NDJW?=
 =?utf-8?B?OTZpZktzYzgwQkhaSlJsSG5PSjhQaFY3TzVzZit1MnMxd2QyTHJJRmlERUZr?=
 =?utf-8?B?bnBTUHdCblBZYm43YlpncGlGUkt4dU5nU3YrMXZVN3BSMWVLaEZwQmtyMHNB?=
 =?utf-8?B?TG01aEZYcHZkT29uL05zSkhhT2xaRTIvN3BxbG9FeU1UTEhKeXdSaHVCSXJ5?=
 =?utf-8?B?S01JbDNPSk1zTG9tQ3ZEbkUxTEw4M1A0TGZGWHNnRG5vT24zRjBSNmZjZnRa?=
 =?utf-8?B?VkJhdExQcHBUNWtOaFFDbFVuTnV3UUxTUnZsQmdPMXA0N3RGL0FKbHFaVVBz?=
 =?utf-8?Q?4dQR/X+Qm9s25?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52722d80-976b-472a-f7b1-08d981698af7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 03:47:35.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4lb9ejQmrKnwvLiq/J//oN4S0rQGjtetKMg+yYtiscejpATdOH+XAv46tb5/OKsTCXPq51+V5RUNcJsmPGJqAlj2czgXarWWRPKGa0TUXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4774
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
 Phong Vo <phong@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


+cc:openbmc email list

-Quan

On 17/09/2021 15:29, Quan Nguyen wrote:
> Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
> authentication fail on each socket.
> 
> Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.
> 
> Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
> ---
>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 57b0c45a2298..3515d55bd312 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -86,6 +86,18 @@ S0_cpu_fault {
>   			linux,code = <ASPEED_GPIO(J, 1)>;
>   		};
>   
> +		S0_scp_auth_fail {
> +			label = "S0_SCP_AUTH_FAIL";
> +			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(J, 2)>;
> +		};
> +
> +		S1_scp_auth_fail {
> +			label = "S1_SCP_AUTH_FAIL";
> +			gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(Z, 5)>;
> +		};
> +
>   		S1_overtemp {
>   			label = "S1_OVERTEMP";
>   			gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
> @@ -590,7 +602,7 @@ &gpio {
>   	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
>   	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
>   			"OCP_MAIN_PWREN","RESET_BUTTON","","",
> -	/*S0-S7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","","RTC_BAT_SEN_EN","","","",
>   	/*T0-T7*/	"","","","","","","","",
>   	/*U0-U7*/	"","","","","","","","",
>   	/*V0-V7*/	"","","","","","","","",
> @@ -604,4 +616,11 @@ &gpio {
>   			"S1_BMC_DDR_ADR","","","","",
>   	/*AC0-AC7*/	"SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
>   			"BMC_OCP_PG";
> +
> +	i2c4_o_en {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_I2C4_O_EN";
> +	};
>   };
> 

