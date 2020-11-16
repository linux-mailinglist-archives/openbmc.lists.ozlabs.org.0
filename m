Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 186142B4961
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 16:33:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZY4t68MBzDqDs
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:33:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZY4159pRzDqDT
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 02:32:45 +1100 (AEDT)
IronPort-SDR: v1Rg1U9frrFxelWJoeH4TmyoMfnj/QqSM0f50t9ce5zZUg32koiosAXgcP0gayCb8VzAODqHTO
 +UeYODBFyRxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="158538617"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="158538617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 07:32:42 -0800
IronPort-SDR: sPV7RteCfABT6eQS0CrMUGPRizmPgWnyDJAE6j9rAjpZsWy0RoZgpq8V7eGNNxrd/VthWSPJWb
 yW5f7FBSZ6TA==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="475561552"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.249.130.156])
 ([10.249.130.156])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 07:32:41 -0800
Subject: Add peci-pcie repo to CI
To: openbmc@lists.ozlabs.org
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Message-ID: <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
Date: Mon, 16 Nov 2020 16:32:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi OpenBMC,
I am looking for guidance or advice how to enable CI jobs for telemetry 
repository (https://github.com/openbmc/telemetry 
<https://github.com/openbmc/telemetry>). Thanks in advance for response.

Thanks,
Jozef

