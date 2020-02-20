Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D425166878
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 21:36:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NmbF0ZtQzDqcV
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 07:36:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=MwrKSjkg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kkAw7Bz0; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NmZL5rJzzDqSd
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 07:35:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1B74E499;
 Thu, 20 Feb 2020 15:35:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 15:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=c73aiKn+PZKNRx9tS6e3/XHzpKLpZsINWhySj5mu+eA=; b=MwrKSjkg
 bwlF26fMBYIOKrxvXzlxOiKbqLgQkaWEgiMROPlgGTDKjHrVdAjjxRL6TNClj6sU
 SZXdFmrWbj7Ec6VDetCF+oDo3KRAnm6nF76VEA5piIQo6Sp4b0Ro+Mn80fhvPHnC
 L4nn0HUPoIaVaJhZHsTxB1XTG+xSDB5b6rvU8xfh4/B8Wxd4coeHjf6Oj8fha8pp
 2Uggl9x2Jl5t0LahJaIreUHIlLw6l7u2UzOpmHfQZYBm6uXHZobxOOCIgoMay1+j
 kZdPaU5tUd9vDdeMU0nPq9CAgkdVTOTumAsiYFVWHmtGqKeuu3+aIF4rDF2fk6Sx
 5JMfXXqyo6k7tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=c73aiKn+PZKNRx9tS6e3/XHzpKLpZ
 sINWhySj5mu+eA=; b=kkAw7Bz0tg2x0heK886o+WilmTSrLCydtfk2r/2l7gjaQ
 xApkroTkRQVSL5dEp2MfDhrYmM6ppdMrsYos7M8F5eMeB7IqBjmzX0fXyqREd3Cl
 ihSoBNBj7FEU12Eb2wZL9lZFA1VV5mrUwQrjfUxTnKln7D8uDDP3l/mGjk1J32s0
 kHppGCd/F0yoRRawEEEi2toEcbs3Qz1vHyZXquJf1eZp9K0in4Aehn6mYIOWSNqJ
 PZOMSanr2HeneN/4p5Rqpy+9SVgFvmgKqmUWXqd9bFD2ZyUmowWvx2/Zyl/Fs5qx
 +aPmhRkt/u6hEsI4r3YxLWABz+m6l5ug/5UqtvYUg==
X-ME-Sender: <xms:o-1OXj5_2pAUgOBJQmrm86CgEHKhSPLi93OKTcFusHnxXq4MmVfgFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkgggtugesthdtredttddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
 mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuffhomhgrihhnpehophgvnh
 gsmhgtqdhprhhojhgvtghtrdighiiinecukfhppeduieefrdduudegrddufedtrdduvdek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrth
 hrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:o-1OXlpY8TLt7rxyCcosyAmrLLTvAKfmU6vNj8TuzqpklbGsE0hHIA>
 <xmx:o-1OXmAVNFyKF8HRdzHNBnN7l4vWih9W935EIIEx3Hk6smN2s2MhyA>
 <xmx:o-1OXqRl8VR4xqSAbdBhRCV0VwjjKmzIPXGgiipqRhOZVh-d7ahnBw>
 <xmx:pO1OXuYXVJs1kwcIwAdHirJbqOoz7xwhZC4vKoP3YknBLtmNEseFl1ZupLo>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 952353060BD1;
 Thu, 20 Feb 2020 15:35:47 -0500 (EST)
Date: Thu, 20 Feb 2020 14:35:46 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: kurt.r.taylor@gmail.com
Subject: sdbusplus commits missing CLA
Message-ID: <20200220203546.GF41328@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Kurt,

We have a few commits for the openbmc/sdbusplus repository that have
been floating around in Gerrit since early 2018 and seem to be stuck in
"missing CLA limbo".  It appears that there was some discussion on the
CLA at one point but I don't know what happened to it.  I don't see a
CLA from the Bosch company in the Google Doc folder.

https://gerrit.openbmc-project.xyz/q/owner:mark.jonas%2540de.bosch.com

There was recently a request to revive this work because someone else is
finding it useful (and we've had a feature request open for a long time
on one of them as well).  What options do we, the maintainers, have in
this situation?

I don't really want to blindly reimplement this feature since there was
good work done here.  There appears to have been no plagiarism issues.
Since the commits have a S-O-B by two people from the same company, it
seems reasonable that they fully intended to contribute this work
publicly.  I'm not looking to restart a "why do we have CLAs"
discussion, but it seems like we need some direction on what maintainers
should do when there is a missing CLA.

-- 
Patrick Williams
