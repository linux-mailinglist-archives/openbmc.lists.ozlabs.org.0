Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A39429929
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSsvF1Fd7z2yNp
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:51:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=AP8NNI/l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=AP8NNI/l; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSsSS69wNz2yfn;
 Tue, 12 Oct 2021 08:31:52 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f08bb0003b0f726e81805f8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:bb00:3b0:f726:e818:5f8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DA1831EC04D6;
 Mon, 11 Oct 2021 23:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1633987909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ktB79OgjKWu4SFhSyygmMhHHJddjGqbKPeqk6+xxA10=;
 b=AP8NNI/lF9orIz29IHoZ1onaqIlWc4+tv7BBIyQ+KqL9M5VUAmvyQner4HQ8Dfej+ezj0s
 rDjJ5dFRCYDxJHoQ7a4kNXigxCehCvPoD4ITWptC1gRP9uXVExolKqM7HHEp1MW8PxfoEr
 lJQDN29VXXUI+lSK76b0wei8vrWh1jM=
Date: Mon, 11 Oct 2021 23:31:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Message-ID: <YWStQSrRJQ09KXVY@zn.tnic>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
 <YVtQG+idmwKn0qLe@zn.tnic>
 <58ef4107e9b2c60a2605aac0d2fb6670a95bc9e0.camel@intel.com>
 <YWSZTq8NWWcCMXtA@zn.tnic>
 <337b6332312ea63862aedd09279417c9e1c7e11f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <337b6332312ea63862aedd09279417c9e1c7e11f.camel@intel.com>
X-Mailman-Approved-At: Tue, 12 Oct 2021 08:51:18 +1100
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Lutomirski,
 Andy" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 08:38:43PM +0000, Winiarska, Iwona wrote:
> Everything that's part of this series runs on the BMC (Baseboard
> Management Controller). There's nothing ARM specific to it - it's just
> that the BMC hardware we're currently supporting is ARM-based. PECI is
> an interface that's exposed by some x86 CPUs - but that's a hardware
> interface (available completely independent from whatever is actually
> running on the x86 CPU).

Aha, I think I got it: so this whole PECI pile is supposed to run on
the BMC - which can be ARM but doesn't have to be, i.e., code should be
generic enough - and the interfaces to the x86 CPU do get exposed to the
Linux running on the BMC.

Which brings me to the answer to your other mail:

On Mon, Oct 11, 2021 at 07:32:38PM +0000, Winiarska, Iwona wrote:
> Nothing wrong - just a trade-off between churn and keeping things tidy
> and not duplicated, similar to patch 1. And just like in patch 1, if
> you have a strong opinion against it - we can duplicate.

So it is not about strong opinion. Rather, it is about whether this
exporting would be disadvantageous for x86 freedom. And I think it will
be:

Because if you exported those and then we went and changed those
interfaces and defines (changed their naming, function arguments,
whatever) and something outside of x86 used them, we will break that
something.

And usually we go and fix those users too but I doubt anyone has access
to that PECI hw to actually test fixes, etc, etc.

So I'd prefer the small amount of duplication vs external stuff using
x86 facilities any day of the week. And so I'd suggest you simply copy
the handful of functions and defines you're gonna be needing and the
defines and be done with it.

Dave's idea makes sense to me too but lately it keeps happening that
we change something in x86-land and it turns out something "from the
outside" is using it and it breaks, so it is a lot easier if things are
independent.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
