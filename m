Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFB83107F
	for <lists+openbmc@lfdr.de>; Thu, 18 Jan 2024 01:28:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=COkt9DOm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFkB00VZtz3bsj
	for <lists+openbmc@lfdr.de>; Thu, 18 Jan 2024 11:28:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=COkt9DOm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFk9L59tVz307V
	for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2024 11:27:50 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C7804C1A7E
	for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2024 00:27:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C3ED1C0003;
	Thu, 18 Jan 2024 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705537615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FKYFGoUuIzNOJs0li/eVN3iRdyzoeA5zFjlLReuI070=;
	b=COkt9DOm7yPAOILdqq4JT4XuNiK1UeLzrSc3Ss/hUtOThdk6Yz5eO8SUOlbBgVjvE05ne5
	zRURc3ykJX7UAa4bIt8/0o5oC6uNaBhfwrEIdrsbkTpOApgHkADg0LslLe72c1PVDCNXQM
	PVskoI3FBimfFzutxrKaRKmlEk647/YNYbeLGqV8gl8bjO9rpibZYlC3PC6p0J0PA0vGIV
	uAroepxkwN6m61e26Usgv985Yy3lBtpcRIuPMRPfEH5PIN71O9lNEoXLmJ6c5KabnkV/o5
	sYq1Y02xl1CrBI0YA9YF/8WrhCHfq9Uskqu/K4Hi+9oN77al+C5Xvqr/3JcCuQ==
Date: Thu, 18 Jan 2024 01:26:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	a.zummo@towertech.it, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com, mylin1@nuvoton.com,
	Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v7 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Message-ID: <170553758518.493564.2240744858359002334.b4-ty@bootlin.com>
References: <20231113103807.1036978-1-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113103807.1036978-1-mimi05633@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 13 Nov 2023 18:38:06 +0800, Mia Lin wrote:
> Changes since version 7:
>   Fix the part number parameter checking issue.
> 
> Changes since version 6:
>   Move the part number parameter to struct nct3018y.
> 
> Changes since version 5:
>   Add global parameter to store part number.
>   Remove unnecessary changes for easier reading.
> 
> [...]

Applied, thanks!

[1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
      https://git.kernel.org/abelloni/c/14688f1a91e1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
