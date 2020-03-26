Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1811940A4
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 15:00:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p68H66pdzDqC7
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 01:00:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=XhjEBAMN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fPqm7r2z; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p6073MWPzDqsX
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 00:53:41 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 868B4458;
 Thu, 26 Mar 2020 09:53:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 26 Mar 2020 09:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=1
 DIfDLPT5v9jT1osqzeTiU4HnnUmc46Q0PQMNi5DfRs=; b=XhjEBAMNIkysiUf6r
 cbcgSio0Uj+htSinbi3Pw9387sKZU11R516oWVUKqgo19kxW8eWqwIAtsPmAmuwp
 QVGKfDBQOOg0kh8JBumTZsseM13rqC9g0iBwWJ8cy4kVhmwslJCR8ZDIblMxlFOt
 bVwLdthr32Uh5hcl6LryqJE5/tzxdzhkCCtk9hmdullOyahQtjkAo7uNSxdW3oRV
 LgavI4hFd6cHorOMensVodT5pBFHTBPovAwQwcwX+kR1xRqahN6eLtsb2qjYPMwE
 5lNLgzoKZfIlWCH7XNxDjtu3LWFMYe96sFJl7MmqpOYzRVEcLle1xN4JD99VhUsZ
 dRE/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1DIfDLPT5v9jT1osqzeTiU4HnnUmc46Q0PQMNi5Df
 Rs=; b=fPqm7r2z+ZS98n44SaEhQyAVItFtG4a1Gy75waZiNkQhOQNL40+Hi+Net
 TNvC0BrRu0MxfvuKAvocadeYsA1CFRuXKAqmekewf+LqqRNPM2SsIZSlbFnoY5D4
 0m4hZjoTqm4/TtBh69l/vG+IKm3HP8NidtRbwWG/U/OiRmAnztWKj+Un9mvVOwAr
 d3FYwtKjYN4cNF8bcGlhFdiktbKlhWgYv/kTiuYR4dMYUd3Xqg7xAnvM6hXAfENt
 rfoLeWGS6hiJSf5QYm2KEyg2WQIchpin1rSe0JBF+Dp67yPiSkm4W428Xtj7GFNb
 NTMIuIBgFMmSjosnmotP4Xa1cvORw==
X-ME-Sender: <xms:37N8XqHF26_cOc7zMbtN7SzFEtvFSpjrjSefZclEVi3zmkz3_vbtWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddt
 tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedu
 ieeirddujedvrdduvdefrdduvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:37N8XqkDREdEmAnP4sOuZcoq0SWUQas1WFQa3ds2ZGTQrZfA-q3MDg>
 <xmx:37N8Xm9Zant4oW_K2kmiCD8h_uh6xpo42gf2DbSkgC3IsfQdksdLNw>
 <xmx:37N8Xrmlx0n5bLM_YVxNVHJqxs62gQPsY7YCSr534V5h2b08MpkaSQ>
 <xmx:4LN8Xrk801YXDlsm7wncoGtWbmB7GGimj1e_-ZtvMnlzP2vPeWeQUg>
Received: from localhost (mobile-166-172-123-121.mycingular.net
 [166.172.123.121])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3FD730699AA;
 Thu, 26 Mar 2020 09:53:34 -0400 (EDT)
Date: Thu, 26 Mar 2020 08:53:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: Some questions about the handler of Add SEL Entry Command
Message-ID: <20200326134831.GA10853@heinlein.lan.stwcx.xyz>
References: <HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0@HK2PR02MB3826.apcprd02.prod.outlook.com>
 <4C40A508-B1AE-497B-B181-D3E669B64A85@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4C40A508-B1AE-497B-B181-D3E669B64A85@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>,
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 02:40:14AM +0000, Vijay Khemka wrote:
> I don’t think this command is even supported completely by IPMID, I think it was started with only one type and never got to completion.
> 
> From: openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on behalf of Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
> Date: Wednesday, March 25, 2020 at 4:03 PM
> To: "tomjose@linux.vnet.ibm.com" <tomjose@linux.vnet.ibm.com>
> Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
> Subject: Some questions about the handler of Add SEL Entry Command
> 
> Hi Tom,
> 
> Our validation team met a problem in phosphor-host-ipmid (phosphor-ipmi-host) recently. We want to use the Add SEL Entry Command handled by ipmiStorageAddSEL. We look forward to getting correct sel log with parameter we offer. But We found that the handler only use sensortype to create log entry when recordType is equal to procedureType(0xDE). Why the other parameter is ignored to create log entry ? It seemed that it did’t follow the ipmi spec. There are more questions. What is the eSEL ? In function createProcedureLogEntry(), what information was stored in the eSELFile (/tmp/esel) ? And how to create the eSELFile ?

The IPMI code was originally written to support IBM's Power systems.
They had existing firmware that supported this "eSEL" format, which I
think stood for "extended SEL".  The eSEL contains everything in a SEL
plus more and is sent down as multiple IPMI transactions.  The handler
for the multiple IPMI transactions are what create the /tmp/esel file.

[1] https://github.com/openbmc/phosphor-host-ipmid/blob/e08fbffcd9bd1976f7d26d48bf7a4c3e5843d4a8/storageaddsel.cpp
[2] https://github.com/open-power/hostboot/search?q=esel&type=

-- 
Patrick Williams
