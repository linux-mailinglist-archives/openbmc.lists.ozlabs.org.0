Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047384AC33B
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:28:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsqmG5X11z2xD4
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:28:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmNYYnO7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BmNYYnO7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsqks2GZbz3bTD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:27:17 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217FIgco019502; 
 Mon, 7 Feb 2022 15:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TzOlYLc85Ck7SZmU7USrzQtTDeFsAwpvHAUxAamHprk=;
 b=BmNYYnO7s3S0tDJPB9I3fb5P3ItYzQe4Az+0iWBeHAk/19aJGwu2moe6zcLOr2xt2q48
 q0Ko2yugU/htAAzwQV/xVBQydiXTSFlteJLZfUl0uyvDIWb8dq7a0TAqZUhvMciQ/lKv
 WXq/Be7cB9URO+tgguWuTmsk6wwIWnqkeVW9SQ9muycyrDmlDKQNrfBvotB/evmjCFPV
 yo8lqOP3kBir1uzVt6DrwLV6/ABU/zhX+PbGGu8CM/Bs/RdvfS/82IQ2NJgCnsh+zxGq
 SIVOJG45PifUyAQIEWhszG05a3daaokX/JoH0REHn5Ulfu9Z+IomqwJdYTSti4KHZ6D2 kA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22u2xqpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:27:12 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217FDcY3003115;
 Mon, 7 Feb 2022 15:27:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3e1gva7vjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:27:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FR9Ha26870200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:27:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 743C5AC073;
 Mon,  7 Feb 2022 15:27:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D23EDAC059;
 Mon,  7 Feb 2022 15:27:07 +0000 (GMT)
Received: from [9.211.55.47] (unknown [9.211.55.47])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 15:27:07 +0000 (GMT)
Message-ID: <b158c014-8ac7-ad8d-7060-e0c34122a7d6@linux.ibm.com>
Date: Mon, 7 Feb 2022 09:27:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-7-eajames@linux.ibm.com>
 <4bd0324e-9226-4072-8cb2-81ae305db55a@www.fastmail.com>
 <585eb304-8cb5-563e-d8f9-feb5f336c50e@linux.ibm.com>
 <a006b9dd-aa29-435a-870f-b58c30adc1a8@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <a006b9dd-aa29-435a-870f-b58c30adc1a8@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BSPGqWFhMJ0dIS5LJw7pL6iP93EpZTSu
X-Proofpoint-ORIG-GUID: BSPGqWFhMJ0dIS5LJw7pL6iP93EpZTSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070097
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


On 2/3/22 16:12, Andrew Jeffery wrote:
>
> On Fri, 4 Feb 2022, at 02:31, Eddie James wrote:
>> On 2/2/22 20:17, Andrew Jeffery wrote:
>>> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>>>> Hog the GPIO pin to reset the TPM.
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>    arch/arm/dts/ast2600-rainier.dts | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
>>>> index aae507b4c2..d0e82d1512 100755
>>>> --- a/arch/arm/dts/ast2600-rainier.dts
>>>> +++ b/arch/arm/dts/ast2600-rainier.dts
>>>> @@ -108,3 +108,14 @@
>>>>    	u-boot,dm-pre-reloc;
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&gpio0 {
>>>> +	u-boot,dm-pre-reloc;
>>>> +
>>>> +	tpm_reset {
>>>> +		u-boot,dm-pre-reloc;
>>> Do we need this in the hog node? Seems like it's only necessary in controller nodes.
>>
>> Yes it is necessary, the SPL dtc compiler will cull anything without
>> that property.
> Are you sure it's done at dts translation time?
>
> My understanding is the driver model core will only instantiate drivers
> for devices with the property. This suggests all nodes are retained.
>
> I used uclass_get_device_by_driver() in the mach-aspeed patch which
> will forcibly probe the driver.


Well, I can use fdtdump and compare the outputs. It looks to me like the 
node wouldn't be in the SPL dts at all without that property, unless 
fdtdump simply isn't detecting it in that case for some reason.

With the property:

$ fdtdump spl/u-boot-spl.dtb

**** fdtdump is a low-level debugging tool, not meant for general use.
**** If you want to decompile a dtb, you probably want
****     dtc -I dtb -O dts <filename>

/dts-v1/;
// magic:               0xd00dfeed
// totalsize:           0xa46 (2630)
// off_dt_struct:       0x38
// off_dt_strings:      0x8b0
// off_mem_rsvmap:      0x28
// version:             17
// last_comp_version:   2
// boot_cpuid_phys:     0x0
// size_dt_strings:     0x196
// size_dt_struct:      0x878

/ {
     #address-cells = <0x00000001>;
     #size-cells = <0x00000001>;
     model = Rainier;
     compatible = ibm,rainier-bmc, aspeed,ast2600;
     chosen {
         stdout-path = /ahb/apb/serial@1e784000;
     };
     aliases {
         serial4 = /ahb/apb/serial@1e784000;
         mmc0 = /ahb/apb/emmc@1e750000/emmc_slot0@100;
     };
     ahb {
         compatible = simple-bus;
         #address-cells = <0x00000001>;
         #size-cells = <0x00000001>;
         device_type = soc;
         ranges;
         u-boot,dm-pre-reloc;
         apb {
             compatible = simple-bus;
             #address-cells = <0x00000001>;
             #size-cells = <0x00000001>;
             ranges;
             u-boot,dm-pre-reloc;
             hace@1e6d0000 {
                 compatible = aspeed,ast2600-hace;
                 reg = <0x1e6d0000 0x00000200>;
                 interrupts = <0x00000000 0x00000004 0x00000004>;
                 clocks = <0x00000002 0x00000007>;
                 clock-names = yclk;
                 status = okay;
                 u-boot,dm-pre-reloc;
             };
             emmc@1e750000 {
                 #interrupt-cells = <0x00000001>;
                 compatible = aspeed,aspeed-emmc-irq, simple-mfd;
                 reg = <0x1e750000 0x00001000>;
                 interrupts = <0x00000000 0x0000000f 0x00000004>;
                 interrupt-controller;
                 clocks = <0x00000002 0x0000001f 0x00000002 0x00000020>;
                 clock-names = ctrlclk, extclk;
                 #address-cells = <0x00000001>;
                 #size-cells = <0x00000001>;
                 ranges = <0x00000000 0x1e750000 0x00001000>;
                 u-boot,dm-pre-reloc;
                 timing-phase = <0x000700ff>;
                 phandle = <0x00000012>;
                 emmc_slot0@100 {
                     compatible = aspeed,emmc-ast2600;
                     reg = <0x00000100 0x00000100>;
                     interrupts = <0x00000000>;
                     clocks = <0x00000002 0x00000035>;
                     status = okay;
                     u-boot,dm-pre-reloc;
                     bus-width = <0x00000004>;
                     sdhci-drive-type = <0x00000001>;
                 };
             };
             gpio@1e780000 {
                 compatible = aspeed,ast2600-gpio;
                 reg = <0x1e780000 0x00000400>;
                 interrupts = <0x00000000 0x00000028 0x00000004>;
                 #gpio-cells = <0x00000002>;
                 gpio-controller;
                 interrupt-controller;
                 gpio-ranges = <0x00000014 0x00000000 0x00000000 
0x000000d0>;
                 ngpios = <0x000000d0>;
                 u-boot,dm-pre-reloc;
                 tpm_reset {
                     u-boot,dm-pre-reloc;
                     gpio-hog;
                     output-high;
                     gpios = <0x00000088 0x00000000>;
                 };
             };
             serial@1e784000 {
                 compatible = ns16550a;
                 reg = <0x1e784000 0x00001000>;
                 reg-shift = <0x00000002>;
                 interrupts = <0x00000000 0x00000024 0x00000004>;
                 clocks = <0x00000002 0x0000000f>;
                 clock-frequency = <0x001c2b8a>;
                 no-loopback-test;
                 status = okay;
                 u-boot,dm-pre-reloc;
             };
             watchdog@1e785040 {
                 compatible = aspeed,ast2600-wdt;
                 reg = <0x1e785040 0x00000040>;
                 u-boot,dm-pre-reloc;
                 status = okay;
             };
         };
     };
     clock-controller@1e6e2000 {
         compatible = aspeed,ast2600-scu;
         reg = <0x1e6e2000 0x00001000>;
         u-boot,dm-pre-reloc;
         #clock-cells = <0x00000001>;
         #reset-cells = <0x00000001>;
         uart-clk-source = <0x00000000>;
         phandle = <0x00000002>;
     };
     reset-controller {
         u-boot,dm-pre-reloc;
         compatible = aspeed,ast2600-reset;
         aspeed,wdt = <0x00000017>;
         #reset-cells = <0x00000001>;
         phandle = <0x00000004>;
     };
     sdrammc@1e6e0000 {
         u-boot,dm-pre-reloc;
         compatible = aspeed,ast2600-sdrammc;
         reg = <0x1e6e0000 0x00000100 0x1e6e0100 0x00000300 0x1e6e0400 
0x00000200>;
         #reset-cells = <0x00000001>;
         clocks = <0x00000002 0x00000033>;
         resets = <0x00000004 0x00000000>;
         clock-frequency = <0x17d78400>;
     };
};


Without the property:

$ fdtdump spl/u-boot-spl.dtb

**** fdtdump is a low-level debugging tool, not meant for general use.
**** If you want to decompile a dtb, you probably want
****     dtc -I dtb -O dts <filename>

/dts-v1/;
// magic:               0xd00dfeed
// totalsize:           0x9e5 (2533)
// off_dt_struct:       0x38
// off_dt_strings:      0x864
// off_mem_rsvmap:      0x28
// version:             17
// last_comp_version:   2
// boot_cpuid_phys:     0x0
// size_dt_strings:     0x181
// size_dt_struct:      0x82c

/ {
     #address-cells = <0x00000001>;
     #size-cells = <0x00000001>;
     model = Rainier;
     compatible = ibm,rainier-bmc, aspeed,ast2600;
     chosen {
         stdout-path = /ahb/apb/serial@1e784000;
     };
     aliases {
         serial4 = /ahb/apb/serial@1e784000;
         mmc0 = /ahb/apb/emmc@1e750000/emmc_slot0@100;
     };
     ahb {
         compatible = simple-bus;
         #address-cells = <0x00000001>;
         #size-cells = <0x00000001>;
         device_type = soc;
         ranges;
         u-boot,dm-pre-reloc;
         apb {
             compatible = simple-bus;
             #address-cells = <0x00000001>;
             #size-cells = <0x00000001>;
             ranges;
             u-boot,dm-pre-reloc;
             hace@1e6d0000 {
                 compatible = aspeed,ast2600-hace;
                 reg = <0x1e6d0000 0x00000200>;
                 interrupts = <0x00000000 0x00000004 0x00000004>;
                 clocks = <0x00000002 0x00000007>;
                 clock-names = yclk;
                 status = okay;
                 u-boot,dm-pre-reloc;
             };
             emmc@1e750000 {
                 #interrupt-cells = <0x00000001>;
                 compatible = aspeed,aspeed-emmc-irq, simple-mfd;
                 reg = <0x1e750000 0x00001000>;
                 interrupts = <0x00000000 0x0000000f 0x00000004>;
                 interrupt-controller;
                 clocks = <0x00000002 0x0000001f 0x00000002 0x00000020>;
                 clock-names = ctrlclk, extclk;
                 #address-cells = <0x00000001>;
                 #size-cells = <0x00000001>;
                 ranges = <0x00000000 0x1e750000 0x00001000>;
                 u-boot,dm-pre-reloc;
                 timing-phase = <0x000700ff>;
                 phandle = <0x00000012>;
                 emmc_slot0@100 {
                     compatible = aspeed,emmc-ast2600;
                     reg = <0x00000100 0x00000100>;
                     interrupts = <0x00000000>;
                     clocks = <0x00000002 0x00000035>;
                     status = okay;
                     u-boot,dm-pre-reloc;
                     bus-width = <0x00000004>;
                     sdhci-drive-type = <0x00000001>;
                 };
             };
             gpio@1e780000 {
                 compatible = aspeed,ast2600-gpio;
                 reg = <0x1e780000 0x00000400>;
                 interrupts = <0x00000000 0x00000028 0x00000004>;
                 #gpio-cells = <0x00000002>;
                 gpio-controller;
                 interrupt-controller;
                 gpio-ranges = <0x00000014 0x00000000 0x00000000 
0x000000d0>;
                 ngpios = <0x000000d0>;
                 u-boot,dm-pre-reloc;
             };
             serial@1e784000 {
                 compatible = ns16550a;
                 reg = <0x1e784000 0x00001000>;
                 reg-shift = <0x00000002>;
                 interrupts = <0x00000000 0x00000024 0x00000004>;
                 clocks = <0x00000002 0x0000000f>;
                 clock-frequency = <0x001c2b8a>;
                 no-loopback-test;
                 status = okay;
                 u-boot,dm-pre-reloc;
             };
             watchdog@1e785040 {
                 compatible = aspeed,ast2600-wdt;
                 reg = <0x1e785040 0x00000040>;
                 u-boot,dm-pre-reloc;
                 status = okay;
             };
         };
     };
     clock-controller@1e6e2000 {
         compatible = aspeed,ast2600-scu;
         reg = <0x1e6e2000 0x00001000>;
         u-boot,dm-pre-reloc;
         #clock-cells = <0x00000001>;
         #reset-cells = <0x00000001>;
         uart-clk-source = <0x00000000>;
         phandle = <0x00000002>;
     };
     reset-controller {
         u-boot,dm-pre-reloc;
         compatible = aspeed,ast2600-reset;
         aspeed,wdt = <0x00000017>;
         #reset-cells = <0x00000001>;
         phandle = <0x00000004>;
     };
     sdrammc@1e6e0000 {
         u-boot,dm-pre-reloc;
         compatible = aspeed,ast2600-sdrammc;
         reg = <0x1e6e0000 0x00000100 0x1e6e0100 0x00000300 0x1e6e0400 
0x00000200>;
         #reset-cells = <0x00000001>;
         clocks = <0x00000002 0x00000033>;
         resets = <0x00000004 0x00000000>;
         clock-frequency = <0x17d78400>;
     };
};



>
> Andrew
