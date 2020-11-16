Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38032B460A
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 15:42:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZWxN5sJ1zDqKN
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 01:42:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZWwP2knQzDqJm
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 01:41:08 +1100 (AEDT)
IronPort-SDR: xxl4vE5SLua/6Qaqj8r8ooOPWJFh1WGkN9iVmRDOMsvx4BxsYlyJC9uUiPSQFsBaxDpDvGHa7Z
 m18x/4NFxuZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="169970905"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="169970905"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 06:41:05 -0800
IronPort-SDR: ZA/4xWmGNnKbWp4/RJqAYcK0uBQkt7ijqdDcR3gKP9wmW5MX2mJqk0Hwf8ncUdwZDGQc2d2jzi
 xargAlAnmeiQ==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="358483487"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.2.229])
 ([10.213.2.229])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 06:41:04 -0800
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: QEMU - No 'PCI' bus found for device 'virtio-rng-pci'
Message-ID: <08784c20-7770-f1d1-19d5-a4c6e1648b28@linux.intel.com>
Date: Mon, 16 Nov 2020 15:41:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
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

Hello,

In recent poky bump we've inherited introduction of new option related 
to RNG forwarding in poky/scripts/runqemu script.

This unfortunately makes my AST2500 target unable to start with 
following error:
qemu-system-arm: -device virtio-rng-pci,rng=rng0: No 'PCI' bus found for 
device 'virtio-rng-pci'

The naive workaround is to revert this change like so:
diff --git a/poky/scripts/runqemu b/poky/scripts/runqemu
index e5e66f345..e62d869c2 100755
--- a/poky/scripts/runqemu
+++ b/poky/scripts/runqemu
@@ -1336,7 +1336,7 @@ class BaseConfig(object):
          if not os.access(qemu_bin, os.X_OK):
              raise OEPathError("No QEMU binary '%s' could be found" % 
qemu_bin)

-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, 
self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), 
self.get('QB_OPT_APPEND'))
+        self.qemu_opt = "%s %s %s %s" % (qemu_bin, 
self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), 
self.get('QB_OPT_APPEND'))

          for ovmf in self.ovmf_bios:
              format = ovmf.rsplit('.', 1)[-1]

According to 
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg141309.html 
there is also a 'proper' way to disable that option by machine/config 
files. However, I am curious if there is a proper fix to enable that 
option on my target? Every optimization is always welcome.

Regards,
Adrian
