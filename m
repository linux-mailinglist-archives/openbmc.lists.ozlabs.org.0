Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76726C41F
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 17:24:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs3mZ3DGNzDqWp
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 01:24:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs3lM3vw7zDqW9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 01:23:26 +1000 (AEST)
IronPort-SDR: F5t92FJExWtlTWylTP28K9ayKdffK/hPfRX0UK78gnW7pyOvWlUaEd15JB8XOtszw487qGLdjY
 j2VIb3uZbDYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160419677"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="160419677"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:23:22 -0700
IronPort-SDR: K/Bey6cXoEaOe0pSw+hu26uUZ1VZF3XSjAZpgNQ1xNNHy8mg1DzV6h5/UR5ItslU/pUKLLua7p
 dlj/HKqQxuMw==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="319870070"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.68.202])
 ([10.212.68.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:23:22 -0700
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
To: Andrei Kartashev <a.kartashev@yadro.com>, Ed Tanous <ed@tanous.net>
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
Date: Wed, 16 Sep 2020 08:23:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> Hi,
> 
> We noticed that dbus-sensors doesn't fully implement
> xyz.openbmc_project.Sensor.Value interface: there is no Unit property
> for all the sensors, defined by dbus-sensors.
> I believe it was intentionally, but I still wondering what was the
> reason?

It was originally as the information seemed redundant. If the 
information is needed I'm fine with someone adding it, it just hasn't 
seemed to be a high priority.

> I noticed that in intel-ipmi-oem units are determined based on object
> paths, but that looks ugly since there is well-defined natural
> interface for units in dbus.
> Lack of the "Unit" property in the interface breaks some existing
> logic.
> 
