Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C23721D4B50
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 12:46:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NlTC02HkzDqLw
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 20:46:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NlST2Qm1zDqfD
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 20:46:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=meGXhOH7; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49NlSS3K3Gz9sTC
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 20:46:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589539560; bh=LlKgEALhYYj1JqRebJVcsY+EqIIdLbjuetQss69ofYI=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=meGXhOH7ln0nqtUcIRA1ZerGEtg/T8Pk2WfovaDVIfAjqK+WDqhmzIUt/qVpO4k+2
 ws+mgt/eK3+rgDbv4h3KWOjkaw5j8egsHa+6TR3xNeqZ7ceDyyasP+wYE0H1EhJep6
 OJ/Cz9gv9pMXb9KtWl88wwimUcsXf1gIQGEhFqUWlQ/ThvLa3lNLxbzyLyo1+TCmFR
 6pTCi9slTiNvd+Rkw9QFwGtJKrG5loZ6yEySP0lnlgROP4GDD634jPGLpzWvaV6BeW
 NNKFFls7McmGhbvV9mZzjK2K8LZSUmHdEdhniiFHt9KmJHeRhV+AdPvb/swG1avKVl
 8Jhjj3eknWbIA==
Message-ID: <e70889bcbee171b407f64392704c417cf7c0856a.camel@ozlabs.org>
Subject: Re: Reducing fragmentation in OpenBMC
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Date: Fri, 15 May 2020 18:45:56 +0800
In-Reply-To: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

>  - Keep pushing on upstream. Sometimes this can delay things, but I
> really think that's almost always false economy; the out-of-tree
> patches will have to be addressed at some point, and that job just 
> gets more involved as time passes.

One of the lagging items here is the amount of kernel patches pending
in:

 
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed

Intel folks: any objections if I grab select patches from there and
work on the upstreaming process? Or are you already working on this?

Regards,


Jeremy

