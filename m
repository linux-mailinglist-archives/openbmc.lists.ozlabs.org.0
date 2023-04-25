Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6318E6EE9C8
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 23:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5b851gZlz3ccg
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 07:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kr7iR/ma;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kr7iR/ma;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5b7W2hg2z3bT7
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 07:42:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682458935; x=1713994935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTtyok3AsZthYl0oIHCEaHf+IoUYSQ+1hzYVXOVJWo0=;
  b=Kr7iR/maFwDLo0X53hx9ltsFw2QCSQer0PFc+CBB6vhU0enr2z8GVWRO
   7+SbVF0aKZS3IswF4nfLGslKwa3Fn/uzZ2jXLUQ4b+a/zr9zFBj9Jsf2u
   WbNkqmGEC1EwCWMtGZJhiICH/Re7ffr3AoCwN88wMccBQfzmzeMcgatgg
   5JEHSE1Fm6FrfHbeDF6KDvJ9Ifrn9Yd7+2fBL0Rr5kLCQT3EZpNwnSc97
   cGlJMigf4vPDFgnhiN3ulql+VZA7kuoPQTHyELeR4IXX+6gqSeNc+myY+
   zm5uZk9rO/t8JbvuX5hfkyZuj1ftK3JnQupg7M3VutJ2LDU3w8OlrlC6x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="345667623"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="345667623"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837617300"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="837617300"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:41:56 -0700
Date: Tue, 25 Apr 2023 14:41:24 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Tunc Doygun <tunc.doygun@inventron.com.tr>
Subject: Re: smbios-mdrv1
Message-ID: <ZEhIzzwhdoy1yRnK@mauery.jf.intel.com>
References: <cc8b520e-b0b1-66df-d5c4-84931f4a1f8c@inventron.com.tr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cc8b520e-b0b1-66df-d5c4-84931f4a1f8c@inventron.com.tr>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Apr-2023 06:52 PM, Tunc Doygun wrote:
>Hi,
>
>We are trying to communicate BMC with bios that supports smbios-mdrv1. 
>We have built the mdrv1 code in Intel's 
>https://github.com/Intel-BMC/provingground/tree/master/services/smbios 
>repo in yocto.We included intel-ipmi-oem project into image. We 
>enabled kcs3 0xCA2 in dts. But we could not communicate. Is there 
>anything else we should do?

If you are pulling from the latest intel-ipmi-oem, you will see that we 
have removed the MDRv1 commands because we no longer use them (we use 
the MDRv2 commands instead). So you may need to check that. I don't know 
when the MDRv1 commands were last supported; I don't think we have used 
them for a while, which is why they finally got removed.

--Vernon
