Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5572C5A5
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 15:17:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=gOzscRjL;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aM9OwiY3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfsgQ45Wrz30Mv
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 23:17:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=gOzscRjL;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aM9OwiY3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfsfr1SPcz2ym7
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 23:17:24 +1000 (AEST)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5D5721EC0136;
	Mon, 12 Jun 2023 15:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1686575837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=p1jMhdnMp62aySYIVTb8CY0oWf+ccrEVsVT8LxVTgvY=;
	b=gOzscRjLdmbNXOlFBIfa+SF5Zr/QE50QSFLzlP65JW8iLP7NpEM3qcxgQIV3Jqpf24Pxzi
	zU+e6n5mmtBvMe1UkpSSMUorv3/u+f69uItGtQFOdRD142/fvirqf/kohoY8dKLMkFwtCM
	cqJiSNI5LlfWPlGenWiCO2NNvcdFrEU=
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f6qNxyF1R1JZ; Mon, 12 Jun 2023 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1686575835; bh=p1jMhdnMp62aySYIVTb8CY0oWf+ccrEVsVT8LxVTgvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aM9OwiY3oDxFNNvqNPD/xGoAK7ODf7Yl0w1ziohg6Q9Cg4hdJb02hwePMknXOB4ec
	 h3O0+geL92fZCR65L54p8msSLGOPi15Tu/KbYBdk/TLpqGcDBeSjVg2wdaSZ7RepFu
	 7BGW3OQQ3tivF2a7meYRQZHFAjV5XaO4MuvoN3ILl5UmKJt00Cg4FzaYgN4DJ2Enza
	 vtVRdZA5PdfHkbPEXgG0k+LsV4M5fS3YJnxvaBZEBCbizw/0DtyBWcPzmwJJsHcy+x
	 yuEhyvFyNgDR3L/M98jjTtbh6vXJ9GcY93Q1Lm1NSqWo4U+OEyqrB/i/Nh7erzfuu0
	 HteNxH7KYUwXJKa0Udvfe0R6QLtzIWOVM8qVuSkEXF/EEIRsZC4ZinS2Hl8rvIVOSg
	 rbvlD6EwdPOg7chyFWkUc3DMZSwgi5MFbKNmjkal26jQgE/abZCJmdfe7f3Z43p2vW
	 MVNc9mxUi68baly5zdmQkONn/Pfh+oG7H5LncfUgLrdi9YvAW90/VDhmlACHLrgftX
	 ATPpjLxCXfx84KKWgdTJtqggnGGVzdGH3MnASmcHncxmm4MCcvoZJ8yPDxvGmPCcxl
	 YoVr6win5fxfIk1J7wOI/uTpOEjdK3Bx02rRx1nIqRJ8roNjTLhCNYQsZncXX+IQyg
	 cGsArU8aUSPRk1pK5B/E1zZ4=
Received: from zn.tnic (p200300eA971Dc5F0329c23ffFEa6A903.dip0.t-ipconnect.de [IPv6:2003:ea:971d:c5f0:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0714C40E00EA;
	Mon, 12 Jun 2023 13:16:53 +0000 (UTC)
Date: Mon, 12 Jun 2023 15:16:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory
 controller
Message-ID: <20230612131649.GHZIcawTKBMIQpFD6I@fat_crate.local>
References: <20230111093245.318745-1-milkfafa@gmail.com>
 <20230111093245.318745-2-milkfafa@gmail.com>
 <20230612110401.GPZIb7oZPdsPGFzSDc@fat_crate.local>
 <38c30778-9526-cba6-4ddb-00bcefeb5647@linaro.org>
 <20230612120107.GFZIcJA3zktkiyTS2+@fat_crate.local>
 <99795947-0584-df42-a28a-aa89d7e21c7e@linaro.org>
 <20230612123925.GGZIcR/dUrcu03z6V+@fat_crate.local>
 <e0171cb6-54e7-41bd-4b08-fa667fe58ff4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0171cb6-54e7-41bd-4b08-fa667fe58ff4@linaro.org>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 03:00:19PM +0200, Krzysztof Kozlowski wrote:
> No, the DTS is always independent because it describes the hardware.
> Linux should work fine regardless of hardware description. Tying Linux
> to specific DTS is usually sign of an ABI break.

Ok, I see.

Patches 2 and 3 queued for 6.5.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
