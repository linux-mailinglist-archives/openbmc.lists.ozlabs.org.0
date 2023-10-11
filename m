Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AA7C520E
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 13:28:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7OZRwC5F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S59Wk4RZKz3cQr
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 22:28:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7OZRwC5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S59W42tTMz3cGL;
	Wed, 11 Oct 2023 22:28:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu+TuS0MzzPbG+6MT7wbsyOycY7PSBEHzrx1By3B5xvLZ/ENyarEg2D9p4bZl/Yh2pXLIvk2KV3jAcSKTX/GP8gdaxIf+GX3ZzJ5kSGnFUb6s0WsX6fLPeMccyU/1QYiMoz5lF7fgYlolNLyQrppgqxlVWMe9PWiRy2K3Pifmr5Jxl7DG2Bvcap2s4G9qquD+UgS1uXtWeMLfau+m3HS4mEwcJAg4BXGPLf2uoyM4gR374THRmPSeXVisZqm5nNJkkuWo1hRawmeshAVPNx8s2Vl01LgydsgRnMU5omIVMNaxKSyA3eV8QH/ZLvsvyqbHWYdJXUDpX4PWUfiPrOtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqPbKovkNkj+ANhq6xXjgQ800hS9Ui6fd7iOSN8t2H0=;
 b=KrnhPz95ojWLP6JuC1UMuvP/Qc2GQkbT4gd/L6YBo4mLGsI2uPeuOCHZ/0DgM+aSvlxCofANqDmjbewxWOS/BDSR4oZSvSvfr5RPzkxwxeZidSqcTEoYu5FQt08APVQw/Rm3WZrKbLZvzscfNlmxlTwu914vQUwihlMnNC2R2ljzbrLoMRk3HfJrFpNoWwbGUHBfyr+UfKIrCkCfZFdNIuFZ7FQnu8q/2PbxEDHOhv6j6vbaceeYyzyd9NHkvOnCuQAS4FWVIdktVo0Xmviy62BdUhGnn4IY66Cb0yu/FiV48KtTawivq4w1ZwDHRiBhPAmRfR8+jPj+56m2eaY1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqPbKovkNkj+ANhq6xXjgQ800hS9Ui6fd7iOSN8t2H0=;
 b=7OZRwC5F23tlKBLp4tuIQyUa6NGfx6oFfgHYwvXZEN4xMfnBTPQPWKzr88XE25M2cRGS7QfueSH3XGf+TmfX/Paso/o/AzfbbGtqA4ir11es3XQ54sBsQQk+gP/hx1g11bMkdMD+nCGjDf98C0cwfcURNn688NmMzO2TlJ6BFFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 LV8PR01MB8525.prod.exchangelabs.com (2603:10b6:408:192::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Wed, 11 Oct 2023 11:27:53 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 11:27:52 +0000
Message-ID: <92b76d7f-8eaa-48a8-bad0-714101c558d8@amperemail.onmicrosoft.com>
Date: Wed, 11 Oct 2023 18:27:39 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Update the device tree for Ampere's BMC platform
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
 <CACPK8Xeo+7hTmfYR-eR9H4teUFqs5vOcSRm_VvDoVOqP4D6+NQ@mail.gmail.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CACPK8Xeo+7hTmfYR-eR9H4teUFqs5vOcSRm_VvDoVOqP4D6+NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|LV8PR01MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 400973ed-ddb9-4336-b125-08dbca4d1b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2MOTy4cDdWqu1PJu79BxJ5ejC2wv6l823x1mN7x1vTfxAwvYr+5WuvjoOJ918Y0H/Mh6PemcFMxfTRF9toHTJ3jtwWWxLbyLKwXOzbZxaBDRkGrj1Sv00xvY1iH/M7Nlol9vvKDUg/W0q9FB1v1nupylq4PbJjjA5aeUhYTOoDuxBbEWX676HI8VS4aOm4JXhlBxcqJuAgqn9DbdWh+js8kbuvf5ThkWlZfjRi0hCUivrvxhtu/xJxLP1CqefgKmzKIB7VUdbs/C/BDY9v/HhH46xpRCd4KoOCohV02uMbV2JZDs1MNSdYDsHYAUPmwSSHZmQoaomTDto/9CtxNTnoqPMYr0wSMkSirP+QJJQpmuzVqWMlN6SM/xwbEGiL8Sdud73Qe+4Gba/D1UBwVtfjfY9mC9S2oKe3rNCXyE5sCM6+sBY+/htIBvxf37mvLFImDHL8BloKbndyBPrCwerdULuWVGB/1Evx9qGHIMT4kg/wu+nFnXnRV+Qj80Zd5s/pjaIZ3h/8mNQc1TtyE8BP1Ywa9w16K2EboNmmCHT1r0cnoRgyX95Rp7ttVAWsDS3ar1zR0CKSN6aj4R/3M6rPLzY4IQtjXK1shCFEhwR6k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39850400004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(478600001)(6486002)(966005)(2616005)(53546011)(6506007)(83380400001)(31696002)(6666004)(41300700001)(8936002)(8676002)(4326008)(54906003)(316002)(31686004)(66946007)(66476007)(66556008)(110136005)(42882007)(15650500001)(7416002)(2906002)(6512007)(38100700002)(83170400001)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SG4wRUJReWtXMVRFZWI1cGhQM2s2R2RXU0xUOENTMzF5b2VmWTR4MC9USExl?=
 =?utf-8?B?S2x1VXU5M09KWkJXZk90bysxb2VmM0RoMWVna0N2Tlg5WGpYb0I0V29wLzlN?=
 =?utf-8?B?cVptM1NuZjBSZTN5Qmg0SmJCU0lhT1M5MUNzRC9zZG9VQU1maTJoSU5GSTdL?=
 =?utf-8?B?b3NMYXQralYwd0g5Zm1VNDVrNHYyUVliUXltV0dNaFltWVBETEtWZm5UZzR2?=
 =?utf-8?B?K2lPaEV0TUxUYVQ0ZnV1SVV0NDFpdXI4Z24vT1p2STVTUTN5K0ozUU4rY2Jo?=
 =?utf-8?B?TWltZnpNTlU5Yi9vWG10cEVkNURYWmdsNlhFTWpSZUdkWmk1TXRqZVN5TkNl?=
 =?utf-8?B?MXBiVGNBak5mN2IxMDJvWXM5TWNYb0xqeWR2UmkzSVlPS3hmbktCSmczcU80?=
 =?utf-8?B?ZnEvWmpIMnkrKzQ4enZQMHVLMHJSemtNOU1OWjZqbkhIeDE1SDY3ajRYZnRl?=
 =?utf-8?B?N0JpVC9MR21iWGh2Qk1ydnEwQk9Ca3ZaUUk1emc3S3pFUkU4WXQvRnVBUGFE?=
 =?utf-8?B?TkhLd1VUU1QybEhXSUJGWFpNeTZTcmhBMml0Tkp2NGRpa1NHM01EOVZ0T1A4?=
 =?utf-8?B?QW9idVREbkt4Qis5STRDcW5HL1NzL29ScnVQNGNVY2s5QU9vZ3phdHViYVhz?=
 =?utf-8?B?V1AramJTZTcyc3YvdVBwOVBBcXNxdmJ3d1NzRjVTZWVaem81TUFpMWVQSmFE?=
 =?utf-8?B?SkV3ajZxU2o4Ym9TSGp3UXZYeHdjMm4zRG5KSWc0emMwKzloSFlyM3dZcE5U?=
 =?utf-8?B?eXhiS1o4R09EMXBSMUJ2UDVOU202dEdtSjBCRTBmWm5rSWxmekNVVk9yOSs4?=
 =?utf-8?B?d242OGVtRGlURWVxbURtdHppVUg1NTNmQ05oY2hPNEFpd0NFMUozbTJmOEh4?=
 =?utf-8?B?UzVDQ1g5eEZHajZpNktIMTlSR1FtMGNXOXdxTDRyVDBaOG52SUtDZ1pybTVt?=
 =?utf-8?B?bHh3Nm94Tzh3KzQ0a1piMWp5MlFmQWxxWTMvVWh0bk5teVNSYno1U2NBWG40?=
 =?utf-8?B?Z3AybkdhR2U5U1J6aXB5UW9ETjRrZjFDc3ZxYXZUUHN1SFA4NmhWdy9pTFN5?=
 =?utf-8?B?NS91cDAzVlltQWhuZGJRNTg4Lys3WHVQWGJEQWs4aENpejNraUphL203UU9S?=
 =?utf-8?B?R2RmL2dkUmRmR05aTTZ1YXkzT1JSNGt4UmxpM3lJcWNva2lNWlo0d2pMSTVX?=
 =?utf-8?B?Yk9MTjk5MDEvZVc2bEd0alVGakdySmRBbWNYWFJiWmVScUxVOTdQSmpKZEc5?=
 =?utf-8?B?TkdCTDBZOUVSbHZqRnF1UmRQdlhodjVvMW5PSXBwRW5DWUdjVzRLSnU4ZXBI?=
 =?utf-8?B?NHlRenMwUDlaNjh3Sm1PK29MaFBPb3hGZERBb3JMcXAwbThaU0tjRzFmRlVP?=
 =?utf-8?B?WmU2MGc3MFRwWEpxa2Mzb0d1VzJZQlE0ajhsR2dtWjlHcjU4QzFvc0RGTUcx?=
 =?utf-8?B?SFdXTkY3ZWtqc2lQSnp0eXhoWml2YVYxME9MZjYrUURaSE9GWm5kL2ZNVTFQ?=
 =?utf-8?B?VzJRWUlFQXEzQTJQNTlJcjdpTk00eGFmMW9LUzcyOUlyeW5jTEV4cndaN3Rv?=
 =?utf-8?B?SXdtcmRrUzV0WEs2eGJudmh4MXR5YUZ2YWxLbzBDMzdyeWpVallManVnd3dO?=
 =?utf-8?B?bGlLa3NKYUVGQlR6bmJjMmpPNkNIYmF4UjZISU5sWUc3c3BlcEsya1V1bEZz?=
 =?utf-8?B?ZWpjYVRsZkVqbHUxQ2Y4MmtuczR6MVB2ck1xTmE0c3JBMzVnYW5hbFJRNlFF?=
 =?utf-8?B?VjB4OXZFSnpKK2kwSThmYXZxTkNFSkRXdVhHMmpwWWI5OVJmd1k4dloremE2?=
 =?utf-8?B?SnpUd2xTeFFUTlZObC84WGpobjhOdmc1RTQ2SXovSFAydjlLMXhFMXZYRWRU?=
 =?utf-8?B?OVpQeFVwUU5TallvS2N1YnhKTTg4Z2VZai84L0lqdXU1dDBzTjAzbEVNZlBm?=
 =?utf-8?B?ZjNJQWN4V2FndWp1VnRwZDFLY0J3SHRXYmkzeEE2NlZpSEN3bmJOMnovUlQx?=
 =?utf-8?B?NEZRQkZDNnFvU0NLeEw0NzlWWk9vWDNaeEt0aXY2WFR6UEhGSmhLeDk1SExK?=
 =?utf-8?B?Y2xJWnJRbStRSXBvaVVJTHdEaGVld3U0ZGQ4MnMxL1BIYkJqNy9wT0UwclB6?=
 =?utf-8?B?WEtCd1RHL2JqNHp1VlU0Wk1DMkpVV09Zc1RXODNPVXp0YzBvV1F6T3hLQk91?=
 =?utf-8?Q?YlWKnhQ3KMg1bDNzBwx17ag=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400973ed-ddb9-4336-b125-08dbca4d1b59
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:27:52.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/rQlAlzXT0gFzkR1tmy9odDLE6mdo/UkpTKEs8E8pf/UdsGfoekBlZBigu9m+0FdRvx0HqgemUngUcxIwmE3/foP0/I7GamrZdjcqmDmM4q+Ruk5IupCUMCphTuJOwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR01MB8525
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/10/2023 15:31, Joel Stanley wrote:
> On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>>
>> Updates the device tree to support some features on Ampere's
>> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>>
>> Chanh Nguyen (7):
>>    ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
>>    ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
>>    ARM: dts: aspeed: mtjade: Add the gpio-hog
>>    ARM: dts: aspeed: mtmitchell: Add LEDs
>>    ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
>>    ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
>>    ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port
> 
> I'll merge all patches except patch 4. Please resend that on its own
> once you've added names.

Thank Joel very much! Please also help me push them up at 
https://github.com/openbmc/linux !

I'll resend patch 4 later.

> 
> We should consider creating openbmc documenatiton on recommended LED
> names. Would you be able to help with that?
> 
> Cheers,
> 
> Joel
> 

Yes Joel! I'm glad to help that.


> 
>>
>>   .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  66 ++--
>>   .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 315 ++++++++++++++++--
>>   2 files changed, 334 insertions(+), 47 deletions(-)
>>
>> --
>> 2.17.1
>>
