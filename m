Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DECB4333A9
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 12:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYVZz6n47z3c73
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 21:38:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=RvR6BYwb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.123;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=RvR6BYwb; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2123.outbound.protection.outlook.com [40.107.244.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYVZS02RVz2xrS;
 Tue, 19 Oct 2021 21:38:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGiE83nZNsqBsJbsmp8XmNaaqk0OILHlejh5DcKD0JaFS1khvVrE8+rbwIqDaWhhv4okiTJ4PJ4GAGffeVDGPD5oROcgOe8EY1zhJsC1NITjcapqAbGPz5Gl3Z4Z2NIdi+MpMBX+nFpSZPAR3lUSoGtaydidKKJTSkTOApVjvnz+C5YjCclxnihpiqdnVmSt6cd7YhHDqDrlptqX1xxKuWTwiO//Kq6sMRhnAEb4hDs/KhKgjNyxWc8R3/39aCAb4Vb8Ds0a3RjXSmVHNMb4ZhXGcbMfEK0ssgiNn7NsrEp6p1NGMW6c0Q7Ca+vIITAQZ7tU2VjUSamFubbDBdFyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7yWm3bkKTkq+MyS2SQO7QnMD8ckP/yInVUO4fAv8V4=;
 b=SE72hs5fa+wPEiSFxJBoTg8ORunkU2phzeY8fuHfNVYahpsdazSGPaAjTceH6WJXP/5RkdKrD3f49lwbiOFsFdhnT1huKs2Qo1D3KI8zXoNyoNqrGaoo739FEdvEHYJxz+bHj2khrMXz+3LcTb+4Vzl30+2Io+Q29UDBHp9LEgbe5plXkWZ0kl2UeWxUS7OPYjYCAd2frtzC9WZey9L+IZU0SJgOhui8NbA6sn5O+68QAxkivHp+jc7D41/RqCov6A+Jy/gS1rvWl9JKSDW7wFdU4Er0D8CUyU+/NSYtgVACaehwKnsXRY46uzcOMV2qub5akIis6MRSWimjCJOpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7yWm3bkKTkq+MyS2SQO7QnMD8ckP/yInVUO4fAv8V4=;
 b=RvR6BYwbPANoBcZM4/QZ6YVAVQdFYr2Q/genSDlGZMiUyWEFTeexyU2oEk6DlDc70g7xFRMtx6R6He4Ye3mkM+HQC0N4MBWHsIzzWYSkGqt+QqI3yMhyfNgFewkg8+Uu+c9tTXmTDP8fPxALyxuaZYmV89KKrbdsTsMPE3D7J/0=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB5286.prod.exchangelabs.com (2603:10b6:a03:86::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 10:37:45 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:37:45 +0000
Message-ID: <161db1b2-f52f-2bbb-7121-a4097df8cf48@amperemail.onmicrosoft.com>
Date: Tue, 19 Oct 2021 17:37:34 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: mtjade: Add some gpios
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Quan Nguyen <quan@os.amperecomputing.com>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
 <20211019060155.945-2-quan@os.amperecomputing.com>
 <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.197] (42.116.119.23) by
 HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 10:37:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98cc5d47-7daf-4680-35c6-08d992ec7cb0
X-MS-TrafficTypeDiagnostic: BYAPR01MB5286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB528625E5E8F98DB92250CB448DBD9@BYAPR01MB5286.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsIHlkrD6Pgk60kE/0HiLcOvEu4z/IRlQElG5hjyKYqj/yVTTIWzx2NZD2Q9J//W1oI5Ri34Ur08YRu672PO4lfLtY7oQ6glyGO62KjEzufoNArCpj2k5y1T2dDUvoBcMxzB7qmb+mJ5QyfKhGc68cL5Mb+aLdC8UgbVU5fbjjcVqct+APakXYot65M9TQwrzlnVBm8aqgBowC1TXqTbgGtOe8H17mhEZS2lvzbdmoRSzu9Xm/BWSPNzw11URoSuoNpeb+cAviJjdMf1JBxx4awTdTPJjnNT4DqqG8bFetR/WsXttINACamkV5eTIR+l9HvfMm2dNlA9iba+r7LU0LYIk8vXKPbx3dOQybwotz50XXYJBnqmrZAar4wwlIFyj6MLZv4jhhmSHJvlCPKplXAWDX02dIjY9B9hT+ZCmdZZGqp7j/9GU6CPKe7woevKhIJC1zqGDEe+2xHgioxaxVpR8YwjwyVGqDYrCn10lfa7LYz3DsZIBdaUe6DEBJZFEz/EMb9X9aBBImHXjIfGkmns4ud4DPKqaP+GoSqblPRENF1phM+d9BAcycZrTP7KrDJtII9J4TS1MRHUvQ/Ne/v5f4WGCXbHhhFMk0PRx7/6eLi83AuigjU4CmPaqoQF1kZMF7ylsFKP9iVPu1OqjS+oQhPGRQmoddkASzzoUKXfDpnZgzE/7zlfMxkKSqLteeOy6yVVNU7Gg02A01w81SINH/VylJ3oSiuszGFHyM1zrrRFzDRmwvj8H2xlJk3IvIpuBJ/78zShgkw0L/dfilWYs6WmGRlLkbT7eTBX5l+X33BytU4E23N9SdSoFzjtWZgrOc2rPzqck9tl5UGXgEipSp8r+SSB/T/EnIXrPQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(26005)(66556008)(6486002)(54906003)(956004)(107886003)(5660300002)(53546011)(966005)(83380400001)(110136005)(8936002)(83170400001)(31696002)(66946007)(2616005)(42882007)(16576012)(31686004)(8676002)(316002)(38350700002)(2906002)(508600001)(52116002)(186003)(38100700002)(6666004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGxRM2Q0YnFrSFdIYldkdUtJRWNnaEdqcC82WW5hYjFxaUl4ZzdtZ253S3Ja?=
 =?utf-8?B?OUF0bEVQU0puREFLdzN1eFRRNFlBYnFnUGIvcGZnN0h6cUpaS0RQRS8rSWxC?=
 =?utf-8?B?WUljZ3B3Z3l1TzBnTWtRNW9lSnhvZHUyWGlnZEtQSXBpdDhWK1VDQ2tmMlM3?=
 =?utf-8?B?blBJam8zZlJuV3h4VHBiVllPRnhDZ1poYS9GOXg0RFlUeFpDaGpwSVNTRk9S?=
 =?utf-8?B?NUV4RWtlQzN2UnAvNGpQOU80UmpSM3BGaVJlYmRONTc5RnRHbmIwcWRMSUE5?=
 =?utf-8?B?T1orWHhKdkRrQTZiM1BUUXNQRzFtYUtPaUx3bjQ0eFJHTWVMOXRiMlFDQnNM?=
 =?utf-8?B?S0JHd2RSZFRtRkFXQ1NRNzQ5cVNwZEV2K2FUSlJRTStOQjdRT2FkSStzSnJk?=
 =?utf-8?B?OTRhaWpNQzFneVpnMjZ4REZpK2kwZWRvdW9URDQzcDFlNnRxNTBST05nVWpP?=
 =?utf-8?B?bktNYk5iS1JnaEFreVVyc20wcUNWV3pmRXAzWUVjTnIwdmpLNGdPcEdjUDAw?=
 =?utf-8?B?V05yRFU2VWhqQU9ZUjFEZUJJUG9pS1ZxTVQyOHlHcTNFc3NZaHI5aDR1R1J4?=
 =?utf-8?B?S1BLR1B5V0c3MVVXYmxZMkpDcjdXYlBiS21sZGV4UDRNV28vZzVrclZFeFg4?=
 =?utf-8?B?aU85bzM4MmtsREczdTZHbDlSRTBtZWs3WkdiVGxWUzZZNzFjcGpHSlh3bU1M?=
 =?utf-8?B?bHpFajdQV3o1VUxWdnBaN09NZ3dPUnJCMTdWUjlneDRpTkNNcmV4YjFmeFI0?=
 =?utf-8?B?MWZXenRJbzdaRWVteTk5Ylh5LzNvaXdRWW1TWHBoSU9nWTVJZXlhM2Jhb0Fu?=
 =?utf-8?B?T2p3YytVMVdOU1V5N25DM1MvOWxhVzZJWU1Sbk1IK1A0U3YxZXcwREVIWER1?=
 =?utf-8?B?ZzgrVytSRDg2Wjg2ZGFTSHlmdy9lUlhDcVdhUEN0K2lWS3BXZ1VLSmZ4Mm92?=
 =?utf-8?B?UXdQb0h6cUZmbDMyU0dmRkxtQWVrUTlpZ0ZJMy9VMmVtTnMyakphVkN1SjRC?=
 =?utf-8?B?UlVCdFJEcmIrTCt3dEhjQ2ZvZjdVdGtuWUZJd2hPc1dGMC9TWVNwRnhaTlgr?=
 =?utf-8?B?Q1gwbkVkN1Z4RDdpdXhMV05vSUpRME9GakxZUDJEUzBadURjM3pVTlJaNlJZ?=
 =?utf-8?B?bDA4N0dKZFVIdlc0cHZleTRRcm02SjlYbTVvS2t4N1FYUm5jUmo2Z3VVczBU?=
 =?utf-8?B?bVNHTmllY3hac2prV0VieHNZalFmbG1xRDVyYXNNRDJXUmtjL0Z6VDB6eG9K?=
 =?utf-8?B?WFVOakljbkx5QVV5dm9raXhkMDkzb2ZVWWtWcDdGS0s4NWtLQWlGMTZsUG1y?=
 =?utf-8?B?Qml6N3lYemtNeFA3UUlpdmkxSFphNnFSU3RQWGptd1hHS1pUb2R3T0w4UHhJ?=
 =?utf-8?B?YVdtU3hUV0IxNjR5L09ZRGFLVmdURnkyTllzL2VWT082ems5T3VXOEx2TmtR?=
 =?utf-8?B?RE94TUM3WmlOU3VTSyt0Ulh6MEFyUnRBZjVPckEyMEtheHNKT0NYeDhBMW94?=
 =?utf-8?B?cndSUVJqTnA0WVNHOUp3cEVFbmYyOUZTazAwdjJuVjlGeEVmTUJiNlFLdnZk?=
 =?utf-8?B?MlJPdy9Rak9ZNEFMLy9UT3VFWVd3UmVKNFp6alNzbG1XZG1yY25EYlZ2VndW?=
 =?utf-8?B?U1ZFNUp5emJIRTY3dUxqTmVrd3FGNkdLS0R3MnJWeE9OQ2JsaTIrc0lRNFla?=
 =?utf-8?B?SGo5V2lqUzNYeXNVc0hHZ25GK0lZRlZ5cTd6N01JRGlFb1ZLZWVueVF2Wm51?=
 =?utf-8?Q?qLOnsuC62FbcFmf+jPcN1G8tPmsapblt/k/lnP7?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cc5d47-7daf-4680-35c6-08d992ec7cb0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 10:37:45.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhvLgr9/9lZN0gPaL2yZllo4XJfTl3rnGTdKD+KvtPQ85KpxYJdsGS2pk5M+VJyz66OmPT8zp2I2i+IyesCH+qiHbuS32cAASm2TCX8/QFOEBfo9KZ8warZRiKFCH5hI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5286
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 19/10/2021 13:46, Joel Stanley wrote:
> On Tue, 19 Oct 2021 at 06:02, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
>> authentication fail on each socket.
> 
> These use the gpio-keys API to expose the GPIOs. I think OpenBMC is
> moving away from this abstraction, and instead reading the GPIOs with
> the gpio chardev interface.
Can you give an example of the suggested change?
> 
>>
>> Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.
>>
>> Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.
> 
> OpenBMC has started a process to document GPIOs that are exposed to
> userspace, initially so a common userspace can be used across
> machines. I like doing it for the additional reason that it provides
> consistency in the naming.
[Thang] The BMC_I2C4_O_EN GPIO is used in kernel only which enabling 
access to all I2C devices in I2C4 bus, like FRU EEPROM. As it is used as 
gpio-hog, no userspace access is allowed/intended. It can't be 
configured in userspace as FRU EEPROM is probed only in kernel boot.
> 
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> 
> If you could take a look at that document and add your GPIOs where
> possible, and then update the device tree.
[Thang] I am aware of this GPIO naming convention document. But I think 
it is to define common name for special GPIOs that applications can use.

>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
>> ---
>> v2:
>>    - None
>>
>>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> index 57b0c45a2298..3515d55bd312 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>> @@ -86,6 +86,18 @@ S0_cpu_fault {
>>                          linux,code = <ASPEED_GPIO(J, 1)>;
>>                  };
>>
>> +               S0_scp_auth_fail {
>> +                       label = "S0_SCP_AUTH_FAIL";
>> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(J, 2)>;
>> +               };
>> +
>> +               S1_scp_auth_fail {
>> +                       label = "S1_SCP_AUTH_FAIL";
>> +                       gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(Z, 5)>;
>> +               };
>> +
>>                  S1_overtemp {
>>                          label = "S1_OVERTEMP";
>>                          gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
>> @@ -590,7 +602,7 @@ &gpio {
>>          /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
>>          /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
>>                          "OCP_MAIN_PWREN","RESET_BUTTON","","",
>> -       /*S0-S7*/       "","","","","","","","",
>> +       /*S0-S7*/       "","","","","RTC_BAT_SEN_EN","","","",
> 
> I suggest you create a proposal to call this one
> battery-voltage-read-enable. I know that some of the IBM machines
> intend to have this same GPIO.
[Thang] is there any application to use this pin name?
> 
>>          /*T0-T7*/       "","","","","","","","",
>>          /*U0-U7*/       "","","","","","","","",
>>          /*V0-V7*/       "","","","","","","","",
>> @@ -604,4 +616,11 @@ &gpio {
>>                          "S1_BMC_DDR_ADR","","","","",
>>          /*AC0-AC7*/     "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
>>                          "BMC_OCP_PG";
>> +
>> +       i2c4_o_en {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_I2C4_O_EN";
>> +       };
>>   };
>> --
>> 2.28.0
>>
