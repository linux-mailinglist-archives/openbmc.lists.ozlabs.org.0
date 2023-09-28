Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D3B7B289C
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 00:59:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K3lAOylf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxTSf70Kqz3c5c
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 08:59:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K3lAOylf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxTRw5rh4z3c3g;
	Fri, 29 Sep 2023 08:58:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695941933; x=1727477933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UbGttFfuP6lw+hHb/xkwIGlEdNBxv5J2I9w5oq0PHfc=;
  b=K3lAOylf+FG712RfmqYD0YNVtsofM3XkWud/yFBncGNGOFM+8owLW6vW
   LZl//5VihP+/8MB5BoBH70eCh+fE3NJjU7l4PmJLZ1Hdwe4Z4Y9SeU9/M
   25N4LSIaW+lgxTphDOmtp+zipMvT/RsGvyHwxcQ8HNe4WLp+5Kpp8Rse3
   Nm6UXfX+8ouJSN9OaWz9bfAC243Pcac5/IVgiosl5ZS00Yyzpb5DHatj0
   w7T1jo6HvUnMSB9OClT+Qma7r+YJiFmLjNUHhQE9H9pD8gi2us9fDc0WK
   Qq66+EgdgBTQByOG7hjWnG3DpXbOybUIWGTXMaFLkmHyqJTfuKhflBz2W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362443604"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="362443604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 15:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923423965"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="923423965"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 15:58:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlzxs-00026Y-0x;
	Thu, 28 Sep 2023 22:58:36 +0000
Date: Fri, 29 Sep 2023 06:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <202309290613.qxRTI9f7-lkp@intel.com>
References: <20230928123009.2913-4-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928123009.2913-4-aladyshev22@gmail.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, edumazet@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, benjaminfair@google.com, openbmc@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, minyard@acm.org, aladyshev22@gmail.com, oe-kbuild-all@lists.linux.dev, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Konstantin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cminyard-ipmi/for-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Aladyshev/ipmi-Move-KCS-headers-to-common-include-folder/20230928-203248
base:   https://github.com/cminyard/linux-ipmi for-next
patch link:    https://lore.kernel.org/r/20230928123009.2913-4-aladyshev22%40gmail.com
patch subject: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309290613.qxRTI9f7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290613.qxRTI9f7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290613.qxRTI9f7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_arp.h:22,
                    from drivers/net/mctp/mctp-kcs.c:16:
   drivers/net/mctp/mctp-kcs.c: In function 'mctp_kcs_validate_data':
>> drivers/net/mctp/mctp-kcs.c:121:25: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
     121 |                         "%s: KCS binding header error! len = 0x%02x, but should be 0x%02x",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/mctp/mctp-kcs.c:120:17: note: in expansion of macro 'dev_err'
     120 |                 dev_err(mkcs->client.dev->dev,
         |                 ^~~~~~~
   drivers/net/mctp/mctp-kcs.c:121:89: note: format string is defined here
     121 |                         "%s: KCS binding header error! len = 0x%02x, but should be 0x%02x",
         |                                                                                      ~~~^
         |                                                                                         |
         |                                                                                         unsigned int
         |                                                                                      %02lx


vim +121 drivers/net/mctp/mctp-kcs.c

    95	
    96	static int mctp_kcs_validate_data(struct mctp_kcs *mkcs,
    97					  struct mctp_kcs_header *hdr, int len)
    98	{
    99		struct net_device *ndev = mkcs->netdev;
   100		struct mctp_kcs_trailer *tlr;
   101		u8 pec;
   102	
   103		if (hdr->netfn_lun != MCTP_KCS_NETFN_LUN) {
   104			dev_err(mkcs->client.dev->dev,
   105				"%s: KCS binding header error! netfn_lun = 0x%02x, but should be 0x%02x",
   106				__func__, hdr->netfn_lun, MCTP_KCS_NETFN_LUN);
   107			ndev->stats.rx_dropped++;
   108			return -EINVAL;
   109		}
   110		if (hdr->defining_body != DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP) {
   111			dev_err(mkcs->client.dev->dev,
   112				"%s: KCS binding header error! defining_body = 0x%02x, but should be 0x%02x",
   113				__func__, hdr->defining_body,
   114				DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP);
   115			ndev->stats.rx_dropped++;
   116			return -EINVAL;
   117		}
   118		if (hdr->len != (len - sizeof(struct mctp_kcs_header) -
   119				 sizeof(struct mctp_kcs_trailer))) {
   120			dev_err(mkcs->client.dev->dev,
 > 121				"%s: KCS binding header error! len = 0x%02x, but should be 0x%02x",
   122				__func__, hdr->len,
   123				(len - sizeof(struct mctp_kcs_header) -
   124				 sizeof(struct mctp_kcs_trailer)));
   125			ndev->stats.rx_length_errors++;
   126			return -EINVAL;
   127		}
   128	
   129		pec = generate_pec((u8 *)(hdr + 1), hdr->len);
   130		tlr = (struct mctp_kcs_trailer *)((u8 *)(hdr + 1) + hdr->len);
   131		if (pec != tlr->pec) {
   132			dev_err(mkcs->client.dev->dev,
   133				"%s: PEC error! Packet value=0x%02x, calculated value=0x%02x",
   134				__func__, tlr->pec, pec);
   135			ndev->stats.rx_crc_errors++;
   136			return -EINVAL;
   137		}
   138		return 0;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
