Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043BA4CE9
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:50:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBMX6WVTzDqLp
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:50:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fluxnic.net
 (client-ip=64.147.108.86; helo=pb-sasl-trial2.pobox.com;
 envelope-from=nico@fluxnic.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=pobox.com header.i=@pobox.com header.b="coNCGrqw"; 
 dkim=fail reason="key not found in DNS" (0-bit key;
 secure) header.d=fluxnic.net header.i=@fluxnic.net header.b="Bm6jH5Te"; 
 dkim-atps=neutral
Received: from pb-sasl-trial2.pobox.com (pb-sasl-trial2.pobox.com
 [64.147.108.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DKW90R3wzDqSd;
 Thu, 22 Aug 2019 06:48:16 +1000 (AEST)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 9CC8E19709;
 Wed, 21 Aug 2019 16:48:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=gHPWV6ywNNDw4FaVfFzykWXQZaE=; b=coNCGr
 qwt7i3R4tUyQi0ZhT3/3VIDhWBBLTzAw70AivukbL9ghU9nPl7F0FIRPBuvKPbKw
 c7CalAaCzCWnkkCCcwbqy1o3zKk9TWKjPdhJsnfKwF9VQuO/B09UmksTxgYUz9wu
 bRu8C5k5LKc4Gf9x7hn/+DaQYD2aeK8p0IeXw=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 79D5119708;
 Wed, 21 Aug 2019 16:48:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=tGJUtEAORBsdDqaz81artd/xlpJm4+O0vI06mhjfh+c=;
 b=Bm6jH5TeJ8u7zHDr3U+j7uM4LAxY52cFgZwdS2EFFWXNFK9GQtn5eZUA1GzXW9KWEcBn6hCr6F+jjjS1njBtHu40IijCBy9feUsunydCJOnkBH26hfO8gr4uvy5QgPrfiAWE7p+UCt2+09N9I0cpH0M/jOvLnV1kk5DmQyr29ak=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id DB83015BE3C;
 Wed, 21 Aug 2019 16:48:11 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id E8EF12DA023B;
 Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
Date: Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
In-Reply-To: <20190821133737.GB4890@kroah.com>
Message-ID: <nycvar.YSQ.7.76.1908211642050.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
 <20190821133737.GB4890@kroah.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: FD6832B8-C454-11E9-A575-46F8B7964D18-78420484!pb-smtp1.pobox.com
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:53 +1000
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
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, usb-storage@lists.one-eyed-alien.net,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, mingo@redhat.com, geert@linux-m68k.org,
 NXP Linux Team <linux-imx@nxp.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Patrick Venture <venture@google.com>, stern@rowland.harvard.edu,
 kernel-team@android.com, Dan Williams <dan.j.williams@intel.com>,
 Ingo Molnar <mingo@kernel.org>, linux-rtc@vger.kernel.org,
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, sspatil@google.com,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Matthias Maennich <maennich@google.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>, Richard Guy Briggs <rgb@redhat.com>,
 maco@google.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 pombredanne@nexb.com, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 21 Aug 2019, Greg KH wrote:

> On Wed, Aug 21, 2019 at 08:46:47AM -0400, Nicolas Pitre wrote:
> 
> > One solution for drastically reducing the effective export surface is to 
> > have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
> > namespace, but might be worth mentioning nevertheless.
> 
> Oh that's amazing, I never noticed that feature.  That is a nice thing,
> thanks for pointing it out.

For those interested, this feature was demonstrated with numbers here:

https://lwn.net/Articles/746780/


Nicolas
