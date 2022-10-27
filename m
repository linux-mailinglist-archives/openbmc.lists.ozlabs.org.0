Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F260EEC3
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 05:40:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyWfd5DJXz3c3W
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 14:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MZ+ctKP3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.115; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MZ+ctKP3;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2115.outbound.protection.outlook.com [40.107.237.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyWdz6FR7z2xYy
	for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2022 14:40:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaedGQnPiYCBuztZHiR0Nl0KX1tPH+yK/tZawFSoTVHq8VpbUW6/7gxo/FuIhX3xioPXo6ov9rDazNDIt1yIniF2I9kCZ+6bYz/WAz6GEJqYyxjzVptC+WxBARA/xpkGL8FDSN45z3QykdnvOYA1uCD6XA1YqZD0KGM1DmPaGsQzOIUDwJX8BdWlVSvQLzO6951taLG3wqKB/s3B+tKw7FQRqltUMp8M6BRLs3Nc+Hxal6ftdO39yPcZegkp+r+MsYCULrgFCE7lhoX5xAMicodE5SIkyKmEzxSg/WtEdnnZEJpPJ51F1wmlHbeydaCdOS69lCv8f0dTuDxeKys7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KyUr12g+UhQ42ynK/3G/0Myh3dlI/JGoZJu74cgGC0=;
 b=NPk2s4xO+upQiJhol9wZILdAgsxT7pwCKZcu8oR1UXKbtE3ofjGlRQx59G+u5anyAiUy3Q1cLfZmUTeJBNlpa9HCV8K1wufZOH1iiZkNP15QGhNGCAh7giKM7bqVFgtKkUtANa72wcuJwogqSzYpLluKxOlYNDoMY52/uRRLlzW7vRae2HArNv6unsKXfjE7s6AsljIhsEtyu6mA50rOorLDk6qXbLaNCDDeALs1MVBdOM4lCDFO/FFQ8E95Z0J9Y08f/GR30WXXVCTA68aH387+i2l1ZiBKYDPUnBxJJfaZ62Bnt6AeHJ4sE59yySJSGVQLm1jt2RbU+/vy61X1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KyUr12g+UhQ42ynK/3G/0Myh3dlI/JGoZJu74cgGC0=;
 b=MZ+ctKP3K+TCFWngBiqMCbgZusl283SAYshN0zALjuILqdy4QrVgEA/auA1OsIQAd6ihauIrE9gL4NNw7W/jOwVvDEtH42DLQ0Psw3/KOS2uGC8yA+PsJK95nls2Z8nz204dRXU/QrOmD3iLw+RfVf/Q3VJo0Zsi4N+lrtCCIIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SN6PR01MB4992.prod.exchangelabs.com (2603:10b6:805:bf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 03:39:43 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 03:39:43 +0000
Message-ID: <8d806632-aef7-a56f-9934-c07a0defdc5f@os.amperecomputing.com>
Date: Thu, 27 Oct 2022 10:39:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v9 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon
 driver
Content-Language: en-CA
To: Guenter Roeck <linux@roeck-us.net>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-2-quan@os.amperecomputing.com>
 <20221026150001.GA2545504@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221026150001.GA2545504@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SN6PR01MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d8c37b-66d1-4497-3ead-08dab7cce2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dkDK0cJ6WfNVqg74nur3R+cwdbnr054Fm9fuNqopTr+GfhlzaXHvBypaejVN+iv5BVDXz56KU7J6tAwSnHpX69Q5rep5CBUIo/fL98Qpqp761NjCS60+1FgKbZ+Q64YLIUE+NJSb07eNtCDAeYSyYwLDl+9SqDWlqGANvFvEUrCzc8+6zdEWidKVAoUO9zOYf7pKi1Fgarpp5ZXNPP/YFtoi4mOsgV/C3dGGO7AtRMc76C9yJjZzjWWEZWR1rS4jHYjWoGCOqpWd63sA5pvXc12CX3R95ii6Xlg9IPAvBCoxLW+sdv7ChTc3z0Y1XPiQ7do6moTpuVNZHevUt7tlqkvUWOxcJnubnFyUpsuV1DXyZ9k0EV7v1SLH/QbGh+2nWlyaeIB/B8teDLq3u50lwawxq1tJbdtjX1nCtOgTiJOr9crCewEr01uBlT55wvAnPqpXn/cXYlxj/TNCjL1pOqF2YmgpD7ijn6g4y1RK1zAGqw2VyKLv+YggiXAXY+5Yb3DmAY0qdvpns9XekmRg20iC1ONKKDfXXhamNbCCCZ6bvOMd2FAJZ0uSRsix4t9JsWzPEZKQfT4J2UC1rR2UcE62Lx3gtkq7WIE2l8XNTHl45aYWOvTdpwtRQaIauiXtFqfV1j5bUe2J7v4sG2MKzPqonihQ3/6SFet+RfwcAKYxYiUy3SKqDtd3W5tYDetaDbRrTWI/JpmDQ1NpKPvm18LRMwW0d+dQ4YIIFBVLSWUV1kRDbdNwX9wJ7ZJYojEpjxkrOGzbPuhjG1Vsh+zj0NypV49EH9TdFT+anuwcLKcVF4FMfIMhLI5i3RDpVZEDF8MKxw+yUx6XuIoR96VbHju9wsa/TjSiqU7v3oJsjISIkzr4IRV12N/GALHW6Ob6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199015)(83380400001)(31686004)(186003)(478600001)(6486002)(2906002)(7416002)(4744005)(38350700002)(38100700002)(86362001)(31696002)(966005)(6506007)(6512007)(53546011)(52116002)(26005)(2616005)(6666004)(107886003)(66556008)(4326008)(8676002)(54906003)(41300700001)(66946007)(66476007)(8936002)(5660300002)(6916009)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RTVXV2xkRC9xTTdIaVdmVkRXZmcrYmRYdExtMkY0VWZTNHAxYTVEYk5hNmNO?=
 =?utf-8?B?NjBFNEJwUnYvakVpRHpVbGNiZmUreGpmVE5HV1VCVG9TcmJCTGhzY0tjbE5y?=
 =?utf-8?B?WWVsWXNMeXhQYzNFNTNxeEpBNGtKdXBGSWxrdlROYXF1YWp3Qm4xT09abXUy?=
 =?utf-8?B?SENYeHcySDhVM0hEc2VUUkhxSmFXTlpGMitTY0Y4OGNpT2JPOWIrNGZzUFlk?=
 =?utf-8?B?TmdVSGtMUlJLa1JvUzJadHE4d2ZUbUdVc25YRnlIbFVPblRJenQrbnR0VVN3?=
 =?utf-8?B?L0p1MTBPL3E1dDZiZklzU1NKS0ZZU1M3ZzVORTExUUV1cjFkN3B3QS9LQVVG?=
 =?utf-8?B?cEw0Z1p0VHVtMmRBTC8vSHlndktVNjJiSllaYkRXenpJR1VnTDQzRTVvZ0tX?=
 =?utf-8?B?ckgxM1lGZk9DS0hXbTBhaW94QmNUTmIyWC9CbnhzTHZaeUxjKzAvNEpuQnhp?=
 =?utf-8?B?bEdCT2x4N3ByeWVmRThLekNRcXVmRmNPV0g2TVNWQ2E4T1ZCblc2UVlNT3cy?=
 =?utf-8?B?dGR5Z3dBNWI4Q3A3UzFiUzNhbzVKRTNsckxFQzZBMDhwUG8vSk9PU3paOGRF?=
 =?utf-8?B?VHFMUlFkSGE4VHNqSGZYKyttdHUvQjNWMmc1dnBPcmRoQVVEUUVJYWpoQlAy?=
 =?utf-8?B?ZzRzTG9sMlhmWXhFVmxMY1AvMTBkRFZJRS9QSzB6RXFkeG50Qmh3UmcyMExs?=
 =?utf-8?B?Q2xnYXByODdMaHpJaWZvYTZibitrUURkT1FOK1YzTk9pbDJpOS9mQ2xmVnpl?=
 =?utf-8?B?MHhhV212blBZN1dnSzNHOHpTSTRDNHIwYlhsd0J3VCtQWXJQN0pmYlZSSWda?=
 =?utf-8?B?Ty9DV3MvQlJSODcvcnp1ZC8wMXppSmJJQ1FrUjA0TXJNRDdQMWZBMVFucWho?=
 =?utf-8?B?T1lTTnFtWUpPNGFZRXJxT1VWS0NlMTExc0FaaUZJU2hQK2tLK0pCc0J1UnpF?=
 =?utf-8?B?dWlmWkhrTGpwenhkNHdVdGM5R2J6TWVrZlliR2xaL1hyOXdlWDMzbWZDUzJW?=
 =?utf-8?B?aUVST0hlMWcrcktzTW9YZFRxWFlaWWF1cFprWnlGbkdYaHFaOHlFUHVmdFJq?=
 =?utf-8?B?UCswYnd4Ym5CbWdVTDNoLzhnOU9mNU9qZ1owOGNwVFd3Q1I4dkpaMXJKRHBJ?=
 =?utf-8?B?aVJ1NXM1ZlB3cXBiWDJSWUcrNlQwcGJMN1dYbS9Xc1FONmMyMDhMTFZiSUxw?=
 =?utf-8?B?bHBjKzFCT1lzSjdBVjQ3ZDdTek1PcnhuSVNhcHZxRHd0aUtWdjBzR2dzWnMz?=
 =?utf-8?B?SHZ5My8xUG9LdFVHdyttNGFRWjR3bTYvZlFHT1BGV3RBWGZpbDVFZERWRHMz?=
 =?utf-8?B?eHZleEpubm1WTU5KRzg4OEUwVzM3NjErQnh5TThwdlp1R0NnbGxub0h4NEhE?=
 =?utf-8?B?Mm5Sclc2ckJHbDRWZFVYZEx6Q3VhUGNBNmRJSWVjZ1RnZmdIcCsxWWM4ZVpR?=
 =?utf-8?B?QUZJSEJ5YS9TdldTaldJTkxQbzZoYWtId0hWdWM0RjVtcGQrSUdVQUlTOWNn?=
 =?utf-8?B?RGVQYTdkTENydEVYR0NJbmNhSVV6c3JDYnZyZnZJeEZmQUdQRE0wdEcyWWV5?=
 =?utf-8?B?MEVaNDJFR0ZOVjFXeTRSYWQzWEdSQ3Z4SWxsSmJ4QVhCdTM0QVFIVmE2UkN3?=
 =?utf-8?B?OEZkZlAwbWEzcUwzd0EzbzR4VnpoVHJSbHIySGhjMS9iNUphVFh6cklPbzBs?=
 =?utf-8?B?L2tPMDVJVUo4RnNwMzMwbWFpcHkzcnB1SnBlVTVMaVpRaVlVS1o3NklnM2tm?=
 =?utf-8?B?OEprV0Uza1h2TCt4eE1sYVZneVhIaFNaV2tEeUgvaGdHT3hCSkxYeXRROEVD?=
 =?utf-8?B?ZmYxcGdNSS9QcC9aU0poUXhQMnlzZStBTGJDN05Ib09qZVNwekk1N25QWDdL?=
 =?utf-8?B?ZWVST3hNYjFwVjQ2M3ZoTTk0V2ttVG1BSTRnZVpXYjFEbUxmSWkxOWdyOW9K?=
 =?utf-8?B?ZXFoTHdYWm5ZQVVDdFFjcFJvRnBCL0Nla09udWhMUTNkNEdVZ0lvN1hmRDU5?=
 =?utf-8?B?VldDZUpXa29EMjA4OE1vWU5iVnNmcHFPeXBDWWZDeWZqMUwzMW1XeEZiVnN0?=
 =?utf-8?B?MVFVdllUaVBJUW1ISWY1cHJDVmRZSllBeGJ5SXdWdGIydkhVZkdTTkhpNjky?=
 =?utf-8?B?R25CT0h0WStwZWx3L3ROVDJ4ZU5XT2k3LzNJMjVvMXNPSWdORkxpL1I1RGZV?=
 =?utf-8?Q?VCmlpEcE+qU+6H+B5e/770s=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d8c37b-66d1-4497-3ead-08dab7cce2cb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 03:39:43.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODJ6NL2VPUrru9cd6WNLyas4qMcGlMsLh4kalpNP1r/9bAIoofqJz8zYQ3ADA8dOXaoOuhl8+ZaH7h30xjsJCsxz5l1T0O54F3SWV45H+vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4992
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 26/10/2022 22:00, Guenter Roeck wrote:
> On Thu, Sep 29, 2022 at 04:43:13PM +0700, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I see that the mfd patch was accepted into the mfd subsystem,
> so I'll apply this and the next patch in the series to hwmon-next.
> 

Thanks Guenter for picking the patches.

There are two issues found by Bagas [1] in document format and kernel 
test robot [2] on smpro-hwmon.c. I'll fix them in separate patches.

[1] 
https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/#mfea2167b99384486a1b75d9304536015116c1821
[2] 
https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/#mc86afb1ae9d332f152e0fb0d1908dac667519871

Thanks,
- Quan
