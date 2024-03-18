Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7687E643
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 10:49:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=enolJEeJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyqpC4M45z3cPC
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 20:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=enolJEeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2414::701; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyqnc53Yjz3020
	for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 20:49:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeKCnQSphmP3j04LH0Ogs+EM58morR3VJ3W8g3WwF+T3JQXlsFmzW+84dCLuo0z15AJU7t/XkBWphBNquAALVDa+25wuitEkV3leL9r8x1B6y1dWB5TQC/MSYOjF4FI34Xq2/JI/75/3aMwEnK+GF9NYUjiblz/Reu6JbsRrL1wL3Gh2S0xb3yiMg8jbUeHU2jyVfpofdmuHogxa/4VFeTtRh1YmffoYdFUTBdtXz32aWqljOPgGSgdwhQ3wrWXCRdvlPVfcktRkh0FudzFJEv0pxPOPxqVrJWs0ZguTCGN/twmCr3Hs8AeLdrzJIB2QuhHXedufQPC4RsR7IBxQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3/ycp74okAofij7yXh03gofzuR0e/9TCUsnpW8gfwk=;
 b=NmMg3sO3Ify2op9QjAmcTf+Uv/liiQqlINj4ChcCWrxnlHk3t6DVNjA+igQZXos3bUqqHT8S9bFAmDl80vIk2Xc7BclFSOGnk11sXPBoAnXrr4/QjvivFEcKf4hHtb1o1wUSAuaVFv/Mp3i6Wc+1Yy/unQ67+ryCXQyKeavK0MdrAy+PooQWGSlHbpMGS3iYNSdXHzoQ3emnfxT2Bm9VexrmORaqsc3l/F/1E57axn0YqOAp0acGbulLIt5Yh8lBKj94n6Zja7INRGrk110MHZQeLyYX25BLRpauV5NZqA8l74cD/hwKcvzgg2ICspc4rSEO0J3gXrtUK63UhwOwRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3/ycp74okAofij7yXh03gofzuR0e/9TCUsnpW8gfwk=;
 b=enolJEeJo5l6AM4S/rGbQIDcqp30g6shhPMqRA5nBcAYOluq2bWrrDUn348A2qmTMhBnIVE7TXIkzN4jEHOMElXQ4xgVeROSrFvV4A9b36d7Lm72FD0wzRX9Byv4PTim0PgqBrAvY/IIi+DH1viwkUvSDlWQVAo3DGmuPvoATNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SN4PR01MB7407.prod.exchangelabs.com (2603:10b6:806:1ea::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Mon, 18 Mar 2024 09:48:59 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 09:48:59 +0000
Message-ID: <f281d2b1-54ff-4e5a-83b9-5b05f18c40fb@amperemail.onmicrosoft.com>
Date: Mon, 18 Mar 2024 16:48:46 +0700
User-Agent: Mozilla Thunderbird
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <9d1207f1-4941-4f2a-99d6-371f5b4709f5@linaro.org>
Content-Language: en-US
In-Reply-To: <9d1207f1-4941-4f2a-99d6-371f5b4709f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SN4PR01MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 99582fba-3ef5-44ac-a003-08dc4730a225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UWSjllHDCtwzXRXyFxSxoCLT6DRVI9Rm7ikjENfq5yhE5lCYaCHbkb5/A0UIqK9GRgLQOMpv5S38XQ+TsSGw9ysyerX8Aq9nWYfON4QKVe8i3EVh4ZVKewTQU29K7aVdaQUMFHSeuauw1K81bxLI6NNC+CHHXZ3+uvq6hY48TIbUSYb0PHHQsm0rbAB2gIoZCJWO08hQomm2m5GhOWEGYXzAuPhUF76Lek+/bytpkLiY99wCDpsAjy1NSREcuGLZe936sk2AX/80ncW8FuTC1yx5uFg0/PdFgF6rLjvntxxo0tue69ZjcuoeRS+GTK0JCup/Lbj8ykPCQ6e9bK28XXkYFtZLcExo+rn9dOz08CbZ0YSIWd8AwznDc4nInqLbHsAW3fEH3+p8Pl2FxathY1s/BPIJ7cL9IJx+cv1CgGVy3G59UVn08hWWT7tnQUqqdw2w73+nMS1/wzqvnNjs38vHi0HDbcHY8Nlph66rPN/YrPVqLKoba81zTulZVX/DldgiT+TAv1VPMg3KmJt57obo375dDo4iPh12n0QSthY1AcMt2zzigQXAxcX9y0qDT9vZt46RRoUeUcJGUs6c/WY0BlTvH8880O//aXRBce1NrQBWuVo07ZcWrEB0Cg4+/xVWBcRKmHqnwwI8OHmgczcNKny9hnDsiHvAfbj05Iex6h/UxejIFirC6PYA5MYXJvnimxyKvWDax7EM+ur4iQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bHVOSThKeDh0bVk5dWM3RGtNM0x4Sk9XbmgrdWg2V2o5WmU2a2dIZ0kzdFRL?=
 =?utf-8?B?aW5MZmczZU85ZHlFSktIOXA1ckRHcWhrYm1rMW5kd0dmUnVnRGdQb1V4cjNo?=
 =?utf-8?B?QS91c2ViWUVQMzdVem9QamZnU05BVi9yWW45TlQxR3dCbGJFblp4VCtROW1R?=
 =?utf-8?B?NVIyMHF5NXZwWnI2amV6RExYRUFZM29neW1DRTZrNTlyZGlrUHY1b2o3elQ3?=
 =?utf-8?B?WWlXdU02Y1BTRTNDb0luWWZUUEI0QmNmcVE5aUtvZE11VzA5a0ZHajJRa0pW?=
 =?utf-8?B?WDZiZlY5d0l4SjE5alYybjdwckhaZDFSak5qVkpKRGdtckY4NWU5V0owNlNM?=
 =?utf-8?B?VjJuK1RJTDdRL0hPbXhsY1lSRVpvSFIvODJDSzVyeEpoblJsdENHT2RJdlNO?=
 =?utf-8?B?Nk1weFhwQ2cxa0VZWVFnQ0VlR1plUU0zOWl4VUZSUS8xR0pyRjJpK21XZDRF?=
 =?utf-8?B?dWRiSDBBNlFlYnNyekhEbzJnM3VtaWJTQTBqSFRWWVh5a1ZuOVZJWFJKT1Ba?=
 =?utf-8?B?YTJqd2U2SmdML0Z2Tmh5Q0oxUk9NbEZuVEN4bzZ6TUNLbk5KaFNaRTRFWGtz?=
 =?utf-8?B?THZ1bEpwdHJUTlovM21zSHVTMFk0RU9ONHhYU1gyRVJzWmM1cVp6azJ4MHBo?=
 =?utf-8?B?cDBxOExteDdsWElOQlZKOUc5d1dySk05OTJkWWZTbHBWSDRXYmkzenBiV0E1?=
 =?utf-8?B?MTY4dFVyN3h2MkR6c3plVGwxVWFZNngvSWtMTE5GaVRydnZNM1hqVHd0cTBz?=
 =?utf-8?B?WDROWXFSZTNVMWpYdFExZFRaT0pFTnllTmFWU3BxQnpYWGhxQ2RwTVNiYllY?=
 =?utf-8?B?bU9OL0RHRlJwWTdaRFRCbXVaNiszY0FteWgrUXZPZFpDZ2VFK2VVR0EvdWUr?=
 =?utf-8?B?NysvM0t5NnduNndsMnRaY1ZUV0tWYlFoWXNDYWxkWGttc0l1NnBYdEFOK1RN?=
 =?utf-8?B?dG85S0RKZXltS09SYWFLWkpjb1hnYlVsOTRzZXh6RlJhdDBKS3JLZmJrRXZz?=
 =?utf-8?B?djN3Q2hsdG5seW02ME8vWmM5dHcrOUY2NThLME43SjZJcmtMa1pscnZFL015?=
 =?utf-8?B?U0daM1YwUDgrNE9IVlBRWDdFTWVhK0dTa2pJVHJBK3FZTFpGaWtqSm00czhz?=
 =?utf-8?B?Mk5uVG9HUVlISjhiZ3ZBU05UOUV1bGpCdnFWUG5FdVMxbURFeGZaWWVGOUdT?=
 =?utf-8?B?dG8wcE5nZFFPdUVicHl3WWt2YmFXSDlTUXd3V2NoUGVDYjRESWlvOHdiMXla?=
 =?utf-8?B?NEo4UWNFUHBjcjJHb2FBS2hzN0pYc2JxblZEMGhCclUxeHV1cHM0SVhIQU9J?=
 =?utf-8?B?YXBMS1pEN01kT0hHVHVjTW1wUmZCbmhMb2ZmSGRRa3JVTUJUYkJHMFhlekdj?=
 =?utf-8?B?VnFEeG5uRTFRcG9hSmRwT21JU0xGT1dJVEVWK1E1MS96bW15R0huaWNkZnln?=
 =?utf-8?B?QVdQMDZiM0s4enpwc0Vlcm9RWkxMTUNqT3I3cC90UGF2MmM5TzZST05uMGly?=
 =?utf-8?B?L3VMNnNyM012bXBhcE1JaUh1ajVjM0xJZFl4MGZITHNpR1BKRTFuOHRIMEsw?=
 =?utf-8?B?SUtYRm1ldU1xQjB3UTlEZmZXTVR6K3hPT3ErQ2swN1hWQzdYUFpkV3Z0U21Q?=
 =?utf-8?B?NHJUYW82N3pKVWVPU2hpMDNZSmFBbG9yWmFma1I4SkJrbTFaTEhFNWNkUUZy?=
 =?utf-8?B?dGNVM1lTSnV0ekZ0SnI2SmplTitoYWU2a0krOUcxZzFZc1RuQ1BnRThnUE9N?=
 =?utf-8?B?UzBBbUFtOXFQWVI3WTljUU1zSG1KMTc5UEk3NmxROU5BN3lQYjlxRmZzV0Fa?=
 =?utf-8?B?SEQwZTdOMCtvU1Jyc0RKNkJ2SFFXOHR2ZCt0aFB6Ym0vTE5DSVNzZjMwZ1Jw?=
 =?utf-8?B?bmd4QW83OWdPaG5pV1hHQ3AwRnBpT3pOL3NQeEVPck9jMk5FMG9TVjZReXJ2?=
 =?utf-8?B?eStwTlBObzYza3B5TWNScE1LOVR4U2V3b1ZMUEExclVNTFFvVjFUTGF2eWEv?=
 =?utf-8?B?cDZFZUdaYkdtMWNRTk9xdUZKZTdCVFN0QUxzSmx2RHVKZyswcTJjblBTbldY?=
 =?utf-8?B?TEhzR3hxaUF2eC9obWRoN1JRTk5PU1pyTlYxVGZxSTdWcldtNFVCd2sxSXZO?=
 =?utf-8?B?N1RIcDFXQjUwTFpWbFpYd1p5bDlVYlFZZDJoT1NtWTlKMTlENVRRUVl4RStU?=
 =?utf-8?Q?rYOJmvAfx0wUr80TebAXXyI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99582fba-3ef5-44ac-a003-08dc4730a225
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 09:48:58.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKq1kesf5lQkC+A/FgCKxwvRw51bv1/d6++JWK5Uc3Vj/8M5zVAxb1wgS/AEv4bMVXHJic+qhoXCoJi809sKBQ9XBlbI4A/5BbvCWsNGFsSWumoRaqctJhjX3w1/BDL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR01MB7407
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/03/2024 23:56, Krzysztof Kozlowski wrote:
> On 11/03/2024 12:13, Chanh Nguyen wrote:
>> Add pwmout-pin-as-tach-input property.
> 
> Why is this split from original binding? This does not make much
> sense... Add complete hardware description.
> 

Ok Krzysztof, I will merg the "[PATCH 1/3] dt-bindings: hwmon: Add maxim 
max31790 driver bindings" commit and "[PATCH 3/3] dt-bindings: hwmon: 
max31790: Add pwmout-pin-as-tach-input property" commit.

>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> index 5a93e6bdebda..447cac17053a 100644
>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> @@ -25,6 +25,16 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  pwmout-pin-as-tach-input:
>> +    description: |
>> +      An array of six integers responds to six PWM channels for
>> +      configuring the pwm to tach mode.
>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
> 
> No vendor prefix, so generic property... but where is it defined?
> 

Thank Krzysztof! It is not generic property, I'll add the vendor prefix.

I'll update the "pwmout-pin-as-tach-input" to 
"maxim,pwmout-pin-as-tach-input" at v2.

> 
> Best regards,
> Krzysztof
> 
