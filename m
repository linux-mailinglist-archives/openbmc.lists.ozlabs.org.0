Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CC421AFB
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNdL12MSwz2ymP
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 11:11:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=hB1AzTSs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=hB1AzTSs; dkim-atps=neutral
X-Greylist: delayed 561 seconds by postgrey-1.36 at boromir;
 Tue, 05 Oct 2021 06:13:37 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNVk94GmTz2yNn;
 Tue,  5 Oct 2021 06:13:37 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f0fe4009c23c25c98857304.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:e400:9c23:c25c:9885:7304])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 774201EC03D2;
 Mon,  4 Oct 2021 21:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1633374238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=0Nms4auAY3J/VUVtMgcFZcZpc069CLLUqzM+bdeYLVk=;
 b=hB1AzTSsB1cgjjLDziTXH0QngoL3aO0oKRg7k+c5hPO68B1wguz1yl6+QrOaVKi3NLEbrh
 joloXjbwL8oGdS5mMnbNgevjUzDOetUYM2ffcG/crFVIlxNq94ibITOrm89OrC30+oHyJW
 th69nz+SBcfqNS7StlH4IeV54nrlyNI=
Date: Mon, 4 Oct 2021 21:03:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Message-ID: <YVtQG+idmwKn0qLe@zn.tnic>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210803113134.2262882-2-iwona.winiarska@intel.com>
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

On Tue, Aug 03, 2021 at 01:31:20PM +0200, Iwona Winiarska wrote:
> Baseboard management controllers (BMC) often run Linux but are usually
> implemented with non-X86 processors. They can use PECI to access package
> config space (PCS) registers on the host CPU and since some information,
> e.g. figuring out the core count, can be obtained using different
> registers on different CPU generations, they need to decode the family
> and model.
> 
> Move the data from arch/x86/include/asm/intel-family.h into a new file
> include/linux/x86/intel-family.h so that it can be used by other
> architectures.
> 
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> ---
> To limit tree-wide changes and help people that were expecting
> intel-family defines in arch/x86 to find it more easily without going
> through git history, we're not removing the original header
> completely, we're keeping it as a "stub" that includes the new one.
> If there is a consensus that the tree-wide option is better,
> we can choose this approach.

Why can't the linux/ namespace header include the x86 one so that
nothing changes for arch/x86/?

And if it is really only a handful of families you need, you might just
as well copy them into the peci headers and slap a comment above it
saying where they come from and save yourself all that churn...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
