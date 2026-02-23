Return-Path: <openbmc+bounces-1404-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNLCBZFgnGntFQQAu9opvQ
	(envelope-from <openbmc+bounces-1404-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 23 Feb 2026 15:13:37 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA7177D96
	for <lists+openbmc@lfdr.de>; Mon, 23 Feb 2026 15:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKNB5623Mz2yDk;
	Tue, 24 Feb 2026 01:13:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::130" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771856013;
	cv=pass; b=Dz2gYjFjMyhaZeAeC087upzTrK0ulfU+eNRxvb7bSsig3XbSy7rpddNd5WtRfkLuf2Zs0o5qA2hw8VAzvrFMQCTnoLBv9NFOu39kMArQ5t+1V2ujDO2HGgQd7fSxPnHC4M7iqbV8daAF5jL+TMQ5j+89sVRecUX1EC/nsqbWHnjtUCEO6QBWQSKgrCDTrHIJer6iwG55hU7RimCXEDPV3b48LpL8D7eUPmK1mlD77mPbzYfWgt/C+ITTbRA9s2SwgyPGZ3gcwA7YTY2lMkqU0mLyCU6EKFJdWRPhmbbYD7RX/4pOjQPk/YrlmkgzcZSPFTFyIknBYuz4FMdCOeG+ow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771856013; c=relaxed/relaxed;
	bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVGPhHLEHu7mdlfI6G6+F7vKN3mxV+/NlDMyPZLlkSXGr+FgsQIys9Jf5kayz3nb8VuZ3YRcPLSCSAoXKN0IPh8ypzigQGfjd3W6WiamIMbyIeDG7gbSzfq0Ob4qVKUaG1Q+dWjtMjl0oR6f+1NDj64p7pPhojyPoksDtH0mv82wxCHw1pJ+raoQaSKFw5xr6/9pf0UT9Pzh5Otxlihi0Fc8MTom35MFUH1dU3BTYKpw20rkrAML9PsBwSlj6fJ/5Ff9AOKbsGYqWn1Vnxe7+bPepN1se2uizsnHcQycQMDWCOHYlG1owRntegaL5jqotKVuq7maWtnAHW1vhecowQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R3KhHNri; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R3KhHNri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKNB43jXJz2xN8
	for <openbmc@lists.ozlabs.org>; Tue, 24 Feb 2026 01:13:31 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59e57973dbfso4332722e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 06:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771856007; cv=none;
        d=google.com; s=arc-20240605;
        b=Qntq+dzDKuPP/RQL4LEzgHKnIBB8hr0t6u8RfR2KUvH2OjNpmHrjzJffdN4eg3SSBC
         x2NAvM1xZOlA5Vev2Lyre9/Slmok3sKJ61E0Gi21rlsHIFF1CIG3QQ6QaKgF1XZvSFJg
         1ZNLooMrrQQXzpglnRJB9aivBjWsKU82DEWgnVaWqz48aKEwkjnBBPX5DWSAnJhWu/5b
         2kLwLS+l39zcjMxK8h3a53NlvvJU6V5VQ1aOMk5bHy7Pk6m/th9+L8181fdfL62+KtoI
         ZUZ4SFitOvyTl2tWWmSFsbQrY9dmDZ+Cs9q28DfaFIlSobpO/ZyJwZr42lIOfvrBsrTy
         RwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        fh=AWC7fnzEYy2S+rHbdBjAvoWuAEMXCBx9/IVNAesPl/o=;
        b=GzfSzaRKiRLRmR0JVzaSnZewY59Wpjs6E1OB01qDXFssWPjXe37mhoWqWszSjURd4J
         AFT9usb6QCOBnBClXBSW0U7rGk5dFlTUpFFNNYtP06+iFwa0ttdOVowBw6a77YhlB+CW
         /JprEgG/Oh7rUUI88KZQf2u6n/s4JWWeiShQUFSKEJ7F71/JieYq8tQJ6q7sG+bsx0wV
         JQHRMvTT66uCwcjrX8Mjz9dbNjQjD/d2x462377zKEtxfzeWK48JGmFJKDBHhkHN6qXv
         Cf52ZIk02/4WJW5OcKurHPUsW90O9mAilb+VgpBXOzeS9bvbhbTITmSHNfRVCFSFF1WF
         9Isw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771856007; x=1772460807; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        b=R3KhHNriyr7iAfjmr7aVzkuZ/kzUt6x0xB7Z/R/L86UOCFwxYKcXtpR4DutgvTdH+G
         2fPt+YHOoNaE25rcXeS5JSfLesBf2SzKRiA52aq8ZkBauc0WQvSkmUXe7xtiOwtj1f53
         By7slsW6Ko4vvQn+c4oQs2IIIl9rFk7CXMqkihlQwVGsW16dUnXeKtDGTpdMc4rYurYR
         bLr2A6DMnj/3kTaV72JK/oZkI40TjtkvoEDtka4VjidOStoV7q1Vlcv+yN5jXOclODRi
         8orskL4ar9OyJFsiK5Sic4d7jc1kXg/qAF3uAtqDqSFpbRjQEkefk1FAyv2hxU8Qi84a
         2pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856007; x=1772460807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        b=AhdpUgEa+oYKEShkCJ7ZJ1fxceSIStTmvUMbsGGSf+sorXnDLlnA0WveUjhRAbZUo1
         8Lv8P18wWFGJAaO9s6S7SFg4Oj9FiQQT54Zyejr71WXixoVwtXWoTXrbA5TTuV2Tz1CP
         hlkFPN+FsGySsrIIuqn2PV1wHHDe88IBztqgE3lc2liLpqvyRKSCniXjbEFu18qZRYo2
         EmaFIbzOtv2Cn4LY3GLvznfEkvvIS7jSk3t+TAgfKoZNntOcsHahypRRUd4Y/9uwtCpA
         Vv23b6YcOt67+Fui/Vj3PtwhEehhwFVz+mUg+kY/NpvZ5XnDuT8rapSVNxUsIYZFw3dD
         BQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOgA+Mnd5nhd28Ca7yFrj7uPhTLG/dmTCnlGcVjRaKQ3PFLWD8IMoKhkH8n1WjD6FX3pmMR6Lw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzC4YYoQ/Un956K4OBmCAlKSJGuageqg2NGoxmaYdpXp2Fn6sGb
	uNlN5nCv3frWwAhhxsGL2tdHHtRKQXCjo1aHCxRCPMHNesCIgCIpMZvkUl6dMum4DHgqoeoqiW5
	NmhKzX/65MSgucecHb8dDdD48b0SPuV6WBaRn464VYg==
X-Gm-Gg: AZuq6aJd4UZ0qkNLIA9CzRjmWf9Vk5IfTGkV1tOmtR9Dcvtygq3uJgYcES01CdcL+Tq
	m4a7MQR+Ugab8SmklmdxQHybWJcyWH3qUMatjgyomhVXdVF2IpnEaFdPoUd1m2PQyaGvwY6xBpb
	JCcq65vKiCdo8ZpeK2GhpzsDiQDiEvdnB97UlmYNj6ER45MHquIDO1KdAGJbIph/Y/0AMmA0bMA
	/LyOyIdOeLK58X/Di6SDr93taH/win+ng3XqUBiwy2y0XzdpHfTjV/+Dv1QTrLucGwsl0ivk+m2
	3trKeBu0
X-Received: by 2002:a05:6512:108c:b0:59f:822b:b739 with SMTP id
 2adb3069b0e04-59f8abde44cmr5314261e87.4.1771856006894; Mon, 23 Feb 2026
 06:13:26 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Feb 2026 15:12:50 +0100
X-Gm-Features: AaiRm52Jn7GtelEGkOZ9XPfUniIrpYcIWOFdBS3zcfWiZwJDEnJ15M24z8fGJdw
Message-ID: <CAPDyKFr-N=P1vKSHGtOr1surWApBUz630v2xsBD+5KkPWaPZbg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Axiado AX3000 eMMC Host Controller Support
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1404-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ulf.hansson@linaro.org,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:twei@axiado.com,m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:adrian.hunter@intel.com,m:michal.simek@amd.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 31CA7177D96
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 at 09:23, Tzu-Hao Wei <twei@axiado.com> wrote:
>
> Axiado AX3000 SoC eMMC controller is based on Arasan eMMC controller.
>
> This series includes:
> 1. Add bindings for AX3000 SoC eMMC controller
> 2. Add arasan sdhci support for eMMC in Axiado AX3000
>
> For platform device tree change, we will send a different series of
> patches.
>
> It has been verified on AX3000 platform.
>
> ---
> Changes in v3:
> - Enable SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN quirk
> - Remove dependencies in b4
> - Link to v2: https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com
>
> Changes in v2:
> - Keep host controller changes in this patchset
> - Use pdata instead of mix compatible string
> - Fix coding style
> - Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com
>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>
> ---
> SriNavmani A (2):
>       dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000 SoC
>       mmc: sdhci-of-arasan: add support on Axiado AX3000 SoC
>
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml |  3 +++
>  drivers/mmc/host/sdhci-of-arasan.c                      | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a
>
> Best regards,
> --
> Tzu-Hao Wei <twei@axiado.com>
>

Applied for next, thanks!

Kind regards
Uffe

