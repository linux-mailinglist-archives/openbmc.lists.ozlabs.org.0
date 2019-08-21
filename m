Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD01A4CE0
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:44:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBD31kglzDqLX
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:44:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D7Pn6R49zDr02;
 Wed, 21 Aug 2019 23:13:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3W7OIKWVX6WxkwIdgHyI0+xyh1dbNAC13qBYkWnh7Cg=; b=tD8p42oCitFiAd2hUZ+Uji3Q1
 UTEhTTlglHM2ajMFxM1/ed7h1OwiAn6VBoxeCJpSpFu6TxU9vl6pO5FOLDo/8pBOscWUF4+erLsKE
 DVD9OKxaoc74XOPq06NOx3kB+TM8L6TWfESV6B5H1lteMlHNTmc3MCUI+2FfmvgNUaDzqWbmfsyPU
 NHXcDSCT88u0KJbPatcwVHSfJyJm2OV7aeB5Z68YOUtMczSrgcW8TMpwCa1uRyvnXMKRjiHnnIdMW
 ERlrM+sksfjGoxMgu5/kM55o7iHgBv4Zy6FJTkno4qJN8Y21+XQlvmG0At3fEOWf++QvOvmrkFKBo
 hbmWgU+DA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0QOy-00077n-17; Wed, 21 Aug 2019 13:11:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 49C5330759B;
 Wed, 21 Aug 2019 15:11:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BF01120F0D378; Wed, 21 Aug 2019 15:11:40 +0200 (CEST)
Date: Wed, 21 Aug 2019 15:11:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
Message-ID: <20190821131140.GC2349@hirez.programming.kicks-ass.net>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
 sspatil@google.com, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, pombredanne@nexb.com,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
> As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.
> 
> Generally, these symbols fall in one of these categories:
> 1) Symbols actually meant for drivers
> 2) Symbols that are only exported because functionality is split over
>    multiple modules, yet they really shouldn't be used by modules outside
>    of their own subsystem
> 3) Symbols really only meant for in-tree use
> 
> When module developers try to upstream their code, it regularly turns
> out that they are using exported symbols that they really shouldn't be
> using. This problem is even bigger for drivers that are currently
> out-of-tree, which may be using many symbols that they shouldn't be
> using, and that break when those symbols are removed or modified.
> 
> This patch allows subsystem maintainers to partition their exported
> symbols into separate namespaces, and module authors to import such
> namespaces only when needed.
> 
> This allows subsystem maintainers to more easily limit availability of
> these namespaced symbols to other parts of the kernel. It can also be
> used to partition the set of exported symbols for documentation
> purposes; for example, a set of symbols that is really only used for
> debugging could be in a "SUBSYSTEM_DEBUG" namespace.

I'm missing how one can prohibit these random out of tree modules from
doing MODULE_IMPORT_NS().

That is; suppose I stick all the preempt_notifier symbols in a KVM
namespace, how do I enforce no out-of-tree modules ever do
MODULE_IMPORT_NS(KVM) and gain access?

(the above would basically break virtualbox, which I knows uses preempt
notifiers too, but I don't give a rats arse about that)
