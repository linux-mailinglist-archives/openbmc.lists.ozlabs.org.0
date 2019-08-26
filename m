Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E13F9DA39
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 01:58:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HTVC6VZMzDqlp
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 09:58:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Y6cQ437A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MAW8POA4"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HTTT74mSzDqjV;
 Tue, 27 Aug 2019 09:57:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 01DEA3CB0;
 Mon, 26 Aug 2019 19:57:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 26 Aug 2019 19:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=XME7TZm7cj23/QLbq4OVXeIVehmG6Kj
 rwVjJRtju3yU=; b=Y6cQ437A8Ha+5sMISr5HPLDDUBGIXZGsj1+W8orSgA+stbB
 N6MVEEoXQl6B6fp4atWu3Oq6lpm06RBHKxVHgCuB+rQu2M0ZG1ZZNohGEtD/Vxwq
 lGht1LDPtUHknaJXvkN2VNYPU7ua2NC1LFBWNjuJwkqJGARJjQrL46KjHAad8RPM
 fdMpUJmNm36qFMPjZ9KKWb+MZeOf5ycRkWAxrgJa2WQvt0I2rHG+PuigTJLaSRK6
 lmPlL7l5kB2QjYcyoRHTis0cyo5OsJCdWo+Rkq9hfsk5gXx90ONp60x49vkCuA8Y
 /4znYi7TWepBXZtezyzLhYRlkn/hsgGRSJzODLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XME7TZ
 m7cj23/QLbq4OVXeIVehmG6KjrwVjJRtju3yU=; b=MAW8POA4VYmSqQDxi9ne09
 FvO8QIzWrk0VH53/UO7gGZvikmkY2ot2SOodhhNQjluNNZ9Y3sP92CvgLWsQbPiO
 LcU+2no4uTMqJGx+5AkuxEKAQy5PBVIe1/NFUjdHrso1f9zGpD42QlMAaqYfEDwJ
 HseiIxMzENi3CMwL2LIRL7+J8i7nMVC+MIgeMH80KFcDX9TBBXdM9No1SYH6xlSC
 4WTVBbsbngHlh3niChfWJzeZkX2X0FDKKte2tbvPhPae/oPm418DJibQb/0hNfPd
 u+JgFsM3NdrVwmpPfGbZ49by0JWB7KPJBTJYp6SkvDg8qhq/vgQAM/0LWE/d4asw
 ==
X-ME-Sender: <xms:93FkXZyTfM9gce3i09PhNxeK-Vitwb5shQUh0jQkqC8ikS8QV72Ydw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehhedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:93FkXZaSNOM0ClCzMJM1cIjEANP8sMQ3vGeSgUato47e1v6mlPzLFg>
 <xmx:93FkXaxCkrZHNh3HyyMgrYSzokyfvUw-MZvVlWlst8Ri9_ROzb2ZUA>
 <xmx:93FkXSGLg2_V89JgCAYaDmhJYlylJ8v8rYEZH5ee-pmGLAj1TbLmRw>
 <xmx:-XFkXSXqk18oyb9Hz3459qfh9zxfAOV5T12ZjJBLlEmSOsHQgRQdWw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A3882E00AD; Mon, 26 Aug 2019 19:57:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
In-Reply-To: <20190826104636.19324-5-i.mikhaylov@yadro.com>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
Date: Tue, 27 Aug 2019 09:27:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ivan Mikhaylov" <i.mikhaylov@yadro.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_4/4]_dt-bindings/watchdog:_Add_access=5Fcs0_opti?=
 =?UTF-8?Q?on_for_alt-boot?=
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
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Alexander Amelkin <a.amelkin@yadro.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 26 Aug 2019, at 20:17, Ivan Mikhaylov wrote:
> The option for the ast2400/2500 to get access to CS0 at runtime.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt 
> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..023a9b578df6 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -34,6 +34,13 @@ Optional properties:
>                  engine is responsible for this.
>  
>   - aspeed,alt-boot:    If property is present then boot from alternate 
> block.
> +                       At alternate side 'access_cs0' sysfs file 
> provides:

Why are we talking about sysfs in the devicetree binding? This patch
doesn't seem right to me.

Also if we're not supporting the aspeed,alt-boot property we should
probably document it as deprecated rather than making it disappear,
unless you're going to fix the systems that are using it.

Andrew
