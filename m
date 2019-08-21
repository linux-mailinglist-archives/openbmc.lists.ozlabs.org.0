Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C442A4CE1
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:44:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBF256fdzDqS9
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:44:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fluxnic.net
 (client-ip=64.147.108.86; helo=pb-sasl-trial2.pobox.com;
 envelope-from=nico@fluxnic.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=pobox.com header.i=@pobox.com header.b="c1PME/SJ"; 
 dkim=fail reason="key not found in DNS" (0-bit key;
 secure) header.d=fluxnic.net header.i=@fluxnic.net header.b="u8QzXJ4j"; 
 dkim-atps=neutral
X-Greylist: delayed 493 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Aug 2019 23:13:43 AEST
Received: from pb-sasl-trial2.pobox.com (pb-sasl-trial2.pobox.com
 [64.147.108.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D7Qb5WTVzDr02;
 Wed, 21 Aug 2019 23:13:43 +1000 (AEST)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 61EBA1840C;
 Wed, 21 Aug 2019 09:05:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=8OJtyeNZ9sCoH4BVmhH8yW8Bvtc=; b=c1PME/
 SJzr4aFk09ikfKp1bezTdBSw1zwNS3hrdNtoOqlYZR7yA8XltYBalyFTKDMKbjP0
 N65/OlgmcPY1jK1+z15I44JCS9KM0+7x8/h7bHxlIX4/NT+azCbj5YqM8+gMtbTp
 uXIkLMunbK+ZmjnijFcehZ1TUdsCiepGgzujk=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 3E97C1840B;
 Wed, 21 Aug 2019 09:05:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=V25/yKN9jlMjRVCEXCSuKB+Re2Fd96dfPM01Z+/Jqwg=;
 b=u8QzXJ4jPt13KgiTpgzojpKoWuF5UnQufQIrmIF1V1GDjy6AYPilfpABHbSnzJ1cD46DKsQ+JPEMRPYBtPL2vVu09z8iN4C6o7z6Kg63KVX0atNi1l+zBI4OCk5fsPv9COf6vzghotcslIvOnBR1dt1b3O/PjBpbMEOUK+25Eh8=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 0BFFA157B47;
 Wed, 21 Aug 2019 08:46:49 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 0CE5A2DA023B;
 Wed, 21 Aug 2019 08:46:48 -0400 (EDT)
Date: Wed, 21 Aug 2019 08:46:47 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-ID: <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: BDE512AC-C411-11E9-A63C-46F8B7964D18-78420484!pb-smtp1.pobox.com
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
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 usb-storage@lists.one-eyed-alien.net, Toru Komatsu <k0ma@utam0k.jp>,
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
 kernel-team@android.com, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 jeyu@kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, maco@android.com, linux-arm-kernel@lists.infradead.org,
 Adrian Reber <adrian@lisas.de>, linux-hwmon@vger.kernel.org,
 michal.lkml@markovi.net, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-kernel@vger.kernel.org, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, pombredanne@nexb.com,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 21 Aug 2019, Matthias Maennich wrote:

> As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.

This is good work.

One solution for drastically reducing the effective export surface is to 
have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
namespace, but might be worth mentioning nevertheless.


Nicolas
