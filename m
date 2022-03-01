Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615F4C8680
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 09:29:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K79QH4CK0z3bsP
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 19:29:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K79Pz0YVgz3bfC
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 19:28:52 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2218JI7p004980;
 Tue, 1 Mar 2022 16:19:18 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Mar
 2022 16:28:37 +0800
Date: Tue, 1 Mar 2022 16:28:12 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc 1/1] fix compiling warnings for
 AST2600 A1 SPL
Message-ID: <20220301082810.GA3469@aspeedtech.com>
References: <20220224081121.10389-1-jamin_lin@aspeedtech.com>
 <20220224081121.10389-2-jamin_lin@aspeedtech.com>
 <CACPK8XeXhRwp6PrNoGnFedBwh7MqR6Qu++AOOGDbOmDF2xq-pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XeXhRwp6PrNoGnFedBwh7MqR6Qu++AOOGDbOmDF2xq-pA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2218JI7p004980
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 02/24/2022 11:43, Joel Stanley wrote:
> On Thu, 24 Feb 2022 at 08:11, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> >
> > remove duplicated define
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  include/configs/evb_ast2600a1_spl.h | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
> > index 655896b237..006cc4345b 100644
> > --- a/include/configs/evb_ast2600a1_spl.h
> > +++ b/include/configs/evb_ast2600a1_spl.h
> > @@ -42,13 +42,6 @@
> >  #endif
> >  #endif
> >
> > -/* SPL */
> > -#define CONFIG_SPL_TEXT_BASE           0x00000000
> > -#define CONFIG_SPL_MAX_SIZE            0x0000E800
> > -#define CONFIG_SPL_STACK               0x10010000
> > -#define CONFIG_SPL_BSS_START_ADDR      0x90000000
> > -#define CONFIG_SPL_BSS_MAX_SIZE                0x00100000
> 
> A good cleanup. While we're here, can we clean up the various ast2600
> config headers?
>
We do not have a plan to merge them.
> There is a large diff between the a0 and the a1 spl header. I know the
> A0 has a smaller SRAM. Are there any other differences required?
> 
A0 did not support "boot from emmc", "secure boot image size",  please refer to our Errata for detail.
> > -
> >  #define CONFIG_SUPPORT_EMMC_BOOT
> >
> >  #endif /* __CONFIG_H */
> > --
> > 2.17.1
> >
