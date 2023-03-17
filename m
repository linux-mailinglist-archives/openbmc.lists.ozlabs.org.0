Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC96BEFF0
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 18:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdWcb0G4Dz3f3q
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 04:40:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=79.137.123.220; helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 599 seconds by postgrey-1.36 at boromir; Sat, 18 Mar 2023 04:40:08 AEDT
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdWc83lSwz2ygG
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 04:40:06 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 074DB2122A;
	Fri, 17 Mar 2023 17:24:28 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 17 Mar
 2023 18:24:27 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-97G0026ca36b25-7610-4ad8-a537-861a5a1bfbeb,
                    AA89701AE41F08E1E89E0E4F443EB3D827D1D8AD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
Date: Fri, 17 Mar 2023 18:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Abhishek Singh
 Dagur <abhishek@drut.io>
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
 <87mt4b73sv.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87mt4b73sv.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5f1c1abe-5c07-4d89-9cb6-0f64decd5476
X-Ovh-Tracer-Id: 11694440859508902694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdprggshhhishhhvghksegurhhuthdrihhopdhophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openbmc@lists.ozlabs.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/17/23 17:06, Alex Bennée wrote:
> 
> Abhishek Singh Dagur <abhishek@drut.io> writes:
> 
> (cc aspeed maintainers)
> 
>> Hi all,
>>
>> We are using obmc-phosphor-image on an ast2500 board which is trying to communicate with other devices
>> over serial port /dev/ttyS2.
>> As we are trying to emulate the machine on qemu we need to redirect the request to the host machine so
>> that it can handle this request and return appropriately.
>> We tried using QEMU options like -serial ,-chardev but still not the
>> concrete way we get to do it.
> 
> Yeah I'm afraid its non-obvious, certainly for built in serial ports.
> Try something like:
> 
>    ./qemu-system-aarch64 -M ast2500-evb \
>      -serial null -serial null -serial chardev:myserial \
>      -chardev file,id=myserial,path=output.txt \
>      $MORE_OPTIONS
> 
> You have to add a -serial for each serial port up to the one you care
> about and then set the chardev for it.
> 
> If you where adding a device to the system then you can explicitly set
> the target chardev for it with something like:
> 
>    -device isa-serial,iobase=nnn,irq=nnn,chardev=ID
> 
>> It will be very helpful if you can provide us some guidance on this.
> 
> Another quirk for the aspeed boards seems to be the default uart can be
> an arbitrary one depending on the board model:
> 
> 334:    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> 336:        if (uart == amc->uart_default) {
> 1112:    amc->uart_default = ASPEED_DEV_UART5;
> 1407:    amc->uart_default = ASPEED_DEV_UART1;
> 
> as a result ASPEED_DEV_UART5 will always be the first serial port
> (serial_hd(0)). I don't know how Linux numbers them but worth being
> aware of.

Yes. UART5 is the general default but it depends on the board definition
and the fuji was the first to require an exception. See commit 5d63d0c76c
("hw/arm/aspeed: Allow machine to set UART default")

Then, it became more complex with commit d2b3eaefb4 ("aspeed: Refactor
UART init for multi-SoC machines"). That's another topic.

Abhishek,

I am afraid, you will need to add a new board to fit what's in the DT.

Or, here is a little patch adding a machine option to set the default uart.
It was never merged because it is a bit of hack, give it a try and we
will discuss. Use :

   -M ast2500-evb,uart-default=uart2


Thanks,

C.

 From 0d0700ae772fa5236914e96af1be5afcf0d4a994 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Fri, 17 Mar 2023 18:21:54 +0100
Subject: [PATCH] aspeed: Add a "uart-default" machine option
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
  hw/arm/aspeed.c | 31 +++++++++++++++++++++++++++++--
  1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 806bb10707..e0335cf167 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -45,6 +45,7 @@ struct AspeedMachineState {
      bool mmio_exec;
      char *fmc_model;
      char *spi_model;
+    uint32_t uart_default;
      uint32_t hw_strap1;
  };
  
@@ -337,10 +338,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
      AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
      AspeedSoCState *s = &bmc->soc;
      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int uart_default = bmc->uart_default ? bmc->uart_default : amc->uart_default;
  
-    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    aspeed_soc_uart_set_chr(s, uart_default, serial_hd(0));
      for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
-        if (uart == amc->uart_default) {
+        if (uart == uart_default) {
              continue;
          }
          aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
@@ -1145,6 +1147,25 @@ static void aspeed_set_spi_model(Object *obj, const char *value, Error **errp)
      bmc->spi_model = g_strdup(value);
  }
  
+const QEnumLookup UartDefault_lookup = {
+    .array =
+        (const char *const[]) {
+            [0] = "none",
+            [1] = "uart1",
+            [2] = "uart2",
+            [3] = "uart3",
+            [4] = "uart4",
+            [5] = "uart5",
+        },
+    .size = 6
+};
+
+static void aspeed_set_uart_default(Object *obj, int val, Error **err)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+    bmc->uart_default = val + 1;
+}
+
  static void aspeed_machine_class_props_init(ObjectClass *oc)
  {
      object_class_property_add_bool(oc, "execute-in-place",
@@ -1153,6 +1174,12 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
      object_class_property_set_description(oc, "execute-in-place",
                             "boot directly from CE0 flash device");
  
+    object_class_property_add_enum(oc, "uart-default", "UartDefault",
+                                   &UartDefault_lookup, NULL,
+                                   aspeed_set_uart_default);
+    object_class_property_set_description(oc, "uart-default",
+                           "Change the default UART of the board");
+
      object_class_property_add_str(oc, "fmc-model", aspeed_get_fmc_model,
                                     aspeed_set_fmc_model);
      object_class_property_set_description(oc, "fmc-model",
-- 
2.39.2


