Return-Path: <openbmc+bounces-626-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE02B5136D
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 12:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMGVZ04Cnz3d8M;
	Wed, 10 Sep 2025 20:03:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757498629;
	cv=none; b=UeTh5ZzaaRONlxPKigBf/MtdsGK1lF1M1mNzO2HeOloXSQnBw0K98pYN51JvqiZoaXmIhfpxPclYRISnAj5c36sFH/ZnWtInmeJduqyVtj/gBxPvL8qNRSMDcmF0QDJ7X1BTuusVc6kIqV00MEl/CjF6EXPh4z8TXd1bGqyBiO1lxdNdSShFda7c28Anjc79/c7BNAwb/2w77N3h1Gs2GJCZq//iBWCVNQh42XFoT2MY8kkKZpQCcCyf6aLBWRq4+oUUKQ/VJO66pCnPh3/qB9pX6NLeEb7HutXYbnkfEVq8LWHy5DThOVhiqtsJg3LQgTNw8mVjYqLTfSgeaVMI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757498629; c=relaxed/relaxed;
	bh=vfEoEI07LqAssZJd4kgA+XMFve7iOmdqNuZSLbkCoc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiu29rDcf096JwLpqM1Vhoi2xPjAjGGpVzKpMaJg/ASfHfPYAozwFPSvFQun19MHfpeufsU+qWjB0AbuZM/+awvGkzMGkjJSXyTLz0kX1olFRRmVY9tL3bkewzLDNt3+LjFHvEZMkSHrLajAEcdDCEqrdA9/N1i1sDZo2OYS+QD/4s0bEvYwEJaR7m+JtURXf7PH4NlsnqEi89jVGdy74ymGNrsSRcQBm8w4aSfy3wz1KLXjjP0nOy5JMEKKsxje0GEGRXTs3rmdEfLNWF8Zu16M+znkltIOFfEseSOd3Tqyf9leWDx1RKG9pCbngiuXBqn8LAVisf73WSa6ZFP4tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMGVX4bhVz3d4D
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 20:03:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A58516F8;
	Wed, 10 Sep 2025 03:03:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 192AD3F66E;
	Wed, 10 Sep 2025 03:03:08 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:03:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] mfd: vexpress-sysreg: use more common syntax for
 compound literals
Message-ID: <20250910-precious-silky-worm-8bae77@sudeepholla>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 09:25:45AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

