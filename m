Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82766B1621
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 00:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX7GZ5VXMz3cBF
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 10:06:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=9mmK6jRj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::701; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=9mmK6jRj;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWknr6lG2z3blJ;
	Wed,  8 Mar 2023 18:43:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caOai+KcRixd2Zvq4fjD06gRZOC//7eiD4l8tHSbCK0dXKW3UKnidvd00rNI1sAPKDlUPF+FeEz/XCEjoLo5zmpOITFffnGnXlF2Jdk8MCFKezAjL30f5Jjw52hj6lgzhO2dS+r4oP2gqnaAv+qUINTBpdUNhpgsR7yx3r7bxe8FuNItuwslmlbkkOtVMmGRJ7h1rIF3at2GJNLcHV9aihbhYfnr+Rr79FLqDVaeNXBBTWNNWeBxpJz320eCQ7kmKhd/cFevz55DErALLqcGr9EwMlXGsRr8njNiq3fGKAkmHymqIlfUIAOhiaUdRQUdLYPl4kKumMHpcm0z/vpSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIooDhCfTWDHm7yEdoEq3vG3IXqqSO4+27/oK9y1zf4=;
 b=NYUtB0gcx67UXKGTo9/kZO9wEtXXqOicHxbQLfgntP1rTZmus3dZlh1S/kcN2YXVhjeivRzwO2hbgVTG/iuNDr3O7E1qwKyKPZzkWbkzae3r1iXFBkP7yVdbNqI+LGyPDO5qIwkJwLPee0i8ccR8sCYB413OGt/bO6/uur7VtcX9HEmuzVX/xNksPdu1QuEtcGK2U3YVvDn3ss5Bn7pBRcW3olJh2ydcMhhy/u/hRboHUSo8cyrMTVPxmc+1aWg88qTT79YkAbyfBbdZKBtdZhTXfaMJFW4iuguNtsvqvi/lTbh/5R880CRq2ypTQFtDFbV3E9jjkIqhvckty/fIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIooDhCfTWDHm7yEdoEq3vG3IXqqSO4+27/oK9y1zf4=;
 b=9mmK6jRj4sRIjn+ddo9rdT9TrPX7bhNBmAZ/RAFfZUnXgZDpTgZNmYmMs8qg9Y5rCzOb/3x5sNgvGG9md8Yw7sp8XYPvMtMvCc3eLrlJ5vgTE5qiPAs4U5mGT2DVWdBItFgG5s63NAsb5St41RuZW1uokETxv8yfchm7Gb8t5ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 DM6PR01MB5099.prod.exchangelabs.com (2603:10b6:5:59::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15; Wed, 8 Mar 2023 07:43:02 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079%6]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 07:43:02 +0000
Message-ID: <298e8999-6faa-044c-43ef-552d107cff5f@amperemail.onmicrosoft.com>
Date: Wed, 8 Mar 2023 14:42:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20230228102820.18477-1-chanh@os.amperecomputing.com>
 <CACPK8XesuUATxCVEGpus=ZHTkjS=L=gjRHC3V+=XLSofU-WSSw@mail.gmail.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CACPK8XesuUATxCVEGpus=ZHTkjS=L=gjRHC3V+=XLSofU-WSSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYCP282CA0019.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::31) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|DM6PR01MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b73fe64-52d5-43b5-6220-08db1fa8be70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NtHxfmCrHeiFaYb/ZrHuqpdY5skQTioeifs9rax8P0v6pm2StBdoP46T+1oV6KBf3Ok/gVDQbTSIcNlkIg5UXcygG5ss2XRF/XmwNz5hqzJg6OayvfElBQXWnqRn/Q0G5Wy4EPynNhop5w2DONq+JhW5Yr6fqcyl39czZ7yGqsDBYt9ujtSEuk5lGdnpsrhzjbBDvUDKzrGYqkX5bmoGwE1EJFkjpJHEdsDViUK1vQVCxX99AbBZ8/N86QtfLz6ZSE/XtDtoXTqFtDKex+gfZAtn6jLqz0UVi6qg5Hf+83vz78m9g9MELO5YZUS4P5V3XYMY6twA5hfg4+89UgIPi1Daitg74KumqwJJnl0hEpDQVn7V/VmUCNdgdsCqSWYFsFCH4WfiFf34/jX8Ntl/qs/7D1i4usfAxK2XbT8jGblfRiqx8Q/GtpIiwtYxeaxc29V8CWnlfmXI09mIzGSGn+TeavjZpLFbXkfm7E0lEZnUVnBz8GoLLFtQP7iLShNgeI9YyHEiBbKDDJkzZmLtMq2/N5LlpDWi9B7QshTscFJM0tKRZrkhWcw5hUyCHCTnDjLBi/3QoGcTxaAlfSmcoVb1jvKcG5AF/V7amm9dN990857YEKX1N+SZ6yhFibwd+4t5hM2yzgiSOHoNZ3BrHP3BWavK8ptl9FJn4YHxR9DPznomRB5xI9JlBG9Y53HXccLvN9KAJxk75moTULioQYWLE0jAaGA/GGzzbQLUnEE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(451199018)(31686004)(2906002)(38100700002)(83170400001)(31696002)(42882007)(6486002)(53546011)(186003)(478600001)(6512007)(6506007)(66946007)(110136005)(8676002)(54906003)(83380400001)(6666004)(4326008)(66476007)(26005)(2616005)(41300700001)(66556008)(316002)(8936002)(5660300002)(449214003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MFczaGltN2xnMmszbE5oVGpabzdjWkdCbG96YzZNSEp4WThqUE9laGl6bHVU?=
 =?utf-8?B?Y0NhNGpPdmEyQkFzSEdRTG1LckJHditUTGxaV3V3TXR2TnJKcXJzcUFFWHV6?=
 =?utf-8?B?UkNwc2pTaUpHQUhaSW16bDY0bW9CNlRYY2ZlM1FFUXZ5TTVSaDRrMXhLTUsw?=
 =?utf-8?B?M1l3N0kwRUFPcnJlQzM3ckVCMDJiMktQU3R2OXY5MmM5a0s4cDhoQitSS0lH?=
 =?utf-8?B?YTNIalh0N0RGS0U4VVc0RVhtdVovQ2kya2w5dElUZEFMcC9uRjlwcm9ZOVdZ?=
 =?utf-8?B?ZDBUN0ZrZUI4T05RcVNHMTlKMm41TXRCV1gxQXRKVjFDMXpyWUE3KzJHWG1r?=
 =?utf-8?B?b3RqMU5CUW5hM1hmZGdyWUx2MmorVUVSWUlYMTl6ekswNnFmQ2tGMlNOZHJy?=
 =?utf-8?B?NGwvWk1SNFlta3oxbWxOZVM4QjVENnFkRjZiaXZjVXJERC9uRXNLY05kNnlN?=
 =?utf-8?B?WXFPTVgwWTZmWGJybDRBTGQwcVU1dHZaaDgxbDVTQWh6L0J3NmFKNzZwOVRh?=
 =?utf-8?B?eDEzL0RCaVpiRGhNVmNXa0dWWXBONGxMWXVTVjNjVVRMc0NRYkZ1Nm83a0cr?=
 =?utf-8?B?SDQ1MytCS0dtZm9kUWx0M0dFRUdINUxUUVNqdzFpM0R5WGZwNERMazViZnRC?=
 =?utf-8?B?M0pRYVduLzBsbVAyaE01TmxGbjc4b2xjUk81d1NxdWY2ZUFHcTVKYjdLV3ls?=
 =?utf-8?B?MkpqVDlwTkY3SXVaRHczcjRzNXJXbnJtVWhYbUdRVHdTRUlmajNoWkVvWGwy?=
 =?utf-8?B?a21keEJiR002YWFwODdIWHJLQkh1VklkT09RTVRGMzQ3b3MxWkhjRXl1Ym9R?=
 =?utf-8?B?TG9VVVZaT283alZ6NzNnREdRZG1kaC8rbS84SHVrVnBNdW9oWktPby9uN2lN?=
 =?utf-8?B?QTZyRXIzUmJzUUZvVFBqc0dKTmF0RnV2QW9pQzJkRUliTU9kZnE4L2pkcGNj?=
 =?utf-8?B?ZGtwZThjbyt3QmZVWWZvUThlaUUxMDhDMUQrWFlIbWgyU09GR1Bvb3BIRkQx?=
 =?utf-8?B?ZmExM2o2NXBJbnFCTlRCSHJGSDdlaEV4K3NHR1N2aEhHV2RqZFBZRittR3cx?=
 =?utf-8?B?QXZjVTlTTzA3SGFMMkUrSVNGL3VUQUZpVkpiYmFqNWFJNk5FUTZOT1gxcHdu?=
 =?utf-8?B?ck5Va0tOVFBiU3ZrKzA3M05QVVpKUlVTREZXVm9GZWVyaXNzYkJWb2RPZkVG?=
 =?utf-8?B?Rk5palM2L05CcHpwUHhHZ1F3SXo5Zk4vcG1ib0pUT1VoTjQyYmJaZXlqMnUy?=
 =?utf-8?B?QU9jNUlMbTBFMFlObmJZcy91bHFjMk1tQWtXeFlxL3ZZTlpEWU5GUkc3RHRP?=
 =?utf-8?B?emg0S3J3UzI4N2pDQUd0d1R5M05uMGVwczVBZk15Smc1SlJLeHhaWWR1cFRo?=
 =?utf-8?B?YVg0NkV0V1h5cUZXNWtXMW92TTRrd0N0SUNRTi84MkhSS2tVUUlwZzVrV05S?=
 =?utf-8?B?NVphOHFxUEgramtwUUZJQXlMNWd3WEYvc2IzRUMrc05qRS9vNEhHMlkycElX?=
 =?utf-8?B?b0pmVXNNSFMyc09BK090cFkxeXdXRkhCbjN3YVBrOFRlbUR6cG9HQ2hBZjlC?=
 =?utf-8?B?VXBuRWVVMmRNNGZTZCtsemx2cld2RWwza3VHeitUT2FHMzI5U29LTHNkV1Yw?=
 =?utf-8?B?L0pVcHFQd0R1U2U3YitRRUw2ejlRYlZhMXZTRUdHUk9iRmdILzBZRTd1Qkdz?=
 =?utf-8?B?M2k4QlJ4MHNTTXFQb3BPdXlVVENMb203ekFKZHd4anVNekVNSUx6NVFXMUcr?=
 =?utf-8?B?RmZiRCtjZ20yQ2JabXBhK2kxdlY2TjdXL3MzM2czMGtxMmtKRjIzeFVsWFVs?=
 =?utf-8?B?MHErS3BVVGFVMHpnYlZSY1RhcTJxN2JZdjlkVkRYKzFSNUtpcjRqNGlXc0hI?=
 =?utf-8?B?ZXlNZTJxOW9OS29nZmpyNUNVVHZHNW84bngwdnZSVlJaWWVrc2tKcEovVHQw?=
 =?utf-8?B?NmZKMHY0SG56S0Rqamo1bmVPTFJhSGJ1K3VLRlM0Z3Z6R1ludzFBUVpTSnhB?=
 =?utf-8?B?UlBBYVh1SFdlNS9PSHQyb1pFNGIwUXFZK2lKMHp6V09MdEFFUmplaC9xZW50?=
 =?utf-8?B?eXE4dFhCYXR2cXJvS2RtZGxjRFh6RmJtaW1DcEIrYisweTBUUElmMld5Ym1D?=
 =?utf-8?B?dU9mQjh5Z1RVSWpjWGFHZ2lPR0lncndKOFZtMWhvNjN1Sm4vaUdveGE0OTQ3?=
 =?utf-8?Q?qQbR9abAAaohI56PBrYJJa8=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b73fe64-52d5-43b5-6220-08db1fa8be70
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 07:43:01.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvBU2DSzHHKp0mPFkVlmoNRncbGVyhEXA2A49ZNT3yWfHjqRelLd/iZ2GGzmYVXokKwYOFKXgdLR3GPI43ocivE2NK/7a0Xp6PT4zzmem1cZ+c9Eu9wpga1gnG3KQktU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5099
X-Mailman-Approved-At: Thu, 09 Mar 2023 10:05:45 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/03/2023 07:17, Joel Stanley wrote:
> On Tue, 28 Feb 2023 at 10:28, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>>
>> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
>>
>> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
>> so we use only one of them at the same time. The OCP slot #0 will
>> be enabled by PCA9539's setting by default.
>>
>> Also, enable the OCP Auxiliary Power during booting.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> 
> LGTM. I'll apply it once we have a -rc1.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 

Thank Joel very much!

>> ---
>> Changes in v2:
>>     - Change PCA9539APW node name.                     [Krzysztof]
>> ---
>>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> index 4b91600eaf62..1e0e88465254 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -251,6 +251,14 @@
>>          pinctrl-0 = <&pinctrl_rgmii1_default>;
>>   };
>>
>> +&mac3 {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rmii4_default>;
>> +       clock-names = "MACCLK", "RCLK";
>> +       use-ncsi;
>> +};
>> +
>>   &fmc {
>>          status = "okay";
>>          flash@0 {
>> @@ -439,6 +447,26 @@
>>          status = "okay";
>>   };
>>
>> +&i2c8 {
>> +       status = "okay";
>> +
>> +       gpio@77 {
>> +               compatible = "nxp,pca9539";
>> +               reg = <0x77>;
>> +               gpio-controller;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               #gpio-cells = <2>;
>> +
>> +               bmc-ocp0-en-hog {
>> +                       gpio-hog;
>> +                       gpios = <7 GPIO_ACTIVE_LOW>;
>> +                       output-high;
>> +                       line-name = "bmc-ocp0-en-n";
>> +               };
>> +       };
>> +};
>> +
>>   &i2c9 {
>>          status = "okay";
>>   };
>> @@ -530,13 +558,20 @@
>>          /*V0-V7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>>                          "host0-reboot-ack-n","host0-ready","host0-shd-req-n",
>>                          "host0-shd-ack-n","s0-overtemp-n",
>> -       /*W0-W7*/       "ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
>> +       /*W0-W7*/       "","ocp-main-pwren","ocp-pgood","",
>>                          "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>>          /*X0-X7*/       "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>>                          "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
>>                          "s1-overtemp-n","s1-spi-auth-fail-n",
>>          /*Y0-Y7*/       "","","","","","","","host0-special-boot",
>>          /*Z0-Z7*/       "reset-button","ps0-pgood","ps1-pgood","","","","","";
>> +
>> +       ocp-aux-pwren-hog {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "ocp-aux-pwren";
>> +       };
>>   };
>>
>>   &gpio1 {
>> --
>> 2.17.1
>>
