Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FFA50F27
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWb0Kjjz3ckg
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741170700;
	cv=none; b=HYMHdptcPOPZWP+2U3UL9S0LGP6OR2vlgDU27lyNv8rQCLK8au3tiTbVpMnT1bQ882Kzd/4FuqjTsdRXWE9HCvpicMrJ03ltPLkfRUiKcY9cyiila5IQaOD9mEhdUDOBVT8bSYntnAC/cU/mdm1sTDbS+UamP3dKBNWozlSBaB6okkSI0nSJC7NNlytA9d0OFB0G42353AIiETW+PVcLHvWXLFl1NJGjmSU681GXf2THxtTOAcdNHhP4wAzDVh1/78kqSTMb51Dw4ncRsfRDVf2TUPie83cFzngHuZlcHDUJQyRvXXBOI8hMCcpSsgu3of8BzQFI8OvZVAgbI2HQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741170700; c=relaxed/relaxed;
	bh=GixKrI4auj+Jq2I/e3aa9PpIqnSOeuqb6Z1Wgla2k/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaVvrex9Tn3e5HIsxEDMCLkxljDdLlC3g8x9hHt/YVBdTFBk75VM9s1ZNqTyxLGD8X2Z4m+MupkkpqMiaUjn25KnWT8ptMAtX1PsmdhTrRyA6ZTXiudAe6P4hfjQRdXJnLZRmDbqthtDrRTipwB/cij9zKriC6DFJESBs51fA/QyDu1/6NfX2QtenEPsd1Y1siDHjk1o4O3OZkJtbORbCsz7vC4OJ4bEZC2OvTPBXTFyRTt52hkFP5cHq1e1vFSMg9YX/DJDxux4XrLCtf69OgE+UVCfwADrZ4Msr3zr1V/7BCnKdoDFrWDLVgP4FOJgIjeEIOuqEiOkOQBN508ajg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=softfail (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 60 seconds by postgrey-1.37 at boromir; Wed, 05 Mar 2025 21:31:39 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z783v3q5Qz3bmL;
	Wed,  5 Mar 2025 21:31:39 +1100 (AEDT)
X-CSE-ConnectionGUID: CuF/STzHTe235GLxsgy8HA==
X-CSE-MsgGUID: ec4BYwgfTf2ui7/ZKqvVjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53523079"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="53523079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:31:38 -0800
X-CSE-ConnectionGUID: Z/A8xlFITVmp8Z0twxO01Q==
X-CSE-MsgGUID: nLVWQ8vMT/elxbz01T8mpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="149420928"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm27-0000000HNqe-12WE;
	Wed, 05 Mar 2025 12:31:23 +0200
Date: Wed, 5 Mar 2025 12:31:22 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
Message-ID: <Z8gn-jxUH_7FT4b2@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: imx@lists.linux.dev, mwalle@kernel.org, tmaimon77@gmail.com, hayashi.kunihiko@socionext.com, alexander.usyskin@intel.com, tali.perry1@gmail.com, paul@crapouillou.net, daniel@thingy.jp, patches@opensource.cirrus.com, christophe.leroy@csgroup.eu, festevam@gmail.com, kabel@kernel.org, chrome-platform@lists.linux.dev, maddy@linux.ibm.com, benjaminfair@google.com, lma@chromium.org, mpe@ellerman.id.au, openbmc@lists.ozlabs.org, krzk@kernel.org, evanbenn@chromium.org, linux-mips@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com, s.hauer@pengutronix.de, naveen@kernel.org, npiggin@gmail.com, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, wim@linux-watchdog.org, bleung@chromium.org, linux-arm-kernel@lists.infradead.org, support.opensource@diasemi.com, andreas.werner@men.de, avifishman70@gmail.com, thomas.richard@bootlin.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de, venture@google.com, jwerner@chromium.org, romain.perier@gmail.com, shawnguo@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 05, 2025 at 10:10:23AM +0000, George Cherian wrote:
> This series adds a new kernel command line option to watchdog core to
> stop the watchdog on panic. This is useul in certain systems which prevents
> successful loading of kdump kernel due to watchdog reset.
> 
> Some of the watchdog drivers stop function could sleep. For such
> drivers the stop_on_panic is not valid as the notifier callback happens
> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
> options to indicate whether the stop function would sleep.

Should you only enable this if the kdump is enabled in the kernel configuration?

-- 
With Best Regards,
Andy Shevchenko


