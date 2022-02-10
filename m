Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B414E4B060B
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 07:07:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvR9f2tjyz3cCg
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 17:07:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvR9P4DlRz30MQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 17:07:19 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21A5wovq096252;
 Thu, 10 Feb 2022 13:58:50 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (118.99.190.129) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Feb
 2022 14:07:02 +0800
Date: Thu, 10 Feb 2022 14:06:50 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: u-boot:rsa adds rsa3072 algorithm
Message-ID: <20220210060649.GA4157@aspeedtech.com>
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XeUeDSV7T8Rrtp2G99d0LdyXu0dSzHj3DnwRQr8Sm9zaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XeUeDSV7T8Rrtp2G99d0LdyXu0dSzHj3DnwRQr8Sm9zaA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [118.99.190.129]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21A5wovq096252
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 02/07/2022 06:11, Joel Stanley wrote:
> On Mon, 7 Feb 2022 at 02:26, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > This patch was applied to u-boot/master, http://patchwork.ozlabs.org/project/uboot/patch/20220119082323.4567-2-jamin_lin@aspeedtech.com/
> >
> > Commit   2a4b0d5890deb0c973f8db7bb03adad96aff1050
> >
> > https://github.com/u-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96aff1050
> >
> > Could you please help to backport the patch to the openbmc/u-boot tree?
> 
> This patch doesn't apply cleanly. Can you send a backport to the list?
> Please be sure to test that it applies, builds and runs against the
> v2019.04-aspeed-openbmc tree.
> 
> Cheers,
> 
> Joel

I send the new patch and ready for review.
Thanks-Jamin
