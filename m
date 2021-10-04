Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC69421AF8
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNdKK1vjpz2yV6
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 11:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=EKdSCXKP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=EKdSCXKP; dkim-atps=neutral
X-Greylist: delayed 257 seconds by postgrey-1.36 at boromir;
 Tue, 05 Oct 2021 06:08:24 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNVc81qKgz2xY1;
 Tue,  5 Oct 2021 06:08:24 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f0fe4009c23c25c98857304.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:e400:9c23:c25c:9885:7304])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A06841EC03FE;
 Mon,  4 Oct 2021 21:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1633374501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=i6PxikJNA1V7HfDVyLAobLqaSjOebbk6J6n8Zlv5QfE=;
 b=EKdSCXKP0dFy4SUcN7yE1/LTYYr7g50Rq74dwqthJVY7HnSsWQ0haYRQBlHM9qpvT/ZewA
 L/dhM/XkdJucHyEk/QoP7sLQggGOKhbB/la4UEPn7+C8g2QJ/yp32xgC5HZdOGksGMh1OO
 gOfqpItzsrx/A1wmMvUKtArbVnZHUQM=
Date: Mon, 4 Oct 2021 21:08:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v2 02/15] x86/cpu: Extract cpuid helpers to
 arch-independent
Message-ID: <YVtRJiYD9EqGh7TM@zn.tnic>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-3-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210803113134.2262882-3-iwona.winiarska@intel.com>
X-Mailman-Approved-At: Tue, 05 Oct 2021 11:10:42 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Yazen Ghannam <yazen.ghannam@amd.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 01:31:21PM +0200, Iwona Winiarska wrote:
> Baseboard management controllers (BMC) often run Linux but are usually
> implemented with non-X86 processors. They can use PECI to access package
> config space (PCS) registers on the host CPU and since some information,
> e.g. figuring out the core count, can be obtained using different
> registers on different CPU generations, they need to decode the family
> and model.
> 
> The format of Package Identifier PCS register that describes CPUID
> information has the same layout as CPUID_1.EAX, so let's allow to reuse
> cpuid helpers by making it available for other architectures as well.
> 
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  MAINTAINERS                      | 1 +
>  arch/x86/Kconfig                 | 1 +
>  arch/x86/include/asm/cpu.h       | 3 ---
>  arch/x86/include/asm/microcode.h | 2 +-
>  arch/x86/kvm/cpuid.h             | 3 ++-
>  arch/x86/lib/Makefile            | 2 +-
>  drivers/edac/mce_amd.c           | 3 +--
>  include/linux/x86/cpu.h          | 9 +++++++++
>  lib/Kconfig                      | 4 ++++
>  lib/Makefile                     | 2 ++
>  lib/x86/Makefile                 | 3 +++
>  {arch/x86/lib => lib/x86}/cpu.c  | 2 +-
>  12 files changed, 26 insertions(+), 9 deletions(-)
>  create mode 100644 include/linux/x86/cpu.h
>  create mode 100644 lib/x86/Makefile
>  rename {arch/x86/lib => lib/x86}/cpu.c (95%)

AFAICT, all that churn is done for x86_family() and x86_model() which
are used *exactly* *once* and which are almost trivial anyway.

What's wrong with simply computing the family and model "by hand", so to
speak, in peci_device_info_init() and do away with that diffstat

 12 files changed, 26 insertions(+), 9 deletions(-)

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
