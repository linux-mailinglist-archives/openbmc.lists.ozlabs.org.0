Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD418F891
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 16:28:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJF32H9wzDqvW
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 02:28:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mHhW3XWmzDqkq
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 02:03:53 +1100 (AEDT)
IronPort-SDR: qhdWEikRHhtTu2UXliJ3A0xlqf8LK+pziPOsibP2JBWVwqgIqCQhjJynvkey00H0cuUOEGstIo
 tusmHsRRxT9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 08:03:48 -0700
IronPort-SDR: mHHNLNQ0A/+Zr0fMQurJa2EsXFsMlu2fBmkH6MHRuzF9OYszpfxRoiO3+8ENpbBRzAf6jj7yIa
 qbicpWu0OHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="264800941"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2020 08:03:44 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jGOcD-00CGr2-UD; Mon, 23 Mar 2020 17:03:45 +0200
Date: Mon, 23 Mar 2020 17:03:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200323150345.GP1922688@smile.fi.intel.com>
References: <20200323134437.259210-1-tali.perry1@gmail.com>
 <20200323134437.259210-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323134437.259210-2-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, wsa@the-dreams.de,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 03:44:35PM +0200, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-npcm7xx.txt   | 29 +++++++++++++++++++

Wouldn't be better to have it in YAML from the day 1?

-- 
With Best Regards,
Andy Shevchenko


