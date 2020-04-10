Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B401A4B79
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 23:02:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zVnx6Kj8zDrKW
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 07:02:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zVnC29wMzDr9v
 for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2020 07:01:51 +1000 (AEST)
IronPort-SDR: U7es395opil5phAV+kqLvGhJwMUQYJbz8Mp9f7Kdiuu0mTfgQUn3Qs1VyCkJYWtOvgpfBuLgBp
 4UxLQiMo8whg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 14:00:35 -0700
IronPort-SDR: ZfGWz/DydJwUfAGBz3uYKIi3dv6pak1KuAQ6+dgAhw9yrpnnHQ7UpkThgdC+1/GXgis6RgQHeD
 HtApGqbLy1KQ==
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; d="scan'208";a="399027919"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 14:00:34 -0700
Date: Fri, 10 Apr 2020 14:00:33 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: Sensor history
Message-ID: <20200410210033.GA9295@mauery.jf.intel.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 30-Mar-2020 08:02 PM, Vijay Khemka wrote:
>Is there any implementation for reading sensor history. Please point me to the repo or code base.

I do not believe that the BMC is storing any sensor history. To get 
this, you would need to poll the sensors and store the values on another 
machine.

--Vernon
