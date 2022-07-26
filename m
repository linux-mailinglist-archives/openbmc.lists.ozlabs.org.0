Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21E581618
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 17:08:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsgKF1TfKz3c7S
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 01:08:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=G+XIJeXS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=G+XIJeXS;
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsgJt0sPVz3bmW
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 01:08:10 +1000 (AEST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 376044000A;
	Tue, 26 Jul 2022 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658848083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NTWt49n7i7rtCFJqnmX9cU+SAQ2/o+Kao1bPB1QoXg=;
	b=G+XIJeXSRqvzKNIKIuAkT8MRlP34AW91vnLLARpAupH/85k3q+dk6z0XsUIIgjucs/RPU6
	keGsMb/D4sXEl3k2biUg04A3cVFzYtsEsBfEtBnOOClctUV3SzkD3sJqGXLBcL8q4d+Ykd
	qBNf8zinyLzyGU2oUKP9Yt2Ucfu8th5/acqerILoRO//IahQJT+CTvIkgBVA5mg7eiZ6f+
	ILdsCox1U/BAhxVfxQfR5LhCsKoIJFXk0kQRIz/jPUUJzcg6eyLvZjeUQ1vuQ4QSXrxAEm
	OR24Pa99GRcjf5ahg0SCZchfIn3ephhQ7/ZYFLngMUb8LBly8vrCUDDiWU16fw==
Date: Tue, 26 Jul 2022 17:07:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: KWLIU@nuvoton.com, tali.perry1@gmail.com, avifishman70@gmail.com,
	medadyoung@gmail.com, mimi05633@gmail.com, ctcchien@nuvoton.com,
	benjaminfair@google.com, JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org, yuenn@google.com,
	KFTING@nuvoton.com, YSCHU@nuvoton.com, venture@google.com,
	mylin1@nuvoton.com, robh+dt@kernel.org, tmaimon77@gmail.com,
	a.zummo@towertech.it
Subject: Re: (subset) [PATCH v6 0/3] RTC: nuvoton: Add nuvoton real time
 clock driver
Message-ID: <165884805334.3164065.49376707444358080.b4-ty@bootlin.com>
References: <20220713090647.8028-1-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713090647.8028-1-mimi05633@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 17:06:44 +0800, Mia Lin wrote:
> Support Nuvoton NCT3018Y real time clock.
> 
> Changes since version 6:
>  - Add review tag.
>  - Add blank line in dts.
> 
> Changes since version 5:
>  - Add battery voltage level check by NCT3018Y_REG_ST.
>  - Remove disable clock output.
>  - Fix errors in rtc-nct3018y.c.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
      commit: 8b30b09317ec6fda5f36a428e9e331253b5c4739
[3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
      commit: 5adbaed16cc63542057627642d2414f603f2db69

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
