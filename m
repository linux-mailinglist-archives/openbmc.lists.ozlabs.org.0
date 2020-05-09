Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F391CBC75
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 04:26:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JrgJ3JpyzDr1m
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 12:26:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jrfc2DCDzDr1g
 for <openbmc@lists.ozlabs.org>; Sat,  9 May 2020 12:26:14 +1000 (AEST)
IronPort-SDR: bnC8ADfgR4lV9UDQSOS5yZJBo3D4rmQog5JFCaPF08RmUCZ61NvcpIWO4PYAxeMCly7rWjXk03
 Dq0oBdVUFmyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 19:26:12 -0700
IronPort-SDR: sT5oizCkgub2RDV2zD6wDm83gLqdvkhPGQuPp1vDGdcpmM7WLpW2vsy/c5FEchWaK5KDMXTYnj
 4rpBNpgqLqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,370,1583222400"; d="scan'208";a="249929374"
Received: from yongli3-mobl1.ccr.corp.intel.com (HELO [10.238.5.36])
 ([10.238.5.36])
 by orsmga007.jf.intel.com with ESMTP; 08 May 2020 19:26:10 -0700
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Li, Yong" <yong.b.li@linux.intel.com>
Subject: rest-dbus does not work?
Message-ID: <0f8b153c-5edc-1aab-422c-28f5943d12db@linux.intel.com>
Date: Sat, 9 May 2020 10:26:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: yong.b.li@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just find that the rest-dbus is broken, with the below error message:

Anyone encoutner this issue? Any suggestions/comments?

  rest-dbus
Could not find platform independent libraries <prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
Fatal Python error: initfsencoding: unable to load the file system codec
LookupError: no codec search functions registered: can't find encoding

Current thread 0x76fb6010 (most recent call first):
Aborted (core dumped)


Thanks,

Yong

