Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420D4C5B0C
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 13:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K62mp5JVkz3bV2
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 23:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jOut9LSg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=jOut9LSg; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K62mM06sSz30DT
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 23:25:54 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 447234C8;
 Sun, 27 Feb 2022 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645964753;
 bh=wo/iYc5Rj0WB0BCZG3h8F6UMkaWVrC9rsTLBbIndKoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOut9LSgvaQkPxYUu/EcCAHbmQBpr4ygNxj03CyJkWtco91hZtcD6zg0cTvgTJVGy
 NVlukIvYRLGt3QcbJjBYxjpO8ykyn0uYQcl71k2XKFpH44WrC4/Jf9tZA9E25U3Cx1
 DFVgdT1G+J6KCjUkrLayCs4vhx+BNcrNdCTbeXDs=
Date: Sun, 27 Feb 2022 04:25:50 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Message-ID: <YhttzgDtGpcTniyw@hatter.bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <bcb89a9c-62d0-15b8-b46a-d3181db9dbe7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <bcb89a9c-62d0-15b8-b46a-d3181db9dbe7@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Renze Nicolai <renze@rnplus.nl>,
 Denis Pauk <pauk.denis@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[Adding Denis re: wmi discussion below...]

On Sat, Feb 26, 2022 at 03:54:42PM PST, Guenter Roeck wrote:
>On 2/26/22 05:30, Zev Weiss wrote:
>>Hello,
>>
>>This patch series augments the existing nct6775 driver with support
>>for the hardware's i2c interface.
>>
>>Thus far the nct6775 driver has only supported the LPC interface,
>>which is the main interface by which the Super-I/O chip is typically
>>connected to the host (x86) processor.
>>
>>However, these chips also provide an i2c interface, which can provide
>>a way for a BMC to also monitor sensor readings from them.  On some
>>systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
>>the only way for the BMC to monitor host CPU temperatures (e.g. to
>>indirectly access a TSI interface); this functionality is thus an
>>important component of enabling OpenBMC to support such systems.
>>
>>In such an arrangement the Super-I/O chip is simultaneously controlled
>>by two independent processors (the host and the BMC) which typically
>>do not coordinate their accesses with each other.  In order to avoid
>>conflicts between the two, the i2c driver avoids all writes to the
>>device, since the BMC's needs with the hardware are merely that it be
>>able to retrieve sensor readings.  This allows the host processor to
>>remain ultimately in control of the chip and unaware of the BMC's use
>>of it at all.
>>
>>The sole exception to the "no writes" rule for the i2c driver is for
>>the bank-select register -- while I haven't been able to find any
>>explicit statement in the Nuvoton datasheets guaranteeing this, all
>>experiments I've done have indicated that, as one might hope, the i2c
>>interface has its own bank-select register independent of the one used
>>by the LPC interface.
>>
>
>That will a more detailed confirmation. Please explain in detail
>the experiments you have done.
>
>Other chips (specifically those served by the it87 driver) have the
>same problem, and there it was never really solved. That resulted
>in random crashes. I don't want to end up in the same situation.
>

On an ASRock Rack ROMED8HM3, I used the following program to manually 
peek and poke device registers from the host:

host# cat port.c
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/io.h>

int main(int argc, char** argv)
{
	unsigned long addr, val;

	if (iopl(3)) {
		perror("iopl");
		exit(1);
	}

	if (argc == 3 && !strcmp(argv[1], "r")) {
		addr = strtoul(argv[2], NULL, 0);
		printf("%03lx: %02x\n", addr, inb(addr));
	} else if (argc == 4 && !strcmp(argv[1], "w")) {
		addr = strtoul(argv[2], NULL, 0);
		val = strtoul(argv[3], NULL, 0);
		printf("%03lx <- %02lx\n", addr, val);
		outb(val, addr);
	} else {
		fprintf(stderr, "Usage: %s [rw] ADDR [VALUE]\n", argv[0]);
		exit(1);
	}

	return 0;
}
host# cc -o port port.c

At the same time, I used i2cget & i2cset to do the same from the BMC 
(the nct6779 is at address 0x2d on bus 1).

Interleaving some shell transcripts chronologically (no drivers bound on 
either processor):

   host# ./port w 0x295 0x4e && ./port r 0x296
   295 <- 4e
   296: 08

   bmc# i2cget -y 1 0x2d 0x4e
   0x02
   bmc# i2cset -y 1 0x2d 0x4e 0x01
   bmc# i2cget -y 1 0x2d 0x4e
   0x01

   host# ./port w 0x295 0x4e && ./port r 0x296
   295 <- 4e
   296: 08

So, starting from an initial state where the two sides were reporting 
different values for the bank select register, a write to the bank 
select register via the BMC's i2c interface is seen by a subsequent read 
over that same interface, but the host still sees the same value it saw 
initially.

Reversing the roles (host writing the bank-select register), the BMC is 
likewise unaffected:

   bmc# i2cget -y 1 0x2d 0x4e
   0x01

   host# ./port w 0x295 0x4e && ./port r 0x296
   295 <- 4e
   296: 08
   host# ./port w 0x295 0x4e && ./port w 0x296 0x06
   295 <- 4e
   296 <- 06
   host# ./port w 0x295 0x4e && ./port r 0x296
   295 <- 4e
   296: 06

   bmc# i2cget -y 1 0x2d 0x4e
   0x01

In contrast, looking at a different read/write register (the config 
register at 0x40 in bank 0, for example), writes from each side are seen 
by the other:

   host# ./port w 0x295 0x4e && ./port w 0x296 0x00
   295 <- 4e
   296 <- 00
   host# ./port w 0x295 0x40 && ./port r 0x296
   295 <- 40
   296: 03

   bmc# i2cset -y 1 0x2d 0x4e 0x00
   bmc# i2cget -y 1 0x2d 0x40
   0x03
   bmc# i2cset -y 1 0x2d 0x40 0x01
   bmc# i2cget -y 1 0x2d 0x40
   0x01

   host# ./port w 0x295 0x40 && ./port r 0x296
   295 <- 40
   296: 01
   host# ./port w 0x295 0x40 && ./port w 0x296 0x03
   295 <- 40
   296 <- 03
   host# ./port w 0x295 0x40 && ./port r 0x296
   295 <- 40
   296: 03

   bmc# i2cget -y 1 0x2d 0x40
   0x03

To be cautious we could perhaps trim down the list of supported chips in 
the i2c driver to include only the models that are known to pass tests 
like the above; I can certainly make that change if that would be 
preferred.

>>In terms of code structure, the approach taken in this series is to
>>split the LPC-specific parts of the driver out into a separate module
>>(called nct6775-platform), leaving the interface-independent parts in
>>a generic driver (called nct6775-core).  The nct6775-i2c driver is
>>then added as an additional consumer of the nct6775-core module's
>>functionality.
>>
>
>How about wmi ? Shouldn't that be separated as well ?
>

I admittedly don't know much about wmi, but from what I could see in the 
code it looked to me like it essentially just acts as an alternate 
software/firmware path to the same underlying LPC interface, so I 
figured it would make sense to leave it integrated with the rest of the 
platform driver as it is currently.  If there's a particular benefit to 
be gained from splitting it out as well I can look into doing so, but 
from my current understanding it seems like it would lead to either:

  - duplication between the wmi and bare inb/outb versions of the 
    platform driver, or

  - to eliminate the duplication, a third (intermediate) module 
    containing the code that was common to the two of them, leaving the 
    two platform driver modules as little else than the bare register I/O 
    routines (superio_[wmi_]inb, nct6775_[wmi_]read_value, etc.), i.e.  
    the differences that are already handled via the indirection of the 
    function pointers Denis added recently.

I suppose the hypothetical intermediate module in the second scenario 
above could also be integrated back into nct6775-core, though that part 
of it would then be needless dead weight for the typically more 
resource-constrained systems (e.g. BMCs) that are only going to use the 
i2c driver.

Anyway, none of the above possibilities seemed terribly appealing to me, 
but if there's something I've misunderstood or factors I haven't taken 
into account please let me know.


Thanks,
Zev

