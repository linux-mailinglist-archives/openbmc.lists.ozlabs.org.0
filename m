Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A53E2DCF
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 17:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh8f24lDqz3d92
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 01:34:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh8dr0CvQz3bWb
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 01:33:50 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="236370822"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; d="scan'208";a="236370822"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 08:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; d="scan'208";a="672243487"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2021 08:32:46 -0700
Received: from [10.209.67.74] (jmbills-MOBL.amr.corp.intel.com [10.209.67.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 87F7A580801
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 08:32:46 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: meta-security and DISTRO_FEATURES
Message-ID: <3403ce92-825e-cbfc-1e53-334765134df5@linux.intel.com>
Date: Fri, 6 Aug 2021 09:32:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

I am getting a warning about meta-security when building:
WARNING: You have included the meta-security layer, but 'security' has 
not been enabled in your DISTRO_FEATURES. Some bbappend files and 
preferred version setting may not take effect. See the meta-security 
README for details on enabling security support.

I checked in the README and it recommends adding 'DISTRO_FEATURES_append 
= " security"' to a config file to enable all the security features.

I did a quick grep on our layers and don't see that added anywhere. 
Does anyone know if this is something that we need or want to enable? 
If so, should we enable it in a common layer or will each individual 
layer decide whether to enable it?

Thanks!
-Jason
