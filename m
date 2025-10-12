Return-Path: <openbmc+bounces-730-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F5BD0987
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 20:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cl7q60BTGz2xQ2;
	Mon, 13 Oct 2025 05:12:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760292721;
	cv=none; b=lvGl6vR1eEW+H2uODZIigniZCO6PXPjRuDCl0AcDWF88U9ryXDnkkdOBvUAK6i7wpm1cjV5l1lHuQaRyEPWkIvM5TZaG2LZ0pjY48lwnj8H0Ry9rwKQIwSOtn6zOX6f4kKDsL2USzAN0lKrACWz+cnbH4w49tx4a87Z9IgVD4kgvJ+vWq2hfnWCzKWxiYOHjJUNCzi6zIAaqCxPhPXMUGG1stZE3ReQ7TDaLEbQOfv8pGQThr1E578rVzJfioXrXQo9LLFkjYo3O3bhLIrBbfDw579GmGIltitdq24gL/ugDEBmkGViwLMO+fMq6LGsnC6T57FoprI3u1rt1N5OviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760292721; c=relaxed/relaxed;
	bh=7Buj0t0IDW+PBuk8/VhMvFLB30ectWj4e/2J77rw3gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9/gssp6JKHFb7CmOno1rtufYmEnB29aZEVoE6A4ZcCxz4JqbrHW5DCTEi/UmJ+LHKvWYdNMMyIz6YRKB9UsaxSzsumDmATWG5bKYZl22SJdVIwRfMO2BT8p7nXvjclSPbkTVZ7nrFaUnCj6YTlPDVOV3rPQpQXv6s4dGrsYE3++1AbUiwVEwmhb1TjNrbFKzREdckfNNBUBJHBHXmnEyXKM1vl9nrGdh34h557+v+MUapA8+f1jLbJ9+ZMbvoKxa5jkfgvJAyLh7qAnsYgQH9J9r9XbTVqrvMgGsHJL3I2wfRhZxIT5HKp3VnbEccCQ0U48FkJiwg1JbjqsLUXmQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e/04gNS6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e/04gNS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cl7q41Xqgz2xPx
	for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 05:11:59 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-271d1305ad7so58788585ad.2
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292716; x=1760897516; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Buj0t0IDW+PBuk8/VhMvFLB30ectWj4e/2J77rw3gI=;
        b=e/04gNS6UiCfHLo0rRridJ4DhxQb7p1nXM/8JU+ZN7Hl5+JUGoJsjDb2JOyhASlBiM
         sxl6EkO79Kl0B9L/gIZbZhainNr8S93n/pVG4St/rR3bULTi7Hl16fIfd3EauBH/E7FW
         Joo/ClA8bmawWKrCb2LnJDr9F1+n4Kd3wOFleyyetFi9XTS+I0QydQwlbBswj/b1HLj3
         tSxojW6go9NMYnqOb6Dj2vMtZmU8nVpq5hhf7YlHH9Cb1Wk/db3IJg2IrrwxXWkKuzyV
         V+uEkdnh+srcauy6qwrw/moRpIpH3HLbWkPUuHTpkCOYDpN84U+5Pss8a4cyV8l7NvBB
         AkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292716; x=1760897516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Buj0t0IDW+PBuk8/VhMvFLB30ectWj4e/2J77rw3gI=;
        b=A3shwXYBAq/T20qUOaiyf9XuApm22rRxEckrqK3x0EBaawaHjNBMjWqF0csrx8Kfa7
         okHhyztPvriORSx0T/Dh53wo9FkB+cpIZ33MftrCoO51GpQgXwAkz1znRsZ/WBEp3a7C
         YKQZlmrjnzyKz8NQ1/tS5nYg6KaRFnwVo3JlGhbxYSC5dd4pibkpF+YFbbCGjalzP312
         Y1M9wLoQ6Qb2snW3rwkAmfEX1TXmEJphpJeKlRO4tBeScR46wU6nwjbuoiP4JmCRGlxi
         o3GYckexJifVNN2nWBq0XjSwGlL11LQmYFeM/W7qOu7db9fK3E8xRoC0dg7/4XlePzHA
         vjFg==
X-Forwarded-Encrypted: i=1; AJvYcCV90RrNcsTQayILkvSKW6be6+pqLzNsSSRrRYseDGgg5jjxhkODANNCTACLAnfLev7Aq/sQKG+J@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdmX7f18Es665+EbGGqbzCskm09hRmxINVIWuCcHa22q3+1XS6
	NKRT6XrxpMLYSWk2Zr9sR0w9ZXNLPK1YNVWCmmWy7jsnq/ziK8cioxwy
X-Gm-Gg: ASbGncvud3qEqfyU3mTHBtL/vytBBu94EQjgwUv6vCqP4V9tv22tUfgKByXY0skJPHN
	8oTQpZnPqECdCKPt6PqdVhtYIzBWlaFX42fExH6ZGpzcbUX0Eqcat4189b+RIL+wOXbMylxFUDe
	kMelcQW/wwhRMdb4WxGO5grD5K3xjXZwEklQZfUTHnS5e1g8glE3yrA/Xg4CwJ994+Dc4wQcLvn
	sYw+AcuhmVS1uVUzqfKpaHrQMshIZoiZPEa+KhxHylp+3GeheeShoy5OwxN8wI5FSrGkfDfljXP
	Mctkd87FfJPLb4s9ewGjziv6fbpHPjb8xKYe3NcfqjqbzTERygQovgZqmKf0UbEWS+5g8IDPt7p
	22BDpZflbznuryhi8u5hfe+/qR5DI47PKTZSK7aEeQv54QjZvY6bWIriCLmZWUTanirCi3kDZGm
	A=
X-Google-Smtp-Source: AGHT+IEcqDTieHsg1AER/qsu+ki9Hdvx/uwZq8AQiPyaTgu9kB1bK40A8LEDTjO5eRccXUF2P/E63w==
X-Received: by 2002:a17:903:247:b0:26a:23c7:68da with SMTP id d9443c01a7336-2902739a818mr222464765ad.25.1760292716317;
        Sun, 12 Oct 2025 11:11:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2905571d68asm45307815ad.2.2025.10.12.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:11:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:11:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/3] peci: cpu: add Intel Emerald Rapids support
Message-ID: <aea56786-8cf2-401b-bdd3-0f9733853c7b@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-2-fr0st61te@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-2-fr0st61te@gmail.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 07, 2025 at 12:53:19AM +0300, Ivan Mikhaylov wrote:
> Add support for detection of Intel Emerald Rapids processor based on
> CPU model.
> 
> Emerald Rapids Xeon processors with the model set to
> INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".
> 
> Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
> processors & verified by reading cpu & dimm temperature which matches
> host sensor values from lmsensors.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter

