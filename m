Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F249433788
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 15:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYZl04zGWz30R6
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 00:45:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=ZlGiBUBi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=m4HzdZ1O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZlGiBUBi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=m4HzdZ1O; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYZkW1slzz2ybB
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 00:45:22 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BFE25C0359;
 Tue, 19 Oct 2021 09:45:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 19 Oct 2021 09:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=u/DpOnJMIVhNgsQAthSMtxIhoG
 5u5IZpwdr/HX5EeOo=; b=ZlGiBUBizuB95gT/Hhz9Bp8/CqKNEYT7RE+JEyJhvA
 Pb+k+EQ5ThJSqF4jrUAVIPfsJfu74nLFBGDsn5Tk9oDSIqzVP/yaDkgYGOAN+tID
 LM7h/J5eWwDUUHAc1lqSJJj/4+PN40VvK059Ls5xc5gtG4Evb7OBXV6NwGN3jNU5
 MWAVJOuY0Wz61jQzDGemQlC/bWoKrWhidNXJXh2KhqTeK+e0ziTOS71gG3AmAo+Y
 J4sXYNPH1wnfnx4bBuRMy+aU0MQCvW/9oWxfZUrSVRg2Z9VeMCp3nWG1xAvYqB9+
 47S9/SOz/PRx1krEA3kwCTSsxAMBLqI7Iw4xhKuWbyjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=u/DpOnJMIVhNgsQAthSMtxIhoG5u5IZpwdr/HX5Ee
 Oo=; b=m4HzdZ1OTHxoTVc/RsYTexGUgcRqFzGzy2FAq+JyxWXrHI3VCPakk1wJq
 ndpGB/pPi0vq4f+gGvMywGpVWOYfx/HA5LRmomJS8kRtZEzG3zlXi8HJRAoa0Lvf
 tsL1GBmCY/GVFT2nKO2tr57I33I5yZcdOkAENkpBUUZMfCaYy/o6r8Q2eGkgH+Fu
 nF44xsJcNp2KFrwKn9nN+6QIFEzi4ftfmtzX7DaxC7hY9aHGY4IjpfXGrqbspDbC
 V8MSkQ6pNh6n9jRvBj4sQ20zya+BH07WWOfqpw8l3fKoIwJMYy4/hVZgn7t3lnr6
 eMjH3IhlUAtqDLtvy6zw5m3jzwDTg==
X-ME-Sender: <xms:7ctuYeWwwFDwKiXZrayGouhEn8qJabvJOWDWsb3HZP7n_t6kXy-AuQ>
 <xme:7ctuYakrC3Itsat5Clz_Al5QiJpDw_xKuJWsAAKjqXsRIj__55DWq2PSzNSP18Ega
 0fw49rahRNbi3uQqiY>
X-ME-Received: <xmr:7ctuYSbFJ112rOoHP864ZHg1HIoFg3e-7dXXIQzF-ek9-yj7QF_fllqWH9DGxJ4rvvrqH8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeduvdevhefhvdfgvdehieekleeigfdugeeltdffvedv
 ueeiffejudduffdufeeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:7ctuYVWB-lzZ4laEnZJgCAFVM2nLWdnsf4OgRA9kx-wTl5N8LS5DSw>
 <xmx:7ctuYYkze9OmwjMWAX9QGhYRSLypKVeHLSicR8oaMEsnYYEdYY3orw>
 <xmx:7ctuYaej9IzbVQ8xzJWsJAlUDorRenc9cS5m919R4iqXtCDBUSZdhQ>
 <xmx:7stuYSg3-WKsoJ8m6WXtxZLyLlRXge_h7uNewW3jwOIElk5kPnq1LA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Oct 2021 09:45:17 -0400 (EDT)
Message-ID: <8122cf87625adf94b9e2f4374e405aeb40c21460.camel@fuzziesquirrel.com>
Subject: Re: Control and uses of USB for BMC's own internal uses
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <edtanous@google.com>, Bruce Mitchell
 <bruce.mitchell@linux.vnet.ibm.com>
Date: Tue, 19 Oct 2021 09:45:16 -0400
In-Reply-To: <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
 <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
 <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com,
 richard.marian.thomaiyar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2021-10-18 at 13:32 -0700, Ed Tanous wrote:
> On Mon, Oct 18, 2021 at 11:36 AM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
> > 
> > On 10/17/2021 11:55, Bruce Mitchell wrote:
> > > 
> > > 
> 
> Some clarifying questions:
> There are physically available USB A ports connected directly to the
> BMC on IBM platforms?  Or are these traces within the board?
> What are these direct bmc usb ports used for normally?
> 
> Considering that while the BMC use case is likely IBM specific,

Just curious - what makes you say this?

> but
> the idea of disabling a generic USB port isn't IBM specific, it seems
> like we need a model for a USB port on dbus and relate it to the
> various resources.  If and when a host interface wanted to implement a
> similar feature, we'd be able to reuse it.

The goal isn't really to disable a USB port.  It is to disable the
assorted bits of software that run when a USB device of a specific class
(mass storage, serial, etc) is plugged into it.  What would it even mean
to disable a USB port?  Would it need to be powered off?

