Return-Path: <openbmc+bounces-1308-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPcaO+7qgGleCAMAu9opvQ
	(envelope-from <openbmc+bounces-1308-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 19:20:30 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B3D0135
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 19:20:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4Zfd2cg9z30FP;
	Tue, 03 Feb 2026 05:20:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770056425;
	cv=none; b=Kmz4vUqOsUbmmslMiehWnFOvceXkmy5udRJKDYiKmIWnovKeeZTuoramDm76zJZuLKBwwHAwnvPliNfXwRLO9hGdyIT/JppaNcDLTflZTzXb5HYJrm8k4nZ7KEgGhUiwBaK2nepHaED0w1qeNkdXCkHaNh0NLgoBWgWpzN8vF22A8cicUDuUq0k96bNvc8S0CknLP1+HkNEZmzgSbfWeIj9SCcuhk6gwd6Ax7KDWyYwzpXVU/a8SnIDYHTL4Oaa6NHJnzcWCPKwPbs6A7KqsfKcsFUm96jG2s1IQ2KUVY59bkdeQEHTGh0bv4uATe4lRQUHSlPIe+PpGpjDS52nKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770056425; c=relaxed/relaxed;
	bh=2G1YPwbreUxncFwnY/ItlGnuP4ErdGMc1jU89ycS1Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGo7xlCwbw8AnxgsixDe0JWQbSV2deZdXDkfdvfsGJ2wTYBYcEzoed/ImyqHCtQt5jm4eGgOKYNJtRc8SlfjLQ++K+9ti5XdwQWLATh1bnTXMis9jOPgwr9IM4Uv3Ykcm+eZBLmJ3MKnsfjUrRj9wlUrJ3r8EIxHROIXGv+iEbpxkWw4PLpmbO/asUfdSOt664087vbf05f0nsq66APUwmAcyUNjgvvTPJPgb2yQnkgJCOqqjBJVzl9lhIQwT1QDKaqEztyw5b7l8F2qECKnBfCkYRZeG8DwoUXRtaWWO/6AycTCLnQbZ53hVElOQduOludPG3ah7c0K9WVvX2VDog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcuL7esr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcuL7esr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4ZfZ2yB7z30BR
	for <openbmc@lists.ozlabs.org>; Tue, 03 Feb 2026 05:20:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770056423; x=1801592423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rbCK6zyQfYtDifhYSyzXCEckvE8IP7GcmV+g5x8drgg=;
  b=OcuL7esrisYHVWPLsutJGauTRLX4lJa0c8VBZwUcGz6DzRysNGhMqeNa
   c30MriwCc/VeCNOngNqD7K2W8tJoDXmwWwyHixwEWXbRtdcVLIQqZqDjh
   JWTDjqq6NBthohjcjvp/Mvg/iHsp4m8R1XQzvRnlLejkJUsbvHuLOlNp7
   urh4w2V7f9Px9Nzbj13TZA3jbn4e58mYBHQQAH3gFcj26Y86M6eZ7Gv7o
   FhQnQyHbPYhJQUXHe545hB5T7DDrKHwoMnLh8TSQnEl9i9qH/ieU7p/Qt
   +T8zn8hCyR373vuPoklORonFZ6ZpmtcRDHxZq4leVQS+uX1CastdVR87v
   A==;
X-CSE-ConnectionGUID: N54JaLSQQZK0/XYw2POy0A==
X-CSE-MsgGUID: jAxxYXBLSiCHosQhk1ViXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75076674"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="75076674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:20:18 -0800
X-CSE-ConnectionGUID: 1ikHsIPOT3SbygX7/wxZrA==
X-CSE-MsgGUID: Zm5hPKFcT9qmEjWYYsSCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="214121632"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 10:20:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmyWx-00000000fq0-47hS;
	Mon, 02 Feb 2026 18:20:11 +0000
Date: Tue, 3 Feb 2026 02:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Vladimir Moravcevic <vmoravcevic@axiado.com>
Subject: Re: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device
 controller IP Corigine
Message-ID: <202602030223.QlbiPC8d-lkp@intel.com>
References: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1308-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vmoravcevic@axiado.com,m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 436B3D0135
X-Rspamd-Action: no action

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Moravcevic/dt-bindings-usb-axiado-ax3000-udc-Add-Axiado-UDC/20260202-211951
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f%40axiado.com
patch subject: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device controller IP Corigine
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602030223.QlbiPC8d-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030223.QlbiPC8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030223.QlbiPC8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from drivers/usb/gadget/udc/crg_udc.c:7:
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_epcx_setup':
>> drivers/usb/gadget/udc/crg_udc.c:624:31: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'unsigned int' [-Wformat=]
     624 |         dev_dbg(crg_udc->dev, "DCI %d, sizeof ep_cx %ld\n", DCI, sizeof(struct ep_cx_s));
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:624:9: note: in expansion of macro 'dev_dbg'
     624 |         dev_dbg(crg_udc->dev, "DCI %d, sizeof ep_cx %ld\n", DCI, sizeof(struct ep_cx_s));
         |         ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:624:55: note: format string is defined here
     624 |         dev_dbg(crg_udc->dev, "DCI %d, sizeof ep_cx %ld\n", DCI, sizeof(struct ep_cx_s));
         |                                                     ~~^
         |                                                       |
         |                                                       long int
         |                                                     %d
   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from drivers/usb/gadget/udc/crg_udc.c:7:
   drivers/usb/gadget/udc/crg_udc.c: In function 'setup_datastage_trb':
>> drivers/usb/gadget/udc/crg_udc.c:774:31: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     774 |         dev_dbg(crg_udc->dev, "dma = 0x%llx, ", usb_req->dma);
         |                               ^~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:774:9: note: in expansion of macro 'dev_dbg'
     774 |         dev_dbg(crg_udc->dev, "dma = 0x%llx, ", usb_req->dma);
         |         ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:774:43: note: format string is defined here
     774 |         dev_dbg(crg_udc->dev, "dma = 0x%llx, ", usb_req->dma);
         |                                        ~~~^
         |                                           |
         |                                           long long unsigned int
         |                                        %x
   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from drivers/usb/gadget/udc/crg_udc.c:7:
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_queue_trbs':
>> drivers/usb/gadget/udc/crg_udc.c:896:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     896 |                         (void *)sg_addr, buffer_length, num_trbs_needed);
         |                         ^
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:894:17: note: in expansion of macro 'dev_dbg'
     894 |                 dev_dbg(crg_udc->dev,
         |                 ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:881:13: warning: variable 'num_sgs' set but not used [-Wunused-but-set-variable]
     881 |         u32 num_sgs = 0;
         |             ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_ep_enable':
   drivers/usb/gadget/udc/crg_udc.c:1812:26: warning: variable 'uccr' set but not used [-Wunused-but-set-variable]
    1812 |         struct crg_uccr *uccr;
         |                          ^~~~
   drivers/usb/gadget/udc/crg_udc.c:1811:25: warning: variable 'epcx' set but not used [-Wunused-but-set-variable]
    1811 |         struct ep_cx_s *epcx;
         |                         ^~~~
   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from drivers/usb/gadget/udc/crg_udc.c:7:
   drivers/usb/gadget/udc/crg_udc.c: In function 'init_ep0':
   drivers/usb/gadget/udc/crg_udc.c:2681:31: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    2681 |         dev_dbg(crg_udc->dev, "ep0 ring dma addr = 0x%llx\n", udc_ep_ptr->tran_ring_info.dma);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:2681:9: note: in expansion of macro 'dev_dbg'
    2681 |         dev_dbg(crg_udc->dev, "ep0 ring dma addr = 0x%llx\n", udc_ep_ptr->tran_ring_info.dma);
         |         ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:2681:57: note: format string is defined here
    2681 |         dev_dbg(crg_udc->dev, "ep0 ring dma addr = 0x%llx\n", udc_ep_ptr->tran_ring_info.dma);
         |                                                      ~~~^
         |                                                         |
         |                                                         long long unsigned int
         |                                                      %x
   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from drivers/usb/gadget/udc/crg_udc.c:7:
   drivers/usb/gadget/udc/crg_udc.c: In function 'getstatusrequest':
   drivers/usb/gadget/udc/crg_udc.c:3131:31: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    3131 |         dev_dbg(crg_udc->dev, "udc_req_ptr->usb_req.dma = 0x%llx\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:3131:9: note: in expansion of macro 'dev_dbg'
    3131 |         dev_dbg(crg_udc->dev, "udc_req_ptr->usb_req.dma = 0x%llx\n",
         |         ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c:3131:64: note: format string is defined here
    3131 |         dev_dbg(crg_udc->dev, "udc_req_ptr->usb_req.dma = 0x%llx\n",
         |                                                             ~~~^
         |                                                                |
         |                                                                long long unsigned int
         |                                                             %x
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_common_irq':
   drivers/usb/gadget/udc/crg_udc.c:4250:13: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
    4250 |         int retval = 0;


vim +624 drivers/usb/gadget/udc/crg_udc.c

   609	
   610	static void crg_udc_epcx_setup(struct crg_udc_ep *udc_ep)
   611	{
   612		struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
   613		const struct usb_endpoint_descriptor *desc = udc_ep->desc;
   614		const struct usb_ss_ep_comp_descriptor *comp_desc = udc_ep->comp_desc;
   615		u8 DCI = udc_ep->DCI;
   616		struct ep_cx_s *epcx = (struct ep_cx_s *)(crg_udc->p_epcx + DCI - 2);
   617		enum EP_TYPE_E ep_type;
   618		u16 maxburst = 0;
   619		u8 maxstreams = 0;
   620		u16 maxsize;
   621		u32 dw;
   622	
   623		dev_dbg(crg_udc->dev, "crgudc->p_epcx %p, epcx %p\n", crg_udc->p_epcx, epcx);
 > 624		dev_dbg(crg_udc->dev, "DCI %d, sizeof ep_cx %ld\n", DCI, sizeof(struct ep_cx_s));
   625		dev_dbg(crg_udc->dev, "desc epaddr = 0x%x\n", desc->bEndpointAddress);
   626	
   627		/*corigine gadget dir should be opposite to host dir*/
   628		if (usb_endpoint_dir_out(desc))
   629			ep_type = usb_endpoint_type(desc) + EP_TYPE_INVALID2;
   630		else
   631			ep_type = usb_endpoint_type(desc);
   632	
   633		maxsize = usb_endpoint_maxp(desc) & 0x07ff; /* D[0:10] */
   634	
   635		if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
   636			maxburst = comp_desc->bMaxBurst;
   637	
   638			if (usb_endpoint_xfer_bulk(udc_ep->desc))
   639				maxstreams = comp_desc->bmAttributes & 0x1f;
   640	
   641		} else if ((crg_udc->gadget.speed == USB_SPEED_HIGH ||
   642			crg_udc->gadget.speed == USB_SPEED_FULL) &&
   643				(usb_endpoint_xfer_int(udc_ep->desc) ||
   644					usb_endpoint_xfer_isoc(udc_ep->desc))) {
   645			if (crg_udc->gadget.speed == USB_SPEED_HIGH)
   646				maxburst = (usb_endpoint_maxp(desc) >> 11) & 0x3;
   647			if (maxburst == 0x3) {
   648				dev_err(crg_udc->dev, "invalid maxburst\n");
   649				maxburst = 0x2;
   650			}
   651		}
   652	
   653		/* fill ep_dw0 */
   654		dw = 0;
   655		dw = SETF_VAR(EP_CX_LOGICAL_EP_NUM, dw, udc_ep->DCI / 2);
   656		dw = SETF_VAR(EP_CX_INTERVAL, dw, desc->bInterval);
   657		if (maxstreams) {
   658			dev_err(crg_udc->dev, "%s maxstream=%d is not expected\n",
   659				__func__, maxstreams);
   660		}
   661		epcx->dw0 = cpu_to_le32(dw);
   662	
   663		/* fill ep_dw1 */
   664		dw = 0;
   665		dw = SETF_VAR(EP_CX_EP_TYPE, dw, ep_type);
   666		dw = SETF_VAR(EP_CX_MAX_PACKET_SIZE, dw, maxsize);
   667		dw = SETF_VAR(EP_CX_MAX_BURST_SIZE, dw, maxburst);
   668		epcx->dw1 = cpu_to_le32(dw);
   669	
   670		/* fill ep_dw2 */
   671		dw = lower_32_bits(udc_ep->tran_ring_info.dma) & EP_CX_TR_DQPT_LO_MASK;
   672		dw = SETF_VAR(EP_CX_DEQ_CYC_STATE, dw, udc_ep->pcs);
   673		epcx->dw2 = cpu_to_le32(dw);
   674	
   675		/* fill ep_dw3 */
   676		dw = upper_32_bits(udc_ep->tran_ring_info.dma);
   677		epcx->dw3 = cpu_to_le32(dw);
   678		/* Ensure that epcx is updated */
   679		wmb();
   680	}
   681	
   682	static void crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep)
   683	{
   684		struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
   685		u8 DCI = udc_ep->DCI;
   686		struct ep_cx_s *epcx = (struct ep_cx_s *)(crg_udc->p_epcx + DCI - 2);
   687		u32 dw;
   688		dma_addr_t dqptaddr;
   689		u32 cmd_param0;
   690	
   691		if (DCI == 0) {
   692			dev_err(crg_udc->dev, "%s Cannot update dqptr for ep0\n", __func__);
   693			return;
   694		}
   695	
   696		dqptaddr = tran_trb_virt_to_dma(udc_ep, udc_ep->deq_pt);
   697	
   698		/* fill ep_dw2 */
   699		dw = lower_32_bits(dqptaddr) & EP_CX_TR_DQPT_LO_MASK;
   700		dw = SETF_VAR(EP_CX_DEQ_CYC_STATE, dw, udc_ep->pcs);
   701		epcx->dw2 = cpu_to_le32(dw);
   702	
   703		/* fill ep_dw3 */
   704		dw = upper_32_bits(dqptaddr);
   705		epcx->dw3 = cpu_to_le32(dw);
   706	
   707		cmd_param0 = (0x1 << udc_ep->DCI);
   708		/* Ensure that dqptr is updated */
   709		wmb();
   710	
   711		crg_issue_command(crg_udc, CRG_CMD_SET_TR_DQPTR, cmd_param0, 0);
   712	}
   713	
   714	static void setup_status_trb(struct crg_gadget_dev *crg_udc,
   715			struct transfer_trb_s *p_trb,
   716			struct usb_request *usb_req, u8 pcs, u8 set_addr, u8 stall)
   717	{
   718		u32 tmp, dir = 0;
   719	
   720		/* There are some cases where seutp_status_trb() is called with
   721		 * usb_req set to NULL.
   722		 */
   723	
   724		p_trb->dw0 = 0;
   725		p_trb->dw1 = 0;
   726	
   727		dev_dbg(crg_udc->dev, "data_buf_ptr_lo = 0x%x, data_buf_ptr_hi = 0x%x\n",
   728			p_trb->dw0, p_trb->dw1);
   729	
   730		tmp = 0;
   731		tmp = SETF_VAR(TRB_INTR_TARGET, tmp, 0);
   732		p_trb->dw2 = tmp;
   733	
   734		tmp = 0;
   735		tmp = SETF_VAR(TRB_CYCLE_BIT, tmp, pcs);
   736		tmp = SETF_VAR(TRB_INTR_ON_COMPLETION, tmp, 1);/*IOC:1*/
   737		tmp = SETF_VAR(TRB_TYPE, tmp, TRB_TYPE_XFER_STATUS_STAGE);
   738	
   739		dir = (crg_udc->setup_status == STATUS_STAGE_XFER) ? 0 : 1;
   740		tmp = SETF_VAR(DATA_STAGE_TRB_DIR, tmp, dir);
   741	
   742		tmp = SETF_VAR(TRB_SETUP_TAG, tmp, crg_udc->setup_tag);
   743		tmp = SETF_VAR(STATUS_STAGE_TRB_STALL, tmp, stall);
   744		tmp = SETF_VAR(STATUS_STAGE_TRB_SET_ADDR, tmp, set_addr);
   745	
   746		p_trb->dw3 = tmp;
   747		dev_dbg(crg_udc->dev, "trb_dword2 = 0x%x, trb_dword3 = 0x%x\n",
   748				p_trb->dw2, p_trb->dw3);
   749		/* Ensure that status trb is updated */
   750		wmb();
   751	}
   752	
   753	static void knock_doorbell(struct crg_gadget_dev *crg_udc, int DCI)
   754	{
   755		u32 tmp;
   756		struct crg_uccr *uccr;
   757	
   758		uccr = crg_udc->uccr;
   759		/* Ensure evreything is written before notifying the HW */
   760		wmb();
   761	
   762		tmp = CRG_U3DC_DB_TARGET(DCI);
   763		dev_dbg(crg_udc->dev, "DOORBELL = 0x%x\n", tmp);
   764		writel(tmp, &uccr->doorbell);
   765	}
   766	
   767	static void setup_datastage_trb(struct crg_gadget_dev *crg_udc,
   768			struct transfer_trb_s *p_trb, struct usb_request *usb_req,
   769			u8 pcs, u32 num_trb, u32 transfer_length, u32 td_size,
   770			u8 IOC, u8 AZP, u8 dir, u8 setup_tag)
   771	{
   772		u32 tmp;
   773	
 > 774		dev_dbg(crg_udc->dev, "dma = 0x%llx, ", usb_req->dma);
   775		dev_dbg(crg_udc->dev, "buf = 0x%lx, ", (unsigned long)usb_req->buf);
   776	
   777		p_trb->dw0 = lower_32_bits(usb_req->dma);
   778		p_trb->dw1 = upper_32_bits(usb_req->dma);
   779	
   780		dev_dbg(crg_udc->dev, "data_buf_ptr_lo = 0x%x, data_buf_ptr_hi = 0x%x\n",
   781			p_trb->dw0, p_trb->dw1);
   782	
   783	
   784		/* TRB_Transfer_Length
   785		 *For USB_DIR_OUT, this field is the number of data bytes expected from
   786		 *xhc. For USB_DIR_IN, this field is the number of data bytes the device
   787		 *will send.
   788		 */
   789		tmp = 0;
   790		tmp = SETF_VAR(TRB_TRANSFER_LEN, tmp, transfer_length);
   791		tmp = SETF_VAR(TRB_TD_SIZE, tmp, td_size);
   792		tmp = SETF_VAR(TRB_INTR_TARGET, tmp, 0);
   793		p_trb->dw2 = tmp;
   794	
   795		tmp = 0;
   796		tmp = SETF_VAR(TRB_CYCLE_BIT, tmp, pcs);
   797		tmp = SETF_VAR(TRB_INTR_ON_SHORT_PKT, tmp, 1);
   798		tmp = SETF_VAR(TRB_INTR_ON_COMPLETION, tmp, IOC);
   799		tmp = SETF_VAR(TRB_TYPE, tmp, TRB_TYPE_XFER_DATA_STAGE);
   800		tmp = SETF_VAR(TRB_APPEND_ZLP, tmp, AZP);
   801		tmp = SETF_VAR(DATA_STAGE_TRB_DIR, tmp, dir);
   802		tmp = SETF_VAR(TRB_SETUP_TAG, tmp, setup_tag);
   803	
   804		p_trb->dw3 = tmp;
   805		/* Ensure that datastage trb is updated */
   806		wmb();
   807	
   808		dev_dbg(crg_udc->dev, "trb_dword0 = 0x%x, trb_dword1 = 0x%x trb_dword2 = 0x%x, trb_dword3 = 0x%x\n",
   809				p_trb->dw0, p_trb->dw1, p_trb->dw2, p_trb->dw3);
   810	}
   811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

