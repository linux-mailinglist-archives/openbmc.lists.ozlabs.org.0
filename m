Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA292103427
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 07:09:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HshW6wb1zDqv8
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:08:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Fd0L4n9g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wSfHHMIq"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HsgR0Fh7zDqwT;
 Wed, 20 Nov 2019 17:08:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8120168AD;
 Wed, 20 Nov 2019 01:08:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Nov 2019 01:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=DsuQsdMCwuKKG1c6E9zMMunZDORO9yG
 MRO643pGAkco=; b=Fd0L4n9gK6ybYYBcSg1jQ+1Anq3REZ7jgGzCovtPqAE/Qf7
 nibUPdKv3eDWgqvMYN2XxG0LYtAm7iqdLElZ2SU2EcuQDU97upof3y5/rKu7J0qj
 4wd+UsSZoz5ns+jTk6oFghvBCuGKVESjgCqmLYDqvvMIi8+7PGqQ97iXDXslWWB/
 hNys4hZmVfu9EB1q9yAK+U3HRuFeXrqidnlTdgVLOoMhdzR+kWFII8B2uTCkRJ/i
 H3DuC4ThZzInqSom3lkAxl6YHjictrV9Ubn3izRoEoA3rng2VGb8fEoG5XienYtR
 FIIk6KuzAAevM6ygdCWFFcjQDifODP/tQjoe5Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DsuQsd
 MCwuKKG1c6E9zMMunZDORO9yGMRO643pGAkco=; b=wSfHHMIqeIxz7uUn2d14w+
 RVJjFGK++vJnIvk+WVWo+2LhVPANmImCx1DFfogwrz0w4+XWbNfJ5f6BIeoQeW+q
 yV+f3UxVN3dKbrGFNSp5QtlhwEgHbMsXh5PgNmZ1pfC7bxvF9YAWORWMzKNGpCtK
 uYBODeLR5kopolY3BPcOKPzqLljOVF5GUaZ0PAW/nvvKFjlYXqihy0iUl14pKLlS
 99bgQBQ82BSvwtROesF3tUuZu085Htvrm59DQiGUOyMOGmIDZWK5MpS4x3GHFP3g
 IfM6Frwfacx1N8JxtCfmqswSgX0v2QgQUqvzplK5741QIJTyzljQcbEJKTc3SXvQ
 ==
X-ME-Sender: <xms:QNjUXWJ2ujlBAKIfuc9xx6W73U9KNM57P4vef5G9WMlmfLGd-1iX0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegledgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:QNjUXV626hPjxjiHuOLWBVDS-F3NZe_zGbxRynf3AD9D_lPoK1etCw>
 <xmx:QNjUXbuJg1QQvHvrn9xtjvmCsDQSdZkBc2ntB7i2C9AJEZqIqAGP8w>
 <xmx:QNjUXTZh-E3-mu7lCLDC6Av9Czb4yjJMXjLnR-9fqX_lO6ChGEgxVw>
 <xmx:QNjUXTZvhspj1tktg1bwvQlCwqHwSasFZ_W2ijcrQRSSGu_GuGIyrQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 49FE6E00A3; Wed, 20 Nov 2019 01:08:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <ebe4c175-a1a0-47d3-9c01-1dfeeffc97e5@www.fastmail.com>
In-Reply-To: <20191118104646.3838-2-i.mikhaylov@yadro.com>
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-2-i.mikhaylov@yadro.com>
Date: Wed, 20 Nov 2019 16:39:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ivan Mikhaylov" <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v3 1/3] aspeed: dts: add sd card for vesnin
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 18 Nov 2019, at 21:16, Ivan Mikhaylov wrote:
> Presence signal is inverted for vesnin boards, 'cd-inverted' added
> for invertion signal enablement. Vesnin BMC uses microSD, there is
> no WP switch, 'disable-wp' is used for this purpose.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
