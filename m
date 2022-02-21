Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE44BD9BD
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 13:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2MRT3mrSz3cKK
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 23:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G/9AFprn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G/9AFprn; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2MR44kgYz30Dv
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 23:43:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645447393; x=1676983393;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=suWVJCw7hFCdS+GT46HYL2mV6gMFCFDQnpu/cZV8Y1g=;
 b=G/9AFprnNL7lkof8pzF4qFm22h/Fmqnr8f7JLnx5AuigH/kFDX+x9Fud
 86VknAHMbT8IsWkfkJIQWCVo0d/GgoCZuHO8wUAcBrbLe2bAkH2+KrdSW
 +9NIG8vIeWHpkqgDcdJc8JRaUiLfSjRVyow0AMh6RltyvTS0kR24F/Pyg
 C1mE3A8mur6gPqyA3nGNrLK/dbIKrrfa7mq0olG3Fcr9CgUmlHk/9Dpvn
 jiX1cLVf3rD8kD/RfdhE6LTvrumESBBz5IH1vDmD7BGc7+FzY/9abOk5w
 WKNs+z0Uh4ok0i/vj1uNvXMrV8PP/QST8mc9XFzZZ+t5gGlq1J1d/Vjns w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="249080659"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="249080659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:42:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="547322196"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.29.200])
 ([10.255.29.200])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:42:06 -0800
Message-ID: <a9db0239-a53a-9a6f-e167-335dc8e56872@linux.intel.com>
Date: Mon, 21 Feb 2022 20:41:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: service-config-manager performance issue
Content-Type: text/plain; charset=UTF-8
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
Cc: apparao.puli@linux.intel.com, richard.marian.thomaiyar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, all

When updating service status with service-config-manager, it always takes ~15s for the new status to be applied, which is much longer than it should be.

By inspecting the code, I found there is a 15s wait before updating service status in ServiceConfig::startServiceRestartTimer(). (https://github.com/openbmc/service-config-manager/blob/f2744893b77b9dd8903bb13113f4c3ef62c18f04/src/srvcfg_manager.cpp#L382)

The 15s-wait is added at first in commit 0084047 (https://github.com/openbmc/service-config-manager/commit/0084047d008fd0ac36f09a232f67ff2fc5314b53).

I've tested service-config-manager works as expected with the wait removed, and it only takes ~1s for the settings being applied, shall we remove it? And I'd like to ask what is the purpose of this wait to double confirm if removing it will bring any side effect.

Thanks,
Jiaqing
