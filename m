Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD86FBEBB
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 07:31:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFmwN6gmNz3fL1
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 15:31:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=YWbkN/BP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::71f; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=YWbkN/BP;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QDfX71svLz3bT5;
	Sun,  7 May 2023 19:39:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4hdQ36AhwxGU5+hBeF0m+6KPgzQwjJQuhhVW+VGD56F+IS1xzDe2lTCjm8EmJqOZN1iguJoj3kaWE25Om39esTtlrXaxWKv+3v1tvvhpDjVX7M1iCZcTFCnoSs7tH+Pet/Bw4Uyl6HUIsufTd4maclxn9lnp0vRE5oeiDjm+ES4C4xg1icT5Pp+8vhDuigOLgWPtxme8FxHwBhUMJnTLdzoE9RMHSQsDF7k1wi9rvQs5sSFZ2EcD3YXHcFZHAvG4XKZuZzrLr++cUdMbGfiZfsDzbCoEGx8qO6ETmEMJNRjgtgqGy9QM6WAbCoz2VI6LZLlHtnrXHe4t5rE9lFRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLWPYakXX8ljvpcykWBKeLGEgWnppqPZA5NPbUgqEqk=;
 b=oEgz8X9YrI2ax1NgI6VJ7UmgA/as59RYzo98GjcGWZuqyceapFikfieCsgp1ruixJ9Ren/ySd7xTif9SLZ3dGlfailF+yGe8gHqjYgGyjiR62qqyG6ytHRA4yE1D6B8Su9r+5gYHaj/e08SwuFRtjEbBkZUVeKz5WDyHOin+jFCQ2KitAkm4i0vKIsWGpCykppStBiVLZhupupMnshN0E6KXxIHztBNAE3+pwJmvUEDK4RYSOatmZeaDQHkb3s/TuVxqG2D1q6zhE0+ISPrN3zs1pA7Rq+X/BMJIRuhxnbETX/QCgH7qjioB1OdR2QPsdEkVhUI3pWZbuP9A3M824A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLWPYakXX8ljvpcykWBKeLGEgWnppqPZA5NPbUgqEqk=;
 b=YWbkN/BPNXLtX1yAs0hMmQrtGCP/vu5dZ3oc1XLSHUtKMMPFHnzjL7Yn06Xa85qGcpZrU4a2cesYbdjlF5zHr4Tg1ArqtC8B9QW1NRQZIRf/Y18AC47gIcSVMTncKzObrNrbbL/vaF6xanYCanCycrWiJsO5GW/11egaerQZvb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 BN7PR01MB3988.prod.exchangelabs.com (2603:10b6:406:89::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.31; Sun, 7 May 2023 09:39:10 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::9caa:9d8e:688e:9e1d]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::9caa:9d8e:688e:9e1d%6]) with mapi id 15.20.6363.031; Sun, 7 May 2023
 09:39:10 +0000
Message-ID: <d230c413-fab0-50e7-20df-ff84e951f68b@amperemail.onmicrosoft.com>
Date: Sun, 7 May 2023 16:39:01 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] ARM: dts: aspeed: mtmitchell: Add I2C Fan
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
 <20230425065715.21871-3-chanh@os.amperecomputing.com>
 <7ee3eec8-b5b4-2591-adcd-1831bf7de02b@linaro.org>
 <5d1cc7d5-2d73-c1a2-f95d-5810757640d2@amperemail.onmicrosoft.com>
 <969bfca0-9fff-0b22-6db1-113a7e998bc8@linaro.org>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <969bfca0-9fff-0b22-6db1-113a7e998bc8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|BN7PR01MB3988:EE_
X-MS-Office365-Filtering-Correlation-Id: 90216730-a736-4da7-3533-08db4edee914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bmTOq64VV/HdDMc6sE+OZwHClpM+oHZcyBRUACv7C1plPZtIWbtjDyQch+M6hR/1o9xF814nwgq/WyHX1z56DUhJKZFsCYPdrN5MpXlgizt5bhgWMXguP01FYELIl18Bd1yiVZwjpkjb9gMT5SJteBtH/Weqvwb4mjvrQb2/Jpor2kAabWnvaQN0APF9c8bn2NTrAE/5ut40A+qC9CT7roLesBk7+P9WWpR+CoPBJ3TdVs6hRNNXI2HVpZBNU0zjUi4/7mMLB+UhgkiZsXSffeS0yXRRtUpuBeN3qr80xL/9g3RYZXGSg15lBwNRvoSfzEYHURE5v6nsbSzKcfdSS0LC2c0MvNlrNFLPt5fo7zD+ygvwxtfKUOb3208q+DetcijGVb3OCBQZfLlK70M2CUJkIWJHj+Z0gGMyP9PoAQdjUfza3SPN44Owfl4W8bDzmlEGzicmlj0tYnYLaBR7R6+O10GRjw9Jko2RWDXRKuQzXfa36hLUS1Z2Lz/tq1nuzzxFPYqxMyod6YQy3VkiP+NKcVDhfXaQLzUHEt63YD3l4xDlnUKFHV7k/x6pFO2idzYhV83/4tZchMzdfWMFZX5FBh8vTjyzaFMJsqnaZz4ZX7LpOv97QeJ8ldfKKQz/
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(451199021)(31686004)(966005)(66946007)(66556008)(66476007)(478600001)(6486002)(316002)(110136005)(31696002)(42882007)(83380400001)(2616005)(6512007)(6506007)(26005)(53546011)(6666004)(8676002)(8936002)(5660300002)(41300700001)(7416002)(2906002)(921005)(38100700002)(83170400001)(186003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Q3pCSGVYc1VvaEZHSTBvdHQ2V256aEh4bjhEc3AzTkthVkFZZGYweC9DdDhr?=
 =?utf-8?B?NWpXaCtwbHc4cUdsVGRuSHZYMVNCQ0tLU0xodHVZN3JCelNUdjcvSWtrR1dz?=
 =?utf-8?B?ZW1lVzF4aXpweVhkN3JIazJkakpmdE1BVER4V3lhZlphVXNXQ2dOQ0h5cHJs?=
 =?utf-8?B?cjlhc1VaMXRSOHprZlFpZkI3RmlVTGwwbm5xejhhSW01TXAxM1hnSGxIblVt?=
 =?utf-8?B?ZDNrWjQwb3Rhb1FBZ1NEZSs5WnBVV2VJcS9PbVYzVEc0eEpEUXVJWGpzNW05?=
 =?utf-8?B?aEpwMFBrNHV4WGR1QXZGbUlua3VWZ0w5bnNHN2VDZGg4ZWFDL0NYbXBNZlVs?=
 =?utf-8?B?di9DOVp3ejlqYjNxbmdMSWF2WlJYTFBGK2xPOEhLN3h0aEcvSWdwVDMwbjBW?=
 =?utf-8?B?WkZxQ1VoRGN0aFZ1Sk92dW5KWk1neU5qOVFDcHFOaWI5Z2pXR1Uva1hYUU45?=
 =?utf-8?B?bUlESlZRZkpJbmw0Q09NRzFHc1VlbGpmbnJmam10ZXJCZXUzN3pzUUVTU01S?=
 =?utf-8?B?SnZVdDV5TXFyTHFZWEUxbnZNYjFrUmEwMGRSby9ZemZkL0VudzgyUlJNODY2?=
 =?utf-8?B?SVFhTjZhL2l0cjV0a2tmckxGcmwxSUdRSGFsRldVdHliY2JiK0dJTlpTWXNJ?=
 =?utf-8?B?ZENGbHErVVdGQTRTSjV1T1lMemp3QVZWWEdaY3g4NUlNQWEvd0M0eEdjQ0hr?=
 =?utf-8?B?eUs1OXV5S0JUenZPenA3VlZERG83aml4WjIySGU4alRrL2RPZTMwajRZMENx?=
 =?utf-8?B?MnpjbXdsRFVZOXQrMjc4WmRzL01HTTVqY2NmQkI0dnNDTjd6ZTFpWHMrczlH?=
 =?utf-8?B?TkpkN093anNzWEVVbk0wSUZhcWpxbHk4QnFaazVnc0lzazRGMmpPZmRxUjBF?=
 =?utf-8?B?Qnc4a0R6OEZTZ1NkS3pGc0creC9MV2FIWGNBd3RhTXVZYUgrMGpWM0hEZ3ly?=
 =?utf-8?B?b3RKSkFrMEZ5Q1ZPTnZSMktWK2RIRWFKY2sreURlOEVnci9Kbm11aXo4Z3FU?=
 =?utf-8?B?cFRVQUdpRVpxd1YrOWpmZEF4Q0UxbDljQklnd0Yvd2F1VS9JdGx1QldTNVhs?=
 =?utf-8?B?MTRhSU41RjZrNjA3UnBPbjBIc3NyVmJndmorN1hKanB4ak1BSjZpS3pSOTZh?=
 =?utf-8?B?d21EYnVZTHpHN05QWUZRQy9NYUtGaE1CUWRkbHZvS0lNUmttbzRSSmJzYlNy?=
 =?utf-8?B?YWk4SDhQNUJyZUxpZTZXeGNOaFlJK0hFSFhGWUJsc3JIZlg0SjllMnh3M2tT?=
 =?utf-8?B?QUNqa1p4Wk0xOXFpMmY5OEJPR3FUWDdaN0s5dDFFclFWaFNGUUI0VW1RaGFw?=
 =?utf-8?B?NHpVSTlVVU9aeDBueTJCRzNBVUJLcmE2QzFyRDFMS24zbTg4NlJTVGk3bTlj?=
 =?utf-8?B?TThqZXN2VWNENy8yQ0JHYmhWZ09xZFhDU0IxRzFqN3lYUXBob0p6L1NkTk94?=
 =?utf-8?B?WHA3RFBHRmVTcnlSQ3Q5R21VNTRESEhsd1NGVjd1V3FtTERBL0ZuRG42V2JR?=
 =?utf-8?B?VVZaMEhYSEdtR1RWM0xjVFp0WG1BNU44THY4Zzc2YzFjcktrOHlDTm9aS0d5?=
 =?utf-8?B?SkZEb0h4MHJjK2RKZWQzdzBGTDUxZnE1d1NUaDNyWW81czJleEpHSHFPWXdi?=
 =?utf-8?B?cXE5QXNNRUp5UURNTzFSTmk1NmV2bnN1WGZLWWM2blp1MURMUWtnWE1zQkRC?=
 =?utf-8?B?L2d5ZDgrTVlrVmJ2OUx3bXBUcXZUZ0p2aU9xbHE5UXJGdVJHb1RTQ2IvNGxn?=
 =?utf-8?B?YVJBOFcvT1FMWEFxb09wdWM0WTFVNGc2YnBaVnQ0c3ZNellwZU5FcU9sRVVQ?=
 =?utf-8?B?dzE4UVIzM0ZIajRJV0xKK2RnaXJQRWJncjNYb0RYUTdycEZwMW54VFBxQ0ln?=
 =?utf-8?B?VG11amowMzZFR3N1RFJPYTNvd01wVkI0ZFJKQlVUWmJoNjN6c3NWRDdDV1ov?=
 =?utf-8?B?M0RGUHFuR09ZTTVyMitqdlpyUXBPeU1ndjVkSUdaRjZtNE96VDYzWG11Q0Nz?=
 =?utf-8?B?U1p0eFo3UUNUUWFYdElNMHVhM1cwS3VUL1VXUk8vZXhRS3RPaTNGbTg4R3Nv?=
 =?utf-8?B?Yjd3UjhmOU5DSmJndit5eEM4NjQ5OTRLWi8vbEk3RnUzQ1pNaWU2d3gxRG4w?=
 =?utf-8?B?c2VqZjRLa25XMFNtdDlVc0I3RlUwelIrSkQ4OWZYVUFWU2pCb0xFUGtqZnF6?=
 =?utf-8?Q?RNx6wxbbArojm7qIAD5wazY=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90216730-a736-4da7-3533-08db4edee914
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 09:39:10.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cvR4mJksRoGUKq57oXRBtatlZ/vQEBkOaGuMVDgedyMcvsICz7+xBZ9CMOaWpsp0kNI2qMI+O38qWTRnJxiQ8TejRj24/npo5Ook4ihu6HK5XsNsu21WzoDp3j26eNf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR01MB3988
X-Mailman-Approved-At: Tue, 09 May 2023 15:28:47 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 07/05/2023 15:23, Krzysztof Kozlowski wrote:
> On 07/05/2023 10:20, Chanh Nguyen wrote:
>>
>> On 25/04/2023 20:15, Krzysztof Kozlowski wrote:
>>> On 25/04/2023 08:57, Chanh Nguyen wrote:
>>>> Add the MAX31790 node as a Fan I2C controller. It controls the
>>>> TACH and PWM for Fan Mt.Mitchell system.
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>>    arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>>> index e79f56208b89..6455cf80da0e 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>>> @@ -477,6 +477,18 @@
>>>>    			line-name = "bmc-ocp0-en-n";
>>>>    		};
>>>>    	};
>>>> +
>>>> +	max31790@20 {
>>>
>>> Node names should be generic.
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>> Thank Krzysztof,
>>
>> I think these node names should be "fan-i2c-0" and "fan-i2c-1". Do you
>> have any other idea ?
> 
> i2c-0 is not generic. This should be either fan or fan-controller,
> depending what this is.

Thank Krzysztof! I will update node name is "fan-controller" in PATCH v2.

>>
>>>
>>>> +		compatible = "maxim,max31790";
>>>
>>> Unfortunately the compatible is undocumented.
>>>
>>> Please run scripts/checkpatch.pl and fix reported warnings.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Yes Krzysztof,
>>
>> This compatible has not yes documented.
>>
>> Should I push a document for max31790 to
>> ./Documentation/devicetree/bindings/ or ask to maintainer (Guenter Roeck
>> <linux@roeck-us.net> or Jean Delvare <jdelvare@suse.com>) ?
> 
> Check on lore.kernel.org if there is ongoing work. If there is no, then
> please submit new the bindings (in DT schema). Maintainers are not for
> writing your code, so it's you or some other developer who should do it.
> 
> Best regards,
> Krzysztof
> 

Thank Krzysztof!

I checked on lore.kernel.org but no submit is in-progress for that. I'll 
submit new the binding document for max31790.

Now, Do I need to remove the "[PATCH 2/4] ARM: dts: aspeed: mtmitchell: 
Add I2C Fan" from PATCH v2?

And will push again "ARM: dts: aspeed: mtmitchell: Add I2C Fan" commit 
once max31790 binding document was available upstream.

