Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE44A855F
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 14:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqKW22yhPz3bZT
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 00:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=OAKdgH64;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=OAKdgH64; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqKVg0QKSz2xt0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 00:38:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643895467;
 bh=u9y+mks8ngDf1GYhDR36fTMNzNPuf/4/cUztOBLsHCE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=OAKdgH64vXpeTLR09ctMJKoy3bK4+gsNyugm2h/5Jx3ZWpjXsz+5R1tu8cpUap4zA
 MR4spQO/By/Ej+DsvNXD3lphM/KqLzQd9XM9xobuGpYsY2+a+f7LRN+mvcYTeA5xml
 OzJCFLOBNPt19KJ9Gslt5H7w3uSul8UaroPKv990=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.41]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1nEVqJ08nE-003JVQ; Thu, 03
 Feb 2022 14:37:47 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/2] Fixing the compile-test warnings in pinctrl-npcm7xx
Date: Thu,  3 Feb 2022 14:37:34 +0100
Message-Id: <20220203133736.246397-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0aT0emvpYVaUCOFKP7C+AN4Vec4TdX2PrKu3o1wMPvh1dC/4kte
 4GNRfWnJJ3MVur9CpBv5rdUB0bNdWVvqvhPnPk8hSpsdjTG2txbKyUVW4ekxWOhlyMEGhw1
 JAYHfhTWfu7lUeVjaXAoyQrWDofbPb8v/Lgi6jYmdF+sj3ywUwuzfImTak7QnAsL+E3rl4u
 KY4qHk/8E+MvldTPpBxBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AoWYerI9Bio=:IyWOuj/3kVSAtTj3JbAulo
 MtS2CInGW7WEdD1SS4a6u8Hnk1OBtH1EmgflVPOl7uge51WKlOb0dn0dHB9/MOd82Sr/EiJ9h
 /yOuZkkcJ6JWADX7cOsvz2uENOqMhVpymHZoDMrPjOBwPpI02xbT91BZpJkNhTDqMWdOkNpR5
 ejvZPaa0gbV4H6aLvuN1SJYrTEw25moCX3nSiKrcrtccAsiSGSpRsOv+F8DhCxS7wR5yao8TZ
 oXNoEhqPFEXhph2U4vQrpHJRba3bONdMfpsMgD/R6SjXChsJygibnyTfu1S490n9Xy2R4dZ/S
 OdszHB6HG9lOEMh8WEQ85ZCaVfwYufDYXP6zhoZeuvqfjvD0nqtzkKuIBy9Q/ZwvwdSyEHsxB
 xB3tuZBWG70LvZybtmKtGWD3G0Qfh09Oy9yTG53PKZHZ5If9LyQme2l9H4CGaAkO2UWb8qxuO
 lsSLrN3Tbc9XQHS+a30aZ8WHZ99DjfIliIo6sMPU3zLGgauiIe9tsoNQu78NprpDyfx6as8Xm
 /hXzsmceQEa/jMklGAOiQqNa60oHM1VaLL6+4BLDAWfR2g0b9kkgY7BID0NlHk5y5DUunqPcD
 +WvZ/nxPGbKRM2lcFZxBhzPNeBZDo7Buf3h6OVcYTVYMDNMQNxMUfPh4cEC4ra5oYWmPSItIT
 xuXlXavgXsnBaw6o5Po3uLwfihDlu8Y0a7FMcFlOIAXhYU3FfrVD135aCxy9P2R4rCjsH+lSG
 ob2R5lR3g6BUr7Di3xiPBJQCFxlgTvyTJpsvyNsnWhpplCq0MRyLZBD3pxT8GMlIy9Is0qMui
 EfDCOOVABtG5906ymV5Djcz0jVBB5oVyygMJUyo1NAmCvqrtM8zG/Wok/9B3D5G6ppAQ6I98F
 a5zGcj+s50sdasnYbGM67r98RLwPvYl/yOiUEDLKw+abzWQjQRrcK/vnNH3MySW0V2a55XPp5
 fQuXmRnpS/hzlzvGJ9//lWpOq/wIeu0ZwSjAMFedrGRixoB2ARrJUb8X68Am0ohJa3O8S/TOv
 aAs8xUWTSazTtWtnQzaglDjsi5RKXcRUho3Yq6ccq1kDHvaSn4gq+xsBLonW/e59s7rnCv6/B
 xO1u8QUxoUVEK8=
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
Cc: Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

My "Nuvoton WPCM450 pinctrl and GPIO driver" patchset brought two
warnings[1] in the pinctrl-npcm7xx to light. This patchset fixes them,
and now also includes the appropriate "Fixes:" tags.

[1]: https://lore.kernel.org/lkml/202201292234.NpSNe4TD-lkp@intel.com/

Jonathan Neusch=C3=A4fer (2):
  pinctrl: nuvoton: npcm7xx: Use %zd printk format for ARRAY_SIZE()
  pinctrl: nuvoton: npcm7xx: Rename DS() macro to DSTR()

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 160 +++++++++++-----------
 1 file changed, 80 insertions(+), 80 deletions(-)

=2D-
2.34.1

