Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC5E103433
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 07:11:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hsls1XzrzDqnp
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:11:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i7XKy7y1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LJ4yst4A"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HslG3WwyzDqnc
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 17:11:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 33C6266D1;
 Wed, 20 Nov 2019 01:05:34 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Nov 2019 01:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=MqACBpEH9i8p185f/jCjhS3Buz1frYL
 b77NTyx979Vk=; b=i7XKy7y1PAPvEgYOMCazKDu7BXD8GlpoYO0b/DBDIBevIRN
 oSsmkXzqiXQhG2Jq+Qd5XDA42EyYTg48eht/Xln+pFFphAE4Wr5BupTMdKWlM3Fw
 jn2JmooRWq+DeV9QmpImEqvvRg/G9PATHSu8qX6Id4TeTDXir6MfOqFb5mm03mbX
 XnyTSMzM4Wwzcb1sKe7CAgaRzKPRWUCpYZTRQTTvIt4EYuTxBHfXgO0RA+JrOkZZ
 zO1+/ONdWl3BYsmF5yWiE3nJdQFQwlQKPBIxT2cz9AtL+FCRZZBKwCREIPzoP8V4
 myUat4Xt/IJGWXwFQ0iYbWY6hKjn4TuIMPP8ILw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MqACBp
 EH9i8p185f/jCjhS3Buz1frYLb77NTyx979Vk=; b=LJ4yst4Apz2MLuo0lKehfh
 zMqxHdvAShQNWZwqQaXHzMmELTPswvADN1bS/OhbNjs6PJv3KkqqVHb85IVuIOqI
 KerhvkyjTNmn688uJvc5szdzWrKmoG06NYfXFhTPE3yPvp/mJlA2aUCdro0fT1C8
 LFnFIIIo9rvQPLtwVUHRxgvKhq/411RQz5zEQzYDgrxnaBTlliA227Vf1O4Z64MX
 nunTveBc+fvoGSEbpprjVbKiMrLV6eAGKXJqT4Zh6iqYONYU+Byof6x0VjqjsSws
 YIg9bUJeUjmDz3lC281U3WRxW+PDAEMTrFScfZ+NHCJdXLmJtsK0OyAnsgZ9rpyw
 ==
X-ME-Sender: <xms:q9fUXalOHeplB8yX1vzlWHBcSscnF4HNXZBSR9sI3r-PvqyKms2BJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegledgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:q9fUXVQwd6XqjXTUXw50wQGrHC2F8Cs31GSA51fL3LNn58J3g-mz4w>
 <xmx:q9fUXVYlNjqiogexue1MOxuvWRhS75Wbdx0YSdrb4eH9sDbiYxYrMg>
 <xmx:q9fUXR8XH-IwBjQObAQ_n6vciRRjHt9VPTLSKP0mMGCrZkUTZRPGJg>
 <xmx:rtfUXf--SERIAc9OW-KEysE8HrVyG9VEO-RmAfdYmXiXxkt6cTDpbQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9A0D9E00AA; Wed, 20 Nov 2019 01:05:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <b525ea84-aaa0-45b3-95fd-a1b3518511b3@www.fastmail.com>
In-Reply-To: <20191118104646.3838-4-i.mikhaylov@yadro.com>
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-4-i.mikhaylov@yadro.com>
Date: Wed, 20 Nov 2019 16:36:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ivan Mikhaylov" <i.mikhaylov@yadro.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_3/3]_mmc:_sdhci-of-aspeed:_add_inversion_signal_?=
 =?UTF-8?Q?presence?=
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
> Add read_l callback in sdhci_ops with flipping of SDHCI_CARD_PRESENT
> bit in case of inverted card detection signal.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
