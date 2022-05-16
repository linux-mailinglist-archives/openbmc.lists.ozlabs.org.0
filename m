Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69712527E96
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 09:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rWk2dvhz3cG8
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:30:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192;
 helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1rWL0Bn5z3cM1
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 17:30:21 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A0C3826B29;
 Mon, 16 May 2022 07:22:23 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:22:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002a6839763-3245-402c-bf7b-2f24d5b9d825,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c57591b0-604b-1a98-102d-17cac1732db9@kaod.org>
Date: Mon, 16 May 2022 09:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 5/5] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-6-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-6-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4103372d-cd80-4613-b592-a061500577f9
X-Ovh-Tracer-Id: 18135714226604182450
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhfeevveegueejhfettdeuvdejtefgkeffkeejgeeuteejgfduieelhedttefhtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
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
Cc: peter.maydell@linaro.org, Jamin Lin <jamin_lin@aspeedtech.com>,
 zev@bewilderbeest.net, andrew@aj.id.au, irischenlj@fb.com,
 openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/16/22 08:23, Peter Delevoryas wrote:
> Background:
> 
> AspeedMachineClass.uart_default specifies the serial console UART, which
> usually corresponds to the "stdout-path" in the device tree.
> 
> The default value is UART5, since most boards use UART5 for this:
> 
>      amc->uart_default = ASPEED_DEV_UART5;
> 
> Users can override AspeedMachineClass.uart_default in their board's machine
> class init to specify something besides UART5. For example, for fuji-bmc:
> 
>      amc->uart_default = ASPEED_DEV_UART1;
> 
> We only connect this one UART, of the 5 UART's on the AST2400 and AST2500
> and the 13 UART's on the AST2600 and AST1030, to a serial device that QEMU
> users can use. None of the other UART's are initialized, and the only way
> to override this attribute is by creating a specialized board definition,
> requiring QEMU source code changes and rebuilding.
> 
> The result of this is that if you want to get serial console output on a
> board that uses UART3, you need to add a board definition. This was
> encountered by Zev in OpenBMC. [1]
> 
> Changes:
> 
> This commit initializes all of the UART's present on each Aspeed chip with
> serial devices and allows the QEMU user to connect as many or few as they
> like to serial devices. For example, you can still run QEMU and just connect
> stdout to the machine's default UART, without specifying any additional
> serial devices:
> 
>      qemu-system-arm -machine fuji-bmc \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -nographic
> 
> However, if you don't want to add a special machine definition, you can now
> manually configure UART1 to connect to stdout and get serial console output,
> even if the machine's default is UART5:
> 
>      qemu-system-arm -machine ast2600-evb \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -serial null -serial mon:stdio -display none
> 
> In the example above, the first "-serial null" argument is connected to
> UART5, and "-serial mon:stdio" is connected to UART1.
> 
> Another example: you can get serial console output from Wedge100, which uses
> UART3, by reusing the palmetto AST2400 machine and rewiring the serial
> device arguments:
> 
>      qemu-system-arm -machine palmetto-bmc \
>          -drive file=wedge100.mtd,format=raw,if=mtd \
>          -serial null -serial null -serial null \
>          -serial mon:stdio -display none
> 
> There is a slight change in behavior introduced with this change: now, each
> UART's memory-mapped IO region will have a serial device model connected to
> it. Previously, all reads and writes to those regions would be ineffective
> and return zero values, but now some values will be nonzero, even when the
> user doesn't connect a serial device backend (like a socket, file, etc). For
> example, the line status register might indicate that the transmit buffer is
> empty now, whereas previously it might have always indicated it was full.
> 
> [1] https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
> [2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> [3] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_soc.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 912798a9c9..30574d4276 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -546,9 +546,18 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>   void aspeed_soc_uart_init(AspeedSoCState *s)
>   {
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    int i, uart;
>   
>       /* Attach an 8250 to the IO space as our UART */
>       serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> +        if (uart == s->uart_default) {
> +            uart++;
> +        }
> +        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +                       aspeed_soc_get_irq(s, uart), 38400,
> +                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> +    }
>   }

