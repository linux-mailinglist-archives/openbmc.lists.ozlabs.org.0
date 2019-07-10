Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FA64F20
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:13:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZkK4j9wzDqTk
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:13:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sipsolutions.net
 (client-ip=2a01:4f8:191:4433::2; helo=sipsolutions.net;
 envelope-from=johannes@sipsolutions.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=sipsolutions.net
X-Greylist: delayed 2702 seconds by postgrey-1.36 at bilbo;
 Wed, 10 Jul 2019 20:02:50 AEST
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kF9k3xXYzDqcD;
 Wed, 10 Jul 2019 20:02:50 +1000 (AEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1hl8jF-0002Ji-QK; Wed, 10 Jul 2019 11:17:33 +0200
Message-ID: <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Johannes Berg <johannes@sipsolutions.net>
To: Joe Perches <joe@perches.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Patrick Venture <venture@google.com>, Nancy
 Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,  Andrew
 Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Wed, 10 Jul 2019 11:17:31 +0200
In-Reply-To: <cover.1562734889.git.joe@perches.com>
 (sfid-20190710_070546_627944_047EEDD0)
References: <cover.1562734889.git.joe@perches.com>
 (sfid-20190710_070546_627944_047EEDD0)
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 11 Jul 2019 09:08:05 +1000
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
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org,
 alsa-devel@alsa-project.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> These GENMASK uses are inverted argument order and the
> actual masks produced are incorrect.  Fix them.
> 
> Add checkpatch tests to help avoid more misuses too.
> 
> Joe Perches (12):
>   checkpatch: Add GENMASK tests

IMHO this doesn't make a lot of sense as a checkpatch test - just throw
in a BUILD_BUG_ON()?

johannes

