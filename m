Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A191431EF7F
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 20:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhPZY5C8mz3bN8
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 06:16:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=Tc8ATBAV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gkbEkPZT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Tc8ATBAV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gkbEkPZT; 
 dkim-atps=neutral
X-Greylist: delayed 545 seconds by postgrey-1.36 at boromir;
 Fri, 19 Feb 2021 06:16:07 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhPZH6j5gz30Lj
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 06:16:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9028D6F3;
 Thu, 18 Feb 2021 14:06:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 18 Feb 2021 14:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :mime-version:content-type; s=fm1; bh=aWIXjDzjHTS0z2/OmZXblqA14A
 3L2/GxFBBuONULZJE=; b=Tc8ATBAVVKE4MArLIf8JL5UEnm9bLhTenBKkf4Iq2U
 NPhbnVj1G22iMXn+Nfqy2SMkT4wlGjUnJUFmhVhDT4Gu071tgFPjrzZsPUQ46dxH
 RFilIUl1Lx53yCaHK5y/Y/kHChxFJYxbUPpFONwJFjfrVJhwRV+Oj9RdjtvNvfz/
 mNsZ5fse4dYyTtPVFgMj3pmt1PzWLmd5v7Laaf/LrDUlBk5z5gwmAXwqVDyMBJqr
 DopvZEt/mE7oWbRFHd0AkUd/rT53tt6IsrhoR2CNEqmH9I4SYcoEaO1l0iu4CBho
 IJh2I7egyuuF9yiSIdHw4VL1hjll9qzg9SBNyk74QWlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=aWIXjDzjHTS0z2/OmZXblqA14A3L2
 /GxFBBuONULZJE=; b=gkbEkPZTYTl+iiENA3cfyP+Nf/modhXaQIwgwZWjwdMie
 GmLV0nqTU5sN3JKPCznTpcTFoURVC1xddCEq08jYmkGI1v3YExIoY6AJDYS06TFp
 8i9urP25lBliC+a4nCWuHUe6fBBYUQ69OdOQJlnJRV28Z95NccQEqoJNHQlkkB6Q
 6RGEYr/kqt23IMBwGVo8eRC/yKTINIPdRHqEPffJNyCVjkj7SpbAQIoYo4QIcPyb
 lsPprlTe6tDntAX25lPc6lDmoNpIannfKoDSVVCgWDS9pAQnIDIwAHd8/RwvUCWj
 gzEgD2jEBMxX9KORsffovmCncnjxjkmOT/rCY/Geg==
X-ME-Sender: <xms:0LouYIpx_jcjN02c-6trSh656eBTFxVzISSINrlMLr1VOVhlLba9hQ>
 <xme:0LouYOpvhhCWbwvBPV2INTF02thcnxT-kQcf9JUjOhwDEFhQqv5EcRLyIRnRWofPJ
 YKgj-8d-Q-u-I0Hsu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
 ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleejgeefteekhe
 dvueefleduleeuffdugfdvvedtuedtleeufeduueeufeduveenucfkphepudejfedrudei
 jedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:0LouYNM64uADLJc0TqrSHeLItiEUUiTEVw1ToyPYniaQQ8n6ZEpxzQ>
 <xmx:0LouYP4JlHoo09JGEdwLGAV_RpHGacuClaTYTyLhk96NVXtWL4mOOQ>
 <xmx:0LouYH45bujKSQWej4ZbRChdRRvErvM7FGulv-hdXlv04ZNrFoqBeQ>
 <xmx:0bouYEi_fjU_Br9ezmEs9v6v_5pyZMuMn2Kix5SQZFBtjhKay7se-w>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 197F0240062;
 Thu, 18 Feb 2021 14:06:56 -0500 (EST)
Date: Thu, 18 Feb 2021 14:06:54 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: any in-progress Redfish TelemetryService enhancements?
Message-ID: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: piotr.matuszczak@intel.com, adrian.ambrozewicz@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Has anyone thought about how to implement the Append behaviors for the 
ReportUpdates property in a MetricReportDefinition?

thx - brad
