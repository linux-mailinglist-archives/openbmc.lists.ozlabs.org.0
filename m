Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE17542176
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHyB60r4Zz3bpj
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:34:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net [188.165.49.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHy9q1nxSz2xZR
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:34:05 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4BE0926FFA;
	Wed,  8 Jun 2022 06:34:02 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 8 Jun 2022
 08:34:01 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-109S003b5685d00-14fa-4f0c-a428-2bc68994fec0,
                    F6758EC0BDD1914BC1EB5EB96E174B3D05CE0F96) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0062fd8f-ade2-b921-5e8e-0d3288930185@kaod.org>
Date: Wed, 8 Jun 2022 08:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
 <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
 <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org>
 <09b467bf-2acc-1834-2143-e7e735a74b53@quicinc.com>
 <CACPK8XfP3T1gX_3-BWM3tZHrnwCqjNXz67nE9anxat-EfTmdaQ@mail.gmail.com>
 <f59e9e6b-1267-c667-9ef0-ac6968b0f728@kaod.org>
 <CACPK8Xf7sF+-tXomayNPGE5H37wco9qK9affC505WxqG3mhBtw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xf7sF+-tXomayNPGE5H37wco9qK9affC505WxqG3mhBtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2aceb579-570a-4644-837c-e8c3f3e4fff2
X-Ovh-Tracer-Id: 4817162752841321379
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtiedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
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
Cc: Graeme Gregory <quic_ggregory@quicinc.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/8/22 08:20, Joel Stanley wrote:
> On Wed, 8 Jun 2022 at 06:16, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 6/8/22 05:05, Joel Stanley wrote:
>>> On Tue, 7 Jun 2022 at 14:03, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>>>
>>>> On 6/7/2022 12:43 AM, Cédric Le Goater wrote:
>>>>> On 6/7/22 03:05, Joel Stanley wrote:
>>>>>> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> Ping
>>>>>>>
>>>>>>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
>>>>>>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>>>>>>
>>>>>>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
>>>>>>>> equipped with Aspeed AST2600 BMC SoC.
>>>>>>>>
>>>>>>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>>>>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>>>>>> ---
>>>>>>>> Changes in v2:
>>>>>>>> * Changed vendor name from Nuvia to Qualcomm.
>>>>>>>>
>>>>>>>>      arch/arm/dts/Makefile                   |   1 +
>>>>>>>>      arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208
>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>      2 files changed, 209 insertions(+)
>>>>>>>>      create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>>>>>>
>>>>>>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>>>>>> b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..e966f739b708
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>>
>>>> [...]
>>>>
>>>>>>>> +&fmc {
>>>>>>>> +     status = "okay";
>>>>>>>> +
>>>>>>>> +     pinctrl-names = "default";
>>>>>>>> +     pinctrl-0 = <&pinctrl_fmcquad_default>;
>>>>>>>> +
>>>>>>>> +     flash@0 {
>>>>>>>> +             compatible = "spi-flash", "sst,w25q256";
>>>>>>
>>>>>> Compatible strings should go from the most general to the most
>>>>>> specific, so these are around the wrong way. I see you've probably
>>>>>> just copied the ast2600-evb which makes the same mistake.
>>>>>>
>>>>>> In the dtsi we have jedec,spi-nor which you overwrite here.
>>>>>>
>>>>>> u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
>>>>>> should update the aspeed driver to use that?
>>>>>>
>>>>>> Cédric, do you have thoughts here?
>>>>>
>>>>> Yes. The closer we are to the Linux DT the better.
>>>>>
>>>>> The "spi-flash" and "jedec,spi-nor" compatibles are equivalent for
>>>>> the SF driver in U-Boot. I think we can remove all the :
>>>>>
>>>>>       compatible = "spi-flash", "sst,w25q256";
>>>>>
>>>>> from the Aspeed dts files.
>>>>>
>>>>> This fits what the latest U-Boot does.
>>>>
>>>> I checked that it works without the compatible string. I'll drop the
>>>> line in v3.
>>>
>>> Can you describe your test setup?
>>>
>>> When I tested, using the ast2600-evb.dts, the driver reported:
>>>
>>> ast# sf probe
>>> aspeed_spi: flash-controller@1e620000 has no flash devices ?!
>>> Invalid bus 0 (err=-19)
>>> Failed to initialize SPI flash at 0:0 (error -19)
>>>
>>> This is because the aspeed_spi.c driver counts the number of "spi-flash" nodes:
>>>
>>> static int aspeed_spi_count_flash_devices(struct udevice *bus)
>>> {
>>>           ofnode node;
>>>           int count = 0;
>>>
>>>           dev_for_each_subnode(node, bus) {
>>>                   if (ofnode_is_available(node) &&
>>>                       ofnode_device_is_compatible(node, "spi-flash"))
>>>                           count++;
>>>           }
>>>
>>>           return count;
>>> }
>>
>> This is only needed for the "sf" command. boot simply uses the mapping on
>> 0x20000000.
> 
> The environment reading code appears to use it too:
> 
> U-Boot 2019.04-astsdk-00073-gccf81eee1b3c-dirty (Jun 08 2022 - 12:32:42 +0930)
> 
> SOC: AST2600-A3
> Secure Boot: Mode_GCM
> eSPI Mode: SIO:Enable : SuperIO-2e
> Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
> Model: AST2600 EVB
> DRAM:  1008 MiB (capacity:1024 MiB, VGA:64 MiB, ECC:off)
> RC Bridge phy@1e6ed200 : Link down
> MMC:
> 
> sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0
> Loading Environment from SPI Flash... aspeed_spi:
> flash-controller@1e620000 has no flash devices ?!
> Invalid bus 0 (err=-19)
> *** Warning - spi_flash_probe_bus_cs() failed, using default environment

Ah yes. Interesting. I would have thought that CONFIG_ENV_OFFSET
was enough.

Thanks,

C.

> 
>>
>>
>>> We need to fix that if we're going to remove the "spi-flash"
>>> compatibles from the device tree.
>>
>> Just sent patches for it.
> 
> Thanks

