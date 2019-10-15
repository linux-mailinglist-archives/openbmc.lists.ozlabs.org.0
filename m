Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FFD837D
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 00:20:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t8y41QJpzDr70
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 09:20:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t8xQ71NSzDr28
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 09:19:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 15:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; d="scan'208";a="194652373"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2019 15:19:50 -0700
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <5e8c2ba2-5e82-f1e3-6524-46278c631553@intel.com>
Date: Tue, 15 Oct 2019 15:19:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 James Feist <james.feist@linux.intel.com>, Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/15/19 12:04 PM, Brad Bishop wrote:
> Is it possible to get bmcweb supporting patch with double and int?  On
> the surface this seems like the shortest path to enabling Carol.

Unless phosphor-hwmon is patched to support settable sensors, I don't
think there's a good reason to add support to bmcweb.  With that said,
it's just software, it could certainly be done.  Someone would need to
sort out how to manage the scale factor, as a Redfish PATCH request
doesn't have a concept of scale, and operates on a float, so you'd have
to do some software handholding to convert the value to something
appropriate before it was scaled to the int64.

With that said, all of this seems like a lot of work.


Just to clarify in case anyone isn't clear, the /xyz/* and /org/* type
REST handlers do support SetProperty for int and double, and introspects
the daemon to determine which one should be used.  So far as I'm aware,
the only thing non-functional is a Redfish patch of a sensor, as it's a
bit more complex to do properly.

-Ed
