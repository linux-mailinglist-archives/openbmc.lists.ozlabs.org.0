Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEA6A6931
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 09:54:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRShb2qdGz3cLh
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 19:54:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 3603 seconds by postgrey-1.36 at boromir; Wed, 01 Mar 2023 19:53:41 AEDT
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net [46.105.45.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRSh5448Hz3c81
	for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2023 19:53:38 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6E55B212FB;
	Wed,  1 Mar 2023 07:34:00 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 08:33:59 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-110S004a495a9e5-a5cd-4f60-b657-3841be6cd6d6,
                    BA6511934B6943C3167A88A21852BB5F3FADB7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <36da41c9-2396-5dd4-7fef-c85412f23045@kaod.org>
Date: Wed, 1 Mar 2023 08:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware flash
 SPI clocks
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
References: <20230224000400.12226-1-zev@bewilderbeest.net>
 <20230224000400.12226-4-zev@bewilderbeest.net>
 <CACPK8XdFT=+VJJ=iDhcmWPh9m9of2b+2UYxkrAisp6tdmWOWKg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdFT=+VJJ=iDhcmWPh9m9of2b+2UYxkrAisp6tdmWOWKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b1580e2c-5d52-471c-b456-c19902cff7ea
X-Ovh-Tracer-Id: 18439707202531920885
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpiigvvhessggvfihilhguvghrsggvvghsthdrnhgvthdprghnughrvgifsegrjhdrihgurdgruhdpkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrshhpvg
 gvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdhsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/23 02:30, Joel Stanley wrote:
> On Fri, 24 Feb 2023 at 00:04, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> While I'm not aware of any problems that have occurred running these
>> at 100 MHz, the official word from ASRock is that 50 MHz is the
>> correct speed to use, so let's be safe and use that instead.
> 
> :(
> 
> Validated with which driver?
> 
> Cédric, do you have any thoughts on this?
  

Transactions on the Firmware SPI controller are usually configured at
50MHz by U-Boot and Linux to stay on the safe side, specially CE0 from
which the board boots. The other SPI controllers are generally set at
a higher freq : 100MHz, because the devices on these buses are not for
booting the BMC, they are mostly only written to (at a default lower
freq). There are some exceptions when the devices and the wiring permit
higher rates.

For the record, we lowered the SPI freq on the AST2400 (palmetto)
because some chips would freak out once in a while at 100MHz.

C.

>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> Cc: stable@vger.kernel.org
>> Fixes: 2b81613ce417 ("ARM: dts: aspeed: Add ASRock E3C246D4I BMC")
>> Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 2 +-
>>   arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
>> index 67a75aeafc2b..c4b2efbfdf56 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
>> @@ -63,7 +63,7 @@ flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>>                  label = "bmc";
>> -               spi-max-frequency = <100000000>; /* 100 MHz */
>> +               spi-max-frequency = <50000000>; /* 50 MHz */
>>   #include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
>> index 00efe1a93a69..4554abf0c7cd 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
>> @@ -51,7 +51,7 @@ flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>>                  label = "bmc";
>> -               spi-max-frequency = <100000000>; /* 100 MHz */
>> +               spi-max-frequency = <50000000>; /* 50 MHz */
>>   #include "openbmc-flash-layout-64.dtsi"
>>          };
>>   };
>> --
>> 2.39.1.438.gdcb075ea9396.dirty
>>

