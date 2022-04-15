Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390265029B7
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 14:30:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfwdS27XSz3bWx
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 22:30:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZCLjWOnB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZCLjWOnB; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwd2479pz2yg7
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 22:29:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650025782; x=1681561782;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=L81y4a96wgiB350Pqj1VbKtTWEBTKCLwyRCnc+bdXWU=;
 b=ZCLjWOnBGA98bqvol9lprHL8hoo8JQ3dPV0EyXFHD3oUxjcze7ybhBza
 17TJqXaOEHa5ACewt2nMAB2Vbo8gfAyVFkpKXS9DK+MnvFVeN8s6l9buc
 dNMZGgVC5mcEpwLhbWg6+AS60IMQUKiLzX4pYW1+TpQ813rd8mi9KgzAf
 w9EYtTEiPcXFZHJHYi56KgKdglfAPbJWqnnAF+5C+vcjYX86S6a51dA/G
 PsWEJI6NSVFhqnGECgX4b4P2dfTR5Ds2RtjESwwOhEHj9PAxziKjH7X3n
 W+ecNjEgEi+a2awoFxmllgt31sDa8TGF0UTpDla7v++RcrxtqqBjUKYqZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="245031842"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="245031842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 05:28:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="553133786"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.170.129])
 ([10.249.170.129])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 05:28:34 -0700
Message-ID: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>
Date: Fri, 15 Apr 2022 20:28:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: VLAN issue with NICEnabled property
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
Cc: wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, all

In phosphor-networkd, setting NICEnabled to false write "Unmanaged=yes" in network configuration file. There was an issue with this property and its VLAN. Reboot bmc after setting NICEnabled to false, its VLAN interfaces disappears, and if set it to true, all previously configured VLANs for this interfaces will be lost.

The reason is, since the interface is set to Unmanaged in config file, systemd-networkd will not configure the interface on boot, including creating VLANs. On the phosphor-networkd side, it creates its interface list from getifaddrs(), as VLAN interfaces are not created, they will not be added to the list. When setting NICEnabled back to true, it rewrites the config file with the VLANs in that list, so no VLAN is written, essentially removes the previously configured VLAN from the system with dangling vlan netdev and config files.

To solve this issue, my proposal is to write "ActivationPolicy=down" when NICEnabled is false, this option tells systemd-networkd not to bring up the interface on boot. But it is still managed, meaning that its VLAN interfaces will be created.

But there is a question of this proposal, how to set nicEnabled property when creating the interface? Using "ActivationPolicy=down" still has the issue mentioned in https://github.com/openbmc/phosphor-networkd/commit/26275a3f2ecffe62646b65646c00a9e56c75bff8, however, unlike Unmanaged interfaces will have is AdministrativeState==managed, a interface that is down has AdministrativeState==configuring, which is also a possible value for interfaces needs to be brought up on boot, though it will become "configured" when it is up.

One idea I came up with is to us configParser to read the ActivationPolicy from config file. Any other ideas will be appreciated.

Thanks,
Jiaqing
