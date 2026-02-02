Return-Path: <openbmc+bounces-1307-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKjhJtnggGl0CQMAu9opvQ
	(envelope-from <openbmc+bounces-1307-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 18:37:29 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BBCFAE8
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 18:37:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4Yhz40DWz309N;
	Tue, 03 Feb 2026 04:37:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770053843;
	cv=none; b=Nd0VeJ12ocHiyk5XL9g2PnSRQkvMPZdAqAvHuuNqwdzfVIQSDsn59su69sHsnpNu5gO64s9iGZ6ld2tK23HbLGLMMu238OUeKHJAcKxbA6vdBorcYhJdImKTklls3d89YCtojfNyRe2N5MGHPFcYbQOPqG9yYFe1mJzjFjDCXa18Z10rdm+0HNMvbrXzyh2yCsqwxTCfPmi+ZgQUO6pdNHp3VFxpeNO2iyl2ObyFsEGK4CDojOozhtIVxvDEf/xQlfQr0x6aYvTeKYh4Zz4+hDDs6O1CO2a+kl2MkFPYnhsKU4SzOhiEjw29GGv1d2w6or4urvcvDhpKrV5piJY8og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770053843; c=relaxed/relaxed;
	bh=UuT7BSbTpA9YqGylIgcZMjHRBgp33SIFds1E3lD+FRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GREm73mOEVd4bMtqGLwLy4YgCS2D9xo65GyeOZ0xj56sRJLL+X2R6oW7OSNNcozKFvlnxGrQECHkaqFj8aEWn3Q6C6tw88yE3v8/aV1R2TPWcmVo40AUP1+dAKtjXqQA1TyOXgvs2bjZU6uesepqFWHAgeXQTNO0kIImUwjJPkEDfeqAQR89F+LHSZLjtAtUhd+KX98VDUtq2uSpfPxmrwzJ4mdoFtlJmb1Jm/2UcH8QlGj1Z5tbHHVHa0xzGl+cwxvtK1IoxWRtlnbROPnYx8KHmmTY3KHUJKKqdD4SZRMxp14HTneOr51YJLEYEY99J2h0KseRqcKjTdFwpXt71A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WAk7AcUa; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WAk7AcUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Yhx2Lt2z2xpn
	for <openbmc@lists.ozlabs.org>; Tue, 03 Feb 2026 04:37:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770053841; x=1801589841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnUdp0fecZJL9WMPJ0BhqY7uIDclw68asQkR5FLPZ6A=;
  b=WAk7AcUa5reiwABO7r/OrOaqN7Y/BuasEZAB9cP6RieJx64spScgWFKI
   4y0pWodUrwVbZDEpZZhJV/fqQZsjsMUYdoaacko1iZrJbNp467Lz3JoeC
   DMX7rFTP2JAM5ksS3ULDQCTzhiw4reTHfajqFXHHYUI7qCoq2bvL59mR/
   0B6OdDDiRTG8TYz85Pv5k30pfiH0dQJBS4o93SA3J+jLq6gWa1oROIA7u
   dSihZpndTXc/efICbNP4Dg5a6lgIiZ2JpOpapIiq93ExaEjCjM2r+PHQC
   ShM14P12RQaUI/btltDG+w1i/bGFUa3TPz1Vfoy43deglSAVQtWPjYExx
   Q==;
X-CSE-ConnectionGUID: tqDxxCpKQlySw+IR1Uh9MQ==
X-CSE-MsgGUID: 2INVSzMdTeejDWzSzxBs7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82584542"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="82584542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 09:37:15 -0800
X-CSE-ConnectionGUID: mNWRr4kkTkKaw6XHoiHtJA==
X-CSE-MsgGUID: /VpVgHcER1S748B3+00oVw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2026 09:37:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmxrK-00000000foG-3J1S;
	Mon, 02 Feb 2026 17:37:10 +0000
Date: Tue, 3 Feb 2026 01:37:05 +0800
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
Message-ID: <202602030131.VCTzZ4me-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1307-lists,openbmc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DD3BBCFAE8
X-Rspamd-Action: no action

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Moravcevic/dt-bindings-usb-axiado-ax3000-udc-Add-Axiado-UDC/20260202-211951
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f%40axiado.com
patch subject: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device controller IP Corigine
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260203/202602030131.VCTzZ4me-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030131.VCTzZ4me-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030131.VCTzZ4me-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_queue_trbs':
>> drivers/usb/gadget/udc/crg_udc.c:881:13: warning: variable 'num_sgs' set but not used [-Wunused-but-set-variable]
     881 |         u32 num_sgs = 0;
         |             ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_ep_enable':
>> drivers/usb/gadget/udc/crg_udc.c:1812:26: warning: variable 'uccr' set but not used [-Wunused-but-set-variable]
    1812 |         struct crg_uccr *uccr;
         |                          ^~~~
>> drivers/usb/gadget/udc/crg_udc.c:1811:25: warning: variable 'epcx' set but not used [-Wunused-but-set-variable]
    1811 |         struct ep_cx_s *epcx;
         |                         ^~~~
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_common_irq':
>> drivers/usb/gadget/udc/crg_udc.c:4250:13: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
    4250 |         int retval = 0;
         |             ^~~~~~
   drivers/usb/gadget/udc/crg_udc.c: At top level:
>> drivers/usb/gadget/udc/crg_udc.c:126:19: warning: 'driver_name' defined but not used [-Wunused-const-variable=]
     126 | static const char driver_name[] = "crg_udc";
         |                   ^~~~~~~~~~~
--
>> Warning: drivers/usb/gadget/udc/crg_udc.c:4325 cannot understand function prototype: 'const struct of_device_id of_crg_udc_match[] ='


vim +/num_sgs +881 drivers/usb/gadget/udc/crg_udc.c

   858	
   859	static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
   860			struct crg_udc_request *udc_req_ptr,  bool b_isoc,
   861			u32 xfer_ring_size,
   862			u32 num_trbs_needed, u64 buffer_length)
   863	{
   864		struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
   865		struct transfer_trb_s *p_xfer_ring = udc_ep_ptr->first_trb;
   866		u32 num_trbs_ava = 0;
   867		struct usb_request *usb_req = &udc_req_ptr->usb_req;
   868		u64 buff_len_temp = 0;
   869		u32 i, j = 1;
   870		struct transfer_trb_s *enq_pt = udc_ep_ptr->enq_pt;
   871		u8 td_size;
   872		u8 chain_bit = 1;
   873		u8 short_pkt = 0;
   874		u8 intr_on_compl = 0;
   875		u32 count;
   876		bool full_td = true;
   877		u32 intr_rate;
   878		dma_addr_t trb_buf_addr;
   879		bool need_zlp = false;
   880		struct scatterlist *sg = NULL;
 > 881		u32 num_sgs = 0;
   882		u64 sg_addr = 0;
   883	
   884		dev_dbg(crg_udc->dev, "%s %s\n", __func__, udc_ep_ptr->usb_ep.name);
   885		if (udc_req_ptr->usb_req.num_sgs) {
   886			num_sgs = udc_req_ptr->usb_req.num_sgs;
   887			sg = udc_req_ptr->usb_req.sg;
   888			sg_addr = (u64) sg_dma_address(sg);
   889			buffer_length = sg_dma_len(sg);
   890	
   891			dev_dbg(crg_udc->dev, "num_sgs = %d, num_mapped_sgs = %d\n",
   892				udc_req_ptr->usb_req.num_sgs,
   893				udc_req_ptr->usb_req.num_mapped_sgs);
   894			dev_dbg(crg_udc->dev,
   895				"sg_addr = %p, buffer_length = %llu, num_trbs = %d\n",
   896				(void *)sg_addr, buffer_length, num_trbs_needed);
   897		}
   898	
   899		if (!b_isoc) {
   900			if (udc_req_ptr->usb_req.zero == 1 &&
   901				udc_req_ptr->usb_req.length != 0 &&
   902				((udc_req_ptr->usb_req.length %
   903				  udc_ep_ptr->usb_ep.maxpacket) == 0)) {
   904				need_zlp = true;
   905			}
   906		}
   907	
   908		td_size = num_trbs_needed;
   909	
   910		num_trbs_ava = room_on_ring(crg_udc, xfer_ring_size,
   911			p_xfer_ring, udc_ep_ptr->enq_pt, udc_ep_ptr->deq_pt);
   912	
   913		/* trb_buf_addr points to the addr of the buffer that we write in
   914		 * each TRB. If this function is called to complete the pending TRB
   915		 * transfers of a previous request, point it to the buffer that is
   916		 * not transferred, or else point it to the starting address of the
   917		 * buffer received in usb_request
   918		 */
   919		if (udc_req_ptr->trbs_needed) {
   920			/* Here udc_req_ptr->trbs_needed is used to indicate if we
   921			 * are completing a previous req
   922			 */
   923			trb_buf_addr = usb_req->dma +
   924				(usb_req->length - udc_req_ptr->buff_len_left);
   925		} else {
   926			if (sg_addr)
   927				trb_buf_addr = sg_addr;
   928			else
   929				trb_buf_addr = usb_req->dma;
   930		}
   931	
   932		if (num_trbs_ava >= num_trbs_needed) {
   933			count = num_trbs_needed;
   934		} else {
   935			if (b_isoc) {
   936				struct crg_udc_request *udc_req_ptr_temp;
   937				u8 temp = 0;
   938	
   939				list_for_each_entry(udc_req_ptr_temp,
   940						&udc_ep_ptr->queue, queue) {
   941					temp++;
   942				}
   943	
   944				if (temp >= 2) {
   945					dev_err(crg_udc->dev, "%s don't do isoc discard\n", __func__);
   946					/*  we already scheduled two mfi in advance. */
   947					return 0;
   948				}
   949			}
   950	
   951			/* always keep one trb for zlp. */
   952			count = num_trbs_ava;
   953			full_td = false;
   954			dev_dbg(crg_udc->dev, "TRB Ring Full. Avail: 0x%x Req: 0x%x\n",
   955					num_trbs_ava, num_trbs_needed);
   956			udc_ep_ptr->tran_ring_full = true;
   957	
   958			/*if there is still some trb not queued,
   959			 *it means last queued
   960			 *trb is not the last trb of TD, so no need zlp
   961			 */
   962			need_zlp = false;
   963		}
   964	
   965		for (i = 0; i < count; i++) {
   966			if ((udc_req_ptr->usb_req.num_sgs) && (buffer_length == 0)) {
   967				sg = sg_next(sg);
   968				if (sg) {
   969					trb_buf_addr = (u64) sg_dma_address(sg);
   970					buffer_length = sg_dma_len(sg);
   971					dev_dbg(crg_udc->dev,
   972						"trb_buf_addr = %p, num_trbs = %d\n",
   973						(void *)trb_buf_addr, num_trbs_needed);
   974					dev_dbg(crg_udc->dev, "buffer_length = %llu\n",
   975						buffer_length);
   976				} else {
   977					dev_err(crg_udc->dev,
   978						"scatterlist ended unexpectedly (i=%d, count=%d)\n",
   979						i, count);
   980					return -EINVAL;
   981				}
   982			}
   983	
   984			if (buffer_length > TRB_MAX_BUFFER_SIZE)
   985				buff_len_temp = TRB_MAX_BUFFER_SIZE;
   986			else
   987				buff_len_temp = buffer_length;
   988	
   989			buffer_length -= buff_len_temp;
   990	
   991			if (usb_endpoint_dir_out(udc_ep_ptr->desc))
   992				short_pkt = 1;
   993	
   994			if ((buffer_length == 0) && (i == (count - 1))) {
   995				chain_bit = 0;
   996				intr_on_compl = 1;
   997				udc_req_ptr->all_trbs_queued = 1;
   998			}
   999	
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

