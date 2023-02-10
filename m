Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 351CC69BEF0
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 08:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHZn0v5Sz3bjX
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 18:42:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSXn1Thb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSXn1Thb;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCvyc2j2Hz3cNN;
	Sat, 11 Feb 2023 00:41:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676036472; x=1707572472;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BW+wBj/OAjPTC+OK/TehhbSR6rGKqrmkqjubJXxF/eI=;
  b=YSXn1ThbxBKXBAQp945QR48E4BKXQr9QataTWIOac2UOj9a67STZB7J9
   kmJbsrxBqgcmb6j6qkkYbMFm0k4O2B/837zW43pClXstAWDtRWKT+lzgA
   BbP0FTbsuvBNYsBJsXhGmlbcF35oIVVHmEjj8874wPn/J9di4gImDDV6s
   BQUkOB+YkPlBFxwtakgps0VucDLpsFSnRt+0ucjuvGhIlUwsQmcwlHZOY
   OAWXcR8+dtOIm1vpGXBbmn30ZpHGrR1u//ETQHxkL0xO5xmQSUfzHRW24
   S/thFUd1LYG9gYYloB8iQZX721TnELrFcYk5s2XWva3PxYUWRYVNjw5Ff
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392824602"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="392824602"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:41:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645629349"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645629349"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:41:02 -0800
Date: Fri, 10 Feb 2023 15:40:56 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
In-Reply-To: <34e3729f-9266-3606-9f11-33222f50e753@molgen.mpg.de>
Message-ID: <95c8a699-7293-8d89-222-a69c56da08f@linux.intel.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com> <20230210072643.2772-4-chiawei_wang@aspeedtech.com> <34e3729f-9266-3606-9f11-33222f50e753@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:41:14 +1100
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
Cc: devicetree@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, LKML <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Jiri Slaby <jirislaby@kernel.org>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Feb 2023, Paul Menzel wrote:

> > +MODULE_LICENSE("GPL");
> 
> Should it be GPL v2?

No, it should. "GPL" is the correct for in MOUDLE_LICENSE(). SPDX lines 
are a different thing and more precise.

-- 
 i.

