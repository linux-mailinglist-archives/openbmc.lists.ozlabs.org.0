Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48847B40A
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 20:57:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHr2h6PBsz3bgl
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 06:57:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHr2L4ghqz2xsd;
 Tue, 21 Dec 2021 06:56:41 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="239004447"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="239004447"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 11:55:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="755508588"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 11:55:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 48A17201D7;
 Mon, 20 Dec 2021 21:55:03 +0200 (EET)
Date: Mon, 20 Dec 2021 21:55:03 +0200
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 00/10] add aspeed-jpeg support for aspeed-video
Message-ID: <YcDfl9V1oJFMebfF@paasikivi.fi.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
 <b6ba49f3-a9ed-f5e6-959c-309db8cce7f6@aspeedtech.com>
 <6e0da74e-ddce-3c94-42a1-f98833489d60@xs4all.nl>
 <549aaf9a-cd72-e200-0329-30f6c71b8ed7@aspeedtech.com>
 <e61856d5-c371-ab52-2814-d0d8aabee0f0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e61856d5-c371-ab52-2814-d0d8aabee0f0@aspeedtech.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On Tue, Dec 07, 2021 at 11:03:00AM +0800, Jammy Huang wrote:
> Hi Hans,
> 
> The implementation of decoder for this format as been available here.
> https://github.com/AspeedTech-BMC/aspeed_codec

The format documentation should point to this, as well as other
documentation there is.

I'm not sure there have been specific requirements of license, but it's the
first time I see MPL 2.0 being used in such context. It's eventually
convertible to GPL (or LGPL) although the route is inconvenient at best.
Or would people be happy with MPL code in v4l-utils?

I wonder what others think.

-- 
Regards,

Sakari Ailus
